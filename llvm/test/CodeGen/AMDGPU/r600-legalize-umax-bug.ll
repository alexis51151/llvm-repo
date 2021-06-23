; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -march=r600 -mcpu=cypress -start-after safe-stack | FileCheck %s
; Don't crash

define amdgpu_kernel void @test(i64 addrspace(1)* %out) {
; CHECK-LABEL: test:
; CHECK:       ; %bb.0: ; %bb
; CHECK-NEXT:    ALU 4, @6, KC0[CB0:0-32], KC1[]
; CHECK-NEXT:    MEM_RAT_CACHELESS STORE_RAW T0.XY, T1.X, 0
; CHECK-NEXT:    ALU 3, @11, KC0[], KC1[]
; CHECK-NEXT:    MEM_RAT_CACHELESS STORE_RAW T0.XY, T1.X, 1
; CHECK-NEXT:    CF_END
; CHECK-NEXT:    PAD
; CHECK-NEXT:    ALU clause starting at 6:
; CHECK-NEXT:     MOV T0.X, literal.x,
; CHECK-NEXT:     MOV T0.Y, 0.0,
; CHECK-NEXT:     LSHR * T1.X, KC0[2].Y, literal.x,
; CHECK-NEXT:    2(2.802597e-45), 0(0.000000e+00)
; CHECK-NEXT:     MOV * T0.W, KC0[2].Y,
; CHECK-NEXT:    ALU clause starting at 11:
; CHECK-NEXT:     MAX_UINT T0.X, T0.X, literal.x,
; CHECK-NEXT:     MOV T0.Y, 0.0,
; CHECK-NEXT:     LSHR * T1.X, T0.W, literal.y,
; CHECK-NEXT:    4(5.605194e-45), 2(2.802597e-45)
bb:
  store i64 2, i64 addrspace(1)* %out
  %tmp = load i64, i64 addrspace(1)* %out
  br label %jump

jump:                                             ; preds = %bb
  %tmp1 = icmp ugt i64 %tmp, 4
  %umax = select i1 %tmp1, i64 %tmp, i64 4
  store i64 %umax, i64 addrspace(1)* %out
  ret void
}
