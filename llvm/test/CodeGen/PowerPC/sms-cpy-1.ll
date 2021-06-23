; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=powerpc64le-unknown-linux-gnu -verify-machineinstrs\
; RUN:       -mcpu=pwr9 --ppc-enable-pipeliner 2>&1 | FileCheck %s

@.str.28 = external unnamed_addr constant [69 x i8], align 1

define void @print_res() nounwind {
; CHECK-LABEL: print_res:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mflr 0
; CHECK-NEXT:    std 0, 16(1)
; CHECK-NEXT:    stdu 1, -128(1)
; CHECK-NEXT:    lwz 3, 0(3)
; CHECK-NEXT:    addi 3, 3, -1
; CHECK-NEXT:    clrldi 4, 3, 32
; CHECK-NEXT:    cmplwi 3, 1
; CHECK-NEXT:    li 3, 1
; CHECK-NEXT:    iselgt 3, 4, 3
; CHECK-NEXT:    li 4, 2
; CHECK-NEXT:    addi 3, 3, -1
; CHECK-NEXT:    cmpldi 3, 2
; CHECK-NEXT:    isellt 3, 3, 4
; CHECK-NEXT:    li 4, 0
; CHECK-NEXT:    addi 3, 3, 1
; CHECK-NEXT:    li 7, -1
; CHECK-NEXT:    li 5, 0
; CHECK-NEXT:    mtctr 3
; CHECK-NEXT:    li 3, 1
; CHECK-NEXT:    lbz 5, 0(5)
; CHECK-NEXT:    bdz .LBB0_6
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    addi 3, 3, 1
; CHECK-NEXT:    addi 8, 7, -1
; CHECK-NEXT:    xori 6, 5, 84
; CHECK-NEXT:    clrldi 5, 7, 32
; CHECK-NEXT:    lbz 5, 0(5)
; CHECK-NEXT:    bdz .LBB0_5
; CHECK-NEXT:  # %bb.2:
; CHECK-NEXT:    addi 3, 3, 1
; CHECK-NEXT:    cntlzw 6, 6
; CHECK-NEXT:    srwi 7, 6, 5
; CHECK-NEXT:    xori 6, 5, 84
; CHECK-NEXT:    clrldi 5, 8, 32
; CHECK-NEXT:    addi 8, 8, -1
; CHECK-NEXT:    lbz 5, 0(5)
; CHECK-NEXT:    bdz .LBB0_4
; CHECK-NEXT:    .p2align 4
; CHECK-NEXT:  .LBB0_3:
; CHECK-NEXT:    addi 3, 3, 1
; CHECK-NEXT:    clrldi 10, 8, 32
; CHECK-NEXT:    addi 8, 8, -1
; CHECK-NEXT:    cntlzw 9, 6
; CHECK-NEXT:    xori 6, 5, 84
; CHECK-NEXT:    lbz 5, 0(10)
; CHECK-NEXT:    add 4, 4, 7
; CHECK-NEXT:    srwi 7, 9, 5
; CHECK-NEXT:    bdnz .LBB0_3
; CHECK-NEXT:  .LBB0_4:
; CHECK-NEXT:    add 4, 4, 7
; CHECK-NEXT:  .LBB0_5:
; CHECK-NEXT:    cntlzw 6, 6
; CHECK-NEXT:    srwi 6, 6, 5
; CHECK-NEXT:    add 4, 4, 6
; CHECK-NEXT:  .LBB0_6:
; CHECK-NEXT:    xori 5, 5, 84
; CHECK-NEXT:    clrldi 3, 3, 32
; CHECK-NEXT:    li 7, 0
; CHECK-NEXT:    li 8, 3
; CHECK-NEXT:    std 3, 104(1)
; CHECK-NEXT:    cntlzw 5, 5
; CHECK-NEXT:    addis 3, 2, .LC0@toc@ha
; CHECK-NEXT:    li 10, 0
; CHECK-NEXT:    ld 3, .LC0@toc@l(3)
; CHECK-NEXT:    srwi 5, 5, 5
; CHECK-NEXT:    add 4, 4, 5
; CHECK-NEXT:    li 5, 0
; CHECK-NEXT:    std 5, 120(1)
; CHECK-NEXT:    li 5, 3
; CHECK-NEXT:    clrldi 6, 4, 32
; CHECK-NEXT:    li 4, 3
; CHECK-NEXT:    std 5, 96(1)
; CHECK-NEXT:    li 5, 0
; CHECK-NEXT:    bl printf
; CHECK-NEXT:    nop
  %1 = load i32, i32* undef, align 4
  %2 = add i32 %1, -1
  %3 = zext i32 %2 to i64
  %4 = zext i32 3 to i64
  br label %5

5:                                                ; preds = %5, %0
  %6 = phi i64 [ %16, %5 ], [ 0, %0 ]
  %7 = phi i32 [ %15, %5 ], [ 0, %0 ]
  %8 = trunc i64 %6 to i32
  %9 = sub i32 0, %8
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds i8, i8* null, i64 %10
  %12 = load i8, i8* %11, align 1
  %13 = icmp eq i8 %12, 84
  %14 = zext i1 %13 to i32
  %15 = add i32 %7, %14
  %16 = add nuw nsw i64 %6, 1
  %17 = icmp ult i64 %16, %3
  %18 = icmp ult i64 %16, %4
  %19 = and i1 %18, %17
  br i1 %19, label %5, label %20

20:                                               ; preds = %5
  %21 = trunc i64 %16 to i32
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.28, i64 0, i64 0), i32 zeroext 3, i32 zeroext undef, i32 zeroext %15, i32 zeroext undef, i32 zeroext 3, i8* undef, i32 zeroext undef, i32 zeroext 3, i32 zeroext %21, i8* undef, i32 zeroext undef) #1
  unreachable
}

declare void @printf(i8*, ...) local_unnamed_addr #0
