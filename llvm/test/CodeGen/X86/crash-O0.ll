; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O0 -relocation-model=pic -frame-pointer=all < %s | FileCheck %s
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin10"

; This file contains functions that may crash llc -O0

; The DIV8 instruction produces results in AH and AL, but we don't want to use
; AH in 64-bit mode. The hack used must not generate copyFromReg nodes for
; aliased registers (AX and AL) - RegAllocFast does not like that.
; PR7312
define i32 @div8() nounwind {
; CHECK-LABEL: div8:
; CHECK:       ## %bb.0: ## %entry
; CHECK-NEXT:    pushq %rbp
; CHECK-NEXT:    movq %rsp, %rbp
; CHECK-NEXT:    ## implicit-def: $rax
; CHECK-NEXT:    movb %al, %cl
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    ## kill: def $al killed $al killed $eax
; CHECK-NEXT:    movzbw %al, %ax
; CHECK-NEXT:    divb %cl
; CHECK-NEXT:    movb %al, {{[-0-9]+}}(%r{{[sb]}}p) ## 1-byte Spill
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    ## kill: def $al killed $al killed $eax
; CHECK-NEXT:    movzbw %al, %ax
; CHECK-NEXT:    divb %cl
; CHECK-NEXT:    shrw $8, %ax
; CHECK-NEXT:    ## kill: def $al killed $al killed $ax
; CHECK-NEXT:    cmpb %cl, %al
; CHECK-NEXT:    jae LBB0_2
; CHECK-NEXT:  ## %bb.1: ## %"39"
; CHECK-NEXT:    movb {{[-0-9]+}}(%r{{[sb]}}p), %al ## 1-byte Reload
; CHECK-NEXT:    movzbl %al, %eax
; CHECK-NEXT:    ## implicit-def: $ecx
; CHECK-NEXT:    imull %ecx, %eax
; CHECK-NEXT:    ## implicit-def: $ecx
; CHECK-NEXT:    addl %ecx, %eax
; CHECK-NEXT:    ## implicit-def: $ecx
; CHECK-NEXT:    cmpl %ecx, %eax
; CHECK-NEXT:    je LBB0_3
; CHECK-NEXT:  LBB0_2: ## %"40"
; CHECK-NEXT:    ud2
; CHECK-NEXT:  LBB0_3: ## %"41"
; CHECK-NEXT:    ud2
entry:
  %0 = trunc i64 undef to i8                      ; <i8> [#uses=3]
  %1 = udiv i8 0, %0                              ; <i8> [#uses=1]
  %2 = urem i8 0, %0                              ; <i8> [#uses=1]
  %3 = icmp uge i8 %2, %0                         ; <i1> [#uses=1]
  br i1 %3, label %"40", label %"39"

"39":                                             ; preds = %"36"
  %4 = zext i8 %1 to i32                          ; <i32> [#uses=1]
  %5 = mul nsw i32 %4, undef                      ; <i32> [#uses=1]
  %6 = add nsw i32 %5, undef                      ; <i32> [#uses=1]
  %7 = icmp ne i32 %6, undef                      ; <i1> [#uses=1]
  br i1 %7, label %"40", label %"41"

"40":                                             ; preds = %"39", %"36"
  unreachable

"41":                                             ; preds = %"39"
  unreachable
}

; When using fast isel, sdiv is lowered into a sequence of CQO + DIV64.
; CQO defines implicitly AX and DIV64 uses it implicitly too.
; When an instruction gets between those two, RegAllocFast was reusing
; AX for the vreg defined in between and the compiler crashed.
;
; An instruction gets between CQO and DIV64 because the load is folded
; into the division but it requires a sign extension.
; PR21700
define i64 @addressModeWith32bitIndex(i32 %V) {
; CHECK-LABEL: addressModeWith32bitIndex:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    pushq %rbp
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    .cfi_offset %rbp, -16
; CHECK-NEXT:    movq %rsp, %rbp
; CHECK-NEXT:    .cfi_def_cfa_register %rbp
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    movl %eax, %ecx
; CHECK-NEXT:    movq %rcx, %rax
; CHECK-NEXT:    cqto
; CHECK-NEXT:    movslq %edi, %rsi
; CHECK-NEXT:    idivq (%rcx,%rsi,8)
; CHECK-NEXT:    popq %rbp
; CHECK-NEXT:    retq
  %gep = getelementptr i64, i64* null, i32 %V
  %load = load i64, i64* %gep
  %sdiv = sdiv i64 0, %load
  ret i64 %sdiv
}
