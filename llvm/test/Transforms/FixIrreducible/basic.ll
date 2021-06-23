; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -fix-irreducible -S | FileCheck %s -check-prefix=CHECK
; RUN: opt < %s -passes=fix-irreducible -S | FileCheck %s -check-prefix=CHECK

define i32 @basic(i1 %PredEntry, i1 %PredLeft, i1 %PredRight, i32 %X, i32 %Y) {
; CHECK-LABEL: @basic(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[IRR_GUARD:%.*]]
; CHECK:       left:
; CHECK-NEXT:    [[L:%.*]] = add i32 [[L_PHI_MOVED:%.*]], 1
; CHECK-NEXT:    br i1 [[PREDLEFT:%.*]], label [[IRR_GUARD]], label [[EXIT:%.*]]
; CHECK:       right:
; CHECK-NEXT:    br i1 [[PREDRIGHT:%.*]], label [[IRR_GUARD]], label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[Z:%.*]] = phi i32 [ [[L]], [[LEFT:%.*]] ], [ [[R_PHI_MOVED:%.*]], [[RIGHT:%.*]] ]
; CHECK-NEXT:    ret i32 [[Z]]
; CHECK:       irr.guard:
; CHECK-NEXT:    [[GUARD_LEFT:%.*]] = phi i1 [ true, [[RIGHT]] ], [ [[PREDENTRY:%.*]], [[ENTRY:%.*]] ], [ false, [[LEFT]] ]
; CHECK-NEXT:    [[L_PHI_MOVED]] = phi i32 [ [[R_PHI_MOVED]], [[RIGHT]] ], [ [[X:%.*]], [[ENTRY]] ], [ [[L_PHI_MOVED]], [[LEFT]] ]
; CHECK-NEXT:    [[R_PHI_MOVED]] = phi i32 [ [[R_PHI_MOVED]], [[RIGHT]] ], [ [[Y:%.*]], [[ENTRY]] ], [ [[L]], [[LEFT]] ]
; CHECK-NEXT:    br i1 [[GUARD_LEFT]], label [[LEFT]], label [[RIGHT]]
;
entry:
  br i1 %PredEntry, label %left, label %right

left:
  %L.phi = phi i32 [%X, %entry], [%R.phi, %right]
  %L = add i32 %L.phi, 1
  br i1 %PredLeft, label %right, label %exit

right:
  %R.phi = phi i32 [%Y, %entry], [%L, %left]
  br i1 %PredRight, label %left, label %exit

exit:
  %Z = phi i32 [%L, %left], [%R.phi, %right]
  ret i32 %Z
}

define i32 @feedback_loop(i1 %PredEntry, i1 %PredLeft, i1 %PredRight, i32 %X, i32 %Y) {
; CHECK-LABEL: @feedback_loop(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[IRR_GUARD:%.*]]
; CHECK:       left:
; CHECK-NEXT:    br i1 [[PREDLEFT:%.*]], label [[IRR_GUARD]], label [[EXIT:%.*]]
; CHECK:       right:
; CHECK-NEXT:    br i1 [[PREDRIGHT:%.*]], label [[IRR_GUARD]], label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[Z:%.*]] = phi i32 [ [[L_PHI_MOVED:%.*]], [[LEFT:%.*]] ], [ [[R_PHI_MOVED:%.*]], [[RIGHT:%.*]] ]
; CHECK-NEXT:    ret i32 [[Z]]
; CHECK:       irr.guard:
; CHECK-NEXT:    [[GUARD_LEFT:%.*]] = phi i1 [ true, [[RIGHT]] ], [ [[PREDENTRY:%.*]], [[ENTRY:%.*]] ], [ false, [[LEFT]] ]
; CHECK-NEXT:    [[L_PHI_MOVED]] = phi i32 [ [[R_PHI_MOVED]], [[RIGHT]] ], [ [[X:%.*]], [[ENTRY]] ], [ [[L_PHI_MOVED]], [[LEFT]] ]
; CHECK-NEXT:    [[R_PHI_MOVED]] = phi i32 [ [[R_PHI_MOVED]], [[RIGHT]] ], [ [[Y:%.*]], [[ENTRY]] ], [ [[L_PHI_MOVED]], [[LEFT]] ]
; CHECK-NEXT:    br i1 [[GUARD_LEFT]], label [[LEFT]], label [[RIGHT]]
;
entry:
  br i1 %PredEntry, label %left, label %right

left:
  %L.phi = phi i32 [%X, %entry], [%R.phi, %right]
  br i1 %PredLeft, label %right, label %exit

right:
  %R.phi = phi i32 [%Y, %entry], [%L.phi, %left]
  br i1 %PredRight, label %left, label %exit

exit:
  %Z = phi i32 [%L.phi, %left], [%R.phi, %right]
  ret i32 %Z
}

define i32 @multiple_predecessors(i1 %PredEntry, i1 %PredA, i1 %PredB, i1 %PredC, i1 %PredD, i32 %X, i32 %Y) {
; CHECK-LABEL: @multiple_predecessors(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[PREDB_INV:%.*]] = xor i1 [[PREDB:%.*]], true
; CHECK-NEXT:    br i1 [[PREDENTRY:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       A:
; CHECK-NEXT:    [[A_INC:%.*]] = add i32 [[X:%.*]], 1
; CHECK-NEXT:    br label [[IRR_GUARD:%.*]]
; CHECK:       B:
; CHECK-NEXT:    br label [[IRR_GUARD]]
; CHECK:       C:
; CHECK-NEXT:    br i1 [[PREDC:%.*]], label [[IRR_GUARD]], label [[EXIT:%.*]]
; CHECK:       D:
; CHECK-NEXT:    [[D_INC:%.*]] = add i32 [[D_PHI_MOVED:%.*]], 1
; CHECK-NEXT:    br i1 [[PREDD:%.*]], label [[EXIT]], label [[IRR_GUARD]]
; CHECK:       exit:
; CHECK-NEXT:    [[RET:%.*]] = phi i32 [ [[C_PHI_MOVED:%.*]], [[C:%.*]] ], [ [[D_INC]], [[D:%.*]] ]
; CHECK-NEXT:    ret i32 [[RET]]
; CHECK:       irr.guard:
; CHECK-NEXT:    [[GUARD_C:%.*]] = phi i1 [ true, [[D]] ], [ [[PREDB_INV]], [[B]] ], [ [[PREDA:%.*]], [[A]] ], [ false, [[C]] ]
; CHECK-NEXT:    [[C_PHI_MOVED]] = phi i32 [ [[D_INC]], [[D]] ], [ [[Y:%.*]], [[B]] ], [ [[X]], [[A]] ], [ [[C_PHI_MOVED]], [[C]] ]
; CHECK-NEXT:    [[D_PHI_MOVED]] = phi i32 [ [[D_PHI_MOVED]], [[D]] ], [ [[Y]], [[B]] ], [ [[A_INC]], [[A]] ], [ [[C_PHI_MOVED]], [[C]] ]
; CHECK-NEXT:    br i1 [[GUARD_C]], label [[C]], label [[D]]
;
entry:
  br i1 %PredEntry, label %A, label %B

A:
  %A.inc = add i32 %X, 1
  br i1 %PredA, label %C, label %D

B:
  br i1 %PredB, label %D, label %C

C:
  %C.phi = phi i32 [%X, %A], [%Y, %B], [%D.inc, %D]
  br i1 %PredC, label %D, label %exit

D:
  %D.phi = phi i32 [%A.inc, %A], [%Y, %B], [%C.phi, %C]
  %D.inc = add i32 %D.phi, 1
  br i1 %PredD, label %exit, label %C

exit:
  %ret = phi i32 [%C.phi, %C], [%D.inc, %D]
  ret i32 %ret
}

define i32 @separate_predecessors(i1 %PredEntry, i1 %PredA, i1 %PredB, i1 %PredC, i1 %PredD, i32 %X, i32 %Y) {
; CHECK-LABEL: @separate_predecessors(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[PREDENTRY:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       A:
; CHECK-NEXT:    [[A_INC:%.*]] = add i32 [[X:%.*]], 1
; CHECK-NEXT:    br label [[IRR_GUARD:%.*]]
; CHECK:       B:
; CHECK-NEXT:    br label [[IRR_GUARD]]
; CHECK:       C:
; CHECK-NEXT:    br i1 [[PREDC:%.*]], label [[EXIT:%.*]], label [[IRR_GUARD]]
; CHECK:       D:
; CHECK-NEXT:    [[D_INC:%.*]] = add i32 [[D_PHI_MOVED:%.*]], 1
; CHECK-NEXT:    br i1 [[PREDD:%.*]], label [[EXIT]], label [[IRR_GUARD]]
; CHECK:       exit:
; CHECK-NEXT:    [[RET:%.*]] = phi i32 [ [[C_PHI_MOVED:%.*]], [[C:%.*]] ], [ [[D_INC]], [[D:%.*]] ]
; CHECK-NEXT:    ret i32 [[RET]]
; CHECK:       irr.guard:
; CHECK-NEXT:    [[GUARD_C:%.*]] = phi i1 [ true, [[D]] ], [ true, [[A]] ], [ false, [[C]] ], [ false, [[B]] ]
; CHECK-NEXT:    [[C_PHI_MOVED]] = phi i32 [ [[D_INC]], [[D]] ], [ [[X]], [[A]] ], [ [[C_PHI_MOVED]], [[C]] ], [ undef, [[B]] ]
; CHECK-NEXT:    [[D_PHI_MOVED]] = phi i32 [ [[D_PHI_MOVED]], [[D]] ], [ undef, [[A]] ], [ [[C_PHI_MOVED]], [[C]] ], [ [[Y:%.*]], [[B]] ]
; CHECK-NEXT:    br i1 [[GUARD_C]], label [[C]], label [[D]]
;
entry:
  br i1 %PredEntry, label %A, label %B

A:
  %A.inc = add i32 %X, 1
  br label %C

B:
  br label %D

C:
  %C.phi = phi i32 [%X, %A], [%D.inc, %D]
  br i1 %PredC, label %exit, label %D

D:
  %D.phi = phi i32 [%Y, %B], [%C.phi, %C]
  %D.inc = add i32 %D.phi, 1
  br i1 %PredD, label %exit, label %C

exit:
  %ret = phi i32 [%C.phi, %C], [%D.inc, %D]
  ret i32 %ret
}

define void @four_headers(i1 %PredEntry, i1 %PredX, i1  %PredY, i1 %PredD) {
; CHECK-LABEL: @four_headers(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[PREDENTRY:%.*]], label [[X:%.*]], label [[Y:%.*]]
; CHECK:       X:
; CHECK-NEXT:    br label [[IRR_GUARD:%.*]]
; CHECK:       Y:
; CHECK-NEXT:    br label [[IRR_GUARD]]
; CHECK:       A:
; CHECK-NEXT:    br label [[IRR_GUARD]]
; CHECK:       B:
; CHECK-NEXT:    br label [[IRR_GUARD]]
; CHECK:       C:
; CHECK-NEXT:    br label [[IRR_GUARD]]
; CHECK:       D:
; CHECK-NEXT:    br i1 [[PREDD:%.*]], label [[EXIT:%.*]], label [[IRR_GUARD]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
; CHECK:       irr.guard:
; CHECK-NEXT:    [[GUARD_A:%.*]] = phi i1 [ true, [[D:%.*]] ], [ [[PREDX:%.*]], [[X]] ], [ false, [[A:%.*]] ], [ false, [[B:%.*]] ], [ false, [[Y]] ], [ false, [[C:%.*]] ]
; CHECK-NEXT:    [[GUARD_B:%.*]] = phi i1 [ false, [[D]] ], [ true, [[X]] ], [ true, [[A]] ], [ false, [[B]] ], [ false, [[Y]] ], [ false, [[C]] ]
; CHECK-NEXT:    [[GUARD_C:%.*]] = phi i1 [ false, [[D]] ], [ false, [[X]] ], [ false, [[A]] ], [ true, [[B]] ], [ [[PREDY:%.*]], [[Y]] ], [ false, [[C]] ]
; CHECK-NEXT:    br i1 [[GUARD_A]], label [[A]], label [[IRR_GUARD1:%.*]]
; CHECK:       irr.guard1:
; CHECK-NEXT:    br i1 [[GUARD_B]], label [[B]], label [[IRR_GUARD2:%.*]]
; CHECK:       irr.guard2:
; CHECK-NEXT:    br i1 [[GUARD_C]], label [[C]], label [[D]]
;
entry:
  br i1 %PredEntry, label %X, label %Y

X:
  br i1 %PredX, label %A, label %B

Y:
  br i1 %PredY, label %C, label %D

A:
  br label %B

B:
  br label %C

C:
  br label %D

D:
  br i1 %PredD, label %exit, label %A

exit:
  ret void
}

define i32 @hidden_nodes(i1 %PredEntry, i1 %PredA, i1 %PredB, i1 %PredC, i1 %PredD, i32 %X, i32 %Y) {
; CHECK-LABEL: @hidden_nodes(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[IRR_GUARD:%.*]]
; CHECK:       A:
; CHECK-NEXT:    [[A_INC:%.*]] = add i32 [[A_PHI_MOVED:%.*]], 1
; CHECK-NEXT:    br label [[IRR_GUARD]]
; CHECK:       B:
; CHECK-NEXT:    br label [[C:%.*]]
; CHECK:       C:
; CHECK-NEXT:    [[C_INC:%.*]] = add i32 [[B_PHI_MOVED:%.*]], 1
; CHECK-NEXT:    br label [[D:%.*]]
; CHECK:       D:
; CHECK-NEXT:    br i1 [[PREDD:%.*]], label [[EXIT:%.*]], label [[E:%.*]]
; CHECK:       E:
; CHECK-NEXT:    br label [[IRR_GUARD]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 [[B_PHI_MOVED]]
; CHECK:       irr.guard:
; CHECK-NEXT:    [[GUARD_A:%.*]] = phi i1 [ true, [[E]] ], [ [[PREDENTRY:%.*]], [[ENTRY:%.*]] ], [ false, [[A:%.*]] ]
; CHECK-NEXT:    [[A_PHI_MOVED]] = phi i32 [ [[C_INC]], [[E]] ], [ [[X:%.*]], [[ENTRY]] ], [ [[A_PHI_MOVED]], [[A]] ]
; CHECK-NEXT:    [[B_PHI_MOVED]] = phi i32 [ undef, [[E]] ], [ [[Y:%.*]], [[ENTRY]] ], [ [[A_INC]], [[A]] ]
; CHECK-NEXT:    br i1 [[GUARD_A]], label [[A]], label [[B:%.*]]
;
entry:
  br i1 %PredEntry, label %A, label %B

A:
  %A.phi = phi i32 [%X, %entry], [%C.inc, %E]
  %A.inc = add i32 %A.phi, 1
  br label %B

B:
  %B.phi = phi i32 [%A.inc, %A], [%Y, %entry]
  br label %C

C:
  %C.inc = add i32 %B.phi, 1
  br label %D

D:
  br i1 %PredD, label %exit, label %E

E:
  br label %A

exit:
  ret i32 %B.phi
}
