; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv64 -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV64I
; RUN: llc -mtriple=riscv64 -mattr=+experimental-b -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV64IB
; RUN: llc -mtriple=riscv64 -mattr=+experimental-zbb -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV64IBB
; RUN: llc -mtriple=riscv64 -mattr=+experimental-zbp -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV64IBP

define signext i32 @andn_i32(i32 signext %a, i32 signext %b) nounwind {
; RV64I-LABEL: andn_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    not a1, a1
; RV64I-NEXT:    and a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: andn_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    andn a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: andn_i32:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    andn a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: andn_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    andn a0, a0, a1
; RV64IBP-NEXT:    ret
  %neg = xor i32 %b, -1
  %and = and i32 %neg, %a
  ret i32 %and
}

define i64 @andn_i64(i64 %a, i64 %b) nounwind {
; RV64I-LABEL: andn_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    not a1, a1
; RV64I-NEXT:    and a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: andn_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    andn a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: andn_i64:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    andn a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: andn_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    andn a0, a0, a1
; RV64IBP-NEXT:    ret
  %neg = xor i64 %b, -1
  %and = and i64 %neg, %a
  ret i64 %and
}

define signext i32 @orn_i32(i32 signext %a, i32 signext %b) nounwind {
; RV64I-LABEL: orn_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    not a1, a1
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: orn_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    orn a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: orn_i32:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    orn a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: orn_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    orn a0, a0, a1
; RV64IBP-NEXT:    ret
  %neg = xor i32 %b, -1
  %or = or i32 %neg, %a
  ret i32 %or
}

define i64 @orn_i64(i64 %a, i64 %b) nounwind {
; RV64I-LABEL: orn_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    not a1, a1
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: orn_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    orn a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: orn_i64:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    orn a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: orn_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    orn a0, a0, a1
; RV64IBP-NEXT:    ret
  %neg = xor i64 %b, -1
  %or = or i64 %neg, %a
  ret i64 %or
}

define signext i32 @xnor_i32(i32 signext %a, i32 signext %b) nounwind {
; RV64I-LABEL: xnor_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    xor a0, a0, a1
; RV64I-NEXT:    not a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: xnor_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    xnor a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: xnor_i32:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    xnor a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: xnor_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    xnor a0, a0, a1
; RV64IBP-NEXT:    ret
  %neg = xor i32 %a, -1
  %xor = xor i32 %neg, %b
  ret i32 %xor
}

define i64 @xnor_i64(i64 %a, i64 %b) nounwind {
; RV64I-LABEL: xnor_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    xor a0, a0, a1
; RV64I-NEXT:    not a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: xnor_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    xnor a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: xnor_i64:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    xnor a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: xnor_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    xnor a0, a0, a1
; RV64IBP-NEXT:    ret
  %neg = xor i64 %a, -1
  %xor = xor i64 %neg, %b
  ret i64 %xor
}

declare i32 @llvm.fshl.i32(i32, i32, i32)

define signext i32 @rol_i32(i32 signext %a, i32 signext %b) nounwind {
; RV64I-LABEL: rol_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    sllw a2, a0, a1
; RV64I-NEXT:    neg a1, a1
; RV64I-NEXT:    srlw a0, a0, a1
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: rol_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rolw a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: rol_i32:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    rolw a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: rol_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rolw a0, a0, a1
; RV64IBP-NEXT:    ret
  %1 = tail call i32 @llvm.fshl.i32(i32 %a, i32 %a, i32 %b)
  ret i32 %1
}

; Similar to rol_i32, but doesn't sign extend the result.
define void @rol_i32_nosext(i32 signext %a, i32 signext %b, i32* %x) nounwind {
; RV64I-LABEL: rol_i32_nosext:
; RV64I:       # %bb.0:
; RV64I-NEXT:    sllw a3, a0, a1
; RV64I-NEXT:    neg a1, a1
; RV64I-NEXT:    srlw a0, a0, a1
; RV64I-NEXT:    or a0, a3, a0
; RV64I-NEXT:    sw a0, 0(a2)
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: rol_i32_nosext:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rolw a0, a0, a1
; RV64IB-NEXT:    sw a0, 0(a2)
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: rol_i32_nosext:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    rolw a0, a0, a1
; RV64IBB-NEXT:    sw a0, 0(a2)
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: rol_i32_nosext:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rolw a0, a0, a1
; RV64IBP-NEXT:    sw a0, 0(a2)
; RV64IBP-NEXT:    ret
  %1 = tail call i32 @llvm.fshl.i32(i32 %a, i32 %a, i32 %b)
  store i32 %1, i32* %x
  ret void
}

declare i64 @llvm.fshl.i64(i64, i64, i64)

define i64 @rol_i64(i64 %a, i64 %b) nounwind {
; RV64I-LABEL: rol_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    sll a2, a0, a1
; RV64I-NEXT:    neg a1, a1
; RV64I-NEXT:    srl a0, a0, a1
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: rol_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rol a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: rol_i64:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    rol a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: rol_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rol a0, a0, a1
; RV64IBP-NEXT:    ret
  %or = tail call i64 @llvm.fshl.i64(i64 %a, i64 %a, i64 %b)
  ret i64 %or
}

declare i32 @llvm.fshr.i32(i32, i32, i32)

define signext i32 @ror_i32(i32 signext %a, i32 signext %b) nounwind {
; RV64I-LABEL: ror_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    srlw a2, a0, a1
; RV64I-NEXT:    neg a1, a1
; RV64I-NEXT:    sllw a0, a0, a1
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: ror_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rorw a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: ror_i32:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    rorw a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: ror_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rorw a0, a0, a1
; RV64IBP-NEXT:    ret
  %1 = tail call i32 @llvm.fshr.i32(i32 %a, i32 %a, i32 %b)
  ret i32 %1
}

; Similar to ror_i32, but doesn't sign extend the result.
define void @ror_i32_nosext(i32 signext %a, i32 signext %b, i32* %x) nounwind {
; RV64I-LABEL: ror_i32_nosext:
; RV64I:       # %bb.0:
; RV64I-NEXT:    srlw a3, a0, a1
; RV64I-NEXT:    neg a1, a1
; RV64I-NEXT:    sllw a0, a0, a1
; RV64I-NEXT:    or a0, a3, a0
; RV64I-NEXT:    sw a0, 0(a2)
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: ror_i32_nosext:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rorw a0, a0, a1
; RV64IB-NEXT:    sw a0, 0(a2)
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: ror_i32_nosext:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    rorw a0, a0, a1
; RV64IBB-NEXT:    sw a0, 0(a2)
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: ror_i32_nosext:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rorw a0, a0, a1
; RV64IBP-NEXT:    sw a0, 0(a2)
; RV64IBP-NEXT:    ret
  %1 = tail call i32 @llvm.fshr.i32(i32 %a, i32 %a, i32 %b)
  store i32 %1, i32* %x
  ret void
}

declare i64 @llvm.fshr.i64(i64, i64, i64)

define i64 @ror_i64(i64 %a, i64 %b) nounwind {
; RV64I-LABEL: ror_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    srl a2, a0, a1
; RV64I-NEXT:    neg a1, a1
; RV64I-NEXT:    sll a0, a0, a1
; RV64I-NEXT:    or a0, a2, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: ror_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    ror a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: ror_i64:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    ror a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: ror_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    ror a0, a0, a1
; RV64IBP-NEXT:    ret
  %or = tail call i64 @llvm.fshr.i64(i64 %a, i64 %a, i64 %b)
  ret i64 %or
}

define signext i32 @rori_i32_fshl(i32 signext %a) nounwind {
; RV64I-LABEL: rori_i32_fshl:
; RV64I:       # %bb.0:
; RV64I-NEXT:    srliw a1, a0, 1
; RV64I-NEXT:    slli a0, a0, 31
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: rori_i32_fshl:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    roriw a0, a0, 1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: rori_i32_fshl:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    roriw a0, a0, 1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: rori_i32_fshl:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    roriw a0, a0, 1
; RV64IBP-NEXT:    ret
  %1 = tail call i32 @llvm.fshl.i32(i32 %a, i32 %a, i32 31)
  ret i32 %1
}

; Similar to rori_i32_fshl, but doesn't sign extend the result.
define void @rori_i32_fshl_nosext(i32 signext %a, i32* %x) nounwind {
; RV64I-LABEL: rori_i32_fshl_nosext:
; RV64I:       # %bb.0:
; RV64I-NEXT:    srliw a2, a0, 1
; RV64I-NEXT:    slli a0, a0, 31
; RV64I-NEXT:    or a0, a0, a2
; RV64I-NEXT:    sw a0, 0(a1)
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: rori_i32_fshl_nosext:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    roriw a0, a0, 1
; RV64IB-NEXT:    sw a0, 0(a1)
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: rori_i32_fshl_nosext:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    roriw a0, a0, 1
; RV64IBB-NEXT:    sw a0, 0(a1)
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: rori_i32_fshl_nosext:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    roriw a0, a0, 1
; RV64IBP-NEXT:    sw a0, 0(a1)
; RV64IBP-NEXT:    ret
  %1 = tail call i32 @llvm.fshl.i32(i32 %a, i32 %a, i32 31)
  store i32 %1, i32* %x
  ret void
}

define signext i32 @rori_i32_fshr(i32 signext %a) nounwind {
; RV64I-LABEL: rori_i32_fshr:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 1
; RV64I-NEXT:    srliw a0, a0, 31
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: rori_i32_fshr:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    roriw a0, a0, 31
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: rori_i32_fshr:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    roriw a0, a0, 31
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: rori_i32_fshr:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    roriw a0, a0, 31
; RV64IBP-NEXT:    ret
  %1 = tail call i32 @llvm.fshr.i32(i32 %a, i32 %a, i32 31)
  ret i32 %1
}

; Similar to rori_i32_fshr, but doesn't sign extend the result.
define void @rori_i32_fshr_nosext(i32 signext %a, i32* %x) nounwind {
; RV64I-LABEL: rori_i32_fshr_nosext:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a2, a0, 1
; RV64I-NEXT:    srliw a0, a0, 31
; RV64I-NEXT:    or a0, a0, a2
; RV64I-NEXT:    sw a0, 0(a1)
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: rori_i32_fshr_nosext:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    roriw a0, a0, 31
; RV64IB-NEXT:    sw a0, 0(a1)
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: rori_i32_fshr_nosext:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    roriw a0, a0, 31
; RV64IBB-NEXT:    sw a0, 0(a1)
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: rori_i32_fshr_nosext:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    roriw a0, a0, 31
; RV64IBP-NEXT:    sw a0, 0(a1)
; RV64IBP-NEXT:    ret
  %1 = tail call i32 @llvm.fshr.i32(i32 %a, i32 %a, i32 31)
  store i32 %1, i32* %x
  ret void
}

; This test is similar to the type legalized version of the fshl/fshr tests, but
; instead of having the same input to both shifts it has different inputs. Make
; sure we don't match it as a roriw.
define signext i32 @not_rori_i32(i32 signext %x, i32 signext %y) nounwind {
; RV64I-LABEL: not_rori_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a0, a0, 31
; RV64I-NEXT:    srliw a1, a1, 1
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: not_rori_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    slli a0, a0, 31
; RV64IB-NEXT:    srliw a1, a1, 1
; RV64IB-NEXT:    or a0, a0, a1
; RV64IB-NEXT:    sext.w a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: not_rori_i32:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    slli a0, a0, 31
; RV64IBB-NEXT:    srliw a1, a1, 1
; RV64IBB-NEXT:    or a0, a0, a1
; RV64IBB-NEXT:    sext.w a0, a0
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: not_rori_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    slli a0, a0, 31
; RV64IBP-NEXT:    srliw a1, a1, 1
; RV64IBP-NEXT:    or a0, a0, a1
; RV64IBP-NEXT:    sext.w a0, a0
; RV64IBP-NEXT:    ret
  %a = shl i32 %x, 31
  %b = lshr i32 %y, 1
  %c = or i32 %a, %b
  ret i32 %c
}

; This is similar to the type legalized roriw pattern, but the and mask is more
; than 32 bits so the lshr doesn't shift zeroes into the lower 32 bits. Make
; sure we don't match it to roriw.
define i64 @roriw_bug(i64 %x) nounwind {
; RV64I-LABEL: roriw_bug:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 31
; RV64I-NEXT:    andi a0, a0, -2
; RV64I-NEXT:    srli a2, a0, 1
; RV64I-NEXT:    or a1, a1, a2
; RV64I-NEXT:    sext.w a1, a1
; RV64I-NEXT:    xor a0, a0, a1
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: roriw_bug:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    slli a1, a0, 31
; RV64IB-NEXT:    andi a0, a0, -2
; RV64IB-NEXT:    srli a2, a0, 1
; RV64IB-NEXT:    or a1, a1, a2
; RV64IB-NEXT:    sext.w a1, a1
; RV64IB-NEXT:    xor a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: roriw_bug:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    slli a1, a0, 31
; RV64IBB-NEXT:    andi a0, a0, -2
; RV64IBB-NEXT:    srli a2, a0, 1
; RV64IBB-NEXT:    or a1, a1, a2
; RV64IBB-NEXT:    sext.w a1, a1
; RV64IBB-NEXT:    xor a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: roriw_bug:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    slli a1, a0, 31
; RV64IBP-NEXT:    andi a0, a0, -2
; RV64IBP-NEXT:    srli a2, a0, 1
; RV64IBP-NEXT:    or a1, a1, a2
; RV64IBP-NEXT:    sext.w a1, a1
; RV64IBP-NEXT:    xor a0, a0, a1
; RV64IBP-NEXT:    ret
  %a = shl i64 %x, 31
  %b = and i64 %x, 18446744073709551614
  %c = lshr i64 %b, 1
  %d = or i64 %a, %c
  %e = shl i64 %d, 32
  %f = ashr i64 %e, 32
  %g = xor i64 %b, %f ; to increase the use count on %b to disable SimplifyDemandedBits.
  ret i64 %g
}

define i64 @rori_i64_fshl(i64 %a) nounwind {
; RV64I-LABEL: rori_i64_fshl:
; RV64I:       # %bb.0:
; RV64I-NEXT:    srli a1, a0, 1
; RV64I-NEXT:    slli a0, a0, 63
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: rori_i64_fshl:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rori a0, a0, 1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: rori_i64_fshl:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    rori a0, a0, 1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: rori_i64_fshl:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rori a0, a0, 1
; RV64IBP-NEXT:    ret
  %1 = tail call i64 @llvm.fshl.i64(i64 %a, i64 %a, i64 63)
  ret i64 %1
}

define i64 @rori_i64_fshr(i64 %a) nounwind {
; RV64I-LABEL: rori_i64_fshr:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a1, a0, 1
; RV64I-NEXT:    srli a0, a0, 63
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: rori_i64_fshr:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    rori a0, a0, 63
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: rori_i64_fshr:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    rori a0, a0, 63
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: rori_i64_fshr:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    rori a0, a0, 63
; RV64IBP-NEXT:    ret
  %1 = tail call i64 @llvm.fshr.i64(i64 %a, i64 %a, i64 63)
  ret i64 %1
}

define signext i32 @pack_i32(i32 signext %a, i32 signext %b) nounwind {
; RV64I-LABEL: pack_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a2, 16
; RV64I-NEXT:    addiw a2, a2, -1
; RV64I-NEXT:    and a0, a0, a2
; RV64I-NEXT:    slli a1, a1, 16
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    sext.w a0, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: pack_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    packw a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: pack_i32:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    packw a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: pack_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    packw a0, a0, a1
; RV64IBP-NEXT:    ret
  %shl = and i32 %a, 65535
  %shl1 = shl i32 %b, 16
  %or = or i32 %shl1, %shl
  ret i32 %or
}

define i64 @pack_i64(i64 %a, i64 %b) nounwind {
; RV64I-LABEL: pack_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a0, a0, 32
; RV64I-NEXT:    srli a0, a0, 32
; RV64I-NEXT:    slli a1, a1, 32
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: pack_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    pack a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: pack_i64:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    pack a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: pack_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    pack a0, a0, a1
; RV64IBP-NEXT:    ret
  %shl = and i64 %a, 4294967295
  %shl1 = shl i64 %b, 32
  %or = or i64 %shl1, %shl
  ret i64 %or
}

define signext i32 @packu_i32(i32 signext %a, i32 signext %b) nounwind {
; RV64I-LABEL: packu_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    srliw a0, a0, 16
; RV64I-NEXT:    lui a2, 1048560
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: packu_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    packuw a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: packu_i32:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    packuw a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: packu_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    packuw a0, a0, a1
; RV64IBP-NEXT:    ret
  %shr = lshr i32 %a, 16
  %shr1 = and i32 %b, -65536
  %or = or i32 %shr1, %shr
  ret i32 %or
}

define i64 @packu_i64(i64 %a, i64 %b) nounwind {
; RV64I-LABEL: packu_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    srli a0, a0, 32
; RV64I-NEXT:    addi a2, zero, -1
; RV64I-NEXT:    slli a2, a2, 32
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: packu_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    packu a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: packu_i64:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    packu a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: packu_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    packu a0, a0, a1
; RV64IBP-NEXT:    ret
  %shr = lshr i64 %a, 32
  %shr1 = and i64 %b, -4294967296
  %or = or i64 %shr1, %shr
  ret i64 %or
}

define signext i32 @packh_i32(i32 signext %a, i32 signext %b) nounwind {
; RV64I-LABEL: packh_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    andi a0, a0, 255
; RV64I-NEXT:    slli a1, a1, 8
; RV64I-NEXT:    lui a2, 16
; RV64I-NEXT:    addiw a2, a2, -256
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: packh_i32:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    packh a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: packh_i32:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    packh a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: packh_i32:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    packh a0, a0, a1
; RV64IBP-NEXT:    ret
  %and = and i32 %a, 255
  %and1 = shl i32 %b, 8
  %shl = and i32 %and1, 65280
  %or = or i32 %shl, %and
  ret i32 %or
}

define i64 @packh_i64(i64 %a, i64 %b) nounwind {
; RV64I-LABEL: packh_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    andi a0, a0, 255
; RV64I-NEXT:    slli a1, a1, 8
; RV64I-NEXT:    lui a2, 16
; RV64I-NEXT:    addiw a2, a2, -256
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: packh_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    packh a0, a0, a1
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: packh_i64:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    packh a0, a0, a1
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: packh_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    packh a0, a0, a1
; RV64IBP-NEXT:    ret
  %and = and i64 %a, 255
  %and1 = shl i64 %b, 8
  %shl = and i64 %and1, 65280
  %or = or i64 %shl, %and
  ret i64 %or
}

define i64 @zextw_i64(i64 %a) nounwind {
; RV64I-LABEL: zextw_i64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a0, a0, 32
; RV64I-NEXT:    srli a0, a0, 32
; RV64I-NEXT:    ret
;
; RV64IB-LABEL: zextw_i64:
; RV64IB:       # %bb.0:
; RV64IB-NEXT:    zext.w a0, a0
; RV64IB-NEXT:    ret
;
; RV64IBB-LABEL: zextw_i64:
; RV64IBB:       # %bb.0:
; RV64IBB-NEXT:    zext.w a0, a0
; RV64IBB-NEXT:    ret
;
; RV64IBP-LABEL: zextw_i64:
; RV64IBP:       # %bb.0:
; RV64IBP-NEXT:    pack a0, a0, zero
; RV64IBP-NEXT:    ret
  %and = and i64 %a, 4294967295
  ret i64 %and
}