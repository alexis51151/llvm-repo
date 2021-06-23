; RUN: opt < %s -mtriple=x86_64-- -inferattrs -S | FileCheck -check-prefix=CHECK-UNKNOWN %s
; RUN: opt < %s -mtriple=x86_64-- -passes=inferattrs -S | FileCheck -check-prefix=CHECK-UNKNOWN %s
; RUN: opt < %s -mtriple=x86_64-apple-macosx10.8.0 -inferattrs -S | FileCheck -check-prefix=CHECK -check-prefix=CHECK-DARWIN %s
; RUN: opt < %s -mtriple=x86_64-unknown-linux-gnu -inferattrs -S | FileCheck -check-prefix=CHECK -check-prefix=CHECK-LINUX %s
; RUN: opt < %s -mtriple=nvptx -inferattrs -S | FileCheck -check-prefix=CHECK-NVPTX %s

; operator new routines
declare i8* @_Znwj(i64 )
; CHECK: declare noalias noundef nonnull i8* @_Znwj(i64) [[NOFREE:#[0-9]+]]
declare i8* @_Znwm(i64)
; CHECK: declare noalias noundef nonnull i8* @_Znwm(i64) [[NOFREE]]

declare i32 @__nvvm_reflect(i8*)
; CHECK-NVPTX: declare noundef i32 @__nvvm_reflect(i8* noundef) [[NOFREE:#[0-9]+]]
; CHECK-NVPTX: attributes [[NOFREE]] = { nofree nounwind readnone }


; Check all the libc functions (thereby also exercising the prototype check).
; Note that it's OK to modify these as attributes might be missing. These checks
; reflect the currently inferred attributes.

; Use an opaque pointer type for all the (possibly opaque) structs.
%opaque = type opaque

; CHECK: declare double @__acos_finite(double)
declare double @__acos_finite(double)

; CHECK: declare float @__acosf_finite(float)
declare float @__acosf_finite(float)

; CHECK: declare double @__acosh_finite(double)
declare double @__acosh_finite(double)

; CHECK: declare float @__acoshf_finite(float)
declare float @__acoshf_finite(float)

; CHECK: declare x86_fp80 @__acoshl_finite(x86_fp80)
declare x86_fp80 @__acoshl_finite(x86_fp80)

; CHECK: declare x86_fp80 @__acosl_finite(x86_fp80)
declare x86_fp80 @__acosl_finite(x86_fp80)

; CHECK: declare double @__asin_finite(double)
declare double @__asin_finite(double)

; CHECK: declare float @__asinf_finite(float)
declare float @__asinf_finite(float)

; CHECK: declare x86_fp80 @__asinl_finite(x86_fp80)
declare x86_fp80 @__asinl_finite(x86_fp80)

; CHECK: declare double @__atan2_finite(double, double)
declare double @__atan2_finite(double, double)

; CHECK: declare float @__atan2f_finite(float, float)
declare float @__atan2f_finite(float, float)

; CHECK: declare x86_fp80 @__atan2l_finite(x86_fp80, x86_fp80)
declare x86_fp80 @__atan2l_finite(x86_fp80, x86_fp80)

; CHECK: declare double @__atanh_finite(double)
declare double @__atanh_finite(double)

; CHECK: declare float @__atanhf_finite(float)
declare float @__atanhf_finite(float)

; CHECK: declare x86_fp80 @__atanhl_finite(x86_fp80)
declare x86_fp80 @__atanhl_finite(x86_fp80)

; CHECK: declare double @__cosh_finite(double)
declare double @__cosh_finite(double)

; CHECK: declare float @__coshf_finite(float)
declare float @__coshf_finite(float)

; CHECK: declare x86_fp80 @__coshl_finite(x86_fp80)
declare x86_fp80 @__coshl_finite(x86_fp80)

; CHECK: declare double @__cospi(double)
declare double @__cospi(double)

; CHECK: declare float @__cospif(float)
declare float @__cospif(float)

; CHECK: declare double @__exp10_finite(double)
declare double @__exp10_finite(double)

; CHECK: declare float @__exp10f_finite(float)
declare float @__exp10f_finite(float)

; CHECK: declare x86_fp80 @__exp10l_finite(x86_fp80)
declare x86_fp80 @__exp10l_finite(x86_fp80)

; CHECK: declare double @__exp2_finite(double)
declare double @__exp2_finite(double)

; CHECK: declare float @__exp2f_finite(float)
declare float @__exp2f_finite(float)

; CHECK: declare x86_fp80 @__exp2l_finite(x86_fp80)
declare x86_fp80 @__exp2l_finite(x86_fp80)

; CHECK: declare double @__exp_finite(double)
declare double @__exp_finite(double)

; CHECK: declare float @__expf_finite(float)
declare float @__expf_finite(float)

; CHECK: declare x86_fp80 @__expl_finite(x86_fp80)
declare x86_fp80 @__expl_finite(x86_fp80)

; CHECK: declare double @__log10_finite(double)
declare double @__log10_finite(double)

; CHECK: declare float @__log10f_finite(float)
declare float @__log10f_finite(float)

; CHECK: declare x86_fp80 @__log10l_finite(x86_fp80)
declare x86_fp80 @__log10l_finite(x86_fp80)

; CHECK: declare double @__log2_finite(double)
declare double @__log2_finite(double)

; CHECK: declare float @__log2f_finite(float)
declare float @__log2f_finite(float)

; CHECK: declare x86_fp80 @__log2l_finite(x86_fp80)
declare x86_fp80 @__log2l_finite(x86_fp80)

; CHECK: declare double @__log_finite(double)
declare double @__log_finite(double)

; CHECK: declare float @__logf_finite(float)
declare float @__logf_finite(float)

; CHECK: declare x86_fp80 @__logl_finite(x86_fp80)
declare x86_fp80 @__logl_finite(x86_fp80)

; CHECK: declare double @__pow_finite(double, double)
declare double @__pow_finite(double, double)

; CHECK: declare float @__powf_finite(float, float)
declare float @__powf_finite(float, float)

; CHECK: declare x86_fp80 @__powl_finite(x86_fp80, x86_fp80)
declare x86_fp80 @__powl_finite(x86_fp80, x86_fp80)

; CHECK: declare double @__sinh_finite(double)
declare double @__sinh_finite(double)

; CHECK: declare float @__sinhf_finite(float)
declare float @__sinhf_finite(float)

; CHECK: declare x86_fp80 @__sinhl_finite(x86_fp80)
declare x86_fp80 @__sinhl_finite(x86_fp80)

; CHECK: declare double @__sinpi(double)
declare double @__sinpi(double)

; CHECK: declare float @__sinpif(float)
declare float @__sinpif(float)

; CHECK: declare i32 @abs(i32) [[NOFREE]]
declare i32 @abs(i32)

; CHECK: declare noundef i32 @access(i8* nocapture noundef readonly, i32 noundef) [[NOFREE_NOUNWIND:#[0-9]+]]
declare i32 @access(i8*, i32)

; CHECK: declare double @acos(double) [[NOFREE]]
declare double @acos(double)

; CHECK: declare float @acosf(float) [[NOFREE]]
declare float @acosf(float)

; CHECK: declare double @acosh(double) [[NOFREE]]
declare double @acosh(double)

; CHECK: declare float @acoshf(float) [[NOFREE]]
declare float @acoshf(float)

; CHECK: declare x86_fp80 @acoshl(x86_fp80) [[NOFREE]]
declare x86_fp80 @acoshl(x86_fp80)

; CHECK: declare x86_fp80 @acosl(x86_fp80) [[NOFREE]]
declare x86_fp80 @acosl(x86_fp80)

; CHECK: declare double @asin(double) [[NOFREE]]
declare double @asin(double)

; CHECK: declare float @asinf(float) [[NOFREE]]
declare float @asinf(float)

; CHECK: declare double @asinh(double) [[NOFREE]]
declare double @asinh(double)

; CHECK: declare float @asinhf(float) [[NOFREE]]
declare float @asinhf(float)

; CHECK: declare x86_fp80 @asinhl(x86_fp80) [[NOFREE]]
declare x86_fp80 @asinhl(x86_fp80)

; CHECK: declare x86_fp80 @asinl(x86_fp80) [[NOFREE]]
declare x86_fp80 @asinl(x86_fp80)

; CHECK: declare double @atan(double) [[NOFREE]]
declare double @atan(double)

; CHECK: declare double @atan2(double, double) [[NOFREE]]
declare double @atan2(double, double)

; CHECK: declare float @atan2f(float, float) [[NOFREE]]
declare float @atan2f(float, float)

; CHECK: declare x86_fp80 @atan2l(x86_fp80, x86_fp80) [[NOFREE]]
declare x86_fp80 @atan2l(x86_fp80, x86_fp80)

; CHECK: declare float @atanf(float) [[NOFREE]]
declare float @atanf(float)

; CHECK: declare double @atanh(double) [[NOFREE]]
declare double @atanh(double)

; CHECK: declare float @atanhf(float) [[NOFREE]]
declare float @atanhf(float)

; CHECK: declare x86_fp80 @atanhl(x86_fp80) [[NOFREE]]
declare x86_fp80 @atanhl(x86_fp80)

; CHECK: declare x86_fp80 @atanl(x86_fp80) [[NOFREE]]
declare x86_fp80 @atanl(x86_fp80)

; CHECK: declare double @atof(i8* nocapture) [[NOFREE_NOUNWIND_READONLY:#[0-9]+]]
declare double @atof(i8*)

; CHECK: declare i32 @atoi(i8* nocapture) [[NOFREE_NOUNWIND_READONLY]]
declare i32 @atoi(i8*)

; CHECK: declare i64 @atol(i8* nocapture) [[NOFREE_NOUNWIND_READONLY]]
declare i64 @atol(i8*)

; CHECK: declare i64 @atoll(i8* nocapture) [[NOFREE_NOUNWIND_READONLY]]
declare i64 @atoll(i8*)

; CHECK-LINUX: declare i32 @bcmp(i8* nocapture, i8* nocapture, i64) [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY:#[0-9]+]]
; CHECK-DARWIN-NOT: declare i32 @bcmp(i8* nocapture, i8* nocapture, i64) [[NOFREE_NOUNWIND_READONLY]]
; CHECK-UNKNOWN-NOT: declare i32 @bcmp(i8* nocapture, i8* nocapture, i64) [[NOFREE_NOUNWIND_READONLY]]
; CHECK-NVPTX-NOT: declare i32 @bcmp(i8* nocapture, i8* nocapture, i64) [[NOFREE_NOUNWIND_READONLY]]
declare i32 @bcmp(i8*, i8*, i64)

; CHECK: declare void @bcopy(i8* nocapture readonly, i8* nocapture writeonly, i64)  [[ARGMEMONLY_NOFREE_NOUNWIND:#[0-9]+]]
declare void @bcopy(i8*, i8*, i64)

; CHECK: declare void @bzero(i8* nocapture writeonly, i64)  [[ARGMEMONLY_NOFREE_NOUNWIND:#[0-9]+]]
declare void @bzero(i8*, i64)

; CHECK: declare noalias noundef i8* @calloc(i64, i64) [[NOFREE_NOUNWIND]]
declare i8* @calloc(i64, i64)

; CHECK: declare double @cbrt(double) [[NOFREE]]
declare double @cbrt(double)

; CHECK: declare float @cbrtf(float) [[NOFREE]]
declare float @cbrtf(float)

; CHECK: declare x86_fp80 @cbrtl(x86_fp80) [[NOFREE]]
declare x86_fp80 @cbrtl(x86_fp80)

; CHECK: declare double @ceil(double) [[NOFREE]]
declare double @ceil(double)

; CHECK: declare float @ceilf(float) [[NOFREE]]
declare float @ceilf(float)

; CHECK: declare x86_fp80 @ceill(x86_fp80) [[NOFREE]]
declare x86_fp80 @ceill(x86_fp80)

; CHECK: declare noundef i32 @chmod(i8* nocapture noundef readonly, i16 noundef zeroext) [[NOFREE_NOUNWIND]]
declare i32 @chmod(i8*, i16 zeroext)

; CHECK: declare noundef i32 @chown(i8* nocapture noundef readonly, i32 noundef, i32 noundef) [[NOFREE_NOUNWIND]]
declare i32 @chown(i8*, i32, i32)

; CHECK: declare void @clearerr(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare void @clearerr(%opaque*)

; CHECK: declare noundef i32 @closedir(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @closedir(%opaque*)

; CHECK: declare double @copysign(double, double) [[NOFREE]]
declare double @copysign(double, double)

; CHECK: declare float @copysignf(float, float) [[NOFREE]]
declare float @copysignf(float, float)

; CHECK: declare x86_fp80 @copysignl(x86_fp80, x86_fp80) [[NOFREE]]
declare x86_fp80 @copysignl(x86_fp80, x86_fp80)

; CHECK: declare double @cos(double) [[NOFREE]]
declare double @cos(double)

; CHECK: declare float @cosf(float) [[NOFREE]]
declare float @cosf(float)

; CHECK: declare double @cosh(double) [[NOFREE]]
declare double @cosh(double)

; CHECK: declare float @coshf(float) [[NOFREE]]
declare float @coshf(float)

; CHECK: declare x86_fp80 @coshl(x86_fp80) [[NOFREE]]
declare x86_fp80 @coshl(x86_fp80)

; CHECK: declare x86_fp80 @cosl(x86_fp80) [[NOFREE]]
declare x86_fp80 @cosl(x86_fp80)

; CHECK: declare noundef i8* @ctermid(i8* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i8* @ctermid(i8*)

; CHECK: declare double @exp(double) [[NOFREE]]
declare double @exp(double)

; CHECK: declare double @exp2(double) [[NOFREE]]
declare double @exp2(double)

; CHECK: declare float @exp2f(float) [[NOFREE]]
declare float @exp2f(float)

; CHECK: declare x86_fp80 @exp2l(x86_fp80) [[NOFREE]]
declare x86_fp80 @exp2l(x86_fp80)

; CHECK: declare float @expf(float) [[NOFREE]]
declare float @expf(float)

; CHECK: declare x86_fp80 @expl(x86_fp80) [[NOFREE]]
declare x86_fp80 @expl(x86_fp80)

; CHECK: declare double @expm1(double) [[NOFREE]]
declare double @expm1(double)

; CHECK: declare float @expm1f(float) [[NOFREE]]
declare float @expm1f(float)

; CHECK: declare x86_fp80 @expm1l(x86_fp80) [[NOFREE]]
declare x86_fp80 @expm1l(x86_fp80)

; CHECK: declare double @fabs(double) [[NOFREE]]
declare double @fabs(double)

; CHECK: declare float @fabsf(float) [[NOFREE]]
declare float @fabsf(float)

; CHECK: declare x86_fp80 @fabsl(x86_fp80) [[NOFREE]]
declare x86_fp80 @fabsl(x86_fp80)

; CHECK: declare noundef i32 @fclose(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @fclose(%opaque*)

; CHECK: declare noalias noundef %opaque* @fdopen(i32 noundef, i8* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare %opaque* @fdopen(i32, i8*)

; CHECK: declare noundef i32 @feof(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @feof(%opaque*)

; CHECK: declare noundef i32 @ferror(%opaque* nocapture noundef) [[NOFREE_NOUNWIND_READONLY]]
declare i32 @ferror(%opaque*)

; CHECK: declare noundef i32 @fflush(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @fflush(%opaque*)

; CHECK: declare i32 @ffs(i32) [[NOFREE]]
declare i32 @ffs(i32)

; CHECK: declare i32 @ffsl(i64) [[NOFREE]]
declare i32 @ffsl(i64)

; CHECK: declare i32 @ffsll(i64) [[NOFREE]]
declare i32 @ffsll(i64)

; CHECK: declare noundef i32 @fgetc(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @fgetc(%opaque*)

; CHECK: declare noundef i32 @fgetpos(%opaque* nocapture noundef, i64* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @fgetpos(%opaque*, i64*)

; CHECK: declare noundef i8* @fgets(i8* noundef, i32 noundef, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i8* @fgets(i8*, i32, %opaque*)

; CHECK: declare noundef i32 @fileno(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @fileno(%opaque*)

; CHECK: declare void @flockfile(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare void @flockfile(%opaque*)

; CHECK: declare double @floor(double) [[NOFREE]]
declare double @floor(double)

; CHECK: declare float @floorf(float) [[NOFREE]]
declare float @floorf(float)

; CHECK: declare x86_fp80 @floorl(x86_fp80) [[NOFREE]]
declare x86_fp80 @floorl(x86_fp80)

; CHECK: declare i32 @fls(i32)
declare i32 @fls(i32)

; CHECK: declare i32 @flsl(i64)
declare i32 @flsl(i64)

; CHECK: declare i32 @flsll(i64)
declare i32 @flsll(i64)

; CHECK: declare double @fmax(double, double) [[NOFREE]]
declare double @fmax(double, double)

; CHECK: declare float @fmaxf(float, float) [[NOFREE]]
declare float @fmaxf(float, float)

; CHECK: declare x86_fp80 @fmaxl(x86_fp80, x86_fp80) [[NOFREE]]
declare x86_fp80 @fmaxl(x86_fp80, x86_fp80)

; CHECK: declare double @fmin(double, double) [[NOFREE]]
declare double @fmin(double, double)

; CHECK: declare float @fminf(float, float) [[NOFREE]]
declare float @fminf(float, float)

; CHECK: declare x86_fp80 @fminl(x86_fp80, x86_fp80) [[NOFREE]]
declare x86_fp80 @fminl(x86_fp80, x86_fp80)

; CHECK: declare double @fmod(double, double) [[NOFREE]]
declare double @fmod(double, double)

; CHECK: declare float @fmodf(float, float) [[NOFREE]]
declare float @fmodf(float, float)

; CHECK: declare x86_fp80 @fmodl(x86_fp80, x86_fp80) [[NOFREE]]
declare x86_fp80 @fmodl(x86_fp80, x86_fp80)

; CHECK: declare noalias noundef %opaque* @fopen(i8* nocapture noundef readonly, i8* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare %opaque* @fopen(i8*, i8*)

; CHECK: declare noundef i32 @fprintf(%opaque* nocapture noundef, i8* nocapture noundef readonly, ...) [[NOFREE_NOUNWIND]]
declare i32 @fprintf(%opaque*, i8*, ...)

; CHECK: declare noundef i32 @fputc(i32 noundef, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @fputc(i32, %opaque*)

; CHECK: declare noundef i32 @fputs(i8* nocapture noundef readonly, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @fputs(i8*, %opaque*)

; CHECK: declare noundef i64 @fread(i8* nocapture noundef, i64 noundef, i64 noundef, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i64 @fread(i8*, i64, i64, %opaque*)

; CHECK: declare void @free(i8* nocapture noundef) [[NOUNWIND:#[0-9]+]]
declare void @free(i8*)

; CHECK: declare double @frexp(double, i32* nocapture) [[NOFREE_NOUNWIND]]
declare double @frexp(double, i32*)

; CHECK: declare float @frexpf(float, i32* nocapture) [[NOFREE_NOUNWIND]]
declare float @frexpf(float, i32*)

; CHECK: declare x86_fp80 @frexpl(x86_fp80, i32* nocapture) [[NOFREE_NOUNWIND]]
declare x86_fp80 @frexpl(x86_fp80, i32*)

; CHECK: declare noundef i32 @fscanf(%opaque* nocapture noundef, i8* nocapture noundef readonly, ...) [[NOFREE_NOUNWIND]]
declare i32 @fscanf(%opaque*, i8*, ...)

; CHECK: declare noundef i32 @fseek(%opaque* nocapture noundef, i64 noundef, i32 noundef) [[NOFREE_NOUNWIND]]
declare i32 @fseek(%opaque*, i64, i32)

; CHECK: declare noundef i32 @fseeko(%opaque* nocapture noundef, i64 noundef, i32 noundef) [[NOFREE_NOUNWIND]]
declare i32 @fseeko(%opaque*, i64, i32)

; CHECK-LINUX: declare noundef i32 @fseeko64(%opaque* nocapture noundef, i64 noundef, i32 noundef) [[NOFREE_NOUNWIND]]
declare i32 @fseeko64(%opaque*, i64, i32)

; CHECK: declare noundef i32 @fsetpos(%opaque* nocapture noundef, i64* noundef) [[NOFREE_NOUNWIND]]
declare i32 @fsetpos(%opaque*, i64*)

; CHECK: declare noundef i32 @fstat(i32 noundef, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @fstat(i32, %opaque*)

; CHECK-LINUX: declare noundef i32 @fstat64(i32 noundef, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @fstat64(i32, %opaque*)

; CHECK: declare noundef i32 @fstatvfs(i32 noundef, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @fstatvfs(i32, %opaque*)

; CHECK-LINUX: declare noundef i32 @fstatvfs64(i32 noundef, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @fstatvfs64(i32, %opaque*)

; CHECK: declare noundef i64 @ftell(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i64 @ftell(%opaque*)

; CHECK: declare noundef i64 @ftello(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i64 @ftello(%opaque*)

; CHECK-LINUX: declare noundef i64 @ftello64(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i64 @ftello64(%opaque*)

; CHECK: declare noundef i32 @ftrylockfile(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @ftrylockfile(%opaque*)

; CHECK: declare void @funlockfile(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare void @funlockfile(%opaque*)

; CHECK: declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i64 @fwrite(i8*, i64, i64, %opaque*)

; CHECK: declare noundef i32 @getc(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @getc(%opaque*)

; CHECK: declare noundef i32 @getc_unlocked(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @getc_unlocked(%opaque*)

; CHECK: declare noundef i32 @getchar() [[NOFREE_NOUNWIND]]
declare i32 @getchar()

; CHECK: declare noundef i32 @getchar_unlocked() [[NOFREE_NOUNWIND]]
declare i32 @getchar_unlocked()

; CHECK: declare noundef i8* @getenv(i8* nocapture noundef) [[NOFREE_NOUNWIND_READONLY]]
declare i8* @getenv(i8*)

; CHECK: declare noundef i32 @getitimer(i32 noundef, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @getitimer(i32, %opaque*)

; CHECK: declare noundef i32 @getlogin_r(i8* nocapture noundef, i64 noundef) [[NOFREE_NOUNWIND]]
declare i32 @getlogin_r(i8*, i64)

; CHECK: declare noundef %opaque* @getpwnam(i8* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare %opaque* @getpwnam(i8*)

; CHECK: declare noundef i8* @gets(i8* noundef) [[NOFREE_NOUNWIND]]
declare i8* @gets(i8*)

; CHECK: declare noundef i32 @gettimeofday(%opaque* nocapture noundef, i8* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @gettimeofday(%opaque*, i8*)

; CHECK: declare i32 @isascii(i32) [[NOFREE]]
declare i32 @isascii(i32)

; CHECK: declare i32 @isdigit(i32) [[NOFREE]]
declare i32 @isdigit(i32)

; CHECK: declare i64 @labs(i64) [[NOFREE]]
declare i64 @labs(i64)

; CHECK: declare noundef i32 @lchown(i8* nocapture noundef readonly, i32 noundef, i32 noundef) [[NOFREE_NOUNWIND]]
declare i32 @lchown(i8*, i32, i32)

; CHECK: declare double @ldexp(double, i32 signext) [[NOFREE]]
declare double @ldexp(double, i32)

; CHECK: declare float @ldexpf(float, i32 signext) [[NOFREE]]
declare float @ldexpf(float, i32)

; CHECK: declare x86_fp80 @ldexpl(x86_fp80, i32 signext) [[NOFREE]]
declare x86_fp80 @ldexpl(x86_fp80, i32)

; CHECK: declare i64 @llabs(i64) [[NOFREE]]
declare i64 @llabs(i64)

; CHECK: declare double @log(double) [[NOFREE]]
declare double @log(double)

; CHECK: declare double @log10(double) [[NOFREE]]
declare double @log10(double)

; CHECK: declare float @log10f(float) [[NOFREE]]
declare float @log10f(float)

; CHECK: declare x86_fp80 @log10l(x86_fp80) [[NOFREE]]
declare x86_fp80 @log10l(x86_fp80)

; CHECK: declare double @log1p(double) [[NOFREE]]
declare double @log1p(double)

; CHECK: declare float @log1pf(float) [[NOFREE]]
declare float @log1pf(float)

; CHECK: declare x86_fp80 @log1pl(x86_fp80) [[NOFREE]]
declare x86_fp80 @log1pl(x86_fp80)

; CHECK: declare double @log2(double) [[NOFREE]]
declare double @log2(double)

; CHECK: declare float @log2f(float) [[NOFREE]]
declare float @log2f(float)

; CHECK: declare x86_fp80 @log2l(x86_fp80) [[NOFREE]]
declare x86_fp80 @log2l(x86_fp80)

; CHECK: declare double @logb(double) [[NOFREE]]
declare double @logb(double)

; CHECK: declare float @logbf(float) [[NOFREE]]
declare float @logbf(float)

; CHECK: declare x86_fp80 @logbl(x86_fp80) [[NOFREE]]
declare x86_fp80 @logbl(x86_fp80)

; CHECK: declare float @logf(float) [[NOFREE]]
declare float @logf(float)

; CHECK: declare x86_fp80 @logl(x86_fp80) [[NOFREE]]
declare x86_fp80 @logl(x86_fp80)

; CHECK: declare noundef i32 @lstat(i8* nocapture noundef readonly, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @lstat(i8*, %opaque*)

; CHECK-LINUX: declare noundef i32 @lstat64(i8* nocapture noundef readonly, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @lstat64(i8*, %opaque*)

; CHECK: declare noalias noundef i8* @malloc(i64) [[NOFREE_NOUNWIND]]
declare i8* @malloc(i64)

; CHECK-LINUX: declare noalias i8* @memalign(i64, i64) [[NOFREE]]
declare i8* @memalign(i64, i64)

; CHECK: declare i8* @memccpy(i8* noalias writeonly, i8* noalias nocapture readonly, i32, i64) [[ARGMEMONLY_NOFREE_NOUNWIND:#[0-9]+]]
declare i8* @memccpy(i8*, i8*, i32, i64)

; CHECK-LINUX:   declare i8* @memchr(i8*, i32, i64) [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY]]
; CHECK-DARWIN:  declare i8* @memchr(i8*, i32, i64) [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY:#[0-9]+]]
; CHECK-UNKNOWN: declare i8* @memchr(i8*, i32, i64) [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY:#[0-9]+]]
declare i8* @memchr(i8*, i32, i64)

; CHECK: declare i32 @memcmp(i8* nocapture, i8* nocapture, i64) [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY]]
declare i32 @memcmp(i8*, i8*, i64)

; CHECK: declare i8* @memcpy(i8* noalias returned writeonly, i8* noalias nocapture readonly, i64) [[ARGMEMONLY_NOFREE_NOUNWIND]]
declare i8* @memcpy(i8*, i8*, i64)

; CHECK: declare i8* @mempcpy(i8* noalias writeonly, i8* noalias nocapture readonly, i64) [[ARGMEMONLY_NOFREE_NOUNWIND]]
declare i8* @mempcpy(i8*, i8*, i64)

; CHECK: declare i8* @memmove(i8* returned writeonly, i8* nocapture readonly, i64) [[ARGMEMONLY_NOFREE_NOUNWIND]]
declare i8* @memmove(i8*, i8*, i64)

; CHECK: declare i8* @memset(i8*, i32, i64) [[NOFREE]]
declare i8* @memset(i8*, i32, i64)

; CHECK: declare noundef i32 @mkdir(i8* nocapture noundef readonly, i16 noundef zeroext) [[NOFREE_NOUNWIND]]
declare i32 @mkdir(i8*, i16 zeroext)

; CHECK: declare noundef i64 @mktime(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i64 @mktime(%opaque*)

; CHECK: declare double @modf(double, double* nocapture) [[NOFREE_NOUNWIND]]
declare double @modf(double, double*)

; CHECK: declare float @modff(float, float* nocapture) [[NOFREE_NOUNWIND]]
declare float @modff(float, float*)

; CHECK: declare x86_fp80 @modfl(x86_fp80, x86_fp80* nocapture) [[NOFREE_NOUNWIND]]
declare x86_fp80 @modfl(x86_fp80, x86_fp80*)

; CHECK: declare double @nearbyint(double) [[NOFREE]]
declare double @nearbyint(double)

; CHECK: declare float @nearbyintf(float) [[NOFREE]]
declare float @nearbyintf(float)

; CHECK: declare x86_fp80 @nearbyintl(x86_fp80) [[NOFREE]]
declare x86_fp80 @nearbyintl(x86_fp80)

; CHECK: declare noundef i32 @open(i8* nocapture noundef readonly, i32 noundef, ...) [[NOFREE]]
declare i32 @open(i8*, i32, ...)

; CHECK-LINUX: declare noundef i32 @open64(i8* nocapture noundef readonly, i32 noundef, ...) [[NOFREE]]
declare i32 @open64(i8*, i32, ...)

; CHECK: declare noalias noundef %opaque* @opendir(i8* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare %opaque* @opendir(i8*)

; CHECK: declare noundef i32 @pclose(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @pclose(%opaque*)

; CHECK: declare void @perror(i8* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare void @perror(i8*)

; CHECK: declare noalias noundef %opaque* @popen(i8* nocapture noundef readonly, i8* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare %opaque* @popen(i8*, i8*)

; CHECK: declare i32 @posix_memalign(i8**, i64, i64) [[NOFREE]]
declare i32 @posix_memalign(i8**, i64, i64)

; CHECK: declare double @pow(double, double) [[NOFREE]]
declare double @pow(double, double)

; CHECK: declare float @powf(float, float) [[NOFREE]]
declare float @powf(float, float)

; CHECK: declare x86_fp80 @powl(x86_fp80, x86_fp80) [[NOFREE]]
declare x86_fp80 @powl(x86_fp80, x86_fp80)

; CHECK: declare noundef i64 @pread(i32 noundef, i8* nocapture noundef, i64 noundef, i64 noundef) [[NOFREE]]
declare i64 @pread(i32, i8*, i64, i64)

; CHECK: declare noundef i32 @printf(i8* nocapture noundef readonly, ...) [[NOFREE_NOUNWIND]]
declare i32 @printf(i8*, ...)

; CHECK: declare noundef i32 @putc(i32 noundef, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @putc(i32, %opaque*)

; CHECK: declare noundef i32 @putchar(i32 noundef) [[NOFREE_NOUNWIND]]
declare i32 @putchar(i32)

; CHECK: declare noundef i32 @putchar_unlocked(i32 noundef) [[NOFREE_NOUNWIND]]
declare i32 @putchar_unlocked(i32)

; CHECK: declare noundef i32 @puts(i8* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare i32 @puts(i8*)

; CHECK: declare noundef i64 @pwrite(i32 noundef, i8* nocapture noundef readonly, i64 noundef, i64 noundef) [[NOFREE]]
declare i64 @pwrite(i32, i8*, i64, i64)

; CHECK: declare void @qsort(i8* noundef, i64 noundef, i64 noundef, i32 (i8*, i8*)* nocapture noundef) [[NOFREE]]
declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)*)

; CHECK: declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) [[NOFREE]]
declare i64 @read(i32, i8*, i64)

; CHECK: declare noundef i64 @readlink(i8* nocapture noundef readonly, i8* nocapture noundef, i64 noundef) [[NOFREE_NOUNWIND]]
declare i64 @readlink(i8*, i8*, i64)

; CHECK: declare noalias noundef i8* @realloc(i8* nocapture, i64) [[NOUNWIND]]
declare i8* @realloc(i8*, i64)

; CHECK: declare noundef i8* @reallocf(i8*, i64)
declare i8* @reallocf(i8*, i64)

; CHECK: declare noundef i8* @realpath(i8* nocapture noundef readonly, i8* noundef) [[NOFREE_NOUNWIND]]
declare i8* @realpath(i8*, i8*)

; CHECK: declare noundef i32 @remove(i8* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare i32 @remove(i8*)

; CHECK: declare noundef i32 @rename(i8* nocapture noundef readonly, i8* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare i32 @rename(i8*, i8*)

; CHECK: declare void @rewind(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare void @rewind(%opaque*)

; CHECK: declare double @rint(double) [[NOFREE]]
declare double @rint(double)

; CHECK: declare float @rintf(float) [[NOFREE]]
declare float @rintf(float)

; CHECK: declare x86_fp80 @rintl(x86_fp80) [[NOFREE]]
declare x86_fp80 @rintl(x86_fp80)

; CHECK: declare noundef i32 @rmdir(i8* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare i32 @rmdir(i8*)

; CHECK: declare double @round(double) [[NOFREE]]
declare double @round(double)

; CHECK: declare float @roundf(float) [[NOFREE]]
declare float @roundf(float)

; CHECK: declare x86_fp80 @roundl(x86_fp80) [[NOFREE]]
declare x86_fp80 @roundl(x86_fp80)

; CHECK: declare noundef i32 @scanf(i8* nocapture noundef readonly, ...) [[NOFREE_NOUNWIND]]
declare i32 @scanf(i8*, ...)

; CHECK: declare void @setbuf(%opaque* nocapture noundef, i8* noundef) [[NOFREE_NOUNWIND]]
declare void @setbuf(%opaque*, i8*)

; CHECK: declare noundef i32 @setitimer(i32 noundef, %opaque* nocapture noundef readonly, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @setitimer(i32, %opaque*, %opaque*)

; CHECK: declare noundef i32 @setvbuf(%opaque* nocapture noundef, i8* noundef, i32 noundef, i64 noundef) [[NOFREE_NOUNWIND]]
declare i32 @setvbuf(%opaque*, i8*, i32, i64)

; CHECK: declare double @sin(double) [[NOFREE]]
declare double @sin(double)

; CHECK: declare float @sinf(float) [[NOFREE]]
declare float @sinf(float)

; CHECK: declare double @sinh(double) [[NOFREE]]
declare double @sinh(double)

; CHECK: declare float @sinhf(float) [[NOFREE]]
declare float @sinhf(float)

; CHECK: declare x86_fp80 @sinhl(x86_fp80) [[NOFREE]]
declare x86_fp80 @sinhl(x86_fp80)

; CHECK: declare x86_fp80 @sinl(x86_fp80) [[NOFREE]]
declare x86_fp80 @sinl(x86_fp80)

; CHECK: declare noundef i32 @snprintf(i8* noalias nocapture noundef writeonly, i64 noundef, i8* nocapture noundef readonly, ...) [[NOFREE_NOUNWIND]]
declare i32 @snprintf(i8*, i64, i8*, ...)

; CHECK: declare noundef i32 @sprintf(i8* noalias nocapture noundef writeonly, i8* nocapture noundef readonly, ...) [[NOFREE_NOUNWIND]]
declare i32 @sprintf(i8*, i8*, ...)

; CHECK: declare double @sqrt(double) [[NOFREE]]
declare double @sqrt(double)

; CHECK: declare float @sqrtf(float) [[NOFREE]]
declare float @sqrtf(float)

; CHECK: declare x86_fp80 @sqrtl(x86_fp80) [[NOFREE]]
declare x86_fp80 @sqrtl(x86_fp80)

; CHECK: declare noundef i32 @sscanf(i8* nocapture noundef readonly, i8* nocapture noundef readonly, ...) [[NOFREE_NOUNWIND]]
declare i32 @sscanf(i8*, i8*, ...)

; CHECK: declare noundef i32 @stat(i8* nocapture noundef readonly, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @stat(i8*, %opaque*)

; CHECK-LINUX: declare noundef i32 @stat64(i8* nocapture noundef readonly, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @stat64(i8*, %opaque*)

; CHECK: declare noundef i32 @statvfs(i8* nocapture noundef readonly, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @statvfs(i8*, %opaque*)

; CHECK-LINUX: declare noundef i32 @statvfs64(i8* nocapture noundef readonly, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @statvfs64(i8*, %opaque*)

; CHECK: declare i8* @stpcpy(i8* noalias writeonly, i8* noalias nocapture readonly) [[ARGMEMONLY_NOFREE_NOUNWIND]]
declare i8* @stpcpy(i8*, i8*)

; CHECK: declare i8* @stpncpy(i8* noalias writeonly, i8* noalias nocapture readonly, i64) [[ARGMEMONLY_NOFREE_NOUNWIND]]
declare i8* @stpncpy(i8*, i8*, i64)

; CHECK: declare i32 @strcasecmp(i8* nocapture, i8* nocapture) [[NOFREE_NOUNWIND_READONLY]]
declare i32 @strcasecmp(i8*, i8*)

; CHECK: declare i8* @strcat(i8* noalias returned writeonly, i8* noalias nocapture readonly) [[ARGMEMONLY_NOFREE_NOUNWIND]]
declare i8* @strcat(i8*, i8*)

; CHECK: declare i8* @strchr(i8*, i32) [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY]]
declare i8* @strchr(i8*, i32)

; CHECK: declare i32 @strcmp(i8* nocapture, i8* nocapture) [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY]]
declare i32 @strcmp(i8*, i8*)

; CHECK: declare i32 @strcoll(i8* nocapture, i8* nocapture) [[NOFREE_NOUNWIND_READONLY]]
declare i32 @strcoll(i8*, i8*)

; CHECK: declare i8* @strcpy(i8* noalias returned writeonly, i8* noalias nocapture readonly) [[ARGMEMONLY_NOFREE_NOUNWIND]]
declare i8* @strcpy(i8*, i8*)

; CHECK: declare i64 @strcspn(i8* nocapture, i8* nocapture) [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY]]
declare i64 @strcspn(i8*, i8*)

; CHECK: declare noalias i8* @strdup(i8* nocapture readonly) [[NOFREE_NOUNWIND]]
declare i8* @strdup(i8*)

; CHECK: declare i64 @strlen(i8* nocapture) [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY]]
declare i64 @strlen(i8*)

; CHECK: declare i32 @strncasecmp(i8* nocapture, i8* nocapture, i64) [[NOFREE_NOUNWIND_READONLY]]
declare i32 @strncasecmp(i8*, i8*, i64)

; CHECK: declare i8* @strncat(i8* noalias returned writeonly, i8* noalias nocapture readonly, i64) [[ARGMEMONLY_NOFREE_NOUNWIND]]
declare i8* @strncat(i8*, i8*, i64)

; CHECK: declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY]]
declare i32 @strncmp(i8*, i8*, i64)

; CHECK: declare i8* @strncpy(i8* noalias returned writeonly, i8* noalias nocapture readonly, i64) [[ARGMEMONLY_NOFREE_NOUNWIND]]
declare i8* @strncpy(i8*, i8*, i64)

; CHECK: declare noalias i8* @strndup(i8* nocapture readonly, i64) [[NOFREE_NOUNWIND]]
declare i8* @strndup(i8*, i64)

; CHECK: declare i64 @strnlen(i8*, i64) [[NOFREE]]
declare i64 @strnlen(i8*, i64)

; CHECK: declare i8* @strpbrk(i8*, i8* nocapture) [[ARGMEMONLY_NOFREE_NOUNWIND:#[0-9]+]]
declare i8* @strpbrk(i8*, i8*)

; CHECK: declare i8* @strrchr(i8*, i32) [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY]]
declare i8* @strrchr(i8*, i32)

; CHECK: declare i64 @strspn(i8* nocapture, i8* nocapture) [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY]]
declare i64 @strspn(i8*, i8*)

; CHECK: declare i8* @strstr(i8*, i8* nocapture) [[ARGMEMONLY_NOFREE_NOUNWIND]]
declare i8* @strstr(i8*, i8*)

; CHECK: declare double @strtod(i8* readonly, i8** nocapture) [[NOFREE_NOUNWIND]]
declare double @strtod(i8*, i8**)

; CHECK: declare float @strtof(i8* readonly, i8** nocapture) [[NOFREE_NOUNWIND]]
declare float @strtof(i8*, i8**)

; CHECK: declare i8* @strtok(i8*, i8* nocapture readonly) [[NOFREE_NOUNWIND]]
declare i8* @strtok(i8*, i8*)

; CHECK: declare i8* @strtok_r(i8*, i8* nocapture readonly, i8**) [[NOFREE_NOUNWIND]]
declare i8* @strtok_r(i8*, i8*, i8**)

; CHECK: declare i64 @strtol(i8* readonly, i8** nocapture, i32) [[NOFREE_NOUNWIND]]
declare i64 @strtol(i8*, i8**, i32)

; CHECK: declare x86_fp80 @strtold(i8* readonly, i8** nocapture) [[NOFREE_NOUNWIND]]
declare x86_fp80 @strtold(i8*, i8**)

; CHECK: declare i64 @strtoll(i8* readonly, i8** nocapture, i32) [[NOFREE_NOUNWIND]]
declare i64 @strtoll(i8*, i8**, i32)

; CHECK: declare i64 @strtoul(i8* readonly, i8** nocapture, i32) [[NOFREE_NOUNWIND]]
declare i64 @strtoul(i8*, i8**, i32)

; CHECK: declare i64 @strtoull(i8* readonly, i8** nocapture, i32) [[NOFREE_NOUNWIND]]
declare i64 @strtoull(i8*, i8**, i32)

; CHECK: declare i64 @strxfrm(i8* nocapture, i8* nocapture readonly, i64) [[NOFREE_NOUNWIND]]
declare i64 @strxfrm(i8*, i8*, i64)

; CHECK: declare noundef i32 @system(i8* nocapture noundef readonly) [[NOFREE]]
declare i32 @system(i8*)

; CHECK: declare double @tan(double) [[NOFREE]]
declare double @tan(double)

; CHECK: declare float @tanf(float) [[NOFREE]]
declare float @tanf(float)

; CHECK: declare double @tanh(double) [[NOFREE]]
declare double @tanh(double)

; CHECK: declare float @tanhf(float) [[NOFREE]]
declare float @tanhf(float)

; CHECK: declare x86_fp80 @tanhl(x86_fp80) [[NOFREE]]
declare x86_fp80 @tanhl(x86_fp80)

; CHECK: declare x86_fp80 @tanl(x86_fp80) [[NOFREE]]
declare x86_fp80 @tanl(x86_fp80)

; CHECK: declare noundef i64 @times(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i64 @times(%opaque*)

; CHECK: declare noalias noundef %opaque* @tmpfile() [[NOFREE_NOUNWIND]]
declare %opaque* @tmpfile()

; CHECK-LINUX: declare noalias noundef %opaque* @tmpfile64() [[NOFREE_NOUNWIND]]
declare %opaque* @tmpfile64()

; CHECK: declare i32 @toascii(i32) [[NOFREE]]
declare i32 @toascii(i32)

; CHECK: declare double @trunc(double) [[NOFREE]]
declare double @trunc(double)

; CHECK: declare float @truncf(float) [[NOFREE]]
declare float @truncf(float)

; CHECK: declare x86_fp80 @truncl(x86_fp80) [[NOFREE]]
declare x86_fp80 @truncl(x86_fp80)

; CHECK: declare noundef i32 @uname(%opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @uname(%opaque*)

; CHECK: declare noundef i32 @ungetc(i32 noundef, %opaque* nocapture noundef) [[NOFREE_NOUNWIND]]
declare i32 @ungetc(i32, %opaque*)

; CHECK: declare noundef i32 @unlink(i8* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare i32 @unlink(i8*)

; CHECK: declare noundef i32 @unsetenv(i8* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare i32 @unsetenv(i8*)

; CHECK: declare noundef i32 @utime(i8* nocapture noundef readonly, %opaque* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare i32 @utime(i8*, %opaque*)

; CHECK: declare noundef i32 @utimes(i8* nocapture noundef readonly, %opaque* nocapture noundef readonly) [[NOFREE_NOUNWIND]]
declare i32 @utimes(i8*, %opaque*)

; CHECK: declare noalias noundef i8* @valloc(i64) [[NOFREE_NOUNWIND]]
declare i8* @valloc(i64)

; CHECK: declare noundef i32 @vfprintf(%opaque* nocapture noundef, i8* nocapture noundef readonly, %opaque* noundef) [[NOFREE_NOUNWIND]]
declare i32 @vfprintf(%opaque*, i8*, %opaque*)

; CHECK: declare noundef i32 @vfscanf(%opaque* nocapture noundef, i8* nocapture noundef readonly, %opaque* noundef) [[NOFREE_NOUNWIND]]
declare i32 @vfscanf(%opaque*, i8*, %opaque*)

; CHECK: declare noundef i32 @vprintf(i8* nocapture noundef readonly, %opaque* noundef) [[NOFREE_NOUNWIND]]
declare i32 @vprintf(i8*, %opaque*)

; CHECK: declare noundef i32 @vscanf(i8* nocapture noundef readonly, %opaque* noundef) [[NOFREE_NOUNWIND]]
declare i32 @vscanf(i8*, %opaque*)

; CHECK: declare noundef i32 @vsnprintf(i8* nocapture noundef, i64 noundef, i8* nocapture noundef readonly, %opaque* noundef) [[NOFREE_NOUNWIND]]
declare i32 @vsnprintf(i8*, i64, i8*, %opaque*)

; CHECK: declare noundef i32 @vsprintf(i8* nocapture noundef, i8* nocapture noundef readonly, %opaque* noundef) [[NOFREE_NOUNWIND]]
declare i32 @vsprintf(i8*, i8*, %opaque*)

; CHECK: declare noundef i32 @vsscanf(i8* nocapture noundef readonly, i8* nocapture noundef readonly, %opaque* noundef) [[NOFREE_NOUNWIND]]
declare i32 @vsscanf(i8*, i8*, %opaque*)

; CHECK: declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) [[NOFREE]]
declare i64 @write(i32, i8*, i64)


; memset_pattern16 isn't available everywhere.
; CHECK-DARWIN: declare void @memset_pattern16(i8* nocapture writeonly, i8* nocapture readonly, i64) [[ARGMEMONLY_NOFREE:#[0-9]+]]
declare void @memset_pattern16(i8*, i8*, i64)

; CHECK: attributes [[NOFREE]] = { nofree }
; CHECK: attributes [[NOFREE_NOUNWIND]] = { nofree nounwind }
; CHECK: attributes [[NOFREE_NOUNWIND_READONLY]] = { nofree nounwind readonly }

; CHECK-DAG-UNKNOWN: attributes [[ARGMEMONLY_NOFREE_NOUNWIND]] = { argmemonly nofree nounwind }
; CHECK-DAG-UNKNOWN: attributes [[NOUNWIND]] = { nounwind }
; CHECK-DAG-UNKNOWN: attributes [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY]] = { argmemonly nofree nounwind readonly }

; CHECK-DAG-LINUX: attributes [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY]] = { argmemonly nofree nounwind readonly }
; CHECK-DAG-LINUX: attributes [[ARGMEMONLY_NOFREE_NOUNWIND]] = { argmemonly nofree nounwind }
; CHECK-DAG-LINUX: attributes [[NOUNWIND]] = { nounwind }

; CHECK-DAG-DARWIN: attributes [[ARGMEMONLY_NOFREE_NOUNWIND]] = { argmemonly nofree nounwind }
; CHECK-DAG-DARWIN: attributes [[NOUNWIND]] = { nounwind }
; CHECK-DAG-DARWIN: attributes [[ARGMEMONLY_NOFREE_NOUNWIND_READONLY]] = { argmemonly nofree nounwind readonly }
; CHECK-DAG-DARWIN: attributes [[ARGMEMONLY_NOFREE]] = { argmemonly nofree }

