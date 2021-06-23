; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -canon-freeze -S | FileCheck %s
; A set of tests that have several phi nodes
declare void @call(i32)
declare i32 @call2()

define void @onephi_used(i32 %n, i32 %i.init, i32 %j.init) {
; CHECK-LABEL: @onephi_used(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[I_INIT_FROZEN:%.*]] = freeze i32 [[I_INIT:%.*]]
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[I:%.*]] = phi i32 [ [[I_INIT_FROZEN]], [[ENTRY:%.*]] ], [ [[I_NEXT:%.*]], [[LOOP]] ]
; CHECK-NEXT:    [[J:%.*]] = phi i32 [ [[J_INIT:%.*]], [[ENTRY]] ], [ [[J_NEXT:%.*]], [[LOOP]] ]
; CHECK-NEXT:    [[I_NEXT]] = add i32 [[I]], 1
; CHECK-NEXT:    [[J_NEXT]] = add nuw nsw i32 [[J]], -2
; CHECK-NEXT:    call void @call(i32 [[I]])
; CHECK-NEXT:    [[COND:%.*]] = icmp eq i32 [[I_NEXT]], [[N:%.*]]
; CHECK-NEXT:    br i1 [[COND]], label [[LOOP]], label [[EXIT:%.*]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  br label %loop
loop:
  %i = phi i32 [ %i.init, %entry ], [ %i.next, %loop ]
  %j = phi i32 [ %j.init, %entry ], [ %j.next, %loop ]
  %i.next = add nuw nsw i32 %i, 1
  %j.next = add nuw nsw i32 %j, -2
  %i.fr = freeze i32 %i
  call void @call(i32 %i.fr)
  %cond = icmp eq i32 %i.next, %n
  br i1 %cond, label %loop, label %exit

exit:
  ret void
}

; Negative test
define void @twophis_used(i32 %n, i32 %i.init, i32 %j.init) {
; CHECK-LABEL: @twophis_used(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[I:%.*]] = phi i32 [ [[I_INIT:%.*]], [[ENTRY:%.*]] ], [ [[I_NEXT:%.*]], [[LOOP]] ]
; CHECK-NEXT:    [[J:%.*]] = phi i32 [ [[J_INIT:%.*]], [[ENTRY]] ], [ [[J_NEXT:%.*]], [[LOOP]] ]
; CHECK-NEXT:    [[I_NEXT]] = add nuw nsw i32 [[I]], 1
; CHECK-NEXT:    [[J_NEXT]] = add nuw nsw i32 [[J]], -2
; CHECK-NEXT:    [[IJ:%.*]] = add i32 [[I]], [[J]]
; CHECK-NEXT:    [[IJ_FR:%.*]] = freeze i32 [[IJ]]
; CHECK-NEXT:    call void @call(i32 [[IJ_FR]])
; CHECK-NEXT:    [[COND:%.*]] = icmp eq i32 [[I_NEXT]], [[N:%.*]]
; CHECK-NEXT:    br i1 [[COND]], label [[LOOP]], label [[EXIT:%.*]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  br label %loop
loop:
  %i = phi i32 [ %i.init, %entry ], [ %i.next, %loop ]
  %j = phi i32 [ %j.init, %entry ], [ %j.next, %loop ]
  %i.next = add nuw nsw i32 %i, 1
  %j.next = add nuw nsw i32 %j, -2
  %ij = add i32 %i, %j
  %ij.fr = freeze i32 %ij
  call void @call(i32 %ij.fr)
  %cond = icmp eq i32 %i.next, %n
  br i1 %cond, label %loop, label %exit

exit:
  ret void
}

; Negative test
define void @nonindphi_used(i32 %n, i32 %i.init, i32 %j.init, i32 %k.init) {
; CHECK-LABEL: @nonindphi_used(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[I:%.*]] = phi i32 [ [[I_INIT:%.*]], [[ENTRY:%.*]] ], [ [[I_NEXT:%.*]], [[LOOP]] ]
; CHECK-NEXT:    [[J:%.*]] = phi i32 [ [[J_INIT:%.*]], [[ENTRY]] ], [ [[J_NEXT:%.*]], [[LOOP]] ]
; CHECK-NEXT:    [[K:%.*]] = phi i32 [ [[K_INIT:%.*]], [[ENTRY]] ], [ [[ANY:%.*]], [[LOOP]] ]
; CHECK-NEXT:    [[I_NEXT]] = add nuw nsw i32 [[I]], 1
; CHECK-NEXT:    [[J_NEXT]] = add nuw nsw i32 [[J]], -2
; CHECK-NEXT:    [[IJ:%.*]] = add i32 [[I]], [[J]]
; CHECK-NEXT:    [[IJK:%.*]] = add i32 [[IJ]], [[K]]
; CHECK-NEXT:    [[IJK_FR:%.*]] = freeze i32 [[IJK]]
; CHECK-NEXT:    call void @call(i32 [[IJK_FR]])
; CHECK-NEXT:    [[ANY]] = call i32 @call2()
; CHECK-NEXT:    [[COND:%.*]] = icmp eq i32 [[I_NEXT]], [[N:%.*]]
; CHECK-NEXT:    br i1 [[COND]], label [[LOOP]], label [[EXIT:%.*]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  br label %loop

loop:
  %i = phi i32 [ %i.init, %entry ], [ %i.next, %loop ]
  %j = phi i32 [ %j.init, %entry ], [ %j.next, %loop ]
  %k = phi i32 [ %k.init, %entry ], [ %any, %loop ]
  %i.next = add nuw nsw i32 %i, 1
  %j.next = add nuw nsw i32 %j, -2
  %ij = add i32 %i, %j
  %ijk = add i32 %ij, %k
  %ijk.fr = freeze i32 %ijk
  call void @call(i32 %ijk.fr)
  %any = call i32 @call2()
  %cond = icmp eq i32 %i.next, %n
  br i1 %cond, label %loop, label %exit

exit:
  ret void
}
