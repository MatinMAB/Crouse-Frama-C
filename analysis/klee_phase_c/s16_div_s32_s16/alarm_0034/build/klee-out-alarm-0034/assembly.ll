; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0034/build/s16_div_s32_s16_alarm_0034.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [140 x i8] c"KLEE-ALARM-0034: signed overflow. assert (s32)(s32Temp1 - (s32)((s32)(s32Temp1 / (s32)denominator) * (s32)denominator)) << 1 <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0034.err\00", align 1
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
  br i1 %cmp6, label %if.then8, label %if.else90, !dbg !216

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
  %call14 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv13), !dbg !236
  %tobool15 = icmp ne i32 %call14, 0, !dbg !236
  br i1 %tobool15, label %if.end17, label %if.then16, !dbg !237

if.then16:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !238
  br label %return, !dbg !238

if.end17:                                         ; preds = %if.end
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !240
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !242
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !243
  %conv18 = sext i16 %11 to i32, !dbg !244
  %int_cast_to_i641 = zext i32 %conv18 to i64, !dbg !245
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !245
  %div19 = sdiv i32 %10, %conv18, !dbg !245, !klee.check.div !106
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !246
  %conv20 = sext i16 %12 to i32, !dbg !247
  %mul21 = mul nsw i32 %div19, %conv20, !dbg !248
  %sub22 = sub nsw i32 %9, %mul21, !dbg !249
  %conv23 = sext i32 %sub22 to i64, !dbg !250
  %call24 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv23, i32 1), !dbg !251
  %tobool25 = icmp ne i32 %call24, 0, !dbg !251
  br i1 %tobool25, label %if.end27, label %if.then26, !dbg !252

if.then26:                                        ; preds = %if.end17
  store i16 0, i16* %retval, align 2, !dbg !253
  br label %return, !dbg !253

if.end27:                                         ; preds = %if.end17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !255
  %14 = load i16, i16* %denominator.addr, align 2, !dbg !257
  %conv28 = sext i16 %14 to i32, !dbg !258
  %int_cast_to_i642 = zext i32 %conv28 to i64, !dbg !259
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !259
  %div29 = sdiv i32 %13, %conv28, !dbg !259, !klee.check.div !106
  %conv30 = sext i32 %div29 to i64, !dbg !260
  %15 = load i16, i16* %denominator.addr, align 2, !dbg !261
  %conv31 = sext i16 %15 to i32, !dbg !262
  %conv32 = sext i32 %conv31 to i64, !dbg !263
  %call33 = call i32 @klee_alarm_s32_mul_upper(i64 %conv30, i64 %conv32), !dbg !264
  %tobool34 = icmp ne i32 %call33, 0, !dbg !264
  br i1 %tobool34, label %if.end36, label %if.then35, !dbg !265

if.then35:                                        ; preds = %if.end27
  store i16 0, i16* %retval, align 2, !dbg !266
  br label %return, !dbg !266

if.end36:                                         ; preds = %if.end27
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !268
  %17 = load i16, i16* %denominator.addr, align 2, !dbg !270
  %conv37 = sext i16 %17 to i32, !dbg !271
  %int_cast_to_i643 = zext i32 %conv37 to i64, !dbg !272
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !272
  %div38 = sdiv i32 %16, %conv37, !dbg !272, !klee.check.div !106
  %conv39 = sext i32 %div38 to i64, !dbg !273
  %18 = load i16, i16* %denominator.addr, align 2, !dbg !274
  %conv40 = sext i16 %18 to i32, !dbg !275
  %conv41 = sext i32 %conv40 to i64, !dbg !276
  %call42 = call i32 @klee_alarm_s32_mul_lower(i64 %conv39, i64 %conv41), !dbg !277
  %tobool43 = icmp ne i32 %call42, 0, !dbg !277
  br i1 %tobool43, label %if.end45, label %if.then44, !dbg !278

if.then44:                                        ; preds = %if.end36
  store i16 0, i16* %retval, align 2, !dbg !279
  br label %return, !dbg !279

if.end45:                                         ; preds = %if.end36
  %19 = load i32, i32* %s32Temp1, align 4, !dbg !281
  %20 = load i32, i32* %s32Temp1, align 4, !dbg !282
  %21 = load i16, i16* %denominator.addr, align 2, !dbg !283
  %conv46 = sext i16 %21 to i32, !dbg !283
  %int_cast_to_i644 = zext i32 %conv46 to i64, !dbg !284
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !284
  %div47 = sdiv i32 %20, %conv46, !dbg !284, !klee.check.div !106
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !285
  %conv48 = sext i16 %22 to i32, !dbg !285
  %mul49 = mul nsw i32 %div47, %conv48, !dbg !286
  %sub50 = sub nsw i32 %19, %mul49, !dbg !287
  %shl = shl i32 %sub50, 1, !dbg !288
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !289
  %23 = load i16, i16* %denominator.addr, align 2, !dbg !290
  %conv51 = sext i16 %23 to i64, !dbg !292
  %call52 = call i32 @klee_alarm_divisor_nonzero(i64 %conv51), !dbg !293
  %tobool53 = icmp ne i32 %call52, 0, !dbg !293
  br i1 %tobool53, label %if.end55, label %if.then54, !dbg !294

if.then54:                                        ; preds = %if.end45
  store i16 0, i16* %retval, align 2, !dbg !295
  br label %return, !dbg !295

if.end55:                                         ; preds = %if.end45
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !297
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !298
  %conv56 = sext i16 %25 to i32, !dbg !298
  %int_cast_to_i645 = zext i32 %conv56 to i64, !dbg !299
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !299
  %div57 = sdiv i32 %24, %conv56, !dbg !299, !klee.check.div !106
  store i32 %div57, i32* %s32Temp1, align 4, !dbg !300
  %26 = load i16, i16* %denominator.addr, align 2, !dbg !301
  %conv58 = sext i16 %26 to i64, !dbg !303
  %call59 = call i32 @klee_alarm_divisor_nonzero(i64 %conv58), !dbg !304
  %tobool60 = icmp ne i32 %call59, 0, !dbg !304
  br i1 %tobool60, label %if.end62, label %if.then61, !dbg !305

if.then61:                                        ; preds = %if.end55
  store i16 0, i16* %retval, align 2, !dbg !306
  br label %return, !dbg !306

if.end62:                                         ; preds = %if.end55
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !308
  %conv63 = sext i32 %27 to i64, !dbg !310
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !311
  %29 = load i16, i16* %denominator.addr, align 2, !dbg !312
  %conv64 = sext i16 %29 to i32, !dbg !313
  %int_cast_to_i646 = zext i32 %conv64 to i64, !dbg !314
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !314
  %div65 = sdiv i32 %28, %conv64, !dbg !314, !klee.check.div !106
  %conv66 = sext i32 %div65 to i64, !dbg !315
  %call67 = call i32 @klee_alarm_s32_add_lower(i64 %conv63, i64 %conv66), !dbg !316
  %tobool68 = icmp ne i32 %call67, 0, !dbg !316
  br i1 %tobool68, label %if.end70, label %if.then69, !dbg !317

if.then69:                                        ; preds = %if.end62
  store i16 0, i16* %retval, align 2, !dbg !318
  br label %return, !dbg !318

if.end70:                                         ; preds = %if.end62
  %30 = load i32, i32* %s32Temp1, align 4, !dbg !320
  %conv71 = sext i32 %30 to i64, !dbg !322
  %31 = load i32, i32* %numerator.addr, align 4, !dbg !323
  %32 = load i16, i16* %denominator.addr, align 2, !dbg !324
  %conv72 = sext i16 %32 to i32, !dbg !325
  %int_cast_to_i647 = zext i32 %conv72 to i64, !dbg !326
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !326
  %div73 = sdiv i32 %31, %conv72, !dbg !326, !klee.check.div !106
  %conv74 = sext i32 %div73 to i64, !dbg !327
  %call75 = call i32 @klee_alarm_s32_add_upper(i64 %conv71, i64 %conv74), !dbg !328
  %tobool76 = icmp ne i32 %call75, 0, !dbg !328
  br i1 %tobool76, label %if.end78, label %if.then77, !dbg !329

if.then77:                                        ; preds = %if.end70
  store i16 0, i16* %retval, align 2, !dbg !330
  br label %return, !dbg !330

if.end78:                                         ; preds = %if.end70
  %33 = load i32, i32* %s32Temp1, align 4, !dbg !332
  %34 = load i32, i32* %numerator.addr, align 4, !dbg !333
  %35 = load i16, i16* %denominator.addr, align 2, !dbg !334
  %conv79 = sext i16 %35 to i32, !dbg !334
  %int_cast_to_i648 = zext i32 %conv79 to i64, !dbg !335
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !335
  %div80 = sdiv i32 %34, %conv79, !dbg !335, !klee.check.div !106
  %add = add nsw i32 %33, %div80, !dbg !336
  store i32 %add, i32* %s32Temp1, align 4, !dbg !337
  %36 = load i32, i32* %s32Temp1, align 4, !dbg !338
  %cmp81 = icmp slt i32 %36, 32767, !dbg !340
  br i1 %cmp81, label %if.then83, label %if.else89, !dbg !341

if.then83:                                        ; preds = %if.end78
  %37 = load i32, i32* %s32Temp1, align 4, !dbg !342
  %cmp84 = icmp sgt i32 %37, -32768, !dbg !345
  br i1 %cmp84, label %if.then86, label %if.else88, !dbg !346

if.then86:                                        ; preds = %if.then83
  %38 = load i32, i32* %s32Temp1, align 4, !dbg !347
  %conv87 = trunc i32 %38 to i16, !dbg !349
  store i16 %conv87, i16* %retval, align 2, !dbg !350
  br label %return, !dbg !350

if.else88:                                        ; preds = %if.then83
  store i16 -32768, i16* %retval, align 2, !dbg !351
  br label %return, !dbg !351

if.else89:                                        ; preds = %if.end78
  store i16 32767, i16* %retval, align 2, !dbg !353
  br label %return, !dbg !353

if.else90:                                        ; preds = %if.else5
  %39 = load i16, i16* %denominator.addr, align 2, !dbg !355
  %conv91 = sext i16 %39 to i32, !dbg !355
  %cmp92 = icmp ne i32 %conv91, -1, !dbg !358
  br i1 %cmp92, label %if.then94, label %if.else152, !dbg !359

if.then94:                                        ; preds = %if.else90
  %40 = load i16, i16* %denominator.addr, align 2, !dbg !360
  %conv95 = sext i16 %40 to i64, !dbg !363
  %call96 = call i32 @klee_alarm_divisor_nonzero(i64 %conv95), !dbg !364
  %tobool97 = icmp ne i32 %call96, 0, !dbg !364
  br i1 %tobool97, label %if.end99, label %if.then98, !dbg !365

if.then98:                                        ; preds = %if.then94
  store i16 0, i16* %retval, align 2, !dbg !366
  br label %return, !dbg !366

if.end99:                                         ; preds = %if.then94
  %41 = load i32, i32* %s32Temp1, align 4, !dbg !368
  %42 = load i32, i32* %s32Temp1, align 4, !dbg !370
  %43 = load i16, i16* %denominator.addr, align 2, !dbg !371
  %conv100 = sext i16 %43 to i32, !dbg !372
  %int_cast_to_i649 = zext i32 %conv100 to i64, !dbg !373
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !373
  %div101 = sdiv i32 %42, %conv100, !dbg !373, !klee.check.div !106
  %44 = load i16, i16* %denominator.addr, align 2, !dbg !374
  %conv102 = sext i16 %44 to i32, !dbg !375
  %mul103 = mul nsw i32 %div101, %conv102, !dbg !376
  %sub104 = sub nsw i32 %41, %mul103, !dbg !377
  %conv105 = sext i32 %sub104 to i64, !dbg !378
  %call106 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv105), !dbg !379
  %tobool107 = icmp ne i32 %call106, 0, !dbg !379
  br i1 %tobool107, label %if.end109, label %if.then108, !dbg !380

if.then108:                                       ; preds = %if.end99
  store i16 0, i16* %retval, align 2, !dbg !381
  br label %return, !dbg !381

if.end109:                                        ; preds = %if.end99
  %45 = load i32, i32* %s32Temp1, align 4, !dbg !383
  %46 = load i16, i16* %denominator.addr, align 2, !dbg !385
  %conv110 = sext i16 %46 to i32, !dbg !386
  %int_cast_to_i6410 = zext i32 %conv110 to i64, !dbg !387
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !387
  %div111 = sdiv i32 %45, %conv110, !dbg !387, !klee.check.div !106
  %conv112 = sext i32 %div111 to i64, !dbg !388
  %47 = load i16, i16* %denominator.addr, align 2, !dbg !389
  %conv113 = sext i16 %47 to i32, !dbg !390
  %conv114 = sext i32 %conv113 to i64, !dbg !391
  %call115 = call i32 @klee_alarm_s32_mul_upper(i64 %conv112, i64 %conv114), !dbg !392
  %tobool116 = icmp ne i32 %call115, 0, !dbg !392
  br i1 %tobool116, label %if.end118, label %if.then117, !dbg !393

if.then117:                                       ; preds = %if.end109
  store i16 0, i16* %retval, align 2, !dbg !394
  br label %return, !dbg !394

if.end118:                                        ; preds = %if.end109
  %48 = load i32, i32* %s32Temp1, align 4, !dbg !396
  %49 = load i16, i16* %denominator.addr, align 2, !dbg !398
  %conv119 = sext i16 %49 to i32, !dbg !399
  %int_cast_to_i6411 = zext i32 %conv119 to i64, !dbg !400
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !400
  %div120 = sdiv i32 %48, %conv119, !dbg !400, !klee.check.div !106
  %conv121 = sext i32 %div120 to i64, !dbg !401
  %50 = load i16, i16* %denominator.addr, align 2, !dbg !402
  %conv122 = sext i16 %50 to i32, !dbg !403
  %conv123 = sext i32 %conv122 to i64, !dbg !404
  %call124 = call i32 @klee_alarm_s32_mul_lower(i64 %conv121, i64 %conv123), !dbg !405
  %tobool125 = icmp ne i32 %call124, 0, !dbg !405
  br i1 %tobool125, label %if.end127, label %if.then126, !dbg !406

if.then126:                                       ; preds = %if.end118
  store i16 0, i16* %retval, align 2, !dbg !407
  br label %return, !dbg !407

if.end127:                                        ; preds = %if.end118
  %51 = load i32, i32* %s32Temp1, align 4, !dbg !409
  %conv128 = sext i32 %51 to i64, !dbg !411
  %52 = load i16, i16* %denominator.addr, align 2, !dbg !412
  %conv129 = sext i16 %52 to i32, !dbg !413
  %conv130 = sext i32 %conv129 to i64, !dbg !414
  %call131 = call i32 @klee_alarm_s32_div_representable(i64 %conv128, i64 %conv130), !dbg !415
  %tobool132 = icmp ne i32 %call131, 0, !dbg !415
  br i1 %tobool132, label %if.end134, label %if.then133, !dbg !416

if.then133:                                       ; preds = %if.end127
  store i16 0, i16* %retval, align 2, !dbg !417
  br label %return, !dbg !417

if.end134:                                        ; preds = %if.end127
  %53 = load i32, i32* %s32Temp1, align 4, !dbg !419
  %54 = load i32, i32* %s32Temp1, align 4, !dbg !421
  %55 = load i16, i16* %denominator.addr, align 2, !dbg !422
  %conv135 = sext i16 %55 to i32, !dbg !423
  %int_cast_to_i6412 = zext i32 %conv135 to i64, !dbg !424
  call void @klee_div_zero_check(i64 %int_cast_to_i6412), !dbg !424
  %div136 = sdiv i32 %54, %conv135, !dbg !424, !klee.check.div !106
  %56 = load i16, i16* %denominator.addr, align 2, !dbg !425
  %conv137 = sext i16 %56 to i32, !dbg !426
  %mul138 = mul nsw i32 %div136, %conv137, !dbg !427
  %sub139 = sub nsw i32 %53, %mul138, !dbg !428
  %conv140 = sext i32 %sub139 to i64, !dbg !429
  %call141 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv140, i32 1), !dbg !430
  %tobool142 = icmp ne i32 %call141, 0, !dbg !430
  br i1 %tobool142, label %if.end144, label %if.then143, !dbg !431

if.then143:                                       ; preds = %if.end134
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 357, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !432
  unreachable, !dbg !432

if.end144:                                        ; preds = %if.end134
  %57 = load i32, i32* %s32Temp1, align 4, !dbg !434
  %58 = load i32, i32* %s32Temp1, align 4, !dbg !435
  %59 = load i16, i16* %denominator.addr, align 2, !dbg !436
  %conv145 = sext i16 %59 to i32, !dbg !437
  %int_cast_to_i6413 = zext i32 %conv145 to i64, !dbg !438
  call void @klee_div_zero_check(i64 %int_cast_to_i6413), !dbg !438
  %div146 = sdiv i32 %58, %conv145, !dbg !438, !klee.check.div !106
  %60 = load i16, i16* %denominator.addr, align 2, !dbg !439
  %conv147 = sext i16 %60 to i32, !dbg !440
  %mul148 = mul nsw i32 %div146, %conv147, !dbg !441
  %sub149 = sub nsw i32 %57, %mul148, !dbg !442
  %shl150 = shl i32 %sub149, 1, !dbg !443
  %conv151 = sext i32 %shl150 to i64, !dbg !444
  store volatile i64 %conv151, i64* @klee_alarm_sink_s64, align 8, !dbg !445
  store i16 0, i16* %retval, align 2, !dbg !446
  br label %return, !dbg !446

if.else152:                                       ; preds = %if.else90
  store i16 32767, i16* %retval, align 2, !dbg !447
  br label %return, !dbg !447

return:                                           ; preds = %if.else152, %if.end144, %if.then133, %if.then126, %if.then117, %if.then108, %if.then98, %if.else89, %if.else88, %if.then86, %if.then77, %if.then69, %if.then61, %if.then54, %if.then44, %if.then35, %if.then26, %if.then16, %if.then10, %if.else, %if.then4
  %61 = load i16, i16* %retval, align 2, !dbg !449
  ret i16 %61, !dbg !449
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !450 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !453, metadata !DIExpression()), !dbg !454
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !455
  %cmp = icmp ne i64 %0, 0, !dbg !456
  %conv = zext i1 %cmp to i32, !dbg !456
  ret i32 %conv, !dbg !457
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !458 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !459, metadata !DIExpression()), !dbg !460
  %0 = load i64, i64* %left.addr, align 8, !dbg !461
  %cmp = icmp sge i64 %0, 0, !dbg !462
  %conv = zext i1 %cmp to i32, !dbg !462
  ret i32 %conv, !dbg !463
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !464 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !467, metadata !DIExpression()), !dbg !468
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !469, metadata !DIExpression()), !dbg !470
  %0 = load i32, i32* %count.addr, align 4, !dbg !471
  %cmp = icmp uge i32 %0, 63, !dbg !473
  br i1 %cmp, label %if.then, label %if.end, !dbg !474

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !475
  br label %return, !dbg !475

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !477
  %2 = load i32, i32* %count.addr, align 4, !dbg !478
  %sh_prom = zext i32 %2 to i64, !dbg !479
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !479
  %shl = shl i64 1, %sh_prom, !dbg !479, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !480
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !481
  %conv = zext i1 %cmp1 to i32, !dbg !481
  store i32 %conv, i32* %retval, align 4, !dbg !482
  br label %return, !dbg !482

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !483
  ret i32 %3, !dbg !483
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !484 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !487, metadata !DIExpression()), !dbg !488
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !489, metadata !DIExpression()), !dbg !490
  %0 = load i64, i64* %left.addr, align 8, !dbg !491
  %1 = load i64, i64* %right.addr, align 8, !dbg !492
  %mul = mul nsw i64 %0, %1, !dbg !493
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !494
  %conv = zext i1 %cmp to i32, !dbg !494
  ret i32 %conv, !dbg !495
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !496 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !497, metadata !DIExpression()), !dbg !498
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !499, metadata !DIExpression()), !dbg !500
  %0 = load i64, i64* %left.addr, align 8, !dbg !501
  %1 = load i64, i64* %right.addr, align 8, !dbg !502
  %mul = mul nsw i64 %0, %1, !dbg !503
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !504
  %conv = zext i1 %cmp to i32, !dbg !504
  ret i32 %conv, !dbg !505
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_lower(i64 %left, i64 %right) #0 !dbg !506 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !507, metadata !DIExpression()), !dbg !508
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !509, metadata !DIExpression()), !dbg !510
  %0 = load i64, i64* %left.addr, align 8, !dbg !511
  %1 = load i64, i64* %right.addr, align 8, !dbg !512
  %add = add nsw i64 %0, %1, !dbg !513
  %cmp = icmp sge i64 %add, -2147483648, !dbg !514
  %conv = zext i1 %cmp to i32, !dbg !514
  ret i32 %conv, !dbg !515
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !516 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !517, metadata !DIExpression()), !dbg !518
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !519, metadata !DIExpression()), !dbg !520
  %0 = load i64, i64* %left.addr, align 8, !dbg !521
  %1 = load i64, i64* %right.addr, align 8, !dbg !522
  %add = add nsw i64 %0, %1, !dbg !523
  %cmp = icmp sle i64 %add, 2147483647, !dbg !524
  %conv = zext i1 %cmp to i32, !dbg !524
  ret i32 %conv, !dbg !525
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_div_representable(i64 %numerator, i64 %denominator) #0 !dbg !526 {
entry:
  %numerator.addr = alloca i64, align 8
  %denominator.addr = alloca i64, align 8
  store i64 %numerator, i64* %numerator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %numerator.addr, metadata !527, metadata !DIExpression()), !dbg !528
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !529, metadata !DIExpression()), !dbg !530
  %0 = load i64, i64* %numerator.addr, align 8, !dbg !531
  %cmp = icmp eq i64 %0, -2147483648, !dbg !532
  %1 = load i64, i64* %denominator.addr, align 8, !dbg !533
  %cmp1 = icmp eq i64 %1, -1, !dbg !533
  %2 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !533
  %lnot = xor i1 %2, true, !dbg !534
  %lnot.ext = zext i1 %lnot to i32, !dbg !534
  ret i32 %lnot.ext, !dbg !535
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !536 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !539, metadata !DIExpression()), !dbg !540
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !541, metadata !DIExpression()), !dbg !542
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !543, metadata !DIExpression()), !dbg !544
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !545, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !547, metadata !DIExpression()), !dbg !548
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !549
  %conv = zext i16 %0 to i32, !dbg !549
  %and = and i32 %conv, 65535, !dbg !550
  %conv1 = trunc i32 %and to i16, !dbg !549
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !551
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !552
  %conv2 = sext i16 %1 to i32, !dbg !552
  %shl = shl i32 %conv2, 16, !dbg !553
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !554
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !555
  %conv3 = zext i16 %2 to i32, !dbg !555
  %cmp = icmp eq i32 %conv3, 0, !dbg !557
  br i1 %cmp, label %if.then, label %if.else9, !dbg !558

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !559
  %conv5 = sext i16 %3 to i32, !dbg !559
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !562
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !563

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !564
  br label %return, !dbg !564

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !566
  br label %return, !dbg !566

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !568
  %conv10 = sext i16 %4 to i32, !dbg !568
  %shl11 = shl i32 %conv10, 16, !dbg !570
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !571
  %conv12 = sext i16 %5 to i32, !dbg !571
  %shl13 = shl i32 %conv12, 16, !dbg !572
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !573
  %conv14 = zext i16 %6 to i32, !dbg !573
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !574
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !574
  %div = sdiv i32 %shl13, %conv14, !dbg !574, !klee.check.div !106
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !575
  %conv15 = zext i16 %7 to i32, !dbg !575
  %mul = mul nsw i32 %div, %conv15, !dbg !576
  %sub = sub nsw i32 %shl11, %mul, !dbg !577
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !578
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !579
  %shl16 = shl i32 %8, 1, !dbg !580
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !581
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !582
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !583
  %conv17 = zext i16 %10 to i32, !dbg !583
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !584
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !584
  %div18 = sdiv i32 %9, %conv17, !dbg !584, !klee.check.div !106
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !585
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !586
  %conv19 = sext i16 %11 to i32, !dbg !586
  %shl20 = shl i32 %conv19, 16, !dbg !587
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !588
  %conv21 = zext i16 %12 to i32, !dbg !588
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !589
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !589
  %div22 = sdiv i32 %shl20, %conv21, !dbg !589, !klee.check.div !106
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !590
  %add = add nsw i32 %div22, %13, !dbg !591
  store i32 %add, i32* %s32Temp1, align 4, !dbg !592
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !593
  %cmp23 = icmp slt i32 %14, 32767, !dbg !595
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !596

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !597
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !600
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !601

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !602
  %conv29 = trunc i32 %16 to i16, !dbg !604
  store i16 %conv29, i16* %retval, align 2, !dbg !605
  br label %return, !dbg !605

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !606
  br label %return, !dbg !606

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !608
  br label %return, !dbg !608

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !610
  ret i16 %17, !dbg !610
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !611 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !612, metadata !DIExpression()), !dbg !613
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !614, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !616, metadata !DIExpression()), !dbg !617
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !618, metadata !DIExpression()), !dbg !619
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !620
  %conv = zext i16 %0 to i32, !dbg !620
  %and = and i32 %conv, 65535, !dbg !621
  %conv1 = trunc i32 %and to i16, !dbg !620
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !622
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !623
  %conv2 = zext i16 %1 to i32, !dbg !623
  %cmp = icmp eq i32 %conv2, 0, !dbg !625
  br i1 %cmp, label %if.then, label %if.else8, !dbg !626

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !627
  %conv4 = sext i16 %2 to i32, !dbg !627
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !630
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !631

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !632
  br label %return, !dbg !632

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !634
  br label %return, !dbg !634

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !636
  %conv9 = sext i16 %3 to i32, !dbg !636
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !638
  %conv10 = sext i16 %4 to i32, !dbg !638
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !639
  %conv11 = zext i16 %5 to i32, !dbg !639
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !640
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !640
  %div = sdiv i32 %conv10, %conv11, !dbg !640, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !641
  %conv12 = zext i16 %6 to i32, !dbg !641
  %mul = mul nsw i32 %div, %conv12, !dbg !642
  %sub = sub nsw i32 %conv9, %mul, !dbg !643
  %shl = shl i32 %sub, 1, !dbg !644
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !645
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !646
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !647
  %conv13 = zext i16 %8 to i32, !dbg !647
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !648
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !648
  %div14 = sdiv i32 %7, %conv13, !dbg !648, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !649
  %conv15 = sext i16 %9 to i32, !dbg !649
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !650
  %conv16 = zext i16 %10 to i32, !dbg !650
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !651
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !651
  %div17 = sdiv i32 %conv15, %conv16, !dbg !651, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !652
  store i32 %add, i32* %s32Temp1, align 4, !dbg !653
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !654
  %conv18 = trunc i32 %11 to i16, !dbg !654
  store i16 %conv18, i16* %retval, align 2, !dbg !655
  br label %return, !dbg !655

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !656
  ret i16 %12, !dbg !656
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !657 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !660, metadata !DIExpression()), !dbg !661
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !662, metadata !DIExpression()), !dbg !663
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !664, metadata !DIExpression()), !dbg !666
  store i32 0, i32* %u32Temp1, align 4, !dbg !666
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !667, metadata !DIExpression()), !dbg !668
  store i32 0, i32* %u32Temp2, align 4, !dbg !668
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !669, metadata !DIExpression()), !dbg !670
  store i32 0, i32* %u32Temp3, align 4, !dbg !670
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !671
  %conv = zext i16 %0 to i32, !dbg !671
  %cmp = icmp eq i32 %conv, 0, !dbg !673
  br i1 %cmp, label %if.then, label %if.else, !dbg !674

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !675
  br label %return, !dbg !675

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !677
  %conv2 = zext i16 %1 to i32, !dbg !677
  %shl = shl i32 %conv2, 16, !dbg !679
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !680
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !681
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !682
  %conv3 = zext i16 %3 to i32, !dbg !682
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !683
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !683
  %div = udiv i32 %2, %conv3, !dbg !683, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !684
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !685
  %add = add i32 %4, 128, !dbg !686
  %shr = lshr i32 %add, 8, !dbg !687
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !688
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !689
  %cmp4 = icmp ult i32 %5, 255, !dbg !691
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !692

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !693
  %conv7 = trunc i32 %6 to i8, !dbg !695
  store i8 %conv7, i8* %retval, align 1, !dbg !696
  br label %return, !dbg !696

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !697
  br label %return, !dbg !697

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !699
  ret i8 %7, !dbg !699
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !700 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !703, metadata !DIExpression()), !dbg !704
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !705, metadata !DIExpression()), !dbg !706
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !707, metadata !DIExpression()), !dbg !708
  store i32 0, i32* %s32Temp1, align 4, !dbg !708
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !709
  %conv = zext i16 %0 to i32, !dbg !709
  %and = and i32 %conv, 65535, !dbg !710
  %conv1 = trunc i32 %and to i16, !dbg !709
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !711
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !712
  %conv2 = zext i16 %1 to i32, !dbg !712
  %and3 = and i32 %conv2, 65535, !dbg !714
  %cmp = icmp eq i32 %and3, 0, !dbg !715
  br i1 %cmp, label %if.then, label %if.else8, !dbg !716

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !717
  %cmp5 = icmp sge i32 %2, 0, !dbg !720
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !721

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !722
  br label %return, !dbg !722

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !724
  br label %return, !dbg !724

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !726
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !728
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !729
  %conv9 = zext i16 %5 to i32, !dbg !729
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !730
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !730
  %div = sdiv i32 %4, %conv9, !dbg !730, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !731
  %conv10 = zext i16 %6 to i32, !dbg !731
  %mul = mul nsw i32 %div, %conv10, !dbg !732
  %sub = sub nsw i32 %3, %mul, !dbg !733
  %shl = shl i32 %sub, 1, !dbg !734
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !735
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !736
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !737
  %conv11 = zext i16 %8 to i32, !dbg !737
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !738
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !738
  %div12 = sdiv i32 %7, %conv11, !dbg !738, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !739
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !740
  %conv13 = zext i16 %10 to i32, !dbg !740
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !741
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !741
  %div14 = sdiv i32 %9, %conv13, !dbg !741, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !742
  store i32 %add, i32* %s32Temp1, align 4, !dbg !743
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !744
  %cmp15 = icmp slt i32 %11, 65535, !dbg !746
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !747

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !748
  %cmp18 = icmp sgt i32 %12, 0, !dbg !751
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !752

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !753
  %conv21 = trunc i32 %13 to i16, !dbg !755
  store i16 %conv21, i16* %retval, align 2, !dbg !756
  br label %return, !dbg !756

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !757
  br label %return, !dbg !757

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !759
  br label %return, !dbg !759

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !761
  ret i16 %14, !dbg !761
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !762 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !765, metadata !DIExpression()), !dbg !766
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !767, metadata !DIExpression()), !dbg !768
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !769, metadata !DIExpression()), !dbg !770
  store i32 0, i32* %u32Temp, align 4, !dbg !770
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !771
  %conv = zext i16 %0 to i32, !dbg !771
  %cmp = icmp eq i32 %conv, 0, !dbg !773
  br i1 %cmp, label %if.then, label %if.else, !dbg !774

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !775
  br label %return, !dbg !775

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !777
  %conv2 = zext i16 %1 to i32, !dbg !777
  %shl = shl i32 %conv2, 16, !dbg !779
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !780
  %conv3 = zext i16 %2 to i32, !dbg !780
  %shr = ashr i32 %conv3, 1, !dbg !781
  %add = add nsw i32 %shl, %shr, !dbg !782
  store i32 %add, i32* %u32Temp, align 4, !dbg !783
  %3 = load i32, i32* %u32Temp, align 4, !dbg !784
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !785
  %conv4 = zext i16 %4 to i32, !dbg !785
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !786
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !786
  %div = udiv i32 %3, %conv4, !dbg !786, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !787
  %5 = load i32, i32* %u32Temp, align 4, !dbg !788
  %cmp5 = icmp ult i32 %5, 65535, !dbg !790
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !791

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !792
  %and = and i32 %6, 65535, !dbg !794
  %conv8 = trunc i32 %and to i16, !dbg !792
  store i16 %conv8, i16* %retval, align 2, !dbg !795
  br label %return, !dbg !795

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !796
  br label %return, !dbg !796

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !798
  ret i16 %7, !dbg !798
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !799 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !802, metadata !DIExpression()), !dbg !803
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !804, metadata !DIExpression()), !dbg !805
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !806, metadata !DIExpression()), !dbg !807
  store i32 0, i32* %u32Temp1, align 4, !dbg !807
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !808, metadata !DIExpression()), !dbg !809
  store i32 0, i32* %u32Temp2, align 4, !dbg !809
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !810
  %conv = zext i16 %0 to i32, !dbg !810
  %and = and i32 %conv, 65535, !dbg !811
  %conv1 = trunc i32 %and to i16, !dbg !810
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !812
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !813
  %conv2 = zext i16 %1 to i32, !dbg !813
  %cmp = icmp eq i32 %conv2, 0, !dbg !815
  br i1 %cmp, label %if.then, label %if.else, !dbg !816

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !817
  br label %return, !dbg !817

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !819
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !821
  %conv4 = zext i16 %3 to i32, !dbg !821
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !822
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !822
  %div = udiv i32 %2, %conv4, !dbg !822, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !823
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !824
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !825
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !826
  %conv5 = zext i16 %6 to i32, !dbg !826
  %mul = mul i32 %5, %conv5, !dbg !827
  %sub = sub i32 %4, %mul, !dbg !828
  %shl = shl i32 %sub, 1, !dbg !829
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !830
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !831
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !832
  %conv6 = zext i16 %8 to i32, !dbg !832
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !833
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !833
  %div7 = udiv i32 %7, %conv6, !dbg !833, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !834
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !835
  %conv8 = zext i16 %10 to i32, !dbg !835
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !836
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !836
  %div9 = udiv i32 %9, %conv8, !dbg !836, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !837
  store i32 %add, i32* %u32Temp2, align 4, !dbg !838
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !839
  %cmp10 = icmp ult i32 %11, 65535, !dbg !841
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !842

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !843
  %and13 = and i32 %12, 65535, !dbg !845
  %conv14 = trunc i32 %and13 to i16, !dbg !843
  store i16 %conv14, i16* %retval, align 2, !dbg !846
  br label %return, !dbg !846

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !847
  br label %return, !dbg !847

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !849
  ret i16 %13, !dbg !849
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !850 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !853, metadata !DIExpression()), !dbg !854
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !855, metadata !DIExpression()), !dbg !856
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !857, metadata !DIExpression()), !dbg !858
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !859, metadata !DIExpression()), !dbg !860
  store i32 0, i32* %s32Result, align 4, !dbg !860
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !861, metadata !DIExpression()), !dbg !862
  store i32 0, i32* %s32Temp1, align 4, !dbg !862
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !863
  %conv = sext i16 %0 to i32, !dbg !863
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !864
  %conv1 = zext i16 %1 to i32, !dbg !864
  %mul = mul nsw i32 %conv, %conv1, !dbg !865
  store i32 %mul, i32* %s32Result, align 4, !dbg !866
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !867
  %conv2 = sext i16 %2 to i32, !dbg !867
  %cmp = icmp eq i32 %conv2, 0, !dbg !869
  br i1 %cmp, label %if.then, label %if.else7, !dbg !870

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !871
  %cmp4 = icmp slt i32 %3, 0, !dbg !874
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !875

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !876
  br label %return, !dbg !876

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !878
  br label %return, !dbg !878

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !880
  %5 = load i32, i32* %s32Result, align 4, !dbg !882
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !883
  %conv8 = sext i16 %6 to i32, !dbg !883
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !884
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !884
  %div = sdiv i32 %5, %conv8, !dbg !884, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !885
  %conv9 = sext i16 %7 to i32, !dbg !885
  %mul10 = mul nsw i32 %div, %conv9, !dbg !886
  %sub = sub nsw i32 %4, %mul10, !dbg !887
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !888
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !889
  %shl = shl i32 %8, 1, !dbg !890
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !891
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !892
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !893
  %conv11 = sext i16 %10 to i32, !dbg !893
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !894
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !894
  %div12 = sdiv i32 %9, %conv11, !dbg !894, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !895
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !896
  %conv13 = sext i16 %12 to i32, !dbg !896
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !897
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !897
  %div14 = sdiv i32 %11, %conv13, !dbg !897, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !898
  store i32 %add, i32* %s32Result, align 4, !dbg !899
  %13 = load i32, i32* %s32Result, align 4, !dbg !900
  %cmp15 = icmp slt i32 %13, 32767, !dbg !902
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !903

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !904
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !907
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !908

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !909
  %conv21 = trunc i32 %15 to i16, !dbg !911
  store i16 %conv21, i16* %retval, align 2, !dbg !912
  br label %return, !dbg !912

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !913
  br label %return, !dbg !913

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !915
  br label %return, !dbg !915

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !917
  ret i16 %16, !dbg !917
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !918 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !921, metadata !DIExpression()), !dbg !922
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !923, metadata !DIExpression()), !dbg !924
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !925, metadata !DIExpression()), !dbg !926
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !927, metadata !DIExpression()), !dbg !928
  store i32 0, i32* %s32Result, align 4, !dbg !928
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !929, metadata !DIExpression()), !dbg !930
  store i32 0, i32* %s32Temp1, align 4, !dbg !930
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !931
  %conv = zext i16 %0 to i32, !dbg !931
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !932
  %conv1 = sext i16 %1 to i32, !dbg !932
  %mul = mul nsw i32 %conv, %conv1, !dbg !933
  store i32 %mul, i32* %s32Result, align 4, !dbg !934
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !935
  %conv2 = zext i16 %2 to i32, !dbg !935
  %cmp = icmp eq i32 %conv2, 0, !dbg !937
  br i1 %cmp, label %if.then, label %if.else7, !dbg !938

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !939
  %cmp4 = icmp slt i32 %3, 0, !dbg !942
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !943

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !944
  br label %return, !dbg !944

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !946
  br label %return, !dbg !946

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !948
  %5 = load i32, i32* %s32Result, align 4, !dbg !950
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !951
  %conv8 = zext i16 %6 to i32, !dbg !951
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !952
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !952
  %div = sdiv i32 %5, %conv8, !dbg !952, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !953
  %conv9 = zext i16 %7 to i32, !dbg !953
  %mul10 = mul nsw i32 %div, %conv9, !dbg !954
  %sub = sub nsw i32 %4, %mul10, !dbg !955
  %shl = shl i32 %sub, 1, !dbg !956
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !957
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !958
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !959
  %conv11 = zext i16 %9 to i32, !dbg !959
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !960
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !960
  %div12 = sdiv i32 %8, %conv11, !dbg !960, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !961
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !962
  %conv13 = zext i16 %11 to i32, !dbg !962
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !963
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !963
  %div14 = sdiv i32 %10, %conv13, !dbg !963, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !964
  store i32 %add, i32* %s32Result, align 4, !dbg !965
  %12 = load i32, i32* %s32Result, align 4, !dbg !966
  %cmp15 = icmp slt i32 %12, 32767, !dbg !968
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !969

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !970
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !973
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !974

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !975
  %conv21 = trunc i32 %14 to i16, !dbg !977
  store i16 %conv21, i16* %retval, align 2, !dbg !978
  br label %return, !dbg !978

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !979
  br label %return, !dbg !979

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !981
  br label %return, !dbg !981

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !983
  ret i16 %15, !dbg !983
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !984 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !987, metadata !DIExpression()), !dbg !988
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !989, metadata !DIExpression()), !dbg !990
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !991, metadata !DIExpression()), !dbg !992
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !993, metadata !DIExpression()), !dbg !994
  store i32 0, i32* %u32Result, align 4, !dbg !994
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !995, metadata !DIExpression()), !dbg !996
  store i32 0, i32* %u32Temp1, align 4, !dbg !996
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !997, metadata !DIExpression()), !dbg !998
  store i32 0, i32* %s32Result, align 4, !dbg !998
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !999, metadata !DIExpression()), !dbg !1000
  store i32 0, i32* %s32Temp1, align 4, !dbg !1000
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !1001
  %conv = sext i16 %0 to i32, !dbg !1001
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !1002
  %conv1 = zext i16 %1 to i32, !dbg !1002
  %mul = mul nsw i32 %conv, %conv1, !dbg !1003
  store i32 %mul, i32* %s32Result, align 4, !dbg !1004
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1005
  %conv2 = sext i16 %2 to i32, !dbg !1005
  %cmp = icmp eq i32 %conv2, 0, !dbg !1007
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1008

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1009
  %cmp4 = icmp sge i32 %3, 0, !dbg !1012
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1013

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !1014
  br label %return, !dbg !1014

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1016
  br label %return, !dbg !1016

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1018
  %5 = load i32, i32* %s32Result, align 4, !dbg !1020
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1021
  %conv8 = sext i16 %6 to i32, !dbg !1021
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1022
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1022
  %div = sdiv i32 %5, %conv8, !dbg !1022, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1023
  %conv9 = sext i16 %7 to i32, !dbg !1023
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1024
  %sub = sub nsw i32 %4, %mul10, !dbg !1025
  %shl = shl i32 %sub, 1, !dbg !1026
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1027
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1028
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1029
  %conv11 = sext i16 %9 to i32, !dbg !1029
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1030
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1030
  %div12 = sdiv i32 %8, %conv11, !dbg !1030, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1031
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1032
  %conv13 = sext i16 %11 to i32, !dbg !1032
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1033
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1033
  %div14 = sdiv i32 %10, %conv13, !dbg !1033, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1034
  store i32 %add, i32* %s32Result, align 4, !dbg !1035
  %12 = load i32, i32* %s32Result, align 4, !dbg !1036
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1038
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1039

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1040
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1043
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1044

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1045
  %conv21 = trunc i32 %14 to i16, !dbg !1047
  store i16 %conv21, i16* %retval, align 2, !dbg !1048
  br label %return, !dbg !1048

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1049
  br label %return, !dbg !1049

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1051
  br label %return, !dbg !1051

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1053
  ret i16 %15, !dbg !1053
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1054 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1057, metadata !DIExpression()), !dbg !1058
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1059, metadata !DIExpression()), !dbg !1060
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1061, metadata !DIExpression()), !dbg !1062
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1063, metadata !DIExpression()), !dbg !1064
  store i32 0, i32* %s32Result, align 4, !dbg !1064
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1065, metadata !DIExpression()), !dbg !1066
  store i32 0, i32* %s32Temp1, align 4, !dbg !1066
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !1067
  %conv = sext i16 %0 to i32, !dbg !1067
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !1068
  %conv1 = zext i16 %1 to i32, !dbg !1068
  %mul = mul nsw i32 %conv, %conv1, !dbg !1069
  store i32 %mul, i32* %s32Result, align 4, !dbg !1070
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1071
  %conv2 = zext i16 %2 to i32, !dbg !1071
  %cmp = icmp eq i32 %conv2, 0, !dbg !1073
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1074

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1075
  %cmp4 = icmp sge i32 %3, 0, !dbg !1078
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1079

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !1080
  br label %return, !dbg !1080

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1082
  br label %return, !dbg !1082

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1084
  %5 = load i32, i32* %s32Result, align 4, !dbg !1086
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1087
  %conv8 = zext i16 %6 to i32, !dbg !1087
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1088
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1088
  %div = sdiv i32 %5, %conv8, !dbg !1088, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1089
  %conv9 = zext i16 %7 to i32, !dbg !1089
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1090
  %sub = sub nsw i32 %4, %mul10, !dbg !1091
  %shl = shl i32 %sub, 1, !dbg !1092
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1093
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1094
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1095
  %conv11 = zext i16 %9 to i32, !dbg !1095
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1096
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1096
  %div12 = sdiv i32 %8, %conv11, !dbg !1096, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1097
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1098
  %conv13 = zext i16 %11 to i32, !dbg !1098
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1099
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1099
  %div14 = sdiv i32 %10, %conv13, !dbg !1099, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1100
  store i32 %add, i32* %s32Result, align 4, !dbg !1101
  %12 = load i32, i32* %s32Result, align 4, !dbg !1102
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1104
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1105

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1106
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1109
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1110

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1111
  %conv21 = trunc i32 %14 to i16, !dbg !1113
  store i16 %conv21, i16* %retval, align 2, !dbg !1114
  br label %return, !dbg !1114

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1115
  br label %return, !dbg !1115

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1117
  br label %return, !dbg !1117

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1119
  ret i16 %15, !dbg !1119
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1120 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1123, metadata !DIExpression()), !dbg !1124
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1125, metadata !DIExpression()), !dbg !1126
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1127, metadata !DIExpression()), !dbg !1128
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1129, metadata !DIExpression()), !dbg !1130
  store i32 0, i32* %u32Temp1, align 4, !dbg !1130
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1131, metadata !DIExpression()), !dbg !1132
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1132
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1133
  %conv = zext i16 %0 to i32, !dbg !1133
  %cmp = icmp eq i32 %conv, 0, !dbg !1135
  br i1 %cmp, label %if.then, label %if.else, !dbg !1136

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1137
  br label %return, !dbg !1137

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1139
  %conv2 = zext i16 %1 to i32, !dbg !1139
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1141
  %conv3 = zext i16 %2 to i32, !dbg !1141
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1142
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1143
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1144
  %conv4 = zext i16 %3 to i32, !dbg !1144
  %shr = ashr i32 %conv4, 1, !dbg !1145
  %conv5 = trunc i32 %shr to i16, !dbg !1144
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1146
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1147
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1148
  %conv6 = zext i16 %5 to i32, !dbg !1148
  %add = add i32 %4, %conv6, !dbg !1149
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1150
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1151
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1152
  %conv7 = zext i16 %7 to i32, !dbg !1152
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1153
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1153
  %div = udiv i32 %6, %conv7, !dbg !1153, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1154
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1155
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1157
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1158

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1159
  %and = and i32 %9, 65535, !dbg !1161
  %conv11 = trunc i32 %and to i16, !dbg !1162
  store i16 %conv11, i16* %retval, align 2, !dbg !1163
  br label %return, !dbg !1163

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1164
  br label %return, !dbg !1164

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1166
  ret i16 %10, !dbg !1166
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1167 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1170, metadata !DIExpression()), !dbg !1171
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1172, metadata !DIExpression()), !dbg !1173
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1174, metadata !DIExpression()), !dbg !1175
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1176, metadata !DIExpression()), !dbg !1177
  store i32 0, i32* %u32Temp1, align 4, !dbg !1177
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1178
  %cmp = icmp eq i32 %0, 0, !dbg !1180
  br i1 %cmp, label %if.then, label %if.else, !dbg !1181

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1182
  br label %return, !dbg !1182

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1184
  %conv = zext i16 %1 to i32, !dbg !1184
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1186
  %conv1 = zext i16 %2 to i32, !dbg !1186
  %mul = mul nsw i32 %conv, %conv1, !dbg !1187
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1188
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1189
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1189
  %div = udiv i32 %mul, %3, !dbg !1189, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1190
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1191
  %conv2 = zext i16 %4 to i32, !dbg !1191
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1193
  %conv3 = zext i16 %5 to i32, !dbg !1193
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1194
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1195
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1196
  %mul5 = mul i32 %6, %7, !dbg !1197
  %sub = sub i32 %mul4, %mul5, !dbg !1198
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1199
  %div6 = udiv i32 %8, 2, !dbg !1200
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1201
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1202

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1203
  %inc = add i32 %9, 1, !dbg !1203
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1203
  br label %if.end, !dbg !1205

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1206
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1208
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1209

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1210
  %and = and i32 %11, 65535, !dbg !1212
  %conv13 = trunc i32 %and to i16, !dbg !1213
  store i16 %conv13, i16* %retval, align 2, !dbg !1214
  br label %return, !dbg !1214

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1215
  br label %return, !dbg !1215

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1217
  ret i16 %12, !dbg !1217
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1218 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1221, metadata !DIExpression()), !dbg !1222
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1223, metadata !DIExpression()), !dbg !1224
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1225, metadata !DIExpression()), !dbg !1226
  store i32 0, i32* %u32Temp1, align 4, !dbg !1226
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1227
  %conv = zext i16 %0 to i32, !dbg !1227
  %cmp = icmp eq i32 %conv, 0, !dbg !1229
  br i1 %cmp, label %if.then, label %if.else, !dbg !1230

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1231
  br label %return, !dbg !1231

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1233
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1235
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1236
  %conv2 = zext i16 %3 to i32, !dbg !1236
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1237
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1237
  %div = udiv i32 %2, %conv2, !dbg !1237, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1238
  %conv3 = zext i16 %4 to i32, !dbg !1238
  %mul = mul i32 %div, %conv3, !dbg !1239
  %sub = sub i32 %1, %mul, !dbg !1240
  %shl = shl i32 %sub, 1, !dbg !1241
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1242
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1243
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1244
  %conv4 = zext i16 %6 to i32, !dbg !1244
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1245
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1245
  %div5 = udiv i32 %5, %conv4, !dbg !1245, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1246
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1247
  %conv6 = zext i16 %8 to i32, !dbg !1247
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1248
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1248
  %div7 = udiv i32 %7, %conv6, !dbg !1248, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1249
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1250
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1251
  store i32 %9, i32* %retval, align 4, !dbg !1252
  br label %return, !dbg !1252

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1253
  ret i32 %10, !dbg !1253
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1254 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1257, metadata !DIExpression()), !dbg !1258
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1259, metadata !DIExpression()), !dbg !1260
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1261, metadata !DIExpression()), !dbg !1262
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1263, metadata !DIExpression()), !dbg !1264
  store i32 0, i32* %s32Temp1, align 4, !dbg !1264
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1265, metadata !DIExpression()), !dbg !1266
  store i32 0, i32* %s32Temp2, align 4, !dbg !1266
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1267, metadata !DIExpression()), !dbg !1268
  store i32 0, i32* %s32Temp3, align 4, !dbg !1268
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1269
  %conv = sext i16 %0 to i32, !dbg !1269
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1270
  %conv1 = sext i16 %1 to i32, !dbg !1270
  %mul = mul nsw i32 %conv, %conv1, !dbg !1271
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1272
  %2 = load i16, i16* %div.addr, align 2, !dbg !1273
  %conv2 = sext i16 %2 to i32, !dbg !1273
  %cmp = icmp eq i32 %conv2, 0, !dbg !1275
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1276

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1277
  %cmp4 = icmp slt i32 %3, 0, !dbg !1280
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1281

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1282
  br label %return, !dbg !1282

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1284
  br label %return, !dbg !1284

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1286
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1288
  %6 = load i16, i16* %div.addr, align 2, !dbg !1289
  %conv8 = sext i16 %6 to i32, !dbg !1289
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1290
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1290
  %div9 = sdiv i32 %5, %conv8, !dbg !1290, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1291
  %conv10 = sext i16 %7 to i32, !dbg !1291
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1292
  %sub = sub nsw i32 %4, %mul11, !dbg !1293
  %shl = shl i32 %sub, 1, !dbg !1294
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1295
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1296
  %9 = load i16, i16* %div.addr, align 2, !dbg !1297
  %conv12 = sext i16 %9 to i32, !dbg !1297
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1298
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1298
  %div13 = sdiv i32 %8, %conv12, !dbg !1298, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1299
  %11 = load i16, i16* %div.addr, align 2, !dbg !1300
  %conv14 = sext i16 %11 to i32, !dbg !1300
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1301
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1301
  %div15 = sdiv i32 %10, %conv14, !dbg !1301, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1302
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1303
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1304
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1306
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1307

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1308
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1311
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1312

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1313
  %conv22 = trunc i32 %14 to i16, !dbg !1315
  store i16 %conv22, i16* %retval, align 2, !dbg !1316
  br label %return, !dbg !1316

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1317
  br label %return, !dbg !1317

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1319
  br label %return, !dbg !1319

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1321
  ret i16 %15, !dbg !1321
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1322 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1325, metadata !DIExpression()), !dbg !1326
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1327, metadata !DIExpression()), !dbg !1328
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1329, metadata !DIExpression()), !dbg !1330
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1331, metadata !DIExpression()), !dbg !1332
  store i32 0, i32* %s32Result, align 4, !dbg !1332
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1333, metadata !DIExpression()), !dbg !1334
  store i32 0, i32* %s32Temp1, align 4, !dbg !1334
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1335
  %conv = sext i16 %0 to i32, !dbg !1335
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1336
  %conv1 = sext i16 %1 to i32, !dbg !1336
  %mul = mul nsw i32 %conv, %conv1, !dbg !1337
  store i32 %mul, i32* %s32Result, align 4, !dbg !1338
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1339
  %conv2 = zext i16 %2 to i32, !dbg !1339
  %cmp = icmp eq i32 %conv2, 0, !dbg !1341
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1342

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1343
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1346
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1347

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1348
  br label %return, !dbg !1348

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1350
  %cmp7 = icmp eq i32 %4, 0, !dbg !1352
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1353

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1354
  br label %return, !dbg !1354

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1356
  br label %return, !dbg !1356

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1358
  %6 = load i32, i32* %s32Result, align 4, !dbg !1360
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1361
  %conv12 = zext i16 %7 to i32, !dbg !1361
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1362
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1362
  %div = sdiv i32 %6, %conv12, !dbg !1362, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1363
  %conv13 = zext i16 %8 to i32, !dbg !1363
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1364
  %sub = sub nsw i32 %5, %mul14, !dbg !1365
  %shl = shl i32 %sub, 1, !dbg !1366
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1367
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1368
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1369
  %conv15 = zext i16 %10 to i32, !dbg !1369
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1370
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1370
  %div16 = sdiv i32 %9, %conv15, !dbg !1370, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1371
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1372
  %conv17 = zext i16 %12 to i32, !dbg !1372
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1373
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1373
  %div18 = sdiv i32 %11, %conv17, !dbg !1373, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1374
  store i32 %add, i32* %s32Result, align 4, !dbg !1375
  %13 = load i32, i32* %s32Result, align 4, !dbg !1376
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1378
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1379

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1380
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1383
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1384

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1385
  %conv25 = trunc i32 %15 to i16, !dbg !1387
  store i16 %conv25, i16* %retval, align 2, !dbg !1388
  br label %return, !dbg !1388

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1389
  br label %return, !dbg !1389

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1391
  br label %return, !dbg !1391

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1393
  ret i16 %16, !dbg !1393
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1394 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1397, metadata !DIExpression()), !dbg !1398
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1399, metadata !DIExpression()), !dbg !1400
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1401, metadata !DIExpression()), !dbg !1402
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1403
  %cmp = icmp eq i32 %0, 0, !dbg !1405
  br i1 %cmp, label %if.then, label %if.else, !dbg !1406

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1407
  br label %return, !dbg !1407

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1409
  %cmp1 = icmp sle i32 %1, 0, !dbg !1412
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1413

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1414
  br label %return, !dbg !1414

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1416
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1418
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1419
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1420
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1420
  %div = udiv i32 %3, %4, !dbg !1420, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1421
  %mul = mul i32 %div, %5, !dbg !1422
  %sub = sub i32 %2, %mul, !dbg !1423
  %shl = shl i32 %sub, 1, !dbg !1424
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1425
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1426
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1427
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1428
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1428
  %div4 = udiv i32 %6, %7, !dbg !1428, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1429
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1430
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1431
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1431
  %div5 = udiv i32 %8, %9, !dbg !1431, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1432
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1433
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1434
  store i32 %10, i32* %retval, align 4, !dbg !1435
  br label %return, !dbg !1435

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1436
  ret i32 %11, !dbg !1436
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1437 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1440, metadata !DIExpression()), !dbg !1441
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1442, metadata !DIExpression()), !dbg !1443
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1444, metadata !DIExpression()), !dbg !1445
  store i32 0, i32* %s32Temp1, align 4, !dbg !1445
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1446
  %cmp = icmp eq i32 %0, 0, !dbg !1448
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1449

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1450
  %cmp1 = icmp sge i32 %1, 0, !dbg !1453
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1454

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1455
  br label %return, !dbg !1455

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1457
  br label %return, !dbg !1457

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1459
  %cmp4 = icmp sge i32 %2, 0, !dbg !1462
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1463

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1464
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1466
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1467
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1468
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1468
  %div = udiv i32 %4, %5, !dbg !1468, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1469
  %mul = mul i32 %div, %6, !dbg !1470
  %sub = sub i32 %3, %mul, !dbg !1471
  %shl = shl i32 %sub, 1, !dbg !1472
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1473
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1474
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1475
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1476
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1476
  %div6 = udiv i32 %7, %8, !dbg !1476, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1477
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1478
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1479
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1479
  %div7 = udiv i32 %9, %10, !dbg !1479, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1480
  store i32 %add, i32* %retval, align 4, !dbg !1481
  br label %return, !dbg !1481

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1482
  br label %return, !dbg !1482

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1484
  ret i32 %11, !dbg !1484
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1485 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1488, metadata !DIExpression()), !dbg !1489
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1490, metadata !DIExpression()), !dbg !1491
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1492, metadata !DIExpression()), !dbg !1493
  store i32 0, i32* %u32Temp1, align 4, !dbg !1493
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1494, metadata !DIExpression()), !dbg !1495
  store i32 0, i32* %u32Temp2, align 4, !dbg !1495
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1496
  %cmp = icmp eq i32 %0, 0, !dbg !1498
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1499

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1500
  %cmp1 = icmp slt i32 %1, 0, !dbg !1503
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1504

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1505
  br label %return, !dbg !1505

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1507
  br label %return, !dbg !1507

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1509
  %cmp4 = icmp sge i32 %2, 0, !dbg !1512
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1513

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1514
  %cmp6 = icmp eq i32 %3, 0, !dbg !1517
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1518

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1519
  br label %return, !dbg !1519

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1521
  %cmp9 = icmp sle i32 %4, 0, !dbg !1524
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1525

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1526
  br label %return, !dbg !1526

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1528
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1530
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1531
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1532
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1532
  %div = sdiv i32 %6, %7, !dbg !1532, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1533
  %mul = mul nsw i32 %div, %8, !dbg !1534
  %sub = sub nsw i32 %5, %mul, !dbg !1535
  %shl = shl i32 %sub, 1, !dbg !1536
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1537
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1538
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1539
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1540
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1540
  %div12 = udiv i32 %9, %10, !dbg !1540, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1541
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1542
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1543
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1543
  %div13 = sdiv i32 %11, %12, !dbg !1543, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1544
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1545
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1546
  store i32 %13, i32* %retval, align 4, !dbg !1547
  br label %return, !dbg !1547

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1548
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1551
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1552

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1553
  br label %return, !dbg !1553

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1555
  %sub18 = sub nsw i32 0, %15, !dbg !1557
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1558
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1559
  %sub19 = sub nsw i32 0, %16, !dbg !1560
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1561
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1562
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1563
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1564
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1565
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1565
  %div20 = sdiv i32 %18, %19, !dbg !1565, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1566
  %mul21 = mul nsw i32 %div20, %20, !dbg !1567
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1568
  %shl23 = shl i32 %sub22, 1, !dbg !1569
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1570
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1571
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1572
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1573
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1573
  %div24 = udiv i32 %21, %22, !dbg !1573, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1574
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1575
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1576
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1576
  %div25 = sdiv i32 %23, %24, !dbg !1576, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1577
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1578
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1579
  store i32 %25, i32* %retval, align 4, !dbg !1580
  br label %return, !dbg !1580

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1581
  ret i32 %26, !dbg !1581
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1582 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1585, metadata !DIExpression()), !dbg !1586
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1587, metadata !DIExpression()), !dbg !1588
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1589, metadata !DIExpression()), !dbg !1590
  store i32 0, i32* %u32Temp1, align 4, !dbg !1590
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1591, metadata !DIExpression()), !dbg !1592
  store i32 0, i32* %u32Temp2, align 4, !dbg !1592
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1593, metadata !DIExpression()), !dbg !1594
  store i32 0, i32* %u32Temp3, align 4, !dbg !1594
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1595, metadata !DIExpression()), !dbg !1596
  store i32 0, i32* %numerator_old, align 4, !dbg !1596
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1597
  %cmp = icmp eq i32 %0, 0, !dbg !1599
  br i1 %cmp, label %if.then, label %if.else, !dbg !1600

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1601
  br label %return, !dbg !1601

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1603
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1605
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1606
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1607
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1608
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1608
  %div = udiv i32 %3, %4, !dbg !1608, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1609
  %sub = sub i32 %1, %mul, !dbg !1610
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1611
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1612
  %and = and i32 %5, 1, !dbg !1614
  %cmp1 = icmp eq i32 %and, 0, !dbg !1615
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1616

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1617
  %shr = lshr i32 %6, 1, !dbg !1619
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1620
  br label %if.end, !dbg !1621

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1622
  %shr4 = lshr i32 %7, 1, !dbg !1624
  %add = add i32 %shr4, 1, !dbg !1625
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1626
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1627
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1629
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1630
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1631

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1632
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1634
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1635
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1635
  %div7 = udiv i32 %10, %11, !dbg !1635, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1636
  br label %return, !dbg !1636

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1637
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1639
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1640
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1640
  %div9 = udiv i32 %12, %13, !dbg !1640, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1641
  store i32 %add10, i32* %retval, align 4, !dbg !1642
  br label %return, !dbg !1642

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1643
  ret i32 %14, !dbg !1643
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1644 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1647, metadata !DIExpression()), !dbg !1648
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1649, metadata !DIExpression()), !dbg !1650
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1651, metadata !DIExpression()), !dbg !1652
  store i32 0, i32* %u32Temp1, align 4, !dbg !1652
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1653, metadata !DIExpression()), !dbg !1654
  store i32 0, i32* %u32Temp2, align 4, !dbg !1654
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1655
  %cmp = icmp sle i32 %0, 0, !dbg !1657
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1658

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1659
  %cmp1 = icmp sge i32 %1, 0, !dbg !1662
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1663

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1664
  br label %return, !dbg !1664

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1666
  %sub = sub nsw i32 0, %2, !dbg !1668
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1669
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1670
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1671
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1672
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1673
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1673
  %div = udiv i32 %4, %5, !dbg !1673, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1674
  %mul = mul i32 %div, %6, !dbg !1675
  %sub3 = sub i32 %3, %mul, !dbg !1676
  %shl = shl i32 %sub3, 1, !dbg !1677
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1678
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1679
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1680
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1681
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1681
  %div4 = udiv i32 %7, %8, !dbg !1681, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1682
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1683
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1684
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1684
  %div5 = udiv i32 %9, %10, !dbg !1684, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1685
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1686
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1687
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1689
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1690

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1691
  %sub8 = sub i32 0, %12, !dbg !1693
  store i32 %sub8, i32* %retval, align 4, !dbg !1694
  br label %return, !dbg !1694

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1695
  br label %return, !dbg !1695

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1697
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1699
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1700
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1701
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1701
  %div11 = udiv i32 %14, %15, !dbg !1701, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1702
  %mul12 = mul i32 %div11, %16, !dbg !1703
  %sub13 = sub i32 %13, %mul12, !dbg !1704
  %shl14 = shl i32 %sub13, 1, !dbg !1705
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1706
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1707
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1708
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1709
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1709
  %div15 = udiv i32 %17, %18, !dbg !1709, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1710
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1711
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1712
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1712
  %div16 = udiv i32 %19, %20, !dbg !1712, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1713
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1714
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1715
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1717
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1718

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1719
  store i32 %22, i32* %retval, align 4, !dbg !1721
  br label %return, !dbg !1721

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1722
  br label %return, !dbg !1722

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1724
  ret i32 %23, !dbg !1724
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1725 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1728, metadata !DIExpression()), !dbg !1729
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1730, metadata !DIExpression()), !dbg !1731
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1732, metadata !DIExpression()), !dbg !1733
  store i32 0, i32* %s32Temp1, align 4, !dbg !1733
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1734, metadata !DIExpression()), !dbg !1735
  store i32 0, i32* %s32Temp2, align 4, !dbg !1735
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1736, metadata !DIExpression()), !dbg !1737
  store i32 0, i32* %u32Temp0, align 4, !dbg !1737
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1738, metadata !DIExpression()), !dbg !1739
  store i32 0, i32* %u32Temp1, align 4, !dbg !1739
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1740, metadata !DIExpression()), !dbg !1741
  store i32 0, i32* %u32Temp2, align 4, !dbg !1741
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1742
  %cmp = icmp eq i32 %0, 0, !dbg !1744
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1745

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1746
  %cmp1 = icmp slt i32 %1, 0, !dbg !1749
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1750

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1751
  br label %return, !dbg !1751

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1753
  br label %return, !dbg !1753

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1755
  %cmp4 = icmp sle i32 %2, 0, !dbg !1758
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1759

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1760
  %sub = sub nsw i32 0, %3, !dbg !1762
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1763
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1764
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1765
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1766
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1766
  %div = udiv i32 %4, %5, !dbg !1766, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1767
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1768
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1769
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1770
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1771
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1771
  %div6 = udiv i32 %7, %8, !dbg !1771, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1772
  %mul = mul i32 %div6, %9, !dbg !1773
  %sub7 = sub i32 %6, %mul, !dbg !1774
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1775
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1776
  %and = and i32 %10, 1, !dbg !1778
  %cmp8 = icmp eq i32 %and, 0, !dbg !1779
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1780

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1781
  %shr = lshr i32 %11, 1, !dbg !1783
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1784
  br label %if.end, !dbg !1785

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1786
  %shr11 = lshr i32 %12, 1, !dbg !1788
  %add = add i32 %shr11, 1, !dbg !1789
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1790
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1791
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1793
  %cmp12 = icmp ult i32 %13, %14, !dbg !1794
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1795

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1796
  %neg = xor i32 %15, -1, !dbg !1798
  %add14 = add i32 %neg, 1, !dbg !1799
  store i32 %add14, i32* %retval, align 4, !dbg !1800
  br label %return, !dbg !1800

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1801
  %add16 = add i32 %16, 1, !dbg !1803
  %neg17 = xor i32 %add16, -1, !dbg !1804
  %add18 = add i32 %neg17, 1, !dbg !1805
  store i32 %add18, i32* %retval, align 4, !dbg !1806
  br label %return, !dbg !1806

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1807
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1809
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1810
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1811
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1811
  %div20 = udiv i32 %18, %19, !dbg !1811, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1812
  %mul21 = mul i32 %div20, %20, !dbg !1813
  %sub22 = sub i32 %17, %mul21, !dbg !1814
  %shl = shl i32 %sub22, 1, !dbg !1815
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1816
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1817
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1818
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1819
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1819
  %div23 = udiv i32 %21, %22, !dbg !1819, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1820
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1821
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1822
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1822
  %div24 = udiv i32 %23, %24, !dbg !1822, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1823
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1824
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1825
  store i32 %25, i32* %retval, align 4, !dbg !1826
  br label %return, !dbg !1826

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1827
  ret i32 %26, !dbg !1827
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1828 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1831, metadata !DIExpression()), !dbg !1832
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1833, metadata !DIExpression()), !dbg !1834
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1835, metadata !DIExpression()), !dbg !1836
  store i32 0, i32* %s32Temp1, align 4, !dbg !1836
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1837, metadata !DIExpression()), !dbg !1838
  store i32 0, i32* %s32Temp2, align 4, !dbg !1838
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1839, metadata !DIExpression()), !dbg !1840
  store i32 0, i32* %denominator_prime, align 4, !dbg !1840
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1841, metadata !DIExpression()), !dbg !1842
  store i32 0, i32* %u32Temp1, align 4, !dbg !1842
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1843, metadata !DIExpression()), !dbg !1844
  store i32 0, i32* %u32Temp2, align 4, !dbg !1844
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1845, metadata !DIExpression()), !dbg !1846
  store i32 0, i32* %u32numerator, align 4, !dbg !1846
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1847, metadata !DIExpression()), !dbg !1848
  store i32 0, i32* %u32denominator, align 4, !dbg !1848
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1849
  %cmp = icmp slt i32 %0, 0, !dbg !1851
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1852

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1853
  %cmp1 = icmp sle i32 %1, 0, !dbg !1856
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1857

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1858
  %cmp3 = icmp sge i32 %2, 0, !dbg !1861
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1862

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1863
  br label %return, !dbg !1863

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1865
  %sub = sub nsw i32 0, %3, !dbg !1867
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1868
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1869
  %sub5 = sub nsw i32 0, %4, !dbg !1870
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1871
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1872
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1873
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1874
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1875
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1875
  %div = udiv i32 %6, %7, !dbg !1875, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1876
  %mul = mul i32 %div, %8, !dbg !1877
  %sub6 = sub i32 %5, %mul, !dbg !1878
  %shl = shl i32 %sub6, 1, !dbg !1879
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1880
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1881
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1882
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1883
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1883
  %div7 = udiv i32 %9, %10, !dbg !1883, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1884
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1885
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1886
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1886
  %div8 = udiv i32 %11, %12, !dbg !1886, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1887
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1888
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1889
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1891
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1892

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1893
  store i32 %14, i32* %retval, align 4, !dbg !1895
  br label %return, !dbg !1895

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1896
  br label %return, !dbg !1896

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1898
  %neg = xor i32 %15, -1, !dbg !1900
  %add13 = add nsw i32 %neg, 1, !dbg !1901
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1902
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1903
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1904
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1905
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1906
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1906
  %div14 = udiv i32 %17, %18, !dbg !1906, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1907
  %mul15 = mul i32 %div14, %19, !dbg !1908
  %sub16 = sub i32 %16, %mul15, !dbg !1909
  %shl17 = shl i32 %sub16, 1, !dbg !1910
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1911
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1912
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1913
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1914
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1914
  %div18 = udiv i32 %20, %21, !dbg !1914, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1915
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1916
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1917
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1917
  %div19 = sdiv i32 %22, %23, !dbg !1917, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1918
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1919
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1920
  %neg21 = xor i32 %24, -1, !dbg !1921
  %add22 = add nsw i32 %neg21, 1, !dbg !1922
  store i32 %add22, i32* %retval, align 4, !dbg !1923
  br label %return, !dbg !1923

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1924
  %cmp24 = icmp sle i32 %25, 0, !dbg !1927
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1928

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1929
  %cmp26 = icmp sge i32 %26, 0, !dbg !1932
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1933

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1934
  br label %return, !dbg !1934

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1936
  %neg29 = xor i32 %27, -1, !dbg !1938
  %add30 = add nsw i32 %neg29, 1, !dbg !1939
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1940
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1941
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1942
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1943
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1944
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1944
  %div31 = udiv i32 %29, %30, !dbg !1944, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1945
  %mul32 = mul i32 %div31, %31, !dbg !1946
  %sub33 = sub i32 %28, %mul32, !dbg !1947
  %shl34 = shl i32 %sub33, 1, !dbg !1948
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1949
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1950
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1951
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1952
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1952
  %div35 = udiv i32 %32, %33, !dbg !1952, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1953
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1954
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1955
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1955
  %div36 = udiv i32 %34, %35, !dbg !1955, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1956
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1957
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1958
  %neg38 = xor i32 %36, -1, !dbg !1959
  %add39 = add nsw i32 %neg38, 1, !dbg !1960
  store i32 %add39, i32* %retval, align 4, !dbg !1961
  br label %return, !dbg !1961

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1962
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1964
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1965
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1966
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1966
  %div41 = sdiv i32 %38, %39, !dbg !1966, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1967
  %mul42 = mul nsw i32 %div41, %40, !dbg !1968
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1969
  %shl44 = shl i32 %sub43, 1, !dbg !1970
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1971
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1972
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1973
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1974
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1974
  %div45 = sdiv i32 %41, %42, !dbg !1974, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1975
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1976
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1977
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1977
  %div46 = udiv i32 %43, %44, !dbg !1977, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1978
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1979
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1980
  store i32 %45, i32* %retval, align 4, !dbg !1981
  br label %return, !dbg !1981

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1982
  ret i32 %46, !dbg !1982
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1983 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1986, metadata !DIExpression()), !dbg !1987
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1988, metadata !DIExpression()), !dbg !1989
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1990, metadata !DIExpression()), !dbg !1991
  store i32 0, i32* %numerator_prime, align 4, !dbg !1991
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1992, metadata !DIExpression()), !dbg !1993
  store i32 0, i32* %u32Temp1, align 4, !dbg !1993
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1994, metadata !DIExpression()), !dbg !1995
  store i32 0, i32* %u32Temp2, align 4, !dbg !1995
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1996, metadata !DIExpression()), !dbg !1997
  store i32 0, i32* %u32Temp3, align 4, !dbg !1997
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1998, metadata !DIExpression()), !dbg !1999
  store i32 0, i32* %s32Temp1, align 4, !dbg !1999
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !2000, metadata !DIExpression()), !dbg !2001
  store i32 0, i32* %s32Temp2, align 4, !dbg !2001
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !2002, metadata !DIExpression()), !dbg !2003
  store i32 0, i32* %s32Temp3, align 4, !dbg !2003
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !2004
  %cmp = icmp eq i32 %0, 0, !dbg !2006
  br i1 %cmp, label %if.then, label %if.else3, !dbg !2007

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !2008
  %cmp1 = icmp slt i32 %1, 0, !dbg !2011
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !2012

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !2013
  br label %return, !dbg !2013

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !2015
  br label %return, !dbg !2015

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !2017
  %cmp4 = icmp slt i32 %2, 0, !dbg !2020
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !2021

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !2022
  %sub = sub nsw i32 0, %3, !dbg !2024
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !2025
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !2026
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !2027
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !2028
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !2028
  %div = udiv i32 %4, %5, !dbg !2028, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !2029
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !2030
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !2031
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !2032
  %mul = mul i32 %7, %8, !dbg !2033
  %sub6 = sub i32 %6, %mul, !dbg !2034
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !2035
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !2036
  %and = and i32 %9, 1, !dbg !2038
  %cmp7 = icmp eq i32 %and, 0, !dbg !2039
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !2040

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !2041
  %shr = lshr i32 %10, 1, !dbg !2043
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !2044
  br label %if.end, !dbg !2045

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !2046
  %shr10 = lshr i32 %11, 1, !dbg !2048
  %add = add i32 %shr10, 1, !dbg !2049
  store i32 %add, i32* %denominator.addr, align 4, !dbg !2050
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2051
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !2053
  %cmp11 = icmp ult i32 %12, %13, !dbg !2054
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !2055

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2056
  %neg = xor i32 %14, -1, !dbg !2058
  %add13 = add i32 %neg, 1, !dbg !2059
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !2060
  br label %if.end18, !dbg !2061

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !2062
  %add15 = add i32 %15, 1, !dbg !2064
  %neg16 = xor i32 %add15, -1, !dbg !2065
  %add17 = add i32 %neg16, 1, !dbg !2066
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !2067
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !2068
  %cmp19 = icmp sge i32 %16, -32768, !dbg !2070
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !2071

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !2072
  %conv = trunc i32 %17 to i16, !dbg !2074
  store i16 %conv, i16* %retval, align 2, !dbg !2075
  br label %return, !dbg !2075

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !2076
  br label %return, !dbg !2076

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !2078
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !2080
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !2081
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !2081
  %div23 = udiv i32 %18, %19, !dbg !2081, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !2082
  %mul24 = mul i32 %div23, %20, !dbg !2083
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !2084
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !2085
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !2086
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !2087
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !2088
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !2088
  %div25 = udiv i32 %22, %23, !dbg !2088, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !2089
  %mul26 = mul i32 %div25, %24, !dbg !2090
  %sub27 = sub i32 %21, %mul26, !dbg !2091
  %shl = shl i32 %sub27, 1, !dbg !2092
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !2093
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !2094
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !2095
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !2096
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !2096
  %div28 = udiv i32 %25, %26, !dbg !2096, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !2097
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !2098
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !2099
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !2099
  %div29 = udiv i32 %27, %28, !dbg !2099, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !2100
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2101
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2102
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2104
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2105

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2106
  %conv34 = trunc i32 %30 to i16, !dbg !2108
  store i16 %conv34, i16* %retval, align 2, !dbg !2109
  br label %return, !dbg !2109

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2110
  br label %return, !dbg !2110

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2112
  ret i16 %31, !dbg !2112
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2113 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2119, metadata !DIExpression()), !dbg !2120
  %2 = icmp eq i64 %0, 0, !dbg !2121
  br i1 %2, label %3, label %4, !dbg !2123

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2124
  unreachable, !dbg !2124

4:                                                ; preds = %1
  ret void, !dbg !2125
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2126 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2132, metadata !DIExpression()), !dbg !2134
  call void @llvm.dbg.value(metadata i64 %1, metadata !2133, metadata !DIExpression()), !dbg !2134
  %3 = icmp ult i64 %1, %0, !dbg !2135
  br i1 %3, label %5, label %4, !dbg !2137

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2138
  unreachable, !dbg !2138

5:                                                ; preds = %2
  ret void, !dbg !2140
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0034/div_Ccode_alarm_0034.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0034")
!4 = !{}
!5 = !{!6, !13, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0034")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0034")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0034/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0034")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0034")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0034")
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
!225 = !DILocation(line: 279, column: 64, scope: !226)
!226 = distinct !DILexicalBlock(scope: !219, file: !69, line: 279, column: 8)
!227 = !DILocation(line: 279, column: 87, scope: !226)
!228 = !DILocation(line: 279, column: 103, scope: !226)
!229 = !DILocation(line: 279, column: 98, scope: !226)
!230 = !DILocation(line: 279, column: 96, scope: !226)
!231 = !DILocation(line: 279, column: 123, scope: !226)
!232 = !DILocation(line: 279, column: 118, scope: !226)
!233 = !DILocation(line: 279, column: 116, scope: !226)
!234 = !DILocation(line: 279, column: 73, scope: !226)
!235 = !DILocation(line: 279, column: 48, scope: !226)
!236 = !DILocation(line: 279, column: 10, scope: !226)
!237 = !DILocation(line: 279, column: 8, scope: !219)
!238 = !DILocation(line: 280, column: 8, scope: !239)
!239 = distinct !DILexicalBlock(scope: !226, file: !69, line: 279, column: 141)
!240 = !DILocation(line: 283, column: 54, scope: !241)
!241 = distinct !DILexicalBlock(scope: !219, file: !69, line: 283, column: 8)
!242 = !DILocation(line: 283, column: 77, scope: !241)
!243 = !DILocation(line: 283, column: 93, scope: !241)
!244 = !DILocation(line: 283, column: 88, scope: !241)
!245 = !DILocation(line: 283, column: 86, scope: !241)
!246 = !DILocation(line: 283, column: 113, scope: !241)
!247 = !DILocation(line: 283, column: 108, scope: !241)
!248 = !DILocation(line: 283, column: 106, scope: !241)
!249 = !DILocation(line: 283, column: 63, scope: !241)
!250 = !DILocation(line: 283, column: 38, scope: !241)
!251 = !DILocation(line: 283, column: 10, scope: !241)
!252 = !DILocation(line: 283, column: 8, scope: !219)
!253 = !DILocation(line: 284, column: 8, scope: !254)
!254 = distinct !DILexicalBlock(scope: !241, file: !69, line: 283, column: 146)
!255 = !DILocation(line: 287, column: 51, scope: !256)
!256 = distinct !DILexicalBlock(scope: !219, file: !69, line: 287, column: 8)
!257 = !DILocation(line: 287, column: 67, scope: !256)
!258 = !DILocation(line: 287, column: 62, scope: !256)
!259 = !DILocation(line: 287, column: 60, scope: !256)
!260 = !DILocation(line: 287, column: 35, scope: !256)
!261 = !DILocation(line: 287, column: 97, scope: !256)
!262 = !DILocation(line: 287, column: 92, scope: !256)
!263 = !DILocation(line: 287, column: 82, scope: !256)
!264 = !DILocation(line: 287, column: 10, scope: !256)
!265 = !DILocation(line: 287, column: 8, scope: !219)
!266 = !DILocation(line: 288, column: 8, scope: !267)
!267 = distinct !DILexicalBlock(scope: !256, file: !69, line: 287, column: 113)
!268 = !DILocation(line: 291, column: 51, scope: !269)
!269 = distinct !DILexicalBlock(scope: !219, file: !69, line: 291, column: 8)
!270 = !DILocation(line: 291, column: 67, scope: !269)
!271 = !DILocation(line: 291, column: 62, scope: !269)
!272 = !DILocation(line: 291, column: 60, scope: !269)
!273 = !DILocation(line: 291, column: 35, scope: !269)
!274 = !DILocation(line: 291, column: 97, scope: !269)
!275 = !DILocation(line: 291, column: 92, scope: !269)
!276 = !DILocation(line: 291, column: 82, scope: !269)
!277 = !DILocation(line: 291, column: 10, scope: !269)
!278 = !DILocation(line: 291, column: 8, scope: !219)
!279 = !DILocation(line: 292, column: 8, scope: !280)
!280 = distinct !DILexicalBlock(scope: !269, file: !69, line: 291, column: 113)
!281 = !DILocation(line: 294, column: 16, scope: !219)
!282 = !DILocation(line: 294, column: 28, scope: !219)
!283 = !DILocation(line: 294, column: 37, scope: !219)
!284 = !DILocation(line: 294, column: 36, scope: !219)
!285 = !DILocation(line: 294, column: 52, scope: !219)
!286 = !DILocation(line: 294, column: 50, scope: !219)
!287 = !DILocation(line: 294, column: 25, scope: !219)
!288 = !DILocation(line: 294, column: 65, scope: !219)
!289 = !DILocation(line: 294, column: 13, scope: !219)
!290 = !DILocation(line: 296, column: 47, scope: !291)
!291 = distinct !DILexicalBlock(scope: !219, file: !69, line: 296, column: 8)
!292 = !DILocation(line: 296, column: 37, scope: !291)
!293 = !DILocation(line: 296, column: 10, scope: !291)
!294 = !DILocation(line: 296, column: 8, scope: !219)
!295 = !DILocation(line: 297, column: 8, scope: !296)
!296 = distinct !DILexicalBlock(scope: !291, file: !69, line: 296, column: 63)
!297 = !DILocation(line: 299, column: 15, scope: !219)
!298 = !DILocation(line: 299, column: 24, scope: !219)
!299 = !DILocation(line: 299, column: 23, scope: !219)
!300 = !DILocation(line: 299, column: 13, scope: !219)
!301 = !DILocation(line: 301, column: 47, scope: !302)
!302 = distinct !DILexicalBlock(scope: !219, file: !69, line: 301, column: 8)
!303 = !DILocation(line: 301, column: 37, scope: !302)
!304 = !DILocation(line: 301, column: 10, scope: !302)
!305 = !DILocation(line: 301, column: 8, scope: !219)
!306 = !DILocation(line: 302, column: 8, scope: !307)
!307 = distinct !DILexicalBlock(scope: !302, file: !69, line: 301, column: 63)
!308 = !DILocation(line: 305, column: 45, scope: !309)
!309 = distinct !DILexicalBlock(scope: !219, file: !69, line: 305, column: 8)
!310 = !DILocation(line: 305, column: 35, scope: !309)
!311 = !DILocation(line: 305, column: 72, scope: !309)
!312 = !DILocation(line: 305, column: 89, scope: !309)
!313 = !DILocation(line: 305, column: 84, scope: !309)
!314 = !DILocation(line: 305, column: 82, scope: !309)
!315 = !DILocation(line: 305, column: 56, scope: !309)
!316 = !DILocation(line: 305, column: 10, scope: !309)
!317 = !DILocation(line: 305, column: 8, scope: !219)
!318 = !DILocation(line: 306, column: 8, scope: !319)
!319 = distinct !DILexicalBlock(scope: !309, file: !69, line: 305, column: 106)
!320 = !DILocation(line: 309, column: 45, scope: !321)
!321 = distinct !DILexicalBlock(scope: !219, file: !69, line: 309, column: 8)
!322 = !DILocation(line: 309, column: 35, scope: !321)
!323 = !DILocation(line: 309, column: 72, scope: !321)
!324 = !DILocation(line: 309, column: 89, scope: !321)
!325 = !DILocation(line: 309, column: 84, scope: !321)
!326 = !DILocation(line: 309, column: 82, scope: !321)
!327 = !DILocation(line: 309, column: 56, scope: !321)
!328 = !DILocation(line: 309, column: 10, scope: !321)
!329 = !DILocation(line: 309, column: 8, scope: !219)
!330 = !DILocation(line: 310, column: 8, scope: !331)
!331 = distinct !DILexicalBlock(scope: !321, file: !69, line: 309, column: 106)
!332 = !DILocation(line: 312, column: 15, scope: !219)
!333 = !DILocation(line: 312, column: 27, scope: !219)
!334 = !DILocation(line: 312, column: 38, scope: !219)
!335 = !DILocation(line: 312, column: 37, scope: !219)
!336 = !DILocation(line: 312, column: 24, scope: !219)
!337 = !DILocation(line: 312, column: 13, scope: !219)
!338 = !DILocation(line: 313, column: 7, scope: !339)
!339 = distinct !DILexicalBlock(scope: !219, file: !69, line: 313, column: 7)
!340 = !DILocation(line: 313, column: 16, scope: !339)
!341 = !DILocation(line: 313, column: 7, scope: !219)
!342 = !DILocation(line: 315, column: 8, scope: !343)
!343 = distinct !DILexicalBlock(scope: !344, file: !69, line: 315, column: 8)
!344 = distinct !DILexicalBlock(scope: !339, file: !69, line: 314, column: 4)
!345 = !DILocation(line: 315, column: 17, scope: !343)
!346 = !DILocation(line: 315, column: 8, scope: !344)
!347 = !DILocation(line: 317, column: 18, scope: !348)
!348 = distinct !DILexicalBlock(scope: !343, file: !69, line: 316, column: 5)
!349 = !DILocation(line: 317, column: 13, scope: !348)
!350 = !DILocation(line: 317, column: 6, scope: !348)
!351 = !DILocation(line: 321, column: 6, scope: !352)
!352 = distinct !DILexicalBlock(scope: !343, file: !69, line: 320, column: 5)
!353 = !DILocation(line: 326, column: 5, scope: !354)
!354 = distinct !DILexicalBlock(scope: !339, file: !69, line: 325, column: 4)
!355 = !DILocation(line: 331, column: 7, scope: !356)
!356 = distinct !DILexicalBlock(scope: !357, file: !69, line: 331, column: 7)
!357 = distinct !DILexicalBlock(scope: !213, file: !69, line: 330, column: 3)
!358 = !DILocation(line: 331, column: 19, scope: !356)
!359 = !DILocation(line: 331, column: 7, scope: !357)
!360 = !DILocation(line: 334, column: 48, scope: !361)
!361 = distinct !DILexicalBlock(scope: !362, file: !69, line: 334, column: 9)
!362 = distinct !DILexicalBlock(scope: !356, file: !69, line: 332, column: 4)
!363 = !DILocation(line: 334, column: 38, scope: !361)
!364 = !DILocation(line: 334, column: 11, scope: !361)
!365 = !DILocation(line: 334, column: 9, scope: !362)
!366 = !DILocation(line: 335, column: 9, scope: !367)
!367 = distinct !DILexicalBlock(scope: !361, file: !69, line: 334, column: 64)
!368 = !DILocation(line: 338, column: 65, scope: !369)
!369 = distinct !DILexicalBlock(scope: !362, file: !69, line: 338, column: 9)
!370 = !DILocation(line: 338, column: 88, scope: !369)
!371 = !DILocation(line: 338, column: 104, scope: !369)
!372 = !DILocation(line: 338, column: 99, scope: !369)
!373 = !DILocation(line: 338, column: 97, scope: !369)
!374 = !DILocation(line: 338, column: 124, scope: !369)
!375 = !DILocation(line: 338, column: 119, scope: !369)
!376 = !DILocation(line: 338, column: 117, scope: !369)
!377 = !DILocation(line: 338, column: 74, scope: !369)
!378 = !DILocation(line: 338, column: 49, scope: !369)
!379 = !DILocation(line: 338, column: 11, scope: !369)
!380 = !DILocation(line: 338, column: 9, scope: !362)
!381 = !DILocation(line: 339, column: 9, scope: !382)
!382 = distinct !DILexicalBlock(scope: !369, file: !69, line: 338, column: 142)
!383 = !DILocation(line: 342, column: 52, scope: !384)
!384 = distinct !DILexicalBlock(scope: !362, file: !69, line: 342, column: 9)
!385 = !DILocation(line: 342, column: 68, scope: !384)
!386 = !DILocation(line: 342, column: 63, scope: !384)
!387 = !DILocation(line: 342, column: 61, scope: !384)
!388 = !DILocation(line: 342, column: 36, scope: !384)
!389 = !DILocation(line: 342, column: 98, scope: !384)
!390 = !DILocation(line: 342, column: 93, scope: !384)
!391 = !DILocation(line: 342, column: 83, scope: !384)
!392 = !DILocation(line: 342, column: 11, scope: !384)
!393 = !DILocation(line: 342, column: 9, scope: !362)
!394 = !DILocation(line: 343, column: 9, scope: !395)
!395 = distinct !DILexicalBlock(scope: !384, file: !69, line: 342, column: 114)
!396 = !DILocation(line: 346, column: 52, scope: !397)
!397 = distinct !DILexicalBlock(scope: !362, file: !69, line: 346, column: 9)
!398 = !DILocation(line: 346, column: 68, scope: !397)
!399 = !DILocation(line: 346, column: 63, scope: !397)
!400 = !DILocation(line: 346, column: 61, scope: !397)
!401 = !DILocation(line: 346, column: 36, scope: !397)
!402 = !DILocation(line: 346, column: 98, scope: !397)
!403 = !DILocation(line: 346, column: 93, scope: !397)
!404 = !DILocation(line: 346, column: 83, scope: !397)
!405 = !DILocation(line: 346, column: 11, scope: !397)
!406 = !DILocation(line: 346, column: 9, scope: !362)
!407 = !DILocation(line: 347, column: 9, scope: !408)
!408 = distinct !DILexicalBlock(scope: !397, file: !69, line: 346, column: 114)
!409 = !DILocation(line: 350, column: 54, scope: !410)
!410 = distinct !DILexicalBlock(scope: !362, file: !69, line: 350, column: 9)
!411 = !DILocation(line: 350, column: 44, scope: !410)
!412 = !DILocation(line: 350, column: 80, scope: !410)
!413 = !DILocation(line: 350, column: 75, scope: !410)
!414 = !DILocation(line: 350, column: 65, scope: !410)
!415 = !DILocation(line: 350, column: 11, scope: !410)
!416 = !DILocation(line: 350, column: 9, scope: !362)
!417 = !DILocation(line: 351, column: 9, scope: !418)
!418 = distinct !DILexicalBlock(scope: !410, file: !69, line: 350, column: 96)
!419 = !DILocation(line: 354, column: 55, scope: !420)
!420 = distinct !DILexicalBlock(scope: !362, file: !69, line: 354, column: 9)
!421 = !DILocation(line: 354, column: 78, scope: !420)
!422 = !DILocation(line: 354, column: 94, scope: !420)
!423 = !DILocation(line: 354, column: 89, scope: !420)
!424 = !DILocation(line: 354, column: 87, scope: !420)
!425 = !DILocation(line: 354, column: 114, scope: !420)
!426 = !DILocation(line: 354, column: 109, scope: !420)
!427 = !DILocation(line: 354, column: 107, scope: !420)
!428 = !DILocation(line: 354, column: 64, scope: !420)
!429 = !DILocation(line: 354, column: 39, scope: !420)
!430 = !DILocation(line: 354, column: 11, scope: !420)
!431 = !DILocation(line: 354, column: 9, scope: !362)
!432 = !DILocation(line: 355, column: 9, scope: !433)
!433 = distinct !DILexicalBlock(scope: !420, file: !69, line: 354, column: 147)
!434 = !DILocation(line: 362, column: 43, scope: !362)
!435 = !DILocation(line: 362, column: 66, scope: !362)
!436 = !DILocation(line: 362, column: 82, scope: !362)
!437 = !DILocation(line: 362, column: 77, scope: !362)
!438 = !DILocation(line: 362, column: 75, scope: !362)
!439 = !DILocation(line: 362, column: 102, scope: !362)
!440 = !DILocation(line: 362, column: 97, scope: !362)
!441 = !DILocation(line: 362, column: 95, scope: !362)
!442 = !DILocation(line: 362, column: 52, scope: !362)
!443 = !DILocation(line: 362, column: 116, scope: !362)
!444 = !DILocation(line: 362, column: 27, scope: !362)
!445 = !DILocation(line: 362, column: 25, scope: !362)
!446 = !DILocation(line: 363, column: 5, scope: !362)
!447 = !DILocation(line: 385, column: 5, scope: !448)
!448 = distinct !DILexicalBlock(scope: !356, file: !69, line: 384, column: 4)
!449 = !DILocation(line: 391, column: 1, scope: !186)
!450 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !451, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!451 = !DISubroutineType(types: !452)
!452 = !{!19, !13}
!453 = !DILocalVariable(name: "denominator", arg: 1, scope: !450, file: !33, line: 24, type: !13)
!454 = !DILocation(line: 24, column: 40, scope: !450)
!455 = !DILocation(line: 26, column: 12, scope: !450)
!456 = !DILocation(line: 26, column: 24, scope: !450)
!457 = !DILocation(line: 26, column: 5, scope: !450)
!458 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !451, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!459 = !DILocalVariable(name: "left", arg: 1, scope: !458, file: !33, line: 84, type: !13)
!460 = !DILocation(line: 84, column: 51, scope: !458)
!461 = !DILocation(line: 86, column: 12, scope: !458)
!462 = !DILocation(line: 86, column: 17, scope: !458)
!463 = !DILocation(line: 86, column: 5, scope: !458)
!464 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !465, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!465 = !DISubroutineType(types: !466)
!466 = !{!19, !13, !20}
!467 = !DILocalVariable(name: "left", arg: 1, scope: !464, file: !33, line: 90, type: !13)
!468 = !DILocation(line: 90, column: 41, scope: !464)
!469 = !DILocalVariable(name: "count", arg: 2, scope: !464, file: !33, line: 90, type: !20)
!470 = !DILocation(line: 90, column: 56, scope: !464)
!471 = !DILocation(line: 92, column: 9, scope: !472)
!472 = distinct !DILexicalBlock(scope: !464, file: !33, line: 92, column: 9)
!473 = !DILocation(line: 92, column: 15, scope: !472)
!474 = !DILocation(line: 92, column: 9, scope: !464)
!475 = !DILocation(line: 93, column: 9, scope: !476)
!476 = distinct !DILexicalBlock(scope: !472, file: !33, line: 92, column: 32)
!477 = !DILocation(line: 95, column: 12, scope: !464)
!478 = !DILocation(line: 95, column: 34, scope: !464)
!479 = !DILocation(line: 95, column: 31, scope: !464)
!480 = !DILocation(line: 95, column: 17, scope: !464)
!481 = !DILocation(line: 95, column: 41, scope: !464)
!482 = !DILocation(line: 95, column: 5, scope: !464)
!483 = !DILocation(line: 96, column: 1, scope: !464)
!484 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !485, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!485 = !DISubroutineType(types: !486)
!486 = !{!19, !13, !13}
!487 = !DILocalVariable(name: "left", arg: 1, scope: !484, file: !33, line: 78, type: !13)
!488 = !DILocation(line: 78, column: 38, scope: !484)
!489 = !DILocalVariable(name: "right", arg: 2, scope: !484, file: !33, line: 78, type: !13)
!490 = !DILocation(line: 78, column: 52, scope: !484)
!491 = !DILocation(line: 80, column: 12, scope: !484)
!492 = !DILocation(line: 80, column: 19, scope: !484)
!493 = !DILocation(line: 80, column: 17, scope: !484)
!494 = !DILocation(line: 80, column: 25, scope: !484)
!495 = !DILocation(line: 80, column: 5, scope: !484)
!496 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !485, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!497 = !DILocalVariable(name: "left", arg: 1, scope: !496, file: !33, line: 72, type: !13)
!498 = !DILocation(line: 72, column: 38, scope: !496)
!499 = !DILocalVariable(name: "right", arg: 2, scope: !496, file: !33, line: 72, type: !13)
!500 = !DILocation(line: 72, column: 52, scope: !496)
!501 = !DILocation(line: 74, column: 12, scope: !496)
!502 = !DILocation(line: 74, column: 19, scope: !496)
!503 = !DILocation(line: 74, column: 17, scope: !496)
!504 = !DILocation(line: 74, column: 25, scope: !496)
!505 = !DILocation(line: 74, column: 5, scope: !496)
!506 = distinct !DISubprogram(name: "klee_alarm_s32_add_lower", scope: !33, file: !33, line: 48, type: !485, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!507 = !DILocalVariable(name: "left", arg: 1, scope: !506, file: !33, line: 48, type: !13)
!508 = !DILocation(line: 48, column: 38, scope: !506)
!509 = !DILocalVariable(name: "right", arg: 2, scope: !506, file: !33, line: 48, type: !13)
!510 = !DILocation(line: 48, column: 52, scope: !506)
!511 = !DILocation(line: 50, column: 12, scope: !506)
!512 = !DILocation(line: 50, column: 19, scope: !506)
!513 = !DILocation(line: 50, column: 17, scope: !506)
!514 = !DILocation(line: 50, column: 25, scope: !506)
!515 = !DILocation(line: 50, column: 5, scope: !506)
!516 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !485, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!517 = !DILocalVariable(name: "left", arg: 1, scope: !516, file: !33, line: 54, type: !13)
!518 = !DILocation(line: 54, column: 38, scope: !516)
!519 = !DILocalVariable(name: "right", arg: 2, scope: !516, file: !33, line: 54, type: !13)
!520 = !DILocation(line: 54, column: 52, scope: !516)
!521 = !DILocation(line: 56, column: 12, scope: !516)
!522 = !DILocation(line: 56, column: 19, scope: !516)
!523 = !DILocation(line: 56, column: 17, scope: !516)
!524 = !DILocation(line: 56, column: 25, scope: !516)
!525 = !DILocation(line: 56, column: 5, scope: !516)
!526 = distinct !DISubprogram(name: "klee_alarm_s32_div_representable", scope: !33, file: !33, line: 30, type: !485, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!527 = !DILocalVariable(name: "numerator", arg: 1, scope: !526, file: !33, line: 30, type: !13)
!528 = !DILocation(line: 30, column: 46, scope: !526)
!529 = !DILocalVariable(name: "denominator", arg: 2, scope: !526, file: !33, line: 30, type: !13)
!530 = !DILocation(line: 30, column: 65, scope: !526)
!531 = !DILocation(line: 32, column: 14, scope: !526)
!532 = !DILocation(line: 32, column: 24, scope: !526)
!533 = !DILocation(line: 32, column: 37, scope: !526)
!534 = !DILocation(line: 32, column: 12, scope: !526)
!535 = !DILocation(line: 32, column: 5, scope: !526)
!536 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 409, type: !537, scopeLine: 410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!537 = !DISubroutineType(types: !538)
!538 = !{!6, !6, !28}
!539 = !DILocalVariable(name: "numerator", arg: 1, scope: !536, file: !69, line: 409, type: !6)
!540 = !DILocation(line: 409, column: 31, scope: !536)
!541 = !DILocalVariable(name: "denominator", arg: 2, scope: !536, file: !69, line: 409, type: !28)
!542 = !DILocation(line: 409, column: 47, scope: !536)
!543 = !DILocalVariable(name: "u16Temp1", scope: !536, file: !69, line: 411, type: !28)
!544 = !DILocation(line: 411, column: 6, scope: !536)
!545 = !DILocalVariable(name: "s32Temp1", scope: !536, file: !69, line: 412, type: !16)
!546 = !DILocation(line: 412, column: 6, scope: !536)
!547 = !DILocalVariable(name: "s32Temp2", scope: !536, file: !69, line: 412, type: !16)
!548 = !DILocation(line: 412, column: 15, scope: !536)
!549 = !DILocation(line: 413, column: 13, scope: !536)
!550 = !DILocation(line: 413, column: 25, scope: !536)
!551 = !DILocation(line: 413, column: 11, scope: !536)
!552 = !DILocation(line: 414, column: 13, scope: !536)
!553 = !DILocation(line: 414, column: 22, scope: !536)
!554 = !DILocation(line: 414, column: 11, scope: !536)
!555 = !DILocation(line: 415, column: 5, scope: !556)
!556 = distinct !DILexicalBlock(scope: !536, file: !69, line: 415, column: 5)
!557 = !DILocation(line: 415, column: 14, scope: !556)
!558 = !DILocation(line: 415, column: 5, scope: !536)
!559 = !DILocation(line: 417, column: 7, scope: !560)
!560 = distinct !DILexicalBlock(scope: !561, file: !69, line: 417, column: 7)
!561 = distinct !DILexicalBlock(scope: !556, file: !69, line: 416, column: 2)
!562 = !DILocation(line: 417, column: 17, scope: !560)
!563 = !DILocation(line: 417, column: 7, scope: !561)
!564 = !DILocation(line: 419, column: 4, scope: !565)
!565 = distinct !DILexicalBlock(scope: !560, file: !69, line: 418, column: 3)
!566 = !DILocation(line: 423, column: 4, scope: !567)
!567 = distinct !DILexicalBlock(scope: !560, file: !69, line: 422, column: 3)
!568 = !DILocation(line: 428, column: 15, scope: !569)
!569 = distinct !DILexicalBlock(scope: !556, file: !69, line: 427, column: 2)
!570 = !DILocation(line: 428, column: 24, scope: !569)
!571 = !DILocation(line: 428, column: 32, scope: !569)
!572 = !DILocation(line: 428, column: 41, scope: !569)
!573 = !DILocation(line: 428, column: 47, scope: !569)
!574 = !DILocation(line: 428, column: 46, scope: !569)
!575 = !DILocation(line: 428, column: 57, scope: !569)
!576 = !DILocation(line: 428, column: 56, scope: !569)
!577 = !DILocation(line: 428, column: 29, scope: !569)
!578 = !DILocation(line: 428, column: 12, scope: !569)
!579 = !DILocation(line: 429, column: 14, scope: !569)
!580 = !DILocation(line: 429, column: 22, scope: !569)
!581 = !DILocation(line: 429, column: 12, scope: !569)
!582 = !DILocation(line: 430, column: 14, scope: !569)
!583 = !DILocation(line: 430, column: 23, scope: !569)
!584 = !DILocation(line: 430, column: 22, scope: !569)
!585 = !DILocation(line: 430, column: 12, scope: !569)
!586 = !DILocation(line: 431, column: 16, scope: !569)
!587 = !DILocation(line: 431, column: 25, scope: !569)
!588 = !DILocation(line: 431, column: 31, scope: !569)
!589 = !DILocation(line: 431, column: 30, scope: !569)
!590 = !DILocation(line: 431, column: 43, scope: !569)
!591 = !DILocation(line: 431, column: 41, scope: !569)
!592 = !DILocation(line: 431, column: 12, scope: !569)
!593 = !DILocation(line: 432, column: 6, scope: !594)
!594 = distinct !DILexicalBlock(scope: !569, file: !69, line: 432, column: 6)
!595 = !DILocation(line: 432, column: 15, scope: !594)
!596 = !DILocation(line: 432, column: 6, scope: !569)
!597 = !DILocation(line: 434, column: 7, scope: !598)
!598 = distinct !DILexicalBlock(scope: !599, file: !69, line: 434, column: 7)
!599 = distinct !DILexicalBlock(scope: !594, file: !69, line: 433, column: 3)
!600 = !DILocation(line: 434, column: 16, scope: !598)
!601 = !DILocation(line: 434, column: 7, scope: !599)
!602 = !DILocation(line: 436, column: 17, scope: !603)
!603 = distinct !DILexicalBlock(scope: !598, file: !69, line: 435, column: 4)
!604 = !DILocation(line: 436, column: 12, scope: !603)
!605 = !DILocation(line: 436, column: 5, scope: !603)
!606 = !DILocation(line: 440, column: 5, scope: !607)
!607 = distinct !DILexicalBlock(scope: !598, file: !69, line: 439, column: 4)
!608 = !DILocation(line: 445, column: 4, scope: !609)
!609 = distinct !DILexicalBlock(scope: !594, file: !69, line: 444, column: 3)
!610 = !DILocation(line: 448, column: 1, scope: !536)
!611 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 465, type: !537, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!612 = !DILocalVariable(name: "numerator", arg: 1, scope: !611, file: !69, line: 465, type: !6)
!613 = !DILocation(line: 465, column: 30, scope: !611)
!614 = !DILocalVariable(name: "denominator", arg: 2, scope: !611, file: !69, line: 465, type: !28)
!615 = !DILocation(line: 465, column: 45, scope: !611)
!616 = !DILocalVariable(name: "u16Temp1", scope: !611, file: !69, line: 467, type: !28)
!617 = !DILocation(line: 467, column: 6, scope: !611)
!618 = !DILocalVariable(name: "s32Temp1", scope: !611, file: !69, line: 468, type: !16)
!619 = !DILocation(line: 468, column: 6, scope: !611)
!620 = !DILocation(line: 469, column: 13, scope: !611)
!621 = !DILocation(line: 469, column: 25, scope: !611)
!622 = !DILocation(line: 469, column: 11, scope: !611)
!623 = !DILocation(line: 470, column: 5, scope: !624)
!624 = distinct !DILexicalBlock(scope: !611, file: !69, line: 470, column: 5)
!625 = !DILocation(line: 470, column: 13, scope: !624)
!626 = !DILocation(line: 470, column: 5, scope: !611)
!627 = !DILocation(line: 472, column: 6, scope: !628)
!628 = distinct !DILexicalBlock(scope: !629, file: !69, line: 472, column: 6)
!629 = distinct !DILexicalBlock(scope: !624, file: !69, line: 471, column: 2)
!630 = !DILocation(line: 472, column: 15, scope: !628)
!631 = !DILocation(line: 472, column: 6, scope: !629)
!632 = !DILocation(line: 474, column: 4, scope: !633)
!633 = distinct !DILexicalBlock(scope: !628, file: !69, line: 473, column: 3)
!634 = !DILocation(line: 478, column: 4, scope: !635)
!635 = distinct !DILexicalBlock(scope: !628, file: !69, line: 477, column: 3)
!636 = !DILocation(line: 484, column: 15, scope: !637)
!637 = distinct !DILexicalBlock(scope: !624, file: !69, line: 483, column: 2)
!638 = !DILocation(line: 484, column: 27, scope: !637)
!639 = !DILocation(line: 484, column: 37, scope: !637)
!640 = !DILocation(line: 484, column: 36, scope: !637)
!641 = !DILocation(line: 484, column: 49, scope: !637)
!642 = !DILocation(line: 484, column: 47, scope: !637)
!643 = !DILocation(line: 484, column: 25, scope: !637)
!644 = !DILocation(line: 484, column: 59, scope: !637)
!645 = !DILocation(line: 484, column: 12, scope: !637)
!646 = !DILocation(line: 485, column: 15, scope: !637)
!647 = !DILocation(line: 485, column: 24, scope: !637)
!648 = !DILocation(line: 485, column: 23, scope: !637)
!649 = !DILocation(line: 485, column: 37, scope: !637)
!650 = !DILocation(line: 485, column: 47, scope: !637)
!651 = !DILocation(line: 485, column: 46, scope: !637)
!652 = !DILocation(line: 485, column: 34, scope: !637)
!653 = !DILocation(line: 485, column: 12, scope: !637)
!654 = !DILocation(line: 486, column: 10, scope: !637)
!655 = !DILocation(line: 486, column: 3, scope: !637)
!656 = !DILocation(line: 488, column: 1, scope: !611)
!657 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 506, type: !658, scopeLine: 507, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!658 = !DISubroutineType(types: !659)
!659 = !{!24, !28, !28}
!660 = !DILocalVariable(name: "numerator", arg: 1, scope: !657, file: !69, line: 506, type: !28)
!661 = !DILocation(line: 506, column: 28, scope: !657)
!662 = !DILocalVariable(name: "denominator", arg: 2, scope: !657, file: !69, line: 506, type: !28)
!663 = !DILocation(line: 506, column: 43, scope: !657)
!664 = !DILocalVariable(name: "u32Temp1", scope: !657, file: !69, line: 508, type: !665)
!665 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !20)
!666 = !DILocation(line: 508, column: 6, scope: !657)
!667 = !DILocalVariable(name: "u32Temp2", scope: !657, file: !69, line: 508, type: !665)
!668 = !DILocation(line: 508, column: 20, scope: !657)
!669 = !DILocalVariable(name: "u32Temp3", scope: !657, file: !69, line: 508, type: !665)
!670 = !DILocation(line: 508, column: 33, scope: !657)
!671 = !DILocation(line: 509, column: 5, scope: !672)
!672 = distinct !DILexicalBlock(scope: !657, file: !69, line: 509, column: 5)
!673 = !DILocation(line: 509, column: 16, scope: !672)
!674 = !DILocation(line: 509, column: 5, scope: !657)
!675 = !DILocation(line: 511, column: 3, scope: !676)
!676 = distinct !DILexicalBlock(scope: !672, file: !69, line: 510, column: 2)
!677 = !DILocation(line: 515, column: 15, scope: !678)
!678 = distinct !DILexicalBlock(scope: !672, file: !69, line: 514, column: 2)
!679 = !DILocation(line: 515, column: 24, scope: !678)
!680 = !DILocation(line: 515, column: 12, scope: !678)
!681 = !DILocation(line: 516, column: 14, scope: !678)
!682 = !DILocation(line: 516, column: 25, scope: !678)
!683 = !DILocation(line: 516, column: 23, scope: !678)
!684 = !DILocation(line: 516, column: 12, scope: !678)
!685 = !DILocation(line: 517, column: 15, scope: !678)
!686 = !DILocation(line: 517, column: 24, scope: !678)
!687 = !DILocation(line: 517, column: 32, scope: !678)
!688 = !DILocation(line: 517, column: 12, scope: !678)
!689 = !DILocation(line: 518, column: 6, scope: !690)
!690 = distinct !DILexicalBlock(scope: !678, file: !69, line: 518, column: 6)
!691 = !DILocation(line: 518, column: 15, scope: !690)
!692 = !DILocation(line: 518, column: 6, scope: !678)
!693 = !DILocation(line: 520, column: 15, scope: !694)
!694 = distinct !DILexicalBlock(scope: !690, file: !69, line: 519, column: 3)
!695 = !DILocation(line: 520, column: 11, scope: !694)
!696 = !DILocation(line: 520, column: 4, scope: !694)
!697 = !DILocation(line: 524, column: 4, scope: !698)
!698 = distinct !DILexicalBlock(scope: !690, file: !69, line: 523, column: 3)
!699 = !DILocation(line: 527, column: 1, scope: !657)
!700 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 544, type: !701, scopeLine: 545, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!701 = !DISubroutineType(types: !702)
!702 = !{!28, !16, !28}
!703 = !DILocalVariable(name: "x_value", arg: 1, scope: !700, file: !69, line: 544, type: !16)
!704 = !DILocation(line: 544, column: 25, scope: !700)
!705 = !DILocalVariable(name: "y_value", arg: 2, scope: !700, file: !69, line: 544, type: !28)
!706 = !DILocation(line: 544, column: 38, scope: !700)
!707 = !DILocalVariable(name: "s32Temp1", scope: !700, file: !69, line: 546, type: !16)
!708 = !DILocation(line: 546, column: 6, scope: !700)
!709 = !DILocation(line: 547, column: 12, scope: !700)
!710 = !DILocation(line: 547, column: 20, scope: !700)
!711 = !DILocation(line: 547, column: 10, scope: !700)
!712 = !DILocation(line: 548, column: 6, scope: !713)
!713 = distinct !DILexicalBlock(scope: !700, file: !69, line: 548, column: 5)
!714 = !DILocation(line: 548, column: 14, scope: !713)
!715 = !DILocation(line: 548, column: 24, scope: !713)
!716 = !DILocation(line: 548, column: 5, scope: !700)
!717 = !DILocation(line: 550, column: 6, scope: !718)
!718 = distinct !DILexicalBlock(scope: !719, file: !69, line: 550, column: 6)
!719 = distinct !DILexicalBlock(scope: !713, file: !69, line: 549, column: 2)
!720 = !DILocation(line: 550, column: 14, scope: !718)
!721 = !DILocation(line: 550, column: 6, scope: !719)
!722 = !DILocation(line: 552, column: 4, scope: !723)
!723 = distinct !DILexicalBlock(scope: !718, file: !69, line: 551, column: 3)
!724 = !DILocation(line: 556, column: 4, scope: !725)
!725 = distinct !DILexicalBlock(scope: !718, file: !69, line: 555, column: 3)
!726 = !DILocation(line: 561, column: 15, scope: !727)
!727 = distinct !DILexicalBlock(scope: !713, file: !69, line: 560, column: 2)
!728 = !DILocation(line: 561, column: 27, scope: !727)
!729 = !DILocation(line: 561, column: 35, scope: !727)
!730 = !DILocation(line: 561, column: 34, scope: !727)
!731 = !DILocation(line: 561, column: 46, scope: !727)
!732 = !DILocation(line: 561, column: 44, scope: !727)
!733 = !DILocation(line: 561, column: 23, scope: !727)
!734 = !DILocation(line: 561, column: 56, scope: !727)
!735 = !DILocation(line: 561, column: 12, scope: !727)
!736 = !DILocation(line: 562, column: 15, scope: !727)
!737 = !DILocation(line: 562, column: 24, scope: !727)
!738 = !DILocation(line: 562, column: 23, scope: !727)
!739 = !DILocation(line: 562, column: 36, scope: !727)
!740 = !DILocation(line: 562, column: 44, scope: !727)
!741 = !DILocation(line: 562, column: 43, scope: !727)
!742 = !DILocation(line: 562, column: 33, scope: !727)
!743 = !DILocation(line: 562, column: 12, scope: !727)
!744 = !DILocation(line: 563, column: 6, scope: !745)
!745 = distinct !DILexicalBlock(scope: !727, file: !69, line: 563, column: 6)
!746 = !DILocation(line: 563, column: 15, scope: !745)
!747 = !DILocation(line: 563, column: 6, scope: !727)
!748 = !DILocation(line: 565, column: 7, scope: !749)
!749 = distinct !DILexicalBlock(scope: !750, file: !69, line: 565, column: 7)
!750 = distinct !DILexicalBlock(scope: !745, file: !69, line: 564, column: 3)
!751 = !DILocation(line: 565, column: 16, scope: !749)
!752 = !DILocation(line: 565, column: 7, scope: !750)
!753 = !DILocation(line: 567, column: 17, scope: !754)
!754 = distinct !DILexicalBlock(scope: !749, file: !69, line: 566, column: 4)
!755 = !DILocation(line: 567, column: 12, scope: !754)
!756 = !DILocation(line: 567, column: 5, scope: !754)
!757 = !DILocation(line: 571, column: 5, scope: !758)
!758 = distinct !DILexicalBlock(scope: !749, file: !69, line: 570, column: 4)
!759 = !DILocation(line: 576, column: 4, scope: !760)
!760 = distinct !DILexicalBlock(scope: !745, file: !69, line: 575, column: 3)
!761 = !DILocation(line: 579, column: 1, scope: !700)
!762 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 597, type: !763, scopeLine: 598, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!763 = !DISubroutineType(types: !764)
!764 = !{!28, !28, !28}
!765 = !DILocalVariable(name: "numerator", arg: 1, scope: !762, file: !69, line: 597, type: !28)
!766 = !DILocation(line: 597, column: 31, scope: !762)
!767 = !DILocalVariable(name: "denominator", arg: 2, scope: !762, file: !69, line: 597, type: !28)
!768 = !DILocation(line: 597, column: 46, scope: !762)
!769 = !DILocalVariable(name: "u32Temp", scope: !762, file: !69, line: 599, type: !665)
!770 = !DILocation(line: 599, column: 6, scope: !762)
!771 = !DILocation(line: 600, column: 5, scope: !772)
!772 = distinct !DILexicalBlock(scope: !762, file: !69, line: 600, column: 5)
!773 = !DILocation(line: 600, column: 17, scope: !772)
!774 = !DILocation(line: 600, column: 5, scope: !762)
!775 = !DILocation(line: 602, column: 3, scope: !776)
!776 = distinct !DILexicalBlock(scope: !772, file: !69, line: 601, column: 2)
!777 = !DILocation(line: 606, column: 14, scope: !778)
!778 = distinct !DILexicalBlock(scope: !772, file: !69, line: 605, column: 2)
!779 = !DILocation(line: 606, column: 23, scope: !778)
!780 = !DILocation(line: 606, column: 32, scope: !778)
!781 = !DILocation(line: 606, column: 44, scope: !778)
!782 = !DILocation(line: 606, column: 29, scope: !778)
!783 = !DILocation(line: 606, column: 11, scope: !778)
!784 = !DILocation(line: 607, column: 13, scope: !778)
!785 = !DILocation(line: 607, column: 21, scope: !778)
!786 = !DILocation(line: 607, column: 20, scope: !778)
!787 = !DILocation(line: 607, column: 11, scope: !778)
!788 = !DILocation(line: 608, column: 6, scope: !789)
!789 = distinct !DILexicalBlock(scope: !778, file: !69, line: 608, column: 6)
!790 = !DILocation(line: 608, column: 14, scope: !789)
!791 = !DILocation(line: 608, column: 6, scope: !778)
!792 = !DILocation(line: 610, column: 11, scope: !793)
!793 = distinct !DILexicalBlock(scope: !789, file: !69, line: 609, column: 3)
!794 = !DILocation(line: 610, column: 19, scope: !793)
!795 = !DILocation(line: 610, column: 4, scope: !793)
!796 = !DILocation(line: 614, column: 4, scope: !797)
!797 = distinct !DILexicalBlock(scope: !789, file: !69, line: 613, column: 3)
!798 = !DILocation(line: 618, column: 1, scope: !762)
!799 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 635, type: !800, scopeLine: 636, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!800 = !DISubroutineType(types: !801)
!801 = !{!28, !665, !28}
!802 = !DILocalVariable(name: "x_value", arg: 1, scope: !799, file: !69, line: 635, type: !665)
!803 = !DILocation(line: 635, column: 25, scope: !799)
!804 = !DILocalVariable(name: "y_value", arg: 2, scope: !799, file: !69, line: 635, type: !28)
!805 = !DILocation(line: 635, column: 38, scope: !799)
!806 = !DILocalVariable(name: "u32Temp1", scope: !799, file: !69, line: 637, type: !665)
!807 = !DILocation(line: 637, column: 6, scope: !799)
!808 = !DILocalVariable(name: "u32Temp2", scope: !799, file: !69, line: 637, type: !665)
!809 = !DILocation(line: 637, column: 17, scope: !799)
!810 = !DILocation(line: 638, column: 12, scope: !799)
!811 = !DILocation(line: 638, column: 20, scope: !799)
!812 = !DILocation(line: 638, column: 10, scope: !799)
!813 = !DILocation(line: 639, column: 5, scope: !814)
!814 = distinct !DILexicalBlock(scope: !799, file: !69, line: 639, column: 5)
!815 = !DILocation(line: 639, column: 13, scope: !814)
!816 = !DILocation(line: 639, column: 5, scope: !799)
!817 = !DILocation(line: 641, column: 3, scope: !818)
!818 = distinct !DILexicalBlock(scope: !814, file: !69, line: 640, column: 2)
!819 = !DILocation(line: 645, column: 14, scope: !820)
!820 = distinct !DILexicalBlock(scope: !814, file: !69, line: 644, column: 2)
!821 = !DILocation(line: 645, column: 22, scope: !820)
!822 = !DILocation(line: 645, column: 21, scope: !820)
!823 = !DILocation(line: 645, column: 12, scope: !820)
!824 = !DILocation(line: 646, column: 14, scope: !820)
!825 = !DILocation(line: 646, column: 25, scope: !820)
!826 = !DILocation(line: 646, column: 36, scope: !820)
!827 = !DILocation(line: 646, column: 34, scope: !820)
!828 = !DILocation(line: 646, column: 22, scope: !820)
!829 = !DILocation(line: 646, column: 45, scope: !820)
!830 = !DILocation(line: 646, column: 12, scope: !820)
!831 = !DILocation(line: 647, column: 15, scope: !820)
!832 = !DILocation(line: 647, column: 24, scope: !820)
!833 = !DILocation(line: 647, column: 23, scope: !820)
!834 = !DILocation(line: 647, column: 36, scope: !820)
!835 = !DILocation(line: 647, column: 44, scope: !820)
!836 = !DILocation(line: 647, column: 43, scope: !820)
!837 = !DILocation(line: 647, column: 33, scope: !820)
!838 = !DILocation(line: 647, column: 12, scope: !820)
!839 = !DILocation(line: 648, column: 6, scope: !840)
!840 = distinct !DILexicalBlock(scope: !820, file: !69, line: 648, column: 6)
!841 = !DILocation(line: 648, column: 15, scope: !840)
!842 = !DILocation(line: 648, column: 6, scope: !820)
!843 = !DILocation(line: 650, column: 11, scope: !844)
!844 = distinct !DILexicalBlock(scope: !840, file: !69, line: 649, column: 3)
!845 = !DILocation(line: 650, column: 20, scope: !844)
!846 = !DILocation(line: 650, column: 4, scope: !844)
!847 = !DILocation(line: 654, column: 4, scope: !848)
!848 = distinct !DILexicalBlock(scope: !840, file: !69, line: 653, column: 3)
!849 = !DILocation(line: 658, column: 1, scope: !799)
!850 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 677, type: !851, scopeLine: 678, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!851 = !DISubroutineType(types: !852)
!852 = !{!6, !6, !28, !6}
!853 = !DILocalVariable(name: "factor1", arg: 1, scope: !850, file: !69, line: 677, type: !6)
!854 = !DILocation(line: 677, column: 33, scope: !850)
!855 = !DILocalVariable(name: "factor2", arg: 2, scope: !850, file: !69, line: 677, type: !28)
!856 = !DILocation(line: 677, column: 46, scope: !850)
!857 = !DILocalVariable(name: "denominator", arg: 3, scope: !850, file: !69, line: 677, type: !6)
!858 = !DILocation(line: 677, column: 59, scope: !850)
!859 = !DILocalVariable(name: "s32Result", scope: !850, file: !69, line: 679, type: !16)
!860 = !DILocation(line: 679, column: 6, scope: !850)
!861 = !DILocalVariable(name: "s32Temp1", scope: !850, file: !69, line: 679, type: !16)
!862 = !DILocation(line: 679, column: 21, scope: !850)
!863 = !DILocation(line: 680, column: 14, scope: !850)
!864 = !DILocation(line: 680, column: 24, scope: !850)
!865 = !DILocation(line: 680, column: 22, scope: !850)
!866 = !DILocation(line: 680, column: 12, scope: !850)
!867 = !DILocation(line: 681, column: 5, scope: !868)
!868 = distinct !DILexicalBlock(scope: !850, file: !69, line: 681, column: 5)
!869 = !DILocation(line: 681, column: 17, scope: !868)
!870 = !DILocation(line: 681, column: 5, scope: !850)
!871 = !DILocation(line: 683, column: 6, scope: !872)
!872 = distinct !DILexicalBlock(scope: !873, file: !69, line: 683, column: 6)
!873 = distinct !DILexicalBlock(scope: !868, file: !69, line: 682, column: 2)
!874 = !DILocation(line: 683, column: 16, scope: !872)
!875 = !DILocation(line: 683, column: 6, scope: !873)
!876 = !DILocation(line: 685, column: 4, scope: !877)
!877 = distinct !DILexicalBlock(scope: !872, file: !69, line: 684, column: 3)
!878 = !DILocation(line: 689, column: 4, scope: !879)
!879 = distinct !DILexicalBlock(scope: !872, file: !69, line: 688, column: 3)
!880 = !DILocation(line: 694, column: 14, scope: !881)
!881 = distinct !DILexicalBlock(scope: !868, file: !69, line: 693, column: 2)
!882 = !DILocation(line: 694, column: 27, scope: !881)
!883 = !DILocation(line: 694, column: 37, scope: !881)
!884 = !DILocation(line: 694, column: 36, scope: !881)
!885 = !DILocation(line: 694, column: 50, scope: !881)
!886 = !DILocation(line: 694, column: 49, scope: !881)
!887 = !DILocation(line: 694, column: 24, scope: !881)
!888 = !DILocation(line: 694, column: 12, scope: !881)
!889 = !DILocation(line: 695, column: 14, scope: !881)
!890 = !DILocation(line: 695, column: 23, scope: !881)
!891 = !DILocation(line: 695, column: 12, scope: !881)
!892 = !DILocation(line: 696, column: 16, scope: !881)
!893 = !DILocation(line: 696, column: 25, scope: !881)
!894 = !DILocation(line: 696, column: 24, scope: !881)
!895 = !DILocation(line: 696, column: 41, scope: !881)
!896 = !DILocation(line: 696, column: 51, scope: !881)
!897 = !DILocation(line: 696, column: 50, scope: !881)
!898 = !DILocation(line: 696, column: 38, scope: !881)
!899 = !DILocation(line: 696, column: 13, scope: !881)
!900 = !DILocation(line: 697, column: 6, scope: !901)
!901 = distinct !DILexicalBlock(scope: !881, file: !69, line: 697, column: 6)
!902 = !DILocation(line: 697, column: 16, scope: !901)
!903 = !DILocation(line: 697, column: 6, scope: !881)
!904 = !DILocation(line: 699, column: 7, scope: !905)
!905 = distinct !DILexicalBlock(scope: !906, file: !69, line: 699, column: 7)
!906 = distinct !DILexicalBlock(scope: !901, file: !69, line: 698, column: 3)
!907 = !DILocation(line: 699, column: 17, scope: !905)
!908 = !DILocation(line: 699, column: 7, scope: !906)
!909 = !DILocation(line: 701, column: 17, scope: !910)
!910 = distinct !DILexicalBlock(scope: !905, file: !69, line: 700, column: 4)
!911 = !DILocation(line: 701, column: 12, scope: !910)
!912 = !DILocation(line: 701, column: 5, scope: !910)
!913 = !DILocation(line: 706, column: 5, scope: !914)
!914 = distinct !DILexicalBlock(scope: !905, file: !69, line: 705, column: 4)
!915 = !DILocation(line: 711, column: 4, scope: !916)
!916 = distinct !DILexicalBlock(scope: !901, file: !69, line: 710, column: 3)
!917 = !DILocation(line: 715, column: 1, scope: !850)
!918 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 733, type: !919, scopeLine: 734, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!919 = !DISubroutineType(types: !920)
!920 = !{!6, !28, !6, !28}
!921 = !DILocalVariable(name: "factor1", arg: 1, scope: !918, file: !69, line: 733, type: !28)
!922 = !DILocation(line: 733, column: 33, scope: !918)
!923 = !DILocalVariable(name: "factor2", arg: 2, scope: !918, file: !69, line: 733, type: !6)
!924 = !DILocation(line: 733, column: 46, scope: !918)
!925 = !DILocalVariable(name: "denominator", arg: 3, scope: !918, file: !69, line: 733, type: !28)
!926 = !DILocation(line: 733, column: 59, scope: !918)
!927 = !DILocalVariable(name: "s32Result", scope: !918, file: !69, line: 735, type: !16)
!928 = !DILocation(line: 735, column: 6, scope: !918)
!929 = !DILocalVariable(name: "s32Temp1", scope: !918, file: !69, line: 735, type: !16)
!930 = !DILocation(line: 735, column: 21, scope: !918)
!931 = !DILocation(line: 736, column: 14, scope: !918)
!932 = !DILocation(line: 736, column: 24, scope: !918)
!933 = !DILocation(line: 736, column: 22, scope: !918)
!934 = !DILocation(line: 736, column: 12, scope: !918)
!935 = !DILocation(line: 737, column: 5, scope: !936)
!936 = distinct !DILexicalBlock(scope: !918, file: !69, line: 737, column: 5)
!937 = !DILocation(line: 737, column: 16, scope: !936)
!938 = !DILocation(line: 737, column: 5, scope: !918)
!939 = !DILocation(line: 739, column: 6, scope: !940)
!940 = distinct !DILexicalBlock(scope: !941, file: !69, line: 739, column: 6)
!941 = distinct !DILexicalBlock(scope: !936, file: !69, line: 738, column: 2)
!942 = !DILocation(line: 739, column: 16, scope: !940)
!943 = !DILocation(line: 739, column: 6, scope: !941)
!944 = !DILocation(line: 741, column: 4, scope: !945)
!945 = distinct !DILexicalBlock(scope: !940, file: !69, line: 740, column: 3)
!946 = !DILocation(line: 745, column: 4, scope: !947)
!947 = distinct !DILexicalBlock(scope: !940, file: !69, line: 744, column: 3)
!948 = !DILocation(line: 750, column: 14, scope: !949)
!949 = distinct !DILexicalBlock(scope: !936, file: !69, line: 749, column: 2)
!950 = !DILocation(line: 750, column: 28, scope: !949)
!951 = !DILocation(line: 750, column: 38, scope: !949)
!952 = !DILocation(line: 750, column: 37, scope: !949)
!953 = !DILocation(line: 750, column: 53, scope: !949)
!954 = !DILocation(line: 750, column: 51, scope: !949)
!955 = !DILocation(line: 750, column: 24, scope: !949)
!956 = !DILocation(line: 750, column: 66, scope: !949)
!957 = !DILocation(line: 750, column: 12, scope: !949)
!958 = !DILocation(line: 751, column: 16, scope: !949)
!959 = !DILocation(line: 751, column: 25, scope: !949)
!960 = !DILocation(line: 751, column: 24, scope: !949)
!961 = !DILocation(line: 751, column: 41, scope: !949)
!962 = !DILocation(line: 751, column: 51, scope: !949)
!963 = !DILocation(line: 751, column: 50, scope: !949)
!964 = !DILocation(line: 751, column: 38, scope: !949)
!965 = !DILocation(line: 751, column: 13, scope: !949)
!966 = !DILocation(line: 752, column: 6, scope: !967)
!967 = distinct !DILexicalBlock(scope: !949, file: !69, line: 752, column: 6)
!968 = !DILocation(line: 752, column: 16, scope: !967)
!969 = !DILocation(line: 752, column: 6, scope: !949)
!970 = !DILocation(line: 754, column: 7, scope: !971)
!971 = distinct !DILexicalBlock(scope: !972, file: !69, line: 754, column: 7)
!972 = distinct !DILexicalBlock(scope: !967, file: !69, line: 753, column: 3)
!973 = !DILocation(line: 754, column: 17, scope: !971)
!974 = !DILocation(line: 754, column: 7, scope: !972)
!975 = !DILocation(line: 756, column: 17, scope: !976)
!976 = distinct !DILexicalBlock(scope: !971, file: !69, line: 755, column: 4)
!977 = !DILocation(line: 756, column: 12, scope: !976)
!978 = !DILocation(line: 756, column: 5, scope: !976)
!979 = !DILocation(line: 760, column: 5, scope: !980)
!980 = distinct !DILexicalBlock(scope: !971, file: !69, line: 759, column: 4)
!981 = !DILocation(line: 765, column: 4, scope: !982)
!982 = distinct !DILexicalBlock(scope: !967, file: !69, line: 764, column: 3)
!983 = !DILocation(line: 768, column: 1, scope: !918)
!984 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 787, type: !985, scopeLine: 788, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!985 = !DISubroutineType(types: !986)
!986 = !{!28, !6, !28, !6}
!987 = !DILocalVariable(name: "factor1", arg: 1, scope: !984, file: !69, line: 787, type: !6)
!988 = !DILocation(line: 787, column: 33, scope: !984)
!989 = !DILocalVariable(name: "factor2", arg: 2, scope: !984, file: !69, line: 787, type: !28)
!990 = !DILocation(line: 787, column: 46, scope: !984)
!991 = !DILocalVariable(name: "denominator", arg: 3, scope: !984, file: !69, line: 787, type: !6)
!992 = !DILocation(line: 787, column: 59, scope: !984)
!993 = !DILocalVariable(name: "u32Result", scope: !984, file: !69, line: 789, type: !665)
!994 = !DILocation(line: 789, column: 6, scope: !984)
!995 = !DILocalVariable(name: "u32Temp1", scope: !984, file: !69, line: 789, type: !665)
!996 = !DILocation(line: 789, column: 21, scope: !984)
!997 = !DILocalVariable(name: "s32Result", scope: !984, file: !69, line: 790, type: !16)
!998 = !DILocation(line: 790, column: 6, scope: !984)
!999 = !DILocalVariable(name: "s32Temp1", scope: !984, file: !69, line: 790, type: !16)
!1000 = !DILocation(line: 790, column: 21, scope: !984)
!1001 = !DILocation(line: 791, column: 14, scope: !984)
!1002 = !DILocation(line: 791, column: 24, scope: !984)
!1003 = !DILocation(line: 791, column: 22, scope: !984)
!1004 = !DILocation(line: 791, column: 12, scope: !984)
!1005 = !DILocation(line: 793, column: 5, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !984, file: !69, line: 793, column: 5)
!1007 = !DILocation(line: 793, column: 17, scope: !1006)
!1008 = !DILocation(line: 793, column: 5, scope: !984)
!1009 = !DILocation(line: 795, column: 6, scope: !1010)
!1010 = distinct !DILexicalBlock(scope: !1011, file: !69, line: 795, column: 6)
!1011 = distinct !DILexicalBlock(scope: !1006, file: !69, line: 794, column: 2)
!1012 = !DILocation(line: 795, column: 16, scope: !1010)
!1013 = !DILocation(line: 795, column: 6, scope: !1011)
!1014 = !DILocation(line: 797, column: 4, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !1010, file: !69, line: 796, column: 3)
!1016 = !DILocation(line: 801, column: 4, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !1010, file: !69, line: 800, column: 3)
!1018 = !DILocation(line: 806, column: 15, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1006, file: !69, line: 805, column: 2)
!1020 = !DILocation(line: 806, column: 29, scope: !1019)
!1021 = !DILocation(line: 806, column: 39, scope: !1019)
!1022 = !DILocation(line: 806, column: 38, scope: !1019)
!1023 = !DILocation(line: 806, column: 54, scope: !1019)
!1024 = !DILocation(line: 806, column: 52, scope: !1019)
!1025 = !DILocation(line: 806, column: 25, scope: !1019)
!1026 = !DILocation(line: 806, column: 68, scope: !1019)
!1027 = !DILocation(line: 806, column: 12, scope: !1019)
!1028 = !DILocation(line: 807, column: 16, scope: !1019)
!1029 = !DILocation(line: 807, column: 25, scope: !1019)
!1030 = !DILocation(line: 807, column: 24, scope: !1019)
!1031 = !DILocation(line: 807, column: 41, scope: !1019)
!1032 = !DILocation(line: 807, column: 51, scope: !1019)
!1033 = !DILocation(line: 807, column: 50, scope: !1019)
!1034 = !DILocation(line: 807, column: 38, scope: !1019)
!1035 = !DILocation(line: 807, column: 13, scope: !1019)
!1036 = !DILocation(line: 808, column: 6, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1019, file: !69, line: 808, column: 6)
!1038 = !DILocation(line: 808, column: 16, scope: !1037)
!1039 = !DILocation(line: 808, column: 6, scope: !1019)
!1040 = !DILocation(line: 810, column: 7, scope: !1041)
!1041 = distinct !DILexicalBlock(scope: !1042, file: !69, line: 810, column: 7)
!1042 = distinct !DILexicalBlock(scope: !1037, file: !69, line: 809, column: 3)
!1043 = !DILocation(line: 810, column: 17, scope: !1041)
!1044 = !DILocation(line: 810, column: 7, scope: !1042)
!1045 = !DILocation(line: 812, column: 17, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1041, file: !69, line: 811, column: 4)
!1047 = !DILocation(line: 812, column: 12, scope: !1046)
!1048 = !DILocation(line: 812, column: 5, scope: !1046)
!1049 = !DILocation(line: 816, column: 5, scope: !1050)
!1050 = distinct !DILexicalBlock(scope: !1041, file: !69, line: 815, column: 4)
!1051 = !DILocation(line: 821, column: 4, scope: !1052)
!1052 = distinct !DILexicalBlock(scope: !1037, file: !69, line: 820, column: 3)
!1053 = !DILocation(line: 824, column: 1, scope: !984)
!1054 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 843, type: !1055, scopeLine: 844, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1055 = !DISubroutineType(types: !1056)
!1056 = !{!28, !6, !28, !28}
!1057 = !DILocalVariable(name: "factor1", arg: 1, scope: !1054, file: !69, line: 843, type: !6)
!1058 = !DILocation(line: 843, column: 33, scope: !1054)
!1059 = !DILocalVariable(name: "factor2", arg: 2, scope: !1054, file: !69, line: 843, type: !28)
!1060 = !DILocation(line: 843, column: 46, scope: !1054)
!1061 = !DILocalVariable(name: "denominator", arg: 3, scope: !1054, file: !69, line: 843, type: !28)
!1062 = !DILocation(line: 843, column: 59, scope: !1054)
!1063 = !DILocalVariable(name: "s32Result", scope: !1054, file: !69, line: 845, type: !16)
!1064 = !DILocation(line: 845, column: 6, scope: !1054)
!1065 = !DILocalVariable(name: "s32Temp1", scope: !1054, file: !69, line: 845, type: !16)
!1066 = !DILocation(line: 845, column: 21, scope: !1054)
!1067 = !DILocation(line: 846, column: 14, scope: !1054)
!1068 = !DILocation(line: 846, column: 24, scope: !1054)
!1069 = !DILocation(line: 846, column: 22, scope: !1054)
!1070 = !DILocation(line: 846, column: 12, scope: !1054)
!1071 = !DILocation(line: 848, column: 5, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1054, file: !69, line: 848, column: 5)
!1073 = !DILocation(line: 848, column: 17, scope: !1072)
!1074 = !DILocation(line: 848, column: 5, scope: !1054)
!1075 = !DILocation(line: 850, column: 6, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1077, file: !69, line: 850, column: 6)
!1077 = distinct !DILexicalBlock(scope: !1072, file: !69, line: 849, column: 2)
!1078 = !DILocation(line: 850, column: 16, scope: !1076)
!1079 = !DILocation(line: 850, column: 6, scope: !1077)
!1080 = !DILocation(line: 852, column: 4, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1076, file: !69, line: 851, column: 3)
!1082 = !DILocation(line: 856, column: 4, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1076, file: !69, line: 855, column: 3)
!1084 = !DILocation(line: 861, column: 15, scope: !1085)
!1085 = distinct !DILexicalBlock(scope: !1072, file: !69, line: 860, column: 2)
!1086 = !DILocation(line: 861, column: 29, scope: !1085)
!1087 = !DILocation(line: 861, column: 39, scope: !1085)
!1088 = !DILocation(line: 861, column: 38, scope: !1085)
!1089 = !DILocation(line: 861, column: 54, scope: !1085)
!1090 = !DILocation(line: 861, column: 52, scope: !1085)
!1091 = !DILocation(line: 861, column: 25, scope: !1085)
!1092 = !DILocation(line: 861, column: 68, scope: !1085)
!1093 = !DILocation(line: 861, column: 12, scope: !1085)
!1094 = !DILocation(line: 862, column: 16, scope: !1085)
!1095 = !DILocation(line: 862, column: 25, scope: !1085)
!1096 = !DILocation(line: 862, column: 24, scope: !1085)
!1097 = !DILocation(line: 862, column: 41, scope: !1085)
!1098 = !DILocation(line: 862, column: 51, scope: !1085)
!1099 = !DILocation(line: 862, column: 50, scope: !1085)
!1100 = !DILocation(line: 862, column: 38, scope: !1085)
!1101 = !DILocation(line: 862, column: 13, scope: !1085)
!1102 = !DILocation(line: 863, column: 6, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1085, file: !69, line: 863, column: 6)
!1104 = !DILocation(line: 863, column: 16, scope: !1103)
!1105 = !DILocation(line: 863, column: 6, scope: !1085)
!1106 = !DILocation(line: 865, column: 7, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1108, file: !69, line: 865, column: 7)
!1108 = distinct !DILexicalBlock(scope: !1103, file: !69, line: 864, column: 3)
!1109 = !DILocation(line: 865, column: 17, scope: !1107)
!1110 = !DILocation(line: 865, column: 7, scope: !1108)
!1111 = !DILocation(line: 867, column: 17, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1107, file: !69, line: 866, column: 4)
!1113 = !DILocation(line: 867, column: 12, scope: !1112)
!1114 = !DILocation(line: 867, column: 5, scope: !1112)
!1115 = !DILocation(line: 871, column: 5, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1107, file: !69, line: 870, column: 4)
!1117 = !DILocation(line: 876, column: 4, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1103, file: !69, line: 875, column: 3)
!1119 = !DILocation(line: 880, column: 1, scope: !1054)
!1120 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 898, type: !1121, scopeLine: 899, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!28, !28, !28, !28}
!1123 = !DILocalVariable(name: "factor1", arg: 1, scope: !1120, file: !69, line: 898, type: !28)
!1124 = !DILocation(line: 898, column: 33, scope: !1120)
!1125 = !DILocalVariable(name: "factor2", arg: 2, scope: !1120, file: !69, line: 898, type: !28)
!1126 = !DILocation(line: 898, column: 46, scope: !1120)
!1127 = !DILocalVariable(name: "denominator", arg: 3, scope: !1120, file: !69, line: 898, type: !28)
!1128 = !DILocation(line: 898, column: 59, scope: !1120)
!1129 = !DILocalVariable(name: "u32Temp1", scope: !1120, file: !69, line: 900, type: !665)
!1130 = !DILocation(line: 900, column: 6, scope: !1120)
!1131 = !DILocalVariable(name: "u16TempDenom", scope: !1120, file: !69, line: 901, type: !28)
!1132 = !DILocation(line: 901, column: 6, scope: !1120)
!1133 = !DILocation(line: 903, column: 5, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1120, file: !69, line: 903, column: 5)
!1135 = !DILocation(line: 903, column: 17, scope: !1134)
!1136 = !DILocation(line: 903, column: 5, scope: !1120)
!1137 = !DILocation(line: 905, column: 3, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1134, file: !69, line: 904, column: 2)
!1139 = !DILocation(line: 909, column: 14, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1134, file: !69, line: 908, column: 2)
!1141 = !DILocation(line: 909, column: 24, scope: !1140)
!1142 = !DILocation(line: 909, column: 22, scope: !1140)
!1143 = !DILocation(line: 909, column: 12, scope: !1140)
!1144 = !DILocation(line: 910, column: 18, scope: !1140)
!1145 = !DILocation(line: 910, column: 30, scope: !1140)
!1146 = !DILocation(line: 910, column: 16, scope: !1140)
!1147 = !DILocation(line: 911, column: 14, scope: !1140)
!1148 = !DILocation(line: 911, column: 25, scope: !1140)
!1149 = !DILocation(line: 911, column: 23, scope: !1140)
!1150 = !DILocation(line: 911, column: 12, scope: !1140)
!1151 = !DILocation(line: 912, column: 14, scope: !1140)
!1152 = !DILocation(line: 912, column: 25, scope: !1140)
!1153 = !DILocation(line: 912, column: 23, scope: !1140)
!1154 = !DILocation(line: 912, column: 12, scope: !1140)
!1155 = !DILocation(line: 913, column: 6, scope: !1156)
!1156 = distinct !DILexicalBlock(scope: !1140, file: !69, line: 913, column: 6)
!1157 = !DILocation(line: 913, column: 15, scope: !1156)
!1158 = !DILocation(line: 913, column: 6, scope: !1140)
!1159 = !DILocation(line: 915, column: 12, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1156, file: !69, line: 914, column: 3)
!1161 = !DILocation(line: 915, column: 21, scope: !1160)
!1162 = !DILocation(line: 915, column: 11, scope: !1160)
!1163 = !DILocation(line: 915, column: 4, scope: !1160)
!1164 = !DILocation(line: 920, column: 4, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1156, file: !69, line: 919, column: 3)
!1166 = !DILocation(line: 925, column: 1, scope: !1120)
!1167 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 942, type: !1168, scopeLine: 943, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1168 = !DISubroutineType(types: !1169)
!1169 = !{!28, !28, !28, !665}
!1170 = !DILocalVariable(name: "factor1", arg: 1, scope: !1167, file: !69, line: 942, type: !28)
!1171 = !DILocation(line: 942, column: 33, scope: !1167)
!1172 = !DILocalVariable(name: "factor2", arg: 2, scope: !1167, file: !69, line: 942, type: !28)
!1173 = !DILocation(line: 942, column: 46, scope: !1167)
!1174 = !DILocalVariable(name: "denominator", arg: 3, scope: !1167, file: !69, line: 942, type: !665)
!1175 = !DILocation(line: 942, column: 59, scope: !1167)
!1176 = !DILocalVariable(name: "u32Temp1", scope: !1167, file: !69, line: 944, type: !665)
!1177 = !DILocation(line: 944, column: 6, scope: !1167)
!1178 = !DILocation(line: 945, column: 5, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1167, file: !69, line: 945, column: 5)
!1180 = !DILocation(line: 945, column: 17, scope: !1179)
!1181 = !DILocation(line: 945, column: 5, scope: !1167)
!1182 = !DILocation(line: 947, column: 3, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1179, file: !69, line: 946, column: 2)
!1184 = !DILocation(line: 951, column: 15, scope: !1185)
!1185 = distinct !DILexicalBlock(scope: !1179, file: !69, line: 950, column: 2)
!1186 = !DILocation(line: 951, column: 25, scope: !1185)
!1187 = !DILocation(line: 951, column: 23, scope: !1185)
!1188 = !DILocation(line: 951, column: 36, scope: !1185)
!1189 = !DILocation(line: 951, column: 34, scope: !1185)
!1190 = !DILocation(line: 951, column: 12, scope: !1185)
!1191 = !DILocation(line: 952, column: 8, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1185, file: !69, line: 952, column: 6)
!1193 = !DILocation(line: 952, column: 18, scope: !1192)
!1194 = !DILocation(line: 952, column: 16, scope: !1192)
!1195 = !DILocation(line: 952, column: 28, scope: !1192)
!1196 = !DILocation(line: 952, column: 40, scope: !1192)
!1197 = !DILocation(line: 952, column: 39, scope: !1192)
!1198 = !DILocation(line: 952, column: 26, scope: !1192)
!1199 = !DILocation(line: 952, column: 53, scope: !1192)
!1200 = !DILocation(line: 952, column: 64, scope: !1192)
!1201 = !DILocation(line: 952, column: 50, scope: !1192)
!1202 = !DILocation(line: 952, column: 6, scope: !1185)
!1203 = !DILocation(line: 954, column: 12, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1192, file: !69, line: 953, column: 3)
!1205 = !DILocation(line: 955, column: 3, scope: !1204)
!1206 = !DILocation(line: 956, column: 6, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1185, file: !69, line: 956, column: 6)
!1208 = !DILocation(line: 956, column: 15, scope: !1207)
!1209 = !DILocation(line: 956, column: 6, scope: !1185)
!1210 = !DILocation(line: 958, column: 12, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1207, file: !69, line: 957, column: 3)
!1212 = !DILocation(line: 958, column: 21, scope: !1211)
!1213 = !DILocation(line: 958, column: 11, scope: !1211)
!1214 = !DILocation(line: 958, column: 4, scope: !1211)
!1215 = !DILocation(line: 962, column: 4, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1207, file: !69, line: 961, column: 3)
!1217 = !DILocation(line: 965, column: 1, scope: !1167)
!1218 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 982, type: !1219, scopeLine: 983, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1219 = !DISubroutineType(types: !1220)
!1220 = !{!665, !665, !28}
!1221 = !DILocalVariable(name: "x_value", arg: 1, scope: !1218, file: !69, line: 982, type: !665)
!1222 = !DILocation(line: 982, column: 25, scope: !1218)
!1223 = !DILocalVariable(name: "y_value", arg: 2, scope: !1218, file: !69, line: 982, type: !28)
!1224 = !DILocation(line: 982, column: 38, scope: !1218)
!1225 = !DILocalVariable(name: "u32Temp1", scope: !1218, file: !69, line: 984, type: !665)
!1226 = !DILocation(line: 984, column: 6, scope: !1218)
!1227 = !DILocation(line: 985, column: 5, scope: !1228)
!1228 = distinct !DILexicalBlock(scope: !1218, file: !69, line: 985, column: 5)
!1229 = !DILocation(line: 985, column: 13, scope: !1228)
!1230 = !DILocation(line: 985, column: 5, scope: !1218)
!1231 = !DILocation(line: 987, column: 3, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1228, file: !69, line: 986, column: 2)
!1233 = !DILocation(line: 991, column: 15, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1228, file: !69, line: 990, column: 2)
!1235 = !DILocation(line: 991, column: 26, scope: !1234)
!1236 = !DILocation(line: 991, column: 34, scope: !1234)
!1237 = !DILocation(line: 991, column: 33, scope: !1234)
!1238 = !DILocation(line: 991, column: 45, scope: !1234)
!1239 = !DILocation(line: 991, column: 43, scope: !1234)
!1240 = !DILocation(line: 991, column: 23, scope: !1234)
!1241 = !DILocation(line: 991, column: 54, scope: !1234)
!1242 = !DILocation(line: 991, column: 12, scope: !1234)
!1243 = !DILocation(line: 992, column: 15, scope: !1234)
!1244 = !DILocation(line: 992, column: 23, scope: !1234)
!1245 = !DILocation(line: 992, column: 22, scope: !1234)
!1246 = !DILocation(line: 992, column: 35, scope: !1234)
!1247 = !DILocation(line: 992, column: 44, scope: !1234)
!1248 = !DILocation(line: 992, column: 43, scope: !1234)
!1249 = !DILocation(line: 992, column: 32, scope: !1234)
!1250 = !DILocation(line: 992, column: 12, scope: !1234)
!1251 = !DILocation(line: 993, column: 10, scope: !1234)
!1252 = !DILocation(line: 993, column: 3, scope: !1234)
!1253 = !DILocation(line: 995, column: 1, scope: !1218)
!1254 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 1013, type: !1255, scopeLine: 1014, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1255 = !DISubroutineType(types: !1256)
!1256 = !{!6, !6, !6, !6}
!1257 = !DILocalVariable(name: "fak1", arg: 1, scope: !1254, file: !69, line: 1013, type: !6)
!1258 = !DILocation(line: 1013, column: 33, scope: !1254)
!1259 = !DILocalVariable(name: "fak2", arg: 2, scope: !1254, file: !69, line: 1013, type: !6)
!1260 = !DILocation(line: 1013, column: 43, scope: !1254)
!1261 = !DILocalVariable(name: "div", arg: 3, scope: !1254, file: !69, line: 1013, type: !6)
!1262 = !DILocation(line: 1013, column: 53, scope: !1254)
!1263 = !DILocalVariable(name: "s32Temp1", scope: !1254, file: !69, line: 1015, type: !16)
!1264 = !DILocation(line: 1015, column: 6, scope: !1254)
!1265 = !DILocalVariable(name: "s32Temp2", scope: !1254, file: !69, line: 1015, type: !16)
!1266 = !DILocation(line: 1015, column: 20, scope: !1254)
!1267 = !DILocalVariable(name: "s32Temp3", scope: !1254, file: !69, line: 1015, type: !16)
!1268 = !DILocation(line: 1015, column: 34, scope: !1254)
!1269 = !DILocation(line: 1016, column: 13, scope: !1254)
!1270 = !DILocation(line: 1016, column: 20, scope: !1254)
!1271 = !DILocation(line: 1016, column: 18, scope: !1254)
!1272 = !DILocation(line: 1016, column: 11, scope: !1254)
!1273 = !DILocation(line: 1017, column: 5, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1254, file: !69, line: 1017, column: 5)
!1275 = !DILocation(line: 1017, column: 9, scope: !1274)
!1276 = !DILocation(line: 1017, column: 5, scope: !1254)
!1277 = !DILocation(line: 1019, column: 6, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1279, file: !69, line: 1019, column: 6)
!1279 = distinct !DILexicalBlock(scope: !1274, file: !69, line: 1018, column: 2)
!1280 = !DILocation(line: 1019, column: 15, scope: !1278)
!1281 = !DILocation(line: 1019, column: 6, scope: !1279)
!1282 = !DILocation(line: 1021, column: 4, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1278, file: !69, line: 1020, column: 3)
!1284 = !DILocation(line: 1025, column: 4, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1278, file: !69, line: 1024, column: 3)
!1286 = !DILocation(line: 1030, column: 15, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1274, file: !69, line: 1029, column: 2)
!1288 = !DILocation(line: 1030, column: 28, scope: !1287)
!1289 = !DILocation(line: 1030, column: 39, scope: !1287)
!1290 = !DILocation(line: 1030, column: 37, scope: !1287)
!1291 = !DILocation(line: 1030, column: 46, scope: !1287)
!1292 = !DILocation(line: 1030, column: 44, scope: !1287)
!1293 = !DILocation(line: 1030, column: 24, scope: !1287)
!1294 = !DILocation(line: 1030, column: 52, scope: !1287)
!1295 = !DILocation(line: 1030, column: 12, scope: !1287)
!1296 = !DILocation(line: 1031, column: 15, scope: !1287)
!1297 = !DILocation(line: 1031, column: 24, scope: !1287)
!1298 = !DILocation(line: 1031, column: 23, scope: !1287)
!1299 = !DILocation(line: 1031, column: 32, scope: !1287)
!1300 = !DILocation(line: 1031, column: 41, scope: !1287)
!1301 = !DILocation(line: 1031, column: 40, scope: !1287)
!1302 = !DILocation(line: 1031, column: 29, scope: !1287)
!1303 = !DILocation(line: 1031, column: 12, scope: !1287)
!1304 = !DILocation(line: 1032, column: 6, scope: !1305)
!1305 = distinct !DILexicalBlock(scope: !1287, file: !69, line: 1032, column: 6)
!1306 = !DILocation(line: 1032, column: 15, scope: !1305)
!1307 = !DILocation(line: 1032, column: 6, scope: !1287)
!1308 = !DILocation(line: 1034, column: 7, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1310, file: !69, line: 1034, column: 7)
!1310 = distinct !DILexicalBlock(scope: !1305, file: !69, line: 1033, column: 3)
!1311 = !DILocation(line: 1034, column: 16, scope: !1309)
!1312 = !DILocation(line: 1034, column: 7, scope: !1310)
!1313 = !DILocation(line: 1036, column: 17, scope: !1314)
!1314 = distinct !DILexicalBlock(scope: !1309, file: !69, line: 1035, column: 4)
!1315 = !DILocation(line: 1036, column: 12, scope: !1314)
!1316 = !DILocation(line: 1036, column: 5, scope: !1314)
!1317 = !DILocation(line: 1040, column: 5, scope: !1318)
!1318 = distinct !DILexicalBlock(scope: !1309, file: !69, line: 1039, column: 4)
!1319 = !DILocation(line: 1045, column: 4, scope: !1320)
!1320 = distinct !DILexicalBlock(scope: !1305, file: !69, line: 1044, column: 3)
!1321 = !DILocation(line: 1048, column: 1, scope: !1254)
!1322 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1066, type: !1323, scopeLine: 1067, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1323 = !DISubroutineType(types: !1324)
!1324 = !{!6, !6, !6, !28}
!1325 = !DILocalVariable(name: "data1", arg: 1, scope: !1322, file: !69, line: 1066, type: !6)
!1326 = !DILocation(line: 1066, column: 33, scope: !1322)
!1327 = !DILocalVariable(name: "data2", arg: 2, scope: !1322, file: !69, line: 1066, type: !6)
!1328 = !DILocation(line: 1066, column: 43, scope: !1322)
!1329 = !DILocalVariable(name: "denominator", arg: 3, scope: !1322, file: !69, line: 1066, type: !28)
!1330 = !DILocation(line: 1066, column: 53, scope: !1322)
!1331 = !DILocalVariable(name: "s32Result", scope: !1322, file: !69, line: 1068, type: !16)
!1332 = !DILocation(line: 1068, column: 6, scope: !1322)
!1333 = !DILocalVariable(name: "s32Temp1", scope: !1322, file: !69, line: 1068, type: !16)
!1334 = !DILocation(line: 1068, column: 21, scope: !1322)
!1335 = !DILocation(line: 1069, column: 14, scope: !1322)
!1336 = !DILocation(line: 1069, column: 22, scope: !1322)
!1337 = !DILocation(line: 1069, column: 20, scope: !1322)
!1338 = !DILocation(line: 1069, column: 12, scope: !1322)
!1339 = !DILocation(line: 1071, column: 5, scope: !1340)
!1340 = distinct !DILexicalBlock(scope: !1322, file: !69, line: 1071, column: 5)
!1341 = !DILocation(line: 1071, column: 17, scope: !1340)
!1342 = !DILocation(line: 1071, column: 5, scope: !1322)
!1343 = !DILocation(line: 1073, column: 6, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1345, file: !69, line: 1073, column: 6)
!1345 = distinct !DILexicalBlock(scope: !1340, file: !69, line: 1072, column: 2)
!1346 = !DILocation(line: 1073, column: 16, scope: !1344)
!1347 = !DILocation(line: 1073, column: 6, scope: !1345)
!1348 = !DILocation(line: 1075, column: 4, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1344, file: !69, line: 1074, column: 3)
!1350 = !DILocation(line: 1077, column: 11, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1344, file: !69, line: 1077, column: 11)
!1352 = !DILocation(line: 1077, column: 21, scope: !1351)
!1353 = !DILocation(line: 1077, column: 11, scope: !1344)
!1354 = !DILocation(line: 1079, column: 4, scope: !1355)
!1355 = distinct !DILexicalBlock(scope: !1351, file: !69, line: 1078, column: 3)
!1356 = !DILocation(line: 1083, column: 4, scope: !1357)
!1357 = distinct !DILexicalBlock(scope: !1351, file: !69, line: 1082, column: 3)
!1358 = !DILocation(line: 1088, column: 15, scope: !1359)
!1359 = distinct !DILexicalBlock(scope: !1340, file: !69, line: 1087, column: 2)
!1360 = !DILocation(line: 1088, column: 28, scope: !1359)
!1361 = !DILocation(line: 1088, column: 38, scope: !1359)
!1362 = !DILocation(line: 1088, column: 37, scope: !1359)
!1363 = !DILocation(line: 1088, column: 51, scope: !1359)
!1364 = !DILocation(line: 1088, column: 50, scope: !1359)
!1365 = !DILocation(line: 1088, column: 25, scope: !1359)
!1366 = !DILocation(line: 1088, column: 64, scope: !1359)
!1367 = !DILocation(line: 1088, column: 12, scope: !1359)
!1368 = !DILocation(line: 1089, column: 16, scope: !1359)
!1369 = !DILocation(line: 1089, column: 25, scope: !1359)
!1370 = !DILocation(line: 1089, column: 24, scope: !1359)
!1371 = !DILocation(line: 1089, column: 41, scope: !1359)
!1372 = !DILocation(line: 1089, column: 51, scope: !1359)
!1373 = !DILocation(line: 1089, column: 50, scope: !1359)
!1374 = !DILocation(line: 1089, column: 38, scope: !1359)
!1375 = !DILocation(line: 1089, column: 13, scope: !1359)
!1376 = !DILocation(line: 1090, column: 6, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1359, file: !69, line: 1090, column: 6)
!1378 = !DILocation(line: 1090, column: 16, scope: !1377)
!1379 = !DILocation(line: 1090, column: 6, scope: !1359)
!1380 = !DILocation(line: 1092, column: 7, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1382, file: !69, line: 1092, column: 7)
!1382 = distinct !DILexicalBlock(scope: !1377, file: !69, line: 1091, column: 3)
!1383 = !DILocation(line: 1092, column: 17, scope: !1381)
!1384 = !DILocation(line: 1092, column: 7, scope: !1382)
!1385 = !DILocation(line: 1094, column: 17, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1381, file: !69, line: 1093, column: 4)
!1387 = !DILocation(line: 1094, column: 12, scope: !1386)
!1388 = !DILocation(line: 1094, column: 5, scope: !1386)
!1389 = !DILocation(line: 1098, column: 5, scope: !1390)
!1390 = distinct !DILexicalBlock(scope: !1381, file: !69, line: 1097, column: 4)
!1391 = !DILocation(line: 1103, column: 4, scope: !1392)
!1392 = distinct !DILexicalBlock(scope: !1377, file: !69, line: 1102, column: 3)
!1393 = !DILocation(line: 1107, column: 1, scope: !1322)
!1394 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1124, type: !1395, scopeLine: 1125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1395 = !DISubroutineType(types: !1396)
!1396 = !{!665, !665, !16}
!1397 = !DILocalVariable(name: "numerator", arg: 1, scope: !1394, file: !69, line: 1124, type: !665)
!1398 = !DILocation(line: 1124, column: 25, scope: !1394)
!1399 = !DILocalVariable(name: "denominator", arg: 2, scope: !1394, file: !69, line: 1124, type: !16)
!1400 = !DILocation(line: 1124, column: 40, scope: !1394)
!1401 = !DILocalVariable(name: "u32Temp1", scope: !1394, file: !69, line: 1126, type: !665)
!1402 = !DILocation(line: 1126, column: 6, scope: !1394)
!1403 = !DILocation(line: 1127, column: 5, scope: !1404)
!1404 = distinct !DILexicalBlock(scope: !1394, file: !69, line: 1127, column: 5)
!1405 = !DILocation(line: 1127, column: 17, scope: !1404)
!1406 = !DILocation(line: 1127, column: 5, scope: !1394)
!1407 = !DILocation(line: 1129, column: 3, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1404, file: !69, line: 1128, column: 2)
!1409 = !DILocation(line: 1133, column: 6, scope: !1410)
!1410 = distinct !DILexicalBlock(scope: !1411, file: !69, line: 1133, column: 6)
!1411 = distinct !DILexicalBlock(scope: !1404, file: !69, line: 1132, column: 2)
!1412 = !DILocation(line: 1133, column: 18, scope: !1410)
!1413 = !DILocation(line: 1133, column: 6, scope: !1411)
!1414 = !DILocation(line: 1135, column: 4, scope: !1415)
!1415 = distinct !DILexicalBlock(scope: !1410, file: !69, line: 1134, column: 3)
!1416 = !DILocation(line: 1139, column: 16, scope: !1417)
!1417 = distinct !DILexicalBlock(scope: !1410, file: !69, line: 1138, column: 3)
!1418 = !DILocation(line: 1139, column: 30, scope: !1417)
!1419 = !DILocation(line: 1139, column: 40, scope: !1417)
!1420 = !DILocation(line: 1139, column: 39, scope: !1417)
!1421 = !DILocation(line: 1139, column: 55, scope: !1417)
!1422 = !DILocation(line: 1139, column: 53, scope: !1417)
!1423 = !DILocation(line: 1139, column: 26, scope: !1417)
!1424 = !DILocation(line: 1139, column: 68, scope: !1417)
!1425 = !DILocation(line: 1139, column: 13, scope: !1417)
!1426 = !DILocation(line: 1140, column: 16, scope: !1417)
!1427 = !DILocation(line: 1140, column: 25, scope: !1417)
!1428 = !DILocation(line: 1140, column: 24, scope: !1417)
!1429 = !DILocation(line: 1140, column: 41, scope: !1417)
!1430 = !DILocation(line: 1140, column: 51, scope: !1417)
!1431 = !DILocation(line: 1140, column: 50, scope: !1417)
!1432 = !DILocation(line: 1140, column: 38, scope: !1417)
!1433 = !DILocation(line: 1140, column: 13, scope: !1417)
!1434 = !DILocation(line: 1141, column: 11, scope: !1417)
!1435 = !DILocation(line: 1141, column: 4, scope: !1417)
!1436 = !DILocation(line: 1144, column: 1, scope: !1394)
!1437 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1161, type: !1438, scopeLine: 1162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1438 = !DISubroutineType(types: !1439)
!1439 = !{!665, !16, !665}
!1440 = !DILocalVariable(name: "numerator", arg: 1, scope: !1437, file: !69, line: 1161, type: !16)
!1441 = !DILocation(line: 1161, column: 25, scope: !1437)
!1442 = !DILocalVariable(name: "denominator", arg: 2, scope: !1437, file: !69, line: 1161, type: !665)
!1443 = !DILocation(line: 1161, column: 40, scope: !1437)
!1444 = !DILocalVariable(name: "s32Temp1", scope: !1437, file: !69, line: 1163, type: !16)
!1445 = !DILocation(line: 1163, column: 6, scope: !1437)
!1446 = !DILocation(line: 1164, column: 5, scope: !1447)
!1447 = distinct !DILexicalBlock(scope: !1437, file: !69, line: 1164, column: 5)
!1448 = !DILocation(line: 1164, column: 17, scope: !1447)
!1449 = !DILocation(line: 1164, column: 5, scope: !1437)
!1450 = !DILocation(line: 1166, column: 6, scope: !1451)
!1451 = distinct !DILexicalBlock(scope: !1452, file: !69, line: 1166, column: 6)
!1452 = distinct !DILexicalBlock(scope: !1447, file: !69, line: 1165, column: 2)
!1453 = !DILocation(line: 1166, column: 16, scope: !1451)
!1454 = !DILocation(line: 1166, column: 6, scope: !1452)
!1455 = !DILocation(line: 1168, column: 4, scope: !1456)
!1456 = distinct !DILexicalBlock(scope: !1451, file: !69, line: 1167, column: 3)
!1457 = !DILocation(line: 1172, column: 4, scope: !1458)
!1458 = distinct !DILexicalBlock(scope: !1451, file: !69, line: 1171, column: 3)
!1459 = !DILocation(line: 1177, column: 6, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1461, file: !69, line: 1177, column: 6)
!1461 = distinct !DILexicalBlock(scope: !1447, file: !69, line: 1176, column: 2)
!1462 = !DILocation(line: 1177, column: 16, scope: !1460)
!1463 = !DILocation(line: 1177, column: 6, scope: !1461)
!1464 = !DILocation(line: 1179, column: 17, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1460, file: !69, line: 1178, column: 3)
!1466 = !DILocation(line: 1179, column: 31, scope: !1465)
!1467 = !DILocation(line: 1179, column: 41, scope: !1465)
!1468 = !DILocation(line: 1179, column: 40, scope: !1465)
!1469 = !DILocation(line: 1179, column: 56, scope: !1465)
!1470 = !DILocation(line: 1179, column: 54, scope: !1465)
!1471 = !DILocation(line: 1179, column: 27, scope: !1465)
!1472 = !DILocation(line: 1179, column: 69, scope: !1465)
!1473 = !DILocation(line: 1179, column: 13, scope: !1465)
!1474 = !DILocation(line: 1180, column: 13, scope: !1465)
!1475 = !DILocation(line: 1180, column: 23, scope: !1465)
!1476 = !DILocation(line: 1180, column: 22, scope: !1465)
!1477 = !DILocation(line: 1180, column: 39, scope: !1465)
!1478 = !DILocation(line: 1180, column: 48, scope: !1465)
!1479 = !DILocation(line: 1180, column: 47, scope: !1465)
!1480 = !DILocation(line: 1180, column: 36, scope: !1465)
!1481 = !DILocation(line: 1180, column: 4, scope: !1465)
!1482 = !DILocation(line: 1184, column: 4, scope: !1483)
!1483 = distinct !DILexicalBlock(scope: !1460, file: !69, line: 1183, column: 3)
!1484 = !DILocation(line: 1187, column: 1, scope: !1437)
!1485 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1204, type: !1486, scopeLine: 1205, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1486 = !DISubroutineType(types: !1487)
!1487 = !{!665, !16, !16}
!1488 = !DILocalVariable(name: "numerator", arg: 1, scope: !1485, file: !69, line: 1204, type: !16)
!1489 = !DILocation(line: 1204, column: 25, scope: !1485)
!1490 = !DILocalVariable(name: "denominator", arg: 2, scope: !1485, file: !69, line: 1204, type: !16)
!1491 = !DILocation(line: 1204, column: 40, scope: !1485)
!1492 = !DILocalVariable(name: "u32Temp1", scope: !1485, file: !69, line: 1206, type: !665)
!1493 = !DILocation(line: 1206, column: 6, scope: !1485)
!1494 = !DILocalVariable(name: "u32Temp2", scope: !1485, file: !69, line: 1206, type: !665)
!1495 = !DILocation(line: 1206, column: 20, scope: !1485)
!1496 = !DILocation(line: 1207, column: 5, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1485, file: !69, line: 1207, column: 5)
!1498 = !DILocation(line: 1207, column: 17, scope: !1497)
!1499 = !DILocation(line: 1207, column: 5, scope: !1485)
!1500 = !DILocation(line: 1209, column: 6, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1502, file: !69, line: 1209, column: 6)
!1502 = distinct !DILexicalBlock(scope: !1497, file: !69, line: 1208, column: 2)
!1503 = !DILocation(line: 1209, column: 16, scope: !1501)
!1504 = !DILocation(line: 1209, column: 6, scope: !1502)
!1505 = !DILocation(line: 1211, column: 4, scope: !1506)
!1506 = distinct !DILexicalBlock(scope: !1501, file: !69, line: 1210, column: 3)
!1507 = !DILocation(line: 1215, column: 4, scope: !1508)
!1508 = distinct !DILexicalBlock(scope: !1501, file: !69, line: 1214, column: 3)
!1509 = !DILocation(line: 1220, column: 6, scope: !1510)
!1510 = distinct !DILexicalBlock(scope: !1511, file: !69, line: 1220, column: 6)
!1511 = distinct !DILexicalBlock(scope: !1497, file: !69, line: 1219, column: 2)
!1512 = !DILocation(line: 1220, column: 16, scope: !1510)
!1513 = !DILocation(line: 1220, column: 6, scope: !1511)
!1514 = !DILocation(line: 1222, column: 7, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1516, file: !69, line: 1222, column: 7)
!1516 = distinct !DILexicalBlock(scope: !1510, file: !69, line: 1221, column: 3)
!1517 = !DILocation(line: 1222, column: 17, scope: !1515)
!1518 = !DILocation(line: 1222, column: 7, scope: !1516)
!1519 = !DILocation(line: 1224, column: 5, scope: !1520)
!1520 = distinct !DILexicalBlock(scope: !1515, file: !69, line: 1223, column: 4)
!1521 = !DILocation(line: 1228, column: 8, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1523, file: !69, line: 1228, column: 8)
!1523 = distinct !DILexicalBlock(scope: !1515, file: !69, line: 1227, column: 4)
!1524 = !DILocation(line: 1228, column: 20, scope: !1522)
!1525 = !DILocation(line: 1228, column: 8, scope: !1523)
!1526 = !DILocation(line: 1230, column: 6, scope: !1527)
!1527 = distinct !DILexicalBlock(scope: !1522, file: !69, line: 1229, column: 5)
!1528 = !DILocation(line: 1234, column: 18, scope: !1529)
!1529 = distinct !DILexicalBlock(scope: !1522, file: !69, line: 1233, column: 5)
!1530 = !DILocation(line: 1234, column: 32, scope: !1529)
!1531 = !DILocation(line: 1234, column: 42, scope: !1529)
!1532 = !DILocation(line: 1234, column: 41, scope: !1529)
!1533 = !DILocation(line: 1234, column: 57, scope: !1529)
!1534 = !DILocation(line: 1234, column: 55, scope: !1529)
!1535 = !DILocation(line: 1234, column: 28, scope: !1529)
!1536 = !DILocation(line: 1234, column: 71, scope: !1529)
!1537 = !DILocation(line: 1234, column: 15, scope: !1529)
!1538 = !DILocation(line: 1235, column: 18, scope: !1529)
!1539 = !DILocation(line: 1235, column: 29, scope: !1529)
!1540 = !DILocation(line: 1235, column: 27, scope: !1529)
!1541 = !DILocation(line: 1235, column: 45, scope: !1529)
!1542 = !DILocation(line: 1235, column: 57, scope: !1529)
!1543 = !DILocation(line: 1235, column: 55, scope: !1529)
!1544 = !DILocation(line: 1235, column: 42, scope: !1529)
!1545 = !DILocation(line: 1235, column: 15, scope: !1529)
!1546 = !DILocation(line: 1236, column: 13, scope: !1529)
!1547 = !DILocation(line: 1236, column: 6, scope: !1529)
!1548 = !DILocation(line: 1242, column: 7, scope: !1549)
!1549 = distinct !DILexicalBlock(scope: !1550, file: !69, line: 1242, column: 7)
!1550 = distinct !DILexicalBlock(scope: !1510, file: !69, line: 1241, column: 3)
!1551 = !DILocation(line: 1242, column: 19, scope: !1549)
!1552 = !DILocation(line: 1242, column: 7, scope: !1550)
!1553 = !DILocation(line: 1244, column: 5, scope: !1554)
!1554 = distinct !DILexicalBlock(scope: !1549, file: !69, line: 1243, column: 4)
!1555 = !DILocation(line: 1248, column: 18, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1549, file: !69, line: 1247, column: 4)
!1557 = !DILocation(line: 1248, column: 17, scope: !1556)
!1558 = !DILocation(line: 1248, column: 15, scope: !1556)
!1559 = !DILocation(line: 1249, column: 20, scope: !1556)
!1560 = !DILocation(line: 1249, column: 19, scope: !1556)
!1561 = !DILocation(line: 1249, column: 17, scope: !1556)
!1562 = !DILocation(line: 1250, column: 17, scope: !1556)
!1563 = !DILocation(line: 1250, column: 31, scope: !1556)
!1564 = !DILocation(line: 1250, column: 41, scope: !1556)
!1565 = !DILocation(line: 1250, column: 40, scope: !1556)
!1566 = !DILocation(line: 1250, column: 56, scope: !1556)
!1567 = !DILocation(line: 1250, column: 54, scope: !1556)
!1568 = !DILocation(line: 1250, column: 27, scope: !1556)
!1569 = !DILocation(line: 1250, column: 70, scope: !1556)
!1570 = !DILocation(line: 1250, column: 14, scope: !1556)
!1571 = !DILocation(line: 1251, column: 17, scope: !1556)
!1572 = !DILocation(line: 1251, column: 28, scope: !1556)
!1573 = !DILocation(line: 1251, column: 26, scope: !1556)
!1574 = !DILocation(line: 1251, column: 44, scope: !1556)
!1575 = !DILocation(line: 1251, column: 56, scope: !1556)
!1576 = !DILocation(line: 1251, column: 54, scope: !1556)
!1577 = !DILocation(line: 1251, column: 41, scope: !1556)
!1578 = !DILocation(line: 1251, column: 14, scope: !1556)
!1579 = !DILocation(line: 1252, column: 12, scope: !1556)
!1580 = !DILocation(line: 1252, column: 5, scope: !1556)
!1581 = !DILocation(line: 1257, column: 1, scope: !1485)
!1582 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1274, type: !1583, scopeLine: 1275, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1583 = !DISubroutineType(types: !1584)
!1584 = !{!665, !665, !665}
!1585 = !DILocalVariable(name: "numerator", arg: 1, scope: !1582, file: !69, line: 1274, type: !665)
!1586 = !DILocation(line: 1274, column: 25, scope: !1582)
!1587 = !DILocalVariable(name: "denominator", arg: 2, scope: !1582, file: !69, line: 1274, type: !665)
!1588 = !DILocation(line: 1274, column: 40, scope: !1582)
!1589 = !DILocalVariable(name: "u32Temp1", scope: !1582, file: !69, line: 1277, type: !665)
!1590 = !DILocation(line: 1277, column: 6, scope: !1582)
!1591 = !DILocalVariable(name: "u32Temp2", scope: !1582, file: !69, line: 1277, type: !665)
!1592 = !DILocation(line: 1277, column: 20, scope: !1582)
!1593 = !DILocalVariable(name: "u32Temp3", scope: !1582, file: !69, line: 1277, type: !665)
!1594 = !DILocation(line: 1277, column: 34, scope: !1582)
!1595 = !DILocalVariable(name: "numerator_old", scope: !1582, file: !69, line: 1277, type: !665)
!1596 = !DILocation(line: 1277, column: 48, scope: !1582)
!1597 = !DILocation(line: 1278, column: 5, scope: !1598)
!1598 = distinct !DILexicalBlock(scope: !1582, file: !69, line: 1278, column: 5)
!1599 = !DILocation(line: 1278, column: 16, scope: !1598)
!1600 = !DILocation(line: 1278, column: 5, scope: !1582)
!1601 = !DILocation(line: 1280, column: 3, scope: !1602)
!1602 = distinct !DILexicalBlock(scope: !1598, file: !69, line: 1279, column: 2)
!1603 = !DILocation(line: 1284, column: 14, scope: !1604)
!1604 = distinct !DILexicalBlock(scope: !1598, file: !69, line: 1283, column: 2)
!1605 = !DILocation(line: 1284, column: 26, scope: !1604)
!1606 = !DILocation(line: 1284, column: 41, scope: !1604)
!1607 = !DILocation(line: 1284, column: 51, scope: !1604)
!1608 = !DILocation(line: 1284, column: 50, scope: !1604)
!1609 = !DILocation(line: 1284, column: 38, scope: !1604)
!1610 = !DILocation(line: 1284, column: 24, scope: !1604)
!1611 = !DILocation(line: 1284, column: 12, scope: !1604)
!1612 = !DILocation(line: 1285, column: 7, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1604, file: !69, line: 1285, column: 6)
!1614 = !DILocation(line: 1285, column: 16, scope: !1613)
!1615 = !DILocation(line: 1285, column: 24, scope: !1613)
!1616 = !DILocation(line: 1285, column: 6, scope: !1604)
!1617 = !DILocation(line: 1287, column: 16, scope: !1618)
!1618 = distinct !DILexicalBlock(scope: !1613, file: !69, line: 1286, column: 3)
!1619 = !DILocation(line: 1287, column: 27, scope: !1618)
!1620 = !DILocation(line: 1287, column: 13, scope: !1618)
!1621 = !DILocation(line: 1288, column: 3, scope: !1618)
!1622 = !DILocation(line: 1291, column: 16, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1613, file: !69, line: 1290, column: 3)
!1624 = !DILocation(line: 1291, column: 27, scope: !1623)
!1625 = !DILocation(line: 1291, column: 32, scope: !1623)
!1626 = !DILocation(line: 1291, column: 13, scope: !1623)
!1627 = !DILocation(line: 1294, column: 6, scope: !1628)
!1628 = distinct !DILexicalBlock(scope: !1604, file: !69, line: 1294, column: 6)
!1629 = !DILocation(line: 1294, column: 17, scope: !1628)
!1630 = !DILocation(line: 1294, column: 15, scope: !1628)
!1631 = !DILocation(line: 1294, column: 6, scope: !1604)
!1632 = !DILocation(line: 1296, column: 12, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1628, file: !69, line: 1295, column: 3)
!1634 = !DILocation(line: 1296, column: 22, scope: !1633)
!1635 = !DILocation(line: 1296, column: 21, scope: !1633)
!1636 = !DILocation(line: 1296, column: 4, scope: !1633)
!1637 = !DILocation(line: 1300, column: 13, scope: !1638)
!1638 = distinct !DILexicalBlock(scope: !1628, file: !69, line: 1299, column: 3)
!1639 = !DILocation(line: 1300, column: 23, scope: !1638)
!1640 = !DILocation(line: 1300, column: 22, scope: !1638)
!1641 = !DILocation(line: 1300, column: 36, scope: !1638)
!1642 = !DILocation(line: 1300, column: 4, scope: !1638)
!1643 = !DILocation(line: 1305, column: 1, scope: !1582)
!1644 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1322, type: !1645, scopeLine: 1323, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1645 = !DISubroutineType(types: !1646)
!1646 = !{!16, !665, !16}
!1647 = !DILocalVariable(name: "numerator", arg: 1, scope: !1644, file: !69, line: 1322, type: !665)
!1648 = !DILocation(line: 1322, column: 25, scope: !1644)
!1649 = !DILocalVariable(name: "denominator", arg: 2, scope: !1644, file: !69, line: 1322, type: !16)
!1650 = !DILocation(line: 1322, column: 40, scope: !1644)
!1651 = !DILocalVariable(name: "u32Temp1", scope: !1644, file: !69, line: 1324, type: !665)
!1652 = !DILocation(line: 1324, column: 6, scope: !1644)
!1653 = !DILocalVariable(name: "u32Temp2", scope: !1644, file: !69, line: 1324, type: !665)
!1654 = !DILocation(line: 1324, column: 20, scope: !1644)
!1655 = !DILocation(line: 1325, column: 5, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1644, file: !69, line: 1325, column: 5)
!1657 = !DILocation(line: 1325, column: 17, scope: !1656)
!1658 = !DILocation(line: 1325, column: 5, scope: !1644)
!1659 = !DILocation(line: 1327, column: 6, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1661, file: !69, line: 1327, column: 6)
!1661 = distinct !DILexicalBlock(scope: !1656, file: !69, line: 1326, column: 2)
!1662 = !DILocation(line: 1327, column: 18, scope: !1660)
!1663 = !DILocation(line: 1327, column: 6, scope: !1661)
!1664 = !DILocation(line: 1329, column: 4, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1660, file: !69, line: 1328, column: 3)
!1666 = !DILocation(line: 1333, column: 19, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1660, file: !69, line: 1332, column: 3)
!1668 = !DILocation(line: 1333, column: 18, scope: !1667)
!1669 = !DILocation(line: 1333, column: 16, scope: !1667)
!1670 = !DILocation(line: 1334, column: 16, scope: !1667)
!1671 = !DILocation(line: 1334, column: 30, scope: !1667)
!1672 = !DILocation(line: 1334, column: 40, scope: !1667)
!1673 = !DILocation(line: 1334, column: 39, scope: !1667)
!1674 = !DILocation(line: 1334, column: 55, scope: !1667)
!1675 = !DILocation(line: 1334, column: 53, scope: !1667)
!1676 = !DILocation(line: 1334, column: 26, scope: !1667)
!1677 = !DILocation(line: 1334, column: 69, scope: !1667)
!1678 = !DILocation(line: 1334, column: 13, scope: !1667)
!1679 = !DILocation(line: 1335, column: 16, scope: !1667)
!1680 = !DILocation(line: 1335, column: 25, scope: !1667)
!1681 = !DILocation(line: 1335, column: 24, scope: !1667)
!1682 = !DILocation(line: 1335, column: 41, scope: !1667)
!1683 = !DILocation(line: 1335, column: 51, scope: !1667)
!1684 = !DILocation(line: 1335, column: 50, scope: !1667)
!1685 = !DILocation(line: 1335, column: 38, scope: !1667)
!1686 = !DILocation(line: 1335, column: 13, scope: !1667)
!1687 = !DILocation(line: 1336, column: 7, scope: !1688)
!1688 = distinct !DILexicalBlock(scope: !1667, file: !69, line: 1336, column: 7)
!1689 = !DILocation(line: 1336, column: 16, scope: !1688)
!1690 = !DILocation(line: 1336, column: 7, scope: !1667)
!1691 = !DILocation(line: 1338, column: 13, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1688, file: !69, line: 1337, column: 4)
!1693 = !DILocation(line: 1338, column: 12, scope: !1692)
!1694 = !DILocation(line: 1338, column: 5, scope: !1692)
!1695 = !DILocation(line: 1342, column: 5, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1688, file: !69, line: 1341, column: 4)
!1697 = !DILocation(line: 1348, column: 15, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1656, file: !69, line: 1347, column: 2)
!1699 = !DILocation(line: 1348, column: 29, scope: !1698)
!1700 = !DILocation(line: 1348, column: 39, scope: !1698)
!1701 = !DILocation(line: 1348, column: 38, scope: !1698)
!1702 = !DILocation(line: 1348, column: 54, scope: !1698)
!1703 = !DILocation(line: 1348, column: 52, scope: !1698)
!1704 = !DILocation(line: 1348, column: 25, scope: !1698)
!1705 = !DILocation(line: 1348, column: 68, scope: !1698)
!1706 = !DILocation(line: 1348, column: 12, scope: !1698)
!1707 = !DILocation(line: 1349, column: 15, scope: !1698)
!1708 = !DILocation(line: 1349, column: 24, scope: !1698)
!1709 = !DILocation(line: 1349, column: 23, scope: !1698)
!1710 = !DILocation(line: 1349, column: 40, scope: !1698)
!1711 = !DILocation(line: 1349, column: 50, scope: !1698)
!1712 = !DILocation(line: 1349, column: 49, scope: !1698)
!1713 = !DILocation(line: 1349, column: 37, scope: !1698)
!1714 = !DILocation(line: 1349, column: 12, scope: !1698)
!1715 = !DILocation(line: 1350, column: 6, scope: !1716)
!1716 = distinct !DILexicalBlock(scope: !1698, file: !69, line: 1350, column: 6)
!1717 = !DILocation(line: 1350, column: 15, scope: !1716)
!1718 = !DILocation(line: 1350, column: 6, scope: !1698)
!1719 = !DILocation(line: 1352, column: 11, scope: !1720)
!1720 = distinct !DILexicalBlock(scope: !1716, file: !69, line: 1351, column: 3)
!1721 = !DILocation(line: 1352, column: 4, scope: !1720)
!1722 = !DILocation(line: 1356, column: 4, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1716, file: !69, line: 1355, column: 3)
!1724 = !DILocation(line: 1359, column: 1, scope: !1644)
!1725 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1377, type: !1726, scopeLine: 1378, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1726 = !DISubroutineType(types: !1727)
!1727 = !{!16, !16, !665}
!1728 = !DILocalVariable(name: "numerator", arg: 1, scope: !1725, file: !69, line: 1377, type: !16)
!1729 = !DILocation(line: 1377, column: 25, scope: !1725)
!1730 = !DILocalVariable(name: "denominator", arg: 2, scope: !1725, file: !69, line: 1377, type: !665)
!1731 = !DILocation(line: 1377, column: 40, scope: !1725)
!1732 = !DILocalVariable(name: "s32Temp1", scope: !1725, file: !69, line: 1379, type: !16)
!1733 = !DILocation(line: 1379, column: 6, scope: !1725)
!1734 = !DILocalVariable(name: "s32Temp2", scope: !1725, file: !69, line: 1379, type: !16)
!1735 = !DILocation(line: 1379, column: 20, scope: !1725)
!1736 = !DILocalVariable(name: "u32Temp0", scope: !1725, file: !69, line: 1380, type: !665)
!1737 = !DILocation(line: 1380, column: 6, scope: !1725)
!1738 = !DILocalVariable(name: "u32Temp1", scope: !1725, file: !69, line: 1380, type: !665)
!1739 = !DILocation(line: 1380, column: 20, scope: !1725)
!1740 = !DILocalVariable(name: "u32Temp2", scope: !1725, file: !69, line: 1380, type: !665)
!1741 = !DILocation(line: 1380, column: 34, scope: !1725)
!1742 = !DILocation(line: 1381, column: 5, scope: !1743)
!1743 = distinct !DILexicalBlock(scope: !1725, file: !69, line: 1381, column: 5)
!1744 = !DILocation(line: 1381, column: 17, scope: !1743)
!1745 = !DILocation(line: 1381, column: 5, scope: !1725)
!1746 = !DILocation(line: 1383, column: 6, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1748, file: !69, line: 1383, column: 6)
!1748 = distinct !DILexicalBlock(scope: !1743, file: !69, line: 1382, column: 2)
!1749 = !DILocation(line: 1383, column: 16, scope: !1747)
!1750 = !DILocation(line: 1383, column: 6, scope: !1748)
!1751 = !DILocation(line: 1385, column: 4, scope: !1752)
!1752 = distinct !DILexicalBlock(scope: !1747, file: !69, line: 1384, column: 3)
!1753 = !DILocation(line: 1389, column: 4, scope: !1754)
!1754 = distinct !DILexicalBlock(scope: !1747, file: !69, line: 1388, column: 3)
!1755 = !DILocation(line: 1394, column: 6, scope: !1756)
!1756 = distinct !DILexicalBlock(scope: !1757, file: !69, line: 1394, column: 6)
!1757 = distinct !DILexicalBlock(scope: !1743, file: !69, line: 1393, column: 2)
!1758 = !DILocation(line: 1394, column: 16, scope: !1756)
!1759 = !DILocation(line: 1394, column: 6, scope: !1757)
!1760 = !DILocation(line: 1396, column: 16, scope: !1761)
!1761 = distinct !DILexicalBlock(scope: !1756, file: !69, line: 1395, column: 3)
!1762 = !DILocation(line: 1396, column: 15, scope: !1761)
!1763 = !DILocation(line: 1396, column: 13, scope: !1761)
!1764 = !DILocation(line: 1397, column: 16, scope: !1761)
!1765 = !DILocation(line: 1397, column: 25, scope: !1761)
!1766 = !DILocation(line: 1397, column: 24, scope: !1761)
!1767 = !DILocation(line: 1397, column: 13, scope: !1761)
!1768 = !DILocation(line: 1398, column: 15, scope: !1761)
!1769 = !DILocation(line: 1398, column: 28, scope: !1761)
!1770 = !DILocation(line: 1398, column: 37, scope: !1761)
!1771 = !DILocation(line: 1398, column: 36, scope: !1761)
!1772 = !DILocation(line: 1398, column: 52, scope: !1761)
!1773 = !DILocation(line: 1398, column: 50, scope: !1761)
!1774 = !DILocation(line: 1398, column: 24, scope: !1761)
!1775 = !DILocation(line: 1398, column: 13, scope: !1761)
!1776 = !DILocation(line: 1400, column: 8, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1761, file: !69, line: 1400, column: 7)
!1778 = !DILocation(line: 1400, column: 20, scope: !1777)
!1779 = !DILocation(line: 1400, column: 27, scope: !1777)
!1780 = !DILocation(line: 1400, column: 7, scope: !1761)
!1781 = !DILocation(line: 1402, column: 20, scope: !1782)
!1782 = distinct !DILexicalBlock(scope: !1777, file: !69, line: 1401, column: 4)
!1783 = !DILocation(line: 1402, column: 32, scope: !1782)
!1784 = !DILocation(line: 1402, column: 17, scope: !1782)
!1785 = !DILocation(line: 1403, column: 4, scope: !1782)
!1786 = !DILocation(line: 1406, column: 20, scope: !1787)
!1787 = distinct !DILexicalBlock(scope: !1777, file: !69, line: 1405, column: 4)
!1788 = !DILocation(line: 1406, column: 32, scope: !1787)
!1789 = !DILocation(line: 1406, column: 38, scope: !1787)
!1790 = !DILocation(line: 1406, column: 17, scope: !1787)
!1791 = !DILocation(line: 1410, column: 7, scope: !1792)
!1792 = distinct !DILexicalBlock(scope: !1761, file: !69, line: 1410, column: 7)
!1793 = !DILocation(line: 1410, column: 18, scope: !1792)
!1794 = !DILocation(line: 1410, column: 16, scope: !1792)
!1795 = !DILocation(line: 1410, column: 7, scope: !1761)
!1796 = !DILocation(line: 1412, column: 14, scope: !1797)
!1797 = distinct !DILexicalBlock(scope: !1792, file: !69, line: 1411, column: 4)
!1798 = !DILocation(line: 1412, column: 13, scope: !1797)
!1799 = !DILocation(line: 1412, column: 23, scope: !1797)
!1800 = !DILocation(line: 1412, column: 5, scope: !1797)
!1801 = !DILocation(line: 1416, column: 14, scope: !1802)
!1802 = distinct !DILexicalBlock(scope: !1792, file: !69, line: 1415, column: 4)
!1803 = !DILocation(line: 1416, column: 23, scope: !1802)
!1804 = !DILocation(line: 1416, column: 12, scope: !1802)
!1805 = !DILocation(line: 1416, column: 27, scope: !1802)
!1806 = !DILocation(line: 1416, column: 5, scope: !1802)
!1807 = !DILocation(line: 1423, column: 16, scope: !1808)
!1808 = distinct !DILexicalBlock(scope: !1756, file: !69, line: 1422, column: 3)
!1809 = !DILocation(line: 1423, column: 30, scope: !1808)
!1810 = !DILocation(line: 1423, column: 40, scope: !1808)
!1811 = !DILocation(line: 1423, column: 39, scope: !1808)
!1812 = !DILocation(line: 1423, column: 55, scope: !1808)
!1813 = !DILocation(line: 1423, column: 53, scope: !1808)
!1814 = !DILocation(line: 1423, column: 26, scope: !1808)
!1815 = !DILocation(line: 1423, column: 69, scope: !1808)
!1816 = !DILocation(line: 1423, column: 13, scope: !1808)
!1817 = !DILocation(line: 1424, column: 16, scope: !1808)
!1818 = !DILocation(line: 1424, column: 26, scope: !1808)
!1819 = !DILocation(line: 1424, column: 25, scope: !1808)
!1820 = !DILocation(line: 1424, column: 42, scope: !1808)
!1821 = !DILocation(line: 1424, column: 51, scope: !1808)
!1822 = !DILocation(line: 1424, column: 50, scope: !1808)
!1823 = !DILocation(line: 1424, column: 39, scope: !1808)
!1824 = !DILocation(line: 1424, column: 13, scope: !1808)
!1825 = !DILocation(line: 1425, column: 11, scope: !1808)
!1826 = !DILocation(line: 1425, column: 4, scope: !1808)
!1827 = !DILocation(line: 1428, column: 1, scope: !1725)
!1828 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1445, type: !1829, scopeLine: 1446, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1829 = !DISubroutineType(types: !1830)
!1830 = !{!16, !16, !16}
!1831 = !DILocalVariable(name: "numerator", arg: 1, scope: !1828, file: !69, line: 1445, type: !16)
!1832 = !DILocation(line: 1445, column: 25, scope: !1828)
!1833 = !DILocalVariable(name: "denominator", arg: 2, scope: !1828, file: !69, line: 1445, type: !16)
!1834 = !DILocation(line: 1445, column: 40, scope: !1828)
!1835 = !DILocalVariable(name: "s32Temp1", scope: !1828, file: !69, line: 1447, type: !16)
!1836 = !DILocation(line: 1447, column: 6, scope: !1828)
!1837 = !DILocalVariable(name: "s32Temp2", scope: !1828, file: !69, line: 1447, type: !16)
!1838 = !DILocation(line: 1447, column: 20, scope: !1828)
!1839 = !DILocalVariable(name: "denominator_prime", scope: !1828, file: !69, line: 1448, type: !665)
!1840 = !DILocation(line: 1448, column: 6, scope: !1828)
!1841 = !DILocalVariable(name: "u32Temp1", scope: !1828, file: !69, line: 1448, type: !665)
!1842 = !DILocation(line: 1448, column: 29, scope: !1828)
!1843 = !DILocalVariable(name: "u32Temp2", scope: !1828, file: !69, line: 1448, type: !665)
!1844 = !DILocation(line: 1448, column: 43, scope: !1828)
!1845 = !DILocalVariable(name: "u32numerator", scope: !1828, file: !69, line: 1449, type: !665)
!1846 = !DILocation(line: 1449, column: 6, scope: !1828)
!1847 = !DILocalVariable(name: "u32denominator", scope: !1828, file: !69, line: 1449, type: !665)
!1848 = !DILocation(line: 1449, column: 23, scope: !1828)
!1849 = !DILocation(line: 1450, column: 5, scope: !1850)
!1850 = distinct !DILexicalBlock(scope: !1828, file: !69, line: 1450, column: 5)
!1851 = !DILocation(line: 1450, column: 15, scope: !1850)
!1852 = !DILocation(line: 1450, column: 5, scope: !1828)
!1853 = !DILocation(line: 1452, column: 6, scope: !1854)
!1854 = distinct !DILexicalBlock(scope: !1855, file: !69, line: 1452, column: 6)
!1855 = distinct !DILexicalBlock(scope: !1850, file: !69, line: 1451, column: 2)
!1856 = !DILocation(line: 1452, column: 18, scope: !1854)
!1857 = !DILocation(line: 1452, column: 6, scope: !1855)
!1858 = !DILocation(line: 1454, column: 7, scope: !1859)
!1859 = distinct !DILexicalBlock(scope: !1860, file: !69, line: 1454, column: 7)
!1860 = distinct !DILexicalBlock(scope: !1854, file: !69, line: 1453, column: 3)
!1861 = !DILocation(line: 1454, column: 19, scope: !1859)
!1862 = !DILocation(line: 1454, column: 7, scope: !1860)
!1863 = !DILocation(line: 1456, column: 5, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1859, file: !69, line: 1455, column: 4)
!1865 = !DILocation(line: 1460, column: 21, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1859, file: !69, line: 1459, column: 4)
!1867 = !DILocation(line: 1460, column: 20, scope: !1866)
!1868 = !DILocation(line: 1460, column: 18, scope: !1866)
!1869 = !DILocation(line: 1461, column: 23, scope: !1866)
!1870 = !DILocation(line: 1461, column: 22, scope: !1866)
!1871 = !DILocation(line: 1461, column: 20, scope: !1866)
!1872 = !DILocation(line: 1462, column: 16, scope: !1866)
!1873 = !DILocation(line: 1462, column: 33, scope: !1866)
!1874 = !DILocation(line: 1462, column: 46, scope: !1866)
!1875 = !DILocation(line: 1462, column: 45, scope: !1866)
!1876 = !DILocation(line: 1462, column: 64, scope: !1866)
!1877 = !DILocation(line: 1462, column: 62, scope: !1866)
!1878 = !DILocation(line: 1462, column: 29, scope: !1866)
!1879 = !DILocation(line: 1462, column: 81, scope: !1866)
!1880 = !DILocation(line: 1462, column: 14, scope: !1866)
!1881 = !DILocation(line: 1463, column: 17, scope: !1866)
!1882 = !DILocation(line: 1463, column: 30, scope: !1866)
!1883 = !DILocation(line: 1463, column: 29, scope: !1866)
!1884 = !DILocation(line: 1463, column: 49, scope: !1866)
!1885 = !DILocation(line: 1463, column: 58, scope: !1866)
!1886 = !DILocation(line: 1463, column: 57, scope: !1866)
!1887 = !DILocation(line: 1463, column: 46, scope: !1866)
!1888 = !DILocation(line: 1463, column: 14, scope: !1866)
!1889 = !DILocation(line: 1464, column: 8, scope: !1890)
!1890 = distinct !DILexicalBlock(scope: !1866, file: !69, line: 1464, column: 8)
!1891 = !DILocation(line: 1464, column: 17, scope: !1890)
!1892 = !DILocation(line: 1464, column: 8, scope: !1866)
!1893 = !DILocation(line: 1466, column: 13, scope: !1894)
!1894 = distinct !DILexicalBlock(scope: !1890, file: !69, line: 1465, column: 5)
!1895 = !DILocation(line: 1466, column: 6, scope: !1894)
!1896 = !DILocation(line: 1470, column: 6, scope: !1897)
!1897 = distinct !DILexicalBlock(scope: !1890, file: !69, line: 1469, column: 5)
!1898 = !DILocation(line: 1476, column: 20, scope: !1899)
!1899 = distinct !DILexicalBlock(scope: !1854, file: !69, line: 1475, column: 3)
!1900 = !DILocation(line: 1476, column: 19, scope: !1899)
!1901 = !DILocation(line: 1476, column: 29, scope: !1899)
!1902 = !DILocation(line: 1476, column: 17, scope: !1899)
!1903 = !DILocation(line: 1477, column: 16, scope: !1899)
!1904 = !DILocation(line: 1477, column: 33, scope: !1899)
!1905 = !DILocation(line: 1477, column: 46, scope: !1899)
!1906 = !DILocation(line: 1477, column: 45, scope: !1899)
!1907 = !DILocation(line: 1477, column: 61, scope: !1899)
!1908 = !DILocation(line: 1477, column: 59, scope: !1899)
!1909 = !DILocation(line: 1477, column: 29, scope: !1899)
!1910 = !DILocation(line: 1477, column: 75, scope: !1899)
!1911 = !DILocation(line: 1477, column: 13, scope: !1899)
!1912 = !DILocation(line: 1478, column: 16, scope: !1899)
!1913 = !DILocation(line: 1478, column: 29, scope: !1899)
!1914 = !DILocation(line: 1478, column: 28, scope: !1899)
!1915 = !DILocation(line: 1478, column: 45, scope: !1899)
!1916 = !DILocation(line: 1478, column: 54, scope: !1899)
!1917 = !DILocation(line: 1478, column: 53, scope: !1899)
!1918 = !DILocation(line: 1478, column: 42, scope: !1899)
!1919 = !DILocation(line: 1478, column: 13, scope: !1899)
!1920 = !DILocation(line: 1479, column: 13, scope: !1899)
!1921 = !DILocation(line: 1479, column: 12, scope: !1899)
!1922 = !DILocation(line: 1479, column: 22, scope: !1899)
!1923 = !DILocation(line: 1479, column: 4, scope: !1899)
!1924 = !DILocation(line: 1484, column: 6, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1926, file: !69, line: 1484, column: 6)
!1926 = distinct !DILexicalBlock(scope: !1850, file: !69, line: 1483, column: 2)
!1927 = !DILocation(line: 1484, column: 18, scope: !1925)
!1928 = !DILocation(line: 1484, column: 6, scope: !1926)
!1929 = !DILocation(line: 1486, column: 7, scope: !1930)
!1930 = distinct !DILexicalBlock(scope: !1931, file: !69, line: 1486, column: 7)
!1931 = distinct !DILexicalBlock(scope: !1925, file: !69, line: 1485, column: 3)
!1932 = !DILocation(line: 1486, column: 19, scope: !1930)
!1933 = !DILocation(line: 1486, column: 7, scope: !1931)
!1934 = !DILocation(line: 1488, column: 5, scope: !1935)
!1935 = distinct !DILexicalBlock(scope: !1930, file: !69, line: 1487, column: 4)
!1936 = !DILocation(line: 1492, column: 23, scope: !1937)
!1937 = distinct !DILexicalBlock(scope: !1930, file: !69, line: 1491, column: 4)
!1938 = !DILocation(line: 1492, column: 22, scope: !1937)
!1939 = !DILocation(line: 1492, column: 35, scope: !1937)
!1940 = !DILocation(line: 1492, column: 20, scope: !1937)
!1941 = !DILocation(line: 1493, column: 17, scope: !1937)
!1942 = !DILocation(line: 1493, column: 31, scope: !1937)
!1943 = !DILocation(line: 1493, column: 41, scope: !1937)
!1944 = !DILocation(line: 1493, column: 40, scope: !1937)
!1945 = !DILocation(line: 1493, column: 59, scope: !1937)
!1946 = !DILocation(line: 1493, column: 57, scope: !1937)
!1947 = !DILocation(line: 1493, column: 27, scope: !1937)
!1948 = !DILocation(line: 1493, column: 76, scope: !1937)
!1949 = !DILocation(line: 1493, column: 14, scope: !1937)
!1950 = !DILocation(line: 1494, column: 17, scope: !1937)
!1951 = !DILocation(line: 1494, column: 27, scope: !1937)
!1952 = !DILocation(line: 1494, column: 26, scope: !1937)
!1953 = !DILocation(line: 1494, column: 46, scope: !1937)
!1954 = !DILocation(line: 1494, column: 55, scope: !1937)
!1955 = !DILocation(line: 1494, column: 54, scope: !1937)
!1956 = !DILocation(line: 1494, column: 43, scope: !1937)
!1957 = !DILocation(line: 1494, column: 14, scope: !1937)
!1958 = !DILocation(line: 1495, column: 14, scope: !1937)
!1959 = !DILocation(line: 1495, column: 13, scope: !1937)
!1960 = !DILocation(line: 1495, column: 23, scope: !1937)
!1961 = !DILocation(line: 1495, column: 5, scope: !1937)
!1962 = !DILocation(line: 1500, column: 16, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1925, file: !69, line: 1499, column: 3)
!1964 = !DILocation(line: 1500, column: 30, scope: !1963)
!1965 = !DILocation(line: 1500, column: 40, scope: !1963)
!1966 = !DILocation(line: 1500, column: 39, scope: !1963)
!1967 = !DILocation(line: 1500, column: 55, scope: !1963)
!1968 = !DILocation(line: 1500, column: 53, scope: !1963)
!1969 = !DILocation(line: 1500, column: 26, scope: !1963)
!1970 = !DILocation(line: 1500, column: 69, scope: !1963)
!1971 = !DILocation(line: 1500, column: 13, scope: !1963)
!1972 = !DILocation(line: 1501, column: 16, scope: !1963)
!1973 = !DILocation(line: 1501, column: 26, scope: !1963)
!1974 = !DILocation(line: 1501, column: 25, scope: !1963)
!1975 = !DILocation(line: 1501, column: 42, scope: !1963)
!1976 = !DILocation(line: 1501, column: 51, scope: !1963)
!1977 = !DILocation(line: 1501, column: 50, scope: !1963)
!1978 = !DILocation(line: 1501, column: 39, scope: !1963)
!1979 = !DILocation(line: 1501, column: 13, scope: !1963)
!1980 = !DILocation(line: 1502, column: 11, scope: !1963)
!1981 = !DILocation(line: 1502, column: 4, scope: !1963)
!1982 = !DILocation(line: 1505, column: 1, scope: !1828)
!1983 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1523, type: !1984, scopeLine: 1524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1984 = !DISubroutineType(types: !1985)
!1985 = !{!6, !16, !665}
!1986 = !DILocalVariable(name: "numerator", arg: 1, scope: !1983, file: !69, line: 1523, type: !16)
!1987 = !DILocation(line: 1523, column: 25, scope: !1983)
!1988 = !DILocalVariable(name: "denominator", arg: 2, scope: !1983, file: !69, line: 1523, type: !665)
!1989 = !DILocation(line: 1523, column: 40, scope: !1983)
!1990 = !DILocalVariable(name: "numerator_prime", scope: !1983, file: !69, line: 1526, type: !665)
!1991 = !DILocation(line: 1526, column: 6, scope: !1983)
!1992 = !DILocalVariable(name: "u32Temp1", scope: !1983, file: !69, line: 1526, type: !665)
!1993 = !DILocation(line: 1526, column: 27, scope: !1983)
!1994 = !DILocalVariable(name: "u32Temp2", scope: !1983, file: !69, line: 1526, type: !665)
!1995 = !DILocation(line: 1526, column: 41, scope: !1983)
!1996 = !DILocalVariable(name: "u32Temp3", scope: !1983, file: !69, line: 1526, type: !665)
!1997 = !DILocation(line: 1526, column: 55, scope: !1983)
!1998 = !DILocalVariable(name: "s32Temp1", scope: !1983, file: !69, line: 1527, type: !16)
!1999 = !DILocation(line: 1527, column: 6, scope: !1983)
!2000 = !DILocalVariable(name: "s32Temp2", scope: !1983, file: !69, line: 1527, type: !16)
!2001 = !DILocation(line: 1527, column: 20, scope: !1983)
!2002 = !DILocalVariable(name: "s32Temp3", scope: !1983, file: !69, line: 1527, type: !16)
!2003 = !DILocation(line: 1527, column: 34, scope: !1983)
!2004 = !DILocation(line: 1528, column: 5, scope: !2005)
!2005 = distinct !DILexicalBlock(scope: !1983, file: !69, line: 1528, column: 5)
!2006 = !DILocation(line: 1528, column: 17, scope: !2005)
!2007 = !DILocation(line: 1528, column: 5, scope: !1983)
!2008 = !DILocation(line: 1530, column: 6, scope: !2009)
!2009 = distinct !DILexicalBlock(scope: !2010, file: !69, line: 1530, column: 6)
!2010 = distinct !DILexicalBlock(scope: !2005, file: !69, line: 1529, column: 2)
!2011 = !DILocation(line: 1530, column: 15, scope: !2009)
!2012 = !DILocation(line: 1530, column: 6, scope: !2010)
!2013 = !DILocation(line: 1532, column: 4, scope: !2014)
!2014 = distinct !DILexicalBlock(scope: !2009, file: !69, line: 1531, column: 3)
!2015 = !DILocation(line: 1536, column: 4, scope: !2016)
!2016 = distinct !DILexicalBlock(scope: !2009, file: !69, line: 1535, column: 3)
!2017 = !DILocation(line: 1541, column: 6, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !2019, file: !69, line: 1541, column: 6)
!2019 = distinct !DILexicalBlock(scope: !2005, file: !69, line: 1540, column: 2)
!2020 = !DILocation(line: 1541, column: 16, scope: !2018)
!2021 = !DILocation(line: 1541, column: 6, scope: !2019)
!2022 = !DILocation(line: 1543, column: 23, scope: !2023)
!2023 = distinct !DILexicalBlock(scope: !2018, file: !69, line: 1542, column: 3)
!2024 = !DILocation(line: 1543, column: 22, scope: !2023)
!2025 = !DILocation(line: 1543, column: 20, scope: !2023)
!2026 = !DILocation(line: 1544, column: 16, scope: !2023)
!2027 = !DILocation(line: 1544, column: 32, scope: !2023)
!2028 = !DILocation(line: 1544, column: 31, scope: !2023)
!2029 = !DILocation(line: 1544, column: 13, scope: !2023)
!2030 = !DILocation(line: 1545, column: 15, scope: !2023)
!2031 = !DILocation(line: 1545, column: 34, scope: !2023)
!2032 = !DILocation(line: 1545, column: 45, scope: !2023)
!2033 = !DILocation(line: 1545, column: 43, scope: !2023)
!2034 = !DILocation(line: 1545, column: 31, scope: !2023)
!2035 = !DILocation(line: 1545, column: 13, scope: !2023)
!2036 = !DILocation(line: 1547, column: 8, scope: !2037)
!2037 = distinct !DILexicalBlock(scope: !2023, file: !69, line: 1547, column: 7)
!2038 = !DILocation(line: 1547, column: 20, scope: !2037)
!2039 = !DILocation(line: 1547, column: 27, scope: !2037)
!2040 = !DILocation(line: 1547, column: 7, scope: !2023)
!2041 = !DILocation(line: 1549, column: 19, scope: !2042)
!2042 = distinct !DILexicalBlock(scope: !2037, file: !69, line: 1548, column: 4)
!2043 = !DILocation(line: 1549, column: 31, scope: !2042)
!2044 = !DILocation(line: 1549, column: 17, scope: !2042)
!2045 = !DILocation(line: 1550, column: 4, scope: !2042)
!2046 = !DILocation(line: 1553, column: 20, scope: !2047)
!2047 = distinct !DILexicalBlock(scope: !2037, file: !69, line: 1552, column: 4)
!2048 = !DILocation(line: 1553, column: 32, scope: !2047)
!2049 = !DILocation(line: 1553, column: 38, scope: !2047)
!2050 = !DILocation(line: 1553, column: 17, scope: !2047)
!2051 = !DILocation(line: 1556, column: 7, scope: !2052)
!2052 = distinct !DILexicalBlock(scope: !2023, file: !69, line: 1556, column: 7)
!2053 = !DILocation(line: 1556, column: 18, scope: !2052)
!2054 = !DILocation(line: 1556, column: 16, scope: !2052)
!2055 = !DILocation(line: 1556, column: 7, scope: !2023)
!2056 = !DILocation(line: 1558, column: 18, scope: !2057)
!2057 = distinct !DILexicalBlock(scope: !2052, file: !69, line: 1557, column: 4)
!2058 = !DILocation(line: 1558, column: 16, scope: !2057)
!2059 = !DILocation(line: 1558, column: 28, scope: !2057)
!2060 = !DILocation(line: 1558, column: 14, scope: !2057)
!2061 = !DILocation(line: 1559, column: 4, scope: !2057)
!2062 = !DILocation(line: 1562, column: 18, scope: !2063)
!2063 = distinct !DILexicalBlock(scope: !2052, file: !69, line: 1561, column: 4)
!2064 = !DILocation(line: 1562, column: 26, scope: !2063)
!2065 = !DILocation(line: 1562, column: 16, scope: !2063)
!2066 = !DILocation(line: 1562, column: 30, scope: !2063)
!2067 = !DILocation(line: 1562, column: 14, scope: !2063)
!2068 = !DILocation(line: 1564, column: 8, scope: !2069)
!2069 = distinct !DILexicalBlock(scope: !2023, file: !69, line: 1564, column: 7)
!2070 = !DILocation(line: 1564, column: 18, scope: !2069)
!2071 = !DILocation(line: 1564, column: 7, scope: !2023)
!2072 = !DILocation(line: 1566, column: 18, scope: !2073)
!2073 = distinct !DILexicalBlock(scope: !2069, file: !69, line: 1565, column: 4)
!2074 = !DILocation(line: 1566, column: 12, scope: !2073)
!2075 = !DILocation(line: 1566, column: 5, scope: !2073)
!2076 = !DILocation(line: 1570, column: 5, scope: !2077)
!2077 = distinct !DILexicalBlock(scope: !2069, file: !69, line: 1569, column: 4)
!2078 = !DILocation(line: 1575, column: 16, scope: !2079)
!2079 = distinct !DILexicalBlock(scope: !2018, file: !69, line: 1574, column: 3)
!2080 = !DILocation(line: 1575, column: 26, scope: !2079)
!2081 = !DILocation(line: 1575, column: 25, scope: !2079)
!2082 = !DILocation(line: 1575, column: 41, scope: !2079)
!2083 = !DILocation(line: 1575, column: 39, scope: !2079)
!2084 = !DILocation(line: 1575, column: 13, scope: !2079)
!2085 = !DILocation(line: 1576, column: 16, scope: !2079)
!2086 = !DILocation(line: 1576, column: 30, scope: !2079)
!2087 = !DILocation(line: 1576, column: 40, scope: !2079)
!2088 = !DILocation(line: 1576, column: 39, scope: !2079)
!2089 = !DILocation(line: 1576, column: 55, scope: !2079)
!2090 = !DILocation(line: 1576, column: 53, scope: !2079)
!2091 = !DILocation(line: 1576, column: 26, scope: !2079)
!2092 = !DILocation(line: 1576, column: 68, scope: !2079)
!2093 = !DILocation(line: 1576, column: 13, scope: !2079)
!2094 = !DILocation(line: 1577, column: 16, scope: !2079)
!2095 = !DILocation(line: 1577, column: 25, scope: !2079)
!2096 = !DILocation(line: 1577, column: 24, scope: !2079)
!2097 = !DILocation(line: 1577, column: 41, scope: !2079)
!2098 = !DILocation(line: 1577, column: 51, scope: !2079)
!2099 = !DILocation(line: 1577, column: 50, scope: !2079)
!2100 = !DILocation(line: 1577, column: 38, scope: !2079)
!2101 = !DILocation(line: 1577, column: 13, scope: !2079)
!2102 = !DILocation(line: 1578, column: 7, scope: !2103)
!2103 = distinct !DILexicalBlock(scope: !2079, file: !69, line: 1578, column: 7)
!2104 = !DILocation(line: 1578, column: 16, scope: !2103)
!2105 = !DILocation(line: 1578, column: 7, scope: !2079)
!2106 = !DILocation(line: 1580, column: 17, scope: !2107)
!2107 = distinct !DILexicalBlock(scope: !2103, file: !69, line: 1579, column: 4)
!2108 = !DILocation(line: 1580, column: 12, scope: !2107)
!2109 = !DILocation(line: 1580, column: 5, scope: !2107)
!2110 = !DILocation(line: 1584, column: 5, scope: !2111)
!2111 = distinct !DILexicalBlock(scope: !2103, file: !69, line: 1583, column: 4)
!2112 = !DILocation(line: 1588, column: 1, scope: !1983)
!2113 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2114, file: !2114, line: 12, type: !2115, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2118)
!2114 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2115 = !DISubroutineType(types: !2116)
!2116 = !{null, !2117}
!2117 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2118 = !{!2119}
!2119 = !DILocalVariable(name: "z", arg: 1, scope: !2113, file: !2114, line: 12, type: !2117)
!2120 = !DILocation(line: 0, scope: !2113)
!2121 = !DILocation(line: 13, column: 9, scope: !2122)
!2122 = distinct !DILexicalBlock(scope: !2113, file: !2114, line: 13, column: 7)
!2123 = !DILocation(line: 13, column: 7, scope: !2113)
!2124 = !DILocation(line: 14, column: 5, scope: !2122)
!2125 = !DILocation(line: 15, column: 1, scope: !2113)
!2126 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2127, file: !2127, line: 20, type: !2128, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2131)
!2127 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2128 = !DISubroutineType(types: !2129)
!2129 = !{null, !2130, !2130}
!2130 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2131 = !{!2132, !2133}
!2132 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2126, file: !2127, line: 20, type: !2130)
!2133 = !DILocalVariable(name: "shift", arg: 2, scope: !2126, file: !2127, line: 20, type: !2130)
!2134 = !DILocation(line: 0, scope: !2126)
!2135 = !DILocation(line: 21, column: 13, scope: !2136)
!2136 = distinct !DILexicalBlock(scope: !2126, file: !2127, line: 21, column: 7)
!2137 = !DILocation(line: 21, column: 7, scope: !2126)
!2138 = !DILocation(line: 27, column: 5, scope: !2139)
!2139 = distinct !DILexicalBlock(scope: !2136, file: !2127, line: 21, column: 26)
!2140 = !DILocation(line: 29, column: 1, scope: !2126)
