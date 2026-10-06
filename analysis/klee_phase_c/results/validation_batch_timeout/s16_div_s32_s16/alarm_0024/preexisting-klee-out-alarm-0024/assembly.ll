; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0024/build/s16_div_s32_s16_alarm_0024.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [145 x i8] c"KLEE-ALARM-0024: invalid LHS operand for left shift. assert 0 <= (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator));\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0024.err\00", align 1
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
  %numerator = alloca i32, align 4
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i16* %result, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = bitcast i32* %numerator to i8*, !dbg !58
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !59
  %1 = bitcast i16* %denominator to i8*, !dbg !60
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  %2 = load i32, i32* %numerator, align 4, !dbg !62
  %3 = load i16, i16* %denominator, align 2, !dbg !63
  %call = call signext i16 @s16_div_s32_s16(i32 %2, i16 signext %3), !dbg !64
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
  %conv = sext i16 %0 to i32, !dbg !80
  %shl = shl i32 %conv, 16, !dbg !81
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !82
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !83
  %conv1 = sext i16 %1 to i32, !dbg !83
  %cmp = icmp eq i32 %conv1, 0, !dbg !85
  br i1 %cmp, label %if.then, label %if.else7, !dbg !86

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !87
  %conv3 = sext i16 %2 to i32, !dbg !87
  %cmp4 = icmp slt i32 %conv3, 0, !dbg !90
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !91

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !92
  br label %return, !dbg !92

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !94
  br label %return, !dbg !94

if.else7:                                         ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !96
  %cmp8 = icmp ne i32 %3, -2147483648, !dbg !99
  br i1 %cmp8, label %if.then10, label %if.else29, !dbg !100

if.then10:                                        ; preds = %if.else7
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !101
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !103
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !104
  %conv11 = sext i16 %6 to i32, !dbg !104
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !105
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !105
  %div = sdiv i32 %5, %conv11, !dbg !105, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !107
  %conv12 = sext i16 %7 to i32, !dbg !107
  %mul = mul nsw i32 %div, %conv12, !dbg !108
  %sub = sub nsw i32 %4, %mul, !dbg !109
  %shl13 = shl i32 %sub, 1, !dbg !110
  store i32 %shl13, i32* %s32Temp2, align 4, !dbg !111
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !112
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !113
  %conv14 = sext i16 %9 to i32, !dbg !113
  %int_cast_to_i641 = zext i32 %conv14 to i64, !dbg !114
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !114
  %div15 = sdiv i32 %8, %conv14, !dbg !114, !klee.check.div !106
  store i32 %div15, i32* %s32Temp1, align 4, !dbg !115
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !116
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !117
  %conv16 = sext i16 %11 to i32, !dbg !117
  %shl17 = shl i32 %conv16, 16, !dbg !118
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !119
  %conv18 = sext i16 %12 to i32, !dbg !119
  %int_cast_to_i642 = zext i32 %conv18 to i64, !dbg !120
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !120
  %div19 = sdiv i32 %shl17, %conv18, !dbg !120, !klee.check.div !106
  %add = add nsw i32 %10, %div19, !dbg !121
  store i32 %add, i32* %s32Temp1, align 4, !dbg !122
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !123
  %cmp20 = icmp slt i32 %13, 32767, !dbg !125
  br i1 %cmp20, label %if.then22, label %if.else28, !dbg !126

if.then22:                                        ; preds = %if.then10
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !127
  %cmp23 = icmp sgt i32 %14, -32768, !dbg !130
  br i1 %cmp23, label %if.then25, label %if.else27, !dbg !131

if.then25:                                        ; preds = %if.then22
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !132
  %conv26 = trunc i32 %15 to i16, !dbg !134
  store i16 %conv26, i16* %retval, align 2, !dbg !135
  br label %return, !dbg !135

if.else27:                                        ; preds = %if.then22
  store i16 -32768, i16* %retval, align 2, !dbg !136
  br label %return, !dbg !136

if.else28:                                        ; preds = %if.then10
  store i16 32767, i16* %retval, align 2, !dbg !138
  br label %return, !dbg !138

if.else29:                                        ; preds = %if.else7
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !140
  %conv30 = sext i16 %16 to i32, !dbg !140
  %cmp31 = icmp ne i32 %conv30, -1, !dbg !143
  br i1 %cmp31, label %if.then33, label %if.else56, !dbg !144

if.then33:                                        ; preds = %if.else29
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !145
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !147
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !148
  %conv34 = sext i16 %19 to i32, !dbg !148
  %int_cast_to_i643 = zext i32 %conv34 to i64, !dbg !149
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !149
  %div35 = sdiv i32 %18, %conv34, !dbg !149, !klee.check.div !106
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !150
  %conv36 = sext i16 %20 to i32, !dbg !150
  %mul37 = mul nsw i32 %div35, %conv36, !dbg !151
  %sub38 = sub nsw i32 %17, %mul37, !dbg !152
  %shl39 = shl i32 %sub38, 1, !dbg !153
  store i32 %shl39, i32* %s32Temp2, align 4, !dbg !154
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !155
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !156
  %conv40 = sext i16 %22 to i32, !dbg !156
  %int_cast_to_i644 = zext i32 %conv40 to i64, !dbg !157
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !157
  %div41 = sdiv i32 %21, %conv40, !dbg !157, !klee.check.div !106
  store i32 %div41, i32* %s32Temp1, align 4, !dbg !158
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !159
  %24 = load i16, i16* %numerator.addr, align 2, !dbg !160
  %conv42 = sext i16 %24 to i32, !dbg !160
  %shl43 = shl i32 %conv42, 16, !dbg !161
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !162
  %conv44 = sext i16 %25 to i32, !dbg !162
  %int_cast_to_i645 = zext i32 %conv44 to i64, !dbg !163
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !163
  %div45 = sdiv i32 %shl43, %conv44, !dbg !163, !klee.check.div !106
  %add46 = add nsw i32 %23, %div45, !dbg !164
  store i32 %add46, i32* %s32Temp1, align 4, !dbg !165
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !166
  %cmp47 = icmp slt i32 %26, 32767, !dbg !168
  br i1 %cmp47, label %if.then49, label %if.else55, !dbg !169

if.then49:                                        ; preds = %if.then33
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !170
  %cmp50 = icmp sgt i32 %27, -32768, !dbg !173
  br i1 %cmp50, label %if.then52, label %if.else54, !dbg !174

if.then52:                                        ; preds = %if.then49
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !175
  %conv53 = trunc i32 %28 to i16, !dbg !177
  store i16 %conv53, i16* %retval, align 2, !dbg !178
  br label %return, !dbg !178

if.else54:                                        ; preds = %if.then49
  store i16 -32768, i16* %retval, align 2, !dbg !179
  br label %return, !dbg !179

if.else55:                                        ; preds = %if.then33
  store i16 32767, i16* %retval, align 2, !dbg !181
  br label %return, !dbg !181

if.else56:                                        ; preds = %if.else29
  store i16 32767, i16* %retval, align 2, !dbg !183
  br label %return, !dbg !183

return:                                           ; preds = %if.else56, %if.else55, %if.else54, %if.then52, %if.else28, %if.else27, %if.then25, %if.else, %if.then6
  %29 = load i16, i16* %retval, align 2, !dbg !185
  ret i16 %29, !dbg !185
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_s16(i32 %numerator, i16 signext %denominator) #0 !dbg !186 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !189, metadata !DIExpression()), !dbg !190
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !191, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !193, metadata !DIExpression()), !dbg !194
  store i32 0, i32* %s32Temp1, align 4, !dbg !194
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !195, metadata !DIExpression()), !dbg !196
  store i32 0, i32* %s32Temp2, align 4, !dbg !196
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !197
  store i32 %0, i32* %s32Temp1, align 4, !dbg !198
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !199
  %conv = sext i16 %1 to i32, !dbg !199
  %cmp = icmp eq i32 %conv, 0, !dbg !201
  br i1 %cmp, label %if.then, label %if.else5, !dbg !202

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !203
  %cmp2 = icmp slt i32 %2, 0, !dbg !206
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !207

if.then4:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !208
  br label %return, !dbg !208

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !210
  br label %return, !dbg !210

if.else5:                                         ; preds = %entry
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !212
  %cmp6 = icmp ne i32 %3, -2147483648, !dbg !215
  br i1 %cmp6, label %if.then8, label %if.else52, !dbg !216

if.then8:                                         ; preds = %if.else5
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !217
  %conv9 = sext i16 %4 to i64, !dbg !220
  %call = call i32 @klee_alarm_divisor_nonzero(i64 %conv9), !dbg !221
  %tobool = icmp ne i32 %call, 0, !dbg !221
  br i1 %tobool, label %if.end, label %if.then10, !dbg !222

if.then10:                                        ; preds = %if.then8
  store i16 0, i16* %retval, align 2, !dbg !223
  br label %return, !dbg !223

if.end:                                           ; preds = %if.then8
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !225
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !227
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !228
  %conv11 = sext i16 %7 to i32, !dbg !229
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !230
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !230
  %div = sdiv i32 %6, %conv11, !dbg !230, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !231
  %conv12 = sext i16 %8 to i32, !dbg !232
  %mul = mul nsw i32 %div, %conv12, !dbg !233
  %sub = sub nsw i32 %5, %mul, !dbg !234
  %conv13 = sext i32 %sub to i64, !dbg !235
  %call14 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv13, i32 1), !dbg !236
  %tobool15 = icmp ne i32 %call14, 0, !dbg !236
  br i1 %tobool15, label %if.end17, label %if.then16, !dbg !237

if.then16:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !238
  br label %return, !dbg !238

if.end17:                                         ; preds = %if.end
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !240
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !242
  %conv18 = sext i16 %10 to i32, !dbg !243
  %int_cast_to_i641 = zext i32 %conv18 to i64, !dbg !244
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !244
  %div19 = sdiv i32 %9, %conv18, !dbg !244, !klee.check.div !106
  %conv20 = sext i32 %div19 to i64, !dbg !245
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !246
  %conv21 = sext i16 %11 to i32, !dbg !247
  %conv22 = sext i32 %conv21 to i64, !dbg !248
  %call23 = call i32 @klee_alarm_s32_mul_upper(i64 %conv20, i64 %conv22), !dbg !249
  %tobool24 = icmp ne i32 %call23, 0, !dbg !249
  br i1 %tobool24, label %if.end26, label %if.then25, !dbg !250

if.then25:                                        ; preds = %if.end17
  store i16 0, i16* %retval, align 2, !dbg !251
  br label %return, !dbg !251

if.end26:                                         ; preds = %if.end17
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !253
  %13 = load i16, i16* %denominator.addr, align 2, !dbg !255
  %conv27 = sext i16 %13 to i32, !dbg !256
  %int_cast_to_i642 = zext i32 %conv27 to i64, !dbg !257
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !257
  %div28 = sdiv i32 %12, %conv27, !dbg !257, !klee.check.div !106
  %conv29 = sext i32 %div28 to i64, !dbg !258
  %14 = load i16, i16* %denominator.addr, align 2, !dbg !259
  %conv30 = sext i16 %14 to i32, !dbg !260
  %conv31 = sext i32 %conv30 to i64, !dbg !261
  %call32 = call i32 @klee_alarm_s32_mul_lower(i64 %conv29, i64 %conv31), !dbg !262
  %tobool33 = icmp ne i32 %call32, 0, !dbg !262
  br i1 %tobool33, label %if.end35, label %if.then34, !dbg !263

if.then34:                                        ; preds = %if.end26
  store i16 0, i16* %retval, align 2, !dbg !264
  br label %return, !dbg !264

if.end35:                                         ; preds = %if.end26
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !266
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !268
  %17 = load i16, i16* %denominator.addr, align 2, !dbg !269
  %conv36 = sext i16 %17 to i32, !dbg !270
  %int_cast_to_i643 = zext i32 %conv36 to i64, !dbg !271
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !271
  %div37 = sdiv i32 %16, %conv36, !dbg !271, !klee.check.div !106
  %18 = load i16, i16* %denominator.addr, align 2, !dbg !272
  %conv38 = sext i16 %18 to i32, !dbg !273
  %mul39 = mul nsw i32 %div37, %conv38, !dbg !274
  %sub40 = sub nsw i32 %15, %mul39, !dbg !275
  %conv41 = sext i32 %sub40 to i64, !dbg !276
  %call42 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv41), !dbg !277
  %tobool43 = icmp ne i32 %call42, 0, !dbg !277
  br i1 %tobool43, label %if.end45, label %if.then44, !dbg !278

if.then44:                                        ; preds = %if.end35
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 294, i8* getelementptr inbounds ([145 x i8], [145 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !279
  unreachable, !dbg !279

if.end45:                                         ; preds = %if.end35
  %19 = load i32, i32* %s32Temp1, align 4, !dbg !281
  %20 = load i32, i32* %s32Temp1, align 4, !dbg !282
  %21 = load i16, i16* %denominator.addr, align 2, !dbg !283
  %conv46 = sext i16 %21 to i32, !dbg !284
  %int_cast_to_i644 = zext i32 %conv46 to i64, !dbg !285
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !285
  %div47 = sdiv i32 %20, %conv46, !dbg !285, !klee.check.div !106
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !286
  %conv48 = sext i16 %22 to i32, !dbg !287
  %mul49 = mul nsw i32 %div47, %conv48, !dbg !288
  %sub50 = sub nsw i32 %19, %mul49, !dbg !289
  %shl = shl i32 %sub50, 1, !dbg !290
  %conv51 = sext i32 %shl to i64, !dbg !291
  store volatile i64 %conv51, i64* @klee_alarm_sink_s64, align 8, !dbg !292
  store i16 0, i16* %retval, align 2, !dbg !293
  br label %return, !dbg !293

if.else52:                                        ; preds = %if.else5
  %23 = load i16, i16* %denominator.addr, align 2, !dbg !294
  %conv53 = sext i16 %23 to i32, !dbg !294
  %cmp54 = icmp ne i32 %conv53, -1, !dbg !297
  br i1 %cmp54, label %if.then56, label %if.else76, !dbg !298

if.then56:                                        ; preds = %if.else52
  %24 = load i32, i32* %s32Temp1, align 4, !dbg !299
  %25 = load i32, i32* %s32Temp1, align 4, !dbg !301
  %26 = load i16, i16* %denominator.addr, align 2, !dbg !302
  %conv57 = sext i16 %26 to i32, !dbg !302
  %int_cast_to_i645 = zext i32 %conv57 to i64, !dbg !303
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !303
  %div58 = sdiv i32 %25, %conv57, !dbg !303, !klee.check.div !106
  %27 = load i16, i16* %denominator.addr, align 2, !dbg !304
  %conv59 = sext i16 %27 to i32, !dbg !304
  %mul60 = mul nsw i32 %div58, %conv59, !dbg !305
  %sub61 = sub nsw i32 %24, %mul60, !dbg !306
  %shl62 = shl i32 %sub61, 1, !dbg !307
  store i32 %shl62, i32* %s32Temp2, align 4, !dbg !308
  %28 = load i32, i32* %s32Temp2, align 4, !dbg !309
  %29 = load i16, i16* %denominator.addr, align 2, !dbg !310
  %conv63 = sext i16 %29 to i32, !dbg !310
  %int_cast_to_i646 = zext i32 %conv63 to i64, !dbg !311
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !311
  %div64 = sdiv i32 %28, %conv63, !dbg !311, !klee.check.div !106
  store i32 %div64, i32* %s32Temp1, align 4, !dbg !312
  %30 = load i32, i32* %s32Temp1, align 4, !dbg !313
  %31 = load i32, i32* %numerator.addr, align 4, !dbg !314
  %32 = load i16, i16* %denominator.addr, align 2, !dbg !315
  %conv65 = sext i16 %32 to i32, !dbg !315
  %int_cast_to_i647 = zext i32 %conv65 to i64, !dbg !316
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !316
  %div66 = sdiv i32 %31, %conv65, !dbg !316, !klee.check.div !106
  %add = add nsw i32 %30, %div66, !dbg !317
  store i32 %add, i32* %s32Temp1, align 4, !dbg !318
  %33 = load i32, i32* %s32Temp1, align 4, !dbg !319
  %cmp67 = icmp slt i32 %33, 32767, !dbg !321
  br i1 %cmp67, label %if.then69, label %if.else75, !dbg !322

if.then69:                                        ; preds = %if.then56
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !323
  %cmp70 = icmp sgt i32 %34, -32768, !dbg !326
  br i1 %cmp70, label %if.then72, label %if.else74, !dbg !327

if.then72:                                        ; preds = %if.then69
  %35 = load i32, i32* %s32Temp1, align 4, !dbg !328
  %conv73 = trunc i32 %35 to i16, !dbg !330
  store i16 %conv73, i16* %retval, align 2, !dbg !331
  br label %return, !dbg !331

if.else74:                                        ; preds = %if.then69
  store i16 -32768, i16* %retval, align 2, !dbg !332
  br label %return, !dbg !332

if.else75:                                        ; preds = %if.then56
  store i16 32767, i16* %retval, align 2, !dbg !334
  br label %return, !dbg !334

if.else76:                                        ; preds = %if.else52
  store i16 32767, i16* %retval, align 2, !dbg !336
  br label %return, !dbg !336

return:                                           ; preds = %if.else76, %if.else75, %if.else74, %if.then72, %if.end45, %if.then34, %if.then25, %if.then16, %if.then10, %if.else, %if.then4
  %36 = load i16, i16* %retval, align 2, !dbg !338
  ret i16 %36, !dbg !338
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !339 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !342, metadata !DIExpression()), !dbg !343
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !344
  %cmp = icmp ne i64 %0, 0, !dbg !345
  %conv = zext i1 %cmp to i32, !dbg !345
  ret i32 %conv, !dbg !346
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !347 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !350, metadata !DIExpression()), !dbg !351
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !352, metadata !DIExpression()), !dbg !353
  %0 = load i32, i32* %count.addr, align 4, !dbg !354
  %cmp = icmp uge i32 %0, 63, !dbg !356
  br i1 %cmp, label %if.then, label %if.end, !dbg !357

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !358
  br label %return, !dbg !358

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !360
  %2 = load i32, i32* %count.addr, align 4, !dbg !361
  %sh_prom = zext i32 %2 to i64, !dbg !362
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !362
  %shl = shl i64 1, %sh_prom, !dbg !362, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !363
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !364
  %conv = zext i1 %cmp1 to i32, !dbg !364
  store i32 %conv, i32* %retval, align 4, !dbg !365
  br label %return, !dbg !365

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !366
  ret i32 %3, !dbg !366
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !367 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !370, metadata !DIExpression()), !dbg !371
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !372, metadata !DIExpression()), !dbg !373
  %0 = load i64, i64* %left.addr, align 8, !dbg !374
  %1 = load i64, i64* %right.addr, align 8, !dbg !375
  %mul = mul nsw i64 %0, %1, !dbg !376
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !377
  %conv = zext i1 %cmp to i32, !dbg !377
  ret i32 %conv, !dbg !378
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !379 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !380, metadata !DIExpression()), !dbg !381
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !382, metadata !DIExpression()), !dbg !383
  %0 = load i64, i64* %left.addr, align 8, !dbg !384
  %1 = load i64, i64* %right.addr, align 8, !dbg !385
  %mul = mul nsw i64 %0, %1, !dbg !386
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !387
  %conv = zext i1 %cmp to i32, !dbg !387
  ret i32 %conv, !dbg !388
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !389 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !390, metadata !DIExpression()), !dbg !391
  %0 = load i64, i64* %left.addr, align 8, !dbg !392
  %cmp = icmp sge i64 %0, 0, !dbg !393
  %conv = zext i1 %cmp to i32, !dbg !393
  ret i32 %conv, !dbg !394
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !395 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !398, metadata !DIExpression()), !dbg !399
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !400, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !402, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !404, metadata !DIExpression()), !dbg !405
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !406, metadata !DIExpression()), !dbg !407
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !408
  %conv = zext i16 %0 to i32, !dbg !408
  %and = and i32 %conv, 65535, !dbg !409
  %conv1 = trunc i32 %and to i16, !dbg !408
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !410
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !411
  %conv2 = sext i16 %1 to i32, !dbg !411
  %shl = shl i32 %conv2, 16, !dbg !412
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !413
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !414
  %conv3 = zext i16 %2 to i32, !dbg !414
  %cmp = icmp eq i32 %conv3, 0, !dbg !416
  br i1 %cmp, label %if.then, label %if.else9, !dbg !417

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !418
  %conv5 = sext i16 %3 to i32, !dbg !418
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !421
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !422

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !423
  br label %return, !dbg !423

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !425
  br label %return, !dbg !425

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !427
  %conv10 = sext i16 %4 to i32, !dbg !427
  %shl11 = shl i32 %conv10, 16, !dbg !429
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !430
  %conv12 = sext i16 %5 to i32, !dbg !430
  %shl13 = shl i32 %conv12, 16, !dbg !431
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !432
  %conv14 = zext i16 %6 to i32, !dbg !432
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !433
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !433
  %div = sdiv i32 %shl13, %conv14, !dbg !433, !klee.check.div !106
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !434
  %conv15 = zext i16 %7 to i32, !dbg !434
  %mul = mul nsw i32 %div, %conv15, !dbg !435
  %sub = sub nsw i32 %shl11, %mul, !dbg !436
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !437
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !438
  %shl16 = shl i32 %8, 1, !dbg !439
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !440
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !441
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !442
  %conv17 = zext i16 %10 to i32, !dbg !442
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !443
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !443
  %div18 = sdiv i32 %9, %conv17, !dbg !443, !klee.check.div !106
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !444
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !445
  %conv19 = sext i16 %11 to i32, !dbg !445
  %shl20 = shl i32 %conv19, 16, !dbg !446
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !447
  %conv21 = zext i16 %12 to i32, !dbg !447
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !448
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !448
  %div22 = sdiv i32 %shl20, %conv21, !dbg !448, !klee.check.div !106
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !449
  %add = add nsw i32 %div22, %13, !dbg !450
  store i32 %add, i32* %s32Temp1, align 4, !dbg !451
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !452
  %cmp23 = icmp slt i32 %14, 32767, !dbg !454
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !455

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !456
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !459
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !460

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !461
  %conv29 = trunc i32 %16 to i16, !dbg !463
  store i16 %conv29, i16* %retval, align 2, !dbg !464
  br label %return, !dbg !464

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !465
  br label %return, !dbg !465

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !467
  br label %return, !dbg !467

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !469
  ret i16 %17, !dbg !469
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !470 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !471, metadata !DIExpression()), !dbg !472
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !473, metadata !DIExpression()), !dbg !474
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !475, metadata !DIExpression()), !dbg !476
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !477, metadata !DIExpression()), !dbg !478
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !479
  %conv = zext i16 %0 to i32, !dbg !479
  %and = and i32 %conv, 65535, !dbg !480
  %conv1 = trunc i32 %and to i16, !dbg !479
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !481
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !482
  %conv2 = zext i16 %1 to i32, !dbg !482
  %cmp = icmp eq i32 %conv2, 0, !dbg !484
  br i1 %cmp, label %if.then, label %if.else8, !dbg !485

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !486
  %conv4 = sext i16 %2 to i32, !dbg !486
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !489
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !490

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !491
  br label %return, !dbg !491

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !493
  br label %return, !dbg !493

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !495
  %conv9 = sext i16 %3 to i32, !dbg !495
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !497
  %conv10 = sext i16 %4 to i32, !dbg !497
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !498
  %conv11 = zext i16 %5 to i32, !dbg !498
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !499
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !499
  %div = sdiv i32 %conv10, %conv11, !dbg !499, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !500
  %conv12 = zext i16 %6 to i32, !dbg !500
  %mul = mul nsw i32 %div, %conv12, !dbg !501
  %sub = sub nsw i32 %conv9, %mul, !dbg !502
  %shl = shl i32 %sub, 1, !dbg !503
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !504
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !505
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !506
  %conv13 = zext i16 %8 to i32, !dbg !506
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !507
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !507
  %div14 = sdiv i32 %7, %conv13, !dbg !507, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !508
  %conv15 = sext i16 %9 to i32, !dbg !508
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !509
  %conv16 = zext i16 %10 to i32, !dbg !509
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !510
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !510
  %div17 = sdiv i32 %conv15, %conv16, !dbg !510, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !511
  store i32 %add, i32* %s32Temp1, align 4, !dbg !512
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !513
  %conv18 = trunc i32 %11 to i16, !dbg !513
  store i16 %conv18, i16* %retval, align 2, !dbg !514
  br label %return, !dbg !514

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !515
  ret i16 %12, !dbg !515
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !516 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !519, metadata !DIExpression()), !dbg !520
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !521, metadata !DIExpression()), !dbg !522
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !523, metadata !DIExpression()), !dbg !525
  store i32 0, i32* %u32Temp1, align 4, !dbg !525
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !526, metadata !DIExpression()), !dbg !527
  store i32 0, i32* %u32Temp2, align 4, !dbg !527
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !528, metadata !DIExpression()), !dbg !529
  store i32 0, i32* %u32Temp3, align 4, !dbg !529
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !530
  %conv = zext i16 %0 to i32, !dbg !530
  %cmp = icmp eq i32 %conv, 0, !dbg !532
  br i1 %cmp, label %if.then, label %if.else, !dbg !533

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !534
  br label %return, !dbg !534

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !536
  %conv2 = zext i16 %1 to i32, !dbg !536
  %shl = shl i32 %conv2, 16, !dbg !538
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !539
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !540
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !541
  %conv3 = zext i16 %3 to i32, !dbg !541
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !542
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !542
  %div = udiv i32 %2, %conv3, !dbg !542, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !543
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !544
  %add = add i32 %4, 128, !dbg !545
  %shr = lshr i32 %add, 8, !dbg !546
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !547
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !548
  %cmp4 = icmp ult i32 %5, 255, !dbg !550
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !551

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !552
  %conv7 = trunc i32 %6 to i8, !dbg !554
  store i8 %conv7, i8* %retval, align 1, !dbg !555
  br label %return, !dbg !555

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !556
  br label %return, !dbg !556

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !558
  ret i8 %7, !dbg !558
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !559 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !562, metadata !DIExpression()), !dbg !563
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !564, metadata !DIExpression()), !dbg !565
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !566, metadata !DIExpression()), !dbg !567
  store i32 0, i32* %s32Temp1, align 4, !dbg !567
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !568
  %conv = zext i16 %0 to i32, !dbg !568
  %and = and i32 %conv, 65535, !dbg !569
  %conv1 = trunc i32 %and to i16, !dbg !568
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !570
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !571
  %conv2 = zext i16 %1 to i32, !dbg !571
  %and3 = and i32 %conv2, 65535, !dbg !573
  %cmp = icmp eq i32 %and3, 0, !dbg !574
  br i1 %cmp, label %if.then, label %if.else8, !dbg !575

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !576
  %cmp5 = icmp sge i32 %2, 0, !dbg !579
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !580

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !581
  br label %return, !dbg !581

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !583
  br label %return, !dbg !583

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !585
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !587
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !588
  %conv9 = zext i16 %5 to i32, !dbg !588
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !589
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !589
  %div = sdiv i32 %4, %conv9, !dbg !589, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !590
  %conv10 = zext i16 %6 to i32, !dbg !590
  %mul = mul nsw i32 %div, %conv10, !dbg !591
  %sub = sub nsw i32 %3, %mul, !dbg !592
  %shl = shl i32 %sub, 1, !dbg !593
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !594
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !595
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !596
  %conv11 = zext i16 %8 to i32, !dbg !596
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !597
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !597
  %div12 = sdiv i32 %7, %conv11, !dbg !597, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !598
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !599
  %conv13 = zext i16 %10 to i32, !dbg !599
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !600
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !600
  %div14 = sdiv i32 %9, %conv13, !dbg !600, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !601
  store i32 %add, i32* %s32Temp1, align 4, !dbg !602
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !603
  %cmp15 = icmp slt i32 %11, 65535, !dbg !605
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !606

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !607
  %cmp18 = icmp sgt i32 %12, 0, !dbg !610
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !611

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !612
  %conv21 = trunc i32 %13 to i16, !dbg !614
  store i16 %conv21, i16* %retval, align 2, !dbg !615
  br label %return, !dbg !615

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !616
  br label %return, !dbg !616

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !618
  br label %return, !dbg !618

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !620
  ret i16 %14, !dbg !620
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !621 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !624, metadata !DIExpression()), !dbg !625
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !626, metadata !DIExpression()), !dbg !627
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !628, metadata !DIExpression()), !dbg !629
  store i32 0, i32* %u32Temp, align 4, !dbg !629
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !630
  %conv = zext i16 %0 to i32, !dbg !630
  %cmp = icmp eq i32 %conv, 0, !dbg !632
  br i1 %cmp, label %if.then, label %if.else, !dbg !633

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !634
  br label %return, !dbg !634

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !636
  %conv2 = zext i16 %1 to i32, !dbg !636
  %shl = shl i32 %conv2, 16, !dbg !638
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !639
  %conv3 = zext i16 %2 to i32, !dbg !639
  %shr = ashr i32 %conv3, 1, !dbg !640
  %add = add nsw i32 %shl, %shr, !dbg !641
  store i32 %add, i32* %u32Temp, align 4, !dbg !642
  %3 = load i32, i32* %u32Temp, align 4, !dbg !643
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !644
  %conv4 = zext i16 %4 to i32, !dbg !644
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !645
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !645
  %div = udiv i32 %3, %conv4, !dbg !645, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !646
  %5 = load i32, i32* %u32Temp, align 4, !dbg !647
  %cmp5 = icmp ult i32 %5, 65535, !dbg !649
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !650

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !651
  %and = and i32 %6, 65535, !dbg !653
  %conv8 = trunc i32 %and to i16, !dbg !651
  store i16 %conv8, i16* %retval, align 2, !dbg !654
  br label %return, !dbg !654

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !655
  br label %return, !dbg !655

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !657
  ret i16 %7, !dbg !657
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !658 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !661, metadata !DIExpression()), !dbg !662
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !663, metadata !DIExpression()), !dbg !664
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !665, metadata !DIExpression()), !dbg !666
  store i32 0, i32* %u32Temp1, align 4, !dbg !666
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !667, metadata !DIExpression()), !dbg !668
  store i32 0, i32* %u32Temp2, align 4, !dbg !668
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !669
  %conv = zext i16 %0 to i32, !dbg !669
  %and = and i32 %conv, 65535, !dbg !670
  %conv1 = trunc i32 %and to i16, !dbg !669
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !671
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !672
  %conv2 = zext i16 %1 to i32, !dbg !672
  %cmp = icmp eq i32 %conv2, 0, !dbg !674
  br i1 %cmp, label %if.then, label %if.else, !dbg !675

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !676
  br label %return, !dbg !676

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !678
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !680
  %conv4 = zext i16 %3 to i32, !dbg !680
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !681
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !681
  %div = udiv i32 %2, %conv4, !dbg !681, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !682
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !683
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !684
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !685
  %conv5 = zext i16 %6 to i32, !dbg !685
  %mul = mul i32 %5, %conv5, !dbg !686
  %sub = sub i32 %4, %mul, !dbg !687
  %shl = shl i32 %sub, 1, !dbg !688
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !689
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !690
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !691
  %conv6 = zext i16 %8 to i32, !dbg !691
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !692
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !692
  %div7 = udiv i32 %7, %conv6, !dbg !692, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !693
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !694
  %conv8 = zext i16 %10 to i32, !dbg !694
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !695
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !695
  %div9 = udiv i32 %9, %conv8, !dbg !695, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !696
  store i32 %add, i32* %u32Temp2, align 4, !dbg !697
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !698
  %cmp10 = icmp ult i32 %11, 65535, !dbg !700
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !701

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !702
  %and13 = and i32 %12, 65535, !dbg !704
  %conv14 = trunc i32 %and13 to i16, !dbg !702
  store i16 %conv14, i16* %retval, align 2, !dbg !705
  br label %return, !dbg !705

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !706
  br label %return, !dbg !706

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !708
  ret i16 %13, !dbg !708
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !709 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !712, metadata !DIExpression()), !dbg !713
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !714, metadata !DIExpression()), !dbg !715
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !716, metadata !DIExpression()), !dbg !717
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !718, metadata !DIExpression()), !dbg !719
  store i32 0, i32* %s32Result, align 4, !dbg !719
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !720, metadata !DIExpression()), !dbg !721
  store i32 0, i32* %s32Temp1, align 4, !dbg !721
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !722
  %conv = sext i16 %0 to i32, !dbg !722
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !723
  %conv1 = zext i16 %1 to i32, !dbg !723
  %mul = mul nsw i32 %conv, %conv1, !dbg !724
  store i32 %mul, i32* %s32Result, align 4, !dbg !725
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !726
  %conv2 = sext i16 %2 to i32, !dbg !726
  %cmp = icmp eq i32 %conv2, 0, !dbg !728
  br i1 %cmp, label %if.then, label %if.else7, !dbg !729

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !730
  %cmp4 = icmp slt i32 %3, 0, !dbg !733
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !734

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !735
  br label %return, !dbg !735

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !737
  br label %return, !dbg !737

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !739
  %5 = load i32, i32* %s32Result, align 4, !dbg !741
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !742
  %conv8 = sext i16 %6 to i32, !dbg !742
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !743
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !743
  %div = sdiv i32 %5, %conv8, !dbg !743, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !744
  %conv9 = sext i16 %7 to i32, !dbg !744
  %mul10 = mul nsw i32 %div, %conv9, !dbg !745
  %sub = sub nsw i32 %4, %mul10, !dbg !746
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !747
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !748
  %shl = shl i32 %8, 1, !dbg !749
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !750
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !751
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !752
  %conv11 = sext i16 %10 to i32, !dbg !752
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !753
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !753
  %div12 = sdiv i32 %9, %conv11, !dbg !753, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !754
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !755
  %conv13 = sext i16 %12 to i32, !dbg !755
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !756
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !756
  %div14 = sdiv i32 %11, %conv13, !dbg !756, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !757
  store i32 %add, i32* %s32Result, align 4, !dbg !758
  %13 = load i32, i32* %s32Result, align 4, !dbg !759
  %cmp15 = icmp slt i32 %13, 32767, !dbg !761
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !762

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !763
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !766
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !767

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !768
  %conv21 = trunc i32 %15 to i16, !dbg !770
  store i16 %conv21, i16* %retval, align 2, !dbg !771
  br label %return, !dbg !771

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !772
  br label %return, !dbg !772

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !774
  br label %return, !dbg !774

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !776
  ret i16 %16, !dbg !776
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !777 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !780, metadata !DIExpression()), !dbg !781
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !782, metadata !DIExpression()), !dbg !783
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !784, metadata !DIExpression()), !dbg !785
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !786, metadata !DIExpression()), !dbg !787
  store i32 0, i32* %s32Result, align 4, !dbg !787
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !788, metadata !DIExpression()), !dbg !789
  store i32 0, i32* %s32Temp1, align 4, !dbg !789
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !790
  %conv = zext i16 %0 to i32, !dbg !790
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !791
  %conv1 = sext i16 %1 to i32, !dbg !791
  %mul = mul nsw i32 %conv, %conv1, !dbg !792
  store i32 %mul, i32* %s32Result, align 4, !dbg !793
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !794
  %conv2 = zext i16 %2 to i32, !dbg !794
  %cmp = icmp eq i32 %conv2, 0, !dbg !796
  br i1 %cmp, label %if.then, label %if.else7, !dbg !797

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !798
  %cmp4 = icmp slt i32 %3, 0, !dbg !801
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !802

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !803
  br label %return, !dbg !803

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !805
  br label %return, !dbg !805

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !807
  %5 = load i32, i32* %s32Result, align 4, !dbg !809
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !810
  %conv8 = zext i16 %6 to i32, !dbg !810
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !811
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !811
  %div = sdiv i32 %5, %conv8, !dbg !811, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !812
  %conv9 = zext i16 %7 to i32, !dbg !812
  %mul10 = mul nsw i32 %div, %conv9, !dbg !813
  %sub = sub nsw i32 %4, %mul10, !dbg !814
  %shl = shl i32 %sub, 1, !dbg !815
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !816
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !817
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !818
  %conv11 = zext i16 %9 to i32, !dbg !818
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !819
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !819
  %div12 = sdiv i32 %8, %conv11, !dbg !819, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !820
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !821
  %conv13 = zext i16 %11 to i32, !dbg !821
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !822
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !822
  %div14 = sdiv i32 %10, %conv13, !dbg !822, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !823
  store i32 %add, i32* %s32Result, align 4, !dbg !824
  %12 = load i32, i32* %s32Result, align 4, !dbg !825
  %cmp15 = icmp slt i32 %12, 32767, !dbg !827
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !828

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !829
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !832
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !833

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !834
  %conv21 = trunc i32 %14 to i16, !dbg !836
  store i16 %conv21, i16* %retval, align 2, !dbg !837
  br label %return, !dbg !837

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !838
  br label %return, !dbg !838

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !840
  br label %return, !dbg !840

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !842
  ret i16 %15, !dbg !842
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !843 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !846, metadata !DIExpression()), !dbg !847
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !848, metadata !DIExpression()), !dbg !849
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !850, metadata !DIExpression()), !dbg !851
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !852, metadata !DIExpression()), !dbg !853
  store i32 0, i32* %u32Result, align 4, !dbg !853
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !854, metadata !DIExpression()), !dbg !855
  store i32 0, i32* %u32Temp1, align 4, !dbg !855
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !856, metadata !DIExpression()), !dbg !857
  store i32 0, i32* %s32Result, align 4, !dbg !857
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !858, metadata !DIExpression()), !dbg !859
  store i32 0, i32* %s32Temp1, align 4, !dbg !859
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !860
  %conv = sext i16 %0 to i32, !dbg !860
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !861
  %conv1 = zext i16 %1 to i32, !dbg !861
  %mul = mul nsw i32 %conv, %conv1, !dbg !862
  store i32 %mul, i32* %s32Result, align 4, !dbg !863
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !864
  %conv2 = sext i16 %2 to i32, !dbg !864
  %cmp = icmp eq i32 %conv2, 0, !dbg !866
  br i1 %cmp, label %if.then, label %if.else7, !dbg !867

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !868
  %cmp4 = icmp sge i32 %3, 0, !dbg !871
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !872

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !873
  br label %return, !dbg !873

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !875
  br label %return, !dbg !875

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !877
  %5 = load i32, i32* %s32Result, align 4, !dbg !879
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !880
  %conv8 = sext i16 %6 to i32, !dbg !880
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !881
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !881
  %div = sdiv i32 %5, %conv8, !dbg !881, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !882
  %conv9 = sext i16 %7 to i32, !dbg !882
  %mul10 = mul nsw i32 %div, %conv9, !dbg !883
  %sub = sub nsw i32 %4, %mul10, !dbg !884
  %shl = shl i32 %sub, 1, !dbg !885
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !886
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !887
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !888
  %conv11 = sext i16 %9 to i32, !dbg !888
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !889
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !889
  %div12 = sdiv i32 %8, %conv11, !dbg !889, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !890
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !891
  %conv13 = sext i16 %11 to i32, !dbg !891
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !892
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !892
  %div14 = sdiv i32 %10, %conv13, !dbg !892, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !893
  store i32 %add, i32* %s32Result, align 4, !dbg !894
  %12 = load i32, i32* %s32Result, align 4, !dbg !895
  %cmp15 = icmp slt i32 %12, 65535, !dbg !897
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !898

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !899
  %cmp18 = icmp sgt i32 %13, 0, !dbg !902
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !903

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !904
  %conv21 = trunc i32 %14 to i16, !dbg !906
  store i16 %conv21, i16* %retval, align 2, !dbg !907
  br label %return, !dbg !907

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !908
  br label %return, !dbg !908

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !910
  br label %return, !dbg !910

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !912
  ret i16 %15, !dbg !912
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !913 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !916, metadata !DIExpression()), !dbg !917
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !918, metadata !DIExpression()), !dbg !919
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !920, metadata !DIExpression()), !dbg !921
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !922, metadata !DIExpression()), !dbg !923
  store i32 0, i32* %s32Result, align 4, !dbg !923
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !924, metadata !DIExpression()), !dbg !925
  store i32 0, i32* %s32Temp1, align 4, !dbg !925
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !926
  %conv = sext i16 %0 to i32, !dbg !926
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !927
  %conv1 = zext i16 %1 to i32, !dbg !927
  %mul = mul nsw i32 %conv, %conv1, !dbg !928
  store i32 %mul, i32* %s32Result, align 4, !dbg !929
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !930
  %conv2 = zext i16 %2 to i32, !dbg !930
  %cmp = icmp eq i32 %conv2, 0, !dbg !932
  br i1 %cmp, label %if.then, label %if.else7, !dbg !933

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !934
  %cmp4 = icmp sge i32 %3, 0, !dbg !937
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !938

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !939
  br label %return, !dbg !939

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !941
  br label %return, !dbg !941

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !943
  %5 = load i32, i32* %s32Result, align 4, !dbg !945
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !946
  %conv8 = zext i16 %6 to i32, !dbg !946
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !947
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !947
  %div = sdiv i32 %5, %conv8, !dbg !947, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !948
  %conv9 = zext i16 %7 to i32, !dbg !948
  %mul10 = mul nsw i32 %div, %conv9, !dbg !949
  %sub = sub nsw i32 %4, %mul10, !dbg !950
  %shl = shl i32 %sub, 1, !dbg !951
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !952
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !953
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !954
  %conv11 = zext i16 %9 to i32, !dbg !954
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !955
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !955
  %div12 = sdiv i32 %8, %conv11, !dbg !955, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !956
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !957
  %conv13 = zext i16 %11 to i32, !dbg !957
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !958
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !958
  %div14 = sdiv i32 %10, %conv13, !dbg !958, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !959
  store i32 %add, i32* %s32Result, align 4, !dbg !960
  %12 = load i32, i32* %s32Result, align 4, !dbg !961
  %cmp15 = icmp slt i32 %12, 65535, !dbg !963
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !964

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !965
  %cmp18 = icmp sgt i32 %13, 0, !dbg !968
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !969

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !970
  %conv21 = trunc i32 %14 to i16, !dbg !972
  store i16 %conv21, i16* %retval, align 2, !dbg !973
  br label %return, !dbg !973

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !974
  br label %return, !dbg !974

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !976
  br label %return, !dbg !976

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !978
  ret i16 %15, !dbg !978
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !979 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !982, metadata !DIExpression()), !dbg !983
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !984, metadata !DIExpression()), !dbg !985
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !986, metadata !DIExpression()), !dbg !987
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !988, metadata !DIExpression()), !dbg !989
  store i32 0, i32* %u32Temp1, align 4, !dbg !989
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !990, metadata !DIExpression()), !dbg !991
  store i16 0, i16* %u16TempDenom, align 2, !dbg !991
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !992
  %conv = zext i16 %0 to i32, !dbg !992
  %cmp = icmp eq i32 %conv, 0, !dbg !994
  br i1 %cmp, label %if.then, label %if.else, !dbg !995

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !996
  br label %return, !dbg !996

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !998
  %conv2 = zext i16 %1 to i32, !dbg !998
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1000
  %conv3 = zext i16 %2 to i32, !dbg !1000
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1001
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1002
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1003
  %conv4 = zext i16 %3 to i32, !dbg !1003
  %shr = ashr i32 %conv4, 1, !dbg !1004
  %conv5 = trunc i32 %shr to i16, !dbg !1003
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1005
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1006
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1007
  %conv6 = zext i16 %5 to i32, !dbg !1007
  %add = add i32 %4, %conv6, !dbg !1008
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1009
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1010
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1011
  %conv7 = zext i16 %7 to i32, !dbg !1011
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1012
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1012
  %div = udiv i32 %6, %conv7, !dbg !1012, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1013
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1014
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1016
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1017

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1018
  %and = and i32 %9, 65535, !dbg !1020
  %conv11 = trunc i32 %and to i16, !dbg !1021
  store i16 %conv11, i16* %retval, align 2, !dbg !1022
  br label %return, !dbg !1022

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1023
  br label %return, !dbg !1023

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1025
  ret i16 %10, !dbg !1025
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1026 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1029, metadata !DIExpression()), !dbg !1030
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1031, metadata !DIExpression()), !dbg !1032
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1033, metadata !DIExpression()), !dbg !1034
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1035, metadata !DIExpression()), !dbg !1036
  store i32 0, i32* %u32Temp1, align 4, !dbg !1036
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1037
  %cmp = icmp eq i32 %0, 0, !dbg !1039
  br i1 %cmp, label %if.then, label %if.else, !dbg !1040

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1041
  br label %return, !dbg !1041

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1043
  %conv = zext i16 %1 to i32, !dbg !1043
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1045
  %conv1 = zext i16 %2 to i32, !dbg !1045
  %mul = mul nsw i32 %conv, %conv1, !dbg !1046
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1047
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1048
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1048
  %div = udiv i32 %mul, %3, !dbg !1048, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1049
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1050
  %conv2 = zext i16 %4 to i32, !dbg !1050
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1052
  %conv3 = zext i16 %5 to i32, !dbg !1052
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1053
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1054
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1055
  %mul5 = mul i32 %6, %7, !dbg !1056
  %sub = sub i32 %mul4, %mul5, !dbg !1057
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1058
  %div6 = udiv i32 %8, 2, !dbg !1059
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1060
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1061

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1062
  %inc = add i32 %9, 1, !dbg !1062
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1062
  br label %if.end, !dbg !1064

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1065
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1067
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1068

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1069
  %and = and i32 %11, 65535, !dbg !1071
  %conv13 = trunc i32 %and to i16, !dbg !1072
  store i16 %conv13, i16* %retval, align 2, !dbg !1073
  br label %return, !dbg !1073

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1074
  br label %return, !dbg !1074

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1076
  ret i16 %12, !dbg !1076
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1077 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1080, metadata !DIExpression()), !dbg !1081
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1082, metadata !DIExpression()), !dbg !1083
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1084, metadata !DIExpression()), !dbg !1085
  store i32 0, i32* %u32Temp1, align 4, !dbg !1085
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1086
  %conv = zext i16 %0 to i32, !dbg !1086
  %cmp = icmp eq i32 %conv, 0, !dbg !1088
  br i1 %cmp, label %if.then, label %if.else, !dbg !1089

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1090
  br label %return, !dbg !1090

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1092
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1094
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1095
  %conv2 = zext i16 %3 to i32, !dbg !1095
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1096
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1096
  %div = udiv i32 %2, %conv2, !dbg !1096, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1097
  %conv3 = zext i16 %4 to i32, !dbg !1097
  %mul = mul i32 %div, %conv3, !dbg !1098
  %sub = sub i32 %1, %mul, !dbg !1099
  %shl = shl i32 %sub, 1, !dbg !1100
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1101
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1102
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1103
  %conv4 = zext i16 %6 to i32, !dbg !1103
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1104
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1104
  %div5 = udiv i32 %5, %conv4, !dbg !1104, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1105
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1106
  %conv6 = zext i16 %8 to i32, !dbg !1106
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1107
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1107
  %div7 = udiv i32 %7, %conv6, !dbg !1107, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1108
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1109
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1110
  store i32 %9, i32* %retval, align 4, !dbg !1111
  br label %return, !dbg !1111

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1112
  ret i32 %10, !dbg !1112
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1113 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1116, metadata !DIExpression()), !dbg !1117
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1118, metadata !DIExpression()), !dbg !1119
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1120, metadata !DIExpression()), !dbg !1121
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1122, metadata !DIExpression()), !dbg !1123
  store i32 0, i32* %s32Temp1, align 4, !dbg !1123
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1124, metadata !DIExpression()), !dbg !1125
  store i32 0, i32* %s32Temp2, align 4, !dbg !1125
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1126, metadata !DIExpression()), !dbg !1127
  store i32 0, i32* %s32Temp3, align 4, !dbg !1127
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1128
  %conv = sext i16 %0 to i32, !dbg !1128
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1129
  %conv1 = sext i16 %1 to i32, !dbg !1129
  %mul = mul nsw i32 %conv, %conv1, !dbg !1130
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1131
  %2 = load i16, i16* %div.addr, align 2, !dbg !1132
  %conv2 = sext i16 %2 to i32, !dbg !1132
  %cmp = icmp eq i32 %conv2, 0, !dbg !1134
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1135

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1136
  %cmp4 = icmp slt i32 %3, 0, !dbg !1139
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1140

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1141
  br label %return, !dbg !1141

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1143
  br label %return, !dbg !1143

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1145
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1147
  %6 = load i16, i16* %div.addr, align 2, !dbg !1148
  %conv8 = sext i16 %6 to i32, !dbg !1148
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1149
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1149
  %div9 = sdiv i32 %5, %conv8, !dbg !1149, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1150
  %conv10 = sext i16 %7 to i32, !dbg !1150
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1151
  %sub = sub nsw i32 %4, %mul11, !dbg !1152
  %shl = shl i32 %sub, 1, !dbg !1153
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1154
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1155
  %9 = load i16, i16* %div.addr, align 2, !dbg !1156
  %conv12 = sext i16 %9 to i32, !dbg !1156
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1157
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1157
  %div13 = sdiv i32 %8, %conv12, !dbg !1157, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1158
  %11 = load i16, i16* %div.addr, align 2, !dbg !1159
  %conv14 = sext i16 %11 to i32, !dbg !1159
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1160
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1160
  %div15 = sdiv i32 %10, %conv14, !dbg !1160, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1161
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1162
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1163
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1165
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1166

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1167
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1170
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1171

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1172
  %conv22 = trunc i32 %14 to i16, !dbg !1174
  store i16 %conv22, i16* %retval, align 2, !dbg !1175
  br label %return, !dbg !1175

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1176
  br label %return, !dbg !1176

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1178
  br label %return, !dbg !1178

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1180
  ret i16 %15, !dbg !1180
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1181 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1184, metadata !DIExpression()), !dbg !1185
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1186, metadata !DIExpression()), !dbg !1187
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1188, metadata !DIExpression()), !dbg !1189
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1190, metadata !DIExpression()), !dbg !1191
  store i32 0, i32* %s32Result, align 4, !dbg !1191
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1192, metadata !DIExpression()), !dbg !1193
  store i32 0, i32* %s32Temp1, align 4, !dbg !1193
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1194
  %conv = sext i16 %0 to i32, !dbg !1194
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1195
  %conv1 = sext i16 %1 to i32, !dbg !1195
  %mul = mul nsw i32 %conv, %conv1, !dbg !1196
  store i32 %mul, i32* %s32Result, align 4, !dbg !1197
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1198
  %conv2 = zext i16 %2 to i32, !dbg !1198
  %cmp = icmp eq i32 %conv2, 0, !dbg !1200
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1201

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1202
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1205
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1206

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1207
  br label %return, !dbg !1207

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1209
  %cmp7 = icmp eq i32 %4, 0, !dbg !1211
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1212

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1213
  br label %return, !dbg !1213

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1215
  br label %return, !dbg !1215

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1217
  %6 = load i32, i32* %s32Result, align 4, !dbg !1219
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1220
  %conv12 = zext i16 %7 to i32, !dbg !1220
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1221
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1221
  %div = sdiv i32 %6, %conv12, !dbg !1221, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1222
  %conv13 = zext i16 %8 to i32, !dbg !1222
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1223
  %sub = sub nsw i32 %5, %mul14, !dbg !1224
  %shl = shl i32 %sub, 1, !dbg !1225
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1226
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1227
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1228
  %conv15 = zext i16 %10 to i32, !dbg !1228
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1229
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1229
  %div16 = sdiv i32 %9, %conv15, !dbg !1229, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1230
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1231
  %conv17 = zext i16 %12 to i32, !dbg !1231
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1232
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1232
  %div18 = sdiv i32 %11, %conv17, !dbg !1232, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1233
  store i32 %add, i32* %s32Result, align 4, !dbg !1234
  %13 = load i32, i32* %s32Result, align 4, !dbg !1235
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1237
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1238

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1239
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1242
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1243

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1244
  %conv25 = trunc i32 %15 to i16, !dbg !1246
  store i16 %conv25, i16* %retval, align 2, !dbg !1247
  br label %return, !dbg !1247

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1248
  br label %return, !dbg !1248

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1250
  br label %return, !dbg !1250

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1252
  ret i16 %16, !dbg !1252
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1253 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1256, metadata !DIExpression()), !dbg !1257
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1258, metadata !DIExpression()), !dbg !1259
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1260, metadata !DIExpression()), !dbg !1261
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1262
  %cmp = icmp eq i32 %0, 0, !dbg !1264
  br i1 %cmp, label %if.then, label %if.else, !dbg !1265

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1266
  br label %return, !dbg !1266

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1268
  %cmp1 = icmp sle i32 %1, 0, !dbg !1271
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1272

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1273
  br label %return, !dbg !1273

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1275
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1277
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1278
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1279
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1279
  %div = udiv i32 %3, %4, !dbg !1279, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1280
  %mul = mul i32 %div, %5, !dbg !1281
  %sub = sub i32 %2, %mul, !dbg !1282
  %shl = shl i32 %sub, 1, !dbg !1283
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1284
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1285
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1286
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1287
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1287
  %div4 = udiv i32 %6, %7, !dbg !1287, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1288
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1289
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1290
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1290
  %div5 = udiv i32 %8, %9, !dbg !1290, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1291
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1292
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1293
  store i32 %10, i32* %retval, align 4, !dbg !1294
  br label %return, !dbg !1294

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1295
  ret i32 %11, !dbg !1295
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1296 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1299, metadata !DIExpression()), !dbg !1300
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1301, metadata !DIExpression()), !dbg !1302
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1303, metadata !DIExpression()), !dbg !1304
  store i32 0, i32* %s32Temp1, align 4, !dbg !1304
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1305
  %cmp = icmp eq i32 %0, 0, !dbg !1307
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1308

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1309
  %cmp1 = icmp sge i32 %1, 0, !dbg !1312
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1313

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1314
  br label %return, !dbg !1314

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1316
  br label %return, !dbg !1316

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1318
  %cmp4 = icmp sge i32 %2, 0, !dbg !1321
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1322

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1323
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1325
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1326
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1327
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1327
  %div = udiv i32 %4, %5, !dbg !1327, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1328
  %mul = mul i32 %div, %6, !dbg !1329
  %sub = sub i32 %3, %mul, !dbg !1330
  %shl = shl i32 %sub, 1, !dbg !1331
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1332
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1333
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1334
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1335
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1335
  %div6 = udiv i32 %7, %8, !dbg !1335, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1336
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1337
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1338
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1338
  %div7 = udiv i32 %9, %10, !dbg !1338, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1339
  store i32 %add, i32* %retval, align 4, !dbg !1340
  br label %return, !dbg !1340

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1341
  br label %return, !dbg !1341

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1343
  ret i32 %11, !dbg !1343
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1344 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1347, metadata !DIExpression()), !dbg !1348
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1349, metadata !DIExpression()), !dbg !1350
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1351, metadata !DIExpression()), !dbg !1352
  store i32 0, i32* %u32Temp1, align 4, !dbg !1352
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1353, metadata !DIExpression()), !dbg !1354
  store i32 0, i32* %u32Temp2, align 4, !dbg !1354
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1355
  %cmp = icmp eq i32 %0, 0, !dbg !1357
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1358

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1359
  %cmp1 = icmp slt i32 %1, 0, !dbg !1362
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1363

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1364
  br label %return, !dbg !1364

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1366
  br label %return, !dbg !1366

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1368
  %cmp4 = icmp sge i32 %2, 0, !dbg !1371
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1372

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1373
  %cmp6 = icmp eq i32 %3, 0, !dbg !1376
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1377

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1378
  br label %return, !dbg !1378

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1380
  %cmp9 = icmp sle i32 %4, 0, !dbg !1383
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1384

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1385
  br label %return, !dbg !1385

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1387
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1389
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1390
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1391
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1391
  %div = sdiv i32 %6, %7, !dbg !1391, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1392
  %mul = mul nsw i32 %div, %8, !dbg !1393
  %sub = sub nsw i32 %5, %mul, !dbg !1394
  %shl = shl i32 %sub, 1, !dbg !1395
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1396
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1397
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1398
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1399
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1399
  %div12 = udiv i32 %9, %10, !dbg !1399, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1400
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1401
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1402
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1402
  %div13 = sdiv i32 %11, %12, !dbg !1402, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1403
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1404
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1405
  store i32 %13, i32* %retval, align 4, !dbg !1406
  br label %return, !dbg !1406

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1407
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1410
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1411

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1412
  br label %return, !dbg !1412

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1414
  %sub18 = sub nsw i32 0, %15, !dbg !1416
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1417
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1418
  %sub19 = sub nsw i32 0, %16, !dbg !1419
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1420
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1421
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1422
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1423
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1424
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1424
  %div20 = sdiv i32 %18, %19, !dbg !1424, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1425
  %mul21 = mul nsw i32 %div20, %20, !dbg !1426
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1427
  %shl23 = shl i32 %sub22, 1, !dbg !1428
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1429
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1430
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1431
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1432
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1432
  %div24 = udiv i32 %21, %22, !dbg !1432, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1433
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1434
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1435
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1435
  %div25 = sdiv i32 %23, %24, !dbg !1435, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1436
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1437
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1438
  store i32 %25, i32* %retval, align 4, !dbg !1439
  br label %return, !dbg !1439

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1440
  ret i32 %26, !dbg !1440
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1441 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1444, metadata !DIExpression()), !dbg !1445
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1446, metadata !DIExpression()), !dbg !1447
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1448, metadata !DIExpression()), !dbg !1449
  store i32 0, i32* %u32Temp1, align 4, !dbg !1449
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1450, metadata !DIExpression()), !dbg !1451
  store i32 0, i32* %u32Temp2, align 4, !dbg !1451
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1452, metadata !DIExpression()), !dbg !1453
  store i32 0, i32* %u32Temp3, align 4, !dbg !1453
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1454, metadata !DIExpression()), !dbg !1455
  store i32 0, i32* %numerator_old, align 4, !dbg !1455
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1456
  %cmp = icmp eq i32 %0, 0, !dbg !1458
  br i1 %cmp, label %if.then, label %if.else, !dbg !1459

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1460
  br label %return, !dbg !1460

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1462
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1464
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1465
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1466
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1467
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1467
  %div = udiv i32 %3, %4, !dbg !1467, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1468
  %sub = sub i32 %1, %mul, !dbg !1469
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1470
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1471
  %and = and i32 %5, 1, !dbg !1473
  %cmp1 = icmp eq i32 %and, 0, !dbg !1474
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1475

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1476
  %shr = lshr i32 %6, 1, !dbg !1478
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1479
  br label %if.end, !dbg !1480

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1481
  %shr4 = lshr i32 %7, 1, !dbg !1483
  %add = add i32 %shr4, 1, !dbg !1484
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1485
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1486
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1488
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1489
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1490

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1491
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1493
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1494
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1494
  %div7 = udiv i32 %10, %11, !dbg !1494, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1495
  br label %return, !dbg !1495

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1496
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1498
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1499
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1499
  %div9 = udiv i32 %12, %13, !dbg !1499, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1500
  store i32 %add10, i32* %retval, align 4, !dbg !1501
  br label %return, !dbg !1501

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1502
  ret i32 %14, !dbg !1502
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1503 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1506, metadata !DIExpression()), !dbg !1507
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1508, metadata !DIExpression()), !dbg !1509
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1510, metadata !DIExpression()), !dbg !1511
  store i32 0, i32* %u32Temp1, align 4, !dbg !1511
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1512, metadata !DIExpression()), !dbg !1513
  store i32 0, i32* %u32Temp2, align 4, !dbg !1513
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1514
  %cmp = icmp sle i32 %0, 0, !dbg !1516
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1517

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1518
  %cmp1 = icmp sge i32 %1, 0, !dbg !1521
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1522

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1523
  br label %return, !dbg !1523

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1525
  %sub = sub nsw i32 0, %2, !dbg !1527
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1528
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1529
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1530
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1531
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1532
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1532
  %div = udiv i32 %4, %5, !dbg !1532, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1533
  %mul = mul i32 %div, %6, !dbg !1534
  %sub3 = sub i32 %3, %mul, !dbg !1535
  %shl = shl i32 %sub3, 1, !dbg !1536
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1537
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1538
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1539
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1540
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1540
  %div4 = udiv i32 %7, %8, !dbg !1540, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1541
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1542
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1543
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1543
  %div5 = udiv i32 %9, %10, !dbg !1543, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1544
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1545
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1546
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1548
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1549

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1550
  %sub8 = sub i32 0, %12, !dbg !1552
  store i32 %sub8, i32* %retval, align 4, !dbg !1553
  br label %return, !dbg !1553

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1554
  br label %return, !dbg !1554

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1556
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1558
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1559
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1560
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1560
  %div11 = udiv i32 %14, %15, !dbg !1560, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1561
  %mul12 = mul i32 %div11, %16, !dbg !1562
  %sub13 = sub i32 %13, %mul12, !dbg !1563
  %shl14 = shl i32 %sub13, 1, !dbg !1564
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1565
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1566
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1567
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1568
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1568
  %div15 = udiv i32 %17, %18, !dbg !1568, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1569
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1570
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1571
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1571
  %div16 = udiv i32 %19, %20, !dbg !1571, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1572
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1573
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1574
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1576
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1577

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1578
  store i32 %22, i32* %retval, align 4, !dbg !1580
  br label %return, !dbg !1580

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1581
  br label %return, !dbg !1581

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1583
  ret i32 %23, !dbg !1583
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1584 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1587, metadata !DIExpression()), !dbg !1588
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1589, metadata !DIExpression()), !dbg !1590
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1591, metadata !DIExpression()), !dbg !1592
  store i32 0, i32* %s32Temp1, align 4, !dbg !1592
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1593, metadata !DIExpression()), !dbg !1594
  store i32 0, i32* %s32Temp2, align 4, !dbg !1594
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1595, metadata !DIExpression()), !dbg !1596
  store i32 0, i32* %u32Temp0, align 4, !dbg !1596
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1597, metadata !DIExpression()), !dbg !1598
  store i32 0, i32* %u32Temp1, align 4, !dbg !1598
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1599, metadata !DIExpression()), !dbg !1600
  store i32 0, i32* %u32Temp2, align 4, !dbg !1600
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1601
  %cmp = icmp eq i32 %0, 0, !dbg !1603
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1604

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1605
  %cmp1 = icmp slt i32 %1, 0, !dbg !1608
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1609

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1610
  br label %return, !dbg !1610

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1612
  br label %return, !dbg !1612

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1614
  %cmp4 = icmp sle i32 %2, 0, !dbg !1617
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1618

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1619
  %sub = sub nsw i32 0, %3, !dbg !1621
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1622
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1623
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1624
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1625
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1625
  %div = udiv i32 %4, %5, !dbg !1625, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1626
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1627
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1628
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1629
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1630
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1630
  %div6 = udiv i32 %7, %8, !dbg !1630, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1631
  %mul = mul i32 %div6, %9, !dbg !1632
  %sub7 = sub i32 %6, %mul, !dbg !1633
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1634
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1635
  %and = and i32 %10, 1, !dbg !1637
  %cmp8 = icmp eq i32 %and, 0, !dbg !1638
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1639

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1640
  %shr = lshr i32 %11, 1, !dbg !1642
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1643
  br label %if.end, !dbg !1644

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1645
  %shr11 = lshr i32 %12, 1, !dbg !1647
  %add = add i32 %shr11, 1, !dbg !1648
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1649
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1650
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1652
  %cmp12 = icmp ult i32 %13, %14, !dbg !1653
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1654

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1655
  %neg = xor i32 %15, -1, !dbg !1657
  %add14 = add i32 %neg, 1, !dbg !1658
  store i32 %add14, i32* %retval, align 4, !dbg !1659
  br label %return, !dbg !1659

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1660
  %add16 = add i32 %16, 1, !dbg !1662
  %neg17 = xor i32 %add16, -1, !dbg !1663
  %add18 = add i32 %neg17, 1, !dbg !1664
  store i32 %add18, i32* %retval, align 4, !dbg !1665
  br label %return, !dbg !1665

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1666
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1668
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1669
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1670
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1670
  %div20 = udiv i32 %18, %19, !dbg !1670, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1671
  %mul21 = mul i32 %div20, %20, !dbg !1672
  %sub22 = sub i32 %17, %mul21, !dbg !1673
  %shl = shl i32 %sub22, 1, !dbg !1674
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1675
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1676
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1677
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1678
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1678
  %div23 = udiv i32 %21, %22, !dbg !1678, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1679
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1680
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1681
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1681
  %div24 = udiv i32 %23, %24, !dbg !1681, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1682
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1683
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1684
  store i32 %25, i32* %retval, align 4, !dbg !1685
  br label %return, !dbg !1685

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1686
  ret i32 %26, !dbg !1686
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1687 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1690, metadata !DIExpression()), !dbg !1691
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1692, metadata !DIExpression()), !dbg !1693
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1694, metadata !DIExpression()), !dbg !1695
  store i32 0, i32* %s32Temp1, align 4, !dbg !1695
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1696, metadata !DIExpression()), !dbg !1697
  store i32 0, i32* %s32Temp2, align 4, !dbg !1697
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1698, metadata !DIExpression()), !dbg !1699
  store i32 0, i32* %denominator_prime, align 4, !dbg !1699
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1700, metadata !DIExpression()), !dbg !1701
  store i32 0, i32* %u32Temp1, align 4, !dbg !1701
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1702, metadata !DIExpression()), !dbg !1703
  store i32 0, i32* %u32Temp2, align 4, !dbg !1703
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1704, metadata !DIExpression()), !dbg !1705
  store i32 0, i32* %u32numerator, align 4, !dbg !1705
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1706, metadata !DIExpression()), !dbg !1707
  store i32 0, i32* %u32denominator, align 4, !dbg !1707
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1708
  %cmp = icmp slt i32 %0, 0, !dbg !1710
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1711

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1712
  %cmp1 = icmp sle i32 %1, 0, !dbg !1715
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1716

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1717
  %cmp3 = icmp sge i32 %2, 0, !dbg !1720
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1721

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1722
  br label %return, !dbg !1722

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1724
  %sub = sub nsw i32 0, %3, !dbg !1726
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1727
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1728
  %sub5 = sub nsw i32 0, %4, !dbg !1729
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1730
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1731
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1732
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1733
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1734
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1734
  %div = udiv i32 %6, %7, !dbg !1734, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1735
  %mul = mul i32 %div, %8, !dbg !1736
  %sub6 = sub i32 %5, %mul, !dbg !1737
  %shl = shl i32 %sub6, 1, !dbg !1738
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1739
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1740
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1741
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1742
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1742
  %div7 = udiv i32 %9, %10, !dbg !1742, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1743
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1744
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1745
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1745
  %div8 = udiv i32 %11, %12, !dbg !1745, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1746
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1747
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1748
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1750
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1751

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1752
  store i32 %14, i32* %retval, align 4, !dbg !1754
  br label %return, !dbg !1754

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1755
  br label %return, !dbg !1755

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1757
  %neg = xor i32 %15, -1, !dbg !1759
  %add13 = add nsw i32 %neg, 1, !dbg !1760
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1761
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1762
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1763
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1764
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1765
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1765
  %div14 = udiv i32 %17, %18, !dbg !1765, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1766
  %mul15 = mul i32 %div14, %19, !dbg !1767
  %sub16 = sub i32 %16, %mul15, !dbg !1768
  %shl17 = shl i32 %sub16, 1, !dbg !1769
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1770
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1771
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1772
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1773
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1773
  %div18 = udiv i32 %20, %21, !dbg !1773, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1774
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1775
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1776
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1776
  %div19 = sdiv i32 %22, %23, !dbg !1776, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1777
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1778
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1779
  %neg21 = xor i32 %24, -1, !dbg !1780
  %add22 = add nsw i32 %neg21, 1, !dbg !1781
  store i32 %add22, i32* %retval, align 4, !dbg !1782
  br label %return, !dbg !1782

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1783
  %cmp24 = icmp sle i32 %25, 0, !dbg !1786
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1787

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1788
  %cmp26 = icmp sge i32 %26, 0, !dbg !1791
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1792

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1793
  br label %return, !dbg !1793

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1795
  %neg29 = xor i32 %27, -1, !dbg !1797
  %add30 = add nsw i32 %neg29, 1, !dbg !1798
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1799
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1800
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1801
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1802
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1803
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1803
  %div31 = udiv i32 %29, %30, !dbg !1803, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1804
  %mul32 = mul i32 %div31, %31, !dbg !1805
  %sub33 = sub i32 %28, %mul32, !dbg !1806
  %shl34 = shl i32 %sub33, 1, !dbg !1807
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1808
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1809
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1810
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1811
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1811
  %div35 = udiv i32 %32, %33, !dbg !1811, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1812
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1813
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1814
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1814
  %div36 = udiv i32 %34, %35, !dbg !1814, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1815
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1816
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1817
  %neg38 = xor i32 %36, -1, !dbg !1818
  %add39 = add nsw i32 %neg38, 1, !dbg !1819
  store i32 %add39, i32* %retval, align 4, !dbg !1820
  br label %return, !dbg !1820

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1821
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1823
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1824
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1825
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1825
  %div41 = sdiv i32 %38, %39, !dbg !1825, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1826
  %mul42 = mul nsw i32 %div41, %40, !dbg !1827
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1828
  %shl44 = shl i32 %sub43, 1, !dbg !1829
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1830
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1831
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1832
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1833
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1833
  %div45 = sdiv i32 %41, %42, !dbg !1833, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1834
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1835
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1836
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1836
  %div46 = udiv i32 %43, %44, !dbg !1836, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1837
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1838
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1839
  store i32 %45, i32* %retval, align 4, !dbg !1840
  br label %return, !dbg !1840

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1841
  ret i32 %46, !dbg !1841
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1842 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1845, metadata !DIExpression()), !dbg !1846
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1847, metadata !DIExpression()), !dbg !1848
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1849, metadata !DIExpression()), !dbg !1850
  store i32 0, i32* %numerator_prime, align 4, !dbg !1850
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1851, metadata !DIExpression()), !dbg !1852
  store i32 0, i32* %u32Temp1, align 4, !dbg !1852
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1853, metadata !DIExpression()), !dbg !1854
  store i32 0, i32* %u32Temp2, align 4, !dbg !1854
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1855, metadata !DIExpression()), !dbg !1856
  store i32 0, i32* %u32Temp3, align 4, !dbg !1856
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1857, metadata !DIExpression()), !dbg !1858
  store i32 0, i32* %s32Temp1, align 4, !dbg !1858
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1859, metadata !DIExpression()), !dbg !1860
  store i32 0, i32* %s32Temp2, align 4, !dbg !1860
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1861, metadata !DIExpression()), !dbg !1862
  store i32 0, i32* %s32Temp3, align 4, !dbg !1862
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1863
  %cmp = icmp eq i32 %0, 0, !dbg !1865
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1866

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1867
  %cmp1 = icmp slt i32 %1, 0, !dbg !1870
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1871

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1872
  br label %return, !dbg !1872

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1874
  br label %return, !dbg !1874

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1876
  %cmp4 = icmp slt i32 %2, 0, !dbg !1879
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1880

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1881
  %sub = sub nsw i32 0, %3, !dbg !1883
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1884
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1885
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1886
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1887
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1887
  %div = udiv i32 %4, %5, !dbg !1887, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1888
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1889
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1890
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1891
  %mul = mul i32 %7, %8, !dbg !1892
  %sub6 = sub i32 %6, %mul, !dbg !1893
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1894
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1895
  %and = and i32 %9, 1, !dbg !1897
  %cmp7 = icmp eq i32 %and, 0, !dbg !1898
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1899

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1900
  %shr = lshr i32 %10, 1, !dbg !1902
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1903
  br label %if.end, !dbg !1904

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1905
  %shr10 = lshr i32 %11, 1, !dbg !1907
  %add = add i32 %shr10, 1, !dbg !1908
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1909
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1910
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1912
  %cmp11 = icmp ult i32 %12, %13, !dbg !1913
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1914

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1915
  %neg = xor i32 %14, -1, !dbg !1917
  %add13 = add i32 %neg, 1, !dbg !1918
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1919
  br label %if.end18, !dbg !1920

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1921
  %add15 = add i32 %15, 1, !dbg !1923
  %neg16 = xor i32 %add15, -1, !dbg !1924
  %add17 = add i32 %neg16, 1, !dbg !1925
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1926
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1927
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1929
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1930

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1931
  %conv = trunc i32 %17 to i16, !dbg !1933
  store i16 %conv, i16* %retval, align 2, !dbg !1934
  br label %return, !dbg !1934

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1935
  br label %return, !dbg !1935

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1937
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1939
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1940
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1940
  %div23 = udiv i32 %18, %19, !dbg !1940, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1941
  %mul24 = mul i32 %div23, %20, !dbg !1942
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1943
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1944
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1945
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1946
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1947
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1947
  %div25 = udiv i32 %22, %23, !dbg !1947, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1948
  %mul26 = mul i32 %div25, %24, !dbg !1949
  %sub27 = sub i32 %21, %mul26, !dbg !1950
  %shl = shl i32 %sub27, 1, !dbg !1951
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1952
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1953
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1954
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1955
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1955
  %div28 = udiv i32 %25, %26, !dbg !1955, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1956
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1957
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1958
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1958
  %div29 = udiv i32 %27, %28, !dbg !1958, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !1959
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1960
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1961
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1963
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1964

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1965
  %conv34 = trunc i32 %30 to i16, !dbg !1967
  store i16 %conv34, i16* %retval, align 2, !dbg !1968
  br label %return, !dbg !1968

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1969
  br label %return, !dbg !1969

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1971
  ret i16 %31, !dbg !1971
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1972 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1978, metadata !DIExpression()), !dbg !1979
  %2 = icmp eq i64 %0, 0, !dbg !1980
  br i1 %2, label %3, label %4, !dbg !1982

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1983
  unreachable, !dbg !1983

4:                                                ; preds = %1
  ret void, !dbg !1984
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !1985 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1991, metadata !DIExpression()), !dbg !1993
  call void @llvm.dbg.value(metadata i64 %1, metadata !1992, metadata !DIExpression()), !dbg !1993
  %3 = icmp ult i64 %1, %0, !dbg !1994
  br i1 %3, label %5, label %4, !dbg !1996

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !1997
  unreachable, !dbg !1997

5:                                                ; preds = %2
  ret void, !dbg !1999
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0024/div_Ccode_alarm_0024.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0024")
!4 = !{}
!5 = !{!6, !13, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0024")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !9, line: 25, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !11, line: 39, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !15)
!15 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !21, line: 26, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !23)
!23 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !7, line: 6, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !21, line: 24, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 38, baseType: !27)
!27 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !7, line: 8, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !21, line: 25, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 40, baseType: !31)
!31 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!32 = !{!0}
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0024")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0024/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0024")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0024")
!50 = !DISubroutineType(types: !51)
!51 = !{!19}
!52 = !DILocalVariable(name: "numerator", scope: !48, file: !49, line: 9, type: !17)
!53 = !DILocation(line: 9, column: 13, scope: !48)
!54 = !DILocalVariable(name: "denominator", scope: !48, file: !49, line: 10, type: !8)
!55 = !DILocation(line: 10, column: 13, scope: !48)
!56 = !DILocalVariable(name: "result", scope: !48, file: !49, line: 11, type: !8)
!57 = !DILocation(line: 11, column: 13, scope: !48)
!58 = !DILocation(line: 13, column: 24, scope: !48)
!59 = !DILocation(line: 13, column: 5, scope: !48)
!60 = !DILocation(line: 14, column: 24, scope: !48)
!61 = !DILocation(line: 14, column: 5, scope: !48)
!62 = !DILocation(line: 16, column: 30, scope: !48)
!63 = !DILocation(line: 16, column: 41, scope: !48)
!64 = !DILocation(line: 16, column: 14, scope: !48)
!65 = !DILocation(line: 16, column: 12, scope: !48)
!66 = !DILocation(line: 18, column: 11, scope: !48)
!67 = !DILocation(line: 19, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !69, file: !69, line: 170, type: !70, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0024")
!70 = !DISubroutineType(types: !71)
!71 = !{!6, !6, !6}
!72 = !DILocalVariable(name: "numerator", arg: 1, scope: !68, file: !69, line: 170, type: !6)
!73 = !DILocation(line: 170, column: 31, scope: !68)
!74 = !DILocalVariable(name: "denominator", arg: 2, scope: !68, file: !69, line: 170, type: !6)
!75 = !DILocation(line: 170, column: 47, scope: !68)
!76 = !DILocalVariable(name: "s32Temp1", scope: !68, file: !69, line: 172, type: !16)
!77 = !DILocation(line: 172, column: 6, scope: !68)
!78 = !DILocalVariable(name: "s32Temp2", scope: !68, file: !69, line: 172, type: !16)
!79 = !DILocation(line: 172, column: 15, scope: !68)
!80 = !DILocation(line: 173, column: 13, scope: !68)
!81 = !DILocation(line: 173, column: 22, scope: !68)
!82 = !DILocation(line: 173, column: 11, scope: !68)
!83 = !DILocation(line: 175, column: 6, scope: !84)
!84 = distinct !DILexicalBlock(scope: !68, file: !69, line: 175, column: 6)
!85 = !DILocation(line: 175, column: 18, scope: !84)
!86 = !DILocation(line: 175, column: 6, scope: !68)
!87 = !DILocation(line: 177, column: 7, scope: !88)
!88 = distinct !DILexicalBlock(scope: !89, file: !69, line: 177, column: 7)
!89 = distinct !DILexicalBlock(scope: !84, file: !69, line: 176, column: 2)
!90 = !DILocation(line: 177, column: 17, scope: !88)
!91 = !DILocation(line: 177, column: 7, scope: !89)
!92 = !DILocation(line: 179, column: 4, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !69, line: 178, column: 3)
!94 = !DILocation(line: 183, column: 4, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !69, line: 182, column: 3)
!96 = !DILocation(line: 188, column: 7, scope: !97)
!97 = distinct !DILexicalBlock(scope: !98, file: !69, line: 188, column: 7)
!98 = distinct !DILexicalBlock(scope: !84, file: !69, line: 187, column: 2)
!99 = !DILocation(line: 188, column: 16, scope: !97)
!100 = !DILocation(line: 188, column: 7, scope: !98)
!101 = !DILocation(line: 190, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !69, line: 189, column: 3)
!103 = !DILocation(line: 190, column: 28, scope: !102)
!104 = !DILocation(line: 190, column: 37, scope: !102)
!105 = !DILocation(line: 190, column: 36, scope: !102)
!106 = !{!"True"}
!107 = !DILocation(line: 190, column: 52, scope: !102)
!108 = !DILocation(line: 190, column: 50, scope: !102)
!109 = !DILocation(line: 190, column: 25, scope: !102)
!110 = !DILocation(line: 190, column: 65, scope: !102)
!111 = !DILocation(line: 190, column: 13, scope: !102)
!112 = !DILocation(line: 191, column: 15, scope: !102)
!113 = !DILocation(line: 191, column: 24, scope: !102)
!114 = !DILocation(line: 191, column: 23, scope: !102)
!115 = !DILocation(line: 191, column: 13, scope: !102)
!116 = !DILocation(line: 192, column: 15, scope: !102)
!117 = !DILocation(line: 192, column: 27, scope: !102)
!118 = !DILocation(line: 192, column: 36, scope: !102)
!119 = !DILocation(line: 192, column: 42, scope: !102)
!120 = !DILocation(line: 192, column: 41, scope: !102)
!121 = !DILocation(line: 192, column: 24, scope: !102)
!122 = !DILocation(line: 192, column: 13, scope: !102)
!123 = !DILocation(line: 193, column: 7, scope: !124)
!124 = distinct !DILexicalBlock(scope: !102, file: !69, line: 193, column: 7)
!125 = !DILocation(line: 193, column: 16, scope: !124)
!126 = !DILocation(line: 193, column: 7, scope: !102)
!127 = !DILocation(line: 195, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !129, file: !69, line: 195, column: 8)
!129 = distinct !DILexicalBlock(scope: !124, file: !69, line: 194, column: 4)
!130 = !DILocation(line: 195, column: 17, scope: !128)
!131 = !DILocation(line: 195, column: 8, scope: !129)
!132 = !DILocation(line: 197, column: 18, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !69, line: 196, column: 5)
!134 = !DILocation(line: 197, column: 13, scope: !133)
!135 = !DILocation(line: 197, column: 6, scope: !133)
!136 = !DILocation(line: 201, column: 6, scope: !137)
!137 = distinct !DILexicalBlock(scope: !128, file: !69, line: 200, column: 5)
!138 = !DILocation(line: 206, column: 5, scope: !139)
!139 = distinct !DILexicalBlock(scope: !124, file: !69, line: 205, column: 4)
!140 = !DILocation(line: 211, column: 7, scope: !141)
!141 = distinct !DILexicalBlock(scope: !142, file: !69, line: 211, column: 7)
!142 = distinct !DILexicalBlock(scope: !97, file: !69, line: 210, column: 3)
!143 = !DILocation(line: 211, column: 19, scope: !141)
!144 = !DILocation(line: 211, column: 7, scope: !142)
!145 = !DILocation(line: 213, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !69, line: 212, column: 4)
!147 = !DILocation(line: 213, column: 29, scope: !146)
!148 = !DILocation(line: 213, column: 38, scope: !146)
!149 = !DILocation(line: 213, column: 37, scope: !146)
!150 = !DILocation(line: 213, column: 53, scope: !146)
!151 = !DILocation(line: 213, column: 51, scope: !146)
!152 = !DILocation(line: 213, column: 26, scope: !146)
!153 = !DILocation(line: 213, column: 66, scope: !146)
!154 = !DILocation(line: 213, column: 14, scope: !146)
!155 = !DILocation(line: 214, column: 16, scope: !146)
!156 = !DILocation(line: 214, column: 25, scope: !146)
!157 = !DILocation(line: 214, column: 24, scope: !146)
!158 = !DILocation(line: 214, column: 14, scope: !146)
!159 = !DILocation(line: 215, column: 16, scope: !146)
!160 = !DILocation(line: 215, column: 28, scope: !146)
!161 = !DILocation(line: 215, column: 37, scope: !146)
!162 = !DILocation(line: 215, column: 43, scope: !146)
!163 = !DILocation(line: 215, column: 42, scope: !146)
!164 = !DILocation(line: 215, column: 25, scope: !146)
!165 = !DILocation(line: 215, column: 14, scope: !146)
!166 = !DILocation(line: 216, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !146, file: !69, line: 216, column: 8)
!168 = !DILocation(line: 216, column: 17, scope: !167)
!169 = !DILocation(line: 216, column: 8, scope: !146)
!170 = !DILocation(line: 218, column: 9, scope: !171)
!171 = distinct !DILexicalBlock(scope: !172, file: !69, line: 218, column: 9)
!172 = distinct !DILexicalBlock(scope: !167, file: !69, line: 217, column: 5)
!173 = !DILocation(line: 218, column: 18, scope: !171)
!174 = !DILocation(line: 218, column: 9, scope: !172)
!175 = !DILocation(line: 220, column: 19, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !69, line: 219, column: 6)
!177 = !DILocation(line: 220, column: 14, scope: !176)
!178 = !DILocation(line: 220, column: 7, scope: !176)
!179 = !DILocation(line: 224, column: 7, scope: !180)
!180 = distinct !DILexicalBlock(scope: !171, file: !69, line: 223, column: 6)
!181 = !DILocation(line: 229, column: 6, scope: !182)
!182 = distinct !DILexicalBlock(scope: !167, file: !69, line: 228, column: 5)
!183 = !DILocation(line: 234, column: 5, scope: !184)
!184 = distinct !DILexicalBlock(scope: !141, file: !69, line: 233, column: 4)
!185 = !DILocation(line: 238, column: 1, scope: !68)
!186 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !69, file: !69, line: 255, type: !187, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!187 = !DISubroutineType(types: !188)
!188 = !{!6, !16, !6}
!189 = !DILocalVariable(name: "numerator", arg: 1, scope: !186, file: !69, line: 255, type: !16)
!190 = !DILocation(line: 255, column: 25, scope: !186)
!191 = !DILocalVariable(name: "denominator", arg: 2, scope: !186, file: !69, line: 255, type: !6)
!192 = !DILocation(line: 255, column: 41, scope: !186)
!193 = !DILocalVariable(name: "s32Temp1", scope: !186, file: !69, line: 257, type: !16)
!194 = !DILocation(line: 257, column: 6, scope: !186)
!195 = !DILocalVariable(name: "s32Temp2", scope: !186, file: !69, line: 257, type: !16)
!196 = !DILocation(line: 257, column: 17, scope: !186)
!197 = !DILocation(line: 258, column: 13, scope: !186)
!198 = !DILocation(line: 258, column: 11, scope: !186)
!199 = !DILocation(line: 259, column: 5, scope: !200)
!200 = distinct !DILexicalBlock(scope: !186, file: !69, line: 259, column: 5)
!201 = !DILocation(line: 259, column: 17, scope: !200)
!202 = !DILocation(line: 259, column: 5, scope: !186)
!203 = !DILocation(line: 261, column: 7, scope: !204)
!204 = distinct !DILexicalBlock(scope: !205, file: !69, line: 261, column: 7)
!205 = distinct !DILexicalBlock(scope: !200, file: !69, line: 260, column: 2)
!206 = !DILocation(line: 261, column: 17, scope: !204)
!207 = !DILocation(line: 261, column: 7, scope: !205)
!208 = !DILocation(line: 263, column: 4, scope: !209)
!209 = distinct !DILexicalBlock(scope: !204, file: !69, line: 262, column: 3)
!210 = !DILocation(line: 267, column: 4, scope: !211)
!211 = distinct !DILexicalBlock(scope: !204, file: !69, line: 266, column: 3)
!212 = !DILocation(line: 272, column: 6, scope: !213)
!213 = distinct !DILexicalBlock(scope: !214, file: !69, line: 272, column: 6)
!214 = distinct !DILexicalBlock(scope: !200, file: !69, line: 271, column: 2)
!215 = !DILocation(line: 272, column: 16, scope: !213)
!216 = !DILocation(line: 272, column: 6, scope: !214)
!217 = !DILocation(line: 275, column: 47, scope: !218)
!218 = distinct !DILexicalBlock(scope: !219, file: !69, line: 275, column: 8)
!219 = distinct !DILexicalBlock(scope: !213, file: !69, line: 273, column: 3)
!220 = !DILocation(line: 275, column: 37, scope: !218)
!221 = !DILocation(line: 275, column: 10, scope: !218)
!222 = !DILocation(line: 275, column: 8, scope: !219)
!223 = !DILocation(line: 276, column: 8, scope: !224)
!224 = distinct !DILexicalBlock(scope: !218, file: !69, line: 275, column: 63)
!225 = !DILocation(line: 279, column: 54, scope: !226)
!226 = distinct !DILexicalBlock(scope: !219, file: !69, line: 279, column: 8)
!227 = !DILocation(line: 279, column: 77, scope: !226)
!228 = !DILocation(line: 279, column: 93, scope: !226)
!229 = !DILocation(line: 279, column: 88, scope: !226)
!230 = !DILocation(line: 279, column: 86, scope: !226)
!231 = !DILocation(line: 279, column: 113, scope: !226)
!232 = !DILocation(line: 279, column: 108, scope: !226)
!233 = !DILocation(line: 279, column: 106, scope: !226)
!234 = !DILocation(line: 279, column: 63, scope: !226)
!235 = !DILocation(line: 279, column: 38, scope: !226)
!236 = !DILocation(line: 279, column: 10, scope: !226)
!237 = !DILocation(line: 279, column: 8, scope: !219)
!238 = !DILocation(line: 280, column: 8, scope: !239)
!239 = distinct !DILexicalBlock(scope: !226, file: !69, line: 279, column: 146)
!240 = !DILocation(line: 283, column: 51, scope: !241)
!241 = distinct !DILexicalBlock(scope: !219, file: !69, line: 283, column: 8)
!242 = !DILocation(line: 283, column: 67, scope: !241)
!243 = !DILocation(line: 283, column: 62, scope: !241)
!244 = !DILocation(line: 283, column: 60, scope: !241)
!245 = !DILocation(line: 283, column: 35, scope: !241)
!246 = !DILocation(line: 283, column: 97, scope: !241)
!247 = !DILocation(line: 283, column: 92, scope: !241)
!248 = !DILocation(line: 283, column: 82, scope: !241)
!249 = !DILocation(line: 283, column: 10, scope: !241)
!250 = !DILocation(line: 283, column: 8, scope: !219)
!251 = !DILocation(line: 284, column: 8, scope: !252)
!252 = distinct !DILexicalBlock(scope: !241, file: !69, line: 283, column: 113)
!253 = !DILocation(line: 287, column: 51, scope: !254)
!254 = distinct !DILexicalBlock(scope: !219, file: !69, line: 287, column: 8)
!255 = !DILocation(line: 287, column: 67, scope: !254)
!256 = !DILocation(line: 287, column: 62, scope: !254)
!257 = !DILocation(line: 287, column: 60, scope: !254)
!258 = !DILocation(line: 287, column: 35, scope: !254)
!259 = !DILocation(line: 287, column: 97, scope: !254)
!260 = !DILocation(line: 287, column: 92, scope: !254)
!261 = !DILocation(line: 287, column: 82, scope: !254)
!262 = !DILocation(line: 287, column: 10, scope: !254)
!263 = !DILocation(line: 287, column: 8, scope: !219)
!264 = !DILocation(line: 288, column: 8, scope: !265)
!265 = distinct !DILexicalBlock(scope: !254, file: !69, line: 287, column: 113)
!266 = !DILocation(line: 291, column: 64, scope: !267)
!267 = distinct !DILexicalBlock(scope: !219, file: !69, line: 291, column: 8)
!268 = !DILocation(line: 291, column: 87, scope: !267)
!269 = !DILocation(line: 291, column: 103, scope: !267)
!270 = !DILocation(line: 291, column: 98, scope: !267)
!271 = !DILocation(line: 291, column: 96, scope: !267)
!272 = !DILocation(line: 291, column: 123, scope: !267)
!273 = !DILocation(line: 291, column: 118, scope: !267)
!274 = !DILocation(line: 291, column: 116, scope: !267)
!275 = !DILocation(line: 291, column: 73, scope: !267)
!276 = !DILocation(line: 291, column: 48, scope: !267)
!277 = !DILocation(line: 291, column: 10, scope: !267)
!278 = !DILocation(line: 291, column: 8, scope: !219)
!279 = !DILocation(line: 292, column: 8, scope: !280)
!280 = distinct !DILexicalBlock(scope: !267, file: !69, line: 291, column: 141)
!281 = !DILocation(line: 299, column: 42, scope: !219)
!282 = !DILocation(line: 299, column: 65, scope: !219)
!283 = !DILocation(line: 299, column: 81, scope: !219)
!284 = !DILocation(line: 299, column: 76, scope: !219)
!285 = !DILocation(line: 299, column: 74, scope: !219)
!286 = !DILocation(line: 299, column: 101, scope: !219)
!287 = !DILocation(line: 299, column: 96, scope: !219)
!288 = !DILocation(line: 299, column: 94, scope: !219)
!289 = !DILocation(line: 299, column: 51, scope: !219)
!290 = !DILocation(line: 299, column: 115, scope: !219)
!291 = !DILocation(line: 299, column: 26, scope: !219)
!292 = !DILocation(line: 299, column: 24, scope: !219)
!293 = !DILocation(line: 300, column: 4, scope: !219)
!294 = !DILocation(line: 321, column: 7, scope: !295)
!295 = distinct !DILexicalBlock(scope: !296, file: !69, line: 321, column: 7)
!296 = distinct !DILexicalBlock(scope: !213, file: !69, line: 320, column: 3)
!297 = !DILocation(line: 321, column: 19, scope: !295)
!298 = !DILocation(line: 321, column: 7, scope: !296)
!299 = !DILocation(line: 323, column: 17, scope: !300)
!300 = distinct !DILexicalBlock(scope: !295, file: !69, line: 322, column: 4)
!301 = !DILocation(line: 323, column: 29, scope: !300)
!302 = !DILocation(line: 323, column: 38, scope: !300)
!303 = !DILocation(line: 323, column: 37, scope: !300)
!304 = !DILocation(line: 323, column: 53, scope: !300)
!305 = !DILocation(line: 323, column: 51, scope: !300)
!306 = !DILocation(line: 323, column: 26, scope: !300)
!307 = !DILocation(line: 323, column: 66, scope: !300)
!308 = !DILocation(line: 323, column: 14, scope: !300)
!309 = !DILocation(line: 324, column: 16, scope: !300)
!310 = !DILocation(line: 324, column: 25, scope: !300)
!311 = !DILocation(line: 324, column: 24, scope: !300)
!312 = !DILocation(line: 324, column: 14, scope: !300)
!313 = !DILocation(line: 325, column: 16, scope: !300)
!314 = !DILocation(line: 325, column: 28, scope: !300)
!315 = !DILocation(line: 325, column: 39, scope: !300)
!316 = !DILocation(line: 325, column: 38, scope: !300)
!317 = !DILocation(line: 325, column: 25, scope: !300)
!318 = !DILocation(line: 325, column: 14, scope: !300)
!319 = !DILocation(line: 326, column: 8, scope: !320)
!320 = distinct !DILexicalBlock(scope: !300, file: !69, line: 326, column: 8)
!321 = !DILocation(line: 326, column: 17, scope: !320)
!322 = !DILocation(line: 326, column: 8, scope: !300)
!323 = !DILocation(line: 328, column: 9, scope: !324)
!324 = distinct !DILexicalBlock(scope: !325, file: !69, line: 328, column: 9)
!325 = distinct !DILexicalBlock(scope: !320, file: !69, line: 327, column: 5)
!326 = !DILocation(line: 328, column: 18, scope: !324)
!327 = !DILocation(line: 328, column: 9, scope: !325)
!328 = !DILocation(line: 330, column: 19, scope: !329)
!329 = distinct !DILexicalBlock(scope: !324, file: !69, line: 329, column: 6)
!330 = !DILocation(line: 330, column: 14, scope: !329)
!331 = !DILocation(line: 330, column: 7, scope: !329)
!332 = !DILocation(line: 334, column: 7, scope: !333)
!333 = distinct !DILexicalBlock(scope: !324, file: !69, line: 333, column: 6)
!334 = !DILocation(line: 339, column: 6, scope: !335)
!335 = distinct !DILexicalBlock(scope: !320, file: !69, line: 338, column: 5)
!336 = !DILocation(line: 345, column: 5, scope: !337)
!337 = distinct !DILexicalBlock(scope: !295, file: !69, line: 344, column: 4)
!338 = !DILocation(line: 351, column: 1, scope: !186)
!339 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !340, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!340 = !DISubroutineType(types: !341)
!341 = !{!19, !13}
!342 = !DILocalVariable(name: "denominator", arg: 1, scope: !339, file: !33, line: 24, type: !13)
!343 = !DILocation(line: 24, column: 40, scope: !339)
!344 = !DILocation(line: 26, column: 12, scope: !339)
!345 = !DILocation(line: 26, column: 24, scope: !339)
!346 = !DILocation(line: 26, column: 5, scope: !339)
!347 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !348, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!348 = !DISubroutineType(types: !349)
!349 = !{!19, !13, !20}
!350 = !DILocalVariable(name: "left", arg: 1, scope: !347, file: !33, line: 90, type: !13)
!351 = !DILocation(line: 90, column: 41, scope: !347)
!352 = !DILocalVariable(name: "count", arg: 2, scope: !347, file: !33, line: 90, type: !20)
!353 = !DILocation(line: 90, column: 56, scope: !347)
!354 = !DILocation(line: 92, column: 9, scope: !355)
!355 = distinct !DILexicalBlock(scope: !347, file: !33, line: 92, column: 9)
!356 = !DILocation(line: 92, column: 15, scope: !355)
!357 = !DILocation(line: 92, column: 9, scope: !347)
!358 = !DILocation(line: 93, column: 9, scope: !359)
!359 = distinct !DILexicalBlock(scope: !355, file: !33, line: 92, column: 32)
!360 = !DILocation(line: 95, column: 12, scope: !347)
!361 = !DILocation(line: 95, column: 34, scope: !347)
!362 = !DILocation(line: 95, column: 31, scope: !347)
!363 = !DILocation(line: 95, column: 17, scope: !347)
!364 = !DILocation(line: 95, column: 41, scope: !347)
!365 = !DILocation(line: 95, column: 5, scope: !347)
!366 = !DILocation(line: 96, column: 1, scope: !347)
!367 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !368, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!368 = !DISubroutineType(types: !369)
!369 = !{!19, !13, !13}
!370 = !DILocalVariable(name: "left", arg: 1, scope: !367, file: !33, line: 78, type: !13)
!371 = !DILocation(line: 78, column: 38, scope: !367)
!372 = !DILocalVariable(name: "right", arg: 2, scope: !367, file: !33, line: 78, type: !13)
!373 = !DILocation(line: 78, column: 52, scope: !367)
!374 = !DILocation(line: 80, column: 12, scope: !367)
!375 = !DILocation(line: 80, column: 19, scope: !367)
!376 = !DILocation(line: 80, column: 17, scope: !367)
!377 = !DILocation(line: 80, column: 25, scope: !367)
!378 = !DILocation(line: 80, column: 5, scope: !367)
!379 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !368, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!380 = !DILocalVariable(name: "left", arg: 1, scope: !379, file: !33, line: 72, type: !13)
!381 = !DILocation(line: 72, column: 38, scope: !379)
!382 = !DILocalVariable(name: "right", arg: 2, scope: !379, file: !33, line: 72, type: !13)
!383 = !DILocation(line: 72, column: 52, scope: !379)
!384 = !DILocation(line: 74, column: 12, scope: !379)
!385 = !DILocation(line: 74, column: 19, scope: !379)
!386 = !DILocation(line: 74, column: 17, scope: !379)
!387 = !DILocation(line: 74, column: 25, scope: !379)
!388 = !DILocation(line: 74, column: 5, scope: !379)
!389 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !340, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!390 = !DILocalVariable(name: "left", arg: 1, scope: !389, file: !33, line: 84, type: !13)
!391 = !DILocation(line: 84, column: 51, scope: !389)
!392 = !DILocation(line: 86, column: 12, scope: !389)
!393 = !DILocation(line: 86, column: 17, scope: !389)
!394 = !DILocation(line: 86, column: 5, scope: !389)
!395 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 369, type: !396, scopeLine: 370, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!396 = !DISubroutineType(types: !397)
!397 = !{!6, !6, !28}
!398 = !DILocalVariable(name: "numerator", arg: 1, scope: !395, file: !69, line: 369, type: !6)
!399 = !DILocation(line: 369, column: 31, scope: !395)
!400 = !DILocalVariable(name: "denominator", arg: 2, scope: !395, file: !69, line: 369, type: !28)
!401 = !DILocation(line: 369, column: 47, scope: !395)
!402 = !DILocalVariable(name: "u16Temp1", scope: !395, file: !69, line: 371, type: !28)
!403 = !DILocation(line: 371, column: 6, scope: !395)
!404 = !DILocalVariable(name: "s32Temp1", scope: !395, file: !69, line: 372, type: !16)
!405 = !DILocation(line: 372, column: 6, scope: !395)
!406 = !DILocalVariable(name: "s32Temp2", scope: !395, file: !69, line: 372, type: !16)
!407 = !DILocation(line: 372, column: 15, scope: !395)
!408 = !DILocation(line: 373, column: 13, scope: !395)
!409 = !DILocation(line: 373, column: 25, scope: !395)
!410 = !DILocation(line: 373, column: 11, scope: !395)
!411 = !DILocation(line: 374, column: 13, scope: !395)
!412 = !DILocation(line: 374, column: 22, scope: !395)
!413 = !DILocation(line: 374, column: 11, scope: !395)
!414 = !DILocation(line: 375, column: 5, scope: !415)
!415 = distinct !DILexicalBlock(scope: !395, file: !69, line: 375, column: 5)
!416 = !DILocation(line: 375, column: 14, scope: !415)
!417 = !DILocation(line: 375, column: 5, scope: !395)
!418 = !DILocation(line: 377, column: 7, scope: !419)
!419 = distinct !DILexicalBlock(scope: !420, file: !69, line: 377, column: 7)
!420 = distinct !DILexicalBlock(scope: !415, file: !69, line: 376, column: 2)
!421 = !DILocation(line: 377, column: 17, scope: !419)
!422 = !DILocation(line: 377, column: 7, scope: !420)
!423 = !DILocation(line: 379, column: 4, scope: !424)
!424 = distinct !DILexicalBlock(scope: !419, file: !69, line: 378, column: 3)
!425 = !DILocation(line: 383, column: 4, scope: !426)
!426 = distinct !DILexicalBlock(scope: !419, file: !69, line: 382, column: 3)
!427 = !DILocation(line: 388, column: 15, scope: !428)
!428 = distinct !DILexicalBlock(scope: !415, file: !69, line: 387, column: 2)
!429 = !DILocation(line: 388, column: 24, scope: !428)
!430 = !DILocation(line: 388, column: 32, scope: !428)
!431 = !DILocation(line: 388, column: 41, scope: !428)
!432 = !DILocation(line: 388, column: 47, scope: !428)
!433 = !DILocation(line: 388, column: 46, scope: !428)
!434 = !DILocation(line: 388, column: 57, scope: !428)
!435 = !DILocation(line: 388, column: 56, scope: !428)
!436 = !DILocation(line: 388, column: 29, scope: !428)
!437 = !DILocation(line: 388, column: 12, scope: !428)
!438 = !DILocation(line: 389, column: 14, scope: !428)
!439 = !DILocation(line: 389, column: 22, scope: !428)
!440 = !DILocation(line: 389, column: 12, scope: !428)
!441 = !DILocation(line: 390, column: 14, scope: !428)
!442 = !DILocation(line: 390, column: 23, scope: !428)
!443 = !DILocation(line: 390, column: 22, scope: !428)
!444 = !DILocation(line: 390, column: 12, scope: !428)
!445 = !DILocation(line: 391, column: 16, scope: !428)
!446 = !DILocation(line: 391, column: 25, scope: !428)
!447 = !DILocation(line: 391, column: 31, scope: !428)
!448 = !DILocation(line: 391, column: 30, scope: !428)
!449 = !DILocation(line: 391, column: 43, scope: !428)
!450 = !DILocation(line: 391, column: 41, scope: !428)
!451 = !DILocation(line: 391, column: 12, scope: !428)
!452 = !DILocation(line: 392, column: 6, scope: !453)
!453 = distinct !DILexicalBlock(scope: !428, file: !69, line: 392, column: 6)
!454 = !DILocation(line: 392, column: 15, scope: !453)
!455 = !DILocation(line: 392, column: 6, scope: !428)
!456 = !DILocation(line: 394, column: 7, scope: !457)
!457 = distinct !DILexicalBlock(scope: !458, file: !69, line: 394, column: 7)
!458 = distinct !DILexicalBlock(scope: !453, file: !69, line: 393, column: 3)
!459 = !DILocation(line: 394, column: 16, scope: !457)
!460 = !DILocation(line: 394, column: 7, scope: !458)
!461 = !DILocation(line: 396, column: 17, scope: !462)
!462 = distinct !DILexicalBlock(scope: !457, file: !69, line: 395, column: 4)
!463 = !DILocation(line: 396, column: 12, scope: !462)
!464 = !DILocation(line: 396, column: 5, scope: !462)
!465 = !DILocation(line: 400, column: 5, scope: !466)
!466 = distinct !DILexicalBlock(scope: !457, file: !69, line: 399, column: 4)
!467 = !DILocation(line: 405, column: 4, scope: !468)
!468 = distinct !DILexicalBlock(scope: !453, file: !69, line: 404, column: 3)
!469 = !DILocation(line: 408, column: 1, scope: !395)
!470 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 425, type: !396, scopeLine: 426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!471 = !DILocalVariable(name: "numerator", arg: 1, scope: !470, file: !69, line: 425, type: !6)
!472 = !DILocation(line: 425, column: 30, scope: !470)
!473 = !DILocalVariable(name: "denominator", arg: 2, scope: !470, file: !69, line: 425, type: !28)
!474 = !DILocation(line: 425, column: 45, scope: !470)
!475 = !DILocalVariable(name: "u16Temp1", scope: !470, file: !69, line: 427, type: !28)
!476 = !DILocation(line: 427, column: 6, scope: !470)
!477 = !DILocalVariable(name: "s32Temp1", scope: !470, file: !69, line: 428, type: !16)
!478 = !DILocation(line: 428, column: 6, scope: !470)
!479 = !DILocation(line: 429, column: 13, scope: !470)
!480 = !DILocation(line: 429, column: 25, scope: !470)
!481 = !DILocation(line: 429, column: 11, scope: !470)
!482 = !DILocation(line: 430, column: 5, scope: !483)
!483 = distinct !DILexicalBlock(scope: !470, file: !69, line: 430, column: 5)
!484 = !DILocation(line: 430, column: 13, scope: !483)
!485 = !DILocation(line: 430, column: 5, scope: !470)
!486 = !DILocation(line: 432, column: 6, scope: !487)
!487 = distinct !DILexicalBlock(scope: !488, file: !69, line: 432, column: 6)
!488 = distinct !DILexicalBlock(scope: !483, file: !69, line: 431, column: 2)
!489 = !DILocation(line: 432, column: 15, scope: !487)
!490 = !DILocation(line: 432, column: 6, scope: !488)
!491 = !DILocation(line: 434, column: 4, scope: !492)
!492 = distinct !DILexicalBlock(scope: !487, file: !69, line: 433, column: 3)
!493 = !DILocation(line: 438, column: 4, scope: !494)
!494 = distinct !DILexicalBlock(scope: !487, file: !69, line: 437, column: 3)
!495 = !DILocation(line: 444, column: 15, scope: !496)
!496 = distinct !DILexicalBlock(scope: !483, file: !69, line: 443, column: 2)
!497 = !DILocation(line: 444, column: 27, scope: !496)
!498 = !DILocation(line: 444, column: 37, scope: !496)
!499 = !DILocation(line: 444, column: 36, scope: !496)
!500 = !DILocation(line: 444, column: 49, scope: !496)
!501 = !DILocation(line: 444, column: 47, scope: !496)
!502 = !DILocation(line: 444, column: 25, scope: !496)
!503 = !DILocation(line: 444, column: 59, scope: !496)
!504 = !DILocation(line: 444, column: 12, scope: !496)
!505 = !DILocation(line: 445, column: 15, scope: !496)
!506 = !DILocation(line: 445, column: 24, scope: !496)
!507 = !DILocation(line: 445, column: 23, scope: !496)
!508 = !DILocation(line: 445, column: 37, scope: !496)
!509 = !DILocation(line: 445, column: 47, scope: !496)
!510 = !DILocation(line: 445, column: 46, scope: !496)
!511 = !DILocation(line: 445, column: 34, scope: !496)
!512 = !DILocation(line: 445, column: 12, scope: !496)
!513 = !DILocation(line: 446, column: 10, scope: !496)
!514 = !DILocation(line: 446, column: 3, scope: !496)
!515 = !DILocation(line: 448, column: 1, scope: !470)
!516 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 466, type: !517, scopeLine: 467, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!517 = !DISubroutineType(types: !518)
!518 = !{!24, !28, !28}
!519 = !DILocalVariable(name: "numerator", arg: 1, scope: !516, file: !69, line: 466, type: !28)
!520 = !DILocation(line: 466, column: 28, scope: !516)
!521 = !DILocalVariable(name: "denominator", arg: 2, scope: !516, file: !69, line: 466, type: !28)
!522 = !DILocation(line: 466, column: 43, scope: !516)
!523 = !DILocalVariable(name: "u32Temp1", scope: !516, file: !69, line: 468, type: !524)
!524 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !20)
!525 = !DILocation(line: 468, column: 6, scope: !516)
!526 = !DILocalVariable(name: "u32Temp2", scope: !516, file: !69, line: 468, type: !524)
!527 = !DILocation(line: 468, column: 20, scope: !516)
!528 = !DILocalVariable(name: "u32Temp3", scope: !516, file: !69, line: 468, type: !524)
!529 = !DILocation(line: 468, column: 33, scope: !516)
!530 = !DILocation(line: 469, column: 5, scope: !531)
!531 = distinct !DILexicalBlock(scope: !516, file: !69, line: 469, column: 5)
!532 = !DILocation(line: 469, column: 16, scope: !531)
!533 = !DILocation(line: 469, column: 5, scope: !516)
!534 = !DILocation(line: 471, column: 3, scope: !535)
!535 = distinct !DILexicalBlock(scope: !531, file: !69, line: 470, column: 2)
!536 = !DILocation(line: 475, column: 15, scope: !537)
!537 = distinct !DILexicalBlock(scope: !531, file: !69, line: 474, column: 2)
!538 = !DILocation(line: 475, column: 24, scope: !537)
!539 = !DILocation(line: 475, column: 12, scope: !537)
!540 = !DILocation(line: 476, column: 14, scope: !537)
!541 = !DILocation(line: 476, column: 25, scope: !537)
!542 = !DILocation(line: 476, column: 23, scope: !537)
!543 = !DILocation(line: 476, column: 12, scope: !537)
!544 = !DILocation(line: 477, column: 15, scope: !537)
!545 = !DILocation(line: 477, column: 24, scope: !537)
!546 = !DILocation(line: 477, column: 32, scope: !537)
!547 = !DILocation(line: 477, column: 12, scope: !537)
!548 = !DILocation(line: 478, column: 6, scope: !549)
!549 = distinct !DILexicalBlock(scope: !537, file: !69, line: 478, column: 6)
!550 = !DILocation(line: 478, column: 15, scope: !549)
!551 = !DILocation(line: 478, column: 6, scope: !537)
!552 = !DILocation(line: 480, column: 15, scope: !553)
!553 = distinct !DILexicalBlock(scope: !549, file: !69, line: 479, column: 3)
!554 = !DILocation(line: 480, column: 11, scope: !553)
!555 = !DILocation(line: 480, column: 4, scope: !553)
!556 = !DILocation(line: 484, column: 4, scope: !557)
!557 = distinct !DILexicalBlock(scope: !549, file: !69, line: 483, column: 3)
!558 = !DILocation(line: 487, column: 1, scope: !516)
!559 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 504, type: !560, scopeLine: 505, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!560 = !DISubroutineType(types: !561)
!561 = !{!28, !16, !28}
!562 = !DILocalVariable(name: "x_value", arg: 1, scope: !559, file: !69, line: 504, type: !16)
!563 = !DILocation(line: 504, column: 25, scope: !559)
!564 = !DILocalVariable(name: "y_value", arg: 2, scope: !559, file: !69, line: 504, type: !28)
!565 = !DILocation(line: 504, column: 38, scope: !559)
!566 = !DILocalVariable(name: "s32Temp1", scope: !559, file: !69, line: 506, type: !16)
!567 = !DILocation(line: 506, column: 6, scope: !559)
!568 = !DILocation(line: 507, column: 12, scope: !559)
!569 = !DILocation(line: 507, column: 20, scope: !559)
!570 = !DILocation(line: 507, column: 10, scope: !559)
!571 = !DILocation(line: 508, column: 6, scope: !572)
!572 = distinct !DILexicalBlock(scope: !559, file: !69, line: 508, column: 5)
!573 = !DILocation(line: 508, column: 14, scope: !572)
!574 = !DILocation(line: 508, column: 24, scope: !572)
!575 = !DILocation(line: 508, column: 5, scope: !559)
!576 = !DILocation(line: 510, column: 6, scope: !577)
!577 = distinct !DILexicalBlock(scope: !578, file: !69, line: 510, column: 6)
!578 = distinct !DILexicalBlock(scope: !572, file: !69, line: 509, column: 2)
!579 = !DILocation(line: 510, column: 14, scope: !577)
!580 = !DILocation(line: 510, column: 6, scope: !578)
!581 = !DILocation(line: 512, column: 4, scope: !582)
!582 = distinct !DILexicalBlock(scope: !577, file: !69, line: 511, column: 3)
!583 = !DILocation(line: 516, column: 4, scope: !584)
!584 = distinct !DILexicalBlock(scope: !577, file: !69, line: 515, column: 3)
!585 = !DILocation(line: 521, column: 15, scope: !586)
!586 = distinct !DILexicalBlock(scope: !572, file: !69, line: 520, column: 2)
!587 = !DILocation(line: 521, column: 27, scope: !586)
!588 = !DILocation(line: 521, column: 35, scope: !586)
!589 = !DILocation(line: 521, column: 34, scope: !586)
!590 = !DILocation(line: 521, column: 46, scope: !586)
!591 = !DILocation(line: 521, column: 44, scope: !586)
!592 = !DILocation(line: 521, column: 23, scope: !586)
!593 = !DILocation(line: 521, column: 56, scope: !586)
!594 = !DILocation(line: 521, column: 12, scope: !586)
!595 = !DILocation(line: 522, column: 15, scope: !586)
!596 = !DILocation(line: 522, column: 24, scope: !586)
!597 = !DILocation(line: 522, column: 23, scope: !586)
!598 = !DILocation(line: 522, column: 36, scope: !586)
!599 = !DILocation(line: 522, column: 44, scope: !586)
!600 = !DILocation(line: 522, column: 43, scope: !586)
!601 = !DILocation(line: 522, column: 33, scope: !586)
!602 = !DILocation(line: 522, column: 12, scope: !586)
!603 = !DILocation(line: 523, column: 6, scope: !604)
!604 = distinct !DILexicalBlock(scope: !586, file: !69, line: 523, column: 6)
!605 = !DILocation(line: 523, column: 15, scope: !604)
!606 = !DILocation(line: 523, column: 6, scope: !586)
!607 = !DILocation(line: 525, column: 7, scope: !608)
!608 = distinct !DILexicalBlock(scope: !609, file: !69, line: 525, column: 7)
!609 = distinct !DILexicalBlock(scope: !604, file: !69, line: 524, column: 3)
!610 = !DILocation(line: 525, column: 16, scope: !608)
!611 = !DILocation(line: 525, column: 7, scope: !609)
!612 = !DILocation(line: 527, column: 17, scope: !613)
!613 = distinct !DILexicalBlock(scope: !608, file: !69, line: 526, column: 4)
!614 = !DILocation(line: 527, column: 12, scope: !613)
!615 = !DILocation(line: 527, column: 5, scope: !613)
!616 = !DILocation(line: 531, column: 5, scope: !617)
!617 = distinct !DILexicalBlock(scope: !608, file: !69, line: 530, column: 4)
!618 = !DILocation(line: 536, column: 4, scope: !619)
!619 = distinct !DILexicalBlock(scope: !604, file: !69, line: 535, column: 3)
!620 = !DILocation(line: 539, column: 1, scope: !559)
!621 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 557, type: !622, scopeLine: 558, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!622 = !DISubroutineType(types: !623)
!623 = !{!28, !28, !28}
!624 = !DILocalVariable(name: "numerator", arg: 1, scope: !621, file: !69, line: 557, type: !28)
!625 = !DILocation(line: 557, column: 31, scope: !621)
!626 = !DILocalVariable(name: "denominator", arg: 2, scope: !621, file: !69, line: 557, type: !28)
!627 = !DILocation(line: 557, column: 46, scope: !621)
!628 = !DILocalVariable(name: "u32Temp", scope: !621, file: !69, line: 559, type: !524)
!629 = !DILocation(line: 559, column: 6, scope: !621)
!630 = !DILocation(line: 560, column: 5, scope: !631)
!631 = distinct !DILexicalBlock(scope: !621, file: !69, line: 560, column: 5)
!632 = !DILocation(line: 560, column: 17, scope: !631)
!633 = !DILocation(line: 560, column: 5, scope: !621)
!634 = !DILocation(line: 562, column: 3, scope: !635)
!635 = distinct !DILexicalBlock(scope: !631, file: !69, line: 561, column: 2)
!636 = !DILocation(line: 566, column: 14, scope: !637)
!637 = distinct !DILexicalBlock(scope: !631, file: !69, line: 565, column: 2)
!638 = !DILocation(line: 566, column: 23, scope: !637)
!639 = !DILocation(line: 566, column: 32, scope: !637)
!640 = !DILocation(line: 566, column: 44, scope: !637)
!641 = !DILocation(line: 566, column: 29, scope: !637)
!642 = !DILocation(line: 566, column: 11, scope: !637)
!643 = !DILocation(line: 567, column: 13, scope: !637)
!644 = !DILocation(line: 567, column: 21, scope: !637)
!645 = !DILocation(line: 567, column: 20, scope: !637)
!646 = !DILocation(line: 567, column: 11, scope: !637)
!647 = !DILocation(line: 568, column: 6, scope: !648)
!648 = distinct !DILexicalBlock(scope: !637, file: !69, line: 568, column: 6)
!649 = !DILocation(line: 568, column: 14, scope: !648)
!650 = !DILocation(line: 568, column: 6, scope: !637)
!651 = !DILocation(line: 570, column: 11, scope: !652)
!652 = distinct !DILexicalBlock(scope: !648, file: !69, line: 569, column: 3)
!653 = !DILocation(line: 570, column: 19, scope: !652)
!654 = !DILocation(line: 570, column: 4, scope: !652)
!655 = !DILocation(line: 574, column: 4, scope: !656)
!656 = distinct !DILexicalBlock(scope: !648, file: !69, line: 573, column: 3)
!657 = !DILocation(line: 578, column: 1, scope: !621)
!658 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 595, type: !659, scopeLine: 596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!659 = !DISubroutineType(types: !660)
!660 = !{!28, !524, !28}
!661 = !DILocalVariable(name: "x_value", arg: 1, scope: !658, file: !69, line: 595, type: !524)
!662 = !DILocation(line: 595, column: 25, scope: !658)
!663 = !DILocalVariable(name: "y_value", arg: 2, scope: !658, file: !69, line: 595, type: !28)
!664 = !DILocation(line: 595, column: 38, scope: !658)
!665 = !DILocalVariable(name: "u32Temp1", scope: !658, file: !69, line: 597, type: !524)
!666 = !DILocation(line: 597, column: 6, scope: !658)
!667 = !DILocalVariable(name: "u32Temp2", scope: !658, file: !69, line: 597, type: !524)
!668 = !DILocation(line: 597, column: 17, scope: !658)
!669 = !DILocation(line: 598, column: 12, scope: !658)
!670 = !DILocation(line: 598, column: 20, scope: !658)
!671 = !DILocation(line: 598, column: 10, scope: !658)
!672 = !DILocation(line: 599, column: 5, scope: !673)
!673 = distinct !DILexicalBlock(scope: !658, file: !69, line: 599, column: 5)
!674 = !DILocation(line: 599, column: 13, scope: !673)
!675 = !DILocation(line: 599, column: 5, scope: !658)
!676 = !DILocation(line: 601, column: 3, scope: !677)
!677 = distinct !DILexicalBlock(scope: !673, file: !69, line: 600, column: 2)
!678 = !DILocation(line: 605, column: 14, scope: !679)
!679 = distinct !DILexicalBlock(scope: !673, file: !69, line: 604, column: 2)
!680 = !DILocation(line: 605, column: 22, scope: !679)
!681 = !DILocation(line: 605, column: 21, scope: !679)
!682 = !DILocation(line: 605, column: 12, scope: !679)
!683 = !DILocation(line: 606, column: 14, scope: !679)
!684 = !DILocation(line: 606, column: 25, scope: !679)
!685 = !DILocation(line: 606, column: 36, scope: !679)
!686 = !DILocation(line: 606, column: 34, scope: !679)
!687 = !DILocation(line: 606, column: 22, scope: !679)
!688 = !DILocation(line: 606, column: 45, scope: !679)
!689 = !DILocation(line: 606, column: 12, scope: !679)
!690 = !DILocation(line: 607, column: 15, scope: !679)
!691 = !DILocation(line: 607, column: 24, scope: !679)
!692 = !DILocation(line: 607, column: 23, scope: !679)
!693 = !DILocation(line: 607, column: 36, scope: !679)
!694 = !DILocation(line: 607, column: 44, scope: !679)
!695 = !DILocation(line: 607, column: 43, scope: !679)
!696 = !DILocation(line: 607, column: 33, scope: !679)
!697 = !DILocation(line: 607, column: 12, scope: !679)
!698 = !DILocation(line: 608, column: 6, scope: !699)
!699 = distinct !DILexicalBlock(scope: !679, file: !69, line: 608, column: 6)
!700 = !DILocation(line: 608, column: 15, scope: !699)
!701 = !DILocation(line: 608, column: 6, scope: !679)
!702 = !DILocation(line: 610, column: 11, scope: !703)
!703 = distinct !DILexicalBlock(scope: !699, file: !69, line: 609, column: 3)
!704 = !DILocation(line: 610, column: 20, scope: !703)
!705 = !DILocation(line: 610, column: 4, scope: !703)
!706 = !DILocation(line: 614, column: 4, scope: !707)
!707 = distinct !DILexicalBlock(scope: !699, file: !69, line: 613, column: 3)
!708 = !DILocation(line: 618, column: 1, scope: !658)
!709 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 637, type: !710, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!710 = !DISubroutineType(types: !711)
!711 = !{!6, !6, !28, !6}
!712 = !DILocalVariable(name: "factor1", arg: 1, scope: !709, file: !69, line: 637, type: !6)
!713 = !DILocation(line: 637, column: 33, scope: !709)
!714 = !DILocalVariable(name: "factor2", arg: 2, scope: !709, file: !69, line: 637, type: !28)
!715 = !DILocation(line: 637, column: 46, scope: !709)
!716 = !DILocalVariable(name: "denominator", arg: 3, scope: !709, file: !69, line: 637, type: !6)
!717 = !DILocation(line: 637, column: 59, scope: !709)
!718 = !DILocalVariable(name: "s32Result", scope: !709, file: !69, line: 639, type: !16)
!719 = !DILocation(line: 639, column: 6, scope: !709)
!720 = !DILocalVariable(name: "s32Temp1", scope: !709, file: !69, line: 639, type: !16)
!721 = !DILocation(line: 639, column: 21, scope: !709)
!722 = !DILocation(line: 640, column: 14, scope: !709)
!723 = !DILocation(line: 640, column: 24, scope: !709)
!724 = !DILocation(line: 640, column: 22, scope: !709)
!725 = !DILocation(line: 640, column: 12, scope: !709)
!726 = !DILocation(line: 641, column: 5, scope: !727)
!727 = distinct !DILexicalBlock(scope: !709, file: !69, line: 641, column: 5)
!728 = !DILocation(line: 641, column: 17, scope: !727)
!729 = !DILocation(line: 641, column: 5, scope: !709)
!730 = !DILocation(line: 643, column: 6, scope: !731)
!731 = distinct !DILexicalBlock(scope: !732, file: !69, line: 643, column: 6)
!732 = distinct !DILexicalBlock(scope: !727, file: !69, line: 642, column: 2)
!733 = !DILocation(line: 643, column: 16, scope: !731)
!734 = !DILocation(line: 643, column: 6, scope: !732)
!735 = !DILocation(line: 645, column: 4, scope: !736)
!736 = distinct !DILexicalBlock(scope: !731, file: !69, line: 644, column: 3)
!737 = !DILocation(line: 649, column: 4, scope: !738)
!738 = distinct !DILexicalBlock(scope: !731, file: !69, line: 648, column: 3)
!739 = !DILocation(line: 654, column: 14, scope: !740)
!740 = distinct !DILexicalBlock(scope: !727, file: !69, line: 653, column: 2)
!741 = !DILocation(line: 654, column: 27, scope: !740)
!742 = !DILocation(line: 654, column: 37, scope: !740)
!743 = !DILocation(line: 654, column: 36, scope: !740)
!744 = !DILocation(line: 654, column: 50, scope: !740)
!745 = !DILocation(line: 654, column: 49, scope: !740)
!746 = !DILocation(line: 654, column: 24, scope: !740)
!747 = !DILocation(line: 654, column: 12, scope: !740)
!748 = !DILocation(line: 655, column: 14, scope: !740)
!749 = !DILocation(line: 655, column: 23, scope: !740)
!750 = !DILocation(line: 655, column: 12, scope: !740)
!751 = !DILocation(line: 656, column: 16, scope: !740)
!752 = !DILocation(line: 656, column: 25, scope: !740)
!753 = !DILocation(line: 656, column: 24, scope: !740)
!754 = !DILocation(line: 656, column: 41, scope: !740)
!755 = !DILocation(line: 656, column: 51, scope: !740)
!756 = !DILocation(line: 656, column: 50, scope: !740)
!757 = !DILocation(line: 656, column: 38, scope: !740)
!758 = !DILocation(line: 656, column: 13, scope: !740)
!759 = !DILocation(line: 657, column: 6, scope: !760)
!760 = distinct !DILexicalBlock(scope: !740, file: !69, line: 657, column: 6)
!761 = !DILocation(line: 657, column: 16, scope: !760)
!762 = !DILocation(line: 657, column: 6, scope: !740)
!763 = !DILocation(line: 659, column: 7, scope: !764)
!764 = distinct !DILexicalBlock(scope: !765, file: !69, line: 659, column: 7)
!765 = distinct !DILexicalBlock(scope: !760, file: !69, line: 658, column: 3)
!766 = !DILocation(line: 659, column: 17, scope: !764)
!767 = !DILocation(line: 659, column: 7, scope: !765)
!768 = !DILocation(line: 661, column: 17, scope: !769)
!769 = distinct !DILexicalBlock(scope: !764, file: !69, line: 660, column: 4)
!770 = !DILocation(line: 661, column: 12, scope: !769)
!771 = !DILocation(line: 661, column: 5, scope: !769)
!772 = !DILocation(line: 666, column: 5, scope: !773)
!773 = distinct !DILexicalBlock(scope: !764, file: !69, line: 665, column: 4)
!774 = !DILocation(line: 671, column: 4, scope: !775)
!775 = distinct !DILexicalBlock(scope: !760, file: !69, line: 670, column: 3)
!776 = !DILocation(line: 675, column: 1, scope: !709)
!777 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 693, type: !778, scopeLine: 694, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!778 = !DISubroutineType(types: !779)
!779 = !{!6, !28, !6, !28}
!780 = !DILocalVariable(name: "factor1", arg: 1, scope: !777, file: !69, line: 693, type: !28)
!781 = !DILocation(line: 693, column: 33, scope: !777)
!782 = !DILocalVariable(name: "factor2", arg: 2, scope: !777, file: !69, line: 693, type: !6)
!783 = !DILocation(line: 693, column: 46, scope: !777)
!784 = !DILocalVariable(name: "denominator", arg: 3, scope: !777, file: !69, line: 693, type: !28)
!785 = !DILocation(line: 693, column: 59, scope: !777)
!786 = !DILocalVariable(name: "s32Result", scope: !777, file: !69, line: 695, type: !16)
!787 = !DILocation(line: 695, column: 6, scope: !777)
!788 = !DILocalVariable(name: "s32Temp1", scope: !777, file: !69, line: 695, type: !16)
!789 = !DILocation(line: 695, column: 21, scope: !777)
!790 = !DILocation(line: 696, column: 14, scope: !777)
!791 = !DILocation(line: 696, column: 24, scope: !777)
!792 = !DILocation(line: 696, column: 22, scope: !777)
!793 = !DILocation(line: 696, column: 12, scope: !777)
!794 = !DILocation(line: 697, column: 5, scope: !795)
!795 = distinct !DILexicalBlock(scope: !777, file: !69, line: 697, column: 5)
!796 = !DILocation(line: 697, column: 16, scope: !795)
!797 = !DILocation(line: 697, column: 5, scope: !777)
!798 = !DILocation(line: 699, column: 6, scope: !799)
!799 = distinct !DILexicalBlock(scope: !800, file: !69, line: 699, column: 6)
!800 = distinct !DILexicalBlock(scope: !795, file: !69, line: 698, column: 2)
!801 = !DILocation(line: 699, column: 16, scope: !799)
!802 = !DILocation(line: 699, column: 6, scope: !800)
!803 = !DILocation(line: 701, column: 4, scope: !804)
!804 = distinct !DILexicalBlock(scope: !799, file: !69, line: 700, column: 3)
!805 = !DILocation(line: 705, column: 4, scope: !806)
!806 = distinct !DILexicalBlock(scope: !799, file: !69, line: 704, column: 3)
!807 = !DILocation(line: 710, column: 14, scope: !808)
!808 = distinct !DILexicalBlock(scope: !795, file: !69, line: 709, column: 2)
!809 = !DILocation(line: 710, column: 28, scope: !808)
!810 = !DILocation(line: 710, column: 38, scope: !808)
!811 = !DILocation(line: 710, column: 37, scope: !808)
!812 = !DILocation(line: 710, column: 53, scope: !808)
!813 = !DILocation(line: 710, column: 51, scope: !808)
!814 = !DILocation(line: 710, column: 24, scope: !808)
!815 = !DILocation(line: 710, column: 66, scope: !808)
!816 = !DILocation(line: 710, column: 12, scope: !808)
!817 = !DILocation(line: 711, column: 16, scope: !808)
!818 = !DILocation(line: 711, column: 25, scope: !808)
!819 = !DILocation(line: 711, column: 24, scope: !808)
!820 = !DILocation(line: 711, column: 41, scope: !808)
!821 = !DILocation(line: 711, column: 51, scope: !808)
!822 = !DILocation(line: 711, column: 50, scope: !808)
!823 = !DILocation(line: 711, column: 38, scope: !808)
!824 = !DILocation(line: 711, column: 13, scope: !808)
!825 = !DILocation(line: 712, column: 6, scope: !826)
!826 = distinct !DILexicalBlock(scope: !808, file: !69, line: 712, column: 6)
!827 = !DILocation(line: 712, column: 16, scope: !826)
!828 = !DILocation(line: 712, column: 6, scope: !808)
!829 = !DILocation(line: 714, column: 7, scope: !830)
!830 = distinct !DILexicalBlock(scope: !831, file: !69, line: 714, column: 7)
!831 = distinct !DILexicalBlock(scope: !826, file: !69, line: 713, column: 3)
!832 = !DILocation(line: 714, column: 17, scope: !830)
!833 = !DILocation(line: 714, column: 7, scope: !831)
!834 = !DILocation(line: 716, column: 17, scope: !835)
!835 = distinct !DILexicalBlock(scope: !830, file: !69, line: 715, column: 4)
!836 = !DILocation(line: 716, column: 12, scope: !835)
!837 = !DILocation(line: 716, column: 5, scope: !835)
!838 = !DILocation(line: 720, column: 5, scope: !839)
!839 = distinct !DILexicalBlock(scope: !830, file: !69, line: 719, column: 4)
!840 = !DILocation(line: 725, column: 4, scope: !841)
!841 = distinct !DILexicalBlock(scope: !826, file: !69, line: 724, column: 3)
!842 = !DILocation(line: 728, column: 1, scope: !777)
!843 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 747, type: !844, scopeLine: 748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!844 = !DISubroutineType(types: !845)
!845 = !{!28, !6, !28, !6}
!846 = !DILocalVariable(name: "factor1", arg: 1, scope: !843, file: !69, line: 747, type: !6)
!847 = !DILocation(line: 747, column: 33, scope: !843)
!848 = !DILocalVariable(name: "factor2", arg: 2, scope: !843, file: !69, line: 747, type: !28)
!849 = !DILocation(line: 747, column: 46, scope: !843)
!850 = !DILocalVariable(name: "denominator", arg: 3, scope: !843, file: !69, line: 747, type: !6)
!851 = !DILocation(line: 747, column: 59, scope: !843)
!852 = !DILocalVariable(name: "u32Result", scope: !843, file: !69, line: 749, type: !524)
!853 = !DILocation(line: 749, column: 6, scope: !843)
!854 = !DILocalVariable(name: "u32Temp1", scope: !843, file: !69, line: 749, type: !524)
!855 = !DILocation(line: 749, column: 21, scope: !843)
!856 = !DILocalVariable(name: "s32Result", scope: !843, file: !69, line: 750, type: !16)
!857 = !DILocation(line: 750, column: 6, scope: !843)
!858 = !DILocalVariable(name: "s32Temp1", scope: !843, file: !69, line: 750, type: !16)
!859 = !DILocation(line: 750, column: 21, scope: !843)
!860 = !DILocation(line: 751, column: 14, scope: !843)
!861 = !DILocation(line: 751, column: 24, scope: !843)
!862 = !DILocation(line: 751, column: 22, scope: !843)
!863 = !DILocation(line: 751, column: 12, scope: !843)
!864 = !DILocation(line: 753, column: 5, scope: !865)
!865 = distinct !DILexicalBlock(scope: !843, file: !69, line: 753, column: 5)
!866 = !DILocation(line: 753, column: 17, scope: !865)
!867 = !DILocation(line: 753, column: 5, scope: !843)
!868 = !DILocation(line: 755, column: 6, scope: !869)
!869 = distinct !DILexicalBlock(scope: !870, file: !69, line: 755, column: 6)
!870 = distinct !DILexicalBlock(scope: !865, file: !69, line: 754, column: 2)
!871 = !DILocation(line: 755, column: 16, scope: !869)
!872 = !DILocation(line: 755, column: 6, scope: !870)
!873 = !DILocation(line: 757, column: 4, scope: !874)
!874 = distinct !DILexicalBlock(scope: !869, file: !69, line: 756, column: 3)
!875 = !DILocation(line: 761, column: 4, scope: !876)
!876 = distinct !DILexicalBlock(scope: !869, file: !69, line: 760, column: 3)
!877 = !DILocation(line: 766, column: 15, scope: !878)
!878 = distinct !DILexicalBlock(scope: !865, file: !69, line: 765, column: 2)
!879 = !DILocation(line: 766, column: 29, scope: !878)
!880 = !DILocation(line: 766, column: 39, scope: !878)
!881 = !DILocation(line: 766, column: 38, scope: !878)
!882 = !DILocation(line: 766, column: 54, scope: !878)
!883 = !DILocation(line: 766, column: 52, scope: !878)
!884 = !DILocation(line: 766, column: 25, scope: !878)
!885 = !DILocation(line: 766, column: 68, scope: !878)
!886 = !DILocation(line: 766, column: 12, scope: !878)
!887 = !DILocation(line: 767, column: 16, scope: !878)
!888 = !DILocation(line: 767, column: 25, scope: !878)
!889 = !DILocation(line: 767, column: 24, scope: !878)
!890 = !DILocation(line: 767, column: 41, scope: !878)
!891 = !DILocation(line: 767, column: 51, scope: !878)
!892 = !DILocation(line: 767, column: 50, scope: !878)
!893 = !DILocation(line: 767, column: 38, scope: !878)
!894 = !DILocation(line: 767, column: 13, scope: !878)
!895 = !DILocation(line: 768, column: 6, scope: !896)
!896 = distinct !DILexicalBlock(scope: !878, file: !69, line: 768, column: 6)
!897 = !DILocation(line: 768, column: 16, scope: !896)
!898 = !DILocation(line: 768, column: 6, scope: !878)
!899 = !DILocation(line: 770, column: 7, scope: !900)
!900 = distinct !DILexicalBlock(scope: !901, file: !69, line: 770, column: 7)
!901 = distinct !DILexicalBlock(scope: !896, file: !69, line: 769, column: 3)
!902 = !DILocation(line: 770, column: 17, scope: !900)
!903 = !DILocation(line: 770, column: 7, scope: !901)
!904 = !DILocation(line: 772, column: 17, scope: !905)
!905 = distinct !DILexicalBlock(scope: !900, file: !69, line: 771, column: 4)
!906 = !DILocation(line: 772, column: 12, scope: !905)
!907 = !DILocation(line: 772, column: 5, scope: !905)
!908 = !DILocation(line: 776, column: 5, scope: !909)
!909 = distinct !DILexicalBlock(scope: !900, file: !69, line: 775, column: 4)
!910 = !DILocation(line: 781, column: 4, scope: !911)
!911 = distinct !DILexicalBlock(scope: !896, file: !69, line: 780, column: 3)
!912 = !DILocation(line: 784, column: 1, scope: !843)
!913 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 803, type: !914, scopeLine: 804, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!914 = !DISubroutineType(types: !915)
!915 = !{!28, !6, !28, !28}
!916 = !DILocalVariable(name: "factor1", arg: 1, scope: !913, file: !69, line: 803, type: !6)
!917 = !DILocation(line: 803, column: 33, scope: !913)
!918 = !DILocalVariable(name: "factor2", arg: 2, scope: !913, file: !69, line: 803, type: !28)
!919 = !DILocation(line: 803, column: 46, scope: !913)
!920 = !DILocalVariable(name: "denominator", arg: 3, scope: !913, file: !69, line: 803, type: !28)
!921 = !DILocation(line: 803, column: 59, scope: !913)
!922 = !DILocalVariable(name: "s32Result", scope: !913, file: !69, line: 805, type: !16)
!923 = !DILocation(line: 805, column: 6, scope: !913)
!924 = !DILocalVariable(name: "s32Temp1", scope: !913, file: !69, line: 805, type: !16)
!925 = !DILocation(line: 805, column: 21, scope: !913)
!926 = !DILocation(line: 806, column: 14, scope: !913)
!927 = !DILocation(line: 806, column: 24, scope: !913)
!928 = !DILocation(line: 806, column: 22, scope: !913)
!929 = !DILocation(line: 806, column: 12, scope: !913)
!930 = !DILocation(line: 808, column: 5, scope: !931)
!931 = distinct !DILexicalBlock(scope: !913, file: !69, line: 808, column: 5)
!932 = !DILocation(line: 808, column: 17, scope: !931)
!933 = !DILocation(line: 808, column: 5, scope: !913)
!934 = !DILocation(line: 810, column: 6, scope: !935)
!935 = distinct !DILexicalBlock(scope: !936, file: !69, line: 810, column: 6)
!936 = distinct !DILexicalBlock(scope: !931, file: !69, line: 809, column: 2)
!937 = !DILocation(line: 810, column: 16, scope: !935)
!938 = !DILocation(line: 810, column: 6, scope: !936)
!939 = !DILocation(line: 812, column: 4, scope: !940)
!940 = distinct !DILexicalBlock(scope: !935, file: !69, line: 811, column: 3)
!941 = !DILocation(line: 816, column: 4, scope: !942)
!942 = distinct !DILexicalBlock(scope: !935, file: !69, line: 815, column: 3)
!943 = !DILocation(line: 821, column: 15, scope: !944)
!944 = distinct !DILexicalBlock(scope: !931, file: !69, line: 820, column: 2)
!945 = !DILocation(line: 821, column: 29, scope: !944)
!946 = !DILocation(line: 821, column: 39, scope: !944)
!947 = !DILocation(line: 821, column: 38, scope: !944)
!948 = !DILocation(line: 821, column: 54, scope: !944)
!949 = !DILocation(line: 821, column: 52, scope: !944)
!950 = !DILocation(line: 821, column: 25, scope: !944)
!951 = !DILocation(line: 821, column: 68, scope: !944)
!952 = !DILocation(line: 821, column: 12, scope: !944)
!953 = !DILocation(line: 822, column: 16, scope: !944)
!954 = !DILocation(line: 822, column: 25, scope: !944)
!955 = !DILocation(line: 822, column: 24, scope: !944)
!956 = !DILocation(line: 822, column: 41, scope: !944)
!957 = !DILocation(line: 822, column: 51, scope: !944)
!958 = !DILocation(line: 822, column: 50, scope: !944)
!959 = !DILocation(line: 822, column: 38, scope: !944)
!960 = !DILocation(line: 822, column: 13, scope: !944)
!961 = !DILocation(line: 823, column: 6, scope: !962)
!962 = distinct !DILexicalBlock(scope: !944, file: !69, line: 823, column: 6)
!963 = !DILocation(line: 823, column: 16, scope: !962)
!964 = !DILocation(line: 823, column: 6, scope: !944)
!965 = !DILocation(line: 825, column: 7, scope: !966)
!966 = distinct !DILexicalBlock(scope: !967, file: !69, line: 825, column: 7)
!967 = distinct !DILexicalBlock(scope: !962, file: !69, line: 824, column: 3)
!968 = !DILocation(line: 825, column: 17, scope: !966)
!969 = !DILocation(line: 825, column: 7, scope: !967)
!970 = !DILocation(line: 827, column: 17, scope: !971)
!971 = distinct !DILexicalBlock(scope: !966, file: !69, line: 826, column: 4)
!972 = !DILocation(line: 827, column: 12, scope: !971)
!973 = !DILocation(line: 827, column: 5, scope: !971)
!974 = !DILocation(line: 831, column: 5, scope: !975)
!975 = distinct !DILexicalBlock(scope: !966, file: !69, line: 830, column: 4)
!976 = !DILocation(line: 836, column: 4, scope: !977)
!977 = distinct !DILexicalBlock(scope: !962, file: !69, line: 835, column: 3)
!978 = !DILocation(line: 840, column: 1, scope: !913)
!979 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 858, type: !980, scopeLine: 859, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!980 = !DISubroutineType(types: !981)
!981 = !{!28, !28, !28, !28}
!982 = !DILocalVariable(name: "factor1", arg: 1, scope: !979, file: !69, line: 858, type: !28)
!983 = !DILocation(line: 858, column: 33, scope: !979)
!984 = !DILocalVariable(name: "factor2", arg: 2, scope: !979, file: !69, line: 858, type: !28)
!985 = !DILocation(line: 858, column: 46, scope: !979)
!986 = !DILocalVariable(name: "denominator", arg: 3, scope: !979, file: !69, line: 858, type: !28)
!987 = !DILocation(line: 858, column: 59, scope: !979)
!988 = !DILocalVariable(name: "u32Temp1", scope: !979, file: !69, line: 860, type: !524)
!989 = !DILocation(line: 860, column: 6, scope: !979)
!990 = !DILocalVariable(name: "u16TempDenom", scope: !979, file: !69, line: 861, type: !28)
!991 = !DILocation(line: 861, column: 6, scope: !979)
!992 = !DILocation(line: 863, column: 5, scope: !993)
!993 = distinct !DILexicalBlock(scope: !979, file: !69, line: 863, column: 5)
!994 = !DILocation(line: 863, column: 17, scope: !993)
!995 = !DILocation(line: 863, column: 5, scope: !979)
!996 = !DILocation(line: 865, column: 3, scope: !997)
!997 = distinct !DILexicalBlock(scope: !993, file: !69, line: 864, column: 2)
!998 = !DILocation(line: 869, column: 14, scope: !999)
!999 = distinct !DILexicalBlock(scope: !993, file: !69, line: 868, column: 2)
!1000 = !DILocation(line: 869, column: 24, scope: !999)
!1001 = !DILocation(line: 869, column: 22, scope: !999)
!1002 = !DILocation(line: 869, column: 12, scope: !999)
!1003 = !DILocation(line: 870, column: 18, scope: !999)
!1004 = !DILocation(line: 870, column: 30, scope: !999)
!1005 = !DILocation(line: 870, column: 16, scope: !999)
!1006 = !DILocation(line: 871, column: 14, scope: !999)
!1007 = !DILocation(line: 871, column: 25, scope: !999)
!1008 = !DILocation(line: 871, column: 23, scope: !999)
!1009 = !DILocation(line: 871, column: 12, scope: !999)
!1010 = !DILocation(line: 872, column: 14, scope: !999)
!1011 = !DILocation(line: 872, column: 25, scope: !999)
!1012 = !DILocation(line: 872, column: 23, scope: !999)
!1013 = !DILocation(line: 872, column: 12, scope: !999)
!1014 = !DILocation(line: 873, column: 6, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !999, file: !69, line: 873, column: 6)
!1016 = !DILocation(line: 873, column: 15, scope: !1015)
!1017 = !DILocation(line: 873, column: 6, scope: !999)
!1018 = !DILocation(line: 875, column: 12, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1015, file: !69, line: 874, column: 3)
!1020 = !DILocation(line: 875, column: 21, scope: !1019)
!1021 = !DILocation(line: 875, column: 11, scope: !1019)
!1022 = !DILocation(line: 875, column: 4, scope: !1019)
!1023 = !DILocation(line: 880, column: 4, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1015, file: !69, line: 879, column: 3)
!1025 = !DILocation(line: 885, column: 1, scope: !979)
!1026 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 902, type: !1027, scopeLine: 903, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1027 = !DISubroutineType(types: !1028)
!1028 = !{!28, !28, !28, !524}
!1029 = !DILocalVariable(name: "factor1", arg: 1, scope: !1026, file: !69, line: 902, type: !28)
!1030 = !DILocation(line: 902, column: 33, scope: !1026)
!1031 = !DILocalVariable(name: "factor2", arg: 2, scope: !1026, file: !69, line: 902, type: !28)
!1032 = !DILocation(line: 902, column: 46, scope: !1026)
!1033 = !DILocalVariable(name: "denominator", arg: 3, scope: !1026, file: !69, line: 902, type: !524)
!1034 = !DILocation(line: 902, column: 59, scope: !1026)
!1035 = !DILocalVariable(name: "u32Temp1", scope: !1026, file: !69, line: 904, type: !524)
!1036 = !DILocation(line: 904, column: 6, scope: !1026)
!1037 = !DILocation(line: 905, column: 5, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1026, file: !69, line: 905, column: 5)
!1039 = !DILocation(line: 905, column: 17, scope: !1038)
!1040 = !DILocation(line: 905, column: 5, scope: !1026)
!1041 = !DILocation(line: 907, column: 3, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1038, file: !69, line: 906, column: 2)
!1043 = !DILocation(line: 911, column: 15, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1038, file: !69, line: 910, column: 2)
!1045 = !DILocation(line: 911, column: 25, scope: !1044)
!1046 = !DILocation(line: 911, column: 23, scope: !1044)
!1047 = !DILocation(line: 911, column: 36, scope: !1044)
!1048 = !DILocation(line: 911, column: 34, scope: !1044)
!1049 = !DILocation(line: 911, column: 12, scope: !1044)
!1050 = !DILocation(line: 912, column: 8, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1044, file: !69, line: 912, column: 6)
!1052 = !DILocation(line: 912, column: 18, scope: !1051)
!1053 = !DILocation(line: 912, column: 16, scope: !1051)
!1054 = !DILocation(line: 912, column: 28, scope: !1051)
!1055 = !DILocation(line: 912, column: 40, scope: !1051)
!1056 = !DILocation(line: 912, column: 39, scope: !1051)
!1057 = !DILocation(line: 912, column: 26, scope: !1051)
!1058 = !DILocation(line: 912, column: 53, scope: !1051)
!1059 = !DILocation(line: 912, column: 64, scope: !1051)
!1060 = !DILocation(line: 912, column: 50, scope: !1051)
!1061 = !DILocation(line: 912, column: 6, scope: !1044)
!1062 = !DILocation(line: 914, column: 12, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1051, file: !69, line: 913, column: 3)
!1064 = !DILocation(line: 915, column: 3, scope: !1063)
!1065 = !DILocation(line: 916, column: 6, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1044, file: !69, line: 916, column: 6)
!1067 = !DILocation(line: 916, column: 15, scope: !1066)
!1068 = !DILocation(line: 916, column: 6, scope: !1044)
!1069 = !DILocation(line: 918, column: 12, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1066, file: !69, line: 917, column: 3)
!1071 = !DILocation(line: 918, column: 21, scope: !1070)
!1072 = !DILocation(line: 918, column: 11, scope: !1070)
!1073 = !DILocation(line: 918, column: 4, scope: !1070)
!1074 = !DILocation(line: 922, column: 4, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1066, file: !69, line: 921, column: 3)
!1076 = !DILocation(line: 925, column: 1, scope: !1026)
!1077 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 942, type: !1078, scopeLine: 943, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1078 = !DISubroutineType(types: !1079)
!1079 = !{!524, !524, !28}
!1080 = !DILocalVariable(name: "x_value", arg: 1, scope: !1077, file: !69, line: 942, type: !524)
!1081 = !DILocation(line: 942, column: 25, scope: !1077)
!1082 = !DILocalVariable(name: "y_value", arg: 2, scope: !1077, file: !69, line: 942, type: !28)
!1083 = !DILocation(line: 942, column: 38, scope: !1077)
!1084 = !DILocalVariable(name: "u32Temp1", scope: !1077, file: !69, line: 944, type: !524)
!1085 = !DILocation(line: 944, column: 6, scope: !1077)
!1086 = !DILocation(line: 945, column: 5, scope: !1087)
!1087 = distinct !DILexicalBlock(scope: !1077, file: !69, line: 945, column: 5)
!1088 = !DILocation(line: 945, column: 13, scope: !1087)
!1089 = !DILocation(line: 945, column: 5, scope: !1077)
!1090 = !DILocation(line: 947, column: 3, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1087, file: !69, line: 946, column: 2)
!1092 = !DILocation(line: 951, column: 15, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1087, file: !69, line: 950, column: 2)
!1094 = !DILocation(line: 951, column: 26, scope: !1093)
!1095 = !DILocation(line: 951, column: 34, scope: !1093)
!1096 = !DILocation(line: 951, column: 33, scope: !1093)
!1097 = !DILocation(line: 951, column: 45, scope: !1093)
!1098 = !DILocation(line: 951, column: 43, scope: !1093)
!1099 = !DILocation(line: 951, column: 23, scope: !1093)
!1100 = !DILocation(line: 951, column: 54, scope: !1093)
!1101 = !DILocation(line: 951, column: 12, scope: !1093)
!1102 = !DILocation(line: 952, column: 15, scope: !1093)
!1103 = !DILocation(line: 952, column: 23, scope: !1093)
!1104 = !DILocation(line: 952, column: 22, scope: !1093)
!1105 = !DILocation(line: 952, column: 35, scope: !1093)
!1106 = !DILocation(line: 952, column: 44, scope: !1093)
!1107 = !DILocation(line: 952, column: 43, scope: !1093)
!1108 = !DILocation(line: 952, column: 32, scope: !1093)
!1109 = !DILocation(line: 952, column: 12, scope: !1093)
!1110 = !DILocation(line: 953, column: 10, scope: !1093)
!1111 = !DILocation(line: 953, column: 3, scope: !1093)
!1112 = !DILocation(line: 955, column: 1, scope: !1077)
!1113 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 973, type: !1114, scopeLine: 974, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1114 = !DISubroutineType(types: !1115)
!1115 = !{!6, !6, !6, !6}
!1116 = !DILocalVariable(name: "fak1", arg: 1, scope: !1113, file: !69, line: 973, type: !6)
!1117 = !DILocation(line: 973, column: 33, scope: !1113)
!1118 = !DILocalVariable(name: "fak2", arg: 2, scope: !1113, file: !69, line: 973, type: !6)
!1119 = !DILocation(line: 973, column: 43, scope: !1113)
!1120 = !DILocalVariable(name: "div", arg: 3, scope: !1113, file: !69, line: 973, type: !6)
!1121 = !DILocation(line: 973, column: 53, scope: !1113)
!1122 = !DILocalVariable(name: "s32Temp1", scope: !1113, file: !69, line: 975, type: !16)
!1123 = !DILocation(line: 975, column: 6, scope: !1113)
!1124 = !DILocalVariable(name: "s32Temp2", scope: !1113, file: !69, line: 975, type: !16)
!1125 = !DILocation(line: 975, column: 20, scope: !1113)
!1126 = !DILocalVariable(name: "s32Temp3", scope: !1113, file: !69, line: 975, type: !16)
!1127 = !DILocation(line: 975, column: 34, scope: !1113)
!1128 = !DILocation(line: 976, column: 13, scope: !1113)
!1129 = !DILocation(line: 976, column: 20, scope: !1113)
!1130 = !DILocation(line: 976, column: 18, scope: !1113)
!1131 = !DILocation(line: 976, column: 11, scope: !1113)
!1132 = !DILocation(line: 977, column: 5, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1113, file: !69, line: 977, column: 5)
!1134 = !DILocation(line: 977, column: 9, scope: !1133)
!1135 = !DILocation(line: 977, column: 5, scope: !1113)
!1136 = !DILocation(line: 979, column: 6, scope: !1137)
!1137 = distinct !DILexicalBlock(scope: !1138, file: !69, line: 979, column: 6)
!1138 = distinct !DILexicalBlock(scope: !1133, file: !69, line: 978, column: 2)
!1139 = !DILocation(line: 979, column: 15, scope: !1137)
!1140 = !DILocation(line: 979, column: 6, scope: !1138)
!1141 = !DILocation(line: 981, column: 4, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1137, file: !69, line: 980, column: 3)
!1143 = !DILocation(line: 985, column: 4, scope: !1144)
!1144 = distinct !DILexicalBlock(scope: !1137, file: !69, line: 984, column: 3)
!1145 = !DILocation(line: 990, column: 15, scope: !1146)
!1146 = distinct !DILexicalBlock(scope: !1133, file: !69, line: 989, column: 2)
!1147 = !DILocation(line: 990, column: 28, scope: !1146)
!1148 = !DILocation(line: 990, column: 39, scope: !1146)
!1149 = !DILocation(line: 990, column: 37, scope: !1146)
!1150 = !DILocation(line: 990, column: 46, scope: !1146)
!1151 = !DILocation(line: 990, column: 44, scope: !1146)
!1152 = !DILocation(line: 990, column: 24, scope: !1146)
!1153 = !DILocation(line: 990, column: 52, scope: !1146)
!1154 = !DILocation(line: 990, column: 12, scope: !1146)
!1155 = !DILocation(line: 991, column: 15, scope: !1146)
!1156 = !DILocation(line: 991, column: 24, scope: !1146)
!1157 = !DILocation(line: 991, column: 23, scope: !1146)
!1158 = !DILocation(line: 991, column: 32, scope: !1146)
!1159 = !DILocation(line: 991, column: 41, scope: !1146)
!1160 = !DILocation(line: 991, column: 40, scope: !1146)
!1161 = !DILocation(line: 991, column: 29, scope: !1146)
!1162 = !DILocation(line: 991, column: 12, scope: !1146)
!1163 = !DILocation(line: 992, column: 6, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1146, file: !69, line: 992, column: 6)
!1165 = !DILocation(line: 992, column: 15, scope: !1164)
!1166 = !DILocation(line: 992, column: 6, scope: !1146)
!1167 = !DILocation(line: 994, column: 7, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1169, file: !69, line: 994, column: 7)
!1169 = distinct !DILexicalBlock(scope: !1164, file: !69, line: 993, column: 3)
!1170 = !DILocation(line: 994, column: 16, scope: !1168)
!1171 = !DILocation(line: 994, column: 7, scope: !1169)
!1172 = !DILocation(line: 996, column: 17, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1168, file: !69, line: 995, column: 4)
!1174 = !DILocation(line: 996, column: 12, scope: !1173)
!1175 = !DILocation(line: 996, column: 5, scope: !1173)
!1176 = !DILocation(line: 1000, column: 5, scope: !1177)
!1177 = distinct !DILexicalBlock(scope: !1168, file: !69, line: 999, column: 4)
!1178 = !DILocation(line: 1005, column: 4, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1164, file: !69, line: 1004, column: 3)
!1180 = !DILocation(line: 1008, column: 1, scope: !1113)
!1181 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1026, type: !1182, scopeLine: 1027, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1182 = !DISubroutineType(types: !1183)
!1183 = !{!6, !6, !6, !28}
!1184 = !DILocalVariable(name: "data1", arg: 1, scope: !1181, file: !69, line: 1026, type: !6)
!1185 = !DILocation(line: 1026, column: 33, scope: !1181)
!1186 = !DILocalVariable(name: "data2", arg: 2, scope: !1181, file: !69, line: 1026, type: !6)
!1187 = !DILocation(line: 1026, column: 43, scope: !1181)
!1188 = !DILocalVariable(name: "denominator", arg: 3, scope: !1181, file: !69, line: 1026, type: !28)
!1189 = !DILocation(line: 1026, column: 53, scope: !1181)
!1190 = !DILocalVariable(name: "s32Result", scope: !1181, file: !69, line: 1028, type: !16)
!1191 = !DILocation(line: 1028, column: 6, scope: !1181)
!1192 = !DILocalVariable(name: "s32Temp1", scope: !1181, file: !69, line: 1028, type: !16)
!1193 = !DILocation(line: 1028, column: 21, scope: !1181)
!1194 = !DILocation(line: 1029, column: 14, scope: !1181)
!1195 = !DILocation(line: 1029, column: 22, scope: !1181)
!1196 = !DILocation(line: 1029, column: 20, scope: !1181)
!1197 = !DILocation(line: 1029, column: 12, scope: !1181)
!1198 = !DILocation(line: 1031, column: 5, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1181, file: !69, line: 1031, column: 5)
!1200 = !DILocation(line: 1031, column: 17, scope: !1199)
!1201 = !DILocation(line: 1031, column: 5, scope: !1181)
!1202 = !DILocation(line: 1033, column: 6, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1204, file: !69, line: 1033, column: 6)
!1204 = distinct !DILexicalBlock(scope: !1199, file: !69, line: 1032, column: 2)
!1205 = !DILocation(line: 1033, column: 16, scope: !1203)
!1206 = !DILocation(line: 1033, column: 6, scope: !1204)
!1207 = !DILocation(line: 1035, column: 4, scope: !1208)
!1208 = distinct !DILexicalBlock(scope: !1203, file: !69, line: 1034, column: 3)
!1209 = !DILocation(line: 1037, column: 11, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1203, file: !69, line: 1037, column: 11)
!1211 = !DILocation(line: 1037, column: 21, scope: !1210)
!1212 = !DILocation(line: 1037, column: 11, scope: !1203)
!1213 = !DILocation(line: 1039, column: 4, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1210, file: !69, line: 1038, column: 3)
!1215 = !DILocation(line: 1043, column: 4, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1210, file: !69, line: 1042, column: 3)
!1217 = !DILocation(line: 1048, column: 15, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1199, file: !69, line: 1047, column: 2)
!1219 = !DILocation(line: 1048, column: 28, scope: !1218)
!1220 = !DILocation(line: 1048, column: 38, scope: !1218)
!1221 = !DILocation(line: 1048, column: 37, scope: !1218)
!1222 = !DILocation(line: 1048, column: 51, scope: !1218)
!1223 = !DILocation(line: 1048, column: 50, scope: !1218)
!1224 = !DILocation(line: 1048, column: 25, scope: !1218)
!1225 = !DILocation(line: 1048, column: 64, scope: !1218)
!1226 = !DILocation(line: 1048, column: 12, scope: !1218)
!1227 = !DILocation(line: 1049, column: 16, scope: !1218)
!1228 = !DILocation(line: 1049, column: 25, scope: !1218)
!1229 = !DILocation(line: 1049, column: 24, scope: !1218)
!1230 = !DILocation(line: 1049, column: 41, scope: !1218)
!1231 = !DILocation(line: 1049, column: 51, scope: !1218)
!1232 = !DILocation(line: 1049, column: 50, scope: !1218)
!1233 = !DILocation(line: 1049, column: 38, scope: !1218)
!1234 = !DILocation(line: 1049, column: 13, scope: !1218)
!1235 = !DILocation(line: 1050, column: 6, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1218, file: !69, line: 1050, column: 6)
!1237 = !DILocation(line: 1050, column: 16, scope: !1236)
!1238 = !DILocation(line: 1050, column: 6, scope: !1218)
!1239 = !DILocation(line: 1052, column: 7, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1241, file: !69, line: 1052, column: 7)
!1241 = distinct !DILexicalBlock(scope: !1236, file: !69, line: 1051, column: 3)
!1242 = !DILocation(line: 1052, column: 17, scope: !1240)
!1243 = !DILocation(line: 1052, column: 7, scope: !1241)
!1244 = !DILocation(line: 1054, column: 17, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1240, file: !69, line: 1053, column: 4)
!1246 = !DILocation(line: 1054, column: 12, scope: !1245)
!1247 = !DILocation(line: 1054, column: 5, scope: !1245)
!1248 = !DILocation(line: 1058, column: 5, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1240, file: !69, line: 1057, column: 4)
!1250 = !DILocation(line: 1063, column: 4, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1236, file: !69, line: 1062, column: 3)
!1252 = !DILocation(line: 1067, column: 1, scope: !1181)
!1253 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1084, type: !1254, scopeLine: 1085, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1254 = !DISubroutineType(types: !1255)
!1255 = !{!524, !524, !16}
!1256 = !DILocalVariable(name: "numerator", arg: 1, scope: !1253, file: !69, line: 1084, type: !524)
!1257 = !DILocation(line: 1084, column: 25, scope: !1253)
!1258 = !DILocalVariable(name: "denominator", arg: 2, scope: !1253, file: !69, line: 1084, type: !16)
!1259 = !DILocation(line: 1084, column: 40, scope: !1253)
!1260 = !DILocalVariable(name: "u32Temp1", scope: !1253, file: !69, line: 1086, type: !524)
!1261 = !DILocation(line: 1086, column: 6, scope: !1253)
!1262 = !DILocation(line: 1087, column: 5, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1253, file: !69, line: 1087, column: 5)
!1264 = !DILocation(line: 1087, column: 17, scope: !1263)
!1265 = !DILocation(line: 1087, column: 5, scope: !1253)
!1266 = !DILocation(line: 1089, column: 3, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1263, file: !69, line: 1088, column: 2)
!1268 = !DILocation(line: 1093, column: 6, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1270, file: !69, line: 1093, column: 6)
!1270 = distinct !DILexicalBlock(scope: !1263, file: !69, line: 1092, column: 2)
!1271 = !DILocation(line: 1093, column: 18, scope: !1269)
!1272 = !DILocation(line: 1093, column: 6, scope: !1270)
!1273 = !DILocation(line: 1095, column: 4, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1269, file: !69, line: 1094, column: 3)
!1275 = !DILocation(line: 1099, column: 16, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1269, file: !69, line: 1098, column: 3)
!1277 = !DILocation(line: 1099, column: 30, scope: !1276)
!1278 = !DILocation(line: 1099, column: 40, scope: !1276)
!1279 = !DILocation(line: 1099, column: 39, scope: !1276)
!1280 = !DILocation(line: 1099, column: 55, scope: !1276)
!1281 = !DILocation(line: 1099, column: 53, scope: !1276)
!1282 = !DILocation(line: 1099, column: 26, scope: !1276)
!1283 = !DILocation(line: 1099, column: 68, scope: !1276)
!1284 = !DILocation(line: 1099, column: 13, scope: !1276)
!1285 = !DILocation(line: 1100, column: 16, scope: !1276)
!1286 = !DILocation(line: 1100, column: 25, scope: !1276)
!1287 = !DILocation(line: 1100, column: 24, scope: !1276)
!1288 = !DILocation(line: 1100, column: 41, scope: !1276)
!1289 = !DILocation(line: 1100, column: 51, scope: !1276)
!1290 = !DILocation(line: 1100, column: 50, scope: !1276)
!1291 = !DILocation(line: 1100, column: 38, scope: !1276)
!1292 = !DILocation(line: 1100, column: 13, scope: !1276)
!1293 = !DILocation(line: 1101, column: 11, scope: !1276)
!1294 = !DILocation(line: 1101, column: 4, scope: !1276)
!1295 = !DILocation(line: 1104, column: 1, scope: !1253)
!1296 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1121, type: !1297, scopeLine: 1122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1297 = !DISubroutineType(types: !1298)
!1298 = !{!524, !16, !524}
!1299 = !DILocalVariable(name: "numerator", arg: 1, scope: !1296, file: !69, line: 1121, type: !16)
!1300 = !DILocation(line: 1121, column: 25, scope: !1296)
!1301 = !DILocalVariable(name: "denominator", arg: 2, scope: !1296, file: !69, line: 1121, type: !524)
!1302 = !DILocation(line: 1121, column: 40, scope: !1296)
!1303 = !DILocalVariable(name: "s32Temp1", scope: !1296, file: !69, line: 1123, type: !16)
!1304 = !DILocation(line: 1123, column: 6, scope: !1296)
!1305 = !DILocation(line: 1124, column: 5, scope: !1306)
!1306 = distinct !DILexicalBlock(scope: !1296, file: !69, line: 1124, column: 5)
!1307 = !DILocation(line: 1124, column: 17, scope: !1306)
!1308 = !DILocation(line: 1124, column: 5, scope: !1296)
!1309 = !DILocation(line: 1126, column: 6, scope: !1310)
!1310 = distinct !DILexicalBlock(scope: !1311, file: !69, line: 1126, column: 6)
!1311 = distinct !DILexicalBlock(scope: !1306, file: !69, line: 1125, column: 2)
!1312 = !DILocation(line: 1126, column: 16, scope: !1310)
!1313 = !DILocation(line: 1126, column: 6, scope: !1311)
!1314 = !DILocation(line: 1128, column: 4, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1310, file: !69, line: 1127, column: 3)
!1316 = !DILocation(line: 1132, column: 4, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1310, file: !69, line: 1131, column: 3)
!1318 = !DILocation(line: 1137, column: 6, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1320, file: !69, line: 1137, column: 6)
!1320 = distinct !DILexicalBlock(scope: !1306, file: !69, line: 1136, column: 2)
!1321 = !DILocation(line: 1137, column: 16, scope: !1319)
!1322 = !DILocation(line: 1137, column: 6, scope: !1320)
!1323 = !DILocation(line: 1139, column: 17, scope: !1324)
!1324 = distinct !DILexicalBlock(scope: !1319, file: !69, line: 1138, column: 3)
!1325 = !DILocation(line: 1139, column: 31, scope: !1324)
!1326 = !DILocation(line: 1139, column: 41, scope: !1324)
!1327 = !DILocation(line: 1139, column: 40, scope: !1324)
!1328 = !DILocation(line: 1139, column: 56, scope: !1324)
!1329 = !DILocation(line: 1139, column: 54, scope: !1324)
!1330 = !DILocation(line: 1139, column: 27, scope: !1324)
!1331 = !DILocation(line: 1139, column: 69, scope: !1324)
!1332 = !DILocation(line: 1139, column: 13, scope: !1324)
!1333 = !DILocation(line: 1140, column: 13, scope: !1324)
!1334 = !DILocation(line: 1140, column: 23, scope: !1324)
!1335 = !DILocation(line: 1140, column: 22, scope: !1324)
!1336 = !DILocation(line: 1140, column: 39, scope: !1324)
!1337 = !DILocation(line: 1140, column: 48, scope: !1324)
!1338 = !DILocation(line: 1140, column: 47, scope: !1324)
!1339 = !DILocation(line: 1140, column: 36, scope: !1324)
!1340 = !DILocation(line: 1140, column: 4, scope: !1324)
!1341 = !DILocation(line: 1144, column: 4, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1319, file: !69, line: 1143, column: 3)
!1343 = !DILocation(line: 1147, column: 1, scope: !1296)
!1344 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1164, type: !1345, scopeLine: 1165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1345 = !DISubroutineType(types: !1346)
!1346 = !{!524, !16, !16}
!1347 = !DILocalVariable(name: "numerator", arg: 1, scope: !1344, file: !69, line: 1164, type: !16)
!1348 = !DILocation(line: 1164, column: 25, scope: !1344)
!1349 = !DILocalVariable(name: "denominator", arg: 2, scope: !1344, file: !69, line: 1164, type: !16)
!1350 = !DILocation(line: 1164, column: 40, scope: !1344)
!1351 = !DILocalVariable(name: "u32Temp1", scope: !1344, file: !69, line: 1166, type: !524)
!1352 = !DILocation(line: 1166, column: 6, scope: !1344)
!1353 = !DILocalVariable(name: "u32Temp2", scope: !1344, file: !69, line: 1166, type: !524)
!1354 = !DILocation(line: 1166, column: 20, scope: !1344)
!1355 = !DILocation(line: 1167, column: 5, scope: !1356)
!1356 = distinct !DILexicalBlock(scope: !1344, file: !69, line: 1167, column: 5)
!1357 = !DILocation(line: 1167, column: 17, scope: !1356)
!1358 = !DILocation(line: 1167, column: 5, scope: !1344)
!1359 = !DILocation(line: 1169, column: 6, scope: !1360)
!1360 = distinct !DILexicalBlock(scope: !1361, file: !69, line: 1169, column: 6)
!1361 = distinct !DILexicalBlock(scope: !1356, file: !69, line: 1168, column: 2)
!1362 = !DILocation(line: 1169, column: 16, scope: !1360)
!1363 = !DILocation(line: 1169, column: 6, scope: !1361)
!1364 = !DILocation(line: 1171, column: 4, scope: !1365)
!1365 = distinct !DILexicalBlock(scope: !1360, file: !69, line: 1170, column: 3)
!1366 = !DILocation(line: 1175, column: 4, scope: !1367)
!1367 = distinct !DILexicalBlock(scope: !1360, file: !69, line: 1174, column: 3)
!1368 = !DILocation(line: 1180, column: 6, scope: !1369)
!1369 = distinct !DILexicalBlock(scope: !1370, file: !69, line: 1180, column: 6)
!1370 = distinct !DILexicalBlock(scope: !1356, file: !69, line: 1179, column: 2)
!1371 = !DILocation(line: 1180, column: 16, scope: !1369)
!1372 = !DILocation(line: 1180, column: 6, scope: !1370)
!1373 = !DILocation(line: 1182, column: 7, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1375, file: !69, line: 1182, column: 7)
!1375 = distinct !DILexicalBlock(scope: !1369, file: !69, line: 1181, column: 3)
!1376 = !DILocation(line: 1182, column: 17, scope: !1374)
!1377 = !DILocation(line: 1182, column: 7, scope: !1375)
!1378 = !DILocation(line: 1184, column: 5, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1374, file: !69, line: 1183, column: 4)
!1380 = !DILocation(line: 1188, column: 8, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1382, file: !69, line: 1188, column: 8)
!1382 = distinct !DILexicalBlock(scope: !1374, file: !69, line: 1187, column: 4)
!1383 = !DILocation(line: 1188, column: 20, scope: !1381)
!1384 = !DILocation(line: 1188, column: 8, scope: !1382)
!1385 = !DILocation(line: 1190, column: 6, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1381, file: !69, line: 1189, column: 5)
!1387 = !DILocation(line: 1194, column: 18, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1381, file: !69, line: 1193, column: 5)
!1389 = !DILocation(line: 1194, column: 32, scope: !1388)
!1390 = !DILocation(line: 1194, column: 42, scope: !1388)
!1391 = !DILocation(line: 1194, column: 41, scope: !1388)
!1392 = !DILocation(line: 1194, column: 57, scope: !1388)
!1393 = !DILocation(line: 1194, column: 55, scope: !1388)
!1394 = !DILocation(line: 1194, column: 28, scope: !1388)
!1395 = !DILocation(line: 1194, column: 71, scope: !1388)
!1396 = !DILocation(line: 1194, column: 15, scope: !1388)
!1397 = !DILocation(line: 1195, column: 18, scope: !1388)
!1398 = !DILocation(line: 1195, column: 29, scope: !1388)
!1399 = !DILocation(line: 1195, column: 27, scope: !1388)
!1400 = !DILocation(line: 1195, column: 45, scope: !1388)
!1401 = !DILocation(line: 1195, column: 57, scope: !1388)
!1402 = !DILocation(line: 1195, column: 55, scope: !1388)
!1403 = !DILocation(line: 1195, column: 42, scope: !1388)
!1404 = !DILocation(line: 1195, column: 15, scope: !1388)
!1405 = !DILocation(line: 1196, column: 13, scope: !1388)
!1406 = !DILocation(line: 1196, column: 6, scope: !1388)
!1407 = !DILocation(line: 1202, column: 7, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1409, file: !69, line: 1202, column: 7)
!1409 = distinct !DILexicalBlock(scope: !1369, file: !69, line: 1201, column: 3)
!1410 = !DILocation(line: 1202, column: 19, scope: !1408)
!1411 = !DILocation(line: 1202, column: 7, scope: !1409)
!1412 = !DILocation(line: 1204, column: 5, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !1408, file: !69, line: 1203, column: 4)
!1414 = !DILocation(line: 1208, column: 18, scope: !1415)
!1415 = distinct !DILexicalBlock(scope: !1408, file: !69, line: 1207, column: 4)
!1416 = !DILocation(line: 1208, column: 17, scope: !1415)
!1417 = !DILocation(line: 1208, column: 15, scope: !1415)
!1418 = !DILocation(line: 1209, column: 20, scope: !1415)
!1419 = !DILocation(line: 1209, column: 19, scope: !1415)
!1420 = !DILocation(line: 1209, column: 17, scope: !1415)
!1421 = !DILocation(line: 1210, column: 17, scope: !1415)
!1422 = !DILocation(line: 1210, column: 31, scope: !1415)
!1423 = !DILocation(line: 1210, column: 41, scope: !1415)
!1424 = !DILocation(line: 1210, column: 40, scope: !1415)
!1425 = !DILocation(line: 1210, column: 56, scope: !1415)
!1426 = !DILocation(line: 1210, column: 54, scope: !1415)
!1427 = !DILocation(line: 1210, column: 27, scope: !1415)
!1428 = !DILocation(line: 1210, column: 70, scope: !1415)
!1429 = !DILocation(line: 1210, column: 14, scope: !1415)
!1430 = !DILocation(line: 1211, column: 17, scope: !1415)
!1431 = !DILocation(line: 1211, column: 28, scope: !1415)
!1432 = !DILocation(line: 1211, column: 26, scope: !1415)
!1433 = !DILocation(line: 1211, column: 44, scope: !1415)
!1434 = !DILocation(line: 1211, column: 56, scope: !1415)
!1435 = !DILocation(line: 1211, column: 54, scope: !1415)
!1436 = !DILocation(line: 1211, column: 41, scope: !1415)
!1437 = !DILocation(line: 1211, column: 14, scope: !1415)
!1438 = !DILocation(line: 1212, column: 12, scope: !1415)
!1439 = !DILocation(line: 1212, column: 5, scope: !1415)
!1440 = !DILocation(line: 1217, column: 1, scope: !1344)
!1441 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1234, type: !1442, scopeLine: 1235, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1442 = !DISubroutineType(types: !1443)
!1443 = !{!524, !524, !524}
!1444 = !DILocalVariable(name: "numerator", arg: 1, scope: !1441, file: !69, line: 1234, type: !524)
!1445 = !DILocation(line: 1234, column: 25, scope: !1441)
!1446 = !DILocalVariable(name: "denominator", arg: 2, scope: !1441, file: !69, line: 1234, type: !524)
!1447 = !DILocation(line: 1234, column: 40, scope: !1441)
!1448 = !DILocalVariable(name: "u32Temp1", scope: !1441, file: !69, line: 1237, type: !524)
!1449 = !DILocation(line: 1237, column: 6, scope: !1441)
!1450 = !DILocalVariable(name: "u32Temp2", scope: !1441, file: !69, line: 1237, type: !524)
!1451 = !DILocation(line: 1237, column: 20, scope: !1441)
!1452 = !DILocalVariable(name: "u32Temp3", scope: !1441, file: !69, line: 1237, type: !524)
!1453 = !DILocation(line: 1237, column: 34, scope: !1441)
!1454 = !DILocalVariable(name: "numerator_old", scope: !1441, file: !69, line: 1237, type: !524)
!1455 = !DILocation(line: 1237, column: 48, scope: !1441)
!1456 = !DILocation(line: 1238, column: 5, scope: !1457)
!1457 = distinct !DILexicalBlock(scope: !1441, file: !69, line: 1238, column: 5)
!1458 = !DILocation(line: 1238, column: 16, scope: !1457)
!1459 = !DILocation(line: 1238, column: 5, scope: !1441)
!1460 = !DILocation(line: 1240, column: 3, scope: !1461)
!1461 = distinct !DILexicalBlock(scope: !1457, file: !69, line: 1239, column: 2)
!1462 = !DILocation(line: 1244, column: 14, scope: !1463)
!1463 = distinct !DILexicalBlock(scope: !1457, file: !69, line: 1243, column: 2)
!1464 = !DILocation(line: 1244, column: 26, scope: !1463)
!1465 = !DILocation(line: 1244, column: 41, scope: !1463)
!1466 = !DILocation(line: 1244, column: 51, scope: !1463)
!1467 = !DILocation(line: 1244, column: 50, scope: !1463)
!1468 = !DILocation(line: 1244, column: 38, scope: !1463)
!1469 = !DILocation(line: 1244, column: 24, scope: !1463)
!1470 = !DILocation(line: 1244, column: 12, scope: !1463)
!1471 = !DILocation(line: 1245, column: 7, scope: !1472)
!1472 = distinct !DILexicalBlock(scope: !1463, file: !69, line: 1245, column: 6)
!1473 = !DILocation(line: 1245, column: 16, scope: !1472)
!1474 = !DILocation(line: 1245, column: 24, scope: !1472)
!1475 = !DILocation(line: 1245, column: 6, scope: !1463)
!1476 = !DILocation(line: 1247, column: 16, scope: !1477)
!1477 = distinct !DILexicalBlock(scope: !1472, file: !69, line: 1246, column: 3)
!1478 = !DILocation(line: 1247, column: 27, scope: !1477)
!1479 = !DILocation(line: 1247, column: 13, scope: !1477)
!1480 = !DILocation(line: 1248, column: 3, scope: !1477)
!1481 = !DILocation(line: 1251, column: 16, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1472, file: !69, line: 1250, column: 3)
!1483 = !DILocation(line: 1251, column: 27, scope: !1482)
!1484 = !DILocation(line: 1251, column: 32, scope: !1482)
!1485 = !DILocation(line: 1251, column: 13, scope: !1482)
!1486 = !DILocation(line: 1254, column: 6, scope: !1487)
!1487 = distinct !DILexicalBlock(scope: !1463, file: !69, line: 1254, column: 6)
!1488 = !DILocation(line: 1254, column: 17, scope: !1487)
!1489 = !DILocation(line: 1254, column: 15, scope: !1487)
!1490 = !DILocation(line: 1254, column: 6, scope: !1463)
!1491 = !DILocation(line: 1256, column: 12, scope: !1492)
!1492 = distinct !DILexicalBlock(scope: !1487, file: !69, line: 1255, column: 3)
!1493 = !DILocation(line: 1256, column: 22, scope: !1492)
!1494 = !DILocation(line: 1256, column: 21, scope: !1492)
!1495 = !DILocation(line: 1256, column: 4, scope: !1492)
!1496 = !DILocation(line: 1260, column: 13, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1487, file: !69, line: 1259, column: 3)
!1498 = !DILocation(line: 1260, column: 23, scope: !1497)
!1499 = !DILocation(line: 1260, column: 22, scope: !1497)
!1500 = !DILocation(line: 1260, column: 36, scope: !1497)
!1501 = !DILocation(line: 1260, column: 4, scope: !1497)
!1502 = !DILocation(line: 1265, column: 1, scope: !1441)
!1503 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1282, type: !1504, scopeLine: 1283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1504 = !DISubroutineType(types: !1505)
!1505 = !{!16, !524, !16}
!1506 = !DILocalVariable(name: "numerator", arg: 1, scope: !1503, file: !69, line: 1282, type: !524)
!1507 = !DILocation(line: 1282, column: 25, scope: !1503)
!1508 = !DILocalVariable(name: "denominator", arg: 2, scope: !1503, file: !69, line: 1282, type: !16)
!1509 = !DILocation(line: 1282, column: 40, scope: !1503)
!1510 = !DILocalVariable(name: "u32Temp1", scope: !1503, file: !69, line: 1284, type: !524)
!1511 = !DILocation(line: 1284, column: 6, scope: !1503)
!1512 = !DILocalVariable(name: "u32Temp2", scope: !1503, file: !69, line: 1284, type: !524)
!1513 = !DILocation(line: 1284, column: 20, scope: !1503)
!1514 = !DILocation(line: 1285, column: 5, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1503, file: !69, line: 1285, column: 5)
!1516 = !DILocation(line: 1285, column: 17, scope: !1515)
!1517 = !DILocation(line: 1285, column: 5, scope: !1503)
!1518 = !DILocation(line: 1287, column: 6, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1520, file: !69, line: 1287, column: 6)
!1520 = distinct !DILexicalBlock(scope: !1515, file: !69, line: 1286, column: 2)
!1521 = !DILocation(line: 1287, column: 18, scope: !1519)
!1522 = !DILocation(line: 1287, column: 6, scope: !1520)
!1523 = !DILocation(line: 1289, column: 4, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1519, file: !69, line: 1288, column: 3)
!1525 = !DILocation(line: 1293, column: 19, scope: !1526)
!1526 = distinct !DILexicalBlock(scope: !1519, file: !69, line: 1292, column: 3)
!1527 = !DILocation(line: 1293, column: 18, scope: !1526)
!1528 = !DILocation(line: 1293, column: 16, scope: !1526)
!1529 = !DILocation(line: 1294, column: 16, scope: !1526)
!1530 = !DILocation(line: 1294, column: 30, scope: !1526)
!1531 = !DILocation(line: 1294, column: 40, scope: !1526)
!1532 = !DILocation(line: 1294, column: 39, scope: !1526)
!1533 = !DILocation(line: 1294, column: 55, scope: !1526)
!1534 = !DILocation(line: 1294, column: 53, scope: !1526)
!1535 = !DILocation(line: 1294, column: 26, scope: !1526)
!1536 = !DILocation(line: 1294, column: 69, scope: !1526)
!1537 = !DILocation(line: 1294, column: 13, scope: !1526)
!1538 = !DILocation(line: 1295, column: 16, scope: !1526)
!1539 = !DILocation(line: 1295, column: 25, scope: !1526)
!1540 = !DILocation(line: 1295, column: 24, scope: !1526)
!1541 = !DILocation(line: 1295, column: 41, scope: !1526)
!1542 = !DILocation(line: 1295, column: 51, scope: !1526)
!1543 = !DILocation(line: 1295, column: 50, scope: !1526)
!1544 = !DILocation(line: 1295, column: 38, scope: !1526)
!1545 = !DILocation(line: 1295, column: 13, scope: !1526)
!1546 = !DILocation(line: 1296, column: 7, scope: !1547)
!1547 = distinct !DILexicalBlock(scope: !1526, file: !69, line: 1296, column: 7)
!1548 = !DILocation(line: 1296, column: 16, scope: !1547)
!1549 = !DILocation(line: 1296, column: 7, scope: !1526)
!1550 = !DILocation(line: 1298, column: 13, scope: !1551)
!1551 = distinct !DILexicalBlock(scope: !1547, file: !69, line: 1297, column: 4)
!1552 = !DILocation(line: 1298, column: 12, scope: !1551)
!1553 = !DILocation(line: 1298, column: 5, scope: !1551)
!1554 = !DILocation(line: 1302, column: 5, scope: !1555)
!1555 = distinct !DILexicalBlock(scope: !1547, file: !69, line: 1301, column: 4)
!1556 = !DILocation(line: 1308, column: 15, scope: !1557)
!1557 = distinct !DILexicalBlock(scope: !1515, file: !69, line: 1307, column: 2)
!1558 = !DILocation(line: 1308, column: 29, scope: !1557)
!1559 = !DILocation(line: 1308, column: 39, scope: !1557)
!1560 = !DILocation(line: 1308, column: 38, scope: !1557)
!1561 = !DILocation(line: 1308, column: 54, scope: !1557)
!1562 = !DILocation(line: 1308, column: 52, scope: !1557)
!1563 = !DILocation(line: 1308, column: 25, scope: !1557)
!1564 = !DILocation(line: 1308, column: 68, scope: !1557)
!1565 = !DILocation(line: 1308, column: 12, scope: !1557)
!1566 = !DILocation(line: 1309, column: 15, scope: !1557)
!1567 = !DILocation(line: 1309, column: 24, scope: !1557)
!1568 = !DILocation(line: 1309, column: 23, scope: !1557)
!1569 = !DILocation(line: 1309, column: 40, scope: !1557)
!1570 = !DILocation(line: 1309, column: 50, scope: !1557)
!1571 = !DILocation(line: 1309, column: 49, scope: !1557)
!1572 = !DILocation(line: 1309, column: 37, scope: !1557)
!1573 = !DILocation(line: 1309, column: 12, scope: !1557)
!1574 = !DILocation(line: 1310, column: 6, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1557, file: !69, line: 1310, column: 6)
!1576 = !DILocation(line: 1310, column: 15, scope: !1575)
!1577 = !DILocation(line: 1310, column: 6, scope: !1557)
!1578 = !DILocation(line: 1312, column: 11, scope: !1579)
!1579 = distinct !DILexicalBlock(scope: !1575, file: !69, line: 1311, column: 3)
!1580 = !DILocation(line: 1312, column: 4, scope: !1579)
!1581 = !DILocation(line: 1316, column: 4, scope: !1582)
!1582 = distinct !DILexicalBlock(scope: !1575, file: !69, line: 1315, column: 3)
!1583 = !DILocation(line: 1319, column: 1, scope: !1503)
!1584 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1337, type: !1585, scopeLine: 1338, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1585 = !DISubroutineType(types: !1586)
!1586 = !{!16, !16, !524}
!1587 = !DILocalVariable(name: "numerator", arg: 1, scope: !1584, file: !69, line: 1337, type: !16)
!1588 = !DILocation(line: 1337, column: 25, scope: !1584)
!1589 = !DILocalVariable(name: "denominator", arg: 2, scope: !1584, file: !69, line: 1337, type: !524)
!1590 = !DILocation(line: 1337, column: 40, scope: !1584)
!1591 = !DILocalVariable(name: "s32Temp1", scope: !1584, file: !69, line: 1339, type: !16)
!1592 = !DILocation(line: 1339, column: 6, scope: !1584)
!1593 = !DILocalVariable(name: "s32Temp2", scope: !1584, file: !69, line: 1339, type: !16)
!1594 = !DILocation(line: 1339, column: 20, scope: !1584)
!1595 = !DILocalVariable(name: "u32Temp0", scope: !1584, file: !69, line: 1340, type: !524)
!1596 = !DILocation(line: 1340, column: 6, scope: !1584)
!1597 = !DILocalVariable(name: "u32Temp1", scope: !1584, file: !69, line: 1340, type: !524)
!1598 = !DILocation(line: 1340, column: 20, scope: !1584)
!1599 = !DILocalVariable(name: "u32Temp2", scope: !1584, file: !69, line: 1340, type: !524)
!1600 = !DILocation(line: 1340, column: 34, scope: !1584)
!1601 = !DILocation(line: 1341, column: 5, scope: !1602)
!1602 = distinct !DILexicalBlock(scope: !1584, file: !69, line: 1341, column: 5)
!1603 = !DILocation(line: 1341, column: 17, scope: !1602)
!1604 = !DILocation(line: 1341, column: 5, scope: !1584)
!1605 = !DILocation(line: 1343, column: 6, scope: !1606)
!1606 = distinct !DILexicalBlock(scope: !1607, file: !69, line: 1343, column: 6)
!1607 = distinct !DILexicalBlock(scope: !1602, file: !69, line: 1342, column: 2)
!1608 = !DILocation(line: 1343, column: 16, scope: !1606)
!1609 = !DILocation(line: 1343, column: 6, scope: !1607)
!1610 = !DILocation(line: 1345, column: 4, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1606, file: !69, line: 1344, column: 3)
!1612 = !DILocation(line: 1349, column: 4, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1606, file: !69, line: 1348, column: 3)
!1614 = !DILocation(line: 1354, column: 6, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1616, file: !69, line: 1354, column: 6)
!1616 = distinct !DILexicalBlock(scope: !1602, file: !69, line: 1353, column: 2)
!1617 = !DILocation(line: 1354, column: 16, scope: !1615)
!1618 = !DILocation(line: 1354, column: 6, scope: !1616)
!1619 = !DILocation(line: 1356, column: 16, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1615, file: !69, line: 1355, column: 3)
!1621 = !DILocation(line: 1356, column: 15, scope: !1620)
!1622 = !DILocation(line: 1356, column: 13, scope: !1620)
!1623 = !DILocation(line: 1357, column: 16, scope: !1620)
!1624 = !DILocation(line: 1357, column: 25, scope: !1620)
!1625 = !DILocation(line: 1357, column: 24, scope: !1620)
!1626 = !DILocation(line: 1357, column: 13, scope: !1620)
!1627 = !DILocation(line: 1358, column: 15, scope: !1620)
!1628 = !DILocation(line: 1358, column: 28, scope: !1620)
!1629 = !DILocation(line: 1358, column: 37, scope: !1620)
!1630 = !DILocation(line: 1358, column: 36, scope: !1620)
!1631 = !DILocation(line: 1358, column: 52, scope: !1620)
!1632 = !DILocation(line: 1358, column: 50, scope: !1620)
!1633 = !DILocation(line: 1358, column: 24, scope: !1620)
!1634 = !DILocation(line: 1358, column: 13, scope: !1620)
!1635 = !DILocation(line: 1360, column: 8, scope: !1636)
!1636 = distinct !DILexicalBlock(scope: !1620, file: !69, line: 1360, column: 7)
!1637 = !DILocation(line: 1360, column: 20, scope: !1636)
!1638 = !DILocation(line: 1360, column: 27, scope: !1636)
!1639 = !DILocation(line: 1360, column: 7, scope: !1620)
!1640 = !DILocation(line: 1362, column: 20, scope: !1641)
!1641 = distinct !DILexicalBlock(scope: !1636, file: !69, line: 1361, column: 4)
!1642 = !DILocation(line: 1362, column: 32, scope: !1641)
!1643 = !DILocation(line: 1362, column: 17, scope: !1641)
!1644 = !DILocation(line: 1363, column: 4, scope: !1641)
!1645 = !DILocation(line: 1366, column: 20, scope: !1646)
!1646 = distinct !DILexicalBlock(scope: !1636, file: !69, line: 1365, column: 4)
!1647 = !DILocation(line: 1366, column: 32, scope: !1646)
!1648 = !DILocation(line: 1366, column: 38, scope: !1646)
!1649 = !DILocation(line: 1366, column: 17, scope: !1646)
!1650 = !DILocation(line: 1370, column: 7, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1620, file: !69, line: 1370, column: 7)
!1652 = !DILocation(line: 1370, column: 18, scope: !1651)
!1653 = !DILocation(line: 1370, column: 16, scope: !1651)
!1654 = !DILocation(line: 1370, column: 7, scope: !1620)
!1655 = !DILocation(line: 1372, column: 14, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1651, file: !69, line: 1371, column: 4)
!1657 = !DILocation(line: 1372, column: 13, scope: !1656)
!1658 = !DILocation(line: 1372, column: 23, scope: !1656)
!1659 = !DILocation(line: 1372, column: 5, scope: !1656)
!1660 = !DILocation(line: 1376, column: 14, scope: !1661)
!1661 = distinct !DILexicalBlock(scope: !1651, file: !69, line: 1375, column: 4)
!1662 = !DILocation(line: 1376, column: 23, scope: !1661)
!1663 = !DILocation(line: 1376, column: 12, scope: !1661)
!1664 = !DILocation(line: 1376, column: 27, scope: !1661)
!1665 = !DILocation(line: 1376, column: 5, scope: !1661)
!1666 = !DILocation(line: 1383, column: 16, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1615, file: !69, line: 1382, column: 3)
!1668 = !DILocation(line: 1383, column: 30, scope: !1667)
!1669 = !DILocation(line: 1383, column: 40, scope: !1667)
!1670 = !DILocation(line: 1383, column: 39, scope: !1667)
!1671 = !DILocation(line: 1383, column: 55, scope: !1667)
!1672 = !DILocation(line: 1383, column: 53, scope: !1667)
!1673 = !DILocation(line: 1383, column: 26, scope: !1667)
!1674 = !DILocation(line: 1383, column: 69, scope: !1667)
!1675 = !DILocation(line: 1383, column: 13, scope: !1667)
!1676 = !DILocation(line: 1384, column: 16, scope: !1667)
!1677 = !DILocation(line: 1384, column: 26, scope: !1667)
!1678 = !DILocation(line: 1384, column: 25, scope: !1667)
!1679 = !DILocation(line: 1384, column: 42, scope: !1667)
!1680 = !DILocation(line: 1384, column: 51, scope: !1667)
!1681 = !DILocation(line: 1384, column: 50, scope: !1667)
!1682 = !DILocation(line: 1384, column: 39, scope: !1667)
!1683 = !DILocation(line: 1384, column: 13, scope: !1667)
!1684 = !DILocation(line: 1385, column: 11, scope: !1667)
!1685 = !DILocation(line: 1385, column: 4, scope: !1667)
!1686 = !DILocation(line: 1388, column: 1, scope: !1584)
!1687 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1405, type: !1688, scopeLine: 1406, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1688 = !DISubroutineType(types: !1689)
!1689 = !{!16, !16, !16}
!1690 = !DILocalVariable(name: "numerator", arg: 1, scope: !1687, file: !69, line: 1405, type: !16)
!1691 = !DILocation(line: 1405, column: 25, scope: !1687)
!1692 = !DILocalVariable(name: "denominator", arg: 2, scope: !1687, file: !69, line: 1405, type: !16)
!1693 = !DILocation(line: 1405, column: 40, scope: !1687)
!1694 = !DILocalVariable(name: "s32Temp1", scope: !1687, file: !69, line: 1407, type: !16)
!1695 = !DILocation(line: 1407, column: 6, scope: !1687)
!1696 = !DILocalVariable(name: "s32Temp2", scope: !1687, file: !69, line: 1407, type: !16)
!1697 = !DILocation(line: 1407, column: 20, scope: !1687)
!1698 = !DILocalVariable(name: "denominator_prime", scope: !1687, file: !69, line: 1408, type: !524)
!1699 = !DILocation(line: 1408, column: 6, scope: !1687)
!1700 = !DILocalVariable(name: "u32Temp1", scope: !1687, file: !69, line: 1408, type: !524)
!1701 = !DILocation(line: 1408, column: 29, scope: !1687)
!1702 = !DILocalVariable(name: "u32Temp2", scope: !1687, file: !69, line: 1408, type: !524)
!1703 = !DILocation(line: 1408, column: 43, scope: !1687)
!1704 = !DILocalVariable(name: "u32numerator", scope: !1687, file: !69, line: 1409, type: !524)
!1705 = !DILocation(line: 1409, column: 6, scope: !1687)
!1706 = !DILocalVariable(name: "u32denominator", scope: !1687, file: !69, line: 1409, type: !524)
!1707 = !DILocation(line: 1409, column: 23, scope: !1687)
!1708 = !DILocation(line: 1410, column: 5, scope: !1709)
!1709 = distinct !DILexicalBlock(scope: !1687, file: !69, line: 1410, column: 5)
!1710 = !DILocation(line: 1410, column: 15, scope: !1709)
!1711 = !DILocation(line: 1410, column: 5, scope: !1687)
!1712 = !DILocation(line: 1412, column: 6, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1714, file: !69, line: 1412, column: 6)
!1714 = distinct !DILexicalBlock(scope: !1709, file: !69, line: 1411, column: 2)
!1715 = !DILocation(line: 1412, column: 18, scope: !1713)
!1716 = !DILocation(line: 1412, column: 6, scope: !1714)
!1717 = !DILocation(line: 1414, column: 7, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1719, file: !69, line: 1414, column: 7)
!1719 = distinct !DILexicalBlock(scope: !1713, file: !69, line: 1413, column: 3)
!1720 = !DILocation(line: 1414, column: 19, scope: !1718)
!1721 = !DILocation(line: 1414, column: 7, scope: !1719)
!1722 = !DILocation(line: 1416, column: 5, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1718, file: !69, line: 1415, column: 4)
!1724 = !DILocation(line: 1420, column: 21, scope: !1725)
!1725 = distinct !DILexicalBlock(scope: !1718, file: !69, line: 1419, column: 4)
!1726 = !DILocation(line: 1420, column: 20, scope: !1725)
!1727 = !DILocation(line: 1420, column: 18, scope: !1725)
!1728 = !DILocation(line: 1421, column: 23, scope: !1725)
!1729 = !DILocation(line: 1421, column: 22, scope: !1725)
!1730 = !DILocation(line: 1421, column: 20, scope: !1725)
!1731 = !DILocation(line: 1422, column: 16, scope: !1725)
!1732 = !DILocation(line: 1422, column: 33, scope: !1725)
!1733 = !DILocation(line: 1422, column: 46, scope: !1725)
!1734 = !DILocation(line: 1422, column: 45, scope: !1725)
!1735 = !DILocation(line: 1422, column: 64, scope: !1725)
!1736 = !DILocation(line: 1422, column: 62, scope: !1725)
!1737 = !DILocation(line: 1422, column: 29, scope: !1725)
!1738 = !DILocation(line: 1422, column: 81, scope: !1725)
!1739 = !DILocation(line: 1422, column: 14, scope: !1725)
!1740 = !DILocation(line: 1423, column: 17, scope: !1725)
!1741 = !DILocation(line: 1423, column: 30, scope: !1725)
!1742 = !DILocation(line: 1423, column: 29, scope: !1725)
!1743 = !DILocation(line: 1423, column: 49, scope: !1725)
!1744 = !DILocation(line: 1423, column: 58, scope: !1725)
!1745 = !DILocation(line: 1423, column: 57, scope: !1725)
!1746 = !DILocation(line: 1423, column: 46, scope: !1725)
!1747 = !DILocation(line: 1423, column: 14, scope: !1725)
!1748 = !DILocation(line: 1424, column: 8, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !1725, file: !69, line: 1424, column: 8)
!1750 = !DILocation(line: 1424, column: 17, scope: !1749)
!1751 = !DILocation(line: 1424, column: 8, scope: !1725)
!1752 = !DILocation(line: 1426, column: 13, scope: !1753)
!1753 = distinct !DILexicalBlock(scope: !1749, file: !69, line: 1425, column: 5)
!1754 = !DILocation(line: 1426, column: 6, scope: !1753)
!1755 = !DILocation(line: 1430, column: 6, scope: !1756)
!1756 = distinct !DILexicalBlock(scope: !1749, file: !69, line: 1429, column: 5)
!1757 = !DILocation(line: 1436, column: 20, scope: !1758)
!1758 = distinct !DILexicalBlock(scope: !1713, file: !69, line: 1435, column: 3)
!1759 = !DILocation(line: 1436, column: 19, scope: !1758)
!1760 = !DILocation(line: 1436, column: 29, scope: !1758)
!1761 = !DILocation(line: 1436, column: 17, scope: !1758)
!1762 = !DILocation(line: 1437, column: 16, scope: !1758)
!1763 = !DILocation(line: 1437, column: 33, scope: !1758)
!1764 = !DILocation(line: 1437, column: 46, scope: !1758)
!1765 = !DILocation(line: 1437, column: 45, scope: !1758)
!1766 = !DILocation(line: 1437, column: 61, scope: !1758)
!1767 = !DILocation(line: 1437, column: 59, scope: !1758)
!1768 = !DILocation(line: 1437, column: 29, scope: !1758)
!1769 = !DILocation(line: 1437, column: 75, scope: !1758)
!1770 = !DILocation(line: 1437, column: 13, scope: !1758)
!1771 = !DILocation(line: 1438, column: 16, scope: !1758)
!1772 = !DILocation(line: 1438, column: 29, scope: !1758)
!1773 = !DILocation(line: 1438, column: 28, scope: !1758)
!1774 = !DILocation(line: 1438, column: 45, scope: !1758)
!1775 = !DILocation(line: 1438, column: 54, scope: !1758)
!1776 = !DILocation(line: 1438, column: 53, scope: !1758)
!1777 = !DILocation(line: 1438, column: 42, scope: !1758)
!1778 = !DILocation(line: 1438, column: 13, scope: !1758)
!1779 = !DILocation(line: 1439, column: 13, scope: !1758)
!1780 = !DILocation(line: 1439, column: 12, scope: !1758)
!1781 = !DILocation(line: 1439, column: 22, scope: !1758)
!1782 = !DILocation(line: 1439, column: 4, scope: !1758)
!1783 = !DILocation(line: 1444, column: 6, scope: !1784)
!1784 = distinct !DILexicalBlock(scope: !1785, file: !69, line: 1444, column: 6)
!1785 = distinct !DILexicalBlock(scope: !1709, file: !69, line: 1443, column: 2)
!1786 = !DILocation(line: 1444, column: 18, scope: !1784)
!1787 = !DILocation(line: 1444, column: 6, scope: !1785)
!1788 = !DILocation(line: 1446, column: 7, scope: !1789)
!1789 = distinct !DILexicalBlock(scope: !1790, file: !69, line: 1446, column: 7)
!1790 = distinct !DILexicalBlock(scope: !1784, file: !69, line: 1445, column: 3)
!1791 = !DILocation(line: 1446, column: 19, scope: !1789)
!1792 = !DILocation(line: 1446, column: 7, scope: !1790)
!1793 = !DILocation(line: 1448, column: 5, scope: !1794)
!1794 = distinct !DILexicalBlock(scope: !1789, file: !69, line: 1447, column: 4)
!1795 = !DILocation(line: 1452, column: 23, scope: !1796)
!1796 = distinct !DILexicalBlock(scope: !1789, file: !69, line: 1451, column: 4)
!1797 = !DILocation(line: 1452, column: 22, scope: !1796)
!1798 = !DILocation(line: 1452, column: 35, scope: !1796)
!1799 = !DILocation(line: 1452, column: 20, scope: !1796)
!1800 = !DILocation(line: 1453, column: 17, scope: !1796)
!1801 = !DILocation(line: 1453, column: 31, scope: !1796)
!1802 = !DILocation(line: 1453, column: 41, scope: !1796)
!1803 = !DILocation(line: 1453, column: 40, scope: !1796)
!1804 = !DILocation(line: 1453, column: 59, scope: !1796)
!1805 = !DILocation(line: 1453, column: 57, scope: !1796)
!1806 = !DILocation(line: 1453, column: 27, scope: !1796)
!1807 = !DILocation(line: 1453, column: 76, scope: !1796)
!1808 = !DILocation(line: 1453, column: 14, scope: !1796)
!1809 = !DILocation(line: 1454, column: 17, scope: !1796)
!1810 = !DILocation(line: 1454, column: 27, scope: !1796)
!1811 = !DILocation(line: 1454, column: 26, scope: !1796)
!1812 = !DILocation(line: 1454, column: 46, scope: !1796)
!1813 = !DILocation(line: 1454, column: 55, scope: !1796)
!1814 = !DILocation(line: 1454, column: 54, scope: !1796)
!1815 = !DILocation(line: 1454, column: 43, scope: !1796)
!1816 = !DILocation(line: 1454, column: 14, scope: !1796)
!1817 = !DILocation(line: 1455, column: 14, scope: !1796)
!1818 = !DILocation(line: 1455, column: 13, scope: !1796)
!1819 = !DILocation(line: 1455, column: 23, scope: !1796)
!1820 = !DILocation(line: 1455, column: 5, scope: !1796)
!1821 = !DILocation(line: 1460, column: 16, scope: !1822)
!1822 = distinct !DILexicalBlock(scope: !1784, file: !69, line: 1459, column: 3)
!1823 = !DILocation(line: 1460, column: 30, scope: !1822)
!1824 = !DILocation(line: 1460, column: 40, scope: !1822)
!1825 = !DILocation(line: 1460, column: 39, scope: !1822)
!1826 = !DILocation(line: 1460, column: 55, scope: !1822)
!1827 = !DILocation(line: 1460, column: 53, scope: !1822)
!1828 = !DILocation(line: 1460, column: 26, scope: !1822)
!1829 = !DILocation(line: 1460, column: 69, scope: !1822)
!1830 = !DILocation(line: 1460, column: 13, scope: !1822)
!1831 = !DILocation(line: 1461, column: 16, scope: !1822)
!1832 = !DILocation(line: 1461, column: 26, scope: !1822)
!1833 = !DILocation(line: 1461, column: 25, scope: !1822)
!1834 = !DILocation(line: 1461, column: 42, scope: !1822)
!1835 = !DILocation(line: 1461, column: 51, scope: !1822)
!1836 = !DILocation(line: 1461, column: 50, scope: !1822)
!1837 = !DILocation(line: 1461, column: 39, scope: !1822)
!1838 = !DILocation(line: 1461, column: 13, scope: !1822)
!1839 = !DILocation(line: 1462, column: 11, scope: !1822)
!1840 = !DILocation(line: 1462, column: 4, scope: !1822)
!1841 = !DILocation(line: 1465, column: 1, scope: !1687)
!1842 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1483, type: !1843, scopeLine: 1484, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1843 = !DISubroutineType(types: !1844)
!1844 = !{!6, !16, !524}
!1845 = !DILocalVariable(name: "numerator", arg: 1, scope: !1842, file: !69, line: 1483, type: !16)
!1846 = !DILocation(line: 1483, column: 25, scope: !1842)
!1847 = !DILocalVariable(name: "denominator", arg: 2, scope: !1842, file: !69, line: 1483, type: !524)
!1848 = !DILocation(line: 1483, column: 40, scope: !1842)
!1849 = !DILocalVariable(name: "numerator_prime", scope: !1842, file: !69, line: 1486, type: !524)
!1850 = !DILocation(line: 1486, column: 6, scope: !1842)
!1851 = !DILocalVariable(name: "u32Temp1", scope: !1842, file: !69, line: 1486, type: !524)
!1852 = !DILocation(line: 1486, column: 27, scope: !1842)
!1853 = !DILocalVariable(name: "u32Temp2", scope: !1842, file: !69, line: 1486, type: !524)
!1854 = !DILocation(line: 1486, column: 41, scope: !1842)
!1855 = !DILocalVariable(name: "u32Temp3", scope: !1842, file: !69, line: 1486, type: !524)
!1856 = !DILocation(line: 1486, column: 55, scope: !1842)
!1857 = !DILocalVariable(name: "s32Temp1", scope: !1842, file: !69, line: 1487, type: !16)
!1858 = !DILocation(line: 1487, column: 6, scope: !1842)
!1859 = !DILocalVariable(name: "s32Temp2", scope: !1842, file: !69, line: 1487, type: !16)
!1860 = !DILocation(line: 1487, column: 20, scope: !1842)
!1861 = !DILocalVariable(name: "s32Temp3", scope: !1842, file: !69, line: 1487, type: !16)
!1862 = !DILocation(line: 1487, column: 34, scope: !1842)
!1863 = !DILocation(line: 1488, column: 5, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1842, file: !69, line: 1488, column: 5)
!1865 = !DILocation(line: 1488, column: 17, scope: !1864)
!1866 = !DILocation(line: 1488, column: 5, scope: !1842)
!1867 = !DILocation(line: 1490, column: 6, scope: !1868)
!1868 = distinct !DILexicalBlock(scope: !1869, file: !69, line: 1490, column: 6)
!1869 = distinct !DILexicalBlock(scope: !1864, file: !69, line: 1489, column: 2)
!1870 = !DILocation(line: 1490, column: 15, scope: !1868)
!1871 = !DILocation(line: 1490, column: 6, scope: !1869)
!1872 = !DILocation(line: 1492, column: 4, scope: !1873)
!1873 = distinct !DILexicalBlock(scope: !1868, file: !69, line: 1491, column: 3)
!1874 = !DILocation(line: 1496, column: 4, scope: !1875)
!1875 = distinct !DILexicalBlock(scope: !1868, file: !69, line: 1495, column: 3)
!1876 = !DILocation(line: 1501, column: 6, scope: !1877)
!1877 = distinct !DILexicalBlock(scope: !1878, file: !69, line: 1501, column: 6)
!1878 = distinct !DILexicalBlock(scope: !1864, file: !69, line: 1500, column: 2)
!1879 = !DILocation(line: 1501, column: 16, scope: !1877)
!1880 = !DILocation(line: 1501, column: 6, scope: !1878)
!1881 = !DILocation(line: 1503, column: 23, scope: !1882)
!1882 = distinct !DILexicalBlock(scope: !1877, file: !69, line: 1502, column: 3)
!1883 = !DILocation(line: 1503, column: 22, scope: !1882)
!1884 = !DILocation(line: 1503, column: 20, scope: !1882)
!1885 = !DILocation(line: 1504, column: 16, scope: !1882)
!1886 = !DILocation(line: 1504, column: 32, scope: !1882)
!1887 = !DILocation(line: 1504, column: 31, scope: !1882)
!1888 = !DILocation(line: 1504, column: 13, scope: !1882)
!1889 = !DILocation(line: 1505, column: 15, scope: !1882)
!1890 = !DILocation(line: 1505, column: 34, scope: !1882)
!1891 = !DILocation(line: 1505, column: 45, scope: !1882)
!1892 = !DILocation(line: 1505, column: 43, scope: !1882)
!1893 = !DILocation(line: 1505, column: 31, scope: !1882)
!1894 = !DILocation(line: 1505, column: 13, scope: !1882)
!1895 = !DILocation(line: 1507, column: 8, scope: !1896)
!1896 = distinct !DILexicalBlock(scope: !1882, file: !69, line: 1507, column: 7)
!1897 = !DILocation(line: 1507, column: 20, scope: !1896)
!1898 = !DILocation(line: 1507, column: 27, scope: !1896)
!1899 = !DILocation(line: 1507, column: 7, scope: !1882)
!1900 = !DILocation(line: 1509, column: 19, scope: !1901)
!1901 = distinct !DILexicalBlock(scope: !1896, file: !69, line: 1508, column: 4)
!1902 = !DILocation(line: 1509, column: 31, scope: !1901)
!1903 = !DILocation(line: 1509, column: 17, scope: !1901)
!1904 = !DILocation(line: 1510, column: 4, scope: !1901)
!1905 = !DILocation(line: 1513, column: 20, scope: !1906)
!1906 = distinct !DILexicalBlock(scope: !1896, file: !69, line: 1512, column: 4)
!1907 = !DILocation(line: 1513, column: 32, scope: !1906)
!1908 = !DILocation(line: 1513, column: 38, scope: !1906)
!1909 = !DILocation(line: 1513, column: 17, scope: !1906)
!1910 = !DILocation(line: 1516, column: 7, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1882, file: !69, line: 1516, column: 7)
!1912 = !DILocation(line: 1516, column: 18, scope: !1911)
!1913 = !DILocation(line: 1516, column: 16, scope: !1911)
!1914 = !DILocation(line: 1516, column: 7, scope: !1882)
!1915 = !DILocation(line: 1518, column: 18, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1911, file: !69, line: 1517, column: 4)
!1917 = !DILocation(line: 1518, column: 16, scope: !1916)
!1918 = !DILocation(line: 1518, column: 28, scope: !1916)
!1919 = !DILocation(line: 1518, column: 14, scope: !1916)
!1920 = !DILocation(line: 1519, column: 4, scope: !1916)
!1921 = !DILocation(line: 1522, column: 18, scope: !1922)
!1922 = distinct !DILexicalBlock(scope: !1911, file: !69, line: 1521, column: 4)
!1923 = !DILocation(line: 1522, column: 26, scope: !1922)
!1924 = !DILocation(line: 1522, column: 16, scope: !1922)
!1925 = !DILocation(line: 1522, column: 30, scope: !1922)
!1926 = !DILocation(line: 1522, column: 14, scope: !1922)
!1927 = !DILocation(line: 1524, column: 8, scope: !1928)
!1928 = distinct !DILexicalBlock(scope: !1882, file: !69, line: 1524, column: 7)
!1929 = !DILocation(line: 1524, column: 18, scope: !1928)
!1930 = !DILocation(line: 1524, column: 7, scope: !1882)
!1931 = !DILocation(line: 1526, column: 18, scope: !1932)
!1932 = distinct !DILexicalBlock(scope: !1928, file: !69, line: 1525, column: 4)
!1933 = !DILocation(line: 1526, column: 12, scope: !1932)
!1934 = !DILocation(line: 1526, column: 5, scope: !1932)
!1935 = !DILocation(line: 1530, column: 5, scope: !1936)
!1936 = distinct !DILexicalBlock(scope: !1928, file: !69, line: 1529, column: 4)
!1937 = !DILocation(line: 1535, column: 16, scope: !1938)
!1938 = distinct !DILexicalBlock(scope: !1877, file: !69, line: 1534, column: 3)
!1939 = !DILocation(line: 1535, column: 26, scope: !1938)
!1940 = !DILocation(line: 1535, column: 25, scope: !1938)
!1941 = !DILocation(line: 1535, column: 41, scope: !1938)
!1942 = !DILocation(line: 1535, column: 39, scope: !1938)
!1943 = !DILocation(line: 1535, column: 13, scope: !1938)
!1944 = !DILocation(line: 1536, column: 16, scope: !1938)
!1945 = !DILocation(line: 1536, column: 30, scope: !1938)
!1946 = !DILocation(line: 1536, column: 40, scope: !1938)
!1947 = !DILocation(line: 1536, column: 39, scope: !1938)
!1948 = !DILocation(line: 1536, column: 55, scope: !1938)
!1949 = !DILocation(line: 1536, column: 53, scope: !1938)
!1950 = !DILocation(line: 1536, column: 26, scope: !1938)
!1951 = !DILocation(line: 1536, column: 68, scope: !1938)
!1952 = !DILocation(line: 1536, column: 13, scope: !1938)
!1953 = !DILocation(line: 1537, column: 16, scope: !1938)
!1954 = !DILocation(line: 1537, column: 25, scope: !1938)
!1955 = !DILocation(line: 1537, column: 24, scope: !1938)
!1956 = !DILocation(line: 1537, column: 41, scope: !1938)
!1957 = !DILocation(line: 1537, column: 51, scope: !1938)
!1958 = !DILocation(line: 1537, column: 50, scope: !1938)
!1959 = !DILocation(line: 1537, column: 38, scope: !1938)
!1960 = !DILocation(line: 1537, column: 13, scope: !1938)
!1961 = !DILocation(line: 1538, column: 7, scope: !1962)
!1962 = distinct !DILexicalBlock(scope: !1938, file: !69, line: 1538, column: 7)
!1963 = !DILocation(line: 1538, column: 16, scope: !1962)
!1964 = !DILocation(line: 1538, column: 7, scope: !1938)
!1965 = !DILocation(line: 1540, column: 17, scope: !1966)
!1966 = distinct !DILexicalBlock(scope: !1962, file: !69, line: 1539, column: 4)
!1967 = !DILocation(line: 1540, column: 12, scope: !1966)
!1968 = !DILocation(line: 1540, column: 5, scope: !1966)
!1969 = !DILocation(line: 1544, column: 5, scope: !1970)
!1970 = distinct !DILexicalBlock(scope: !1962, file: !69, line: 1543, column: 4)
!1971 = !DILocation(line: 1548, column: 1, scope: !1842)
!1972 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1973, file: !1973, line: 12, type: !1974, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !1977)
!1973 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1974 = !DISubroutineType(types: !1975)
!1975 = !{null, !1976}
!1976 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1977 = !{!1978}
!1978 = !DILocalVariable(name: "z", arg: 1, scope: !1972, file: !1973, line: 12, type: !1976)
!1979 = !DILocation(line: 0, scope: !1972)
!1980 = !DILocation(line: 13, column: 9, scope: !1981)
!1981 = distinct !DILexicalBlock(scope: !1972, file: !1973, line: 13, column: 7)
!1982 = !DILocation(line: 13, column: 7, scope: !1972)
!1983 = !DILocation(line: 14, column: 5, scope: !1981)
!1984 = !DILocation(line: 15, column: 1, scope: !1972)
!1985 = distinct !DISubprogram(name: "klee_overshift_check", scope: !1986, file: !1986, line: 20, type: !1987, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !1990)
!1986 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!1987 = !DISubroutineType(types: !1988)
!1988 = !{null, !1989, !1989}
!1989 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!1990 = !{!1991, !1992}
!1991 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !1985, file: !1986, line: 20, type: !1989)
!1992 = !DILocalVariable(name: "shift", arg: 2, scope: !1985, file: !1986, line: 20, type: !1989)
!1993 = !DILocation(line: 0, scope: !1985)
!1994 = !DILocation(line: 21, column: 13, scope: !1995)
!1995 = distinct !DILexicalBlock(scope: !1985, file: !1986, line: 21, column: 7)
!1996 = !DILocation(line: 21, column: 7, scope: !1985)
!1997 = !DILocation(line: 27, column: 5, scope: !1998)
!1998 = distinct !DILexicalBlock(scope: !1995, file: !1986, line: 21, column: 26)
!1999 = !DILocation(line: 29, column: 1, scope: !1985)
