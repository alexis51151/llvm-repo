; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -O3 -S                                        | FileCheck %s
; RUN: opt < %s -passes='default<O3>' -aa-pipeline=default -S | FileCheck %s

; This is based on the following most basic C++ code:
;
; struct S {
;     int* data;
;     int x, y, z;
; };
;
; S gen(S a) {
;     S b;
;     b.data = a.data;
;     return b;
; }
;
; void escape0(S);
;
; int* foo(S a) {
;     S b = gen(a);
;     escape0(b);
;     return b.data;
; }
;
; int cond();
; void sync0();
; void sync1();
; void escape0(int*);
; void escape1(int*);
;
; int* bar(S a) {
;     S b = gen(a);
;     if(cond()) {
;         sync0();
;         escape0(b.data);
;     } else {
;         sync1();
;         escape1(b.data);
;     }
;     return b.data;
; }
;
; There are no inttoptr casts in the original source code, nor should there be any in the optimized IR.

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"

%0 = type { i32*, i32, i32, i32 }

define dso_local void @_Z3gen1S(%0* noalias sret(%0) align 8 %arg, %0* byval(%0) align 8 %arg1) {
; CHECK-LABEL: @_Z3gen1S(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    [[TMP0:%.*]] = bitcast %0* [[ARG1:%.*]] to i64*
; CHECK-NEXT:    [[I21:%.*]] = load i64, i64* [[TMP0]], align 8
; CHECK-NEXT:    [[TMP1:%.*]] = bitcast %0* [[ARG:%.*]] to i64*
; CHECK-NEXT:    store i64 [[I21]], i64* [[TMP1]], align 8
; CHECK-NEXT:    ret void
;
bb:
  %i = getelementptr inbounds %0, %0* %arg1, i32 0, i32 0
  %i2 = load i32*, i32** %i, align 8
  %i3 = getelementptr inbounds %0, %0* %arg, i32 0, i32 0
  store i32* %i2, i32** %i3, align 8
  ret void
}

define dso_local i32* @_Z3foo1S(%0* byval(%0) align 8 %arg) {
; CHECK-LABEL: @_Z3foo1S(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    [[I2:%.*]] = alloca [[TMP0:%.*]], align 8
; CHECK-NEXT:    [[I1_SROA_0_0_I5_SROA_CAST:%.*]] = bitcast %0* [[ARG:%.*]] to i64*
; CHECK-NEXT:    [[I1_SROA_0_0_COPYLOAD:%.*]] = load i64, i64* [[I1_SROA_0_0_I5_SROA_CAST]], align 8
; CHECK-NEXT:    [[TMP0]] = inttoptr i64 [[I1_SROA_0_0_COPYLOAD]] to i32*
; CHECK-NEXT:    [[I_SROA_0_0_I6_SROA_IDX:%.*]] = getelementptr inbounds [[TMP0]], %0* [[I2]], i64 0, i32 0
; CHECK-NEXT:    store i32* [[TMP0]], i32** [[I_SROA_0_0_I6_SROA_IDX]], align 8
; CHECK-NEXT:    tail call void @_Z7escape01S(%0* nonnull byval(%0) align 8 [[I2]])
; CHECK-NEXT:    ret i32* [[TMP0]]
;
bb:
  %i = alloca %0, align 8
  %i1 = alloca %0, align 8
  %i2 = alloca %0, align 8
  %i3 = bitcast %0* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %i3)
  %i4 = bitcast %0* %i1 to i8*
  %i5 = bitcast %0* %arg to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %i4, i8* align 8 %i5, i64 24, i1 false)
  call void @_Z3gen1S(%0* sret(%0) align 8 %i, %0* byval(%0) align 8 %i1)
  %i6 = bitcast %0* %i2 to i8*
  %i7 = bitcast %0* %i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %i6, i8* align 8 %i7, i64 24, i1 false)
  call void @_Z7escape01S(%0* byval(%0) align 8 %i2)
  %i8 = getelementptr inbounds %0, %0* %i, i32 0, i32 0
  %i9 = load i32*, i32** %i8, align 8
  %i10 = bitcast %0* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %i10)
  ret i32* %i9
}

declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg)

declare dso_local void @_Z7escape01S(%0* byval(%0) align 8)

declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)

define dso_local i32* @_Z3bar1S(%0* byval(%0) align 8 %arg) {
; CHECK-LABEL: @_Z3bar1S(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    [[I1_SROA_0_0_I4_SROA_CAST:%.*]] = bitcast %0* [[ARG:%.*]] to i64*
; CHECK-NEXT:    [[I1_SROA_0_0_COPYLOAD:%.*]] = load i64, i64* [[I1_SROA_0_0_I4_SROA_CAST]], align 8
; CHECK-NEXT:    [[TMP0:%.*]] = inttoptr i64 [[I1_SROA_0_0_COPYLOAD]] to i32*
; CHECK-NEXT:    [[I5:%.*]] = tail call i32 @_Z4condv()
; CHECK-NEXT:    [[I6_NOT:%.*]] = icmp eq i32 [[I5]], 0
; CHECK-NEXT:    br i1 [[I6_NOT]], label [[BB10:%.*]], label [[BB7:%.*]]
; CHECK:       bb7:
; CHECK-NEXT:    tail call void @_Z5sync0v()
; CHECK-NEXT:    tail call void @_Z7escape0Pi(i32* [[TMP0]])
; CHECK-NEXT:    br label [[BB13:%.*]]
; CHECK:       bb10:
; CHECK-NEXT:    tail call void @_Z5sync1v()
; CHECK-NEXT:    tail call void @_Z7escape1Pi(i32* [[TMP0]])
; CHECK-NEXT:    br label [[BB13]]
; CHECK:       bb13:
; CHECK-NEXT:    ret i32* [[TMP0]]
;
bb:
  %i = alloca %0, align 8
  %i1 = alloca %0, align 8
  %i2 = bitcast %0* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %i2)
  %i3 = bitcast %0* %i1 to i8*
  %i4 = bitcast %0* %arg to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %i3, i8* align 8 %i4, i64 24, i1 false)
  call void @_Z3gen1S(%0* sret(%0) align 8 %i, %0* byval(%0) align 8 %i1)
  %i5 = call i32 @_Z4condv()
  %i6 = icmp ne i32 %i5, 0
  br i1 %i6, label %bb7, label %bb10

bb7:
  call void @_Z5sync0v()
  %i8 = getelementptr inbounds %0, %0* %i, i32 0, i32 0
  %i9 = load i32*, i32** %i8, align 8
  call void @_Z7escape0Pi(i32* %i9)
  br label %bb13

bb10:
  call void @_Z5sync1v()
  %i11 = getelementptr inbounds %0, %0* %i, i32 0, i32 0
  %i12 = load i32*, i32** %i11, align 8
  call void @_Z7escape1Pi(i32* %i12)
  br label %bb13

bb13:
  %i14 = getelementptr inbounds %0, %0* %i, i32 0, i32 0
  %i15 = load i32*, i32** %i14, align 8
  %i16 = bitcast %0* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %i16)
  ret i32* %i15
}

declare dso_local i32 @_Z4condv()
declare dso_local void @_Z5sync0v()
declare dso_local void @_Z7escape0Pi(i32*)
declare dso_local void @_Z5sync1v()
declare dso_local void @_Z7escape1Pi(i32*)
