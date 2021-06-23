; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=amdgcn--amdpal -mcpu=gfx900 -enable-ipra=0 -verify-machineinstrs < %s | FileCheck --check-prefix=GFX9 %s
; RUN: llc -mtriple=amdgcn--amdpal -mcpu=gfx1010 -enable-ipra=0 -verify-machineinstrs < %s | FileCheck --check-prefix=GFX10 %s

declare hidden amdgpu_gfx void @external_void_func_void() #0

define amdgpu_gfx void @test_call_external_void_func_void_clobber_s30_s31_call_external_void_func_void() #0 {
; GFX9-LABEL: test_call_external_void_func_void_clobber_s30_s31_call_external_void_func_void:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    s_or_saveexec_b64 s[4:5], -1
; GFX9-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX9-NEXT:    s_mov_b64 exec, s[4:5]
; GFX9-NEXT:    v_writelane_b32 v40, s33, 4
; GFX9-NEXT:    s_mov_b32 s33, s32
; GFX9-NEXT:    s_add_u32 s32, s32, 0x400
; GFX9-NEXT:    v_writelane_b32 v40, s34, 0
; GFX9-NEXT:    v_writelane_b32 v40, s35, 1
; GFX9-NEXT:    v_writelane_b32 v40, s30, 2
; GFX9-NEXT:    s_getpc_b64 s[34:35]
; GFX9-NEXT:    s_add_u32 s34, s34, external_void_func_void@rel32@lo+4
; GFX9-NEXT:    s_addc_u32 s35, s35, external_void_func_void@rel32@hi+12
; GFX9-NEXT:    v_writelane_b32 v40, s31, 3
; GFX9-NEXT:    s_swappc_b64 s[30:31], s[34:35]
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    s_swappc_b64 s[30:31], s[34:35]
; GFX9-NEXT:    v_readlane_b32 s4, v40, 2
; GFX9-NEXT:    v_readlane_b32 s5, v40, 3
; GFX9-NEXT:    v_readlane_b32 s35, v40, 1
; GFX9-NEXT:    v_readlane_b32 s34, v40, 0
; GFX9-NEXT:    s_sub_u32 s32, s32, 0x400
; GFX9-NEXT:    v_readlane_b32 s33, v40, 4
; GFX9-NEXT:    s_or_saveexec_b64 s[6:7], -1
; GFX9-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX9-NEXT:    s_mov_b64 exec, s[6:7]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[4:5]
;
; GFX10-LABEL: test_call_external_void_func_void_clobber_s30_s31_call_external_void_func_void:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    s_or_saveexec_b32 s4, -1
; GFX10-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s4
; GFX10-NEXT:    v_writelane_b32 v40, s33, 4
; GFX10-NEXT:    s_mov_b32 s33, s32
; GFX10-NEXT:    s_add_u32 s32, s32, 0x200
; GFX10-NEXT:    v_writelane_b32 v40, s34, 0
; GFX10-NEXT:    v_writelane_b32 v40, s35, 1
; GFX10-NEXT:    v_writelane_b32 v40, s30, 2
; GFX10-NEXT:    s_getpc_b64 s[34:35]
; GFX10-NEXT:    s_add_u32 s34, s34, external_void_func_void@rel32@lo+4
; GFX10-NEXT:    s_addc_u32 s35, s35, external_void_func_void@rel32@hi+12
; GFX10-NEXT:    v_writelane_b32 v40, s31, 3
; GFX10-NEXT:    s_swappc_b64 s[30:31], s[34:35]
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    s_swappc_b64 s[30:31], s[34:35]
; GFX10-NEXT:    v_readlane_b32 s4, v40, 2
; GFX10-NEXT:    v_readlane_b32 s5, v40, 3
; GFX10-NEXT:    v_readlane_b32 s35, v40, 1
; GFX10-NEXT:    v_readlane_b32 s34, v40, 0
; GFX10-NEXT:    s_sub_u32 s32, s32, 0x200
; GFX10-NEXT:    v_readlane_b32 s33, v40, 4
; GFX10-NEXT:    s_or_saveexec_b32 s6, -1
; GFX10-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s6
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[4:5]
  call amdgpu_gfx void @external_void_func_void()
  call void asm sideeffect "", ""() #0
  call amdgpu_gfx void @external_void_func_void()
  ret void
}

define amdgpu_gfx void @void_func_void_clobber_s30_s31() #1 {
; GFX9-LABEL: void_func_void_clobber_s30_s31:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    s_mov_b64 s[4:5], s[30:31]
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; clobber
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    s_setpc_b64 s[4:5]
;
; GFX10-LABEL: void_func_void_clobber_s30_s31:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    s_mov_b64 s[4:5], s[30:31]
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; clobber
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    s_setpc_b64 s[4:5]
  call void asm sideeffect "; clobber", "~{s[30:31]}"() #0
  ret void
}

define amdgpu_gfx void @test_call_void_func_void_mayclobber_s31(i32 addrspace(1)* %out) #0 {
; GFX9-LABEL: test_call_void_func_void_mayclobber_s31:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    s_or_saveexec_b64 s[4:5], -1
; GFX9-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX9-NEXT:    s_mov_b64 exec, s[4:5]
; GFX9-NEXT:    v_writelane_b32 v40, s33, 3
; GFX9-NEXT:    s_mov_b32 s33, s32
; GFX9-NEXT:    s_add_u32 s32, s32, 0x400
; GFX9-NEXT:    v_writelane_b32 v40, s34, 0
; GFX9-NEXT:    v_writelane_b32 v40, s30, 1
; GFX9-NEXT:    v_writelane_b32 v40, s31, 2
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; def s31
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    s_getpc_b64 s[4:5]
; GFX9-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX9-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX9-NEXT:    s_mov_b32 s34, s31
; GFX9-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX9-NEXT:    v_readlane_b32 s4, v40, 1
; GFX9-NEXT:    s_mov_b32 s31, s34
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; use s31
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    v_readlane_b32 s5, v40, 2
; GFX9-NEXT:    v_readlane_b32 s34, v40, 0
; GFX9-NEXT:    s_sub_u32 s32, s32, 0x400
; GFX9-NEXT:    v_readlane_b32 s33, v40, 3
; GFX9-NEXT:    s_or_saveexec_b64 s[6:7], -1
; GFX9-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX9-NEXT:    s_mov_b64 exec, s[6:7]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[4:5]
;
; GFX10-LABEL: test_call_void_func_void_mayclobber_s31:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    s_or_saveexec_b32 s4, -1
; GFX10-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s4
; GFX10-NEXT:    v_writelane_b32 v40, s33, 3
; GFX10-NEXT:    s_mov_b32 s33, s32
; GFX10-NEXT:    s_add_u32 s32, s32, 0x200
; GFX10-NEXT:    v_writelane_b32 v40, s34, 0
; GFX10-NEXT:    v_writelane_b32 v40, s30, 1
; GFX10-NEXT:    s_getpc_b64 s[4:5]
; GFX10-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX10-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX10-NEXT:    v_writelane_b32 v40, s31, 2
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; def s31
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    s_mov_b32 s34, s31
; GFX10-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX10-NEXT:    v_readlane_b32 s4, v40, 1
; GFX10-NEXT:    s_mov_b32 s31, s34
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; use s31
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    v_readlane_b32 s5, v40, 2
; GFX10-NEXT:    v_readlane_b32 s34, v40, 0
; GFX10-NEXT:    s_sub_u32 s32, s32, 0x200
; GFX10-NEXT:    v_readlane_b32 s33, v40, 3
; GFX10-NEXT:    s_or_saveexec_b32 s6, -1
; GFX10-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s6
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[4:5]
  %s31 = call i32 asm sideeffect "; def $0", "={s31}"()
  call amdgpu_gfx void @external_void_func_void()
  call void asm sideeffect "; use $0", "{s31}"(i32 %s31)
  ret void
}

define amdgpu_gfx void @test_call_void_func_void_mayclobber_v31(i32 addrspace(1)* %out) #0 {
; GFX9-LABEL: test_call_void_func_void_mayclobber_v31:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    s_or_saveexec_b64 s[4:5], -1
; GFX9-NEXT:    buffer_store_dword v41, off, s[0:3], s32 offset:4 ; 4-byte Folded Spill
; GFX9-NEXT:    s_mov_b64 exec, s[4:5]
; GFX9-NEXT:    v_writelane_b32 v41, s33, 2
; GFX9-NEXT:    s_mov_b32 s33, s32
; GFX9-NEXT:    v_writelane_b32 v41, s30, 0
; GFX9-NEXT:    s_add_u32 s32, s32, 0x400
; GFX9-NEXT:    buffer_store_dword v40, off, s[0:3], s33 ; 4-byte Folded Spill
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; def v31
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    s_getpc_b64 s[4:5]
; GFX9-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX9-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX9-NEXT:    v_writelane_b32 v41, s31, 1
; GFX9-NEXT:    v_mov_b32_e32 v40, v31
; GFX9-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX9-NEXT:    v_mov_b32_e32 v31, v40
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; use v31
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    buffer_load_dword v40, off, s[0:3], s33 ; 4-byte Folded Reload
; GFX9-NEXT:    v_readlane_b32 s4, v41, 0
; GFX9-NEXT:    v_readlane_b32 s5, v41, 1
; GFX9-NEXT:    s_sub_u32 s32, s32, 0x400
; GFX9-NEXT:    v_readlane_b32 s33, v41, 2
; GFX9-NEXT:    s_or_saveexec_b64 s[6:7], -1
; GFX9-NEXT:    buffer_load_dword v41, off, s[0:3], s32 offset:4 ; 4-byte Folded Reload
; GFX9-NEXT:    s_mov_b64 exec, s[6:7]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[4:5]
;
; GFX10-LABEL: test_call_void_func_void_mayclobber_v31:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    s_or_saveexec_b32 s4, -1
; GFX10-NEXT:    buffer_store_dword v41, off, s[0:3], s32 offset:4 ; 4-byte Folded Spill
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s4
; GFX10-NEXT:    v_writelane_b32 v41, s33, 2
; GFX10-NEXT:    s_mov_b32 s33, s32
; GFX10-NEXT:    v_writelane_b32 v41, s30, 0
; GFX10-NEXT:    s_add_u32 s32, s32, 0x200
; GFX10-NEXT:    buffer_store_dword v40, off, s[0:3], s33 ; 4-byte Folded Spill
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; def v31
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    s_getpc_b64 s[4:5]
; GFX10-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX10-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX10-NEXT:    v_writelane_b32 v41, s31, 1
; GFX10-NEXT:    v_mov_b32_e32 v40, v31
; GFX10-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX10-NEXT:    v_mov_b32_e32 v31, v40
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; use v31
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    buffer_load_dword v40, off, s[0:3], s33 ; 4-byte Folded Reload
; GFX10-NEXT:    v_readlane_b32 s4, v41, 0
; GFX10-NEXT:    v_readlane_b32 s5, v41, 1
; GFX10-NEXT:    s_sub_u32 s32, s32, 0x200
; GFX10-NEXT:    v_readlane_b32 s33, v41, 2
; GFX10-NEXT:    s_or_saveexec_b32 s6, -1
; GFX10-NEXT:    buffer_load_dword v41, off, s[0:3], s32 offset:4 ; 4-byte Folded Reload
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s6
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[4:5]
  %v31 = call i32 asm sideeffect "; def $0", "={v31}"()
  call amdgpu_gfx void @external_void_func_void()
  call void asm sideeffect "; use $0", "{v31}"(i32 %v31)
  ret void
}


define amdgpu_gfx void @test_call_void_func_void_preserves_s33(i32 addrspace(1)* %out) #0 {
; GFX9-LABEL: test_call_void_func_void_preserves_s33:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    s_or_saveexec_b64 s[4:5], -1
; GFX9-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX9-NEXT:    s_mov_b64 exec, s[4:5]
; GFX9-NEXT:    v_writelane_b32 v40, s33, 3
; GFX9-NEXT:    s_mov_b32 s33, s32
; GFX9-NEXT:    s_add_u32 s32, s32, 0x400
; GFX9-NEXT:    v_writelane_b32 v40, s33, 0
; GFX9-NEXT:    v_writelane_b32 v40, s30, 1
; GFX9-NEXT:    s_getpc_b64 s[4:5]
; GFX9-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX9-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX9-NEXT:    v_writelane_b32 v40, s31, 2
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; def s33
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; use s33
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    v_readlane_b32 s4, v40, 1
; GFX9-NEXT:    v_readlane_b32 s33, v40, 0
; GFX9-NEXT:    v_readlane_b32 s5, v40, 2
; GFX9-NEXT:    s_sub_u32 s32, s32, 0x400
; GFX9-NEXT:    v_readlane_b32 s33, v40, 3
; GFX9-NEXT:    s_or_saveexec_b64 s[6:7], -1
; GFX9-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX9-NEXT:    s_mov_b64 exec, s[6:7]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[4:5]
;
; GFX10-LABEL: test_call_void_func_void_preserves_s33:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    s_or_saveexec_b32 s4, -1
; GFX10-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s4
; GFX10-NEXT:    v_writelane_b32 v40, s33, 3
; GFX10-NEXT:    s_mov_b32 s33, s32
; GFX10-NEXT:    s_add_u32 s32, s32, 0x200
; GFX10-NEXT:    v_writelane_b32 v40, s33, 0
; GFX10-NEXT:    v_writelane_b32 v40, s30, 1
; GFX10-NEXT:    s_getpc_b64 s[4:5]
; GFX10-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX10-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; def s33
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    v_writelane_b32 v40, s31, 2
; GFX10-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; use s33
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    v_readlane_b32 s4, v40, 1
; GFX10-NEXT:    v_readlane_b32 s33, v40, 0
; GFX10-NEXT:    v_readlane_b32 s5, v40, 2
; GFX10-NEXT:    s_sub_u32 s32, s32, 0x200
; GFX10-NEXT:    v_readlane_b32 s33, v40, 3
; GFX10-NEXT:    s_or_saveexec_b32 s6, -1
; GFX10-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s6
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[4:5]
  %s33 = call i32 asm sideeffect "; def $0", "={s33}"()
  call amdgpu_gfx void @external_void_func_void()
  call void asm sideeffect "; use $0", "{s33}"(i32 %s33)
  ret void
}

define amdgpu_gfx void @test_call_void_func_void_preserves_s34(i32 addrspace(1)* %out) #0 {
; GFX9-LABEL: test_call_void_func_void_preserves_s34:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    s_or_saveexec_b64 s[4:5], -1
; GFX9-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX9-NEXT:    s_mov_b64 exec, s[4:5]
; GFX9-NEXT:    v_writelane_b32 v40, s33, 3
; GFX9-NEXT:    s_mov_b32 s33, s32
; GFX9-NEXT:    s_add_u32 s32, s32, 0x400
; GFX9-NEXT:    v_writelane_b32 v40, s34, 0
; GFX9-NEXT:    v_writelane_b32 v40, s30, 1
; GFX9-NEXT:    s_getpc_b64 s[4:5]
; GFX9-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX9-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX9-NEXT:    v_writelane_b32 v40, s31, 2
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; def s34
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX9-NEXT:    v_readlane_b32 s4, v40, 1
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; use s34
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    v_readlane_b32 s5, v40, 2
; GFX9-NEXT:    v_readlane_b32 s34, v40, 0
; GFX9-NEXT:    s_sub_u32 s32, s32, 0x400
; GFX9-NEXT:    v_readlane_b32 s33, v40, 3
; GFX9-NEXT:    s_or_saveexec_b64 s[6:7], -1
; GFX9-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX9-NEXT:    s_mov_b64 exec, s[6:7]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[4:5]
;
; GFX10-LABEL: test_call_void_func_void_preserves_s34:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    s_or_saveexec_b32 s4, -1
; GFX10-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s4
; GFX10-NEXT:    v_writelane_b32 v40, s33, 3
; GFX10-NEXT:    s_mov_b32 s33, s32
; GFX10-NEXT:    s_add_u32 s32, s32, 0x200
; GFX10-NEXT:    v_writelane_b32 v40, s34, 0
; GFX10-NEXT:    v_writelane_b32 v40, s30, 1
; GFX10-NEXT:    s_getpc_b64 s[4:5]
; GFX10-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX10-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; def s34
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    v_writelane_b32 v40, s31, 2
; GFX10-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX10-NEXT:    v_readlane_b32 s4, v40, 1
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; use s34
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    v_readlane_b32 s5, v40, 2
; GFX10-NEXT:    v_readlane_b32 s34, v40, 0
; GFX10-NEXT:    s_sub_u32 s32, s32, 0x200
; GFX10-NEXT:    v_readlane_b32 s33, v40, 3
; GFX10-NEXT:    s_or_saveexec_b32 s6, -1
; GFX10-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s6
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[4:5]
  %s34 = call i32 asm sideeffect "; def $0", "={s34}"()
  call amdgpu_gfx void @external_void_func_void()
  call void asm sideeffect "; use $0", "{s34}"(i32 %s34)
  ret void
}

define amdgpu_gfx void @test_call_void_func_void_preserves_v40(i32 addrspace(1)* %out) #0 {
; GFX9-LABEL: test_call_void_func_void_preserves_v40:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    s_or_saveexec_b64 s[4:5], -1
; GFX9-NEXT:    buffer_store_dword v41, off, s[0:3], s32 offset:4 ; 4-byte Folded Spill
; GFX9-NEXT:    s_mov_b64 exec, s[4:5]
; GFX9-NEXT:    v_writelane_b32 v41, s33, 2
; GFX9-NEXT:    s_mov_b32 s33, s32
; GFX9-NEXT:    v_writelane_b32 v41, s30, 0
; GFX9-NEXT:    s_add_u32 s32, s32, 0x400
; GFX9-NEXT:    buffer_store_dword v40, off, s[0:3], s33 ; 4-byte Folded Spill
; GFX9-NEXT:    s_getpc_b64 s[4:5]
; GFX9-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX9-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX9-NEXT:    v_writelane_b32 v41, s31, 1
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; def v40
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; use v40
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    buffer_load_dword v40, off, s[0:3], s33 ; 4-byte Folded Reload
; GFX9-NEXT:    v_readlane_b32 s4, v41, 0
; GFX9-NEXT:    v_readlane_b32 s5, v41, 1
; GFX9-NEXT:    s_sub_u32 s32, s32, 0x400
; GFX9-NEXT:    v_readlane_b32 s33, v41, 2
; GFX9-NEXT:    s_or_saveexec_b64 s[6:7], -1
; GFX9-NEXT:    buffer_load_dword v41, off, s[0:3], s32 offset:4 ; 4-byte Folded Reload
; GFX9-NEXT:    s_mov_b64 exec, s[6:7]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[4:5]
;
; GFX10-LABEL: test_call_void_func_void_preserves_v40:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    s_or_saveexec_b32 s4, -1
; GFX10-NEXT:    buffer_store_dword v41, off, s[0:3], s32 offset:4 ; 4-byte Folded Spill
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s4
; GFX10-NEXT:    v_writelane_b32 v41, s33, 2
; GFX10-NEXT:    s_mov_b32 s33, s32
; GFX10-NEXT:    v_writelane_b32 v41, s30, 0
; GFX10-NEXT:    s_add_u32 s32, s32, 0x200
; GFX10-NEXT:    buffer_store_dword v40, off, s[0:3], s33 ; 4-byte Folded Spill
; GFX10-NEXT:    s_getpc_b64 s[4:5]
; GFX10-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX10-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; def v40
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    v_writelane_b32 v41, s31, 1
; GFX10-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; use v40
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    buffer_load_dword v40, off, s[0:3], s33 ; 4-byte Folded Reload
; GFX10-NEXT:    v_readlane_b32 s4, v41, 0
; GFX10-NEXT:    v_readlane_b32 s5, v41, 1
; GFX10-NEXT:    s_sub_u32 s32, s32, 0x200
; GFX10-NEXT:    v_readlane_b32 s33, v41, 2
; GFX10-NEXT:    s_or_saveexec_b32 s6, -1
; GFX10-NEXT:    buffer_load_dword v41, off, s[0:3], s32 offset:4 ; 4-byte Folded Reload
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s6
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[4:5]
  %v40 = call i32 asm sideeffect "; def $0", "={v40}"()
  call amdgpu_gfx void @external_void_func_void()
  call void asm sideeffect "; use $0", "{v40}"(i32 %v40)
  ret void
}

define hidden void @void_func_void_clobber_s33() #1 {
; GFX9-LABEL: void_func_void_clobber_s33:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    v_writelane_b32 v0, s33, 0
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; clobber
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    v_readlane_b32 s33, v0, 0
; GFX9-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: void_func_void_clobber_s33:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    v_writelane_b32 v0, s33, 0
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; clobber
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    v_readlane_b32 s33, v0, 0
; GFX10-NEXT:    s_setpc_b64 s[30:31]
  call void asm sideeffect "; clobber", "~{s33}"() #0
  ret void
}

define hidden void @void_func_void_clobber_s34() #1 {
; GFX9-LABEL: void_func_void_clobber_s34:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    v_writelane_b32 v0, s34, 0
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; clobber
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    v_readlane_b32 s34, v0, 0
; GFX9-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: void_func_void_clobber_s34:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    v_writelane_b32 v0, s34, 0
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; clobber
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    v_readlane_b32 s34, v0, 0
; GFX10-NEXT:    s_setpc_b64 s[30:31]
  call void asm sideeffect "; clobber", "~{s34}"() #0
  ret void
}

define amdgpu_gfx void @test_call_void_func_void_clobber_s33() #0 {
; GFX9-LABEL: test_call_void_func_void_clobber_s33:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    s_or_saveexec_b64 s[4:5], -1
; GFX9-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX9-NEXT:    s_mov_b64 exec, s[4:5]
; GFX9-NEXT:    v_writelane_b32 v40, s33, 2
; GFX9-NEXT:    s_mov_b32 s33, s32
; GFX9-NEXT:    v_writelane_b32 v40, s30, 0
; GFX9-NEXT:    s_add_u32 s32, s32, 0x400
; GFX9-NEXT:    s_getpc_b64 s[4:5]
; GFX9-NEXT:    s_add_u32 s4, s4, void_func_void_clobber_s33@rel32@lo+4
; GFX9-NEXT:    s_addc_u32 s5, s5, void_func_void_clobber_s33@rel32@hi+12
; GFX9-NEXT:    v_writelane_b32 v40, s31, 1
; GFX9-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX9-NEXT:    v_readlane_b32 s4, v40, 0
; GFX9-NEXT:    v_readlane_b32 s5, v40, 1
; GFX9-NEXT:    s_sub_u32 s32, s32, 0x400
; GFX9-NEXT:    v_readlane_b32 s33, v40, 2
; GFX9-NEXT:    s_or_saveexec_b64 s[6:7], -1
; GFX9-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX9-NEXT:    s_mov_b64 exec, s[6:7]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[4:5]
;
; GFX10-LABEL: test_call_void_func_void_clobber_s33:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    s_or_saveexec_b32 s4, -1
; GFX10-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s4
; GFX10-NEXT:    v_writelane_b32 v40, s33, 2
; GFX10-NEXT:    s_mov_b32 s33, s32
; GFX10-NEXT:    v_writelane_b32 v40, s30, 0
; GFX10-NEXT:    s_add_u32 s32, s32, 0x200
; GFX10-NEXT:    s_getpc_b64 s[4:5]
; GFX10-NEXT:    s_add_u32 s4, s4, void_func_void_clobber_s33@rel32@lo+4
; GFX10-NEXT:    s_addc_u32 s5, s5, void_func_void_clobber_s33@rel32@hi+12
; GFX10-NEXT:    v_writelane_b32 v40, s31, 1
; GFX10-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX10-NEXT:    v_readlane_b32 s4, v40, 0
; GFX10-NEXT:    v_readlane_b32 s5, v40, 1
; GFX10-NEXT:    s_sub_u32 s32, s32, 0x200
; GFX10-NEXT:    v_readlane_b32 s33, v40, 2
; GFX10-NEXT:    s_or_saveexec_b32 s6, -1
; GFX10-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s6
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[4:5]
  call amdgpu_gfx void @void_func_void_clobber_s33()
  ret void
}

define amdgpu_gfx void @test_call_void_func_void_clobber_s34() #0 {
; GFX9-LABEL: test_call_void_func_void_clobber_s34:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    s_or_saveexec_b64 s[4:5], -1
; GFX9-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX9-NEXT:    s_mov_b64 exec, s[4:5]
; GFX9-NEXT:    v_writelane_b32 v40, s33, 2
; GFX9-NEXT:    s_mov_b32 s33, s32
; GFX9-NEXT:    v_writelane_b32 v40, s30, 0
; GFX9-NEXT:    s_add_u32 s32, s32, 0x400
; GFX9-NEXT:    s_getpc_b64 s[4:5]
; GFX9-NEXT:    s_add_u32 s4, s4, void_func_void_clobber_s34@rel32@lo+4
; GFX9-NEXT:    s_addc_u32 s5, s5, void_func_void_clobber_s34@rel32@hi+12
; GFX9-NEXT:    v_writelane_b32 v40, s31, 1
; GFX9-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX9-NEXT:    v_readlane_b32 s4, v40, 0
; GFX9-NEXT:    v_readlane_b32 s5, v40, 1
; GFX9-NEXT:    s_sub_u32 s32, s32, 0x400
; GFX9-NEXT:    v_readlane_b32 s33, v40, 2
; GFX9-NEXT:    s_or_saveexec_b64 s[6:7], -1
; GFX9-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX9-NEXT:    s_mov_b64 exec, s[6:7]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[4:5]
;
; GFX10-LABEL: test_call_void_func_void_clobber_s34:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    s_or_saveexec_b32 s4, -1
; GFX10-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s4
; GFX10-NEXT:    v_writelane_b32 v40, s33, 2
; GFX10-NEXT:    s_mov_b32 s33, s32
; GFX10-NEXT:    v_writelane_b32 v40, s30, 0
; GFX10-NEXT:    s_add_u32 s32, s32, 0x200
; GFX10-NEXT:    s_getpc_b64 s[4:5]
; GFX10-NEXT:    s_add_u32 s4, s4, void_func_void_clobber_s34@rel32@lo+4
; GFX10-NEXT:    s_addc_u32 s5, s5, void_func_void_clobber_s34@rel32@hi+12
; GFX10-NEXT:    v_writelane_b32 v40, s31, 1
; GFX10-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX10-NEXT:    v_readlane_b32 s4, v40, 0
; GFX10-NEXT:    v_readlane_b32 s5, v40, 1
; GFX10-NEXT:    s_sub_u32 s32, s32, 0x200
; GFX10-NEXT:    v_readlane_b32 s33, v40, 2
; GFX10-NEXT:    s_or_saveexec_b32 s6, -1
; GFX10-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s6
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[4:5]
  call amdgpu_gfx void @void_func_void_clobber_s34()
  ret void
}

define amdgpu_gfx void @callee_saved_sgpr_kernel() #1 {
; GFX9-LABEL: callee_saved_sgpr_kernel:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    s_or_saveexec_b64 s[4:5], -1
; GFX9-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX9-NEXT:    s_mov_b64 exec, s[4:5]
; GFX9-NEXT:    v_writelane_b32 v40, s33, 3
; GFX9-NEXT:    s_mov_b32 s33, s32
; GFX9-NEXT:    s_add_u32 s32, s32, 0x400
; GFX9-NEXT:    v_writelane_b32 v40, s40, 0
; GFX9-NEXT:    v_writelane_b32 v40, s30, 1
; GFX9-NEXT:    s_getpc_b64 s[4:5]
; GFX9-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX9-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX9-NEXT:    v_writelane_b32 v40, s31, 2
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; def s40
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX9-NEXT:    v_readlane_b32 s4, v40, 1
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; use s40
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    v_readlane_b32 s5, v40, 2
; GFX9-NEXT:    v_readlane_b32 s40, v40, 0
; GFX9-NEXT:    s_sub_u32 s32, s32, 0x400
; GFX9-NEXT:    v_readlane_b32 s33, v40, 3
; GFX9-NEXT:    s_or_saveexec_b64 s[6:7], -1
; GFX9-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX9-NEXT:    s_mov_b64 exec, s[6:7]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[4:5]
;
; GFX10-LABEL: callee_saved_sgpr_kernel:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    s_or_saveexec_b32 s4, -1
; GFX10-NEXT:    buffer_store_dword v40, off, s[0:3], s32 ; 4-byte Folded Spill
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s4
; GFX10-NEXT:    v_writelane_b32 v40, s33, 3
; GFX10-NEXT:    s_mov_b32 s33, s32
; GFX10-NEXT:    s_add_u32 s32, s32, 0x200
; GFX10-NEXT:    v_writelane_b32 v40, s40, 0
; GFX10-NEXT:    v_writelane_b32 v40, s30, 1
; GFX10-NEXT:    s_getpc_b64 s[4:5]
; GFX10-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX10-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; def s40
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    v_writelane_b32 v40, s31, 2
; GFX10-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX10-NEXT:    v_readlane_b32 s4, v40, 1
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; use s40
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    v_readlane_b32 s5, v40, 2
; GFX10-NEXT:    v_readlane_b32 s40, v40, 0
; GFX10-NEXT:    s_sub_u32 s32, s32, 0x200
; GFX10-NEXT:    v_readlane_b32 s33, v40, 3
; GFX10-NEXT:    s_or_saveexec_b32 s6, -1
; GFX10-NEXT:    buffer_load_dword v40, off, s[0:3], s32 ; 4-byte Folded Reload
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s6
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[4:5]
  %s40 = call i32 asm sideeffect "; def s40", "={s40}"() #0
  call amdgpu_gfx void @external_void_func_void()
  call void asm sideeffect "; use $0", "s"(i32 %s40) #0
  ret void
}

define amdgpu_gfx void @callee_saved_sgpr_vgpr_kernel() #1 {
; GFX9-LABEL: callee_saved_sgpr_vgpr_kernel:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    s_or_saveexec_b64 s[4:5], -1
; GFX9-NEXT:    buffer_store_dword v41, off, s[0:3], s32 offset:4 ; 4-byte Folded Spill
; GFX9-NEXT:    s_mov_b64 exec, s[4:5]
; GFX9-NEXT:    v_writelane_b32 v41, s33, 3
; GFX9-NEXT:    s_mov_b32 s33, s32
; GFX9-NEXT:    s_add_u32 s32, s32, 0x400
; GFX9-NEXT:    buffer_store_dword v40, off, s[0:3], s33 ; 4-byte Folded Spill
; GFX9-NEXT:    v_writelane_b32 v41, s40, 0
; GFX9-NEXT:    v_writelane_b32 v41, s30, 1
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; def s40
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; def v32
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    s_getpc_b64 s[4:5]
; GFX9-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX9-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX9-NEXT:    v_writelane_b32 v41, s31, 2
; GFX9-NEXT:    v_mov_b32_e32 v40, v32
; GFX9-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; use s40
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    ;;#ASMSTART
; GFX9-NEXT:    ; use v40
; GFX9-NEXT:    ;;#ASMEND
; GFX9-NEXT:    buffer_load_dword v40, off, s[0:3], s33 ; 4-byte Folded Reload
; GFX9-NEXT:    v_readlane_b32 s4, v41, 1
; GFX9-NEXT:    v_readlane_b32 s5, v41, 2
; GFX9-NEXT:    v_readlane_b32 s40, v41, 0
; GFX9-NEXT:    s_sub_u32 s32, s32, 0x400
; GFX9-NEXT:    v_readlane_b32 s33, v41, 3
; GFX9-NEXT:    s_or_saveexec_b64 s[6:7], -1
; GFX9-NEXT:    buffer_load_dword v41, off, s[0:3], s32 offset:4 ; 4-byte Folded Reload
; GFX9-NEXT:    s_mov_b64 exec, s[6:7]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[4:5]
;
; GFX10-LABEL: callee_saved_sgpr_vgpr_kernel:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    s_or_saveexec_b32 s4, -1
; GFX10-NEXT:    buffer_store_dword v41, off, s[0:3], s32 offset:4 ; 4-byte Folded Spill
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s4
; GFX10-NEXT:    v_writelane_b32 v41, s33, 3
; GFX10-NEXT:    s_mov_b32 s33, s32
; GFX10-NEXT:    s_add_u32 s32, s32, 0x200
; GFX10-NEXT:    buffer_store_dword v40, off, s[0:3], s33 ; 4-byte Folded Spill
; GFX10-NEXT:    v_writelane_b32 v41, s40, 0
; GFX10-NEXT:    v_writelane_b32 v41, s30, 1
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; def s40
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; def v32
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    s_getpc_b64 s[4:5]
; GFX10-NEXT:    s_add_u32 s4, s4, external_void_func_void@rel32@lo+4
; GFX10-NEXT:    s_addc_u32 s5, s5, external_void_func_void@rel32@hi+12
; GFX10-NEXT:    v_mov_b32_e32 v40, v32
; GFX10-NEXT:    v_writelane_b32 v41, s31, 2
; GFX10-NEXT:    s_swappc_b64 s[30:31], s[4:5]
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; use s40
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    ;;#ASMSTART
; GFX10-NEXT:    ; use v40
; GFX10-NEXT:    ;;#ASMEND
; GFX10-NEXT:    buffer_load_dword v40, off, s[0:3], s33 ; 4-byte Folded Reload
; GFX10-NEXT:    v_readlane_b32 s4, v41, 1
; GFX10-NEXT:    v_readlane_b32 s5, v41, 2
; GFX10-NEXT:    v_readlane_b32 s40, v41, 0
; GFX10-NEXT:    s_sub_u32 s32, s32, 0x200
; GFX10-NEXT:    v_readlane_b32 s33, v41, 3
; GFX10-NEXT:    s_or_saveexec_b32 s6, -1
; GFX10-NEXT:    buffer_load_dword v41, off, s[0:3], s32 offset:4 ; 4-byte Folded Reload
; GFX10-NEXT:    s_waitcnt_depctr 0xffe3
; GFX10-NEXT:    s_mov_b32 exec_lo, s6
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[4:5]
  %s40 = call i32 asm sideeffect "; def s40", "={s40}"() #0
  %v32 = call i32 asm sideeffect "; def v32", "={v32}"() #0
  call amdgpu_gfx void @external_void_func_void()
  call void asm sideeffect "; use $0", "s"(i32 %s40) #0
  call void asm sideeffect "; use $0", "v"(i32 %v32) #0
  ret void
}

attributes #0 = { nounwind }
attributes #1 = { nounwind noinline }
