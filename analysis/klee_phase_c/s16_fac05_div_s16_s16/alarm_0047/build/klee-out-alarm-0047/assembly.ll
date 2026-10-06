; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0047/build/s16_fac05_div_s16_s16_alarm_0047.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [140 x i8] c"KLEE-ALARM-0047: signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0047.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1.10 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2.11 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %numerator = alloca i16, align 2
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %numerator, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i16* %result, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = bitcast i16* %numerator to i8*, !dbg !58
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !59
  %1 = bitcast i16* %denominator to i8*, !dbg !60
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  %2 = load i16, i16* %numerator, align 2, !dbg !62
  %3 = load i16, i16* %denominator, align 2, !dbg !63
  %call = call signext i16 @s16_fac05_div_s16_s16(i16 signext %2, i16 signext %3), !dbg !64
  store i16 %call, i16* %result, align 2, !dbg !65
  %4 = load i16, i16* %result, align 2, !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_s16(i16 signext %numerator, i16 signext %denominator) #0 !dbg !68 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = load i16, i16* %numerator.addr, align 2, !dbg !80
  %conv = sext i16 %0 to i32, !dbg !82
  %conv1 = sext i32 %conv to i64, !dbg !83
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv1), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.end, label %if.then, !dbg !85

if.then:                                          ; preds = %entry
  store i16 0, i16* %retval, align 2, !dbg !86
  br label %return, !dbg !86

if.end:                                           ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !88
  %conv2 = sext i16 %1 to i32, !dbg !88
  %shl = shl i32 %conv2, 16, !dbg !89
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !90
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !91
  %conv3 = sext i16 %2 to i32, !dbg !91
  %cmp = icmp eq i32 %conv3, 0, !dbg !93
  br i1 %cmp, label %if.then5, label %if.else10, !dbg !94

if.then5:                                         ; preds = %if.end
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !95
  %conv6 = sext i16 %3 to i32, !dbg !95
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !98
  br i1 %cmp7, label %if.then9, label %if.else, !dbg !99

if.then9:                                         ; preds = %if.then5
  store i16 -32768, i16* %retval, align 2, !dbg !100
  br label %return, !dbg !100

if.else:                                          ; preds = %if.then5
  store i16 32767, i16* %retval, align 2, !dbg !102
  br label %return, !dbg !102

if.else10:                                        ; preds = %if.end
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !104
  %cmp11 = icmp ne i32 %4, -2147483648, !dbg !107
  br i1 %cmp11, label %if.then13, label %if.else52, !dbg !108

if.then13:                                        ; preds = %if.else10
  %5 = load i16, i16* %denominator.addr, align 2, !dbg !109
  %conv14 = sext i16 %5 to i64, !dbg !112
  %call15 = call i32 @klee_alarm_divisor_nonzero(i64 %conv14), !dbg !113
  %tobool16 = icmp ne i32 %call15, 0, !dbg !113
  br i1 %tobool16, label %if.end18, label %if.then17, !dbg !114

if.then17:                                        ; preds = %if.then13
  store i16 0, i16* %retval, align 2, !dbg !115
  br label %return, !dbg !115

if.end18:                                         ; preds = %if.then13
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !117
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !119
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !120
  %conv19 = sext i16 %8 to i32, !dbg !121
  %int_cast_to_i64 = zext i32 %conv19 to i64, !dbg !122
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !122
  %div = sdiv i32 %7, %conv19, !dbg !122, !klee.check.div !123
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !124
  %conv20 = sext i16 %9 to i32, !dbg !125
  %mul = mul nsw i32 %div, %conv20, !dbg !126
  %sub = sub nsw i32 %6, %mul, !dbg !127
  %conv21 = sext i32 %sub to i64, !dbg !128
  %call22 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv21), !dbg !129
  %tobool23 = icmp ne i32 %call22, 0, !dbg !129
  br i1 %tobool23, label %if.end25, label %if.then24, !dbg !130

if.then24:                                        ; preds = %if.end18
  store i16 0, i16* %retval, align 2, !dbg !131
  br label %return, !dbg !131

if.end25:                                         ; preds = %if.end18
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !133
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !135
  %conv26 = sext i16 %11 to i32, !dbg !136
  %int_cast_to_i641 = zext i32 %conv26 to i64, !dbg !137
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !137
  %div27 = sdiv i32 %10, %conv26, !dbg !137, !klee.check.div !123
  %conv28 = sext i32 %div27 to i64, !dbg !138
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !139
  %conv29 = sext i16 %12 to i32, !dbg !140
  %conv30 = sext i32 %conv29 to i64, !dbg !141
  %call31 = call i32 @klee_alarm_s32_mul_upper(i64 %conv28, i64 %conv30), !dbg !142
  %tobool32 = icmp ne i32 %call31, 0, !dbg !142
  br i1 %tobool32, label %if.end34, label %if.then33, !dbg !143

if.then33:                                        ; preds = %if.end25
  store i16 0, i16* %retval, align 2, !dbg !144
  br label %return, !dbg !144

if.end34:                                         ; preds = %if.end25
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !146
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !148
  %15 = load i16, i16* %denominator.addr, align 2, !dbg !149
  %conv35 = sext i16 %15 to i32, !dbg !150
  %int_cast_to_i642 = zext i32 %conv35 to i64, !dbg !151
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !151
  %div36 = sdiv i32 %14, %conv35, !dbg !151, !klee.check.div !123
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !152
  %conv37 = sext i16 %16 to i32, !dbg !153
  %mul38 = mul nsw i32 %div36, %conv37, !dbg !154
  %sub39 = sub nsw i32 %13, %mul38, !dbg !155
  %conv40 = sext i32 %sub39 to i64, !dbg !156
  %call41 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv40, i32 1), !dbg !157
  %tobool42 = icmp ne i32 %call41, 0, !dbg !157
  br i1 %tobool42, label %if.end44, label %if.then43, !dbg !158

if.then43:                                        ; preds = %if.end34
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 210, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !159
  unreachable, !dbg !159

if.end44:                                         ; preds = %if.end34
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !161
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !162
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !163
  %conv45 = sext i16 %19 to i32, !dbg !164
  %int_cast_to_i643 = zext i32 %conv45 to i64, !dbg !165
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !165
  %div46 = sdiv i32 %18, %conv45, !dbg !165, !klee.check.div !123
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !166
  %conv47 = sext i16 %20 to i32, !dbg !167
  %mul48 = mul nsw i32 %div46, %conv47, !dbg !168
  %sub49 = sub nsw i32 %17, %mul48, !dbg !169
  %shl50 = shl i32 %sub49, 1, !dbg !170
  %conv51 = sext i32 %shl50 to i64, !dbg !171
  store volatile i64 %conv51, i64* @klee_alarm_sink_s64, align 8, !dbg !172
  store i16 0, i16* %retval, align 2, !dbg !173
  br label %return, !dbg !173

if.else52:                                        ; preds = %if.else10
  %21 = load i16, i16* %denominator.addr, align 2, !dbg !174
  %conv53 = sext i16 %21 to i32, !dbg !174
  %cmp54 = icmp ne i32 %conv53, -1, !dbg !177
  br i1 %cmp54, label %if.then56, label %if.else78, !dbg !178

if.then56:                                        ; preds = %if.else52
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !179
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !181
  %24 = load i16, i16* %denominator.addr, align 2, !dbg !182
  %conv57 = sext i16 %24 to i32, !dbg !182
  %int_cast_to_i644 = zext i32 %conv57 to i64, !dbg !183
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !183
  %div58 = sdiv i32 %23, %conv57, !dbg !183, !klee.check.div !123
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !184
  %conv59 = sext i16 %25 to i32, !dbg !184
  %mul60 = mul nsw i32 %div58, %conv59, !dbg !185
  %sub61 = sub nsw i32 %22, %mul60, !dbg !186
  %shl62 = shl i32 %sub61, 1, !dbg !187
  store i32 %shl62, i32* %s32Temp2, align 4, !dbg !188
  %26 = load i32, i32* %s32Temp2, align 4, !dbg !189
  %27 = load i16, i16* %denominator.addr, align 2, !dbg !190
  %conv63 = sext i16 %27 to i32, !dbg !190
  %int_cast_to_i645 = zext i32 %conv63 to i64, !dbg !191
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !191
  %div64 = sdiv i32 %26, %conv63, !dbg !191, !klee.check.div !123
  store i32 %div64, i32* %s32Temp1, align 4, !dbg !192
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !193
  %29 = load i16, i16* %numerator.addr, align 2, !dbg !194
  %conv65 = sext i16 %29 to i32, !dbg !194
  %shl66 = shl i32 %conv65, 16, !dbg !195
  %30 = load i16, i16* %denominator.addr, align 2, !dbg !196
  %conv67 = sext i16 %30 to i32, !dbg !196
  %int_cast_to_i646 = zext i32 %conv67 to i64, !dbg !197
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !197
  %div68 = sdiv i32 %shl66, %conv67, !dbg !197, !klee.check.div !123
  %add = add nsw i32 %28, %div68, !dbg !198
  store i32 %add, i32* %s32Temp1, align 4, !dbg !199
  %31 = load i32, i32* %s32Temp1, align 4, !dbg !200
  %cmp69 = icmp slt i32 %31, 32767, !dbg !202
  br i1 %cmp69, label %if.then71, label %if.else77, !dbg !203

if.then71:                                        ; preds = %if.then56
  %32 = load i32, i32* %s32Temp1, align 4, !dbg !204
  %cmp72 = icmp sgt i32 %32, -32768, !dbg !207
  br i1 %cmp72, label %if.then74, label %if.else76, !dbg !208

if.then74:                                        ; preds = %if.then71
  %33 = load i32, i32* %s32Temp1, align 4, !dbg !209
  %conv75 = trunc i32 %33 to i16, !dbg !211
  store i16 %conv75, i16* %retval, align 2, !dbg !212
  br label %return, !dbg !212

if.else76:                                        ; preds = %if.then71
  store i16 -32768, i16* %retval, align 2, !dbg !213
  br label %return, !dbg !213

if.else77:                                        ; preds = %if.then56
  store i16 32767, i16* %retval, align 2, !dbg !215
  br label %return, !dbg !215

if.else78:                                        ; preds = %if.else52
  store i16 32767, i16* %retval, align 2, !dbg !217
  br label %return, !dbg !217

return:                                           ; preds = %if.else78, %if.else77, %if.else76, %if.then74, %if.end44, %if.then33, %if.then24, %if.then17, %if.else, %if.then9, %if.then
  %34 = load i16, i16* %retval, align 2, !dbg !219
  ret i16 %34, !dbg !219
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !220 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !223, metadata !DIExpression()), !dbg !224
  %0 = load i64, i64* %left.addr, align 8, !dbg !225
  %cmp = icmp sge i64 %0, 0, !dbg !226
  %conv = zext i1 %cmp to i32, !dbg !226
  ret i32 %conv, !dbg !227
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !228 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !229, metadata !DIExpression()), !dbg !230
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !231
  %cmp = icmp ne i64 %0, 0, !dbg !232
  %conv = zext i1 %cmp to i32, !dbg !232
  ret i32 %conv, !dbg !233
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !234 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !237, metadata !DIExpression()), !dbg !238
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !239, metadata !DIExpression()), !dbg !240
  %0 = load i64, i64* %left.addr, align 8, !dbg !241
  %1 = load i64, i64* %right.addr, align 8, !dbg !242
  %mul = mul nsw i64 %0, %1, !dbg !243
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !244
  %conv = zext i1 %cmp to i32, !dbg !244
  ret i32 %conv, !dbg !245
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !246 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !249, metadata !DIExpression()), !dbg !250
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !251, metadata !DIExpression()), !dbg !252
  %0 = load i32, i32* %count.addr, align 4, !dbg !253
  %cmp = icmp uge i32 %0, 63, !dbg !255
  br i1 %cmp, label %if.then, label %if.end, !dbg !256

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !257
  br label %return, !dbg !257

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !259
  %2 = load i32, i32* %count.addr, align 4, !dbg !260
  %sh_prom = zext i32 %2 to i64, !dbg !261
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !261
  %shl = shl i64 1, %sh_prom, !dbg !261, !klee.check.shift !123
  %mul = mul nsw i64 %1, %shl, !dbg !262
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !263
  %conv = zext i1 %cmp1 to i32, !dbg !263
  store i32 %conv, i32* %retval, align 4, !dbg !264
  br label %return, !dbg !264

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !265
  ret i32 %3, !dbg !265
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_s16(i32 %numerator, i16 signext %denominator) #0 !dbg !266 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !269, metadata !DIExpression()), !dbg !270
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !271, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !273, metadata !DIExpression()), !dbg !274
  store i32 0, i32* %s32Temp1, align 4, !dbg !274
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !275, metadata !DIExpression()), !dbg !276
  store i32 0, i32* %s32Temp2, align 4, !dbg !276
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !277
  store i32 %0, i32* %s32Temp1, align 4, !dbg !278
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !279
  %conv = sext i16 %1 to i32, !dbg !279
  %cmp = icmp eq i32 %conv, 0, !dbg !281
  br i1 %cmp, label %if.then, label %if.else5, !dbg !282

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !283
  %cmp2 = icmp slt i32 %2, 0, !dbg !286
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !287

if.then4:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !288
  br label %return, !dbg !288

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !290
  br label %return, !dbg !290

if.else5:                                         ; preds = %entry
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !292
  %cmp6 = icmp ne i32 %3, -2147483648, !dbg !295
  br i1 %cmp6, label %if.then8, label %if.else24, !dbg !296

if.then8:                                         ; preds = %if.else5
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !297
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !299
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !300
  %conv9 = sext i16 %6 to i32, !dbg !300
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !301
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !301
  %div = sdiv i32 %5, %conv9, !dbg !301, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !302
  %conv10 = sext i16 %7 to i32, !dbg !302
  %mul = mul nsw i32 %div, %conv10, !dbg !303
  %sub = sub nsw i32 %4, %mul, !dbg !304
  %shl = shl i32 %sub, 1, !dbg !305
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !306
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !307
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !308
  %conv11 = sext i16 %9 to i32, !dbg !308
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !309
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !309
  %div12 = sdiv i32 %8, %conv11, !dbg !309, !klee.check.div !123
  store i32 %div12, i32* %s32Temp1, align 4, !dbg !310
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !311
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !312
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !313
  %conv13 = sext i16 %12 to i32, !dbg !313
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !314
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !314
  %div14 = sdiv i32 %11, %conv13, !dbg !314, !klee.check.div !123
  %add = add nsw i32 %10, %div14, !dbg !315
  store i32 %add, i32* %s32Temp1, align 4, !dbg !316
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !317
  %cmp15 = icmp slt i32 %13, 32767, !dbg !319
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !320

if.then17:                                        ; preds = %if.then8
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !321
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !324
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !325

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !326
  %conv21 = trunc i32 %15 to i16, !dbg !328
  store i16 %conv21, i16* %retval, align 2, !dbg !329
  br label %return, !dbg !329

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !330
  br label %return, !dbg !330

if.else23:                                        ; preds = %if.then8
  store i16 32767, i16* %retval, align 2, !dbg !332
  br label %return, !dbg !332

if.else24:                                        ; preds = %if.else5
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !334
  %conv25 = sext i16 %16 to i32, !dbg !334
  %cmp26 = icmp ne i32 %conv25, -1, !dbg !337
  br i1 %cmp26, label %if.then28, label %if.else49, !dbg !338

if.then28:                                        ; preds = %if.else24
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !339
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !341
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !342
  %conv29 = sext i16 %19 to i32, !dbg !342
  %int_cast_to_i643 = zext i32 %conv29 to i64, !dbg !343
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !343
  %div30 = sdiv i32 %18, %conv29, !dbg !343, !klee.check.div !123
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !344
  %conv31 = sext i16 %20 to i32, !dbg !344
  %mul32 = mul nsw i32 %div30, %conv31, !dbg !345
  %sub33 = sub nsw i32 %17, %mul32, !dbg !346
  %shl34 = shl i32 %sub33, 1, !dbg !347
  store i32 %shl34, i32* %s32Temp2, align 4, !dbg !348
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !349
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !350
  %conv35 = sext i16 %22 to i32, !dbg !350
  %int_cast_to_i644 = zext i32 %conv35 to i64, !dbg !351
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !351
  %div36 = sdiv i32 %21, %conv35, !dbg !351, !klee.check.div !123
  store i32 %div36, i32* %s32Temp1, align 4, !dbg !352
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !353
  %24 = load i32, i32* %numerator.addr, align 4, !dbg !354
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !355
  %conv37 = sext i16 %25 to i32, !dbg !355
  %int_cast_to_i645 = zext i32 %conv37 to i64, !dbg !356
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !356
  %div38 = sdiv i32 %24, %conv37, !dbg !356, !klee.check.div !123
  %add39 = add nsw i32 %23, %div38, !dbg !357
  store i32 %add39, i32* %s32Temp1, align 4, !dbg !358
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !359
  %cmp40 = icmp slt i32 %26, 32767, !dbg !361
  br i1 %cmp40, label %if.then42, label %if.else48, !dbg !362

if.then42:                                        ; preds = %if.then28
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !363
  %cmp43 = icmp sgt i32 %27, -32768, !dbg !366
  br i1 %cmp43, label %if.then45, label %if.else47, !dbg !367

if.then45:                                        ; preds = %if.then42
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !368
  %conv46 = trunc i32 %28 to i16, !dbg !370
  store i16 %conv46, i16* %retval, align 2, !dbg !371
  br label %return, !dbg !371

if.else47:                                        ; preds = %if.then42
  store i16 -32768, i16* %retval, align 2, !dbg !372
  br label %return, !dbg !372

if.else48:                                        ; preds = %if.then28
  store i16 32767, i16* %retval, align 2, !dbg !374
  br label %return, !dbg !374

if.else49:                                        ; preds = %if.else24
  store i16 32767, i16* %retval, align 2, !dbg !376
  br label %return, !dbg !376

return:                                           ; preds = %if.else49, %if.else48, %if.else47, %if.then45, %if.else23, %if.else22, %if.then20, %if.else, %if.then4
  %29 = load i16, i16* %retval, align 2, !dbg !378
  ret i16 %29, !dbg !378
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !379 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !382, metadata !DIExpression()), !dbg !383
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !384, metadata !DIExpression()), !dbg !385
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !386, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !388, metadata !DIExpression()), !dbg !389
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !390, metadata !DIExpression()), !dbg !391
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !392
  %conv = zext i16 %0 to i32, !dbg !392
  %and = and i32 %conv, 65535, !dbg !393
  %conv1 = trunc i32 %and to i16, !dbg !392
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !394
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !395
  %conv2 = sext i16 %1 to i32, !dbg !395
  %shl = shl i32 %conv2, 16, !dbg !396
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !397
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !398
  %conv3 = zext i16 %2 to i32, !dbg !398
  %cmp = icmp eq i32 %conv3, 0, !dbg !400
  br i1 %cmp, label %if.then, label %if.else9, !dbg !401

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !402
  %conv5 = sext i16 %3 to i32, !dbg !402
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !405
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !406

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !407
  br label %return, !dbg !407

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !409
  br label %return, !dbg !409

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !411
  %conv10 = sext i16 %4 to i32, !dbg !411
  %shl11 = shl i32 %conv10, 16, !dbg !413
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !414
  %conv12 = sext i16 %5 to i32, !dbg !414
  %shl13 = shl i32 %conv12, 16, !dbg !415
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !416
  %conv14 = zext i16 %6 to i32, !dbg !416
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !417
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !417
  %div = sdiv i32 %shl13, %conv14, !dbg !417, !klee.check.div !123
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !418
  %conv15 = zext i16 %7 to i32, !dbg !418
  %mul = mul nsw i32 %div, %conv15, !dbg !419
  %sub = sub nsw i32 %shl11, %mul, !dbg !420
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !421
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !422
  %shl16 = shl i32 %8, 1, !dbg !423
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !424
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !425
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !426
  %conv17 = zext i16 %10 to i32, !dbg !426
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !427
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !427
  %div18 = sdiv i32 %9, %conv17, !dbg !427, !klee.check.div !123
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !428
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !429
  %conv19 = sext i16 %11 to i32, !dbg !429
  %shl20 = shl i32 %conv19, 16, !dbg !430
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !431
  %conv21 = zext i16 %12 to i32, !dbg !431
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !432
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !432
  %div22 = sdiv i32 %shl20, %conv21, !dbg !432, !klee.check.div !123
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !433
  %add = add nsw i32 %div22, %13, !dbg !434
  store i32 %add, i32* %s32Temp1, align 4, !dbg !435
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !436
  %cmp23 = icmp slt i32 %14, 32767, !dbg !438
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !439

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !440
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !443
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !444

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !445
  %conv29 = trunc i32 %16 to i16, !dbg !447
  store i16 %conv29, i16* %retval, align 2, !dbg !448
  br label %return, !dbg !448

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !449
  br label %return, !dbg !449

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !451
  br label %return, !dbg !451

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !453
  ret i16 %17, !dbg !453
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !454 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !455, metadata !DIExpression()), !dbg !456
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !457, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !459, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !461, metadata !DIExpression()), !dbg !462
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !463
  %conv = zext i16 %0 to i32, !dbg !463
  %and = and i32 %conv, 65535, !dbg !464
  %conv1 = trunc i32 %and to i16, !dbg !463
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !465
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !466
  %conv2 = zext i16 %1 to i32, !dbg !466
  %cmp = icmp eq i32 %conv2, 0, !dbg !468
  br i1 %cmp, label %if.then, label %if.else8, !dbg !469

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !470
  %conv4 = sext i16 %2 to i32, !dbg !470
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !473
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !474

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !475
  br label %return, !dbg !475

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !477
  br label %return, !dbg !477

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !479
  %conv9 = sext i16 %3 to i32, !dbg !479
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !481
  %conv10 = sext i16 %4 to i32, !dbg !481
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !482
  %conv11 = zext i16 %5 to i32, !dbg !482
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !483
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !483
  %div = sdiv i32 %conv10, %conv11, !dbg !483, !klee.check.div !123
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !484
  %conv12 = zext i16 %6 to i32, !dbg !484
  %mul = mul nsw i32 %div, %conv12, !dbg !485
  %sub = sub nsw i32 %conv9, %mul, !dbg !486
  %shl = shl i32 %sub, 1, !dbg !487
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !488
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !489
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !490
  %conv13 = zext i16 %8 to i32, !dbg !490
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !491
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !491
  %div14 = sdiv i32 %7, %conv13, !dbg !491, !klee.check.div !123
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !492
  %conv15 = sext i16 %9 to i32, !dbg !492
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !493
  %conv16 = zext i16 %10 to i32, !dbg !493
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !494
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !494
  %div17 = sdiv i32 %conv15, %conv16, !dbg !494, !klee.check.div !123
  %add = add nsw i32 %div14, %div17, !dbg !495
  store i32 %add, i32* %s32Temp1, align 4, !dbg !496
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !497
  %conv18 = trunc i32 %11 to i16, !dbg !497
  store i16 %conv18, i16* %retval, align 2, !dbg !498
  br label %return, !dbg !498

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !499
  ret i16 %12, !dbg !499
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !500 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !503, metadata !DIExpression()), !dbg !504
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !505, metadata !DIExpression()), !dbg !506
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !507, metadata !DIExpression()), !dbg !509
  store i32 0, i32* %u32Temp1, align 4, !dbg !509
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !510, metadata !DIExpression()), !dbg !511
  store i32 0, i32* %u32Temp2, align 4, !dbg !511
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !512, metadata !DIExpression()), !dbg !513
  store i32 0, i32* %u32Temp3, align 4, !dbg !513
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !514
  %conv = zext i16 %0 to i32, !dbg !514
  %cmp = icmp eq i32 %conv, 0, !dbg !516
  br i1 %cmp, label %if.then, label %if.else, !dbg !517

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !518
  br label %return, !dbg !518

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !520
  %conv2 = zext i16 %1 to i32, !dbg !520
  %shl = shl i32 %conv2, 16, !dbg !522
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !523
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !524
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !525
  %conv3 = zext i16 %3 to i32, !dbg !525
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !526
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !526
  %div = udiv i32 %2, %conv3, !dbg !526, !klee.check.div !123
  store i32 %div, i32* %u32Temp2, align 4, !dbg !527
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !528
  %add = add i32 %4, 128, !dbg !529
  %shr = lshr i32 %add, 8, !dbg !530
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !531
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !532
  %cmp4 = icmp ult i32 %5, 255, !dbg !534
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !535

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !536
  %conv7 = trunc i32 %6 to i8, !dbg !538
  store i8 %conv7, i8* %retval, align 1, !dbg !539
  br label %return, !dbg !539

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !540
  br label %return, !dbg !540

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !542
  ret i8 %7, !dbg !542
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !543 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !546, metadata !DIExpression()), !dbg !547
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !548, metadata !DIExpression()), !dbg !549
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !550, metadata !DIExpression()), !dbg !551
  store i32 0, i32* %s32Temp1, align 4, !dbg !551
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !552
  %conv = zext i16 %0 to i32, !dbg !552
  %and = and i32 %conv, 65535, !dbg !553
  %conv1 = trunc i32 %and to i16, !dbg !552
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !554
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !555
  %conv2 = zext i16 %1 to i32, !dbg !555
  %and3 = and i32 %conv2, 65535, !dbg !557
  %cmp = icmp eq i32 %and3, 0, !dbg !558
  br i1 %cmp, label %if.then, label %if.else8, !dbg !559

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !560
  %cmp5 = icmp sge i32 %2, 0, !dbg !563
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !564

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !565
  br label %return, !dbg !565

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !567
  br label %return, !dbg !567

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !569
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !571
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !572
  %conv9 = zext i16 %5 to i32, !dbg !572
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !573
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !573
  %div = sdiv i32 %4, %conv9, !dbg !573, !klee.check.div !123
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !574
  %conv10 = zext i16 %6 to i32, !dbg !574
  %mul = mul nsw i32 %div, %conv10, !dbg !575
  %sub = sub nsw i32 %3, %mul, !dbg !576
  %shl = shl i32 %sub, 1, !dbg !577
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !578
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !579
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !580
  %conv11 = zext i16 %8 to i32, !dbg !580
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !581
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !581
  %div12 = sdiv i32 %7, %conv11, !dbg !581, !klee.check.div !123
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !582
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !583
  %conv13 = zext i16 %10 to i32, !dbg !583
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !584
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !584
  %div14 = sdiv i32 %9, %conv13, !dbg !584, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !585
  store i32 %add, i32* %s32Temp1, align 4, !dbg !586
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !587
  %cmp15 = icmp slt i32 %11, 65535, !dbg !589
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !590

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !591
  %cmp18 = icmp sgt i32 %12, 0, !dbg !594
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !595

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !596
  %conv21 = trunc i32 %13 to i16, !dbg !598
  store i16 %conv21, i16* %retval, align 2, !dbg !599
  br label %return, !dbg !599

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !600
  br label %return, !dbg !600

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !602
  br label %return, !dbg !602

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !604
  ret i16 %14, !dbg !604
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !605 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !608, metadata !DIExpression()), !dbg !609
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !610, metadata !DIExpression()), !dbg !611
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !612, metadata !DIExpression()), !dbg !613
  store i32 0, i32* %u32Temp, align 4, !dbg !613
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !614
  %conv = zext i16 %0 to i32, !dbg !614
  %cmp = icmp eq i32 %conv, 0, !dbg !616
  br i1 %cmp, label %if.then, label %if.else, !dbg !617

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !618
  br label %return, !dbg !618

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !620
  %conv2 = zext i16 %1 to i32, !dbg !620
  %shl = shl i32 %conv2, 16, !dbg !622
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !623
  %conv3 = zext i16 %2 to i32, !dbg !623
  %shr = ashr i32 %conv3, 1, !dbg !624
  %add = add nsw i32 %shl, %shr, !dbg !625
  store i32 %add, i32* %u32Temp, align 4, !dbg !626
  %3 = load i32, i32* %u32Temp, align 4, !dbg !627
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !628
  %conv4 = zext i16 %4 to i32, !dbg !628
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !629
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !629
  %div = udiv i32 %3, %conv4, !dbg !629, !klee.check.div !123
  store i32 %div, i32* %u32Temp, align 4, !dbg !630
  %5 = load i32, i32* %u32Temp, align 4, !dbg !631
  %cmp5 = icmp ult i32 %5, 65535, !dbg !633
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !634

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !635
  %and = and i32 %6, 65535, !dbg !637
  %conv8 = trunc i32 %and to i16, !dbg !635
  store i16 %conv8, i16* %retval, align 2, !dbg !638
  br label %return, !dbg !638

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !639
  br label %return, !dbg !639

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !641
  ret i16 %7, !dbg !641
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !642 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !645, metadata !DIExpression()), !dbg !646
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !647, metadata !DIExpression()), !dbg !648
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !649, metadata !DIExpression()), !dbg !650
  store i32 0, i32* %u32Temp1, align 4, !dbg !650
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !651, metadata !DIExpression()), !dbg !652
  store i32 0, i32* %u32Temp2, align 4, !dbg !652
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !653
  %conv = zext i16 %0 to i32, !dbg !653
  %and = and i32 %conv, 65535, !dbg !654
  %conv1 = trunc i32 %and to i16, !dbg !653
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !655
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !656
  %conv2 = zext i16 %1 to i32, !dbg !656
  %cmp = icmp eq i32 %conv2, 0, !dbg !658
  br i1 %cmp, label %if.then, label %if.else, !dbg !659

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !660
  br label %return, !dbg !660

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !662
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !664
  %conv4 = zext i16 %3 to i32, !dbg !664
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !665
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !665
  %div = udiv i32 %2, %conv4, !dbg !665, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !666
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !667
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !668
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !669
  %conv5 = zext i16 %6 to i32, !dbg !669
  %mul = mul i32 %5, %conv5, !dbg !670
  %sub = sub i32 %4, %mul, !dbg !671
  %shl = shl i32 %sub, 1, !dbg !672
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !673
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !674
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !675
  %conv6 = zext i16 %8 to i32, !dbg !675
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !676
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !676
  %div7 = udiv i32 %7, %conv6, !dbg !676, !klee.check.div !123
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !677
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !678
  %conv8 = zext i16 %10 to i32, !dbg !678
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !679
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !679
  %div9 = udiv i32 %9, %conv8, !dbg !679, !klee.check.div !123
  %add = add i32 %div7, %div9, !dbg !680
  store i32 %add, i32* %u32Temp2, align 4, !dbg !681
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !682
  %cmp10 = icmp ult i32 %11, 65535, !dbg !684
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !685

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !686
  %and13 = and i32 %12, 65535, !dbg !688
  %conv14 = trunc i32 %and13 to i16, !dbg !686
  store i16 %conv14, i16* %retval, align 2, !dbg !689
  br label %return, !dbg !689

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !690
  br label %return, !dbg !690

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !692
  ret i16 %13, !dbg !692
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !693 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !696, metadata !DIExpression()), !dbg !697
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !698, metadata !DIExpression()), !dbg !699
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !700, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !702, metadata !DIExpression()), !dbg !703
  store i32 0, i32* %s32Result, align 4, !dbg !703
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !704, metadata !DIExpression()), !dbg !705
  store i32 0, i32* %s32Temp1, align 4, !dbg !705
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !706
  %conv = sext i16 %0 to i32, !dbg !706
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !707
  %conv1 = zext i16 %1 to i32, !dbg !707
  %mul = mul nsw i32 %conv, %conv1, !dbg !708
  store i32 %mul, i32* %s32Result, align 4, !dbg !709
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !710
  %conv2 = sext i16 %2 to i32, !dbg !710
  %cmp = icmp eq i32 %conv2, 0, !dbg !712
  br i1 %cmp, label %if.then, label %if.else7, !dbg !713

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !714
  %cmp4 = icmp slt i32 %3, 0, !dbg !717
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !718

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !719
  br label %return, !dbg !719

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !721
  br label %return, !dbg !721

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !723
  %5 = load i32, i32* %s32Result, align 4, !dbg !725
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !726
  %conv8 = sext i16 %6 to i32, !dbg !726
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !727
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !727
  %div = sdiv i32 %5, %conv8, !dbg !727, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !728
  %conv9 = sext i16 %7 to i32, !dbg !728
  %mul10 = mul nsw i32 %div, %conv9, !dbg !729
  %sub = sub nsw i32 %4, %mul10, !dbg !730
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !731
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !732
  %shl = shl i32 %8, 1, !dbg !733
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !734
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !735
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !736
  %conv11 = sext i16 %10 to i32, !dbg !736
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !737
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !737
  %div12 = sdiv i32 %9, %conv11, !dbg !737, !klee.check.div !123
  %11 = load i32, i32* %s32Result, align 4, !dbg !738
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !739
  %conv13 = sext i16 %12 to i32, !dbg !739
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !740
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !740
  %div14 = sdiv i32 %11, %conv13, !dbg !740, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !741
  store i32 %add, i32* %s32Result, align 4, !dbg !742
  %13 = load i32, i32* %s32Result, align 4, !dbg !743
  %cmp15 = icmp slt i32 %13, 32767, !dbg !745
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !746

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !747
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !750
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !751

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !752
  %conv21 = trunc i32 %15 to i16, !dbg !754
  store i16 %conv21, i16* %retval, align 2, !dbg !755
  br label %return, !dbg !755

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !756
  br label %return, !dbg !756

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !758
  br label %return, !dbg !758

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !760
  ret i16 %16, !dbg !760
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !761 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !764, metadata !DIExpression()), !dbg !765
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !766, metadata !DIExpression()), !dbg !767
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !768, metadata !DIExpression()), !dbg !769
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !770, metadata !DIExpression()), !dbg !771
  store i32 0, i32* %s32Result, align 4, !dbg !771
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !772, metadata !DIExpression()), !dbg !773
  store i32 0, i32* %s32Temp1, align 4, !dbg !773
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !774
  %conv = zext i16 %0 to i32, !dbg !774
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !775
  %conv1 = sext i16 %1 to i32, !dbg !775
  %mul = mul nsw i32 %conv, %conv1, !dbg !776
  store i32 %mul, i32* %s32Result, align 4, !dbg !777
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !778
  %conv2 = zext i16 %2 to i32, !dbg !778
  %cmp = icmp eq i32 %conv2, 0, !dbg !780
  br i1 %cmp, label %if.then, label %if.else7, !dbg !781

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !782
  %cmp4 = icmp slt i32 %3, 0, !dbg !785
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !786

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !787
  br label %return, !dbg !787

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !789
  br label %return, !dbg !789

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !791
  %5 = load i32, i32* %s32Result, align 4, !dbg !793
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !794
  %conv8 = zext i16 %6 to i32, !dbg !794
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !795
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !795
  %div = sdiv i32 %5, %conv8, !dbg !795, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !796
  %conv9 = zext i16 %7 to i32, !dbg !796
  %mul10 = mul nsw i32 %div, %conv9, !dbg !797
  %sub = sub nsw i32 %4, %mul10, !dbg !798
  %shl = shl i32 %sub, 1, !dbg !799
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !800
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !801
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !802
  %conv11 = zext i16 %9 to i32, !dbg !802
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !803
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !803
  %div12 = sdiv i32 %8, %conv11, !dbg !803, !klee.check.div !123
  %10 = load i32, i32* %s32Result, align 4, !dbg !804
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !805
  %conv13 = zext i16 %11 to i32, !dbg !805
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !806
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !806
  %div14 = sdiv i32 %10, %conv13, !dbg !806, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !807
  store i32 %add, i32* %s32Result, align 4, !dbg !808
  %12 = load i32, i32* %s32Result, align 4, !dbg !809
  %cmp15 = icmp slt i32 %12, 32767, !dbg !811
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !812

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !813
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !816
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !817

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !818
  %conv21 = trunc i32 %14 to i16, !dbg !820
  store i16 %conv21, i16* %retval, align 2, !dbg !821
  br label %return, !dbg !821

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !822
  br label %return, !dbg !822

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !824
  br label %return, !dbg !824

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !826
  ret i16 %15, !dbg !826
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !827 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Result = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !830, metadata !DIExpression()), !dbg !831
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !832, metadata !DIExpression()), !dbg !833
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !834, metadata !DIExpression()), !dbg !835
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !836, metadata !DIExpression()), !dbg !837
  store i32 0, i32* %u32Result, align 4, !dbg !837
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !838, metadata !DIExpression()), !dbg !839
  store i32 0, i32* %u32Temp1, align 4, !dbg !839
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !840, metadata !DIExpression()), !dbg !841
  store i32 0, i32* %s32Result, align 4, !dbg !841
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !842, metadata !DIExpression()), !dbg !843
  store i32 0, i32* %s32Temp1, align 4, !dbg !843
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !844
  %conv = sext i16 %0 to i32, !dbg !844
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !845
  %conv1 = zext i16 %1 to i32, !dbg !845
  %mul = mul nsw i32 %conv, %conv1, !dbg !846
  store i32 %mul, i32* %s32Result, align 4, !dbg !847
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !848
  %conv2 = sext i16 %2 to i32, !dbg !848
  %cmp = icmp eq i32 %conv2, 0, !dbg !850
  br i1 %cmp, label %if.then, label %if.else7, !dbg !851

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !852
  %cmp4 = icmp sge i32 %3, 0, !dbg !855
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !856

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !857
  br label %return, !dbg !857

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !859
  br label %return, !dbg !859

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !861
  %5 = load i32, i32* %s32Result, align 4, !dbg !863
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !864
  %conv8 = sext i16 %6 to i32, !dbg !864
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !865
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !865
  %div = sdiv i32 %5, %conv8, !dbg !865, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !866
  %conv9 = sext i16 %7 to i32, !dbg !866
  %mul10 = mul nsw i32 %div, %conv9, !dbg !867
  %sub = sub nsw i32 %4, %mul10, !dbg !868
  %shl = shl i32 %sub, 1, !dbg !869
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !870
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !871
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !872
  %conv11 = sext i16 %9 to i32, !dbg !872
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !873
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !873
  %div12 = sdiv i32 %8, %conv11, !dbg !873, !klee.check.div !123
  %10 = load i32, i32* %s32Result, align 4, !dbg !874
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !875
  %conv13 = sext i16 %11 to i32, !dbg !875
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !876
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !876
  %div14 = sdiv i32 %10, %conv13, !dbg !876, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !877
  store i32 %add, i32* %s32Result, align 4, !dbg !878
  %12 = load i32, i32* %s32Result, align 4, !dbg !879
  %cmp15 = icmp slt i32 %12, 65535, !dbg !881
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !882

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !883
  %cmp18 = icmp sgt i32 %13, 0, !dbg !886
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !887

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !888
  %conv21 = trunc i32 %14 to i16, !dbg !890
  store i16 %conv21, i16* %retval, align 2, !dbg !891
  br label %return, !dbg !891

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !892
  br label %return, !dbg !892

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !894
  br label %return, !dbg !894

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !896
  ret i16 %15, !dbg !896
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !897 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !900, metadata !DIExpression()), !dbg !901
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !902, metadata !DIExpression()), !dbg !903
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !904, metadata !DIExpression()), !dbg !905
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !906, metadata !DIExpression()), !dbg !907
  store i32 0, i32* %s32Result, align 4, !dbg !907
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !908, metadata !DIExpression()), !dbg !909
  store i32 0, i32* %s32Temp1, align 4, !dbg !909
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !910
  %conv = sext i16 %0 to i32, !dbg !910
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !911
  %conv1 = zext i16 %1 to i32, !dbg !911
  %mul = mul nsw i32 %conv, %conv1, !dbg !912
  store i32 %mul, i32* %s32Result, align 4, !dbg !913
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !914
  %conv2 = zext i16 %2 to i32, !dbg !914
  %cmp = icmp eq i32 %conv2, 0, !dbg !916
  br i1 %cmp, label %if.then, label %if.else7, !dbg !917

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !918
  %cmp4 = icmp sge i32 %3, 0, !dbg !921
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !922

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !923
  br label %return, !dbg !923

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !925
  br label %return, !dbg !925

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !927
  %5 = load i32, i32* %s32Result, align 4, !dbg !929
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !930
  %conv8 = zext i16 %6 to i32, !dbg !930
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !931
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !931
  %div = sdiv i32 %5, %conv8, !dbg !931, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !932
  %conv9 = zext i16 %7 to i32, !dbg !932
  %mul10 = mul nsw i32 %div, %conv9, !dbg !933
  %sub = sub nsw i32 %4, %mul10, !dbg !934
  %shl = shl i32 %sub, 1, !dbg !935
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !936
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !937
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !938
  %conv11 = zext i16 %9 to i32, !dbg !938
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !939
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !939
  %div12 = sdiv i32 %8, %conv11, !dbg !939, !klee.check.div !123
  %10 = load i32, i32* %s32Result, align 4, !dbg !940
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !941
  %conv13 = zext i16 %11 to i32, !dbg !941
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !942
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !942
  %div14 = sdiv i32 %10, %conv13, !dbg !942, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !943
  store i32 %add, i32* %s32Result, align 4, !dbg !944
  %12 = load i32, i32* %s32Result, align 4, !dbg !945
  %cmp15 = icmp slt i32 %12, 65535, !dbg !947
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !948

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !949
  %cmp18 = icmp sgt i32 %13, 0, !dbg !952
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !953

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !954
  %conv21 = trunc i32 %14 to i16, !dbg !956
  store i16 %conv21, i16* %retval, align 2, !dbg !957
  br label %return, !dbg !957

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !958
  br label %return, !dbg !958

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !960
  br label %return, !dbg !960

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !962
  ret i16 %15, !dbg !962
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !963 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !966, metadata !DIExpression()), !dbg !967
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !968, metadata !DIExpression()), !dbg !969
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !970, metadata !DIExpression()), !dbg !971
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !972, metadata !DIExpression()), !dbg !973
  store i32 0, i32* %u32Temp1, align 4, !dbg !973
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !974, metadata !DIExpression()), !dbg !975
  store i16 0, i16* %u16TempDenom, align 2, !dbg !975
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !976
  %conv = zext i16 %0 to i32, !dbg !976
  %cmp = icmp eq i32 %conv, 0, !dbg !978
  br i1 %cmp, label %if.then, label %if.else, !dbg !979

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !980
  br label %return, !dbg !980

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !982
  %conv2 = zext i16 %1 to i32, !dbg !982
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !984
  %conv3 = zext i16 %2 to i32, !dbg !984
  %mul = mul nsw i32 %conv2, %conv3, !dbg !985
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !986
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !987
  %conv4 = zext i16 %3 to i32, !dbg !987
  %shr = ashr i32 %conv4, 1, !dbg !988
  %conv5 = trunc i32 %shr to i16, !dbg !987
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !989
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !990
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !991
  %conv6 = zext i16 %5 to i32, !dbg !991
  %add = add i32 %4, %conv6, !dbg !992
  store i32 %add, i32* %u32Temp1, align 4, !dbg !993
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !994
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !995
  %conv7 = zext i16 %7 to i32, !dbg !995
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !996
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !996
  %div = udiv i32 %6, %conv7, !dbg !996, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !997
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !998
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1000
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1001

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1002
  %and = and i32 %9, 65535, !dbg !1004
  %conv11 = trunc i32 %and to i16, !dbg !1005
  store i16 %conv11, i16* %retval, align 2, !dbg !1006
  br label %return, !dbg !1006

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1007
  br label %return, !dbg !1007

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1009
  ret i16 %10, !dbg !1009
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1010 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1013, metadata !DIExpression()), !dbg !1014
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1015, metadata !DIExpression()), !dbg !1016
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1017, metadata !DIExpression()), !dbg !1018
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1019, metadata !DIExpression()), !dbg !1020
  store i32 0, i32* %u32Temp1, align 4, !dbg !1020
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1021
  %cmp = icmp eq i32 %0, 0, !dbg !1023
  br i1 %cmp, label %if.then, label %if.else, !dbg !1024

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1025
  br label %return, !dbg !1025

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1027
  %conv = zext i16 %1 to i32, !dbg !1027
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1029
  %conv1 = zext i16 %2 to i32, !dbg !1029
  %mul = mul nsw i32 %conv, %conv1, !dbg !1030
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1031
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1032
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1032
  %div = udiv i32 %mul, %3, !dbg !1032, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1033
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1034
  %conv2 = zext i16 %4 to i32, !dbg !1034
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1036
  %conv3 = zext i16 %5 to i32, !dbg !1036
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1037
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1038
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1039
  %mul5 = mul i32 %6, %7, !dbg !1040
  %sub = sub i32 %mul4, %mul5, !dbg !1041
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1042
  %div6 = udiv i32 %8, 2, !dbg !1043
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1044
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1045

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1046
  %inc = add i32 %9, 1, !dbg !1046
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1046
  br label %if.end, !dbg !1048

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1049
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1051
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1052

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1053
  %and = and i32 %11, 65535, !dbg !1055
  %conv13 = trunc i32 %and to i16, !dbg !1056
  store i16 %conv13, i16* %retval, align 2, !dbg !1057
  br label %return, !dbg !1057

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1058
  br label %return, !dbg !1058

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1060
  ret i16 %12, !dbg !1060
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1061 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1064, metadata !DIExpression()), !dbg !1065
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1066, metadata !DIExpression()), !dbg !1067
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1068, metadata !DIExpression()), !dbg !1069
  store i32 0, i32* %u32Temp1, align 4, !dbg !1069
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1070
  %conv = zext i16 %0 to i32, !dbg !1070
  %cmp = icmp eq i32 %conv, 0, !dbg !1072
  br i1 %cmp, label %if.then, label %if.else, !dbg !1073

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1074
  br label %return, !dbg !1074

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1076
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1078
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1079
  %conv2 = zext i16 %3 to i32, !dbg !1079
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1080
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1080
  %div = udiv i32 %2, %conv2, !dbg !1080, !klee.check.div !123
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1081
  %conv3 = zext i16 %4 to i32, !dbg !1081
  %mul = mul i32 %div, %conv3, !dbg !1082
  %sub = sub i32 %1, %mul, !dbg !1083
  %shl = shl i32 %sub, 1, !dbg !1084
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1085
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1086
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1087
  %conv4 = zext i16 %6 to i32, !dbg !1087
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1088
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1088
  %div5 = udiv i32 %5, %conv4, !dbg !1088, !klee.check.div !123
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1089
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1090
  %conv6 = zext i16 %8 to i32, !dbg !1090
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1091
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1091
  %div7 = udiv i32 %7, %conv6, !dbg !1091, !klee.check.div !123
  %add = add i32 %div5, %div7, !dbg !1092
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1093
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1094
  store i32 %9, i32* %retval, align 4, !dbg !1095
  br label %return, !dbg !1095

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1096
  ret i32 %10, !dbg !1096
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1097 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1100, metadata !DIExpression()), !dbg !1101
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1102, metadata !DIExpression()), !dbg !1103
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1104, metadata !DIExpression()), !dbg !1105
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1106, metadata !DIExpression()), !dbg !1107
  store i32 0, i32* %s32Temp1, align 4, !dbg !1107
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1108, metadata !DIExpression()), !dbg !1109
  store i32 0, i32* %s32Temp2, align 4, !dbg !1109
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1110, metadata !DIExpression()), !dbg !1111
  store i32 0, i32* %s32Temp3, align 4, !dbg !1111
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1112
  %conv = sext i16 %0 to i32, !dbg !1112
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1113
  %conv1 = sext i16 %1 to i32, !dbg !1113
  %mul = mul nsw i32 %conv, %conv1, !dbg !1114
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1115
  %2 = load i16, i16* %div.addr, align 2, !dbg !1116
  %conv2 = sext i16 %2 to i32, !dbg !1116
  %cmp = icmp eq i32 %conv2, 0, !dbg !1118
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1119

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1120
  %cmp4 = icmp slt i32 %3, 0, !dbg !1123
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1124

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1125
  br label %return, !dbg !1125

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1127
  br label %return, !dbg !1127

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1129
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1131
  %6 = load i16, i16* %div.addr, align 2, !dbg !1132
  %conv8 = sext i16 %6 to i32, !dbg !1132
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1133
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1133
  %div9 = sdiv i32 %5, %conv8, !dbg !1133, !klee.check.div !123
  %7 = load i16, i16* %div.addr, align 2, !dbg !1134
  %conv10 = sext i16 %7 to i32, !dbg !1134
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1135
  %sub = sub nsw i32 %4, %mul11, !dbg !1136
  %shl = shl i32 %sub, 1, !dbg !1137
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1138
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1139
  %9 = load i16, i16* %div.addr, align 2, !dbg !1140
  %conv12 = sext i16 %9 to i32, !dbg !1140
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1141
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1141
  %div13 = sdiv i32 %8, %conv12, !dbg !1141, !klee.check.div !123
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1142
  %11 = load i16, i16* %div.addr, align 2, !dbg !1143
  %conv14 = sext i16 %11 to i32, !dbg !1143
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1144
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1144
  %div15 = sdiv i32 %10, %conv14, !dbg !1144, !klee.check.div !123
  %add = add nsw i32 %div13, %div15, !dbg !1145
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1146
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1147
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1149
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1150

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1151
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1154
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1155

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1156
  %conv22 = trunc i32 %14 to i16, !dbg !1158
  store i16 %conv22, i16* %retval, align 2, !dbg !1159
  br label %return, !dbg !1159

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1160
  br label %return, !dbg !1160

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1162
  br label %return, !dbg !1162

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1164
  ret i16 %15, !dbg !1164
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1165 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1168, metadata !DIExpression()), !dbg !1169
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1170, metadata !DIExpression()), !dbg !1171
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1172, metadata !DIExpression()), !dbg !1173
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1174, metadata !DIExpression()), !dbg !1175
  store i32 0, i32* %s32Result, align 4, !dbg !1175
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1176, metadata !DIExpression()), !dbg !1177
  store i32 0, i32* %s32Temp1, align 4, !dbg !1177
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1178
  %conv = sext i16 %0 to i32, !dbg !1178
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1179
  %conv1 = sext i16 %1 to i32, !dbg !1179
  %mul = mul nsw i32 %conv, %conv1, !dbg !1180
  store i32 %mul, i32* %s32Result, align 4, !dbg !1181
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1182
  %conv2 = zext i16 %2 to i32, !dbg !1182
  %cmp = icmp eq i32 %conv2, 0, !dbg !1184
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1185

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1186
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1189
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1190

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1191
  br label %return, !dbg !1191

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1193
  %cmp7 = icmp eq i32 %4, 0, !dbg !1195
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1196

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1197
  br label %return, !dbg !1197

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1199
  br label %return, !dbg !1199

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1201
  %6 = load i32, i32* %s32Result, align 4, !dbg !1203
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1204
  %conv12 = zext i16 %7 to i32, !dbg !1204
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1205
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1205
  %div = sdiv i32 %6, %conv12, !dbg !1205, !klee.check.div !123
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1206
  %conv13 = zext i16 %8 to i32, !dbg !1206
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1207
  %sub = sub nsw i32 %5, %mul14, !dbg !1208
  %shl = shl i32 %sub, 1, !dbg !1209
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1210
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1211
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1212
  %conv15 = zext i16 %10 to i32, !dbg !1212
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1213
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1213
  %div16 = sdiv i32 %9, %conv15, !dbg !1213, !klee.check.div !123
  %11 = load i32, i32* %s32Result, align 4, !dbg !1214
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1215
  %conv17 = zext i16 %12 to i32, !dbg !1215
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1216
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1216
  %div18 = sdiv i32 %11, %conv17, !dbg !1216, !klee.check.div !123
  %add = add nsw i32 %div16, %div18, !dbg !1217
  store i32 %add, i32* %s32Result, align 4, !dbg !1218
  %13 = load i32, i32* %s32Result, align 4, !dbg !1219
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1221
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1222

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1223
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1226
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1227

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1228
  %conv25 = trunc i32 %15 to i16, !dbg !1230
  store i16 %conv25, i16* %retval, align 2, !dbg !1231
  br label %return, !dbg !1231

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1232
  br label %return, !dbg !1232

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1234
  br label %return, !dbg !1234

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1236
  ret i16 %16, !dbg !1236
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1237 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1240, metadata !DIExpression()), !dbg !1241
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1242, metadata !DIExpression()), !dbg !1243
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1244, metadata !DIExpression()), !dbg !1245
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1246
  %cmp = icmp eq i32 %0, 0, !dbg !1248
  br i1 %cmp, label %if.then, label %if.else, !dbg !1249

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1250
  br label %return, !dbg !1250

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1252
  %cmp1 = icmp sle i32 %1, 0, !dbg !1255
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1256

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1257
  br label %return, !dbg !1257

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1259
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1261
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1262
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1263
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1263
  %div = udiv i32 %3, %4, !dbg !1263, !klee.check.div !123
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1264
  %mul = mul i32 %div, %5, !dbg !1265
  %sub = sub i32 %2, %mul, !dbg !1266
  %shl = shl i32 %sub, 1, !dbg !1267
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1268
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1269
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1270
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1271
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1271
  %div4 = udiv i32 %6, %7, !dbg !1271, !klee.check.div !123
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1272
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1273
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1274
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1274
  %div5 = udiv i32 %8, %9, !dbg !1274, !klee.check.div !123
  %add = add i32 %div4, %div5, !dbg !1275
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1276
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1277
  store i32 %10, i32* %retval, align 4, !dbg !1278
  br label %return, !dbg !1278

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1279
  ret i32 %11, !dbg !1279
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1280 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1283, metadata !DIExpression()), !dbg !1284
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1285, metadata !DIExpression()), !dbg !1286
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1287, metadata !DIExpression()), !dbg !1288
  store i32 0, i32* %s32Temp1, align 4, !dbg !1288
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1289
  %cmp = icmp eq i32 %0, 0, !dbg !1291
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1292

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1293
  %cmp1 = icmp sge i32 %1, 0, !dbg !1296
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1297

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1298
  br label %return, !dbg !1298

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1300
  br label %return, !dbg !1300

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1302
  %cmp4 = icmp sge i32 %2, 0, !dbg !1305
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1306

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1307
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1309
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1310
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1311
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1311
  %div = udiv i32 %4, %5, !dbg !1311, !klee.check.div !123
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1312
  %mul = mul i32 %div, %6, !dbg !1313
  %sub = sub i32 %3, %mul, !dbg !1314
  %shl = shl i32 %sub, 1, !dbg !1315
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1316
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1317
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1318
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1319
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1319
  %div6 = udiv i32 %7, %8, !dbg !1319, !klee.check.div !123
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1320
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1321
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1322
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1322
  %div7 = udiv i32 %9, %10, !dbg !1322, !klee.check.div !123
  %add = add i32 %div6, %div7, !dbg !1323
  store i32 %add, i32* %retval, align 4, !dbg !1324
  br label %return, !dbg !1324

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1325
  br label %return, !dbg !1325

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1327
  ret i32 %11, !dbg !1327
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1328 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1331, metadata !DIExpression()), !dbg !1332
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1333, metadata !DIExpression()), !dbg !1334
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1335, metadata !DIExpression()), !dbg !1336
  store i32 0, i32* %u32Temp1, align 4, !dbg !1336
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1337, metadata !DIExpression()), !dbg !1338
  store i32 0, i32* %u32Temp2, align 4, !dbg !1338
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1339
  %cmp = icmp eq i32 %0, 0, !dbg !1341
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1342

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1343
  %cmp1 = icmp slt i32 %1, 0, !dbg !1346
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1347

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1348
  br label %return, !dbg !1348

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1350
  br label %return, !dbg !1350

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1352
  %cmp4 = icmp sge i32 %2, 0, !dbg !1355
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1356

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1357
  %cmp6 = icmp eq i32 %3, 0, !dbg !1360
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1361

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1362
  br label %return, !dbg !1362

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1364
  %cmp9 = icmp sle i32 %4, 0, !dbg !1367
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1368

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1369
  br label %return, !dbg !1369

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1371
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1373
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1374
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1375
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1375
  %div = sdiv i32 %6, %7, !dbg !1375, !klee.check.div !123
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1376
  %mul = mul nsw i32 %div, %8, !dbg !1377
  %sub = sub nsw i32 %5, %mul, !dbg !1378
  %shl = shl i32 %sub, 1, !dbg !1379
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1380
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1381
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1382
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1383
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1383
  %div12 = udiv i32 %9, %10, !dbg !1383, !klee.check.div !123
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1384
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1385
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1386
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1386
  %div13 = sdiv i32 %11, %12, !dbg !1386, !klee.check.div !123
  %add = add i32 %div12, %div13, !dbg !1387
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1388
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1389
  store i32 %13, i32* %retval, align 4, !dbg !1390
  br label %return, !dbg !1390

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1391
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1394
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1395

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1396
  br label %return, !dbg !1396

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1398
  %sub18 = sub nsw i32 0, %15, !dbg !1400
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1401
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1402
  %sub19 = sub nsw i32 0, %16, !dbg !1403
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1404
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1405
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1406
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1407
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1408
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1408
  %div20 = sdiv i32 %18, %19, !dbg !1408, !klee.check.div !123
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1409
  %mul21 = mul nsw i32 %div20, %20, !dbg !1410
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1411
  %shl23 = shl i32 %sub22, 1, !dbg !1412
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1413
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1414
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1415
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1416
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1416
  %div24 = udiv i32 %21, %22, !dbg !1416, !klee.check.div !123
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1417
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1418
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1419
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1419
  %div25 = sdiv i32 %23, %24, !dbg !1419, !klee.check.div !123
  %add26 = add i32 %div24, %div25, !dbg !1420
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1421
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1422
  store i32 %25, i32* %retval, align 4, !dbg !1423
  br label %return, !dbg !1423

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1424
  ret i32 %26, !dbg !1424
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1425 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1428, metadata !DIExpression()), !dbg !1429
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1430, metadata !DIExpression()), !dbg !1431
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1432, metadata !DIExpression()), !dbg !1433
  store i32 0, i32* %u32Temp1, align 4, !dbg !1433
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1434, metadata !DIExpression()), !dbg !1435
  store i32 0, i32* %u32Temp2, align 4, !dbg !1435
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1436, metadata !DIExpression()), !dbg !1437
  store i32 0, i32* %u32Temp3, align 4, !dbg !1437
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1438, metadata !DIExpression()), !dbg !1439
  store i32 0, i32* %numerator_old, align 4, !dbg !1439
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1440
  %cmp = icmp eq i32 %0, 0, !dbg !1442
  br i1 %cmp, label %if.then, label %if.else, !dbg !1443

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1444
  br label %return, !dbg !1444

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1446
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1448
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1449
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1450
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1451
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1451
  %div = udiv i32 %3, %4, !dbg !1451, !klee.check.div !123
  %mul = mul i32 %2, %div, !dbg !1452
  %sub = sub i32 %1, %mul, !dbg !1453
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1454
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1455
  %and = and i32 %5, 1, !dbg !1457
  %cmp1 = icmp eq i32 %and, 0, !dbg !1458
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1459

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1460
  %shr = lshr i32 %6, 1, !dbg !1462
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1463
  br label %if.end, !dbg !1464

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1465
  %shr4 = lshr i32 %7, 1, !dbg !1467
  %add = add i32 %shr4, 1, !dbg !1468
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1469
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1470
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1472
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1473
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1474

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1475
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1477
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1478
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1478
  %div7 = udiv i32 %10, %11, !dbg !1478, !klee.check.div !123
  store i32 %div7, i32* %retval, align 4, !dbg !1479
  br label %return, !dbg !1479

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1480
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1482
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1483
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1483
  %div9 = udiv i32 %12, %13, !dbg !1483, !klee.check.div !123
  %add10 = add i32 %div9, 1, !dbg !1484
  store i32 %add10, i32* %retval, align 4, !dbg !1485
  br label %return, !dbg !1485

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1486
  ret i32 %14, !dbg !1486
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1487 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1490, metadata !DIExpression()), !dbg !1491
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1492, metadata !DIExpression()), !dbg !1493
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1494, metadata !DIExpression()), !dbg !1495
  store i32 0, i32* %u32Temp1, align 4, !dbg !1495
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1496, metadata !DIExpression()), !dbg !1497
  store i32 0, i32* %u32Temp2, align 4, !dbg !1497
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1498
  %cmp = icmp sle i32 %0, 0, !dbg !1500
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1501

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1502
  %cmp1 = icmp sge i32 %1, 0, !dbg !1505
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1506

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1507
  br label %return, !dbg !1507

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1509
  %sub = sub nsw i32 0, %2, !dbg !1511
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1512
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1513
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1514
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1515
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1516
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1516
  %div = udiv i32 %4, %5, !dbg !1516, !klee.check.div !123
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1517
  %mul = mul i32 %div, %6, !dbg !1518
  %sub3 = sub i32 %3, %mul, !dbg !1519
  %shl = shl i32 %sub3, 1, !dbg !1520
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1521
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1522
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1523
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1524
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1524
  %div4 = udiv i32 %7, %8, !dbg !1524, !klee.check.div !123
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1525
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1526
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1527
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1527
  %div5 = udiv i32 %9, %10, !dbg !1527, !klee.check.div !123
  %add = add i32 %div4, %div5, !dbg !1528
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1529
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1530
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1532
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1533

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1534
  %sub8 = sub i32 0, %12, !dbg !1536
  store i32 %sub8, i32* %retval, align 4, !dbg !1537
  br label %return, !dbg !1537

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1538
  br label %return, !dbg !1538

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1540
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1542
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1543
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1544
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1544
  %div11 = udiv i32 %14, %15, !dbg !1544, !klee.check.div !123
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1545
  %mul12 = mul i32 %div11, %16, !dbg !1546
  %sub13 = sub i32 %13, %mul12, !dbg !1547
  %shl14 = shl i32 %sub13, 1, !dbg !1548
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1549
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1550
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1551
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1552
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1552
  %div15 = udiv i32 %17, %18, !dbg !1552, !klee.check.div !123
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1553
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1554
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1555
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1555
  %div16 = udiv i32 %19, %20, !dbg !1555, !klee.check.div !123
  %add17 = add i32 %div15, %div16, !dbg !1556
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1557
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1558
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1560
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1561

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1562
  store i32 %22, i32* %retval, align 4, !dbg !1564
  br label %return, !dbg !1564

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1565
  br label %return, !dbg !1565

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1567
  ret i32 %23, !dbg !1567
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1568 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %u32Temp0 = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1571, metadata !DIExpression()), !dbg !1572
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1573, metadata !DIExpression()), !dbg !1574
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1575, metadata !DIExpression()), !dbg !1576
  store i32 0, i32* %s32Temp1, align 4, !dbg !1576
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1577, metadata !DIExpression()), !dbg !1578
  store i32 0, i32* %s32Temp2, align 4, !dbg !1578
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1579, metadata !DIExpression()), !dbg !1580
  store i32 0, i32* %u32Temp0, align 4, !dbg !1580
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1581, metadata !DIExpression()), !dbg !1582
  store i32 0, i32* %u32Temp1, align 4, !dbg !1582
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1583, metadata !DIExpression()), !dbg !1584
  store i32 0, i32* %u32Temp2, align 4, !dbg !1584
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1585
  %cmp = icmp eq i32 %0, 0, !dbg !1587
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1588

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1589
  %cmp1 = icmp slt i32 %1, 0, !dbg !1592
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1593

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1594
  br label %return, !dbg !1594

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1596
  br label %return, !dbg !1596

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1598
  %cmp4 = icmp sle i32 %2, 0, !dbg !1601
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1602

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1603
  %sub = sub nsw i32 0, %3, !dbg !1605
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1606
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1607
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1608
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1609
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1609
  %div = udiv i32 %4, %5, !dbg !1609, !klee.check.div !123
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1610
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1611
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1612
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1613
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1614
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1614
  %div6 = udiv i32 %7, %8, !dbg !1614, !klee.check.div !123
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1615
  %mul = mul i32 %div6, %9, !dbg !1616
  %sub7 = sub i32 %6, %mul, !dbg !1617
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1618
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1619
  %and = and i32 %10, 1, !dbg !1621
  %cmp8 = icmp eq i32 %and, 0, !dbg !1622
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1623

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1624
  %shr = lshr i32 %11, 1, !dbg !1626
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1627
  br label %if.end, !dbg !1628

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1629
  %shr11 = lshr i32 %12, 1, !dbg !1631
  %add = add i32 %shr11, 1, !dbg !1632
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1633
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1634
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1636
  %cmp12 = icmp ult i32 %13, %14, !dbg !1637
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1638

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1639
  %neg = xor i32 %15, -1, !dbg !1641
  %add14 = add i32 %neg, 1, !dbg !1642
  store i32 %add14, i32* %retval, align 4, !dbg !1643
  br label %return, !dbg !1643

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1644
  %add16 = add i32 %16, 1, !dbg !1646
  %neg17 = xor i32 %add16, -1, !dbg !1647
  %add18 = add i32 %neg17, 1, !dbg !1648
  store i32 %add18, i32* %retval, align 4, !dbg !1649
  br label %return, !dbg !1649

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1650
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1652
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1653
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1654
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1654
  %div20 = udiv i32 %18, %19, !dbg !1654, !klee.check.div !123
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1655
  %mul21 = mul i32 %div20, %20, !dbg !1656
  %sub22 = sub i32 %17, %mul21, !dbg !1657
  %shl = shl i32 %sub22, 1, !dbg !1658
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1659
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1660
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1661
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1662
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1662
  %div23 = udiv i32 %21, %22, !dbg !1662, !klee.check.div !123
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1663
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1664
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1665
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1665
  %div24 = udiv i32 %23, %24, !dbg !1665, !klee.check.div !123
  %add25 = add i32 %div23, %div24, !dbg !1666
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1667
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1668
  store i32 %25, i32* %retval, align 4, !dbg !1669
  br label %return, !dbg !1669

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1670
  ret i32 %26, !dbg !1670
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1671 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %denominator_prime = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32numerator = alloca i32, align 4
  %u32denominator = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1674, metadata !DIExpression()), !dbg !1675
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1676, metadata !DIExpression()), !dbg !1677
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1678, metadata !DIExpression()), !dbg !1679
  store i32 0, i32* %s32Temp1, align 4, !dbg !1679
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1680, metadata !DIExpression()), !dbg !1681
  store i32 0, i32* %s32Temp2, align 4, !dbg !1681
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1682, metadata !DIExpression()), !dbg !1683
  store i32 0, i32* %denominator_prime, align 4, !dbg !1683
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1684, metadata !DIExpression()), !dbg !1685
  store i32 0, i32* %u32Temp1, align 4, !dbg !1685
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1686, metadata !DIExpression()), !dbg !1687
  store i32 0, i32* %u32Temp2, align 4, !dbg !1687
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1688, metadata !DIExpression()), !dbg !1689
  store i32 0, i32* %u32numerator, align 4, !dbg !1689
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1690, metadata !DIExpression()), !dbg !1691
  store i32 0, i32* %u32denominator, align 4, !dbg !1691
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1692
  %cmp = icmp slt i32 %0, 0, !dbg !1694
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1695

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1696
  %cmp1 = icmp sle i32 %1, 0, !dbg !1699
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1700

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1701
  %cmp3 = icmp sge i32 %2, 0, !dbg !1704
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1705

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1706
  br label %return, !dbg !1706

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1708
  %sub = sub nsw i32 0, %3, !dbg !1710
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1711
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1712
  %sub5 = sub nsw i32 0, %4, !dbg !1713
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1714
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1715
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1716
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1717
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1718
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1718
  %div = udiv i32 %6, %7, !dbg !1718, !klee.check.div !123
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1719
  %mul = mul i32 %div, %8, !dbg !1720
  %sub6 = sub i32 %5, %mul, !dbg !1721
  %shl = shl i32 %sub6, 1, !dbg !1722
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1723
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1724
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1725
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1726
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1726
  %div7 = udiv i32 %9, %10, !dbg !1726, !klee.check.div !123
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1727
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1728
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1729
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1729
  %div8 = udiv i32 %11, %12, !dbg !1729, !klee.check.div !123
  %add = add i32 %div7, %div8, !dbg !1730
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1731
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1732
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1734
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1735

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1736
  store i32 %14, i32* %retval, align 4, !dbg !1738
  br label %return, !dbg !1738

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1739
  br label %return, !dbg !1739

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1741
  %neg = xor i32 %15, -1, !dbg !1743
  %add13 = add nsw i32 %neg, 1, !dbg !1744
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1745
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1746
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1747
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1748
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1749
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1749
  %div14 = udiv i32 %17, %18, !dbg !1749, !klee.check.div !123
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1750
  %mul15 = mul i32 %div14, %19, !dbg !1751
  %sub16 = sub i32 %16, %mul15, !dbg !1752
  %shl17 = shl i32 %sub16, 1, !dbg !1753
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1754
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1755
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1756
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1757
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1757
  %div18 = udiv i32 %20, %21, !dbg !1757, !klee.check.div !123
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1758
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1759
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1760
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1760
  %div19 = sdiv i32 %22, %23, !dbg !1760, !klee.check.div !123
  %add20 = add i32 %div18, %div19, !dbg !1761
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1762
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1763
  %neg21 = xor i32 %24, -1, !dbg !1764
  %add22 = add nsw i32 %neg21, 1, !dbg !1765
  store i32 %add22, i32* %retval, align 4, !dbg !1766
  br label %return, !dbg !1766

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1767
  %cmp24 = icmp sle i32 %25, 0, !dbg !1770
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1771

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1772
  %cmp26 = icmp sge i32 %26, 0, !dbg !1775
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1776

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1777
  br label %return, !dbg !1777

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1779
  %neg29 = xor i32 %27, -1, !dbg !1781
  %add30 = add nsw i32 %neg29, 1, !dbg !1782
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1783
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1784
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1785
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1786
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1787
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1787
  %div31 = udiv i32 %29, %30, !dbg !1787, !klee.check.div !123
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1788
  %mul32 = mul i32 %div31, %31, !dbg !1789
  %sub33 = sub i32 %28, %mul32, !dbg !1790
  %shl34 = shl i32 %sub33, 1, !dbg !1791
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1792
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1793
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1794
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1795
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1795
  %div35 = udiv i32 %32, %33, !dbg !1795, !klee.check.div !123
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1796
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1797
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1798
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1798
  %div36 = udiv i32 %34, %35, !dbg !1798, !klee.check.div !123
  %add37 = add i32 %div35, %div36, !dbg !1799
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1800
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1801
  %neg38 = xor i32 %36, -1, !dbg !1802
  %add39 = add nsw i32 %neg38, 1, !dbg !1803
  store i32 %add39, i32* %retval, align 4, !dbg !1804
  br label %return, !dbg !1804

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1805
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1807
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1808
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1809
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1809
  %div41 = sdiv i32 %38, %39, !dbg !1809, !klee.check.div !123
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1810
  %mul42 = mul nsw i32 %div41, %40, !dbg !1811
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1812
  %shl44 = shl i32 %sub43, 1, !dbg !1813
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1814
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1815
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1816
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1817
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1817
  %div45 = sdiv i32 %41, %42, !dbg !1817, !klee.check.div !123
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1818
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1819
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1820
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1820
  %div46 = udiv i32 %43, %44, !dbg !1820, !klee.check.div !123
  %add47 = add i32 %div45, %div46, !dbg !1821
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1822
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1823
  store i32 %45, i32* %retval, align 4, !dbg !1824
  br label %return, !dbg !1824

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1825
  ret i32 %46, !dbg !1825
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1826 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %numerator_prime = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1829, metadata !DIExpression()), !dbg !1830
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1831, metadata !DIExpression()), !dbg !1832
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1833, metadata !DIExpression()), !dbg !1834
  store i32 0, i32* %numerator_prime, align 4, !dbg !1834
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1835, metadata !DIExpression()), !dbg !1836
  store i32 0, i32* %u32Temp1, align 4, !dbg !1836
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1837, metadata !DIExpression()), !dbg !1838
  store i32 0, i32* %u32Temp2, align 4, !dbg !1838
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1839, metadata !DIExpression()), !dbg !1840
  store i32 0, i32* %u32Temp3, align 4, !dbg !1840
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1841, metadata !DIExpression()), !dbg !1842
  store i32 0, i32* %s32Temp1, align 4, !dbg !1842
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1843, metadata !DIExpression()), !dbg !1844
  store i32 0, i32* %s32Temp2, align 4, !dbg !1844
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1845, metadata !DIExpression()), !dbg !1846
  store i32 0, i32* %s32Temp3, align 4, !dbg !1846
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1847
  %cmp = icmp eq i32 %0, 0, !dbg !1849
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1850

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1851
  %cmp1 = icmp slt i32 %1, 0, !dbg !1854
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1855

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1856
  br label %return, !dbg !1856

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1858
  br label %return, !dbg !1858

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1860
  %cmp4 = icmp slt i32 %2, 0, !dbg !1863
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1864

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1865
  %sub = sub nsw i32 0, %3, !dbg !1867
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1868
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1869
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1870
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1871
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1871
  %div = udiv i32 %4, %5, !dbg !1871, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1872
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1873
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1874
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1875
  %mul = mul i32 %7, %8, !dbg !1876
  %sub6 = sub i32 %6, %mul, !dbg !1877
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1878
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1879
  %and = and i32 %9, 1, !dbg !1881
  %cmp7 = icmp eq i32 %and, 0, !dbg !1882
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1883

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1884
  %shr = lshr i32 %10, 1, !dbg !1886
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1887
  br label %if.end, !dbg !1888

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1889
  %shr10 = lshr i32 %11, 1, !dbg !1891
  %add = add i32 %shr10, 1, !dbg !1892
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1893
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1894
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1896
  %cmp11 = icmp ult i32 %12, %13, !dbg !1897
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1898

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1899
  %neg = xor i32 %14, -1, !dbg !1901
  %add13 = add i32 %neg, 1, !dbg !1902
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1903
  br label %if.end18, !dbg !1904

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1905
  %add15 = add i32 %15, 1, !dbg !1907
  %neg16 = xor i32 %add15, -1, !dbg !1908
  %add17 = add i32 %neg16, 1, !dbg !1909
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1910
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1911
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1913
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1914

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1915
  %conv = trunc i32 %17 to i16, !dbg !1917
  store i16 %conv, i16* %retval, align 2, !dbg !1918
  br label %return, !dbg !1918

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1919
  br label %return, !dbg !1919

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1921
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1923
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1924
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1924
  %div23 = udiv i32 %18, %19, !dbg !1924, !klee.check.div !123
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1925
  %mul24 = mul i32 %div23, %20, !dbg !1926
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1927
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1928
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1929
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1930
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1931
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1931
  %div25 = udiv i32 %22, %23, !dbg !1931, !klee.check.div !123
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1932
  %mul26 = mul i32 %div25, %24, !dbg !1933
  %sub27 = sub i32 %21, %mul26, !dbg !1934
  %shl = shl i32 %sub27, 1, !dbg !1935
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1936
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1937
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1938
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1939
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1939
  %div28 = udiv i32 %25, %26, !dbg !1939, !klee.check.div !123
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1940
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1941
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1942
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1942
  %div29 = udiv i32 %27, %28, !dbg !1942, !klee.check.div !123
  %add30 = add i32 %div28, %div29, !dbg !1943
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1944
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1945
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1947
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1948

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1949
  %conv34 = trunc i32 %30 to i16, !dbg !1951
  store i16 %conv34, i16* %retval, align 2, !dbg !1952
  br label %return, !dbg !1952

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1953
  br label %return, !dbg !1953

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1955
  ret i16 %31, !dbg !1955
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1956 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1962, metadata !DIExpression()), !dbg !1963
  %2 = icmp eq i64 %0, 0, !dbg !1964
  br i1 %2, label %3, label %4, !dbg !1966

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1967
  unreachable, !dbg !1967

4:                                                ; preds = %1
  ret void, !dbg !1968
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !1969 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1975, metadata !DIExpression()), !dbg !1977
  call void @llvm.dbg.value(metadata i64 %1, metadata !1976, metadata !DIExpression()), !dbg !1977
  %3 = icmp ult i64 %1, %0, !dbg !1978
  br i1 %3, label %5, label %4, !dbg !1980

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !1981
  unreachable, !dbg !1981

5:                                                ; preds = %2
  ret void, !dbg !1983
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!35, !2, !37, !39}
!llvm.ident = !{!41, !41, !42, !42}
!llvm.module.flags = !{!43, !44, !45, !46, !47}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !33, line: 21, type: !34, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !32, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0047/div_Ccode_alarm_0047.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0047")
!4 = !{}
!5 = !{!6, !11, !12, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !13, line: 11, baseType: !14)
!13 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0047")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 26, baseType: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 41, baseType: !11)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !17, line: 26, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 42, baseType: !19)
!19 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !13, line: 9, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !7, line: 25, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !9, line: 39, baseType: !23)
!23 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !13, line: 6, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !17, line: 24, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 38, baseType: !27)
!27 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !13, line: 8, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !17, line: 25, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !9, line: 40, baseType: !31)
!31 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!32 = !{!0}
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0047")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0047/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0047")
!37 = distinct !DICompileUnit(language: DW_LANG_C89, file: !38, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!38 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!39 = distinct !DICompileUnit(language: DW_LANG_C89, file: !40, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!40 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!41 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!42 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!43 = !{i32 7, !"Dwarf Version", i32 4}
!44 = !{i32 2, !"Debug Info Version", i32 3}
!45 = !{i32 1, !"wchar_size", i32 4}
!46 = !{i32 7, !"uwtable", i32 1}
!47 = !{i32 7, !"frame-pointer", i32 2}
!48 = distinct !DISubprogram(name: "main", scope: !49, file: !49, line: 7, type: !50, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !35, retainedNodes: !4)
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0047")
!50 = !DISubroutineType(types: !51)
!51 = !{!11}
!52 = !DILocalVariable(name: "numerator", scope: !48, file: !49, line: 9, type: !21)
!53 = !DILocation(line: 9, column: 13, scope: !48)
!54 = !DILocalVariable(name: "denominator", scope: !48, file: !49, line: 10, type: !21)
!55 = !DILocation(line: 10, column: 13, scope: !48)
!56 = !DILocalVariable(name: "result", scope: !48, file: !49, line: 11, type: !21)
!57 = !DILocation(line: 11, column: 13, scope: !48)
!58 = !DILocation(line: 13, column: 24, scope: !48)
!59 = !DILocation(line: 13, column: 5, scope: !48)
!60 = !DILocation(line: 14, column: 24, scope: !48)
!61 = !DILocation(line: 14, column: 5, scope: !48)
!62 = !DILocation(line: 16, column: 36, scope: !48)
!63 = !DILocation(line: 16, column: 47, scope: !48)
!64 = !DILocation(line: 16, column: 14, scope: !48)
!65 = !DILocation(line: 16, column: 12, scope: !48)
!66 = !DILocation(line: 18, column: 11, scope: !48)
!67 = !DILocation(line: 19, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !69, file: !69, line: 170, type: !70, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0047")
!70 = !DISubroutineType(types: !71)
!71 = !{!20, !20, !20}
!72 = !DILocalVariable(name: "numerator", arg: 1, scope: !68, file: !69, line: 170, type: !20)
!73 = !DILocation(line: 170, column: 31, scope: !68)
!74 = !DILocalVariable(name: "denominator", arg: 2, scope: !68, file: !69, line: 170, type: !20)
!75 = !DILocation(line: 170, column: 47, scope: !68)
!76 = !DILocalVariable(name: "s32Temp1", scope: !68, file: !69, line: 172, type: !12)
!77 = !DILocation(line: 172, column: 6, scope: !68)
!78 = !DILocalVariable(name: "s32Temp2", scope: !68, file: !69, line: 172, type: !12)
!79 = !DILocation(line: 172, column: 15, scope: !68)
!80 = !DILocation(line: 174, column: 61, scope: !81)
!81 = distinct !DILexicalBlock(scope: !68, file: !69, line: 174, column: 6)
!82 = !DILocation(line: 174, column: 56, scope: !81)
!83 = !DILocation(line: 174, column: 46, scope: !81)
!84 = !DILocation(line: 174, column: 8, scope: !81)
!85 = !DILocation(line: 174, column: 6, scope: !68)
!86 = !DILocation(line: 175, column: 6, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !69, line: 174, column: 75)
!88 = !DILocation(line: 177, column: 13, scope: !68)
!89 = !DILocation(line: 177, column: 22, scope: !68)
!90 = !DILocation(line: 177, column: 11, scope: !68)
!91 = !DILocation(line: 179, column: 6, scope: !92)
!92 = distinct !DILexicalBlock(scope: !68, file: !69, line: 179, column: 6)
!93 = !DILocation(line: 179, column: 18, scope: !92)
!94 = !DILocation(line: 179, column: 6, scope: !68)
!95 = !DILocation(line: 181, column: 7, scope: !96)
!96 = distinct !DILexicalBlock(scope: !97, file: !69, line: 181, column: 7)
!97 = distinct !DILexicalBlock(scope: !92, file: !69, line: 180, column: 2)
!98 = !DILocation(line: 181, column: 17, scope: !96)
!99 = !DILocation(line: 181, column: 7, scope: !97)
!100 = !DILocation(line: 183, column: 4, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !69, line: 182, column: 3)
!102 = !DILocation(line: 187, column: 4, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !69, line: 186, column: 3)
!104 = !DILocation(line: 192, column: 7, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !69, line: 192, column: 7)
!106 = distinct !DILexicalBlock(scope: !92, file: !69, line: 191, column: 2)
!107 = !DILocation(line: 192, column: 16, scope: !105)
!108 = !DILocation(line: 192, column: 7, scope: !106)
!109 = !DILocation(line: 195, column: 47, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !69, line: 195, column: 8)
!111 = distinct !DILexicalBlock(scope: !105, file: !69, line: 193, column: 3)
!112 = !DILocation(line: 195, column: 37, scope: !110)
!113 = !DILocation(line: 195, column: 10, scope: !110)
!114 = !DILocation(line: 195, column: 8, scope: !111)
!115 = !DILocation(line: 196, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !69, line: 195, column: 63)
!117 = !DILocation(line: 199, column: 64, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !69, line: 199, column: 8)
!119 = !DILocation(line: 199, column: 87, scope: !118)
!120 = !DILocation(line: 199, column: 103, scope: !118)
!121 = !DILocation(line: 199, column: 98, scope: !118)
!122 = !DILocation(line: 199, column: 96, scope: !118)
!123 = !{!"True"}
!124 = !DILocation(line: 199, column: 123, scope: !118)
!125 = !DILocation(line: 199, column: 118, scope: !118)
!126 = !DILocation(line: 199, column: 116, scope: !118)
!127 = !DILocation(line: 199, column: 73, scope: !118)
!128 = !DILocation(line: 199, column: 48, scope: !118)
!129 = !DILocation(line: 199, column: 10, scope: !118)
!130 = !DILocation(line: 199, column: 8, scope: !111)
!131 = !DILocation(line: 200, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !118, file: !69, line: 199, column: 141)
!133 = !DILocation(line: 203, column: 51, scope: !134)
!134 = distinct !DILexicalBlock(scope: !111, file: !69, line: 203, column: 8)
!135 = !DILocation(line: 203, column: 67, scope: !134)
!136 = !DILocation(line: 203, column: 62, scope: !134)
!137 = !DILocation(line: 203, column: 60, scope: !134)
!138 = !DILocation(line: 203, column: 35, scope: !134)
!139 = !DILocation(line: 203, column: 97, scope: !134)
!140 = !DILocation(line: 203, column: 92, scope: !134)
!141 = !DILocation(line: 203, column: 82, scope: !134)
!142 = !DILocation(line: 203, column: 10, scope: !134)
!143 = !DILocation(line: 203, column: 8, scope: !111)
!144 = !DILocation(line: 204, column: 8, scope: !145)
!145 = distinct !DILexicalBlock(scope: !134, file: !69, line: 203, column: 113)
!146 = !DILocation(line: 207, column: 54, scope: !147)
!147 = distinct !DILexicalBlock(scope: !111, file: !69, line: 207, column: 8)
!148 = !DILocation(line: 207, column: 77, scope: !147)
!149 = !DILocation(line: 207, column: 93, scope: !147)
!150 = !DILocation(line: 207, column: 88, scope: !147)
!151 = !DILocation(line: 207, column: 86, scope: !147)
!152 = !DILocation(line: 207, column: 113, scope: !147)
!153 = !DILocation(line: 207, column: 108, scope: !147)
!154 = !DILocation(line: 207, column: 106, scope: !147)
!155 = !DILocation(line: 207, column: 63, scope: !147)
!156 = !DILocation(line: 207, column: 38, scope: !147)
!157 = !DILocation(line: 207, column: 10, scope: !147)
!158 = !DILocation(line: 207, column: 8, scope: !111)
!159 = !DILocation(line: 208, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !147, file: !69, line: 207, column: 146)
!161 = !DILocation(line: 215, column: 42, scope: !111)
!162 = !DILocation(line: 215, column: 65, scope: !111)
!163 = !DILocation(line: 215, column: 81, scope: !111)
!164 = !DILocation(line: 215, column: 76, scope: !111)
!165 = !DILocation(line: 215, column: 74, scope: !111)
!166 = !DILocation(line: 215, column: 101, scope: !111)
!167 = !DILocation(line: 215, column: 96, scope: !111)
!168 = !DILocation(line: 215, column: 94, scope: !111)
!169 = !DILocation(line: 215, column: 51, scope: !111)
!170 = !DILocation(line: 215, column: 115, scope: !111)
!171 = !DILocation(line: 215, column: 26, scope: !111)
!172 = !DILocation(line: 215, column: 24, scope: !111)
!173 = !DILocation(line: 216, column: 4, scope: !111)
!174 = !DILocation(line: 237, column: 7, scope: !175)
!175 = distinct !DILexicalBlock(scope: !176, file: !69, line: 237, column: 7)
!176 = distinct !DILexicalBlock(scope: !105, file: !69, line: 236, column: 3)
!177 = !DILocation(line: 237, column: 19, scope: !175)
!178 = !DILocation(line: 237, column: 7, scope: !176)
!179 = !DILocation(line: 239, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !175, file: !69, line: 238, column: 4)
!181 = !DILocation(line: 239, column: 29, scope: !180)
!182 = !DILocation(line: 239, column: 38, scope: !180)
!183 = !DILocation(line: 239, column: 37, scope: !180)
!184 = !DILocation(line: 239, column: 53, scope: !180)
!185 = !DILocation(line: 239, column: 51, scope: !180)
!186 = !DILocation(line: 239, column: 26, scope: !180)
!187 = !DILocation(line: 239, column: 66, scope: !180)
!188 = !DILocation(line: 239, column: 14, scope: !180)
!189 = !DILocation(line: 240, column: 16, scope: !180)
!190 = !DILocation(line: 240, column: 25, scope: !180)
!191 = !DILocation(line: 240, column: 24, scope: !180)
!192 = !DILocation(line: 240, column: 14, scope: !180)
!193 = !DILocation(line: 241, column: 16, scope: !180)
!194 = !DILocation(line: 241, column: 28, scope: !180)
!195 = !DILocation(line: 241, column: 37, scope: !180)
!196 = !DILocation(line: 241, column: 43, scope: !180)
!197 = !DILocation(line: 241, column: 42, scope: !180)
!198 = !DILocation(line: 241, column: 25, scope: !180)
!199 = !DILocation(line: 241, column: 14, scope: !180)
!200 = !DILocation(line: 242, column: 8, scope: !201)
!201 = distinct !DILexicalBlock(scope: !180, file: !69, line: 242, column: 8)
!202 = !DILocation(line: 242, column: 17, scope: !201)
!203 = !DILocation(line: 242, column: 8, scope: !180)
!204 = !DILocation(line: 244, column: 9, scope: !205)
!205 = distinct !DILexicalBlock(scope: !206, file: !69, line: 244, column: 9)
!206 = distinct !DILexicalBlock(scope: !201, file: !69, line: 243, column: 5)
!207 = !DILocation(line: 244, column: 18, scope: !205)
!208 = !DILocation(line: 244, column: 9, scope: !206)
!209 = !DILocation(line: 246, column: 19, scope: !210)
!210 = distinct !DILexicalBlock(scope: !205, file: !69, line: 245, column: 6)
!211 = !DILocation(line: 246, column: 14, scope: !210)
!212 = !DILocation(line: 246, column: 7, scope: !210)
!213 = !DILocation(line: 250, column: 7, scope: !214)
!214 = distinct !DILexicalBlock(scope: !205, file: !69, line: 249, column: 6)
!215 = !DILocation(line: 255, column: 6, scope: !216)
!216 = distinct !DILexicalBlock(scope: !201, file: !69, line: 254, column: 5)
!217 = !DILocation(line: 260, column: 5, scope: !218)
!218 = distinct !DILexicalBlock(scope: !175, file: !69, line: 259, column: 4)
!219 = !DILocation(line: 264, column: 1, scope: !68)
!220 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !221, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!221 = !DISubroutineType(types: !222)
!222 = !{!11, !6}
!223 = !DILocalVariable(name: "left", arg: 1, scope: !220, file: !33, line: 84, type: !6)
!224 = !DILocation(line: 84, column: 51, scope: !220)
!225 = !DILocation(line: 86, column: 12, scope: !220)
!226 = !DILocation(line: 86, column: 17, scope: !220)
!227 = !DILocation(line: 86, column: 5, scope: !220)
!228 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !221, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!229 = !DILocalVariable(name: "denominator", arg: 1, scope: !228, file: !33, line: 24, type: !6)
!230 = !DILocation(line: 24, column: 40, scope: !228)
!231 = !DILocation(line: 26, column: 12, scope: !228)
!232 = !DILocation(line: 26, column: 24, scope: !228)
!233 = !DILocation(line: 26, column: 5, scope: !228)
!234 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !235, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!235 = !DISubroutineType(types: !236)
!236 = !{!11, !6, !6}
!237 = !DILocalVariable(name: "left", arg: 1, scope: !234, file: !33, line: 78, type: !6)
!238 = !DILocation(line: 78, column: 38, scope: !234)
!239 = !DILocalVariable(name: "right", arg: 2, scope: !234, file: !33, line: 78, type: !6)
!240 = !DILocation(line: 78, column: 52, scope: !234)
!241 = !DILocation(line: 80, column: 12, scope: !234)
!242 = !DILocation(line: 80, column: 19, scope: !234)
!243 = !DILocation(line: 80, column: 17, scope: !234)
!244 = !DILocation(line: 80, column: 25, scope: !234)
!245 = !DILocation(line: 80, column: 5, scope: !234)
!246 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !247, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!247 = !DISubroutineType(types: !248)
!248 = !{!11, !6, !16}
!249 = !DILocalVariable(name: "left", arg: 1, scope: !246, file: !33, line: 90, type: !6)
!250 = !DILocation(line: 90, column: 41, scope: !246)
!251 = !DILocalVariable(name: "count", arg: 2, scope: !246, file: !33, line: 90, type: !16)
!252 = !DILocation(line: 90, column: 56, scope: !246)
!253 = !DILocation(line: 92, column: 9, scope: !254)
!254 = distinct !DILexicalBlock(scope: !246, file: !33, line: 92, column: 9)
!255 = !DILocation(line: 92, column: 15, scope: !254)
!256 = !DILocation(line: 92, column: 9, scope: !246)
!257 = !DILocation(line: 93, column: 9, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !33, line: 92, column: 32)
!259 = !DILocation(line: 95, column: 12, scope: !246)
!260 = !DILocation(line: 95, column: 34, scope: !246)
!261 = !DILocation(line: 95, column: 31, scope: !246)
!262 = !DILocation(line: 95, column: 17, scope: !246)
!263 = !DILocation(line: 95, column: 41, scope: !246)
!264 = !DILocation(line: 95, column: 5, scope: !246)
!265 = !DILocation(line: 96, column: 1, scope: !246)
!266 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !69, file: !69, line: 281, type: !267, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!267 = !DISubroutineType(types: !268)
!268 = !{!20, !12, !20}
!269 = !DILocalVariable(name: "numerator", arg: 1, scope: !266, file: !69, line: 281, type: !12)
!270 = !DILocation(line: 281, column: 25, scope: !266)
!271 = !DILocalVariable(name: "denominator", arg: 2, scope: !266, file: !69, line: 281, type: !20)
!272 = !DILocation(line: 281, column: 41, scope: !266)
!273 = !DILocalVariable(name: "s32Temp1", scope: !266, file: !69, line: 283, type: !12)
!274 = !DILocation(line: 283, column: 6, scope: !266)
!275 = !DILocalVariable(name: "s32Temp2", scope: !266, file: !69, line: 283, type: !12)
!276 = !DILocation(line: 283, column: 17, scope: !266)
!277 = !DILocation(line: 284, column: 13, scope: !266)
!278 = !DILocation(line: 284, column: 11, scope: !266)
!279 = !DILocation(line: 285, column: 5, scope: !280)
!280 = distinct !DILexicalBlock(scope: !266, file: !69, line: 285, column: 5)
!281 = !DILocation(line: 285, column: 17, scope: !280)
!282 = !DILocation(line: 285, column: 5, scope: !266)
!283 = !DILocation(line: 287, column: 7, scope: !284)
!284 = distinct !DILexicalBlock(scope: !285, file: !69, line: 287, column: 7)
!285 = distinct !DILexicalBlock(scope: !280, file: !69, line: 286, column: 2)
!286 = !DILocation(line: 287, column: 17, scope: !284)
!287 = !DILocation(line: 287, column: 7, scope: !285)
!288 = !DILocation(line: 289, column: 4, scope: !289)
!289 = distinct !DILexicalBlock(scope: !284, file: !69, line: 288, column: 3)
!290 = !DILocation(line: 293, column: 4, scope: !291)
!291 = distinct !DILexicalBlock(scope: !284, file: !69, line: 292, column: 3)
!292 = !DILocation(line: 298, column: 6, scope: !293)
!293 = distinct !DILexicalBlock(scope: !294, file: !69, line: 298, column: 6)
!294 = distinct !DILexicalBlock(scope: !280, file: !69, line: 297, column: 2)
!295 = !DILocation(line: 298, column: 16, scope: !293)
!296 = !DILocation(line: 298, column: 6, scope: !294)
!297 = !DILocation(line: 300, column: 16, scope: !298)
!298 = distinct !DILexicalBlock(scope: !293, file: !69, line: 299, column: 3)
!299 = !DILocation(line: 300, column: 28, scope: !298)
!300 = !DILocation(line: 300, column: 37, scope: !298)
!301 = !DILocation(line: 300, column: 36, scope: !298)
!302 = !DILocation(line: 300, column: 52, scope: !298)
!303 = !DILocation(line: 300, column: 50, scope: !298)
!304 = !DILocation(line: 300, column: 25, scope: !298)
!305 = !DILocation(line: 300, column: 65, scope: !298)
!306 = !DILocation(line: 300, column: 13, scope: !298)
!307 = !DILocation(line: 301, column: 15, scope: !298)
!308 = !DILocation(line: 301, column: 24, scope: !298)
!309 = !DILocation(line: 301, column: 23, scope: !298)
!310 = !DILocation(line: 301, column: 13, scope: !298)
!311 = !DILocation(line: 302, column: 15, scope: !298)
!312 = !DILocation(line: 302, column: 27, scope: !298)
!313 = !DILocation(line: 302, column: 38, scope: !298)
!314 = !DILocation(line: 302, column: 37, scope: !298)
!315 = !DILocation(line: 302, column: 24, scope: !298)
!316 = !DILocation(line: 302, column: 13, scope: !298)
!317 = !DILocation(line: 303, column: 7, scope: !318)
!318 = distinct !DILexicalBlock(scope: !298, file: !69, line: 303, column: 7)
!319 = !DILocation(line: 303, column: 16, scope: !318)
!320 = !DILocation(line: 303, column: 7, scope: !298)
!321 = !DILocation(line: 305, column: 8, scope: !322)
!322 = distinct !DILexicalBlock(scope: !323, file: !69, line: 305, column: 8)
!323 = distinct !DILexicalBlock(scope: !318, file: !69, line: 304, column: 4)
!324 = !DILocation(line: 305, column: 17, scope: !322)
!325 = !DILocation(line: 305, column: 8, scope: !323)
!326 = !DILocation(line: 307, column: 18, scope: !327)
!327 = distinct !DILexicalBlock(scope: !322, file: !69, line: 306, column: 5)
!328 = !DILocation(line: 307, column: 13, scope: !327)
!329 = !DILocation(line: 307, column: 6, scope: !327)
!330 = !DILocation(line: 311, column: 6, scope: !331)
!331 = distinct !DILexicalBlock(scope: !322, file: !69, line: 310, column: 5)
!332 = !DILocation(line: 316, column: 5, scope: !333)
!333 = distinct !DILexicalBlock(scope: !318, file: !69, line: 315, column: 4)
!334 = !DILocation(line: 321, column: 7, scope: !335)
!335 = distinct !DILexicalBlock(scope: !336, file: !69, line: 321, column: 7)
!336 = distinct !DILexicalBlock(scope: !293, file: !69, line: 320, column: 3)
!337 = !DILocation(line: 321, column: 19, scope: !335)
!338 = !DILocation(line: 321, column: 7, scope: !336)
!339 = !DILocation(line: 323, column: 17, scope: !340)
!340 = distinct !DILexicalBlock(scope: !335, file: !69, line: 322, column: 4)
!341 = !DILocation(line: 323, column: 29, scope: !340)
!342 = !DILocation(line: 323, column: 38, scope: !340)
!343 = !DILocation(line: 323, column: 37, scope: !340)
!344 = !DILocation(line: 323, column: 53, scope: !340)
!345 = !DILocation(line: 323, column: 51, scope: !340)
!346 = !DILocation(line: 323, column: 26, scope: !340)
!347 = !DILocation(line: 323, column: 66, scope: !340)
!348 = !DILocation(line: 323, column: 14, scope: !340)
!349 = !DILocation(line: 324, column: 16, scope: !340)
!350 = !DILocation(line: 324, column: 25, scope: !340)
!351 = !DILocation(line: 324, column: 24, scope: !340)
!352 = !DILocation(line: 324, column: 14, scope: !340)
!353 = !DILocation(line: 325, column: 16, scope: !340)
!354 = !DILocation(line: 325, column: 28, scope: !340)
!355 = !DILocation(line: 325, column: 39, scope: !340)
!356 = !DILocation(line: 325, column: 38, scope: !340)
!357 = !DILocation(line: 325, column: 25, scope: !340)
!358 = !DILocation(line: 325, column: 14, scope: !340)
!359 = !DILocation(line: 326, column: 8, scope: !360)
!360 = distinct !DILexicalBlock(scope: !340, file: !69, line: 326, column: 8)
!361 = !DILocation(line: 326, column: 17, scope: !360)
!362 = !DILocation(line: 326, column: 8, scope: !340)
!363 = !DILocation(line: 328, column: 9, scope: !364)
!364 = distinct !DILexicalBlock(scope: !365, file: !69, line: 328, column: 9)
!365 = distinct !DILexicalBlock(scope: !360, file: !69, line: 327, column: 5)
!366 = !DILocation(line: 328, column: 18, scope: !364)
!367 = !DILocation(line: 328, column: 9, scope: !365)
!368 = !DILocation(line: 330, column: 19, scope: !369)
!369 = distinct !DILexicalBlock(scope: !364, file: !69, line: 329, column: 6)
!370 = !DILocation(line: 330, column: 14, scope: !369)
!371 = !DILocation(line: 330, column: 7, scope: !369)
!372 = !DILocation(line: 334, column: 7, scope: !373)
!373 = distinct !DILexicalBlock(scope: !364, file: !69, line: 333, column: 6)
!374 = !DILocation(line: 339, column: 6, scope: !375)
!375 = distinct !DILexicalBlock(scope: !360, file: !69, line: 338, column: 5)
!376 = !DILocation(line: 345, column: 5, scope: !377)
!377 = distinct !DILexicalBlock(scope: !335, file: !69, line: 344, column: 4)
!378 = !DILocation(line: 351, column: 1, scope: !266)
!379 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 369, type: !380, scopeLine: 370, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!380 = !DISubroutineType(types: !381)
!381 = !{!20, !20, !28}
!382 = !DILocalVariable(name: "numerator", arg: 1, scope: !379, file: !69, line: 369, type: !20)
!383 = !DILocation(line: 369, column: 31, scope: !379)
!384 = !DILocalVariable(name: "denominator", arg: 2, scope: !379, file: !69, line: 369, type: !28)
!385 = !DILocation(line: 369, column: 47, scope: !379)
!386 = !DILocalVariable(name: "u16Temp1", scope: !379, file: !69, line: 371, type: !28)
!387 = !DILocation(line: 371, column: 6, scope: !379)
!388 = !DILocalVariable(name: "s32Temp1", scope: !379, file: !69, line: 372, type: !12)
!389 = !DILocation(line: 372, column: 6, scope: !379)
!390 = !DILocalVariable(name: "s32Temp2", scope: !379, file: !69, line: 372, type: !12)
!391 = !DILocation(line: 372, column: 15, scope: !379)
!392 = !DILocation(line: 373, column: 13, scope: !379)
!393 = !DILocation(line: 373, column: 25, scope: !379)
!394 = !DILocation(line: 373, column: 11, scope: !379)
!395 = !DILocation(line: 374, column: 13, scope: !379)
!396 = !DILocation(line: 374, column: 22, scope: !379)
!397 = !DILocation(line: 374, column: 11, scope: !379)
!398 = !DILocation(line: 375, column: 5, scope: !399)
!399 = distinct !DILexicalBlock(scope: !379, file: !69, line: 375, column: 5)
!400 = !DILocation(line: 375, column: 14, scope: !399)
!401 = !DILocation(line: 375, column: 5, scope: !379)
!402 = !DILocation(line: 377, column: 7, scope: !403)
!403 = distinct !DILexicalBlock(scope: !404, file: !69, line: 377, column: 7)
!404 = distinct !DILexicalBlock(scope: !399, file: !69, line: 376, column: 2)
!405 = !DILocation(line: 377, column: 17, scope: !403)
!406 = !DILocation(line: 377, column: 7, scope: !404)
!407 = !DILocation(line: 379, column: 4, scope: !408)
!408 = distinct !DILexicalBlock(scope: !403, file: !69, line: 378, column: 3)
!409 = !DILocation(line: 383, column: 4, scope: !410)
!410 = distinct !DILexicalBlock(scope: !403, file: !69, line: 382, column: 3)
!411 = !DILocation(line: 388, column: 15, scope: !412)
!412 = distinct !DILexicalBlock(scope: !399, file: !69, line: 387, column: 2)
!413 = !DILocation(line: 388, column: 24, scope: !412)
!414 = !DILocation(line: 388, column: 32, scope: !412)
!415 = !DILocation(line: 388, column: 41, scope: !412)
!416 = !DILocation(line: 388, column: 47, scope: !412)
!417 = !DILocation(line: 388, column: 46, scope: !412)
!418 = !DILocation(line: 388, column: 57, scope: !412)
!419 = !DILocation(line: 388, column: 56, scope: !412)
!420 = !DILocation(line: 388, column: 29, scope: !412)
!421 = !DILocation(line: 388, column: 12, scope: !412)
!422 = !DILocation(line: 389, column: 14, scope: !412)
!423 = !DILocation(line: 389, column: 22, scope: !412)
!424 = !DILocation(line: 389, column: 12, scope: !412)
!425 = !DILocation(line: 390, column: 14, scope: !412)
!426 = !DILocation(line: 390, column: 23, scope: !412)
!427 = !DILocation(line: 390, column: 22, scope: !412)
!428 = !DILocation(line: 390, column: 12, scope: !412)
!429 = !DILocation(line: 391, column: 16, scope: !412)
!430 = !DILocation(line: 391, column: 25, scope: !412)
!431 = !DILocation(line: 391, column: 31, scope: !412)
!432 = !DILocation(line: 391, column: 30, scope: !412)
!433 = !DILocation(line: 391, column: 43, scope: !412)
!434 = !DILocation(line: 391, column: 41, scope: !412)
!435 = !DILocation(line: 391, column: 12, scope: !412)
!436 = !DILocation(line: 392, column: 6, scope: !437)
!437 = distinct !DILexicalBlock(scope: !412, file: !69, line: 392, column: 6)
!438 = !DILocation(line: 392, column: 15, scope: !437)
!439 = !DILocation(line: 392, column: 6, scope: !412)
!440 = !DILocation(line: 394, column: 7, scope: !441)
!441 = distinct !DILexicalBlock(scope: !442, file: !69, line: 394, column: 7)
!442 = distinct !DILexicalBlock(scope: !437, file: !69, line: 393, column: 3)
!443 = !DILocation(line: 394, column: 16, scope: !441)
!444 = !DILocation(line: 394, column: 7, scope: !442)
!445 = !DILocation(line: 396, column: 17, scope: !446)
!446 = distinct !DILexicalBlock(scope: !441, file: !69, line: 395, column: 4)
!447 = !DILocation(line: 396, column: 12, scope: !446)
!448 = !DILocation(line: 396, column: 5, scope: !446)
!449 = !DILocation(line: 400, column: 5, scope: !450)
!450 = distinct !DILexicalBlock(scope: !441, file: !69, line: 399, column: 4)
!451 = !DILocation(line: 405, column: 4, scope: !452)
!452 = distinct !DILexicalBlock(scope: !437, file: !69, line: 404, column: 3)
!453 = !DILocation(line: 408, column: 1, scope: !379)
!454 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 425, type: !380, scopeLine: 426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!455 = !DILocalVariable(name: "numerator", arg: 1, scope: !454, file: !69, line: 425, type: !20)
!456 = !DILocation(line: 425, column: 30, scope: !454)
!457 = !DILocalVariable(name: "denominator", arg: 2, scope: !454, file: !69, line: 425, type: !28)
!458 = !DILocation(line: 425, column: 45, scope: !454)
!459 = !DILocalVariable(name: "u16Temp1", scope: !454, file: !69, line: 427, type: !28)
!460 = !DILocation(line: 427, column: 6, scope: !454)
!461 = !DILocalVariable(name: "s32Temp1", scope: !454, file: !69, line: 428, type: !12)
!462 = !DILocation(line: 428, column: 6, scope: !454)
!463 = !DILocation(line: 429, column: 13, scope: !454)
!464 = !DILocation(line: 429, column: 25, scope: !454)
!465 = !DILocation(line: 429, column: 11, scope: !454)
!466 = !DILocation(line: 430, column: 5, scope: !467)
!467 = distinct !DILexicalBlock(scope: !454, file: !69, line: 430, column: 5)
!468 = !DILocation(line: 430, column: 13, scope: !467)
!469 = !DILocation(line: 430, column: 5, scope: !454)
!470 = !DILocation(line: 432, column: 6, scope: !471)
!471 = distinct !DILexicalBlock(scope: !472, file: !69, line: 432, column: 6)
!472 = distinct !DILexicalBlock(scope: !467, file: !69, line: 431, column: 2)
!473 = !DILocation(line: 432, column: 15, scope: !471)
!474 = !DILocation(line: 432, column: 6, scope: !472)
!475 = !DILocation(line: 434, column: 4, scope: !476)
!476 = distinct !DILexicalBlock(scope: !471, file: !69, line: 433, column: 3)
!477 = !DILocation(line: 438, column: 4, scope: !478)
!478 = distinct !DILexicalBlock(scope: !471, file: !69, line: 437, column: 3)
!479 = !DILocation(line: 444, column: 15, scope: !480)
!480 = distinct !DILexicalBlock(scope: !467, file: !69, line: 443, column: 2)
!481 = !DILocation(line: 444, column: 27, scope: !480)
!482 = !DILocation(line: 444, column: 37, scope: !480)
!483 = !DILocation(line: 444, column: 36, scope: !480)
!484 = !DILocation(line: 444, column: 49, scope: !480)
!485 = !DILocation(line: 444, column: 47, scope: !480)
!486 = !DILocation(line: 444, column: 25, scope: !480)
!487 = !DILocation(line: 444, column: 59, scope: !480)
!488 = !DILocation(line: 444, column: 12, scope: !480)
!489 = !DILocation(line: 445, column: 15, scope: !480)
!490 = !DILocation(line: 445, column: 24, scope: !480)
!491 = !DILocation(line: 445, column: 23, scope: !480)
!492 = !DILocation(line: 445, column: 37, scope: !480)
!493 = !DILocation(line: 445, column: 47, scope: !480)
!494 = !DILocation(line: 445, column: 46, scope: !480)
!495 = !DILocation(line: 445, column: 34, scope: !480)
!496 = !DILocation(line: 445, column: 12, scope: !480)
!497 = !DILocation(line: 446, column: 10, scope: !480)
!498 = !DILocation(line: 446, column: 3, scope: !480)
!499 = !DILocation(line: 448, column: 1, scope: !454)
!500 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 466, type: !501, scopeLine: 467, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!501 = !DISubroutineType(types: !502)
!502 = !{!24, !28, !28}
!503 = !DILocalVariable(name: "numerator", arg: 1, scope: !500, file: !69, line: 466, type: !28)
!504 = !DILocation(line: 466, column: 28, scope: !500)
!505 = !DILocalVariable(name: "denominator", arg: 2, scope: !500, file: !69, line: 466, type: !28)
!506 = !DILocation(line: 466, column: 43, scope: !500)
!507 = !DILocalVariable(name: "u32Temp1", scope: !500, file: !69, line: 468, type: !508)
!508 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !13, line: 10, baseType: !16)
!509 = !DILocation(line: 468, column: 6, scope: !500)
!510 = !DILocalVariable(name: "u32Temp2", scope: !500, file: !69, line: 468, type: !508)
!511 = !DILocation(line: 468, column: 20, scope: !500)
!512 = !DILocalVariable(name: "u32Temp3", scope: !500, file: !69, line: 468, type: !508)
!513 = !DILocation(line: 468, column: 33, scope: !500)
!514 = !DILocation(line: 469, column: 5, scope: !515)
!515 = distinct !DILexicalBlock(scope: !500, file: !69, line: 469, column: 5)
!516 = !DILocation(line: 469, column: 16, scope: !515)
!517 = !DILocation(line: 469, column: 5, scope: !500)
!518 = !DILocation(line: 471, column: 3, scope: !519)
!519 = distinct !DILexicalBlock(scope: !515, file: !69, line: 470, column: 2)
!520 = !DILocation(line: 475, column: 15, scope: !521)
!521 = distinct !DILexicalBlock(scope: !515, file: !69, line: 474, column: 2)
!522 = !DILocation(line: 475, column: 24, scope: !521)
!523 = !DILocation(line: 475, column: 12, scope: !521)
!524 = !DILocation(line: 476, column: 14, scope: !521)
!525 = !DILocation(line: 476, column: 25, scope: !521)
!526 = !DILocation(line: 476, column: 23, scope: !521)
!527 = !DILocation(line: 476, column: 12, scope: !521)
!528 = !DILocation(line: 477, column: 15, scope: !521)
!529 = !DILocation(line: 477, column: 24, scope: !521)
!530 = !DILocation(line: 477, column: 32, scope: !521)
!531 = !DILocation(line: 477, column: 12, scope: !521)
!532 = !DILocation(line: 478, column: 6, scope: !533)
!533 = distinct !DILexicalBlock(scope: !521, file: !69, line: 478, column: 6)
!534 = !DILocation(line: 478, column: 15, scope: !533)
!535 = !DILocation(line: 478, column: 6, scope: !521)
!536 = !DILocation(line: 480, column: 15, scope: !537)
!537 = distinct !DILexicalBlock(scope: !533, file: !69, line: 479, column: 3)
!538 = !DILocation(line: 480, column: 11, scope: !537)
!539 = !DILocation(line: 480, column: 4, scope: !537)
!540 = !DILocation(line: 484, column: 4, scope: !541)
!541 = distinct !DILexicalBlock(scope: !533, file: !69, line: 483, column: 3)
!542 = !DILocation(line: 487, column: 1, scope: !500)
!543 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 504, type: !544, scopeLine: 505, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!544 = !DISubroutineType(types: !545)
!545 = !{!28, !12, !28}
!546 = !DILocalVariable(name: "x_value", arg: 1, scope: !543, file: !69, line: 504, type: !12)
!547 = !DILocation(line: 504, column: 25, scope: !543)
!548 = !DILocalVariable(name: "y_value", arg: 2, scope: !543, file: !69, line: 504, type: !28)
!549 = !DILocation(line: 504, column: 38, scope: !543)
!550 = !DILocalVariable(name: "s32Temp1", scope: !543, file: !69, line: 506, type: !12)
!551 = !DILocation(line: 506, column: 6, scope: !543)
!552 = !DILocation(line: 507, column: 12, scope: !543)
!553 = !DILocation(line: 507, column: 20, scope: !543)
!554 = !DILocation(line: 507, column: 10, scope: !543)
!555 = !DILocation(line: 508, column: 6, scope: !556)
!556 = distinct !DILexicalBlock(scope: !543, file: !69, line: 508, column: 5)
!557 = !DILocation(line: 508, column: 14, scope: !556)
!558 = !DILocation(line: 508, column: 24, scope: !556)
!559 = !DILocation(line: 508, column: 5, scope: !543)
!560 = !DILocation(line: 510, column: 6, scope: !561)
!561 = distinct !DILexicalBlock(scope: !562, file: !69, line: 510, column: 6)
!562 = distinct !DILexicalBlock(scope: !556, file: !69, line: 509, column: 2)
!563 = !DILocation(line: 510, column: 14, scope: !561)
!564 = !DILocation(line: 510, column: 6, scope: !562)
!565 = !DILocation(line: 512, column: 4, scope: !566)
!566 = distinct !DILexicalBlock(scope: !561, file: !69, line: 511, column: 3)
!567 = !DILocation(line: 516, column: 4, scope: !568)
!568 = distinct !DILexicalBlock(scope: !561, file: !69, line: 515, column: 3)
!569 = !DILocation(line: 521, column: 15, scope: !570)
!570 = distinct !DILexicalBlock(scope: !556, file: !69, line: 520, column: 2)
!571 = !DILocation(line: 521, column: 27, scope: !570)
!572 = !DILocation(line: 521, column: 35, scope: !570)
!573 = !DILocation(line: 521, column: 34, scope: !570)
!574 = !DILocation(line: 521, column: 46, scope: !570)
!575 = !DILocation(line: 521, column: 44, scope: !570)
!576 = !DILocation(line: 521, column: 23, scope: !570)
!577 = !DILocation(line: 521, column: 56, scope: !570)
!578 = !DILocation(line: 521, column: 12, scope: !570)
!579 = !DILocation(line: 522, column: 15, scope: !570)
!580 = !DILocation(line: 522, column: 24, scope: !570)
!581 = !DILocation(line: 522, column: 23, scope: !570)
!582 = !DILocation(line: 522, column: 36, scope: !570)
!583 = !DILocation(line: 522, column: 44, scope: !570)
!584 = !DILocation(line: 522, column: 43, scope: !570)
!585 = !DILocation(line: 522, column: 33, scope: !570)
!586 = !DILocation(line: 522, column: 12, scope: !570)
!587 = !DILocation(line: 523, column: 6, scope: !588)
!588 = distinct !DILexicalBlock(scope: !570, file: !69, line: 523, column: 6)
!589 = !DILocation(line: 523, column: 15, scope: !588)
!590 = !DILocation(line: 523, column: 6, scope: !570)
!591 = !DILocation(line: 525, column: 7, scope: !592)
!592 = distinct !DILexicalBlock(scope: !593, file: !69, line: 525, column: 7)
!593 = distinct !DILexicalBlock(scope: !588, file: !69, line: 524, column: 3)
!594 = !DILocation(line: 525, column: 16, scope: !592)
!595 = !DILocation(line: 525, column: 7, scope: !593)
!596 = !DILocation(line: 527, column: 17, scope: !597)
!597 = distinct !DILexicalBlock(scope: !592, file: !69, line: 526, column: 4)
!598 = !DILocation(line: 527, column: 12, scope: !597)
!599 = !DILocation(line: 527, column: 5, scope: !597)
!600 = !DILocation(line: 531, column: 5, scope: !601)
!601 = distinct !DILexicalBlock(scope: !592, file: !69, line: 530, column: 4)
!602 = !DILocation(line: 536, column: 4, scope: !603)
!603 = distinct !DILexicalBlock(scope: !588, file: !69, line: 535, column: 3)
!604 = !DILocation(line: 539, column: 1, scope: !543)
!605 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 557, type: !606, scopeLine: 558, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!606 = !DISubroutineType(types: !607)
!607 = !{!28, !28, !28}
!608 = !DILocalVariable(name: "numerator", arg: 1, scope: !605, file: !69, line: 557, type: !28)
!609 = !DILocation(line: 557, column: 31, scope: !605)
!610 = !DILocalVariable(name: "denominator", arg: 2, scope: !605, file: !69, line: 557, type: !28)
!611 = !DILocation(line: 557, column: 46, scope: !605)
!612 = !DILocalVariable(name: "u32Temp", scope: !605, file: !69, line: 559, type: !508)
!613 = !DILocation(line: 559, column: 6, scope: !605)
!614 = !DILocation(line: 560, column: 5, scope: !615)
!615 = distinct !DILexicalBlock(scope: !605, file: !69, line: 560, column: 5)
!616 = !DILocation(line: 560, column: 17, scope: !615)
!617 = !DILocation(line: 560, column: 5, scope: !605)
!618 = !DILocation(line: 562, column: 3, scope: !619)
!619 = distinct !DILexicalBlock(scope: !615, file: !69, line: 561, column: 2)
!620 = !DILocation(line: 566, column: 14, scope: !621)
!621 = distinct !DILexicalBlock(scope: !615, file: !69, line: 565, column: 2)
!622 = !DILocation(line: 566, column: 23, scope: !621)
!623 = !DILocation(line: 566, column: 32, scope: !621)
!624 = !DILocation(line: 566, column: 44, scope: !621)
!625 = !DILocation(line: 566, column: 29, scope: !621)
!626 = !DILocation(line: 566, column: 11, scope: !621)
!627 = !DILocation(line: 567, column: 13, scope: !621)
!628 = !DILocation(line: 567, column: 21, scope: !621)
!629 = !DILocation(line: 567, column: 20, scope: !621)
!630 = !DILocation(line: 567, column: 11, scope: !621)
!631 = !DILocation(line: 568, column: 6, scope: !632)
!632 = distinct !DILexicalBlock(scope: !621, file: !69, line: 568, column: 6)
!633 = !DILocation(line: 568, column: 14, scope: !632)
!634 = !DILocation(line: 568, column: 6, scope: !621)
!635 = !DILocation(line: 570, column: 11, scope: !636)
!636 = distinct !DILexicalBlock(scope: !632, file: !69, line: 569, column: 3)
!637 = !DILocation(line: 570, column: 19, scope: !636)
!638 = !DILocation(line: 570, column: 4, scope: !636)
!639 = !DILocation(line: 574, column: 4, scope: !640)
!640 = distinct !DILexicalBlock(scope: !632, file: !69, line: 573, column: 3)
!641 = !DILocation(line: 578, column: 1, scope: !605)
!642 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 595, type: !643, scopeLine: 596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!643 = !DISubroutineType(types: !644)
!644 = !{!28, !508, !28}
!645 = !DILocalVariable(name: "x_value", arg: 1, scope: !642, file: !69, line: 595, type: !508)
!646 = !DILocation(line: 595, column: 25, scope: !642)
!647 = !DILocalVariable(name: "y_value", arg: 2, scope: !642, file: !69, line: 595, type: !28)
!648 = !DILocation(line: 595, column: 38, scope: !642)
!649 = !DILocalVariable(name: "u32Temp1", scope: !642, file: !69, line: 597, type: !508)
!650 = !DILocation(line: 597, column: 6, scope: !642)
!651 = !DILocalVariable(name: "u32Temp2", scope: !642, file: !69, line: 597, type: !508)
!652 = !DILocation(line: 597, column: 17, scope: !642)
!653 = !DILocation(line: 598, column: 12, scope: !642)
!654 = !DILocation(line: 598, column: 20, scope: !642)
!655 = !DILocation(line: 598, column: 10, scope: !642)
!656 = !DILocation(line: 599, column: 5, scope: !657)
!657 = distinct !DILexicalBlock(scope: !642, file: !69, line: 599, column: 5)
!658 = !DILocation(line: 599, column: 13, scope: !657)
!659 = !DILocation(line: 599, column: 5, scope: !642)
!660 = !DILocation(line: 601, column: 3, scope: !661)
!661 = distinct !DILexicalBlock(scope: !657, file: !69, line: 600, column: 2)
!662 = !DILocation(line: 605, column: 14, scope: !663)
!663 = distinct !DILexicalBlock(scope: !657, file: !69, line: 604, column: 2)
!664 = !DILocation(line: 605, column: 22, scope: !663)
!665 = !DILocation(line: 605, column: 21, scope: !663)
!666 = !DILocation(line: 605, column: 12, scope: !663)
!667 = !DILocation(line: 606, column: 14, scope: !663)
!668 = !DILocation(line: 606, column: 25, scope: !663)
!669 = !DILocation(line: 606, column: 36, scope: !663)
!670 = !DILocation(line: 606, column: 34, scope: !663)
!671 = !DILocation(line: 606, column: 22, scope: !663)
!672 = !DILocation(line: 606, column: 45, scope: !663)
!673 = !DILocation(line: 606, column: 12, scope: !663)
!674 = !DILocation(line: 607, column: 15, scope: !663)
!675 = !DILocation(line: 607, column: 24, scope: !663)
!676 = !DILocation(line: 607, column: 23, scope: !663)
!677 = !DILocation(line: 607, column: 36, scope: !663)
!678 = !DILocation(line: 607, column: 44, scope: !663)
!679 = !DILocation(line: 607, column: 43, scope: !663)
!680 = !DILocation(line: 607, column: 33, scope: !663)
!681 = !DILocation(line: 607, column: 12, scope: !663)
!682 = !DILocation(line: 608, column: 6, scope: !683)
!683 = distinct !DILexicalBlock(scope: !663, file: !69, line: 608, column: 6)
!684 = !DILocation(line: 608, column: 15, scope: !683)
!685 = !DILocation(line: 608, column: 6, scope: !663)
!686 = !DILocation(line: 610, column: 11, scope: !687)
!687 = distinct !DILexicalBlock(scope: !683, file: !69, line: 609, column: 3)
!688 = !DILocation(line: 610, column: 20, scope: !687)
!689 = !DILocation(line: 610, column: 4, scope: !687)
!690 = !DILocation(line: 614, column: 4, scope: !691)
!691 = distinct !DILexicalBlock(scope: !683, file: !69, line: 613, column: 3)
!692 = !DILocation(line: 618, column: 1, scope: !642)
!693 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 637, type: !694, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!694 = !DISubroutineType(types: !695)
!695 = !{!20, !20, !28, !20}
!696 = !DILocalVariable(name: "factor1", arg: 1, scope: !693, file: !69, line: 637, type: !20)
!697 = !DILocation(line: 637, column: 33, scope: !693)
!698 = !DILocalVariable(name: "factor2", arg: 2, scope: !693, file: !69, line: 637, type: !28)
!699 = !DILocation(line: 637, column: 46, scope: !693)
!700 = !DILocalVariable(name: "denominator", arg: 3, scope: !693, file: !69, line: 637, type: !20)
!701 = !DILocation(line: 637, column: 59, scope: !693)
!702 = !DILocalVariable(name: "s32Result", scope: !693, file: !69, line: 639, type: !12)
!703 = !DILocation(line: 639, column: 6, scope: !693)
!704 = !DILocalVariable(name: "s32Temp1", scope: !693, file: !69, line: 639, type: !12)
!705 = !DILocation(line: 639, column: 21, scope: !693)
!706 = !DILocation(line: 640, column: 14, scope: !693)
!707 = !DILocation(line: 640, column: 24, scope: !693)
!708 = !DILocation(line: 640, column: 22, scope: !693)
!709 = !DILocation(line: 640, column: 12, scope: !693)
!710 = !DILocation(line: 641, column: 5, scope: !711)
!711 = distinct !DILexicalBlock(scope: !693, file: !69, line: 641, column: 5)
!712 = !DILocation(line: 641, column: 17, scope: !711)
!713 = !DILocation(line: 641, column: 5, scope: !693)
!714 = !DILocation(line: 643, column: 6, scope: !715)
!715 = distinct !DILexicalBlock(scope: !716, file: !69, line: 643, column: 6)
!716 = distinct !DILexicalBlock(scope: !711, file: !69, line: 642, column: 2)
!717 = !DILocation(line: 643, column: 16, scope: !715)
!718 = !DILocation(line: 643, column: 6, scope: !716)
!719 = !DILocation(line: 645, column: 4, scope: !720)
!720 = distinct !DILexicalBlock(scope: !715, file: !69, line: 644, column: 3)
!721 = !DILocation(line: 649, column: 4, scope: !722)
!722 = distinct !DILexicalBlock(scope: !715, file: !69, line: 648, column: 3)
!723 = !DILocation(line: 654, column: 14, scope: !724)
!724 = distinct !DILexicalBlock(scope: !711, file: !69, line: 653, column: 2)
!725 = !DILocation(line: 654, column: 27, scope: !724)
!726 = !DILocation(line: 654, column: 37, scope: !724)
!727 = !DILocation(line: 654, column: 36, scope: !724)
!728 = !DILocation(line: 654, column: 50, scope: !724)
!729 = !DILocation(line: 654, column: 49, scope: !724)
!730 = !DILocation(line: 654, column: 24, scope: !724)
!731 = !DILocation(line: 654, column: 12, scope: !724)
!732 = !DILocation(line: 655, column: 14, scope: !724)
!733 = !DILocation(line: 655, column: 23, scope: !724)
!734 = !DILocation(line: 655, column: 12, scope: !724)
!735 = !DILocation(line: 656, column: 16, scope: !724)
!736 = !DILocation(line: 656, column: 25, scope: !724)
!737 = !DILocation(line: 656, column: 24, scope: !724)
!738 = !DILocation(line: 656, column: 41, scope: !724)
!739 = !DILocation(line: 656, column: 51, scope: !724)
!740 = !DILocation(line: 656, column: 50, scope: !724)
!741 = !DILocation(line: 656, column: 38, scope: !724)
!742 = !DILocation(line: 656, column: 13, scope: !724)
!743 = !DILocation(line: 657, column: 6, scope: !744)
!744 = distinct !DILexicalBlock(scope: !724, file: !69, line: 657, column: 6)
!745 = !DILocation(line: 657, column: 16, scope: !744)
!746 = !DILocation(line: 657, column: 6, scope: !724)
!747 = !DILocation(line: 659, column: 7, scope: !748)
!748 = distinct !DILexicalBlock(scope: !749, file: !69, line: 659, column: 7)
!749 = distinct !DILexicalBlock(scope: !744, file: !69, line: 658, column: 3)
!750 = !DILocation(line: 659, column: 17, scope: !748)
!751 = !DILocation(line: 659, column: 7, scope: !749)
!752 = !DILocation(line: 661, column: 17, scope: !753)
!753 = distinct !DILexicalBlock(scope: !748, file: !69, line: 660, column: 4)
!754 = !DILocation(line: 661, column: 12, scope: !753)
!755 = !DILocation(line: 661, column: 5, scope: !753)
!756 = !DILocation(line: 666, column: 5, scope: !757)
!757 = distinct !DILexicalBlock(scope: !748, file: !69, line: 665, column: 4)
!758 = !DILocation(line: 671, column: 4, scope: !759)
!759 = distinct !DILexicalBlock(scope: !744, file: !69, line: 670, column: 3)
!760 = !DILocation(line: 675, column: 1, scope: !693)
!761 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 693, type: !762, scopeLine: 694, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!762 = !DISubroutineType(types: !763)
!763 = !{!20, !28, !20, !28}
!764 = !DILocalVariable(name: "factor1", arg: 1, scope: !761, file: !69, line: 693, type: !28)
!765 = !DILocation(line: 693, column: 33, scope: !761)
!766 = !DILocalVariable(name: "factor2", arg: 2, scope: !761, file: !69, line: 693, type: !20)
!767 = !DILocation(line: 693, column: 46, scope: !761)
!768 = !DILocalVariable(name: "denominator", arg: 3, scope: !761, file: !69, line: 693, type: !28)
!769 = !DILocation(line: 693, column: 59, scope: !761)
!770 = !DILocalVariable(name: "s32Result", scope: !761, file: !69, line: 695, type: !12)
!771 = !DILocation(line: 695, column: 6, scope: !761)
!772 = !DILocalVariable(name: "s32Temp1", scope: !761, file: !69, line: 695, type: !12)
!773 = !DILocation(line: 695, column: 21, scope: !761)
!774 = !DILocation(line: 696, column: 14, scope: !761)
!775 = !DILocation(line: 696, column: 24, scope: !761)
!776 = !DILocation(line: 696, column: 22, scope: !761)
!777 = !DILocation(line: 696, column: 12, scope: !761)
!778 = !DILocation(line: 697, column: 5, scope: !779)
!779 = distinct !DILexicalBlock(scope: !761, file: !69, line: 697, column: 5)
!780 = !DILocation(line: 697, column: 16, scope: !779)
!781 = !DILocation(line: 697, column: 5, scope: !761)
!782 = !DILocation(line: 699, column: 6, scope: !783)
!783 = distinct !DILexicalBlock(scope: !784, file: !69, line: 699, column: 6)
!784 = distinct !DILexicalBlock(scope: !779, file: !69, line: 698, column: 2)
!785 = !DILocation(line: 699, column: 16, scope: !783)
!786 = !DILocation(line: 699, column: 6, scope: !784)
!787 = !DILocation(line: 701, column: 4, scope: !788)
!788 = distinct !DILexicalBlock(scope: !783, file: !69, line: 700, column: 3)
!789 = !DILocation(line: 705, column: 4, scope: !790)
!790 = distinct !DILexicalBlock(scope: !783, file: !69, line: 704, column: 3)
!791 = !DILocation(line: 710, column: 14, scope: !792)
!792 = distinct !DILexicalBlock(scope: !779, file: !69, line: 709, column: 2)
!793 = !DILocation(line: 710, column: 28, scope: !792)
!794 = !DILocation(line: 710, column: 38, scope: !792)
!795 = !DILocation(line: 710, column: 37, scope: !792)
!796 = !DILocation(line: 710, column: 53, scope: !792)
!797 = !DILocation(line: 710, column: 51, scope: !792)
!798 = !DILocation(line: 710, column: 24, scope: !792)
!799 = !DILocation(line: 710, column: 66, scope: !792)
!800 = !DILocation(line: 710, column: 12, scope: !792)
!801 = !DILocation(line: 711, column: 16, scope: !792)
!802 = !DILocation(line: 711, column: 25, scope: !792)
!803 = !DILocation(line: 711, column: 24, scope: !792)
!804 = !DILocation(line: 711, column: 41, scope: !792)
!805 = !DILocation(line: 711, column: 51, scope: !792)
!806 = !DILocation(line: 711, column: 50, scope: !792)
!807 = !DILocation(line: 711, column: 38, scope: !792)
!808 = !DILocation(line: 711, column: 13, scope: !792)
!809 = !DILocation(line: 712, column: 6, scope: !810)
!810 = distinct !DILexicalBlock(scope: !792, file: !69, line: 712, column: 6)
!811 = !DILocation(line: 712, column: 16, scope: !810)
!812 = !DILocation(line: 712, column: 6, scope: !792)
!813 = !DILocation(line: 714, column: 7, scope: !814)
!814 = distinct !DILexicalBlock(scope: !815, file: !69, line: 714, column: 7)
!815 = distinct !DILexicalBlock(scope: !810, file: !69, line: 713, column: 3)
!816 = !DILocation(line: 714, column: 17, scope: !814)
!817 = !DILocation(line: 714, column: 7, scope: !815)
!818 = !DILocation(line: 716, column: 17, scope: !819)
!819 = distinct !DILexicalBlock(scope: !814, file: !69, line: 715, column: 4)
!820 = !DILocation(line: 716, column: 12, scope: !819)
!821 = !DILocation(line: 716, column: 5, scope: !819)
!822 = !DILocation(line: 720, column: 5, scope: !823)
!823 = distinct !DILexicalBlock(scope: !814, file: !69, line: 719, column: 4)
!824 = !DILocation(line: 725, column: 4, scope: !825)
!825 = distinct !DILexicalBlock(scope: !810, file: !69, line: 724, column: 3)
!826 = !DILocation(line: 728, column: 1, scope: !761)
!827 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 747, type: !828, scopeLine: 748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!828 = !DISubroutineType(types: !829)
!829 = !{!28, !20, !28, !20}
!830 = !DILocalVariable(name: "factor1", arg: 1, scope: !827, file: !69, line: 747, type: !20)
!831 = !DILocation(line: 747, column: 33, scope: !827)
!832 = !DILocalVariable(name: "factor2", arg: 2, scope: !827, file: !69, line: 747, type: !28)
!833 = !DILocation(line: 747, column: 46, scope: !827)
!834 = !DILocalVariable(name: "denominator", arg: 3, scope: !827, file: !69, line: 747, type: !20)
!835 = !DILocation(line: 747, column: 59, scope: !827)
!836 = !DILocalVariable(name: "u32Result", scope: !827, file: !69, line: 749, type: !508)
!837 = !DILocation(line: 749, column: 6, scope: !827)
!838 = !DILocalVariable(name: "u32Temp1", scope: !827, file: !69, line: 749, type: !508)
!839 = !DILocation(line: 749, column: 21, scope: !827)
!840 = !DILocalVariable(name: "s32Result", scope: !827, file: !69, line: 750, type: !12)
!841 = !DILocation(line: 750, column: 6, scope: !827)
!842 = !DILocalVariable(name: "s32Temp1", scope: !827, file: !69, line: 750, type: !12)
!843 = !DILocation(line: 750, column: 21, scope: !827)
!844 = !DILocation(line: 751, column: 14, scope: !827)
!845 = !DILocation(line: 751, column: 24, scope: !827)
!846 = !DILocation(line: 751, column: 22, scope: !827)
!847 = !DILocation(line: 751, column: 12, scope: !827)
!848 = !DILocation(line: 753, column: 5, scope: !849)
!849 = distinct !DILexicalBlock(scope: !827, file: !69, line: 753, column: 5)
!850 = !DILocation(line: 753, column: 17, scope: !849)
!851 = !DILocation(line: 753, column: 5, scope: !827)
!852 = !DILocation(line: 755, column: 6, scope: !853)
!853 = distinct !DILexicalBlock(scope: !854, file: !69, line: 755, column: 6)
!854 = distinct !DILexicalBlock(scope: !849, file: !69, line: 754, column: 2)
!855 = !DILocation(line: 755, column: 16, scope: !853)
!856 = !DILocation(line: 755, column: 6, scope: !854)
!857 = !DILocation(line: 757, column: 4, scope: !858)
!858 = distinct !DILexicalBlock(scope: !853, file: !69, line: 756, column: 3)
!859 = !DILocation(line: 761, column: 4, scope: !860)
!860 = distinct !DILexicalBlock(scope: !853, file: !69, line: 760, column: 3)
!861 = !DILocation(line: 766, column: 15, scope: !862)
!862 = distinct !DILexicalBlock(scope: !849, file: !69, line: 765, column: 2)
!863 = !DILocation(line: 766, column: 29, scope: !862)
!864 = !DILocation(line: 766, column: 39, scope: !862)
!865 = !DILocation(line: 766, column: 38, scope: !862)
!866 = !DILocation(line: 766, column: 54, scope: !862)
!867 = !DILocation(line: 766, column: 52, scope: !862)
!868 = !DILocation(line: 766, column: 25, scope: !862)
!869 = !DILocation(line: 766, column: 68, scope: !862)
!870 = !DILocation(line: 766, column: 12, scope: !862)
!871 = !DILocation(line: 767, column: 16, scope: !862)
!872 = !DILocation(line: 767, column: 25, scope: !862)
!873 = !DILocation(line: 767, column: 24, scope: !862)
!874 = !DILocation(line: 767, column: 41, scope: !862)
!875 = !DILocation(line: 767, column: 51, scope: !862)
!876 = !DILocation(line: 767, column: 50, scope: !862)
!877 = !DILocation(line: 767, column: 38, scope: !862)
!878 = !DILocation(line: 767, column: 13, scope: !862)
!879 = !DILocation(line: 768, column: 6, scope: !880)
!880 = distinct !DILexicalBlock(scope: !862, file: !69, line: 768, column: 6)
!881 = !DILocation(line: 768, column: 16, scope: !880)
!882 = !DILocation(line: 768, column: 6, scope: !862)
!883 = !DILocation(line: 770, column: 7, scope: !884)
!884 = distinct !DILexicalBlock(scope: !885, file: !69, line: 770, column: 7)
!885 = distinct !DILexicalBlock(scope: !880, file: !69, line: 769, column: 3)
!886 = !DILocation(line: 770, column: 17, scope: !884)
!887 = !DILocation(line: 770, column: 7, scope: !885)
!888 = !DILocation(line: 772, column: 17, scope: !889)
!889 = distinct !DILexicalBlock(scope: !884, file: !69, line: 771, column: 4)
!890 = !DILocation(line: 772, column: 12, scope: !889)
!891 = !DILocation(line: 772, column: 5, scope: !889)
!892 = !DILocation(line: 776, column: 5, scope: !893)
!893 = distinct !DILexicalBlock(scope: !884, file: !69, line: 775, column: 4)
!894 = !DILocation(line: 781, column: 4, scope: !895)
!895 = distinct !DILexicalBlock(scope: !880, file: !69, line: 780, column: 3)
!896 = !DILocation(line: 784, column: 1, scope: !827)
!897 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 803, type: !898, scopeLine: 804, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!898 = !DISubroutineType(types: !899)
!899 = !{!28, !20, !28, !28}
!900 = !DILocalVariable(name: "factor1", arg: 1, scope: !897, file: !69, line: 803, type: !20)
!901 = !DILocation(line: 803, column: 33, scope: !897)
!902 = !DILocalVariable(name: "factor2", arg: 2, scope: !897, file: !69, line: 803, type: !28)
!903 = !DILocation(line: 803, column: 46, scope: !897)
!904 = !DILocalVariable(name: "denominator", arg: 3, scope: !897, file: !69, line: 803, type: !28)
!905 = !DILocation(line: 803, column: 59, scope: !897)
!906 = !DILocalVariable(name: "s32Result", scope: !897, file: !69, line: 805, type: !12)
!907 = !DILocation(line: 805, column: 6, scope: !897)
!908 = !DILocalVariable(name: "s32Temp1", scope: !897, file: !69, line: 805, type: !12)
!909 = !DILocation(line: 805, column: 21, scope: !897)
!910 = !DILocation(line: 806, column: 14, scope: !897)
!911 = !DILocation(line: 806, column: 24, scope: !897)
!912 = !DILocation(line: 806, column: 22, scope: !897)
!913 = !DILocation(line: 806, column: 12, scope: !897)
!914 = !DILocation(line: 808, column: 5, scope: !915)
!915 = distinct !DILexicalBlock(scope: !897, file: !69, line: 808, column: 5)
!916 = !DILocation(line: 808, column: 17, scope: !915)
!917 = !DILocation(line: 808, column: 5, scope: !897)
!918 = !DILocation(line: 810, column: 6, scope: !919)
!919 = distinct !DILexicalBlock(scope: !920, file: !69, line: 810, column: 6)
!920 = distinct !DILexicalBlock(scope: !915, file: !69, line: 809, column: 2)
!921 = !DILocation(line: 810, column: 16, scope: !919)
!922 = !DILocation(line: 810, column: 6, scope: !920)
!923 = !DILocation(line: 812, column: 4, scope: !924)
!924 = distinct !DILexicalBlock(scope: !919, file: !69, line: 811, column: 3)
!925 = !DILocation(line: 816, column: 4, scope: !926)
!926 = distinct !DILexicalBlock(scope: !919, file: !69, line: 815, column: 3)
!927 = !DILocation(line: 821, column: 15, scope: !928)
!928 = distinct !DILexicalBlock(scope: !915, file: !69, line: 820, column: 2)
!929 = !DILocation(line: 821, column: 29, scope: !928)
!930 = !DILocation(line: 821, column: 39, scope: !928)
!931 = !DILocation(line: 821, column: 38, scope: !928)
!932 = !DILocation(line: 821, column: 54, scope: !928)
!933 = !DILocation(line: 821, column: 52, scope: !928)
!934 = !DILocation(line: 821, column: 25, scope: !928)
!935 = !DILocation(line: 821, column: 68, scope: !928)
!936 = !DILocation(line: 821, column: 12, scope: !928)
!937 = !DILocation(line: 822, column: 16, scope: !928)
!938 = !DILocation(line: 822, column: 25, scope: !928)
!939 = !DILocation(line: 822, column: 24, scope: !928)
!940 = !DILocation(line: 822, column: 41, scope: !928)
!941 = !DILocation(line: 822, column: 51, scope: !928)
!942 = !DILocation(line: 822, column: 50, scope: !928)
!943 = !DILocation(line: 822, column: 38, scope: !928)
!944 = !DILocation(line: 822, column: 13, scope: !928)
!945 = !DILocation(line: 823, column: 6, scope: !946)
!946 = distinct !DILexicalBlock(scope: !928, file: !69, line: 823, column: 6)
!947 = !DILocation(line: 823, column: 16, scope: !946)
!948 = !DILocation(line: 823, column: 6, scope: !928)
!949 = !DILocation(line: 825, column: 7, scope: !950)
!950 = distinct !DILexicalBlock(scope: !951, file: !69, line: 825, column: 7)
!951 = distinct !DILexicalBlock(scope: !946, file: !69, line: 824, column: 3)
!952 = !DILocation(line: 825, column: 17, scope: !950)
!953 = !DILocation(line: 825, column: 7, scope: !951)
!954 = !DILocation(line: 827, column: 17, scope: !955)
!955 = distinct !DILexicalBlock(scope: !950, file: !69, line: 826, column: 4)
!956 = !DILocation(line: 827, column: 12, scope: !955)
!957 = !DILocation(line: 827, column: 5, scope: !955)
!958 = !DILocation(line: 831, column: 5, scope: !959)
!959 = distinct !DILexicalBlock(scope: !950, file: !69, line: 830, column: 4)
!960 = !DILocation(line: 836, column: 4, scope: !961)
!961 = distinct !DILexicalBlock(scope: !946, file: !69, line: 835, column: 3)
!962 = !DILocation(line: 840, column: 1, scope: !897)
!963 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 858, type: !964, scopeLine: 859, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!964 = !DISubroutineType(types: !965)
!965 = !{!28, !28, !28, !28}
!966 = !DILocalVariable(name: "factor1", arg: 1, scope: !963, file: !69, line: 858, type: !28)
!967 = !DILocation(line: 858, column: 33, scope: !963)
!968 = !DILocalVariable(name: "factor2", arg: 2, scope: !963, file: !69, line: 858, type: !28)
!969 = !DILocation(line: 858, column: 46, scope: !963)
!970 = !DILocalVariable(name: "denominator", arg: 3, scope: !963, file: !69, line: 858, type: !28)
!971 = !DILocation(line: 858, column: 59, scope: !963)
!972 = !DILocalVariable(name: "u32Temp1", scope: !963, file: !69, line: 860, type: !508)
!973 = !DILocation(line: 860, column: 6, scope: !963)
!974 = !DILocalVariable(name: "u16TempDenom", scope: !963, file: !69, line: 861, type: !28)
!975 = !DILocation(line: 861, column: 6, scope: !963)
!976 = !DILocation(line: 863, column: 5, scope: !977)
!977 = distinct !DILexicalBlock(scope: !963, file: !69, line: 863, column: 5)
!978 = !DILocation(line: 863, column: 17, scope: !977)
!979 = !DILocation(line: 863, column: 5, scope: !963)
!980 = !DILocation(line: 865, column: 3, scope: !981)
!981 = distinct !DILexicalBlock(scope: !977, file: !69, line: 864, column: 2)
!982 = !DILocation(line: 869, column: 14, scope: !983)
!983 = distinct !DILexicalBlock(scope: !977, file: !69, line: 868, column: 2)
!984 = !DILocation(line: 869, column: 24, scope: !983)
!985 = !DILocation(line: 869, column: 22, scope: !983)
!986 = !DILocation(line: 869, column: 12, scope: !983)
!987 = !DILocation(line: 870, column: 18, scope: !983)
!988 = !DILocation(line: 870, column: 30, scope: !983)
!989 = !DILocation(line: 870, column: 16, scope: !983)
!990 = !DILocation(line: 871, column: 14, scope: !983)
!991 = !DILocation(line: 871, column: 25, scope: !983)
!992 = !DILocation(line: 871, column: 23, scope: !983)
!993 = !DILocation(line: 871, column: 12, scope: !983)
!994 = !DILocation(line: 872, column: 14, scope: !983)
!995 = !DILocation(line: 872, column: 25, scope: !983)
!996 = !DILocation(line: 872, column: 23, scope: !983)
!997 = !DILocation(line: 872, column: 12, scope: !983)
!998 = !DILocation(line: 873, column: 6, scope: !999)
!999 = distinct !DILexicalBlock(scope: !983, file: !69, line: 873, column: 6)
!1000 = !DILocation(line: 873, column: 15, scope: !999)
!1001 = !DILocation(line: 873, column: 6, scope: !983)
!1002 = !DILocation(line: 875, column: 12, scope: !1003)
!1003 = distinct !DILexicalBlock(scope: !999, file: !69, line: 874, column: 3)
!1004 = !DILocation(line: 875, column: 21, scope: !1003)
!1005 = !DILocation(line: 875, column: 11, scope: !1003)
!1006 = !DILocation(line: 875, column: 4, scope: !1003)
!1007 = !DILocation(line: 880, column: 4, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !999, file: !69, line: 879, column: 3)
!1009 = !DILocation(line: 885, column: 1, scope: !963)
!1010 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 902, type: !1011, scopeLine: 903, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1011 = !DISubroutineType(types: !1012)
!1012 = !{!28, !28, !28, !508}
!1013 = !DILocalVariable(name: "factor1", arg: 1, scope: !1010, file: !69, line: 902, type: !28)
!1014 = !DILocation(line: 902, column: 33, scope: !1010)
!1015 = !DILocalVariable(name: "factor2", arg: 2, scope: !1010, file: !69, line: 902, type: !28)
!1016 = !DILocation(line: 902, column: 46, scope: !1010)
!1017 = !DILocalVariable(name: "denominator", arg: 3, scope: !1010, file: !69, line: 902, type: !508)
!1018 = !DILocation(line: 902, column: 59, scope: !1010)
!1019 = !DILocalVariable(name: "u32Temp1", scope: !1010, file: !69, line: 904, type: !508)
!1020 = !DILocation(line: 904, column: 6, scope: !1010)
!1021 = !DILocation(line: 905, column: 5, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1010, file: !69, line: 905, column: 5)
!1023 = !DILocation(line: 905, column: 17, scope: !1022)
!1024 = !DILocation(line: 905, column: 5, scope: !1010)
!1025 = !DILocation(line: 907, column: 3, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1022, file: !69, line: 906, column: 2)
!1027 = !DILocation(line: 911, column: 15, scope: !1028)
!1028 = distinct !DILexicalBlock(scope: !1022, file: !69, line: 910, column: 2)
!1029 = !DILocation(line: 911, column: 25, scope: !1028)
!1030 = !DILocation(line: 911, column: 23, scope: !1028)
!1031 = !DILocation(line: 911, column: 36, scope: !1028)
!1032 = !DILocation(line: 911, column: 34, scope: !1028)
!1033 = !DILocation(line: 911, column: 12, scope: !1028)
!1034 = !DILocation(line: 912, column: 8, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1028, file: !69, line: 912, column: 6)
!1036 = !DILocation(line: 912, column: 18, scope: !1035)
!1037 = !DILocation(line: 912, column: 16, scope: !1035)
!1038 = !DILocation(line: 912, column: 28, scope: !1035)
!1039 = !DILocation(line: 912, column: 40, scope: !1035)
!1040 = !DILocation(line: 912, column: 39, scope: !1035)
!1041 = !DILocation(line: 912, column: 26, scope: !1035)
!1042 = !DILocation(line: 912, column: 53, scope: !1035)
!1043 = !DILocation(line: 912, column: 64, scope: !1035)
!1044 = !DILocation(line: 912, column: 50, scope: !1035)
!1045 = !DILocation(line: 912, column: 6, scope: !1028)
!1046 = !DILocation(line: 914, column: 12, scope: !1047)
!1047 = distinct !DILexicalBlock(scope: !1035, file: !69, line: 913, column: 3)
!1048 = !DILocation(line: 915, column: 3, scope: !1047)
!1049 = !DILocation(line: 916, column: 6, scope: !1050)
!1050 = distinct !DILexicalBlock(scope: !1028, file: !69, line: 916, column: 6)
!1051 = !DILocation(line: 916, column: 15, scope: !1050)
!1052 = !DILocation(line: 916, column: 6, scope: !1028)
!1053 = !DILocation(line: 918, column: 12, scope: !1054)
!1054 = distinct !DILexicalBlock(scope: !1050, file: !69, line: 917, column: 3)
!1055 = !DILocation(line: 918, column: 21, scope: !1054)
!1056 = !DILocation(line: 918, column: 11, scope: !1054)
!1057 = !DILocation(line: 918, column: 4, scope: !1054)
!1058 = !DILocation(line: 922, column: 4, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1050, file: !69, line: 921, column: 3)
!1060 = !DILocation(line: 925, column: 1, scope: !1010)
!1061 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 942, type: !1062, scopeLine: 943, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1062 = !DISubroutineType(types: !1063)
!1063 = !{!508, !508, !28}
!1064 = !DILocalVariable(name: "x_value", arg: 1, scope: !1061, file: !69, line: 942, type: !508)
!1065 = !DILocation(line: 942, column: 25, scope: !1061)
!1066 = !DILocalVariable(name: "y_value", arg: 2, scope: !1061, file: !69, line: 942, type: !28)
!1067 = !DILocation(line: 942, column: 38, scope: !1061)
!1068 = !DILocalVariable(name: "u32Temp1", scope: !1061, file: !69, line: 944, type: !508)
!1069 = !DILocation(line: 944, column: 6, scope: !1061)
!1070 = !DILocation(line: 945, column: 5, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1061, file: !69, line: 945, column: 5)
!1072 = !DILocation(line: 945, column: 13, scope: !1071)
!1073 = !DILocation(line: 945, column: 5, scope: !1061)
!1074 = !DILocation(line: 947, column: 3, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1071, file: !69, line: 946, column: 2)
!1076 = !DILocation(line: 951, column: 15, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1071, file: !69, line: 950, column: 2)
!1078 = !DILocation(line: 951, column: 26, scope: !1077)
!1079 = !DILocation(line: 951, column: 34, scope: !1077)
!1080 = !DILocation(line: 951, column: 33, scope: !1077)
!1081 = !DILocation(line: 951, column: 45, scope: !1077)
!1082 = !DILocation(line: 951, column: 43, scope: !1077)
!1083 = !DILocation(line: 951, column: 23, scope: !1077)
!1084 = !DILocation(line: 951, column: 54, scope: !1077)
!1085 = !DILocation(line: 951, column: 12, scope: !1077)
!1086 = !DILocation(line: 952, column: 15, scope: !1077)
!1087 = !DILocation(line: 952, column: 23, scope: !1077)
!1088 = !DILocation(line: 952, column: 22, scope: !1077)
!1089 = !DILocation(line: 952, column: 35, scope: !1077)
!1090 = !DILocation(line: 952, column: 44, scope: !1077)
!1091 = !DILocation(line: 952, column: 43, scope: !1077)
!1092 = !DILocation(line: 952, column: 32, scope: !1077)
!1093 = !DILocation(line: 952, column: 12, scope: !1077)
!1094 = !DILocation(line: 953, column: 10, scope: !1077)
!1095 = !DILocation(line: 953, column: 3, scope: !1077)
!1096 = !DILocation(line: 955, column: 1, scope: !1061)
!1097 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 973, type: !1098, scopeLine: 974, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1098 = !DISubroutineType(types: !1099)
!1099 = !{!20, !20, !20, !20}
!1100 = !DILocalVariable(name: "fak1", arg: 1, scope: !1097, file: !69, line: 973, type: !20)
!1101 = !DILocation(line: 973, column: 33, scope: !1097)
!1102 = !DILocalVariable(name: "fak2", arg: 2, scope: !1097, file: !69, line: 973, type: !20)
!1103 = !DILocation(line: 973, column: 43, scope: !1097)
!1104 = !DILocalVariable(name: "div", arg: 3, scope: !1097, file: !69, line: 973, type: !20)
!1105 = !DILocation(line: 973, column: 53, scope: !1097)
!1106 = !DILocalVariable(name: "s32Temp1", scope: !1097, file: !69, line: 975, type: !12)
!1107 = !DILocation(line: 975, column: 6, scope: !1097)
!1108 = !DILocalVariable(name: "s32Temp2", scope: !1097, file: !69, line: 975, type: !12)
!1109 = !DILocation(line: 975, column: 20, scope: !1097)
!1110 = !DILocalVariable(name: "s32Temp3", scope: !1097, file: !69, line: 975, type: !12)
!1111 = !DILocation(line: 975, column: 34, scope: !1097)
!1112 = !DILocation(line: 976, column: 13, scope: !1097)
!1113 = !DILocation(line: 976, column: 20, scope: !1097)
!1114 = !DILocation(line: 976, column: 18, scope: !1097)
!1115 = !DILocation(line: 976, column: 11, scope: !1097)
!1116 = !DILocation(line: 977, column: 5, scope: !1117)
!1117 = distinct !DILexicalBlock(scope: !1097, file: !69, line: 977, column: 5)
!1118 = !DILocation(line: 977, column: 9, scope: !1117)
!1119 = !DILocation(line: 977, column: 5, scope: !1097)
!1120 = !DILocation(line: 979, column: 6, scope: !1121)
!1121 = distinct !DILexicalBlock(scope: !1122, file: !69, line: 979, column: 6)
!1122 = distinct !DILexicalBlock(scope: !1117, file: !69, line: 978, column: 2)
!1123 = !DILocation(line: 979, column: 15, scope: !1121)
!1124 = !DILocation(line: 979, column: 6, scope: !1122)
!1125 = !DILocation(line: 981, column: 4, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1121, file: !69, line: 980, column: 3)
!1127 = !DILocation(line: 985, column: 4, scope: !1128)
!1128 = distinct !DILexicalBlock(scope: !1121, file: !69, line: 984, column: 3)
!1129 = !DILocation(line: 990, column: 15, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1117, file: !69, line: 989, column: 2)
!1131 = !DILocation(line: 990, column: 28, scope: !1130)
!1132 = !DILocation(line: 990, column: 39, scope: !1130)
!1133 = !DILocation(line: 990, column: 37, scope: !1130)
!1134 = !DILocation(line: 990, column: 46, scope: !1130)
!1135 = !DILocation(line: 990, column: 44, scope: !1130)
!1136 = !DILocation(line: 990, column: 24, scope: !1130)
!1137 = !DILocation(line: 990, column: 52, scope: !1130)
!1138 = !DILocation(line: 990, column: 12, scope: !1130)
!1139 = !DILocation(line: 991, column: 15, scope: !1130)
!1140 = !DILocation(line: 991, column: 24, scope: !1130)
!1141 = !DILocation(line: 991, column: 23, scope: !1130)
!1142 = !DILocation(line: 991, column: 32, scope: !1130)
!1143 = !DILocation(line: 991, column: 41, scope: !1130)
!1144 = !DILocation(line: 991, column: 40, scope: !1130)
!1145 = !DILocation(line: 991, column: 29, scope: !1130)
!1146 = !DILocation(line: 991, column: 12, scope: !1130)
!1147 = !DILocation(line: 992, column: 6, scope: !1148)
!1148 = distinct !DILexicalBlock(scope: !1130, file: !69, line: 992, column: 6)
!1149 = !DILocation(line: 992, column: 15, scope: !1148)
!1150 = !DILocation(line: 992, column: 6, scope: !1130)
!1151 = !DILocation(line: 994, column: 7, scope: !1152)
!1152 = distinct !DILexicalBlock(scope: !1153, file: !69, line: 994, column: 7)
!1153 = distinct !DILexicalBlock(scope: !1148, file: !69, line: 993, column: 3)
!1154 = !DILocation(line: 994, column: 16, scope: !1152)
!1155 = !DILocation(line: 994, column: 7, scope: !1153)
!1156 = !DILocation(line: 996, column: 17, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1152, file: !69, line: 995, column: 4)
!1158 = !DILocation(line: 996, column: 12, scope: !1157)
!1159 = !DILocation(line: 996, column: 5, scope: !1157)
!1160 = !DILocation(line: 1000, column: 5, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1152, file: !69, line: 999, column: 4)
!1162 = !DILocation(line: 1005, column: 4, scope: !1163)
!1163 = distinct !DILexicalBlock(scope: !1148, file: !69, line: 1004, column: 3)
!1164 = !DILocation(line: 1008, column: 1, scope: !1097)
!1165 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1026, type: !1166, scopeLine: 1027, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1166 = !DISubroutineType(types: !1167)
!1167 = !{!20, !20, !20, !28}
!1168 = !DILocalVariable(name: "data1", arg: 1, scope: !1165, file: !69, line: 1026, type: !20)
!1169 = !DILocation(line: 1026, column: 33, scope: !1165)
!1170 = !DILocalVariable(name: "data2", arg: 2, scope: !1165, file: !69, line: 1026, type: !20)
!1171 = !DILocation(line: 1026, column: 43, scope: !1165)
!1172 = !DILocalVariable(name: "denominator", arg: 3, scope: !1165, file: !69, line: 1026, type: !28)
!1173 = !DILocation(line: 1026, column: 53, scope: !1165)
!1174 = !DILocalVariable(name: "s32Result", scope: !1165, file: !69, line: 1028, type: !12)
!1175 = !DILocation(line: 1028, column: 6, scope: !1165)
!1176 = !DILocalVariable(name: "s32Temp1", scope: !1165, file: !69, line: 1028, type: !12)
!1177 = !DILocation(line: 1028, column: 21, scope: !1165)
!1178 = !DILocation(line: 1029, column: 14, scope: !1165)
!1179 = !DILocation(line: 1029, column: 22, scope: !1165)
!1180 = !DILocation(line: 1029, column: 20, scope: !1165)
!1181 = !DILocation(line: 1029, column: 12, scope: !1165)
!1182 = !DILocation(line: 1031, column: 5, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1165, file: !69, line: 1031, column: 5)
!1184 = !DILocation(line: 1031, column: 17, scope: !1183)
!1185 = !DILocation(line: 1031, column: 5, scope: !1165)
!1186 = !DILocation(line: 1033, column: 6, scope: !1187)
!1187 = distinct !DILexicalBlock(scope: !1188, file: !69, line: 1033, column: 6)
!1188 = distinct !DILexicalBlock(scope: !1183, file: !69, line: 1032, column: 2)
!1189 = !DILocation(line: 1033, column: 16, scope: !1187)
!1190 = !DILocation(line: 1033, column: 6, scope: !1188)
!1191 = !DILocation(line: 1035, column: 4, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1187, file: !69, line: 1034, column: 3)
!1193 = !DILocation(line: 1037, column: 11, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1187, file: !69, line: 1037, column: 11)
!1195 = !DILocation(line: 1037, column: 21, scope: !1194)
!1196 = !DILocation(line: 1037, column: 11, scope: !1187)
!1197 = !DILocation(line: 1039, column: 4, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1194, file: !69, line: 1038, column: 3)
!1199 = !DILocation(line: 1043, column: 4, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1194, file: !69, line: 1042, column: 3)
!1201 = !DILocation(line: 1048, column: 15, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1183, file: !69, line: 1047, column: 2)
!1203 = !DILocation(line: 1048, column: 28, scope: !1202)
!1204 = !DILocation(line: 1048, column: 38, scope: !1202)
!1205 = !DILocation(line: 1048, column: 37, scope: !1202)
!1206 = !DILocation(line: 1048, column: 51, scope: !1202)
!1207 = !DILocation(line: 1048, column: 50, scope: !1202)
!1208 = !DILocation(line: 1048, column: 25, scope: !1202)
!1209 = !DILocation(line: 1048, column: 64, scope: !1202)
!1210 = !DILocation(line: 1048, column: 12, scope: !1202)
!1211 = !DILocation(line: 1049, column: 16, scope: !1202)
!1212 = !DILocation(line: 1049, column: 25, scope: !1202)
!1213 = !DILocation(line: 1049, column: 24, scope: !1202)
!1214 = !DILocation(line: 1049, column: 41, scope: !1202)
!1215 = !DILocation(line: 1049, column: 51, scope: !1202)
!1216 = !DILocation(line: 1049, column: 50, scope: !1202)
!1217 = !DILocation(line: 1049, column: 38, scope: !1202)
!1218 = !DILocation(line: 1049, column: 13, scope: !1202)
!1219 = !DILocation(line: 1050, column: 6, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1202, file: !69, line: 1050, column: 6)
!1221 = !DILocation(line: 1050, column: 16, scope: !1220)
!1222 = !DILocation(line: 1050, column: 6, scope: !1202)
!1223 = !DILocation(line: 1052, column: 7, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1225, file: !69, line: 1052, column: 7)
!1225 = distinct !DILexicalBlock(scope: !1220, file: !69, line: 1051, column: 3)
!1226 = !DILocation(line: 1052, column: 17, scope: !1224)
!1227 = !DILocation(line: 1052, column: 7, scope: !1225)
!1228 = !DILocation(line: 1054, column: 17, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1224, file: !69, line: 1053, column: 4)
!1230 = !DILocation(line: 1054, column: 12, scope: !1229)
!1231 = !DILocation(line: 1054, column: 5, scope: !1229)
!1232 = !DILocation(line: 1058, column: 5, scope: !1233)
!1233 = distinct !DILexicalBlock(scope: !1224, file: !69, line: 1057, column: 4)
!1234 = !DILocation(line: 1063, column: 4, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1220, file: !69, line: 1062, column: 3)
!1236 = !DILocation(line: 1067, column: 1, scope: !1165)
!1237 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1084, type: !1238, scopeLine: 1085, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1238 = !DISubroutineType(types: !1239)
!1239 = !{!508, !508, !12}
!1240 = !DILocalVariable(name: "numerator", arg: 1, scope: !1237, file: !69, line: 1084, type: !508)
!1241 = !DILocation(line: 1084, column: 25, scope: !1237)
!1242 = !DILocalVariable(name: "denominator", arg: 2, scope: !1237, file: !69, line: 1084, type: !12)
!1243 = !DILocation(line: 1084, column: 40, scope: !1237)
!1244 = !DILocalVariable(name: "u32Temp1", scope: !1237, file: !69, line: 1086, type: !508)
!1245 = !DILocation(line: 1086, column: 6, scope: !1237)
!1246 = !DILocation(line: 1087, column: 5, scope: !1247)
!1247 = distinct !DILexicalBlock(scope: !1237, file: !69, line: 1087, column: 5)
!1248 = !DILocation(line: 1087, column: 17, scope: !1247)
!1249 = !DILocation(line: 1087, column: 5, scope: !1237)
!1250 = !DILocation(line: 1089, column: 3, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1247, file: !69, line: 1088, column: 2)
!1252 = !DILocation(line: 1093, column: 6, scope: !1253)
!1253 = distinct !DILexicalBlock(scope: !1254, file: !69, line: 1093, column: 6)
!1254 = distinct !DILexicalBlock(scope: !1247, file: !69, line: 1092, column: 2)
!1255 = !DILocation(line: 1093, column: 18, scope: !1253)
!1256 = !DILocation(line: 1093, column: 6, scope: !1254)
!1257 = !DILocation(line: 1095, column: 4, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1253, file: !69, line: 1094, column: 3)
!1259 = !DILocation(line: 1099, column: 16, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1253, file: !69, line: 1098, column: 3)
!1261 = !DILocation(line: 1099, column: 30, scope: !1260)
!1262 = !DILocation(line: 1099, column: 40, scope: !1260)
!1263 = !DILocation(line: 1099, column: 39, scope: !1260)
!1264 = !DILocation(line: 1099, column: 55, scope: !1260)
!1265 = !DILocation(line: 1099, column: 53, scope: !1260)
!1266 = !DILocation(line: 1099, column: 26, scope: !1260)
!1267 = !DILocation(line: 1099, column: 68, scope: !1260)
!1268 = !DILocation(line: 1099, column: 13, scope: !1260)
!1269 = !DILocation(line: 1100, column: 16, scope: !1260)
!1270 = !DILocation(line: 1100, column: 25, scope: !1260)
!1271 = !DILocation(line: 1100, column: 24, scope: !1260)
!1272 = !DILocation(line: 1100, column: 41, scope: !1260)
!1273 = !DILocation(line: 1100, column: 51, scope: !1260)
!1274 = !DILocation(line: 1100, column: 50, scope: !1260)
!1275 = !DILocation(line: 1100, column: 38, scope: !1260)
!1276 = !DILocation(line: 1100, column: 13, scope: !1260)
!1277 = !DILocation(line: 1101, column: 11, scope: !1260)
!1278 = !DILocation(line: 1101, column: 4, scope: !1260)
!1279 = !DILocation(line: 1104, column: 1, scope: !1237)
!1280 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1121, type: !1281, scopeLine: 1122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1281 = !DISubroutineType(types: !1282)
!1282 = !{!508, !12, !508}
!1283 = !DILocalVariable(name: "numerator", arg: 1, scope: !1280, file: !69, line: 1121, type: !12)
!1284 = !DILocation(line: 1121, column: 25, scope: !1280)
!1285 = !DILocalVariable(name: "denominator", arg: 2, scope: !1280, file: !69, line: 1121, type: !508)
!1286 = !DILocation(line: 1121, column: 40, scope: !1280)
!1287 = !DILocalVariable(name: "s32Temp1", scope: !1280, file: !69, line: 1123, type: !12)
!1288 = !DILocation(line: 1123, column: 6, scope: !1280)
!1289 = !DILocation(line: 1124, column: 5, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1280, file: !69, line: 1124, column: 5)
!1291 = !DILocation(line: 1124, column: 17, scope: !1290)
!1292 = !DILocation(line: 1124, column: 5, scope: !1280)
!1293 = !DILocation(line: 1126, column: 6, scope: !1294)
!1294 = distinct !DILexicalBlock(scope: !1295, file: !69, line: 1126, column: 6)
!1295 = distinct !DILexicalBlock(scope: !1290, file: !69, line: 1125, column: 2)
!1296 = !DILocation(line: 1126, column: 16, scope: !1294)
!1297 = !DILocation(line: 1126, column: 6, scope: !1295)
!1298 = !DILocation(line: 1128, column: 4, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1294, file: !69, line: 1127, column: 3)
!1300 = !DILocation(line: 1132, column: 4, scope: !1301)
!1301 = distinct !DILexicalBlock(scope: !1294, file: !69, line: 1131, column: 3)
!1302 = !DILocation(line: 1137, column: 6, scope: !1303)
!1303 = distinct !DILexicalBlock(scope: !1304, file: !69, line: 1137, column: 6)
!1304 = distinct !DILexicalBlock(scope: !1290, file: !69, line: 1136, column: 2)
!1305 = !DILocation(line: 1137, column: 16, scope: !1303)
!1306 = !DILocation(line: 1137, column: 6, scope: !1304)
!1307 = !DILocation(line: 1139, column: 17, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1303, file: !69, line: 1138, column: 3)
!1309 = !DILocation(line: 1139, column: 31, scope: !1308)
!1310 = !DILocation(line: 1139, column: 41, scope: !1308)
!1311 = !DILocation(line: 1139, column: 40, scope: !1308)
!1312 = !DILocation(line: 1139, column: 56, scope: !1308)
!1313 = !DILocation(line: 1139, column: 54, scope: !1308)
!1314 = !DILocation(line: 1139, column: 27, scope: !1308)
!1315 = !DILocation(line: 1139, column: 69, scope: !1308)
!1316 = !DILocation(line: 1139, column: 13, scope: !1308)
!1317 = !DILocation(line: 1140, column: 13, scope: !1308)
!1318 = !DILocation(line: 1140, column: 23, scope: !1308)
!1319 = !DILocation(line: 1140, column: 22, scope: !1308)
!1320 = !DILocation(line: 1140, column: 39, scope: !1308)
!1321 = !DILocation(line: 1140, column: 48, scope: !1308)
!1322 = !DILocation(line: 1140, column: 47, scope: !1308)
!1323 = !DILocation(line: 1140, column: 36, scope: !1308)
!1324 = !DILocation(line: 1140, column: 4, scope: !1308)
!1325 = !DILocation(line: 1144, column: 4, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1303, file: !69, line: 1143, column: 3)
!1327 = !DILocation(line: 1147, column: 1, scope: !1280)
!1328 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1164, type: !1329, scopeLine: 1165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1329 = !DISubroutineType(types: !1330)
!1330 = !{!508, !12, !12}
!1331 = !DILocalVariable(name: "numerator", arg: 1, scope: !1328, file: !69, line: 1164, type: !12)
!1332 = !DILocation(line: 1164, column: 25, scope: !1328)
!1333 = !DILocalVariable(name: "denominator", arg: 2, scope: !1328, file: !69, line: 1164, type: !12)
!1334 = !DILocation(line: 1164, column: 40, scope: !1328)
!1335 = !DILocalVariable(name: "u32Temp1", scope: !1328, file: !69, line: 1166, type: !508)
!1336 = !DILocation(line: 1166, column: 6, scope: !1328)
!1337 = !DILocalVariable(name: "u32Temp2", scope: !1328, file: !69, line: 1166, type: !508)
!1338 = !DILocation(line: 1166, column: 20, scope: !1328)
!1339 = !DILocation(line: 1167, column: 5, scope: !1340)
!1340 = distinct !DILexicalBlock(scope: !1328, file: !69, line: 1167, column: 5)
!1341 = !DILocation(line: 1167, column: 17, scope: !1340)
!1342 = !DILocation(line: 1167, column: 5, scope: !1328)
!1343 = !DILocation(line: 1169, column: 6, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1345, file: !69, line: 1169, column: 6)
!1345 = distinct !DILexicalBlock(scope: !1340, file: !69, line: 1168, column: 2)
!1346 = !DILocation(line: 1169, column: 16, scope: !1344)
!1347 = !DILocation(line: 1169, column: 6, scope: !1345)
!1348 = !DILocation(line: 1171, column: 4, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1344, file: !69, line: 1170, column: 3)
!1350 = !DILocation(line: 1175, column: 4, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1344, file: !69, line: 1174, column: 3)
!1352 = !DILocation(line: 1180, column: 6, scope: !1353)
!1353 = distinct !DILexicalBlock(scope: !1354, file: !69, line: 1180, column: 6)
!1354 = distinct !DILexicalBlock(scope: !1340, file: !69, line: 1179, column: 2)
!1355 = !DILocation(line: 1180, column: 16, scope: !1353)
!1356 = !DILocation(line: 1180, column: 6, scope: !1354)
!1357 = !DILocation(line: 1182, column: 7, scope: !1358)
!1358 = distinct !DILexicalBlock(scope: !1359, file: !69, line: 1182, column: 7)
!1359 = distinct !DILexicalBlock(scope: !1353, file: !69, line: 1181, column: 3)
!1360 = !DILocation(line: 1182, column: 17, scope: !1358)
!1361 = !DILocation(line: 1182, column: 7, scope: !1359)
!1362 = !DILocation(line: 1184, column: 5, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1358, file: !69, line: 1183, column: 4)
!1364 = !DILocation(line: 1188, column: 8, scope: !1365)
!1365 = distinct !DILexicalBlock(scope: !1366, file: !69, line: 1188, column: 8)
!1366 = distinct !DILexicalBlock(scope: !1358, file: !69, line: 1187, column: 4)
!1367 = !DILocation(line: 1188, column: 20, scope: !1365)
!1368 = !DILocation(line: 1188, column: 8, scope: !1366)
!1369 = !DILocation(line: 1190, column: 6, scope: !1370)
!1370 = distinct !DILexicalBlock(scope: !1365, file: !69, line: 1189, column: 5)
!1371 = !DILocation(line: 1194, column: 18, scope: !1372)
!1372 = distinct !DILexicalBlock(scope: !1365, file: !69, line: 1193, column: 5)
!1373 = !DILocation(line: 1194, column: 32, scope: !1372)
!1374 = !DILocation(line: 1194, column: 42, scope: !1372)
!1375 = !DILocation(line: 1194, column: 41, scope: !1372)
!1376 = !DILocation(line: 1194, column: 57, scope: !1372)
!1377 = !DILocation(line: 1194, column: 55, scope: !1372)
!1378 = !DILocation(line: 1194, column: 28, scope: !1372)
!1379 = !DILocation(line: 1194, column: 71, scope: !1372)
!1380 = !DILocation(line: 1194, column: 15, scope: !1372)
!1381 = !DILocation(line: 1195, column: 18, scope: !1372)
!1382 = !DILocation(line: 1195, column: 29, scope: !1372)
!1383 = !DILocation(line: 1195, column: 27, scope: !1372)
!1384 = !DILocation(line: 1195, column: 45, scope: !1372)
!1385 = !DILocation(line: 1195, column: 57, scope: !1372)
!1386 = !DILocation(line: 1195, column: 55, scope: !1372)
!1387 = !DILocation(line: 1195, column: 42, scope: !1372)
!1388 = !DILocation(line: 1195, column: 15, scope: !1372)
!1389 = !DILocation(line: 1196, column: 13, scope: !1372)
!1390 = !DILocation(line: 1196, column: 6, scope: !1372)
!1391 = !DILocation(line: 1202, column: 7, scope: !1392)
!1392 = distinct !DILexicalBlock(scope: !1393, file: !69, line: 1202, column: 7)
!1393 = distinct !DILexicalBlock(scope: !1353, file: !69, line: 1201, column: 3)
!1394 = !DILocation(line: 1202, column: 19, scope: !1392)
!1395 = !DILocation(line: 1202, column: 7, scope: !1393)
!1396 = !DILocation(line: 1204, column: 5, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1392, file: !69, line: 1203, column: 4)
!1398 = !DILocation(line: 1208, column: 18, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1392, file: !69, line: 1207, column: 4)
!1400 = !DILocation(line: 1208, column: 17, scope: !1399)
!1401 = !DILocation(line: 1208, column: 15, scope: !1399)
!1402 = !DILocation(line: 1209, column: 20, scope: !1399)
!1403 = !DILocation(line: 1209, column: 19, scope: !1399)
!1404 = !DILocation(line: 1209, column: 17, scope: !1399)
!1405 = !DILocation(line: 1210, column: 17, scope: !1399)
!1406 = !DILocation(line: 1210, column: 31, scope: !1399)
!1407 = !DILocation(line: 1210, column: 41, scope: !1399)
!1408 = !DILocation(line: 1210, column: 40, scope: !1399)
!1409 = !DILocation(line: 1210, column: 56, scope: !1399)
!1410 = !DILocation(line: 1210, column: 54, scope: !1399)
!1411 = !DILocation(line: 1210, column: 27, scope: !1399)
!1412 = !DILocation(line: 1210, column: 70, scope: !1399)
!1413 = !DILocation(line: 1210, column: 14, scope: !1399)
!1414 = !DILocation(line: 1211, column: 17, scope: !1399)
!1415 = !DILocation(line: 1211, column: 28, scope: !1399)
!1416 = !DILocation(line: 1211, column: 26, scope: !1399)
!1417 = !DILocation(line: 1211, column: 44, scope: !1399)
!1418 = !DILocation(line: 1211, column: 56, scope: !1399)
!1419 = !DILocation(line: 1211, column: 54, scope: !1399)
!1420 = !DILocation(line: 1211, column: 41, scope: !1399)
!1421 = !DILocation(line: 1211, column: 14, scope: !1399)
!1422 = !DILocation(line: 1212, column: 12, scope: !1399)
!1423 = !DILocation(line: 1212, column: 5, scope: !1399)
!1424 = !DILocation(line: 1217, column: 1, scope: !1328)
!1425 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1234, type: !1426, scopeLine: 1235, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1426 = !DISubroutineType(types: !1427)
!1427 = !{!508, !508, !508}
!1428 = !DILocalVariable(name: "numerator", arg: 1, scope: !1425, file: !69, line: 1234, type: !508)
!1429 = !DILocation(line: 1234, column: 25, scope: !1425)
!1430 = !DILocalVariable(name: "denominator", arg: 2, scope: !1425, file: !69, line: 1234, type: !508)
!1431 = !DILocation(line: 1234, column: 40, scope: !1425)
!1432 = !DILocalVariable(name: "u32Temp1", scope: !1425, file: !69, line: 1237, type: !508)
!1433 = !DILocation(line: 1237, column: 6, scope: !1425)
!1434 = !DILocalVariable(name: "u32Temp2", scope: !1425, file: !69, line: 1237, type: !508)
!1435 = !DILocation(line: 1237, column: 20, scope: !1425)
!1436 = !DILocalVariable(name: "u32Temp3", scope: !1425, file: !69, line: 1237, type: !508)
!1437 = !DILocation(line: 1237, column: 34, scope: !1425)
!1438 = !DILocalVariable(name: "numerator_old", scope: !1425, file: !69, line: 1237, type: !508)
!1439 = !DILocation(line: 1237, column: 48, scope: !1425)
!1440 = !DILocation(line: 1238, column: 5, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1425, file: !69, line: 1238, column: 5)
!1442 = !DILocation(line: 1238, column: 16, scope: !1441)
!1443 = !DILocation(line: 1238, column: 5, scope: !1425)
!1444 = !DILocation(line: 1240, column: 3, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1441, file: !69, line: 1239, column: 2)
!1446 = !DILocation(line: 1244, column: 14, scope: !1447)
!1447 = distinct !DILexicalBlock(scope: !1441, file: !69, line: 1243, column: 2)
!1448 = !DILocation(line: 1244, column: 26, scope: !1447)
!1449 = !DILocation(line: 1244, column: 41, scope: !1447)
!1450 = !DILocation(line: 1244, column: 51, scope: !1447)
!1451 = !DILocation(line: 1244, column: 50, scope: !1447)
!1452 = !DILocation(line: 1244, column: 38, scope: !1447)
!1453 = !DILocation(line: 1244, column: 24, scope: !1447)
!1454 = !DILocation(line: 1244, column: 12, scope: !1447)
!1455 = !DILocation(line: 1245, column: 7, scope: !1456)
!1456 = distinct !DILexicalBlock(scope: !1447, file: !69, line: 1245, column: 6)
!1457 = !DILocation(line: 1245, column: 16, scope: !1456)
!1458 = !DILocation(line: 1245, column: 24, scope: !1456)
!1459 = !DILocation(line: 1245, column: 6, scope: !1447)
!1460 = !DILocation(line: 1247, column: 16, scope: !1461)
!1461 = distinct !DILexicalBlock(scope: !1456, file: !69, line: 1246, column: 3)
!1462 = !DILocation(line: 1247, column: 27, scope: !1461)
!1463 = !DILocation(line: 1247, column: 13, scope: !1461)
!1464 = !DILocation(line: 1248, column: 3, scope: !1461)
!1465 = !DILocation(line: 1251, column: 16, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1456, file: !69, line: 1250, column: 3)
!1467 = !DILocation(line: 1251, column: 27, scope: !1466)
!1468 = !DILocation(line: 1251, column: 32, scope: !1466)
!1469 = !DILocation(line: 1251, column: 13, scope: !1466)
!1470 = !DILocation(line: 1254, column: 6, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1447, file: !69, line: 1254, column: 6)
!1472 = !DILocation(line: 1254, column: 17, scope: !1471)
!1473 = !DILocation(line: 1254, column: 15, scope: !1471)
!1474 = !DILocation(line: 1254, column: 6, scope: !1447)
!1475 = !DILocation(line: 1256, column: 12, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1471, file: !69, line: 1255, column: 3)
!1477 = !DILocation(line: 1256, column: 22, scope: !1476)
!1478 = !DILocation(line: 1256, column: 21, scope: !1476)
!1479 = !DILocation(line: 1256, column: 4, scope: !1476)
!1480 = !DILocation(line: 1260, column: 13, scope: !1481)
!1481 = distinct !DILexicalBlock(scope: !1471, file: !69, line: 1259, column: 3)
!1482 = !DILocation(line: 1260, column: 23, scope: !1481)
!1483 = !DILocation(line: 1260, column: 22, scope: !1481)
!1484 = !DILocation(line: 1260, column: 36, scope: !1481)
!1485 = !DILocation(line: 1260, column: 4, scope: !1481)
!1486 = !DILocation(line: 1265, column: 1, scope: !1425)
!1487 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1282, type: !1488, scopeLine: 1283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1488 = !DISubroutineType(types: !1489)
!1489 = !{!12, !508, !12}
!1490 = !DILocalVariable(name: "numerator", arg: 1, scope: !1487, file: !69, line: 1282, type: !508)
!1491 = !DILocation(line: 1282, column: 25, scope: !1487)
!1492 = !DILocalVariable(name: "denominator", arg: 2, scope: !1487, file: !69, line: 1282, type: !12)
!1493 = !DILocation(line: 1282, column: 40, scope: !1487)
!1494 = !DILocalVariable(name: "u32Temp1", scope: !1487, file: !69, line: 1284, type: !508)
!1495 = !DILocation(line: 1284, column: 6, scope: !1487)
!1496 = !DILocalVariable(name: "u32Temp2", scope: !1487, file: !69, line: 1284, type: !508)
!1497 = !DILocation(line: 1284, column: 20, scope: !1487)
!1498 = !DILocation(line: 1285, column: 5, scope: !1499)
!1499 = distinct !DILexicalBlock(scope: !1487, file: !69, line: 1285, column: 5)
!1500 = !DILocation(line: 1285, column: 17, scope: !1499)
!1501 = !DILocation(line: 1285, column: 5, scope: !1487)
!1502 = !DILocation(line: 1287, column: 6, scope: !1503)
!1503 = distinct !DILexicalBlock(scope: !1504, file: !69, line: 1287, column: 6)
!1504 = distinct !DILexicalBlock(scope: !1499, file: !69, line: 1286, column: 2)
!1505 = !DILocation(line: 1287, column: 18, scope: !1503)
!1506 = !DILocation(line: 1287, column: 6, scope: !1504)
!1507 = !DILocation(line: 1289, column: 4, scope: !1508)
!1508 = distinct !DILexicalBlock(scope: !1503, file: !69, line: 1288, column: 3)
!1509 = !DILocation(line: 1293, column: 19, scope: !1510)
!1510 = distinct !DILexicalBlock(scope: !1503, file: !69, line: 1292, column: 3)
!1511 = !DILocation(line: 1293, column: 18, scope: !1510)
!1512 = !DILocation(line: 1293, column: 16, scope: !1510)
!1513 = !DILocation(line: 1294, column: 16, scope: !1510)
!1514 = !DILocation(line: 1294, column: 30, scope: !1510)
!1515 = !DILocation(line: 1294, column: 40, scope: !1510)
!1516 = !DILocation(line: 1294, column: 39, scope: !1510)
!1517 = !DILocation(line: 1294, column: 55, scope: !1510)
!1518 = !DILocation(line: 1294, column: 53, scope: !1510)
!1519 = !DILocation(line: 1294, column: 26, scope: !1510)
!1520 = !DILocation(line: 1294, column: 69, scope: !1510)
!1521 = !DILocation(line: 1294, column: 13, scope: !1510)
!1522 = !DILocation(line: 1295, column: 16, scope: !1510)
!1523 = !DILocation(line: 1295, column: 25, scope: !1510)
!1524 = !DILocation(line: 1295, column: 24, scope: !1510)
!1525 = !DILocation(line: 1295, column: 41, scope: !1510)
!1526 = !DILocation(line: 1295, column: 51, scope: !1510)
!1527 = !DILocation(line: 1295, column: 50, scope: !1510)
!1528 = !DILocation(line: 1295, column: 38, scope: !1510)
!1529 = !DILocation(line: 1295, column: 13, scope: !1510)
!1530 = !DILocation(line: 1296, column: 7, scope: !1531)
!1531 = distinct !DILexicalBlock(scope: !1510, file: !69, line: 1296, column: 7)
!1532 = !DILocation(line: 1296, column: 16, scope: !1531)
!1533 = !DILocation(line: 1296, column: 7, scope: !1510)
!1534 = !DILocation(line: 1298, column: 13, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1531, file: !69, line: 1297, column: 4)
!1536 = !DILocation(line: 1298, column: 12, scope: !1535)
!1537 = !DILocation(line: 1298, column: 5, scope: !1535)
!1538 = !DILocation(line: 1302, column: 5, scope: !1539)
!1539 = distinct !DILexicalBlock(scope: !1531, file: !69, line: 1301, column: 4)
!1540 = !DILocation(line: 1308, column: 15, scope: !1541)
!1541 = distinct !DILexicalBlock(scope: !1499, file: !69, line: 1307, column: 2)
!1542 = !DILocation(line: 1308, column: 29, scope: !1541)
!1543 = !DILocation(line: 1308, column: 39, scope: !1541)
!1544 = !DILocation(line: 1308, column: 38, scope: !1541)
!1545 = !DILocation(line: 1308, column: 54, scope: !1541)
!1546 = !DILocation(line: 1308, column: 52, scope: !1541)
!1547 = !DILocation(line: 1308, column: 25, scope: !1541)
!1548 = !DILocation(line: 1308, column: 68, scope: !1541)
!1549 = !DILocation(line: 1308, column: 12, scope: !1541)
!1550 = !DILocation(line: 1309, column: 15, scope: !1541)
!1551 = !DILocation(line: 1309, column: 24, scope: !1541)
!1552 = !DILocation(line: 1309, column: 23, scope: !1541)
!1553 = !DILocation(line: 1309, column: 40, scope: !1541)
!1554 = !DILocation(line: 1309, column: 50, scope: !1541)
!1555 = !DILocation(line: 1309, column: 49, scope: !1541)
!1556 = !DILocation(line: 1309, column: 37, scope: !1541)
!1557 = !DILocation(line: 1309, column: 12, scope: !1541)
!1558 = !DILocation(line: 1310, column: 6, scope: !1559)
!1559 = distinct !DILexicalBlock(scope: !1541, file: !69, line: 1310, column: 6)
!1560 = !DILocation(line: 1310, column: 15, scope: !1559)
!1561 = !DILocation(line: 1310, column: 6, scope: !1541)
!1562 = !DILocation(line: 1312, column: 11, scope: !1563)
!1563 = distinct !DILexicalBlock(scope: !1559, file: !69, line: 1311, column: 3)
!1564 = !DILocation(line: 1312, column: 4, scope: !1563)
!1565 = !DILocation(line: 1316, column: 4, scope: !1566)
!1566 = distinct !DILexicalBlock(scope: !1559, file: !69, line: 1315, column: 3)
!1567 = !DILocation(line: 1319, column: 1, scope: !1487)
!1568 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1337, type: !1569, scopeLine: 1338, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1569 = !DISubroutineType(types: !1570)
!1570 = !{!12, !12, !508}
!1571 = !DILocalVariable(name: "numerator", arg: 1, scope: !1568, file: !69, line: 1337, type: !12)
!1572 = !DILocation(line: 1337, column: 25, scope: !1568)
!1573 = !DILocalVariable(name: "denominator", arg: 2, scope: !1568, file: !69, line: 1337, type: !508)
!1574 = !DILocation(line: 1337, column: 40, scope: !1568)
!1575 = !DILocalVariable(name: "s32Temp1", scope: !1568, file: !69, line: 1339, type: !12)
!1576 = !DILocation(line: 1339, column: 6, scope: !1568)
!1577 = !DILocalVariable(name: "s32Temp2", scope: !1568, file: !69, line: 1339, type: !12)
!1578 = !DILocation(line: 1339, column: 20, scope: !1568)
!1579 = !DILocalVariable(name: "u32Temp0", scope: !1568, file: !69, line: 1340, type: !508)
!1580 = !DILocation(line: 1340, column: 6, scope: !1568)
!1581 = !DILocalVariable(name: "u32Temp1", scope: !1568, file: !69, line: 1340, type: !508)
!1582 = !DILocation(line: 1340, column: 20, scope: !1568)
!1583 = !DILocalVariable(name: "u32Temp2", scope: !1568, file: !69, line: 1340, type: !508)
!1584 = !DILocation(line: 1340, column: 34, scope: !1568)
!1585 = !DILocation(line: 1341, column: 5, scope: !1586)
!1586 = distinct !DILexicalBlock(scope: !1568, file: !69, line: 1341, column: 5)
!1587 = !DILocation(line: 1341, column: 17, scope: !1586)
!1588 = !DILocation(line: 1341, column: 5, scope: !1568)
!1589 = !DILocation(line: 1343, column: 6, scope: !1590)
!1590 = distinct !DILexicalBlock(scope: !1591, file: !69, line: 1343, column: 6)
!1591 = distinct !DILexicalBlock(scope: !1586, file: !69, line: 1342, column: 2)
!1592 = !DILocation(line: 1343, column: 16, scope: !1590)
!1593 = !DILocation(line: 1343, column: 6, scope: !1591)
!1594 = !DILocation(line: 1345, column: 4, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1590, file: !69, line: 1344, column: 3)
!1596 = !DILocation(line: 1349, column: 4, scope: !1597)
!1597 = distinct !DILexicalBlock(scope: !1590, file: !69, line: 1348, column: 3)
!1598 = !DILocation(line: 1354, column: 6, scope: !1599)
!1599 = distinct !DILexicalBlock(scope: !1600, file: !69, line: 1354, column: 6)
!1600 = distinct !DILexicalBlock(scope: !1586, file: !69, line: 1353, column: 2)
!1601 = !DILocation(line: 1354, column: 16, scope: !1599)
!1602 = !DILocation(line: 1354, column: 6, scope: !1600)
!1603 = !DILocation(line: 1356, column: 16, scope: !1604)
!1604 = distinct !DILexicalBlock(scope: !1599, file: !69, line: 1355, column: 3)
!1605 = !DILocation(line: 1356, column: 15, scope: !1604)
!1606 = !DILocation(line: 1356, column: 13, scope: !1604)
!1607 = !DILocation(line: 1357, column: 16, scope: !1604)
!1608 = !DILocation(line: 1357, column: 25, scope: !1604)
!1609 = !DILocation(line: 1357, column: 24, scope: !1604)
!1610 = !DILocation(line: 1357, column: 13, scope: !1604)
!1611 = !DILocation(line: 1358, column: 15, scope: !1604)
!1612 = !DILocation(line: 1358, column: 28, scope: !1604)
!1613 = !DILocation(line: 1358, column: 37, scope: !1604)
!1614 = !DILocation(line: 1358, column: 36, scope: !1604)
!1615 = !DILocation(line: 1358, column: 52, scope: !1604)
!1616 = !DILocation(line: 1358, column: 50, scope: !1604)
!1617 = !DILocation(line: 1358, column: 24, scope: !1604)
!1618 = !DILocation(line: 1358, column: 13, scope: !1604)
!1619 = !DILocation(line: 1360, column: 8, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1604, file: !69, line: 1360, column: 7)
!1621 = !DILocation(line: 1360, column: 20, scope: !1620)
!1622 = !DILocation(line: 1360, column: 27, scope: !1620)
!1623 = !DILocation(line: 1360, column: 7, scope: !1604)
!1624 = !DILocation(line: 1362, column: 20, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1620, file: !69, line: 1361, column: 4)
!1626 = !DILocation(line: 1362, column: 32, scope: !1625)
!1627 = !DILocation(line: 1362, column: 17, scope: !1625)
!1628 = !DILocation(line: 1363, column: 4, scope: !1625)
!1629 = !DILocation(line: 1366, column: 20, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1620, file: !69, line: 1365, column: 4)
!1631 = !DILocation(line: 1366, column: 32, scope: !1630)
!1632 = !DILocation(line: 1366, column: 38, scope: !1630)
!1633 = !DILocation(line: 1366, column: 17, scope: !1630)
!1634 = !DILocation(line: 1370, column: 7, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1604, file: !69, line: 1370, column: 7)
!1636 = !DILocation(line: 1370, column: 18, scope: !1635)
!1637 = !DILocation(line: 1370, column: 16, scope: !1635)
!1638 = !DILocation(line: 1370, column: 7, scope: !1604)
!1639 = !DILocation(line: 1372, column: 14, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1635, file: !69, line: 1371, column: 4)
!1641 = !DILocation(line: 1372, column: 13, scope: !1640)
!1642 = !DILocation(line: 1372, column: 23, scope: !1640)
!1643 = !DILocation(line: 1372, column: 5, scope: !1640)
!1644 = !DILocation(line: 1376, column: 14, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1635, file: !69, line: 1375, column: 4)
!1646 = !DILocation(line: 1376, column: 23, scope: !1645)
!1647 = !DILocation(line: 1376, column: 12, scope: !1645)
!1648 = !DILocation(line: 1376, column: 27, scope: !1645)
!1649 = !DILocation(line: 1376, column: 5, scope: !1645)
!1650 = !DILocation(line: 1383, column: 16, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1599, file: !69, line: 1382, column: 3)
!1652 = !DILocation(line: 1383, column: 30, scope: !1651)
!1653 = !DILocation(line: 1383, column: 40, scope: !1651)
!1654 = !DILocation(line: 1383, column: 39, scope: !1651)
!1655 = !DILocation(line: 1383, column: 55, scope: !1651)
!1656 = !DILocation(line: 1383, column: 53, scope: !1651)
!1657 = !DILocation(line: 1383, column: 26, scope: !1651)
!1658 = !DILocation(line: 1383, column: 69, scope: !1651)
!1659 = !DILocation(line: 1383, column: 13, scope: !1651)
!1660 = !DILocation(line: 1384, column: 16, scope: !1651)
!1661 = !DILocation(line: 1384, column: 26, scope: !1651)
!1662 = !DILocation(line: 1384, column: 25, scope: !1651)
!1663 = !DILocation(line: 1384, column: 42, scope: !1651)
!1664 = !DILocation(line: 1384, column: 51, scope: !1651)
!1665 = !DILocation(line: 1384, column: 50, scope: !1651)
!1666 = !DILocation(line: 1384, column: 39, scope: !1651)
!1667 = !DILocation(line: 1384, column: 13, scope: !1651)
!1668 = !DILocation(line: 1385, column: 11, scope: !1651)
!1669 = !DILocation(line: 1385, column: 4, scope: !1651)
!1670 = !DILocation(line: 1388, column: 1, scope: !1568)
!1671 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1405, type: !1672, scopeLine: 1406, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1672 = !DISubroutineType(types: !1673)
!1673 = !{!12, !12, !12}
!1674 = !DILocalVariable(name: "numerator", arg: 1, scope: !1671, file: !69, line: 1405, type: !12)
!1675 = !DILocation(line: 1405, column: 25, scope: !1671)
!1676 = !DILocalVariable(name: "denominator", arg: 2, scope: !1671, file: !69, line: 1405, type: !12)
!1677 = !DILocation(line: 1405, column: 40, scope: !1671)
!1678 = !DILocalVariable(name: "s32Temp1", scope: !1671, file: !69, line: 1407, type: !12)
!1679 = !DILocation(line: 1407, column: 6, scope: !1671)
!1680 = !DILocalVariable(name: "s32Temp2", scope: !1671, file: !69, line: 1407, type: !12)
!1681 = !DILocation(line: 1407, column: 20, scope: !1671)
!1682 = !DILocalVariable(name: "denominator_prime", scope: !1671, file: !69, line: 1408, type: !508)
!1683 = !DILocation(line: 1408, column: 6, scope: !1671)
!1684 = !DILocalVariable(name: "u32Temp1", scope: !1671, file: !69, line: 1408, type: !508)
!1685 = !DILocation(line: 1408, column: 29, scope: !1671)
!1686 = !DILocalVariable(name: "u32Temp2", scope: !1671, file: !69, line: 1408, type: !508)
!1687 = !DILocation(line: 1408, column: 43, scope: !1671)
!1688 = !DILocalVariable(name: "u32numerator", scope: !1671, file: !69, line: 1409, type: !508)
!1689 = !DILocation(line: 1409, column: 6, scope: !1671)
!1690 = !DILocalVariable(name: "u32denominator", scope: !1671, file: !69, line: 1409, type: !508)
!1691 = !DILocation(line: 1409, column: 23, scope: !1671)
!1692 = !DILocation(line: 1410, column: 5, scope: !1693)
!1693 = distinct !DILexicalBlock(scope: !1671, file: !69, line: 1410, column: 5)
!1694 = !DILocation(line: 1410, column: 15, scope: !1693)
!1695 = !DILocation(line: 1410, column: 5, scope: !1671)
!1696 = !DILocation(line: 1412, column: 6, scope: !1697)
!1697 = distinct !DILexicalBlock(scope: !1698, file: !69, line: 1412, column: 6)
!1698 = distinct !DILexicalBlock(scope: !1693, file: !69, line: 1411, column: 2)
!1699 = !DILocation(line: 1412, column: 18, scope: !1697)
!1700 = !DILocation(line: 1412, column: 6, scope: !1698)
!1701 = !DILocation(line: 1414, column: 7, scope: !1702)
!1702 = distinct !DILexicalBlock(scope: !1703, file: !69, line: 1414, column: 7)
!1703 = distinct !DILexicalBlock(scope: !1697, file: !69, line: 1413, column: 3)
!1704 = !DILocation(line: 1414, column: 19, scope: !1702)
!1705 = !DILocation(line: 1414, column: 7, scope: !1703)
!1706 = !DILocation(line: 1416, column: 5, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !1702, file: !69, line: 1415, column: 4)
!1708 = !DILocation(line: 1420, column: 21, scope: !1709)
!1709 = distinct !DILexicalBlock(scope: !1702, file: !69, line: 1419, column: 4)
!1710 = !DILocation(line: 1420, column: 20, scope: !1709)
!1711 = !DILocation(line: 1420, column: 18, scope: !1709)
!1712 = !DILocation(line: 1421, column: 23, scope: !1709)
!1713 = !DILocation(line: 1421, column: 22, scope: !1709)
!1714 = !DILocation(line: 1421, column: 20, scope: !1709)
!1715 = !DILocation(line: 1422, column: 16, scope: !1709)
!1716 = !DILocation(line: 1422, column: 33, scope: !1709)
!1717 = !DILocation(line: 1422, column: 46, scope: !1709)
!1718 = !DILocation(line: 1422, column: 45, scope: !1709)
!1719 = !DILocation(line: 1422, column: 64, scope: !1709)
!1720 = !DILocation(line: 1422, column: 62, scope: !1709)
!1721 = !DILocation(line: 1422, column: 29, scope: !1709)
!1722 = !DILocation(line: 1422, column: 81, scope: !1709)
!1723 = !DILocation(line: 1422, column: 14, scope: !1709)
!1724 = !DILocation(line: 1423, column: 17, scope: !1709)
!1725 = !DILocation(line: 1423, column: 30, scope: !1709)
!1726 = !DILocation(line: 1423, column: 29, scope: !1709)
!1727 = !DILocation(line: 1423, column: 49, scope: !1709)
!1728 = !DILocation(line: 1423, column: 58, scope: !1709)
!1729 = !DILocation(line: 1423, column: 57, scope: !1709)
!1730 = !DILocation(line: 1423, column: 46, scope: !1709)
!1731 = !DILocation(line: 1423, column: 14, scope: !1709)
!1732 = !DILocation(line: 1424, column: 8, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1709, file: !69, line: 1424, column: 8)
!1734 = !DILocation(line: 1424, column: 17, scope: !1733)
!1735 = !DILocation(line: 1424, column: 8, scope: !1709)
!1736 = !DILocation(line: 1426, column: 13, scope: !1737)
!1737 = distinct !DILexicalBlock(scope: !1733, file: !69, line: 1425, column: 5)
!1738 = !DILocation(line: 1426, column: 6, scope: !1737)
!1739 = !DILocation(line: 1430, column: 6, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1733, file: !69, line: 1429, column: 5)
!1741 = !DILocation(line: 1436, column: 20, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1697, file: !69, line: 1435, column: 3)
!1743 = !DILocation(line: 1436, column: 19, scope: !1742)
!1744 = !DILocation(line: 1436, column: 29, scope: !1742)
!1745 = !DILocation(line: 1436, column: 17, scope: !1742)
!1746 = !DILocation(line: 1437, column: 16, scope: !1742)
!1747 = !DILocation(line: 1437, column: 33, scope: !1742)
!1748 = !DILocation(line: 1437, column: 46, scope: !1742)
!1749 = !DILocation(line: 1437, column: 45, scope: !1742)
!1750 = !DILocation(line: 1437, column: 61, scope: !1742)
!1751 = !DILocation(line: 1437, column: 59, scope: !1742)
!1752 = !DILocation(line: 1437, column: 29, scope: !1742)
!1753 = !DILocation(line: 1437, column: 75, scope: !1742)
!1754 = !DILocation(line: 1437, column: 13, scope: !1742)
!1755 = !DILocation(line: 1438, column: 16, scope: !1742)
!1756 = !DILocation(line: 1438, column: 29, scope: !1742)
!1757 = !DILocation(line: 1438, column: 28, scope: !1742)
!1758 = !DILocation(line: 1438, column: 45, scope: !1742)
!1759 = !DILocation(line: 1438, column: 54, scope: !1742)
!1760 = !DILocation(line: 1438, column: 53, scope: !1742)
!1761 = !DILocation(line: 1438, column: 42, scope: !1742)
!1762 = !DILocation(line: 1438, column: 13, scope: !1742)
!1763 = !DILocation(line: 1439, column: 13, scope: !1742)
!1764 = !DILocation(line: 1439, column: 12, scope: !1742)
!1765 = !DILocation(line: 1439, column: 22, scope: !1742)
!1766 = !DILocation(line: 1439, column: 4, scope: !1742)
!1767 = !DILocation(line: 1444, column: 6, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1769, file: !69, line: 1444, column: 6)
!1769 = distinct !DILexicalBlock(scope: !1693, file: !69, line: 1443, column: 2)
!1770 = !DILocation(line: 1444, column: 18, scope: !1768)
!1771 = !DILocation(line: 1444, column: 6, scope: !1769)
!1772 = !DILocation(line: 1446, column: 7, scope: !1773)
!1773 = distinct !DILexicalBlock(scope: !1774, file: !69, line: 1446, column: 7)
!1774 = distinct !DILexicalBlock(scope: !1768, file: !69, line: 1445, column: 3)
!1775 = !DILocation(line: 1446, column: 19, scope: !1773)
!1776 = !DILocation(line: 1446, column: 7, scope: !1774)
!1777 = !DILocation(line: 1448, column: 5, scope: !1778)
!1778 = distinct !DILexicalBlock(scope: !1773, file: !69, line: 1447, column: 4)
!1779 = !DILocation(line: 1452, column: 23, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1773, file: !69, line: 1451, column: 4)
!1781 = !DILocation(line: 1452, column: 22, scope: !1780)
!1782 = !DILocation(line: 1452, column: 35, scope: !1780)
!1783 = !DILocation(line: 1452, column: 20, scope: !1780)
!1784 = !DILocation(line: 1453, column: 17, scope: !1780)
!1785 = !DILocation(line: 1453, column: 31, scope: !1780)
!1786 = !DILocation(line: 1453, column: 41, scope: !1780)
!1787 = !DILocation(line: 1453, column: 40, scope: !1780)
!1788 = !DILocation(line: 1453, column: 59, scope: !1780)
!1789 = !DILocation(line: 1453, column: 57, scope: !1780)
!1790 = !DILocation(line: 1453, column: 27, scope: !1780)
!1791 = !DILocation(line: 1453, column: 76, scope: !1780)
!1792 = !DILocation(line: 1453, column: 14, scope: !1780)
!1793 = !DILocation(line: 1454, column: 17, scope: !1780)
!1794 = !DILocation(line: 1454, column: 27, scope: !1780)
!1795 = !DILocation(line: 1454, column: 26, scope: !1780)
!1796 = !DILocation(line: 1454, column: 46, scope: !1780)
!1797 = !DILocation(line: 1454, column: 55, scope: !1780)
!1798 = !DILocation(line: 1454, column: 54, scope: !1780)
!1799 = !DILocation(line: 1454, column: 43, scope: !1780)
!1800 = !DILocation(line: 1454, column: 14, scope: !1780)
!1801 = !DILocation(line: 1455, column: 14, scope: !1780)
!1802 = !DILocation(line: 1455, column: 13, scope: !1780)
!1803 = !DILocation(line: 1455, column: 23, scope: !1780)
!1804 = !DILocation(line: 1455, column: 5, scope: !1780)
!1805 = !DILocation(line: 1460, column: 16, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1768, file: !69, line: 1459, column: 3)
!1807 = !DILocation(line: 1460, column: 30, scope: !1806)
!1808 = !DILocation(line: 1460, column: 40, scope: !1806)
!1809 = !DILocation(line: 1460, column: 39, scope: !1806)
!1810 = !DILocation(line: 1460, column: 55, scope: !1806)
!1811 = !DILocation(line: 1460, column: 53, scope: !1806)
!1812 = !DILocation(line: 1460, column: 26, scope: !1806)
!1813 = !DILocation(line: 1460, column: 69, scope: !1806)
!1814 = !DILocation(line: 1460, column: 13, scope: !1806)
!1815 = !DILocation(line: 1461, column: 16, scope: !1806)
!1816 = !DILocation(line: 1461, column: 26, scope: !1806)
!1817 = !DILocation(line: 1461, column: 25, scope: !1806)
!1818 = !DILocation(line: 1461, column: 42, scope: !1806)
!1819 = !DILocation(line: 1461, column: 51, scope: !1806)
!1820 = !DILocation(line: 1461, column: 50, scope: !1806)
!1821 = !DILocation(line: 1461, column: 39, scope: !1806)
!1822 = !DILocation(line: 1461, column: 13, scope: !1806)
!1823 = !DILocation(line: 1462, column: 11, scope: !1806)
!1824 = !DILocation(line: 1462, column: 4, scope: !1806)
!1825 = !DILocation(line: 1465, column: 1, scope: !1671)
!1826 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1483, type: !1827, scopeLine: 1484, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1827 = !DISubroutineType(types: !1828)
!1828 = !{!20, !12, !508}
!1829 = !DILocalVariable(name: "numerator", arg: 1, scope: !1826, file: !69, line: 1483, type: !12)
!1830 = !DILocation(line: 1483, column: 25, scope: !1826)
!1831 = !DILocalVariable(name: "denominator", arg: 2, scope: !1826, file: !69, line: 1483, type: !508)
!1832 = !DILocation(line: 1483, column: 40, scope: !1826)
!1833 = !DILocalVariable(name: "numerator_prime", scope: !1826, file: !69, line: 1486, type: !508)
!1834 = !DILocation(line: 1486, column: 6, scope: !1826)
!1835 = !DILocalVariable(name: "u32Temp1", scope: !1826, file: !69, line: 1486, type: !508)
!1836 = !DILocation(line: 1486, column: 27, scope: !1826)
!1837 = !DILocalVariable(name: "u32Temp2", scope: !1826, file: !69, line: 1486, type: !508)
!1838 = !DILocation(line: 1486, column: 41, scope: !1826)
!1839 = !DILocalVariable(name: "u32Temp3", scope: !1826, file: !69, line: 1486, type: !508)
!1840 = !DILocation(line: 1486, column: 55, scope: !1826)
!1841 = !DILocalVariable(name: "s32Temp1", scope: !1826, file: !69, line: 1487, type: !12)
!1842 = !DILocation(line: 1487, column: 6, scope: !1826)
!1843 = !DILocalVariable(name: "s32Temp2", scope: !1826, file: !69, line: 1487, type: !12)
!1844 = !DILocation(line: 1487, column: 20, scope: !1826)
!1845 = !DILocalVariable(name: "s32Temp3", scope: !1826, file: !69, line: 1487, type: !12)
!1846 = !DILocation(line: 1487, column: 34, scope: !1826)
!1847 = !DILocation(line: 1488, column: 5, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1826, file: !69, line: 1488, column: 5)
!1849 = !DILocation(line: 1488, column: 17, scope: !1848)
!1850 = !DILocation(line: 1488, column: 5, scope: !1826)
!1851 = !DILocation(line: 1490, column: 6, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1853, file: !69, line: 1490, column: 6)
!1853 = distinct !DILexicalBlock(scope: !1848, file: !69, line: 1489, column: 2)
!1854 = !DILocation(line: 1490, column: 15, scope: !1852)
!1855 = !DILocation(line: 1490, column: 6, scope: !1853)
!1856 = !DILocation(line: 1492, column: 4, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1852, file: !69, line: 1491, column: 3)
!1858 = !DILocation(line: 1496, column: 4, scope: !1859)
!1859 = distinct !DILexicalBlock(scope: !1852, file: !69, line: 1495, column: 3)
!1860 = !DILocation(line: 1501, column: 6, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1862, file: !69, line: 1501, column: 6)
!1862 = distinct !DILexicalBlock(scope: !1848, file: !69, line: 1500, column: 2)
!1863 = !DILocation(line: 1501, column: 16, scope: !1861)
!1864 = !DILocation(line: 1501, column: 6, scope: !1862)
!1865 = !DILocation(line: 1503, column: 23, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1861, file: !69, line: 1502, column: 3)
!1867 = !DILocation(line: 1503, column: 22, scope: !1866)
!1868 = !DILocation(line: 1503, column: 20, scope: !1866)
!1869 = !DILocation(line: 1504, column: 16, scope: !1866)
!1870 = !DILocation(line: 1504, column: 32, scope: !1866)
!1871 = !DILocation(line: 1504, column: 31, scope: !1866)
!1872 = !DILocation(line: 1504, column: 13, scope: !1866)
!1873 = !DILocation(line: 1505, column: 15, scope: !1866)
!1874 = !DILocation(line: 1505, column: 34, scope: !1866)
!1875 = !DILocation(line: 1505, column: 45, scope: !1866)
!1876 = !DILocation(line: 1505, column: 43, scope: !1866)
!1877 = !DILocation(line: 1505, column: 31, scope: !1866)
!1878 = !DILocation(line: 1505, column: 13, scope: !1866)
!1879 = !DILocation(line: 1507, column: 8, scope: !1880)
!1880 = distinct !DILexicalBlock(scope: !1866, file: !69, line: 1507, column: 7)
!1881 = !DILocation(line: 1507, column: 20, scope: !1880)
!1882 = !DILocation(line: 1507, column: 27, scope: !1880)
!1883 = !DILocation(line: 1507, column: 7, scope: !1866)
!1884 = !DILocation(line: 1509, column: 19, scope: !1885)
!1885 = distinct !DILexicalBlock(scope: !1880, file: !69, line: 1508, column: 4)
!1886 = !DILocation(line: 1509, column: 31, scope: !1885)
!1887 = !DILocation(line: 1509, column: 17, scope: !1885)
!1888 = !DILocation(line: 1510, column: 4, scope: !1885)
!1889 = !DILocation(line: 1513, column: 20, scope: !1890)
!1890 = distinct !DILexicalBlock(scope: !1880, file: !69, line: 1512, column: 4)
!1891 = !DILocation(line: 1513, column: 32, scope: !1890)
!1892 = !DILocation(line: 1513, column: 38, scope: !1890)
!1893 = !DILocation(line: 1513, column: 17, scope: !1890)
!1894 = !DILocation(line: 1516, column: 7, scope: !1895)
!1895 = distinct !DILexicalBlock(scope: !1866, file: !69, line: 1516, column: 7)
!1896 = !DILocation(line: 1516, column: 18, scope: !1895)
!1897 = !DILocation(line: 1516, column: 16, scope: !1895)
!1898 = !DILocation(line: 1516, column: 7, scope: !1866)
!1899 = !DILocation(line: 1518, column: 18, scope: !1900)
!1900 = distinct !DILexicalBlock(scope: !1895, file: !69, line: 1517, column: 4)
!1901 = !DILocation(line: 1518, column: 16, scope: !1900)
!1902 = !DILocation(line: 1518, column: 28, scope: !1900)
!1903 = !DILocation(line: 1518, column: 14, scope: !1900)
!1904 = !DILocation(line: 1519, column: 4, scope: !1900)
!1905 = !DILocation(line: 1522, column: 18, scope: !1906)
!1906 = distinct !DILexicalBlock(scope: !1895, file: !69, line: 1521, column: 4)
!1907 = !DILocation(line: 1522, column: 26, scope: !1906)
!1908 = !DILocation(line: 1522, column: 16, scope: !1906)
!1909 = !DILocation(line: 1522, column: 30, scope: !1906)
!1910 = !DILocation(line: 1522, column: 14, scope: !1906)
!1911 = !DILocation(line: 1524, column: 8, scope: !1912)
!1912 = distinct !DILexicalBlock(scope: !1866, file: !69, line: 1524, column: 7)
!1913 = !DILocation(line: 1524, column: 18, scope: !1912)
!1914 = !DILocation(line: 1524, column: 7, scope: !1866)
!1915 = !DILocation(line: 1526, column: 18, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1912, file: !69, line: 1525, column: 4)
!1917 = !DILocation(line: 1526, column: 12, scope: !1916)
!1918 = !DILocation(line: 1526, column: 5, scope: !1916)
!1919 = !DILocation(line: 1530, column: 5, scope: !1920)
!1920 = distinct !DILexicalBlock(scope: !1912, file: !69, line: 1529, column: 4)
!1921 = !DILocation(line: 1535, column: 16, scope: !1922)
!1922 = distinct !DILexicalBlock(scope: !1861, file: !69, line: 1534, column: 3)
!1923 = !DILocation(line: 1535, column: 26, scope: !1922)
!1924 = !DILocation(line: 1535, column: 25, scope: !1922)
!1925 = !DILocation(line: 1535, column: 41, scope: !1922)
!1926 = !DILocation(line: 1535, column: 39, scope: !1922)
!1927 = !DILocation(line: 1535, column: 13, scope: !1922)
!1928 = !DILocation(line: 1536, column: 16, scope: !1922)
!1929 = !DILocation(line: 1536, column: 30, scope: !1922)
!1930 = !DILocation(line: 1536, column: 40, scope: !1922)
!1931 = !DILocation(line: 1536, column: 39, scope: !1922)
!1932 = !DILocation(line: 1536, column: 55, scope: !1922)
!1933 = !DILocation(line: 1536, column: 53, scope: !1922)
!1934 = !DILocation(line: 1536, column: 26, scope: !1922)
!1935 = !DILocation(line: 1536, column: 68, scope: !1922)
!1936 = !DILocation(line: 1536, column: 13, scope: !1922)
!1937 = !DILocation(line: 1537, column: 16, scope: !1922)
!1938 = !DILocation(line: 1537, column: 25, scope: !1922)
!1939 = !DILocation(line: 1537, column: 24, scope: !1922)
!1940 = !DILocation(line: 1537, column: 41, scope: !1922)
!1941 = !DILocation(line: 1537, column: 51, scope: !1922)
!1942 = !DILocation(line: 1537, column: 50, scope: !1922)
!1943 = !DILocation(line: 1537, column: 38, scope: !1922)
!1944 = !DILocation(line: 1537, column: 13, scope: !1922)
!1945 = !DILocation(line: 1538, column: 7, scope: !1946)
!1946 = distinct !DILexicalBlock(scope: !1922, file: !69, line: 1538, column: 7)
!1947 = !DILocation(line: 1538, column: 16, scope: !1946)
!1948 = !DILocation(line: 1538, column: 7, scope: !1922)
!1949 = !DILocation(line: 1540, column: 17, scope: !1950)
!1950 = distinct !DILexicalBlock(scope: !1946, file: !69, line: 1539, column: 4)
!1951 = !DILocation(line: 1540, column: 12, scope: !1950)
!1952 = !DILocation(line: 1540, column: 5, scope: !1950)
!1953 = !DILocation(line: 1544, column: 5, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1946, file: !69, line: 1543, column: 4)
!1955 = !DILocation(line: 1548, column: 1, scope: !1826)
!1956 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1957, file: !1957, line: 12, type: !1958, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !1961)
!1957 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1958 = !DISubroutineType(types: !1959)
!1959 = !{null, !1960}
!1960 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1961 = !{!1962}
!1962 = !DILocalVariable(name: "z", arg: 1, scope: !1956, file: !1957, line: 12, type: !1960)
!1963 = !DILocation(line: 0, scope: !1956)
!1964 = !DILocation(line: 13, column: 9, scope: !1965)
!1965 = distinct !DILexicalBlock(scope: !1956, file: !1957, line: 13, column: 7)
!1966 = !DILocation(line: 13, column: 7, scope: !1956)
!1967 = !DILocation(line: 14, column: 5, scope: !1965)
!1968 = !DILocation(line: 15, column: 1, scope: !1956)
!1969 = distinct !DISubprogram(name: "klee_overshift_check", scope: !1970, file: !1970, line: 20, type: !1971, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !1974)
!1970 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!1971 = !DISubroutineType(types: !1972)
!1972 = !{null, !1973, !1973}
!1973 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!1974 = !{!1975, !1976}
!1975 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !1969, file: !1970, line: 20, type: !1973)
!1976 = !DILocalVariable(name: "shift", arg: 2, scope: !1969, file: !1970, line: 20, type: !1973)
!1977 = !DILocation(line: 0, scope: !1969)
!1978 = !DILocation(line: 21, column: 13, scope: !1979)
!1979 = distinct !DILexicalBlock(scope: !1969, file: !1970, line: 21, column: 7)
!1980 = !DILocation(line: 21, column: 7, scope: !1969)
!1981 = !DILocation(line: 27, column: 5, scope: !1982)
!1982 = distinct !DILexicalBlock(scope: !1979, file: !1970, line: 21, column: 26)
!1983 = !DILocation(line: 29, column: 1, scope: !1969)
