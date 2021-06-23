; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -march=amdgcn -mcpu=gfx908 -o - %s | FileCheck %s

%S = type <{ float, double }>

; The result of that atomic ops should not be used as a uniform value.

define protected amdgpu_kernel void @add(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: add:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    v_mov_b32_e32 v3, 1
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    global_atomic_add v2, v2, v3, s[0:1] glc
; CHECK-NEXT:    v_mov_b32_e32 v0, s2
; CHECK-NEXT:    v_mov_b32_e32 v1, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v2, 12, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = atomicrmw add i32 addrspace(1)* %p, i32 1 monotonic
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @sub(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: sub:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    v_mov_b32_e32 v3, 1
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    global_atomic_sub v2, v2, v3, s[0:1] glc
; CHECK-NEXT:    v_mov_b32_e32 v0, s2
; CHECK-NEXT:    v_mov_b32_e32 v1, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v2, 12, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = atomicrmw sub i32 addrspace(1)* %p, i32 1 monotonic
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @and(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: and:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    v_mov_b32_e32 v3, 1
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    global_atomic_and v2, v2, v3, s[0:1] glc
; CHECK-NEXT:    v_mov_b32_e32 v0, s2
; CHECK-NEXT:    v_mov_b32_e32 v1, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v2, 12, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = atomicrmw and i32 addrspace(1)* %p, i32 1 monotonic
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @or(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: or:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    v_mov_b32_e32 v3, 1
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    global_atomic_or v2, v2, v3, s[0:1] glc
; CHECK-NEXT:    v_mov_b32_e32 v0, s2
; CHECK-NEXT:    v_mov_b32_e32 v1, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v2, 12, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = atomicrmw or i32 addrspace(1)* %p, i32 1 monotonic
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @xor(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: xor:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    v_mov_b32_e32 v3, 1
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    global_atomic_xor v2, v2, v3, s[0:1] glc
; CHECK-NEXT:    v_mov_b32_e32 v0, s2
; CHECK-NEXT:    v_mov_b32_e32 v1, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v2, 12, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = atomicrmw xor i32 addrspace(1)* %p, i32 1 monotonic
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @nand(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: nand:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    s_mov_b64 s[4:5], 0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    s_load_dword s6, s[0:1], 0x0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v0, s6
; CHECK-NEXT:  BB5_1: ; %atomicrmw.start
; CHECK-NEXT:    ; =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    v_mov_b32_e32 v1, v0
; CHECK-NEXT:    v_not_b32_e32 v0, v1
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    v_or_b32_e32 v0, -2, v0
; CHECK-NEXT:    global_atomic_cmpswap v0, v2, v[0:1], s[0:1] glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_cmp_eq_u32_e32 vcc, v0, v1
; CHECK-NEXT:    s_or_b64 s[4:5], vcc, s[4:5]
; CHECK-NEXT:    s_andn2_b64 exec, exec, s[4:5]
; CHECK-NEXT:    s_cbranch_execnz BB5_1
; CHECK-NEXT:  ; %bb.2: ; %atomicrmw.end
; CHECK-NEXT:    s_or_b64 exec, exec, s[4:5]
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = atomicrmw nand i32 addrspace(1)* %p, i32 1 monotonic
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @max(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: max:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    v_mov_b32_e32 v3, 1
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    global_atomic_smax v2, v2, v3, s[0:1] glc
; CHECK-NEXT:    v_mov_b32_e32 v0, s2
; CHECK-NEXT:    v_mov_b32_e32 v1, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v2, 12, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = atomicrmw max i32 addrspace(1)* %p, i32 1 monotonic
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @min(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: min:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    v_mov_b32_e32 v3, 1
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    global_atomic_smin v2, v2, v3, s[0:1] glc
; CHECK-NEXT:    v_mov_b32_e32 v0, s2
; CHECK-NEXT:    v_mov_b32_e32 v1, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v2, 12, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = atomicrmw min i32 addrspace(1)* %p, i32 1 monotonic
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @umax(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: umax:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    v_mov_b32_e32 v3, 1
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    global_atomic_umax v2, v2, v3, s[0:1] glc
; CHECK-NEXT:    v_mov_b32_e32 v0, s2
; CHECK-NEXT:    v_mov_b32_e32 v1, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v2, 12, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = atomicrmw umax i32 addrspace(1)* %p, i32 1 monotonic
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @umin(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: umin:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    v_mov_b32_e32 v3, 1
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    global_atomic_umin v2, v2, v3, s[0:1] glc
; CHECK-NEXT:    v_mov_b32_e32 v0, s2
; CHECK-NEXT:    v_mov_b32_e32 v1, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v2, 12, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = atomicrmw umin i32 addrspace(1)* %p, i32 1 monotonic
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @cmpxchg(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: cmpxchg:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    v_mov_b32_e32 v4, 0
; CHECK-NEXT:    v_mov_b32_e32 v0, 2
; CHECK-NEXT:    v_mov_b32_e32 v1, 1
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    global_atomic_cmpswap v0, v4, v[0:1], s[0:1] glc
; CHECK-NEXT:    v_mov_b32_e32 v2, s2
; CHECK-NEXT:    v_mov_b32_e32 v3, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, v[2:3]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %agg = cmpxchg i32 addrspace(1)* %p, i32 1, i32 2 monotonic monotonic
  %n32 = extractvalue {i32, i1} %agg, 0
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @xchg(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: xchg:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    v_mov_b32_e32 v3, 1
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    global_atomic_swap v2, v2, v3, s[0:1] glc
; CHECK-NEXT:    v_mov_b32_e32 v0, s2
; CHECK-NEXT:    v_mov_b32_e32 v1, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v2, 12, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = atomicrmw xchg i32 addrspace(1)* %p, i32 1 monotonic
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @inc(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: inc:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    global_atomic_inc v2, v2, v2, s[0:1] glc
; CHECK-NEXT:    v_mov_b32_e32 v0, s2
; CHECK-NEXT:    v_mov_b32_e32 v1, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v2, 12, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.atomic.inc.i32.p1i32(i32 addrspace(1)* %p, i32 0, i32 0, i32 0, i1 false)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @dec(i32 addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: dec:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    global_atomic_dec v2, v2, v2, s[0:1] glc
; CHECK-NEXT:    v_mov_b32_e32 v0, s2
; CHECK-NEXT:    v_mov_b32_e32 v1, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v2, 12, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.atomic.dec.i32.p1i32(i32 addrspace(1)* %p, i32 0, i32 0, i32 0, i1 false)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @fadd(float addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: fadd:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    s_mov_b64 s[4:5], 0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    s_load_dword s6, s[0:1], 0x0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v0, s6
; CHECK-NEXT:  BB14_1: ; %atomicrmw.start
; CHECK-NEXT:    ; =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    v_mov_b32_e32 v1, v0
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    v_add_f32_e32 v0, 1.0, v1
; CHECK-NEXT:    global_atomic_cmpswap v0, v2, v[0:1], s[0:1] glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_cmp_eq_u32_e32 vcc, v0, v1
; CHECK-NEXT:    s_or_b64 s[4:5], vcc, s[4:5]
; CHECK-NEXT:    s_andn2_b64 exec, exec, s[4:5]
; CHECK-NEXT:    s_cbranch_execnz BB14_1
; CHECK-NEXT:  ; %bb.2: ; %atomicrmw.end
; CHECK-NEXT:    s_or_b64 exec, exec, s[4:5]
; CHECK-NEXT:    v_cvt_u32_f32_e32 v0, v0
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %f32 = atomicrmw fadd float addrspace(1)* %p, float 1.0 monotonic
  %n32 = fptoui float %f32 to i32
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @fsub(float addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: fsub:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; CHECK-NEXT:    s_mov_b64 s[4:5], 0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    s_load_dword s6, s[0:1], 0x0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v0, s6
; CHECK-NEXT:  BB15_1: ; %atomicrmw.start
; CHECK-NEXT:    ; =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    v_mov_b32_e32 v1, v0
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    v_add_f32_e32 v0, -1.0, v1
; CHECK-NEXT:    global_atomic_cmpswap v0, v2, v[0:1], s[0:1] glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_cmp_eq_u32_e32 vcc, v0, v1
; CHECK-NEXT:    s_or_b64 s[4:5], vcc, s[4:5]
; CHECK-NEXT:    s_andn2_b64 exec, exec, s[4:5]
; CHECK-NEXT:    s_cbranch_execnz BB15_1
; CHECK-NEXT:  ; %bb.2: ; %atomicrmw.end
; CHECK-NEXT:    s_or_b64 exec, exec, s[4:5]
; CHECK-NEXT:    v_cvt_u32_f32_e32 v0, v0
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %f32 = atomicrmw fsub float addrspace(1)* %p, float 1.0 monotonic
  %n32 = fptoui float %f32 to i32
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @fmin(double addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: fmin:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_mov_b32 s36, SCRATCH_RSRC_DWORD0
; CHECK-NEXT:    s_mov_b32 s37, SCRATCH_RSRC_DWORD1
; CHECK-NEXT:    s_mov_b32 s38, -1
; CHECK-NEXT:    s_mov_b32 s39, 0xe00000
; CHECK-NEXT:    s_add_u32 s36, s36, s3
; CHECK-NEXT:    s_addc_u32 s37, s37, 0
; CHECK-NEXT:    s_getpc_b64 s[2:3]
; CHECK-NEXT:    s_add_u32 s2, s2, llvm.amdgcn.global.atomic.fmin.f64.p1f64.f64@gotpcrel32@lo+4
; CHECK-NEXT:    s_addc_u32 s3, s3, llvm.amdgcn.global.atomic.fmin.f64.p1f64.f64@gotpcrel32@hi+12
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dwordx2 s[8:9], s[2:3], 0x0
; CHECK-NEXT:    s_mov_b64 s[0:1], s[36:37]
; CHECK-NEXT:    s_mov_b64 s[2:3], s[38:39]
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v0, s4
; CHECK-NEXT:    v_mov_b32_e32 v1, s5
; CHECK-NEXT:    v_mov_b32_e32 v3, 0x3ff00000
; CHECK-NEXT:    s_mov_b32 s32, 0
; CHECK-NEXT:    v_mov_b32_e32 v40, s6
; CHECK-NEXT:    v_mov_b32_e32 v41, s7
; CHECK-NEXT:    s_swappc_b64 s[30:31], s[8:9]
; CHECK-NEXT:    v_cvt_u32_f64_e32 v0, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, v[40:41]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %f64 = call double @llvm.amdgcn.global.atomic.fmin.f64.p1f64.f64(double addrspace(1)* %p, double 1.0)
  %n32 = fptoui double %f64 to i32
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @fmax(double addrspace(1)* %p, %S addrspace(1)* %q) {
; CHECK-LABEL: fmax:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_mov_b32 s36, SCRATCH_RSRC_DWORD0
; CHECK-NEXT:    s_mov_b32 s37, SCRATCH_RSRC_DWORD1
; CHECK-NEXT:    s_mov_b32 s38, -1
; CHECK-NEXT:    s_mov_b32 s39, 0xe00000
; CHECK-NEXT:    s_add_u32 s36, s36, s3
; CHECK-NEXT:    s_addc_u32 s37, s37, 0
; CHECK-NEXT:    s_getpc_b64 s[2:3]
; CHECK-NEXT:    s_add_u32 s2, s2, llvm.amdgcn.global.atomic.fmax.f64.p1f64.f64@gotpcrel32@lo+4
; CHECK-NEXT:    s_addc_u32 s3, s3, llvm.amdgcn.global.atomic.fmax.f64.p1f64.f64@gotpcrel32@hi+12
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dwordx2 s[8:9], s[2:3], 0x0
; CHECK-NEXT:    s_mov_b64 s[0:1], s[36:37]
; CHECK-NEXT:    s_mov_b64 s[2:3], s[38:39]
; CHECK-NEXT:    v_mov_b32_e32 v2, 0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v0, s4
; CHECK-NEXT:    v_mov_b32_e32 v1, s5
; CHECK-NEXT:    v_mov_b32_e32 v3, 0x3ff00000
; CHECK-NEXT:    s_mov_b32 s32, 0
; CHECK-NEXT:    v_mov_b32_e32 v40, s6
; CHECK-NEXT:    v_mov_b32_e32 v41, s7
; CHECK-NEXT:    s_swappc_b64 s[30:31], s[8:9]
; CHECK-NEXT:    v_cvt_u32_f64_e32 v0, v[0:1]
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, v[40:41]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %f64 = call double @llvm.amdgcn.global.atomic.fmax.f64.p1f64.f64(double addrspace(1)* %p, double 1.0)
  %n32 = fptoui double %f64 to i32
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @buffer.atomic.swap(<4 x i32> inreg %rsrc, i32 %vindex, %S addrspace(1)* %q) {
; CHECK-LABEL: buffer.atomic.swap:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dword s8, s[0:1], 0x34
; CHECK-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x3c
; CHECK-NEXT:    v_mov_b32_e32 v0, 1
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v1, s8
; CHECK-NEXT:    buffer_atomic_swap v0, v1, s[4:7], 0 offen glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.raw.buffer.atomic.swap.i32(i32 1, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 0)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @buffer.atomic.add(<4 x i32> inreg %rsrc, i32 %vindex, %S addrspace(1)* %q) {
; CHECK-LABEL: buffer.atomic.add:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dword s8, s[0:1], 0x34
; CHECK-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x3c
; CHECK-NEXT:    v_mov_b32_e32 v0, 1
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v1, s8
; CHECK-NEXT:    buffer_atomic_add v0, v1, s[4:7], 0 offen glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.raw.buffer.atomic.add.i32(i32 1, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 0)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @buffer.atomic.sub(<4 x i32> inreg %rsrc, i32 %vindex, %S addrspace(1)* %q) {
; CHECK-LABEL: buffer.atomic.sub:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dword s8, s[0:1], 0x34
; CHECK-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x3c
; CHECK-NEXT:    v_mov_b32_e32 v0, 1
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v1, s8
; CHECK-NEXT:    buffer_atomic_sub v0, v1, s[4:7], 0 offen glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.raw.buffer.atomic.sub.i32(i32 1, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 0)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @buffer.atomic.smin(<4 x i32> inreg %rsrc, i32 %vindex, %S addrspace(1)* %q) {
; CHECK-LABEL: buffer.atomic.smin:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dword s8, s[0:1], 0x34
; CHECK-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x3c
; CHECK-NEXT:    v_mov_b32_e32 v0, 1
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v1, s8
; CHECK-NEXT:    buffer_atomic_smin v0, v1, s[4:7], 0 offen glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.raw.buffer.atomic.smin.i32(i32 1, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 0)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @buffer.atomic.smax(<4 x i32> inreg %rsrc, i32 %vindex, %S addrspace(1)* %q) {
; CHECK-LABEL: buffer.atomic.smax:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dword s8, s[0:1], 0x34
; CHECK-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x3c
; CHECK-NEXT:    v_mov_b32_e32 v0, 1
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v1, s8
; CHECK-NEXT:    buffer_atomic_smax v0, v1, s[4:7], 0 offen glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.raw.buffer.atomic.smax.i32(i32 1, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 0)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @buffer.atomic.umin(<4 x i32> inreg %rsrc, i32 %vindex, %S addrspace(1)* %q) {
; CHECK-LABEL: buffer.atomic.umin:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dword s8, s[0:1], 0x34
; CHECK-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x3c
; CHECK-NEXT:    v_mov_b32_e32 v0, 1
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v1, s8
; CHECK-NEXT:    buffer_atomic_umin v0, v1, s[4:7], 0 offen glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.raw.buffer.atomic.umin.i32(i32 1, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 0)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @buffer.atomic.umax(<4 x i32> inreg %rsrc, i32 %vindex, %S addrspace(1)* %q) {
; CHECK-LABEL: buffer.atomic.umax:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dword s8, s[0:1], 0x34
; CHECK-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x3c
; CHECK-NEXT:    v_mov_b32_e32 v0, 1
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v1, s8
; CHECK-NEXT:    buffer_atomic_umax v0, v1, s[4:7], 0 offen glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.raw.buffer.atomic.umax.i32(i32 1, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 0)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @buffer.atomic.and(<4 x i32> inreg %rsrc, i32 %vindex, %S addrspace(1)* %q) {
; CHECK-LABEL: buffer.atomic.and:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dword s8, s[0:1], 0x34
; CHECK-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x3c
; CHECK-NEXT:    v_mov_b32_e32 v0, 1
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v1, s8
; CHECK-NEXT:    buffer_atomic_and v0, v1, s[4:7], 0 offen glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.raw.buffer.atomic.and.i32(i32 1, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 0)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @buffer.atomic.or(<4 x i32> inreg %rsrc, i32 %vindex, %S addrspace(1)* %q) {
; CHECK-LABEL: buffer.atomic.or:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dword s8, s[0:1], 0x34
; CHECK-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x3c
; CHECK-NEXT:    v_mov_b32_e32 v0, 1
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v1, s8
; CHECK-NEXT:    buffer_atomic_or v0, v1, s[4:7], 0 offen glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.raw.buffer.atomic.or.i32(i32 1, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 0)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @buffer.atomic.xor(<4 x i32> inreg %rsrc, i32 %vindex, %S addrspace(1)* %q) {
; CHECK-LABEL: buffer.atomic.xor:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dword s8, s[0:1], 0x34
; CHECK-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x3c
; CHECK-NEXT:    v_mov_b32_e32 v0, 1
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v1, s8
; CHECK-NEXT:    buffer_atomic_xor v0, v1, s[4:7], 0 offen glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.raw.buffer.atomic.xor.i32(i32 1, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 0)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @buffer.atomic.inc(<4 x i32> inreg %rsrc, i32 %vindex, %S addrspace(1)* %q) {
; CHECK-LABEL: buffer.atomic.inc:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dword s8, s[0:1], 0x34
; CHECK-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x3c
; CHECK-NEXT:    v_mov_b32_e32 v0, 1
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v1, s8
; CHECK-NEXT:    buffer_atomic_inc v0, v1, s[4:7], 0 offen glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.raw.buffer.atomic.inc.i32(i32 1, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 0)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @buffer.atomic.dec(<4 x i32> inreg %rsrc, i32 %vindex, %S addrspace(1)* %q) {
; CHECK-LABEL: buffer.atomic.dec:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dword s8, s[0:1], 0x34
; CHECK-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x3c
; CHECK-NEXT:    v_mov_b32_e32 v0, 1
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v1, s8
; CHECK-NEXT:    buffer_atomic_dec v0, v1, s[4:7], 0 offen glc
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.raw.buffer.atomic.dec.i32(i32 1, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 0)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

define protected amdgpu_kernel void @buffer.atomic.cmpswap(<4 x i32> inreg %rsrc, i32 %vindex, %S addrspace(1)* %q) {
; CHECK-LABEL: buffer.atomic.cmpswap:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_load_dwordx4 s[4:7], s[0:1], 0x24
; CHECK-NEXT:    s_load_dword s8, s[0:1], 0x34
; CHECK-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x3c
; CHECK-NEXT:    v_mov_b32_e32 v1, 2
; CHECK-NEXT:    v_mov_b32_e32 v0, 1
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v2, s8
; CHECK-NEXT:    buffer_atomic_cmpswap v[0:1], v2, s[4:7], 0 offen glc
; CHECK-NEXT:    v_mov_b32_e32 v2, 1.0
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mad_u64_u32 v[0:1], s[0:1], v0, 12, s[2:3]
; CHECK-NEXT:    global_store_dword v[0:1], v2, off
; CHECK-NEXT:    s_endpgm
  %n32 = call i32 @llvm.amdgcn.raw.buffer.atomic.cmpswap.i32(i32 1, i32 2, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 0)
  %n64 = zext i32 %n32 to i64
  %p1 = getelementptr inbounds %S, %S addrspace(1)* %q, i64 %n64, i32 0
  store float 1.0, float addrspace(1)* %p1
  ret void
}

declare i32 @llvm.amdgcn.atomic.inc.i32.p1i32(i32 addrspace(1)*, i32, i32 immarg, i32 immarg, i1 immarg)
declare i32 @llvm.amdgcn.atomic.dec.i32.p1i32(i32 addrspace(1)*, i32, i32 immarg, i32 immarg, i1 immarg)
declare double @llvm.amdgcn.global.atomic.fmin.f64.p1f64.f64(double addrspace(1)*, double)
declare double @llvm.amdgcn.global.atomic.fmax.f64.p1f64.f64(double addrspace(1)*, double)
declare i32 @llvm.amdgcn.raw.buffer.atomic.swap.i32(i32, <4 x i32>, i32, i32, i32)
declare i32 @llvm.amdgcn.raw.buffer.atomic.add.i32(i32, <4 x i32>, i32, i32, i32)
declare i32 @llvm.amdgcn.raw.buffer.atomic.sub.i32(i32, <4 x i32>, i32, i32, i32)
declare i32 @llvm.amdgcn.raw.buffer.atomic.smin.i32(i32, <4 x i32>, i32, i32, i32)
declare i32 @llvm.amdgcn.raw.buffer.atomic.smax.i32(i32, <4 x i32>, i32, i32, i32)
declare i32 @llvm.amdgcn.raw.buffer.atomic.umin.i32(i32, <4 x i32>, i32, i32, i32)
declare i32 @llvm.amdgcn.raw.buffer.atomic.umax.i32(i32, <4 x i32>, i32, i32, i32)
declare i32 @llvm.amdgcn.raw.buffer.atomic.and.i32(i32, <4 x i32>, i32, i32, i32)
declare i32 @llvm.amdgcn.raw.buffer.atomic.or.i32(i32, <4 x i32>, i32, i32, i32)
declare i32 @llvm.amdgcn.raw.buffer.atomic.xor.i32(i32, <4 x i32>, i32, i32, i32)
declare i32 @llvm.amdgcn.raw.buffer.atomic.inc.i32(i32, <4 x i32>, i32, i32, i32)
declare i32 @llvm.amdgcn.raw.buffer.atomic.dec.i32(i32, <4 x i32>, i32, i32, i32)
declare i32 @llvm.amdgcn.raw.buffer.atomic.cmpswap.i32(i32, i32, <4 x i32>, i32, i32, i32)
