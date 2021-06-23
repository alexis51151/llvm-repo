; RUN: llc -mtriple=riscv64 -mattr=+experimental-v,+d -verify-machineinstrs \
; RUN:   --riscv-no-aliases < %s | FileCheck %s
declare i64 @llvm.riscv.vfirst.i64.nxv1i1(
  <vscale x 1 x i1>,
  i64);

define i64 @intrinsic_vfirst_m_i64_nxv1i1(<vscale x 1 x i1> %0, i64 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_m_i64_nxv1i1
; CHECK:       vsetvli {{.*}}, a0, e8,mf8,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}
  %a = call i64 @llvm.riscv.vfirst.i64.nxv1i1(
    <vscale x 1 x i1> %0,
    i64 %1)

  ret i64 %a
}

declare i64 @llvm.riscv.vfirst.mask.i64.nxv1i1(
  <vscale x 1 x i1>,
  <vscale x 1 x i1>,
  i64);

define i64 @intrinsic_vfirst_mask_m_i64_nxv1i1(<vscale x 1 x i1> %0, <vscale x 1 x i1> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_mask_m_i64_nxv1i1
; CHECK:       vsetvli {{.*}}, a0, e8,mf8,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}, v0.t
  %a = call i64 @llvm.riscv.vfirst.mask.i64.nxv1i1(
    <vscale x 1 x i1> %0,
    <vscale x 1 x i1> %1,
    i64 %2)

  ret i64 %a
}

declare i64 @llvm.riscv.vfirst.i64.nxv2i1(
  <vscale x 2 x i1>,
  i64);

define i64 @intrinsic_vfirst_m_i64_nxv2i1(<vscale x 2 x i1> %0, i64 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_m_i64_nxv2i1
; CHECK:       vsetvli {{.*}}, a0, e8,mf4,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}
  %a = call i64 @llvm.riscv.vfirst.i64.nxv2i1(
    <vscale x 2 x i1> %0,
    i64 %1)

  ret i64 %a
}

declare i64 @llvm.riscv.vfirst.mask.i64.nxv2i1(
  <vscale x 2 x i1>,
  <vscale x 2 x i1>,
  i64);

define i64 @intrinsic_vfirst_mask_m_i64_nxv2i1(<vscale x 2 x i1> %0, <vscale x 2 x i1> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_mask_m_i64_nxv2i1
; CHECK:       vsetvli {{.*}}, a0, e8,mf4,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}, v0.t
  %a = call i64 @llvm.riscv.vfirst.mask.i64.nxv2i1(
    <vscale x 2 x i1> %0,
    <vscale x 2 x i1> %1,
    i64 %2)

  ret i64 %a
}

declare i64 @llvm.riscv.vfirst.i64.nxv4i1(
  <vscale x 4 x i1>,
  i64);

define i64 @intrinsic_vfirst_m_i64_nxv4i1(<vscale x 4 x i1> %0, i64 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_m_i64_nxv4i1
; CHECK:       vsetvli {{.*}}, a0, e8,mf2,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}
  %a = call i64 @llvm.riscv.vfirst.i64.nxv4i1(
    <vscale x 4 x i1> %0,
    i64 %1)

  ret i64 %a
}

declare i64 @llvm.riscv.vfirst.mask.i64.nxv4i1(
  <vscale x 4 x i1>,
  <vscale x 4 x i1>,
  i64);

define i64 @intrinsic_vfirst_mask_m_i64_nxv4i1(<vscale x 4 x i1> %0, <vscale x 4 x i1> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_mask_m_i64_nxv4i1
; CHECK:       vsetvli {{.*}}, a0, e8,mf2,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}, v0.t
  %a = call i64 @llvm.riscv.vfirst.mask.i64.nxv4i1(
    <vscale x 4 x i1> %0,
    <vscale x 4 x i1> %1,
    i64 %2)

  ret i64 %a
}

declare i64 @llvm.riscv.vfirst.i64.nxv8i1(
  <vscale x 8 x i1>,
  i64);

define i64 @intrinsic_vfirst_m_i64_nxv8i1(<vscale x 8 x i1> %0, i64 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_m_i64_nxv8i1
; CHECK:       vsetvli {{.*}}, a0, e8,m1,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}
  %a = call i64 @llvm.riscv.vfirst.i64.nxv8i1(
    <vscale x 8 x i1> %0,
    i64 %1)

  ret i64 %a
}

declare i64 @llvm.riscv.vfirst.mask.i64.nxv8i1(
  <vscale x 8 x i1>,
  <vscale x 8 x i1>,
  i64);

define i64 @intrinsic_vfirst_mask_m_i64_nxv8i1(<vscale x 8 x i1> %0, <vscale x 8 x i1> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_mask_m_i64_nxv8i1
; CHECK:       vsetvli {{.*}}, a0, e8,m1,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}, v0.t
  %a = call i64 @llvm.riscv.vfirst.mask.i64.nxv8i1(
    <vscale x 8 x i1> %0,
    <vscale x 8 x i1> %1,
    i64 %2)

  ret i64 %a
}

declare i64 @llvm.riscv.vfirst.i64.nxv16i1(
  <vscale x 16 x i1>,
  i64);

define i64 @intrinsic_vfirst_m_i64_nxv16i1(<vscale x 16 x i1> %0, i64 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_m_i64_nxv16i1
; CHECK:       vsetvli {{.*}}, a0, e8,m2,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}
  %a = call i64 @llvm.riscv.vfirst.i64.nxv16i1(
    <vscale x 16 x i1> %0,
    i64 %1)

  ret i64 %a
}

declare i64 @llvm.riscv.vfirst.mask.i64.nxv16i1(
  <vscale x 16 x i1>,
  <vscale x 16 x i1>,
  i64);

define i64 @intrinsic_vfirst_mask_m_i64_nxv16i1(<vscale x 16 x i1> %0, <vscale x 16 x i1> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_mask_m_i64_nxv16i1
; CHECK:       vsetvli {{.*}}, a0, e8,m2,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}, v0.t
  %a = call i64 @llvm.riscv.vfirst.mask.i64.nxv16i1(
    <vscale x 16 x i1> %0,
    <vscale x 16 x i1> %1,
    i64 %2)

  ret i64 %a
}

declare i64 @llvm.riscv.vfirst.i64.nxv32i1(
  <vscale x 32 x i1>,
  i64);

define i64 @intrinsic_vfirst_m_i64_nxv32i1(<vscale x 32 x i1> %0, i64 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_m_i64_nxv32i1
; CHECK:       vsetvli {{.*}}, a0, e8,m4,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}
  %a = call i64 @llvm.riscv.vfirst.i64.nxv32i1(
    <vscale x 32 x i1> %0,
    i64 %1)

  ret i64 %a
}

declare i64 @llvm.riscv.vfirst.mask.i64.nxv32i1(
  <vscale x 32 x i1>,
  <vscale x 32 x i1>,
  i64);

define i64 @intrinsic_vfirst_mask_m_i64_nxv32i1(<vscale x 32 x i1> %0, <vscale x 32 x i1> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_mask_m_i64_nxv32i1
; CHECK:       vsetvli {{.*}}, a0, e8,m4,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}, v0.t
  %a = call i64 @llvm.riscv.vfirst.mask.i64.nxv32i1(
    <vscale x 32 x i1> %0,
    <vscale x 32 x i1> %1,
    i64 %2)

  ret i64 %a
}

declare i64 @llvm.riscv.vfirst.i64.nxv64i1(
  <vscale x 64 x i1>,
  i64);

define i64 @intrinsic_vfirst_m_i64_nxv64i1(<vscale x 64 x i1> %0, i64 %1) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_m_i64_nxv64i1
; CHECK:       vsetvli {{.*}}, a0, e8,m8,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}
  %a = call i64 @llvm.riscv.vfirst.i64.nxv64i1(
    <vscale x 64 x i1> %0,
    i64 %1)

  ret i64 %a
}

declare i64 @llvm.riscv.vfirst.mask.i64.nxv64i1(
  <vscale x 64 x i1>,
  <vscale x 64 x i1>,
  i64);

define i64 @intrinsic_vfirst_mask_m_i64_nxv64i1(<vscale x 64 x i1> %0, <vscale x 64 x i1> %1, i64 %2) nounwind {
entry:
; CHECK-LABEL: intrinsic_vfirst_mask_m_i64_nxv64i1
; CHECK:       vsetvli {{.*}}, a0, e8,m8,ta,mu
; CHECK:       vfirst.m a0, {{v[0-9]+}}, v0.t
  %a = call i64 @llvm.riscv.vfirst.mask.i64.nxv64i1(
    <vscale x 64 x i1> %0,
    <vscale x 64 x i1> %1,
    i64 %2)

  ret i64 %a
}
