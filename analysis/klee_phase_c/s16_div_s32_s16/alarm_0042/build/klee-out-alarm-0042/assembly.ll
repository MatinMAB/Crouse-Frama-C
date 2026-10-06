; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0042/build/s16_div_s32_s16_alarm_0042.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [103 x i8] c"KLEE-ALARM-0042: signed overflow. assert s32Temp1 + (s32)(numerator / (s32)denominator) <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0042.err\00", align 1
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
  br i1 %cmp92, label %if.then94, label %if.else190, !dbg !359

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
  %46 = load i32, i32* %s32Temp1, align 4, !dbg !385
  %47 = load i16, i16* %denominator.addr, align 2, !dbg !386
  %conv110 = sext i16 %47 to i32, !dbg !387
  %int_cast_to_i6410 = zext i32 %conv110 to i64, !dbg !388
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !388
  %div111 = sdiv i32 %46, %conv110, !dbg !388, !klee.check.div !106
  %48 = load i16, i16* %denominator.addr, align 2, !dbg !389
  %conv112 = sext i16 %48 to i32, !dbg !390
  %mul113 = mul nsw i32 %div111, %conv112, !dbg !391
  %sub114 = sub nsw i32 %45, %mul113, !dbg !392
  %conv115 = sext i32 %sub114 to i64, !dbg !393
  %call116 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv115, i32 1), !dbg !394
  %tobool117 = icmp ne i32 %call116, 0, !dbg !394
  br i1 %tobool117, label %if.end119, label %if.then118, !dbg !395

if.then118:                                       ; preds = %if.end109
  store i16 0, i16* %retval, align 2, !dbg !396
  br label %return, !dbg !396

if.end119:                                        ; preds = %if.end109
  %49 = load i32, i32* %s32Temp1, align 4, !dbg !398
  %50 = load i16, i16* %denominator.addr, align 2, !dbg !400
  %conv120 = sext i16 %50 to i32, !dbg !401
  %int_cast_to_i6411 = zext i32 %conv120 to i64, !dbg !402
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !402
  %div121 = sdiv i32 %49, %conv120, !dbg !402, !klee.check.div !106
  %conv122 = sext i32 %div121 to i64, !dbg !403
  %51 = load i16, i16* %denominator.addr, align 2, !dbg !404
  %conv123 = sext i16 %51 to i32, !dbg !405
  %conv124 = sext i32 %conv123 to i64, !dbg !406
  %call125 = call i32 @klee_alarm_s32_mul_upper(i64 %conv122, i64 %conv124), !dbg !407
  %tobool126 = icmp ne i32 %call125, 0, !dbg !407
  br i1 %tobool126, label %if.end128, label %if.then127, !dbg !408

if.then127:                                       ; preds = %if.end119
  store i16 0, i16* %retval, align 2, !dbg !409
  br label %return, !dbg !409

if.end128:                                        ; preds = %if.end119
  %52 = load i32, i32* %s32Temp1, align 4, !dbg !411
  %53 = load i16, i16* %denominator.addr, align 2, !dbg !413
  %conv129 = sext i16 %53 to i32, !dbg !414
  %int_cast_to_i6412 = zext i32 %conv129 to i64, !dbg !415
  call void @klee_div_zero_check(i64 %int_cast_to_i6412), !dbg !415
  %div130 = sdiv i32 %52, %conv129, !dbg !415, !klee.check.div !106
  %conv131 = sext i32 %div130 to i64, !dbg !416
  %54 = load i16, i16* %denominator.addr, align 2, !dbg !417
  %conv132 = sext i16 %54 to i32, !dbg !418
  %conv133 = sext i32 %conv132 to i64, !dbg !419
  %call134 = call i32 @klee_alarm_s32_mul_lower(i64 %conv131, i64 %conv133), !dbg !420
  %tobool135 = icmp ne i32 %call134, 0, !dbg !420
  br i1 %tobool135, label %if.end137, label %if.then136, !dbg !421

if.then136:                                       ; preds = %if.end128
  store i16 0, i16* %retval, align 2, !dbg !422
  br label %return, !dbg !422

if.end137:                                        ; preds = %if.end128
  %55 = load i32, i32* %s32Temp1, align 4, !dbg !424
  %conv138 = sext i32 %55 to i64, !dbg !426
  %56 = load i16, i16* %denominator.addr, align 2, !dbg !427
  %conv139 = sext i16 %56 to i32, !dbg !428
  %conv140 = sext i32 %conv139 to i64, !dbg !429
  %call141 = call i32 @klee_alarm_s32_div_representable(i64 %conv138, i64 %conv140), !dbg !430
  %tobool142 = icmp ne i32 %call141, 0, !dbg !430
  br i1 %tobool142, label %if.end144, label %if.then143, !dbg !431

if.then143:                                       ; preds = %if.end137
  store i16 0, i16* %retval, align 2, !dbg !432
  br label %return, !dbg !432

if.end144:                                        ; preds = %if.end137
  %57 = load i32, i32* %s32Temp1, align 4, !dbg !434
  %58 = load i32, i32* %s32Temp1, align 4, !dbg !435
  %59 = load i16, i16* %denominator.addr, align 2, !dbg !436
  %conv145 = sext i16 %59 to i32, !dbg !436
  %int_cast_to_i6413 = zext i32 %conv145 to i64, !dbg !437
  call void @klee_div_zero_check(i64 %int_cast_to_i6413), !dbg !437
  %div146 = sdiv i32 %58, %conv145, !dbg !437, !klee.check.div !106
  %60 = load i16, i16* %denominator.addr, align 2, !dbg !438
  %conv147 = sext i16 %60 to i32, !dbg !438
  %mul148 = mul nsw i32 %div146, %conv147, !dbg !439
  %sub149 = sub nsw i32 %57, %mul148, !dbg !440
  %shl150 = shl i32 %sub149, 1, !dbg !441
  store i32 %shl150, i32* %s32Temp2, align 4, !dbg !442
  %61 = load i16, i16* %denominator.addr, align 2, !dbg !443
  %conv151 = sext i16 %61 to i64, !dbg !445
  %call152 = call i32 @klee_alarm_divisor_nonzero(i64 %conv151), !dbg !446
  %tobool153 = icmp ne i32 %call152, 0, !dbg !446
  br i1 %tobool153, label %if.end155, label %if.then154, !dbg !447

if.then154:                                       ; preds = %if.end144
  store i16 0, i16* %retval, align 2, !dbg !448
  br label %return, !dbg !448

if.end155:                                        ; preds = %if.end144
  %62 = load i32, i32* %s32Temp2, align 4, !dbg !450
  %63 = load i16, i16* %denominator.addr, align 2, !dbg !451
  %conv156 = sext i16 %63 to i32, !dbg !451
  %int_cast_to_i6414 = zext i32 %conv156 to i64, !dbg !452
  call void @klee_div_zero_check(i64 %int_cast_to_i6414), !dbg !452
  %div157 = sdiv i32 %62, %conv156, !dbg !452, !klee.check.div !106
  store i32 %div157, i32* %s32Temp1, align 4, !dbg !453
  %64 = load i16, i16* %denominator.addr, align 2, !dbg !454
  %conv158 = sext i16 %64 to i64, !dbg !456
  %call159 = call i32 @klee_alarm_divisor_nonzero(i64 %conv158), !dbg !457
  %tobool160 = icmp ne i32 %call159, 0, !dbg !457
  br i1 %tobool160, label %if.end162, label %if.then161, !dbg !458

if.then161:                                       ; preds = %if.end155
  store i16 0, i16* %retval, align 2, !dbg !459
  br label %return, !dbg !459

if.end162:                                        ; preds = %if.end155
  %65 = load i32, i32* %s32Temp1, align 4, !dbg !461
  %conv163 = sext i32 %65 to i64, !dbg !463
  %66 = load i32, i32* %numerator.addr, align 4, !dbg !464
  %67 = load i16, i16* %denominator.addr, align 2, !dbg !465
  %conv164 = sext i16 %67 to i32, !dbg !466
  %int_cast_to_i6415 = zext i32 %conv164 to i64, !dbg !467
  call void @klee_div_zero_check(i64 %int_cast_to_i6415), !dbg !467
  %div165 = sdiv i32 %66, %conv164, !dbg !467, !klee.check.div !106
  %conv166 = sext i32 %div165 to i64, !dbg !468
  %call167 = call i32 @klee_alarm_s32_add_lower(i64 %conv163, i64 %conv166), !dbg !469
  %tobool168 = icmp ne i32 %call167, 0, !dbg !469
  br i1 %tobool168, label %if.end170, label %if.then169, !dbg !470

if.then169:                                       ; preds = %if.end162
  store i16 0, i16* %retval, align 2, !dbg !471
  br label %return, !dbg !471

if.end170:                                        ; preds = %if.end162
  %68 = load i32, i32* %numerator.addr, align 4, !dbg !473
  %conv171 = sext i32 %68 to i64, !dbg !475
  %69 = load i16, i16* %denominator.addr, align 2, !dbg !476
  %conv172 = sext i16 %69 to i32, !dbg !477
  %conv173 = sext i32 %conv172 to i64, !dbg !478
  %call174 = call i32 @klee_alarm_s32_div_representable(i64 %conv171, i64 %conv173), !dbg !479
  %tobool175 = icmp ne i32 %call174, 0, !dbg !479
  br i1 %tobool175, label %if.end177, label %if.then176, !dbg !480

if.then176:                                       ; preds = %if.end170
  store i16 0, i16* %retval, align 2, !dbg !481
  br label %return, !dbg !481

if.end177:                                        ; preds = %if.end170
  %70 = load i32, i32* %s32Temp1, align 4, !dbg !483
  %conv178 = sext i32 %70 to i64, !dbg !485
  %71 = load i32, i32* %numerator.addr, align 4, !dbg !486
  %72 = load i16, i16* %denominator.addr, align 2, !dbg !487
  %conv179 = sext i16 %72 to i32, !dbg !488
  %int_cast_to_i6416 = zext i32 %conv179 to i64, !dbg !489
  call void @klee_div_zero_check(i64 %int_cast_to_i6416), !dbg !489
  %div180 = sdiv i32 %71, %conv179, !dbg !489, !klee.check.div !106
  %conv181 = sext i32 %div180 to i64, !dbg !490
  %call182 = call i32 @klee_alarm_s32_add_upper(i64 %conv178, i64 %conv181), !dbg !491
  %tobool183 = icmp ne i32 %call182, 0, !dbg !491
  br i1 %tobool183, label %if.end185, label %if.then184, !dbg !492

if.then184:                                       ; preds = %if.end177
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 379, i8* getelementptr inbounds ([103 x i8], [103 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !493
  unreachable, !dbg !493

if.end185:                                        ; preds = %if.end177
  %73 = load i32, i32* %s32Temp1, align 4, !dbg !495
  %74 = load i32, i32* %numerator.addr, align 4, !dbg !496
  %75 = load i16, i16* %denominator.addr, align 2, !dbg !497
  %conv186 = sext i16 %75 to i32, !dbg !498
  %int_cast_to_i6417 = zext i32 %conv186 to i64, !dbg !499
  call void @klee_div_zero_check(i64 %int_cast_to_i6417), !dbg !499
  %div187 = sdiv i32 %74, %conv186, !dbg !499, !klee.check.div !106
  %add188 = add nsw i32 %73, %div187, !dbg !500
  %conv189 = sext i32 %add188 to i64, !dbg !501
  store volatile i64 %conv189, i64* @klee_alarm_sink_s64, align 8, !dbg !502
  store i16 0, i16* %retval, align 2, !dbg !503
  br label %return, !dbg !503

if.else190:                                       ; preds = %if.else90
  store i16 32767, i16* %retval, align 2, !dbg !504
  br label %return, !dbg !504

return:                                           ; preds = %if.else190, %if.end185, %if.then176, %if.then169, %if.then161, %if.then154, %if.then143, %if.then136, %if.then127, %if.then118, %if.then108, %if.then98, %if.else89, %if.else88, %if.then86, %if.then77, %if.then69, %if.then61, %if.then54, %if.then44, %if.then35, %if.then26, %if.then16, %if.then10, %if.else, %if.then4
  %76 = load i16, i16* %retval, align 2, !dbg !506
  ret i16 %76, !dbg !506
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !507 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !510, metadata !DIExpression()), !dbg !511
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !512
  %cmp = icmp ne i64 %0, 0, !dbg !513
  %conv = zext i1 %cmp to i32, !dbg !513
  ret i32 %conv, !dbg !514
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !515 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !516, metadata !DIExpression()), !dbg !517
  %0 = load i64, i64* %left.addr, align 8, !dbg !518
  %cmp = icmp sge i64 %0, 0, !dbg !519
  %conv = zext i1 %cmp to i32, !dbg !519
  ret i32 %conv, !dbg !520
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !521 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !524, metadata !DIExpression()), !dbg !525
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !526, metadata !DIExpression()), !dbg !527
  %0 = load i32, i32* %count.addr, align 4, !dbg !528
  %cmp = icmp uge i32 %0, 63, !dbg !530
  br i1 %cmp, label %if.then, label %if.end, !dbg !531

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !532
  br label %return, !dbg !532

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !534
  %2 = load i32, i32* %count.addr, align 4, !dbg !535
  %sh_prom = zext i32 %2 to i64, !dbg !536
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !536
  %shl = shl i64 1, %sh_prom, !dbg !536, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !537
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !538
  %conv = zext i1 %cmp1 to i32, !dbg !538
  store i32 %conv, i32* %retval, align 4, !dbg !539
  br label %return, !dbg !539

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !540
  ret i32 %3, !dbg !540
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !541 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !544, metadata !DIExpression()), !dbg !545
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !546, metadata !DIExpression()), !dbg !547
  %0 = load i64, i64* %left.addr, align 8, !dbg !548
  %1 = load i64, i64* %right.addr, align 8, !dbg !549
  %mul = mul nsw i64 %0, %1, !dbg !550
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !551
  %conv = zext i1 %cmp to i32, !dbg !551
  ret i32 %conv, !dbg !552
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !553 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !554, metadata !DIExpression()), !dbg !555
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !556, metadata !DIExpression()), !dbg !557
  %0 = load i64, i64* %left.addr, align 8, !dbg !558
  %1 = load i64, i64* %right.addr, align 8, !dbg !559
  %mul = mul nsw i64 %0, %1, !dbg !560
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !561
  %conv = zext i1 %cmp to i32, !dbg !561
  ret i32 %conv, !dbg !562
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_lower(i64 %left, i64 %right) #0 !dbg !563 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !564, metadata !DIExpression()), !dbg !565
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !566, metadata !DIExpression()), !dbg !567
  %0 = load i64, i64* %left.addr, align 8, !dbg !568
  %1 = load i64, i64* %right.addr, align 8, !dbg !569
  %add = add nsw i64 %0, %1, !dbg !570
  %cmp = icmp sge i64 %add, -2147483648, !dbg !571
  %conv = zext i1 %cmp to i32, !dbg !571
  ret i32 %conv, !dbg !572
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !573 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !574, metadata !DIExpression()), !dbg !575
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !576, metadata !DIExpression()), !dbg !577
  %0 = load i64, i64* %left.addr, align 8, !dbg !578
  %1 = load i64, i64* %right.addr, align 8, !dbg !579
  %add = add nsw i64 %0, %1, !dbg !580
  %cmp = icmp sle i64 %add, 2147483647, !dbg !581
  %conv = zext i1 %cmp to i32, !dbg !581
  ret i32 %conv, !dbg !582
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_div_representable(i64 %numerator, i64 %denominator) #0 !dbg !583 {
entry:
  %numerator.addr = alloca i64, align 8
  %denominator.addr = alloca i64, align 8
  store i64 %numerator, i64* %numerator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %numerator.addr, metadata !584, metadata !DIExpression()), !dbg !585
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !586, metadata !DIExpression()), !dbg !587
  %0 = load i64, i64* %numerator.addr, align 8, !dbg !588
  %cmp = icmp eq i64 %0, -2147483648, !dbg !589
  %1 = load i64, i64* %denominator.addr, align 8, !dbg !590
  %cmp1 = icmp eq i64 %1, -1, !dbg !590
  %2 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !590
  %lnot = xor i1 %2, true, !dbg !591
  %lnot.ext = zext i1 %lnot to i32, !dbg !591
  ret i32 %lnot.ext, !dbg !592
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !593 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !596, metadata !DIExpression()), !dbg !597
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !598, metadata !DIExpression()), !dbg !599
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !600, metadata !DIExpression()), !dbg !601
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !602, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !604, metadata !DIExpression()), !dbg !605
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !606
  %conv = zext i16 %0 to i32, !dbg !606
  %and = and i32 %conv, 65535, !dbg !607
  %conv1 = trunc i32 %and to i16, !dbg !606
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !608
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !609
  %conv2 = sext i16 %1 to i32, !dbg !609
  %shl = shl i32 %conv2, 16, !dbg !610
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !611
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !612
  %conv3 = zext i16 %2 to i32, !dbg !612
  %cmp = icmp eq i32 %conv3, 0, !dbg !614
  br i1 %cmp, label %if.then, label %if.else9, !dbg !615

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !616
  %conv5 = sext i16 %3 to i32, !dbg !616
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !619
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !620

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !621
  br label %return, !dbg !621

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !623
  br label %return, !dbg !623

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !625
  %conv10 = sext i16 %4 to i32, !dbg !625
  %shl11 = shl i32 %conv10, 16, !dbg !627
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !628
  %conv12 = sext i16 %5 to i32, !dbg !628
  %shl13 = shl i32 %conv12, 16, !dbg !629
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !630
  %conv14 = zext i16 %6 to i32, !dbg !630
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !631
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !631
  %div = sdiv i32 %shl13, %conv14, !dbg !631, !klee.check.div !106
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !632
  %conv15 = zext i16 %7 to i32, !dbg !632
  %mul = mul nsw i32 %div, %conv15, !dbg !633
  %sub = sub nsw i32 %shl11, %mul, !dbg !634
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !635
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !636
  %shl16 = shl i32 %8, 1, !dbg !637
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !638
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !639
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !640
  %conv17 = zext i16 %10 to i32, !dbg !640
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !641
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !641
  %div18 = sdiv i32 %9, %conv17, !dbg !641, !klee.check.div !106
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !642
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !643
  %conv19 = sext i16 %11 to i32, !dbg !643
  %shl20 = shl i32 %conv19, 16, !dbg !644
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !645
  %conv21 = zext i16 %12 to i32, !dbg !645
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !646
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !646
  %div22 = sdiv i32 %shl20, %conv21, !dbg !646, !klee.check.div !106
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !647
  %add = add nsw i32 %div22, %13, !dbg !648
  store i32 %add, i32* %s32Temp1, align 4, !dbg !649
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !650
  %cmp23 = icmp slt i32 %14, 32767, !dbg !652
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !653

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !654
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !657
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !658

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !659
  %conv29 = trunc i32 %16 to i16, !dbg !661
  store i16 %conv29, i16* %retval, align 2, !dbg !662
  br label %return, !dbg !662

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !663
  br label %return, !dbg !663

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !665
  br label %return, !dbg !665

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !667
  ret i16 %17, !dbg !667
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !668 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !669, metadata !DIExpression()), !dbg !670
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !671, metadata !DIExpression()), !dbg !672
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !673, metadata !DIExpression()), !dbg !674
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !675, metadata !DIExpression()), !dbg !676
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !677
  %conv = zext i16 %0 to i32, !dbg !677
  %and = and i32 %conv, 65535, !dbg !678
  %conv1 = trunc i32 %and to i16, !dbg !677
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !679
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !680
  %conv2 = zext i16 %1 to i32, !dbg !680
  %cmp = icmp eq i32 %conv2, 0, !dbg !682
  br i1 %cmp, label %if.then, label %if.else8, !dbg !683

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !684
  %conv4 = sext i16 %2 to i32, !dbg !684
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !687
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !688

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !689
  br label %return, !dbg !689

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !691
  br label %return, !dbg !691

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !693
  %conv9 = sext i16 %3 to i32, !dbg !693
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !695
  %conv10 = sext i16 %4 to i32, !dbg !695
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !696
  %conv11 = zext i16 %5 to i32, !dbg !696
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !697
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !697
  %div = sdiv i32 %conv10, %conv11, !dbg !697, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !698
  %conv12 = zext i16 %6 to i32, !dbg !698
  %mul = mul nsw i32 %div, %conv12, !dbg !699
  %sub = sub nsw i32 %conv9, %mul, !dbg !700
  %shl = shl i32 %sub, 1, !dbg !701
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !702
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !703
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !704
  %conv13 = zext i16 %8 to i32, !dbg !704
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !705
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !705
  %div14 = sdiv i32 %7, %conv13, !dbg !705, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !706
  %conv15 = sext i16 %9 to i32, !dbg !706
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !707
  %conv16 = zext i16 %10 to i32, !dbg !707
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !708
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !708
  %div17 = sdiv i32 %conv15, %conv16, !dbg !708, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !709
  store i32 %add, i32* %s32Temp1, align 4, !dbg !710
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !711
  %conv18 = trunc i32 %11 to i16, !dbg !711
  store i16 %conv18, i16* %retval, align 2, !dbg !712
  br label %return, !dbg !712

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !713
  ret i16 %12, !dbg !713
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !714 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !717, metadata !DIExpression()), !dbg !718
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !719, metadata !DIExpression()), !dbg !720
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !721, metadata !DIExpression()), !dbg !723
  store i32 0, i32* %u32Temp1, align 4, !dbg !723
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !724, metadata !DIExpression()), !dbg !725
  store i32 0, i32* %u32Temp2, align 4, !dbg !725
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !726, metadata !DIExpression()), !dbg !727
  store i32 0, i32* %u32Temp3, align 4, !dbg !727
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !728
  %conv = zext i16 %0 to i32, !dbg !728
  %cmp = icmp eq i32 %conv, 0, !dbg !730
  br i1 %cmp, label %if.then, label %if.else, !dbg !731

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !732
  br label %return, !dbg !732

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !734
  %conv2 = zext i16 %1 to i32, !dbg !734
  %shl = shl i32 %conv2, 16, !dbg !736
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !737
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !738
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !739
  %conv3 = zext i16 %3 to i32, !dbg !739
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !740
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !740
  %div = udiv i32 %2, %conv3, !dbg !740, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !741
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !742
  %add = add i32 %4, 128, !dbg !743
  %shr = lshr i32 %add, 8, !dbg !744
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !745
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !746
  %cmp4 = icmp ult i32 %5, 255, !dbg !748
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !749

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !750
  %conv7 = trunc i32 %6 to i8, !dbg !752
  store i8 %conv7, i8* %retval, align 1, !dbg !753
  br label %return, !dbg !753

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !754
  br label %return, !dbg !754

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !756
  ret i8 %7, !dbg !756
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !757 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !760, metadata !DIExpression()), !dbg !761
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !762, metadata !DIExpression()), !dbg !763
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !764, metadata !DIExpression()), !dbg !765
  store i32 0, i32* %s32Temp1, align 4, !dbg !765
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !766
  %conv = zext i16 %0 to i32, !dbg !766
  %and = and i32 %conv, 65535, !dbg !767
  %conv1 = trunc i32 %and to i16, !dbg !766
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !768
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !769
  %conv2 = zext i16 %1 to i32, !dbg !769
  %and3 = and i32 %conv2, 65535, !dbg !771
  %cmp = icmp eq i32 %and3, 0, !dbg !772
  br i1 %cmp, label %if.then, label %if.else8, !dbg !773

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !774
  %cmp5 = icmp sge i32 %2, 0, !dbg !777
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !778

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !779
  br label %return, !dbg !779

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !781
  br label %return, !dbg !781

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !783
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !785
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !786
  %conv9 = zext i16 %5 to i32, !dbg !786
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !787
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !787
  %div = sdiv i32 %4, %conv9, !dbg !787, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !788
  %conv10 = zext i16 %6 to i32, !dbg !788
  %mul = mul nsw i32 %div, %conv10, !dbg !789
  %sub = sub nsw i32 %3, %mul, !dbg !790
  %shl = shl i32 %sub, 1, !dbg !791
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !792
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !793
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !794
  %conv11 = zext i16 %8 to i32, !dbg !794
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !795
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !795
  %div12 = sdiv i32 %7, %conv11, !dbg !795, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !796
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !797
  %conv13 = zext i16 %10 to i32, !dbg !797
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !798
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !798
  %div14 = sdiv i32 %9, %conv13, !dbg !798, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !799
  store i32 %add, i32* %s32Temp1, align 4, !dbg !800
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !801
  %cmp15 = icmp slt i32 %11, 65535, !dbg !803
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !804

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !805
  %cmp18 = icmp sgt i32 %12, 0, !dbg !808
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !809

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !810
  %conv21 = trunc i32 %13 to i16, !dbg !812
  store i16 %conv21, i16* %retval, align 2, !dbg !813
  br label %return, !dbg !813

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !814
  br label %return, !dbg !814

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !816
  br label %return, !dbg !816

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !818
  ret i16 %14, !dbg !818
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !819 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !822, metadata !DIExpression()), !dbg !823
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !824, metadata !DIExpression()), !dbg !825
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !826, metadata !DIExpression()), !dbg !827
  store i32 0, i32* %u32Temp, align 4, !dbg !827
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !828
  %conv = zext i16 %0 to i32, !dbg !828
  %cmp = icmp eq i32 %conv, 0, !dbg !830
  br i1 %cmp, label %if.then, label %if.else, !dbg !831

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !832
  br label %return, !dbg !832

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !834
  %conv2 = zext i16 %1 to i32, !dbg !834
  %shl = shl i32 %conv2, 16, !dbg !836
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !837
  %conv3 = zext i16 %2 to i32, !dbg !837
  %shr = ashr i32 %conv3, 1, !dbg !838
  %add = add nsw i32 %shl, %shr, !dbg !839
  store i32 %add, i32* %u32Temp, align 4, !dbg !840
  %3 = load i32, i32* %u32Temp, align 4, !dbg !841
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !842
  %conv4 = zext i16 %4 to i32, !dbg !842
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !843
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !843
  %div = udiv i32 %3, %conv4, !dbg !843, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !844
  %5 = load i32, i32* %u32Temp, align 4, !dbg !845
  %cmp5 = icmp ult i32 %5, 65535, !dbg !847
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !848

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !849
  %and = and i32 %6, 65535, !dbg !851
  %conv8 = trunc i32 %and to i16, !dbg !849
  store i16 %conv8, i16* %retval, align 2, !dbg !852
  br label %return, !dbg !852

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !853
  br label %return, !dbg !853

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !855
  ret i16 %7, !dbg !855
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !856 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !859, metadata !DIExpression()), !dbg !860
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !861, metadata !DIExpression()), !dbg !862
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !863, metadata !DIExpression()), !dbg !864
  store i32 0, i32* %u32Temp1, align 4, !dbg !864
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !865, metadata !DIExpression()), !dbg !866
  store i32 0, i32* %u32Temp2, align 4, !dbg !866
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !867
  %conv = zext i16 %0 to i32, !dbg !867
  %and = and i32 %conv, 65535, !dbg !868
  %conv1 = trunc i32 %and to i16, !dbg !867
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !869
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !870
  %conv2 = zext i16 %1 to i32, !dbg !870
  %cmp = icmp eq i32 %conv2, 0, !dbg !872
  br i1 %cmp, label %if.then, label %if.else, !dbg !873

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !874
  br label %return, !dbg !874

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !876
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !878
  %conv4 = zext i16 %3 to i32, !dbg !878
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !879
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !879
  %div = udiv i32 %2, %conv4, !dbg !879, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !880
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !881
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !882
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !883
  %conv5 = zext i16 %6 to i32, !dbg !883
  %mul = mul i32 %5, %conv5, !dbg !884
  %sub = sub i32 %4, %mul, !dbg !885
  %shl = shl i32 %sub, 1, !dbg !886
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !887
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !888
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !889
  %conv6 = zext i16 %8 to i32, !dbg !889
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !890
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !890
  %div7 = udiv i32 %7, %conv6, !dbg !890, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !891
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !892
  %conv8 = zext i16 %10 to i32, !dbg !892
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !893
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !893
  %div9 = udiv i32 %9, %conv8, !dbg !893, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !894
  store i32 %add, i32* %u32Temp2, align 4, !dbg !895
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !896
  %cmp10 = icmp ult i32 %11, 65535, !dbg !898
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !899

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !900
  %and13 = and i32 %12, 65535, !dbg !902
  %conv14 = trunc i32 %and13 to i16, !dbg !900
  store i16 %conv14, i16* %retval, align 2, !dbg !903
  br label %return, !dbg !903

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !904
  br label %return, !dbg !904

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !906
  ret i16 %13, !dbg !906
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !907 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !910, metadata !DIExpression()), !dbg !911
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !912, metadata !DIExpression()), !dbg !913
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !914, metadata !DIExpression()), !dbg !915
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !916, metadata !DIExpression()), !dbg !917
  store i32 0, i32* %s32Result, align 4, !dbg !917
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !918, metadata !DIExpression()), !dbg !919
  store i32 0, i32* %s32Temp1, align 4, !dbg !919
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !920
  %conv = sext i16 %0 to i32, !dbg !920
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !921
  %conv1 = zext i16 %1 to i32, !dbg !921
  %mul = mul nsw i32 %conv, %conv1, !dbg !922
  store i32 %mul, i32* %s32Result, align 4, !dbg !923
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !924
  %conv2 = sext i16 %2 to i32, !dbg !924
  %cmp = icmp eq i32 %conv2, 0, !dbg !926
  br i1 %cmp, label %if.then, label %if.else7, !dbg !927

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !928
  %cmp4 = icmp slt i32 %3, 0, !dbg !931
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !932

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !933
  br label %return, !dbg !933

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !935
  br label %return, !dbg !935

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !937
  %5 = load i32, i32* %s32Result, align 4, !dbg !939
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !940
  %conv8 = sext i16 %6 to i32, !dbg !940
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !941
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !941
  %div = sdiv i32 %5, %conv8, !dbg !941, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !942
  %conv9 = sext i16 %7 to i32, !dbg !942
  %mul10 = mul nsw i32 %div, %conv9, !dbg !943
  %sub = sub nsw i32 %4, %mul10, !dbg !944
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !945
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !946
  %shl = shl i32 %8, 1, !dbg !947
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !948
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !949
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !950
  %conv11 = sext i16 %10 to i32, !dbg !950
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !951
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !951
  %div12 = sdiv i32 %9, %conv11, !dbg !951, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !952
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !953
  %conv13 = sext i16 %12 to i32, !dbg !953
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !954
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !954
  %div14 = sdiv i32 %11, %conv13, !dbg !954, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !955
  store i32 %add, i32* %s32Result, align 4, !dbg !956
  %13 = load i32, i32* %s32Result, align 4, !dbg !957
  %cmp15 = icmp slt i32 %13, 32767, !dbg !959
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !960

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !961
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !964
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !965

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !966
  %conv21 = trunc i32 %15 to i16, !dbg !968
  store i16 %conv21, i16* %retval, align 2, !dbg !969
  br label %return, !dbg !969

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !970
  br label %return, !dbg !970

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !972
  br label %return, !dbg !972

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !974
  ret i16 %16, !dbg !974
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !975 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !978, metadata !DIExpression()), !dbg !979
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !980, metadata !DIExpression()), !dbg !981
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !982, metadata !DIExpression()), !dbg !983
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !984, metadata !DIExpression()), !dbg !985
  store i32 0, i32* %s32Result, align 4, !dbg !985
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !986, metadata !DIExpression()), !dbg !987
  store i32 0, i32* %s32Temp1, align 4, !dbg !987
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !988
  %conv = zext i16 %0 to i32, !dbg !988
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !989
  %conv1 = sext i16 %1 to i32, !dbg !989
  %mul = mul nsw i32 %conv, %conv1, !dbg !990
  store i32 %mul, i32* %s32Result, align 4, !dbg !991
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !992
  %conv2 = zext i16 %2 to i32, !dbg !992
  %cmp = icmp eq i32 %conv2, 0, !dbg !994
  br i1 %cmp, label %if.then, label %if.else7, !dbg !995

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !996
  %cmp4 = icmp slt i32 %3, 0, !dbg !999
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1000

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1001
  br label %return, !dbg !1001

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1003
  br label %return, !dbg !1003

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1005
  %5 = load i32, i32* %s32Result, align 4, !dbg !1007
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1008
  %conv8 = zext i16 %6 to i32, !dbg !1008
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1009
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1009
  %div = sdiv i32 %5, %conv8, !dbg !1009, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1010
  %conv9 = zext i16 %7 to i32, !dbg !1010
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1011
  %sub = sub nsw i32 %4, %mul10, !dbg !1012
  %shl = shl i32 %sub, 1, !dbg !1013
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1014
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1015
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1016
  %conv11 = zext i16 %9 to i32, !dbg !1016
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1017
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1017
  %div12 = sdiv i32 %8, %conv11, !dbg !1017, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1018
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1019
  %conv13 = zext i16 %11 to i32, !dbg !1019
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1020
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1020
  %div14 = sdiv i32 %10, %conv13, !dbg !1020, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1021
  store i32 %add, i32* %s32Result, align 4, !dbg !1022
  %12 = load i32, i32* %s32Result, align 4, !dbg !1023
  %cmp15 = icmp slt i32 %12, 32767, !dbg !1025
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1026

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1027
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !1030
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1031

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1032
  %conv21 = trunc i32 %14 to i16, !dbg !1034
  store i16 %conv21, i16* %retval, align 2, !dbg !1035
  br label %return, !dbg !1035

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !1036
  br label %return, !dbg !1036

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1038
  br label %return, !dbg !1038

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1040
  ret i16 %15, !dbg !1040
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !1041 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1044, metadata !DIExpression()), !dbg !1045
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1046, metadata !DIExpression()), !dbg !1047
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1048, metadata !DIExpression()), !dbg !1049
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !1050, metadata !DIExpression()), !dbg !1051
  store i32 0, i32* %u32Result, align 4, !dbg !1051
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1052, metadata !DIExpression()), !dbg !1053
  store i32 0, i32* %u32Temp1, align 4, !dbg !1053
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1054, metadata !DIExpression()), !dbg !1055
  store i32 0, i32* %s32Result, align 4, !dbg !1055
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1056, metadata !DIExpression()), !dbg !1057
  store i32 0, i32* %s32Temp1, align 4, !dbg !1057
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !1058
  %conv = sext i16 %0 to i32, !dbg !1058
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !1059
  %conv1 = zext i16 %1 to i32, !dbg !1059
  %mul = mul nsw i32 %conv, %conv1, !dbg !1060
  store i32 %mul, i32* %s32Result, align 4, !dbg !1061
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1062
  %conv2 = sext i16 %2 to i32, !dbg !1062
  %cmp = icmp eq i32 %conv2, 0, !dbg !1064
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1065

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1066
  %cmp4 = icmp sge i32 %3, 0, !dbg !1069
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1070

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !1071
  br label %return, !dbg !1071

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1073
  br label %return, !dbg !1073

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1075
  %5 = load i32, i32* %s32Result, align 4, !dbg !1077
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1078
  %conv8 = sext i16 %6 to i32, !dbg !1078
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1079
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1079
  %div = sdiv i32 %5, %conv8, !dbg !1079, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1080
  %conv9 = sext i16 %7 to i32, !dbg !1080
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1081
  %sub = sub nsw i32 %4, %mul10, !dbg !1082
  %shl = shl i32 %sub, 1, !dbg !1083
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1084
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1085
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1086
  %conv11 = sext i16 %9 to i32, !dbg !1086
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1087
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1087
  %div12 = sdiv i32 %8, %conv11, !dbg !1087, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1088
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1089
  %conv13 = sext i16 %11 to i32, !dbg !1089
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1090
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1090
  %div14 = sdiv i32 %10, %conv13, !dbg !1090, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1091
  store i32 %add, i32* %s32Result, align 4, !dbg !1092
  %12 = load i32, i32* %s32Result, align 4, !dbg !1093
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1095
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1096

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1097
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1100
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1101

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1102
  %conv21 = trunc i32 %14 to i16, !dbg !1104
  store i16 %conv21, i16* %retval, align 2, !dbg !1105
  br label %return, !dbg !1105

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1106
  br label %return, !dbg !1106

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1108
  br label %return, !dbg !1108

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1110
  ret i16 %15, !dbg !1110
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1111 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1114, metadata !DIExpression()), !dbg !1115
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1116, metadata !DIExpression()), !dbg !1117
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1118, metadata !DIExpression()), !dbg !1119
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1120, metadata !DIExpression()), !dbg !1121
  store i32 0, i32* %s32Result, align 4, !dbg !1121
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1122, metadata !DIExpression()), !dbg !1123
  store i32 0, i32* %s32Temp1, align 4, !dbg !1123
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !1124
  %conv = sext i16 %0 to i32, !dbg !1124
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !1125
  %conv1 = zext i16 %1 to i32, !dbg !1125
  %mul = mul nsw i32 %conv, %conv1, !dbg !1126
  store i32 %mul, i32* %s32Result, align 4, !dbg !1127
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1128
  %conv2 = zext i16 %2 to i32, !dbg !1128
  %cmp = icmp eq i32 %conv2, 0, !dbg !1130
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1131

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1132
  %cmp4 = icmp sge i32 %3, 0, !dbg !1135
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1136

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !1137
  br label %return, !dbg !1137

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1139
  br label %return, !dbg !1139

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1141
  %5 = load i32, i32* %s32Result, align 4, !dbg !1143
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1144
  %conv8 = zext i16 %6 to i32, !dbg !1144
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1145
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1145
  %div = sdiv i32 %5, %conv8, !dbg !1145, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1146
  %conv9 = zext i16 %7 to i32, !dbg !1146
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1147
  %sub = sub nsw i32 %4, %mul10, !dbg !1148
  %shl = shl i32 %sub, 1, !dbg !1149
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1150
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1151
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1152
  %conv11 = zext i16 %9 to i32, !dbg !1152
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1153
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1153
  %div12 = sdiv i32 %8, %conv11, !dbg !1153, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1154
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1155
  %conv13 = zext i16 %11 to i32, !dbg !1155
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1156
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1156
  %div14 = sdiv i32 %10, %conv13, !dbg !1156, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1157
  store i32 %add, i32* %s32Result, align 4, !dbg !1158
  %12 = load i32, i32* %s32Result, align 4, !dbg !1159
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1161
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1162

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1163
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1166
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1167

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1168
  %conv21 = trunc i32 %14 to i16, !dbg !1170
  store i16 %conv21, i16* %retval, align 2, !dbg !1171
  br label %return, !dbg !1171

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1172
  br label %return, !dbg !1172

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1174
  br label %return, !dbg !1174

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1176
  ret i16 %15, !dbg !1176
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1177 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1180, metadata !DIExpression()), !dbg !1181
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1182, metadata !DIExpression()), !dbg !1183
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1184, metadata !DIExpression()), !dbg !1185
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1186, metadata !DIExpression()), !dbg !1187
  store i32 0, i32* %u32Temp1, align 4, !dbg !1187
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1188, metadata !DIExpression()), !dbg !1189
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1189
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1190
  %conv = zext i16 %0 to i32, !dbg !1190
  %cmp = icmp eq i32 %conv, 0, !dbg !1192
  br i1 %cmp, label %if.then, label %if.else, !dbg !1193

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1194
  br label %return, !dbg !1194

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1196
  %conv2 = zext i16 %1 to i32, !dbg !1196
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1198
  %conv3 = zext i16 %2 to i32, !dbg !1198
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1199
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1200
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1201
  %conv4 = zext i16 %3 to i32, !dbg !1201
  %shr = ashr i32 %conv4, 1, !dbg !1202
  %conv5 = trunc i32 %shr to i16, !dbg !1201
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1203
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1204
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1205
  %conv6 = zext i16 %5 to i32, !dbg !1205
  %add = add i32 %4, %conv6, !dbg !1206
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1207
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1208
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1209
  %conv7 = zext i16 %7 to i32, !dbg !1209
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1210
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1210
  %div = udiv i32 %6, %conv7, !dbg !1210, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1211
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1212
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1214
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1215

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1216
  %and = and i32 %9, 65535, !dbg !1218
  %conv11 = trunc i32 %and to i16, !dbg !1219
  store i16 %conv11, i16* %retval, align 2, !dbg !1220
  br label %return, !dbg !1220

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1221
  br label %return, !dbg !1221

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1223
  ret i16 %10, !dbg !1223
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1224 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1227, metadata !DIExpression()), !dbg !1228
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1229, metadata !DIExpression()), !dbg !1230
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1231, metadata !DIExpression()), !dbg !1232
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1233, metadata !DIExpression()), !dbg !1234
  store i32 0, i32* %u32Temp1, align 4, !dbg !1234
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1235
  %cmp = icmp eq i32 %0, 0, !dbg !1237
  br i1 %cmp, label %if.then, label %if.else, !dbg !1238

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1239
  br label %return, !dbg !1239

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1241
  %conv = zext i16 %1 to i32, !dbg !1241
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1243
  %conv1 = zext i16 %2 to i32, !dbg !1243
  %mul = mul nsw i32 %conv, %conv1, !dbg !1244
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1245
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1246
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1246
  %div = udiv i32 %mul, %3, !dbg !1246, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1247
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1248
  %conv2 = zext i16 %4 to i32, !dbg !1248
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1250
  %conv3 = zext i16 %5 to i32, !dbg !1250
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1251
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1252
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1253
  %mul5 = mul i32 %6, %7, !dbg !1254
  %sub = sub i32 %mul4, %mul5, !dbg !1255
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1256
  %div6 = udiv i32 %8, 2, !dbg !1257
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1258
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1259

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1260
  %inc = add i32 %9, 1, !dbg !1260
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1260
  br label %if.end, !dbg !1262

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1263
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1265
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1266

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1267
  %and = and i32 %11, 65535, !dbg !1269
  %conv13 = trunc i32 %and to i16, !dbg !1270
  store i16 %conv13, i16* %retval, align 2, !dbg !1271
  br label %return, !dbg !1271

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1272
  br label %return, !dbg !1272

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1274
  ret i16 %12, !dbg !1274
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1275 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1278, metadata !DIExpression()), !dbg !1279
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1280, metadata !DIExpression()), !dbg !1281
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1282, metadata !DIExpression()), !dbg !1283
  store i32 0, i32* %u32Temp1, align 4, !dbg !1283
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1284
  %conv = zext i16 %0 to i32, !dbg !1284
  %cmp = icmp eq i32 %conv, 0, !dbg !1286
  br i1 %cmp, label %if.then, label %if.else, !dbg !1287

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1288
  br label %return, !dbg !1288

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1290
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1292
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1293
  %conv2 = zext i16 %3 to i32, !dbg !1293
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1294
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1294
  %div = udiv i32 %2, %conv2, !dbg !1294, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1295
  %conv3 = zext i16 %4 to i32, !dbg !1295
  %mul = mul i32 %div, %conv3, !dbg !1296
  %sub = sub i32 %1, %mul, !dbg !1297
  %shl = shl i32 %sub, 1, !dbg !1298
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1299
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1300
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1301
  %conv4 = zext i16 %6 to i32, !dbg !1301
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1302
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1302
  %div5 = udiv i32 %5, %conv4, !dbg !1302, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1303
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1304
  %conv6 = zext i16 %8 to i32, !dbg !1304
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1305
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1305
  %div7 = udiv i32 %7, %conv6, !dbg !1305, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1306
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1307
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1308
  store i32 %9, i32* %retval, align 4, !dbg !1309
  br label %return, !dbg !1309

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1310
  ret i32 %10, !dbg !1310
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1311 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1314, metadata !DIExpression()), !dbg !1315
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1316, metadata !DIExpression()), !dbg !1317
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1318, metadata !DIExpression()), !dbg !1319
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1320, metadata !DIExpression()), !dbg !1321
  store i32 0, i32* %s32Temp1, align 4, !dbg !1321
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1322, metadata !DIExpression()), !dbg !1323
  store i32 0, i32* %s32Temp2, align 4, !dbg !1323
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1324, metadata !DIExpression()), !dbg !1325
  store i32 0, i32* %s32Temp3, align 4, !dbg !1325
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1326
  %conv = sext i16 %0 to i32, !dbg !1326
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1327
  %conv1 = sext i16 %1 to i32, !dbg !1327
  %mul = mul nsw i32 %conv, %conv1, !dbg !1328
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1329
  %2 = load i16, i16* %div.addr, align 2, !dbg !1330
  %conv2 = sext i16 %2 to i32, !dbg !1330
  %cmp = icmp eq i32 %conv2, 0, !dbg !1332
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1333

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1334
  %cmp4 = icmp slt i32 %3, 0, !dbg !1337
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1338

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1339
  br label %return, !dbg !1339

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1341
  br label %return, !dbg !1341

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1343
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1345
  %6 = load i16, i16* %div.addr, align 2, !dbg !1346
  %conv8 = sext i16 %6 to i32, !dbg !1346
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1347
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1347
  %div9 = sdiv i32 %5, %conv8, !dbg !1347, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1348
  %conv10 = sext i16 %7 to i32, !dbg !1348
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1349
  %sub = sub nsw i32 %4, %mul11, !dbg !1350
  %shl = shl i32 %sub, 1, !dbg !1351
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1352
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1353
  %9 = load i16, i16* %div.addr, align 2, !dbg !1354
  %conv12 = sext i16 %9 to i32, !dbg !1354
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1355
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1355
  %div13 = sdiv i32 %8, %conv12, !dbg !1355, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1356
  %11 = load i16, i16* %div.addr, align 2, !dbg !1357
  %conv14 = sext i16 %11 to i32, !dbg !1357
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1358
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1358
  %div15 = sdiv i32 %10, %conv14, !dbg !1358, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1359
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1360
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1361
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1363
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1364

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1365
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1368
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1369

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1370
  %conv22 = trunc i32 %14 to i16, !dbg !1372
  store i16 %conv22, i16* %retval, align 2, !dbg !1373
  br label %return, !dbg !1373

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1374
  br label %return, !dbg !1374

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1376
  br label %return, !dbg !1376

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1378
  ret i16 %15, !dbg !1378
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1379 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1382, metadata !DIExpression()), !dbg !1383
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1384, metadata !DIExpression()), !dbg !1385
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1386, metadata !DIExpression()), !dbg !1387
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1388, metadata !DIExpression()), !dbg !1389
  store i32 0, i32* %s32Result, align 4, !dbg !1389
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1390, metadata !DIExpression()), !dbg !1391
  store i32 0, i32* %s32Temp1, align 4, !dbg !1391
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1392
  %conv = sext i16 %0 to i32, !dbg !1392
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1393
  %conv1 = sext i16 %1 to i32, !dbg !1393
  %mul = mul nsw i32 %conv, %conv1, !dbg !1394
  store i32 %mul, i32* %s32Result, align 4, !dbg !1395
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1396
  %conv2 = zext i16 %2 to i32, !dbg !1396
  %cmp = icmp eq i32 %conv2, 0, !dbg !1398
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1399

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1400
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1403
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1404

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1405
  br label %return, !dbg !1405

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1407
  %cmp7 = icmp eq i32 %4, 0, !dbg !1409
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1410

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1411
  br label %return, !dbg !1411

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1413
  br label %return, !dbg !1413

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1415
  %6 = load i32, i32* %s32Result, align 4, !dbg !1417
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1418
  %conv12 = zext i16 %7 to i32, !dbg !1418
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1419
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1419
  %div = sdiv i32 %6, %conv12, !dbg !1419, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1420
  %conv13 = zext i16 %8 to i32, !dbg !1420
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1421
  %sub = sub nsw i32 %5, %mul14, !dbg !1422
  %shl = shl i32 %sub, 1, !dbg !1423
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1424
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1425
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1426
  %conv15 = zext i16 %10 to i32, !dbg !1426
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1427
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1427
  %div16 = sdiv i32 %9, %conv15, !dbg !1427, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1428
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1429
  %conv17 = zext i16 %12 to i32, !dbg !1429
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1430
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1430
  %div18 = sdiv i32 %11, %conv17, !dbg !1430, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1431
  store i32 %add, i32* %s32Result, align 4, !dbg !1432
  %13 = load i32, i32* %s32Result, align 4, !dbg !1433
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1435
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1436

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1437
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1440
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1441

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1442
  %conv25 = trunc i32 %15 to i16, !dbg !1444
  store i16 %conv25, i16* %retval, align 2, !dbg !1445
  br label %return, !dbg !1445

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1446
  br label %return, !dbg !1446

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1448
  br label %return, !dbg !1448

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1450
  ret i16 %16, !dbg !1450
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1451 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1454, metadata !DIExpression()), !dbg !1455
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1456, metadata !DIExpression()), !dbg !1457
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1458, metadata !DIExpression()), !dbg !1459
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1460
  %cmp = icmp eq i32 %0, 0, !dbg !1462
  br i1 %cmp, label %if.then, label %if.else, !dbg !1463

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1464
  br label %return, !dbg !1464

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1466
  %cmp1 = icmp sle i32 %1, 0, !dbg !1469
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1470

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1471
  br label %return, !dbg !1471

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1473
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1475
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1476
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1477
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1477
  %div = udiv i32 %3, %4, !dbg !1477, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1478
  %mul = mul i32 %div, %5, !dbg !1479
  %sub = sub i32 %2, %mul, !dbg !1480
  %shl = shl i32 %sub, 1, !dbg !1481
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1482
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1483
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1484
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1485
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1485
  %div4 = udiv i32 %6, %7, !dbg !1485, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1486
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1487
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1488
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1488
  %div5 = udiv i32 %8, %9, !dbg !1488, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1489
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1490
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1491
  store i32 %10, i32* %retval, align 4, !dbg !1492
  br label %return, !dbg !1492

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1493
  ret i32 %11, !dbg !1493
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1494 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1497, metadata !DIExpression()), !dbg !1498
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1499, metadata !DIExpression()), !dbg !1500
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1501, metadata !DIExpression()), !dbg !1502
  store i32 0, i32* %s32Temp1, align 4, !dbg !1502
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1503
  %cmp = icmp eq i32 %0, 0, !dbg !1505
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1506

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1507
  %cmp1 = icmp sge i32 %1, 0, !dbg !1510
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1511

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1512
  br label %return, !dbg !1512

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1514
  br label %return, !dbg !1514

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1516
  %cmp4 = icmp sge i32 %2, 0, !dbg !1519
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1520

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1521
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1523
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1524
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1525
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1525
  %div = udiv i32 %4, %5, !dbg !1525, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1526
  %mul = mul i32 %div, %6, !dbg !1527
  %sub = sub i32 %3, %mul, !dbg !1528
  %shl = shl i32 %sub, 1, !dbg !1529
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1530
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1531
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1532
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1533
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1533
  %div6 = udiv i32 %7, %8, !dbg !1533, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1534
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1535
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1536
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1536
  %div7 = udiv i32 %9, %10, !dbg !1536, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1537
  store i32 %add, i32* %retval, align 4, !dbg !1538
  br label %return, !dbg !1538

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1539
  br label %return, !dbg !1539

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1541
  ret i32 %11, !dbg !1541
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1542 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1545, metadata !DIExpression()), !dbg !1546
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1547, metadata !DIExpression()), !dbg !1548
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1549, metadata !DIExpression()), !dbg !1550
  store i32 0, i32* %u32Temp1, align 4, !dbg !1550
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1551, metadata !DIExpression()), !dbg !1552
  store i32 0, i32* %u32Temp2, align 4, !dbg !1552
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1553
  %cmp = icmp eq i32 %0, 0, !dbg !1555
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1556

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1557
  %cmp1 = icmp slt i32 %1, 0, !dbg !1560
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1561

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1562
  br label %return, !dbg !1562

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1564
  br label %return, !dbg !1564

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1566
  %cmp4 = icmp sge i32 %2, 0, !dbg !1569
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1570

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1571
  %cmp6 = icmp eq i32 %3, 0, !dbg !1574
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1575

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1576
  br label %return, !dbg !1576

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1578
  %cmp9 = icmp sle i32 %4, 0, !dbg !1581
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1582

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1583
  br label %return, !dbg !1583

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1585
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1587
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1588
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1589
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1589
  %div = sdiv i32 %6, %7, !dbg !1589, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1590
  %mul = mul nsw i32 %div, %8, !dbg !1591
  %sub = sub nsw i32 %5, %mul, !dbg !1592
  %shl = shl i32 %sub, 1, !dbg !1593
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1594
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1595
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1596
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1597
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1597
  %div12 = udiv i32 %9, %10, !dbg !1597, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1598
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1599
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1600
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1600
  %div13 = sdiv i32 %11, %12, !dbg !1600, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1601
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1602
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1603
  store i32 %13, i32* %retval, align 4, !dbg !1604
  br label %return, !dbg !1604

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1605
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1608
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1609

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1610
  br label %return, !dbg !1610

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1612
  %sub18 = sub nsw i32 0, %15, !dbg !1614
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1615
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1616
  %sub19 = sub nsw i32 0, %16, !dbg !1617
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1618
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1619
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1620
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1621
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1622
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1622
  %div20 = sdiv i32 %18, %19, !dbg !1622, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1623
  %mul21 = mul nsw i32 %div20, %20, !dbg !1624
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1625
  %shl23 = shl i32 %sub22, 1, !dbg !1626
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1627
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1628
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1629
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1630
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1630
  %div24 = udiv i32 %21, %22, !dbg !1630, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1631
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1632
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1633
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1633
  %div25 = sdiv i32 %23, %24, !dbg !1633, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1634
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1635
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1636
  store i32 %25, i32* %retval, align 4, !dbg !1637
  br label %return, !dbg !1637

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1638
  ret i32 %26, !dbg !1638
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1639 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1642, metadata !DIExpression()), !dbg !1643
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1644, metadata !DIExpression()), !dbg !1645
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1646, metadata !DIExpression()), !dbg !1647
  store i32 0, i32* %u32Temp1, align 4, !dbg !1647
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1648, metadata !DIExpression()), !dbg !1649
  store i32 0, i32* %u32Temp2, align 4, !dbg !1649
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1650, metadata !DIExpression()), !dbg !1651
  store i32 0, i32* %u32Temp3, align 4, !dbg !1651
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1652, metadata !DIExpression()), !dbg !1653
  store i32 0, i32* %numerator_old, align 4, !dbg !1653
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1654
  %cmp = icmp eq i32 %0, 0, !dbg !1656
  br i1 %cmp, label %if.then, label %if.else, !dbg !1657

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1658
  br label %return, !dbg !1658

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1660
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1662
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1663
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1664
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1665
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1665
  %div = udiv i32 %3, %4, !dbg !1665, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1666
  %sub = sub i32 %1, %mul, !dbg !1667
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1668
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1669
  %and = and i32 %5, 1, !dbg !1671
  %cmp1 = icmp eq i32 %and, 0, !dbg !1672
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1673

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1674
  %shr = lshr i32 %6, 1, !dbg !1676
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1677
  br label %if.end, !dbg !1678

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1679
  %shr4 = lshr i32 %7, 1, !dbg !1681
  %add = add i32 %shr4, 1, !dbg !1682
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1683
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1684
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1686
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1687
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1688

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1689
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1691
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1692
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1692
  %div7 = udiv i32 %10, %11, !dbg !1692, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1693
  br label %return, !dbg !1693

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1694
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1696
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1697
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1697
  %div9 = udiv i32 %12, %13, !dbg !1697, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1698
  store i32 %add10, i32* %retval, align 4, !dbg !1699
  br label %return, !dbg !1699

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1700
  ret i32 %14, !dbg !1700
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1701 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1704, metadata !DIExpression()), !dbg !1705
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1706, metadata !DIExpression()), !dbg !1707
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1708, metadata !DIExpression()), !dbg !1709
  store i32 0, i32* %u32Temp1, align 4, !dbg !1709
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1710, metadata !DIExpression()), !dbg !1711
  store i32 0, i32* %u32Temp2, align 4, !dbg !1711
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1712
  %cmp = icmp sle i32 %0, 0, !dbg !1714
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1715

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1716
  %cmp1 = icmp sge i32 %1, 0, !dbg !1719
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1720

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1721
  br label %return, !dbg !1721

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1723
  %sub = sub nsw i32 0, %2, !dbg !1725
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1726
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1727
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1728
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1729
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1730
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1730
  %div = udiv i32 %4, %5, !dbg !1730, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1731
  %mul = mul i32 %div, %6, !dbg !1732
  %sub3 = sub i32 %3, %mul, !dbg !1733
  %shl = shl i32 %sub3, 1, !dbg !1734
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1735
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1736
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1737
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1738
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1738
  %div4 = udiv i32 %7, %8, !dbg !1738, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1739
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1740
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1741
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1741
  %div5 = udiv i32 %9, %10, !dbg !1741, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1742
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1743
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1744
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1746
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1747

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1748
  %sub8 = sub i32 0, %12, !dbg !1750
  store i32 %sub8, i32* %retval, align 4, !dbg !1751
  br label %return, !dbg !1751

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1752
  br label %return, !dbg !1752

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1754
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1756
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1757
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1758
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1758
  %div11 = udiv i32 %14, %15, !dbg !1758, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1759
  %mul12 = mul i32 %div11, %16, !dbg !1760
  %sub13 = sub i32 %13, %mul12, !dbg !1761
  %shl14 = shl i32 %sub13, 1, !dbg !1762
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1763
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1764
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1765
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1766
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1766
  %div15 = udiv i32 %17, %18, !dbg !1766, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1767
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1768
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1769
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1769
  %div16 = udiv i32 %19, %20, !dbg !1769, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1770
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1771
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1772
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1774
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1775

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1776
  store i32 %22, i32* %retval, align 4, !dbg !1778
  br label %return, !dbg !1778

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1779
  br label %return, !dbg !1779

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1781
  ret i32 %23, !dbg !1781
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1782 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1785, metadata !DIExpression()), !dbg !1786
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1787, metadata !DIExpression()), !dbg !1788
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1789, metadata !DIExpression()), !dbg !1790
  store i32 0, i32* %s32Temp1, align 4, !dbg !1790
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1791, metadata !DIExpression()), !dbg !1792
  store i32 0, i32* %s32Temp2, align 4, !dbg !1792
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1793, metadata !DIExpression()), !dbg !1794
  store i32 0, i32* %u32Temp0, align 4, !dbg !1794
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1795, metadata !DIExpression()), !dbg !1796
  store i32 0, i32* %u32Temp1, align 4, !dbg !1796
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1797, metadata !DIExpression()), !dbg !1798
  store i32 0, i32* %u32Temp2, align 4, !dbg !1798
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1799
  %cmp = icmp eq i32 %0, 0, !dbg !1801
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1802

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1803
  %cmp1 = icmp slt i32 %1, 0, !dbg !1806
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1807

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1808
  br label %return, !dbg !1808

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1810
  br label %return, !dbg !1810

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1812
  %cmp4 = icmp sle i32 %2, 0, !dbg !1815
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1816

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1817
  %sub = sub nsw i32 0, %3, !dbg !1819
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1820
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1821
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1822
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1823
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1823
  %div = udiv i32 %4, %5, !dbg !1823, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1824
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1825
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1826
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1827
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1828
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1828
  %div6 = udiv i32 %7, %8, !dbg !1828, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1829
  %mul = mul i32 %div6, %9, !dbg !1830
  %sub7 = sub i32 %6, %mul, !dbg !1831
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1832
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1833
  %and = and i32 %10, 1, !dbg !1835
  %cmp8 = icmp eq i32 %and, 0, !dbg !1836
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1837

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1838
  %shr = lshr i32 %11, 1, !dbg !1840
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1841
  br label %if.end, !dbg !1842

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1843
  %shr11 = lshr i32 %12, 1, !dbg !1845
  %add = add i32 %shr11, 1, !dbg !1846
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1847
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1848
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1850
  %cmp12 = icmp ult i32 %13, %14, !dbg !1851
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1852

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1853
  %neg = xor i32 %15, -1, !dbg !1855
  %add14 = add i32 %neg, 1, !dbg !1856
  store i32 %add14, i32* %retval, align 4, !dbg !1857
  br label %return, !dbg !1857

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1858
  %add16 = add i32 %16, 1, !dbg !1860
  %neg17 = xor i32 %add16, -1, !dbg !1861
  %add18 = add i32 %neg17, 1, !dbg !1862
  store i32 %add18, i32* %retval, align 4, !dbg !1863
  br label %return, !dbg !1863

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1864
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1866
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1867
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1868
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1868
  %div20 = udiv i32 %18, %19, !dbg !1868, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1869
  %mul21 = mul i32 %div20, %20, !dbg !1870
  %sub22 = sub i32 %17, %mul21, !dbg !1871
  %shl = shl i32 %sub22, 1, !dbg !1872
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1873
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1874
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1875
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1876
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1876
  %div23 = udiv i32 %21, %22, !dbg !1876, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1877
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1878
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1879
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1879
  %div24 = udiv i32 %23, %24, !dbg !1879, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1880
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1881
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1882
  store i32 %25, i32* %retval, align 4, !dbg !1883
  br label %return, !dbg !1883

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1884
  ret i32 %26, !dbg !1884
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1885 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1888, metadata !DIExpression()), !dbg !1889
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1890, metadata !DIExpression()), !dbg !1891
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1892, metadata !DIExpression()), !dbg !1893
  store i32 0, i32* %s32Temp1, align 4, !dbg !1893
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1894, metadata !DIExpression()), !dbg !1895
  store i32 0, i32* %s32Temp2, align 4, !dbg !1895
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1896, metadata !DIExpression()), !dbg !1897
  store i32 0, i32* %denominator_prime, align 4, !dbg !1897
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1898, metadata !DIExpression()), !dbg !1899
  store i32 0, i32* %u32Temp1, align 4, !dbg !1899
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1900, metadata !DIExpression()), !dbg !1901
  store i32 0, i32* %u32Temp2, align 4, !dbg !1901
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1902, metadata !DIExpression()), !dbg !1903
  store i32 0, i32* %u32numerator, align 4, !dbg !1903
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1904, metadata !DIExpression()), !dbg !1905
  store i32 0, i32* %u32denominator, align 4, !dbg !1905
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1906
  %cmp = icmp slt i32 %0, 0, !dbg !1908
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1909

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1910
  %cmp1 = icmp sle i32 %1, 0, !dbg !1913
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1914

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1915
  %cmp3 = icmp sge i32 %2, 0, !dbg !1918
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1919

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1920
  br label %return, !dbg !1920

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1922
  %sub = sub nsw i32 0, %3, !dbg !1924
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1925
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1926
  %sub5 = sub nsw i32 0, %4, !dbg !1927
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1928
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1929
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1930
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1931
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1932
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1932
  %div = udiv i32 %6, %7, !dbg !1932, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1933
  %mul = mul i32 %div, %8, !dbg !1934
  %sub6 = sub i32 %5, %mul, !dbg !1935
  %shl = shl i32 %sub6, 1, !dbg !1936
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1937
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1938
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1939
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1940
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1940
  %div7 = udiv i32 %9, %10, !dbg !1940, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1941
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1942
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1943
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1943
  %div8 = udiv i32 %11, %12, !dbg !1943, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1944
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1945
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1946
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1948
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1949

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1950
  store i32 %14, i32* %retval, align 4, !dbg !1952
  br label %return, !dbg !1952

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1953
  br label %return, !dbg !1953

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1955
  %neg = xor i32 %15, -1, !dbg !1957
  %add13 = add nsw i32 %neg, 1, !dbg !1958
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1959
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1960
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1961
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1962
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1963
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1963
  %div14 = udiv i32 %17, %18, !dbg !1963, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1964
  %mul15 = mul i32 %div14, %19, !dbg !1965
  %sub16 = sub i32 %16, %mul15, !dbg !1966
  %shl17 = shl i32 %sub16, 1, !dbg !1967
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1968
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1969
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1970
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1971
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1971
  %div18 = udiv i32 %20, %21, !dbg !1971, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1972
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1973
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1974
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1974
  %div19 = sdiv i32 %22, %23, !dbg !1974, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1975
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1976
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1977
  %neg21 = xor i32 %24, -1, !dbg !1978
  %add22 = add nsw i32 %neg21, 1, !dbg !1979
  store i32 %add22, i32* %retval, align 4, !dbg !1980
  br label %return, !dbg !1980

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1981
  %cmp24 = icmp sle i32 %25, 0, !dbg !1984
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1985

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1986
  %cmp26 = icmp sge i32 %26, 0, !dbg !1989
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1990

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1991
  br label %return, !dbg !1991

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1993
  %neg29 = xor i32 %27, -1, !dbg !1995
  %add30 = add nsw i32 %neg29, 1, !dbg !1996
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1997
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1998
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1999
  %30 = load i32, i32* %u32denominator, align 4, !dbg !2000
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !2001
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !2001
  %div31 = udiv i32 %29, %30, !dbg !2001, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !2002
  %mul32 = mul i32 %div31, %31, !dbg !2003
  %sub33 = sub i32 %28, %mul32, !dbg !2004
  %shl34 = shl i32 %sub33, 1, !dbg !2005
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !2006
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !2007
  %33 = load i32, i32* %u32denominator, align 4, !dbg !2008
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !2009
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !2009
  %div35 = udiv i32 %32, %33, !dbg !2009, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !2010
  %35 = load i32, i32* %u32denominator, align 4, !dbg !2011
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !2012
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !2012
  %div36 = udiv i32 %34, %35, !dbg !2012, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !2013
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !2014
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !2015
  %neg38 = xor i32 %36, -1, !dbg !2016
  %add39 = add nsw i32 %neg38, 1, !dbg !2017
  store i32 %add39, i32* %retval, align 4, !dbg !2018
  br label %return, !dbg !2018

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !2019
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !2021
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !2022
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !2023
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !2023
  %div41 = sdiv i32 %38, %39, !dbg !2023, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !2024
  %mul42 = mul nsw i32 %div41, %40, !dbg !2025
  %sub43 = sub nsw i32 %37, %mul42, !dbg !2026
  %shl44 = shl i32 %sub43, 1, !dbg !2027
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !2028
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !2029
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !2030
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !2031
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !2031
  %div45 = sdiv i32 %41, %42, !dbg !2031, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !2032
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !2033
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !2034
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !2034
  %div46 = udiv i32 %43, %44, !dbg !2034, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !2035
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !2036
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !2037
  store i32 %45, i32* %retval, align 4, !dbg !2038
  br label %return, !dbg !2038

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !2039
  ret i32 %46, !dbg !2039
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !2040 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !2043, metadata !DIExpression()), !dbg !2044
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !2045, metadata !DIExpression()), !dbg !2046
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !2047, metadata !DIExpression()), !dbg !2048
  store i32 0, i32* %numerator_prime, align 4, !dbg !2048
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2049, metadata !DIExpression()), !dbg !2050
  store i32 0, i32* %u32Temp1, align 4, !dbg !2050
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2051, metadata !DIExpression()), !dbg !2052
  store i32 0, i32* %u32Temp2, align 4, !dbg !2052
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2053, metadata !DIExpression()), !dbg !2054
  store i32 0, i32* %u32Temp3, align 4, !dbg !2054
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !2055, metadata !DIExpression()), !dbg !2056
  store i32 0, i32* %s32Temp1, align 4, !dbg !2056
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !2057, metadata !DIExpression()), !dbg !2058
  store i32 0, i32* %s32Temp2, align 4, !dbg !2058
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !2059, metadata !DIExpression()), !dbg !2060
  store i32 0, i32* %s32Temp3, align 4, !dbg !2060
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !2061
  %cmp = icmp eq i32 %0, 0, !dbg !2063
  br i1 %cmp, label %if.then, label %if.else3, !dbg !2064

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !2065
  %cmp1 = icmp slt i32 %1, 0, !dbg !2068
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !2069

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !2070
  br label %return, !dbg !2070

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !2072
  br label %return, !dbg !2072

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !2074
  %cmp4 = icmp slt i32 %2, 0, !dbg !2077
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !2078

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !2079
  %sub = sub nsw i32 0, %3, !dbg !2081
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !2082
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !2083
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !2084
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !2085
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !2085
  %div = udiv i32 %4, %5, !dbg !2085, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !2086
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !2087
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !2088
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !2089
  %mul = mul i32 %7, %8, !dbg !2090
  %sub6 = sub i32 %6, %mul, !dbg !2091
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !2092
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !2093
  %and = and i32 %9, 1, !dbg !2095
  %cmp7 = icmp eq i32 %and, 0, !dbg !2096
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !2097

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !2098
  %shr = lshr i32 %10, 1, !dbg !2100
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !2101
  br label %if.end, !dbg !2102

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !2103
  %shr10 = lshr i32 %11, 1, !dbg !2105
  %add = add i32 %shr10, 1, !dbg !2106
  store i32 %add, i32* %denominator.addr, align 4, !dbg !2107
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2108
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !2110
  %cmp11 = icmp ult i32 %12, %13, !dbg !2111
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !2112

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2113
  %neg = xor i32 %14, -1, !dbg !2115
  %add13 = add i32 %neg, 1, !dbg !2116
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !2117
  br label %if.end18, !dbg !2118

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !2119
  %add15 = add i32 %15, 1, !dbg !2121
  %neg16 = xor i32 %add15, -1, !dbg !2122
  %add17 = add i32 %neg16, 1, !dbg !2123
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !2124
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !2125
  %cmp19 = icmp sge i32 %16, -32768, !dbg !2127
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !2128

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !2129
  %conv = trunc i32 %17 to i16, !dbg !2131
  store i16 %conv, i16* %retval, align 2, !dbg !2132
  br label %return, !dbg !2132

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !2133
  br label %return, !dbg !2133

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !2135
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !2137
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !2138
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !2138
  %div23 = udiv i32 %18, %19, !dbg !2138, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !2139
  %mul24 = mul i32 %div23, %20, !dbg !2140
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !2141
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !2142
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !2143
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !2144
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !2145
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !2145
  %div25 = udiv i32 %22, %23, !dbg !2145, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !2146
  %mul26 = mul i32 %div25, %24, !dbg !2147
  %sub27 = sub i32 %21, %mul26, !dbg !2148
  %shl = shl i32 %sub27, 1, !dbg !2149
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !2150
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !2151
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !2152
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !2153
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !2153
  %div28 = udiv i32 %25, %26, !dbg !2153, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !2154
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !2155
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !2156
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !2156
  %div29 = udiv i32 %27, %28, !dbg !2156, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !2157
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2158
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2159
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2161
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2162

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2163
  %conv34 = trunc i32 %30 to i16, !dbg !2165
  store i16 %conv34, i16* %retval, align 2, !dbg !2166
  br label %return, !dbg !2166

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2167
  br label %return, !dbg !2167

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2169
  ret i16 %31, !dbg !2169
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2170 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2176, metadata !DIExpression()), !dbg !2177
  %2 = icmp eq i64 %0, 0, !dbg !2178
  br i1 %2, label %3, label %4, !dbg !2180

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2181
  unreachable, !dbg !2181

4:                                                ; preds = %1
  ret void, !dbg !2182
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2183 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2189, metadata !DIExpression()), !dbg !2191
  call void @llvm.dbg.value(metadata i64 %1, metadata !2190, metadata !DIExpression()), !dbg !2191
  %3 = icmp ult i64 %1, %0, !dbg !2192
  br i1 %3, label %5, label %4, !dbg !2194

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2195
  unreachable, !dbg !2195

5:                                                ; preds = %2
  ret void, !dbg !2197
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0042/div_Ccode_alarm_0042.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0042")
!4 = !{}
!5 = !{!6, !13, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0042")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0042")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0042/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0042")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0042")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0042")
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
!383 = !DILocation(line: 342, column: 55, scope: !384)
!384 = distinct !DILexicalBlock(scope: !362, file: !69, line: 342, column: 9)
!385 = !DILocation(line: 342, column: 78, scope: !384)
!386 = !DILocation(line: 342, column: 94, scope: !384)
!387 = !DILocation(line: 342, column: 89, scope: !384)
!388 = !DILocation(line: 342, column: 87, scope: !384)
!389 = !DILocation(line: 342, column: 114, scope: !384)
!390 = !DILocation(line: 342, column: 109, scope: !384)
!391 = !DILocation(line: 342, column: 107, scope: !384)
!392 = !DILocation(line: 342, column: 64, scope: !384)
!393 = !DILocation(line: 342, column: 39, scope: !384)
!394 = !DILocation(line: 342, column: 11, scope: !384)
!395 = !DILocation(line: 342, column: 9, scope: !362)
!396 = !DILocation(line: 343, column: 9, scope: !397)
!397 = distinct !DILexicalBlock(scope: !384, file: !69, line: 342, column: 147)
!398 = !DILocation(line: 346, column: 52, scope: !399)
!399 = distinct !DILexicalBlock(scope: !362, file: !69, line: 346, column: 9)
!400 = !DILocation(line: 346, column: 68, scope: !399)
!401 = !DILocation(line: 346, column: 63, scope: !399)
!402 = !DILocation(line: 346, column: 61, scope: !399)
!403 = !DILocation(line: 346, column: 36, scope: !399)
!404 = !DILocation(line: 346, column: 98, scope: !399)
!405 = !DILocation(line: 346, column: 93, scope: !399)
!406 = !DILocation(line: 346, column: 83, scope: !399)
!407 = !DILocation(line: 346, column: 11, scope: !399)
!408 = !DILocation(line: 346, column: 9, scope: !362)
!409 = !DILocation(line: 347, column: 9, scope: !410)
!410 = distinct !DILexicalBlock(scope: !399, file: !69, line: 346, column: 114)
!411 = !DILocation(line: 350, column: 52, scope: !412)
!412 = distinct !DILexicalBlock(scope: !362, file: !69, line: 350, column: 9)
!413 = !DILocation(line: 350, column: 68, scope: !412)
!414 = !DILocation(line: 350, column: 63, scope: !412)
!415 = !DILocation(line: 350, column: 61, scope: !412)
!416 = !DILocation(line: 350, column: 36, scope: !412)
!417 = !DILocation(line: 350, column: 98, scope: !412)
!418 = !DILocation(line: 350, column: 93, scope: !412)
!419 = !DILocation(line: 350, column: 83, scope: !412)
!420 = !DILocation(line: 350, column: 11, scope: !412)
!421 = !DILocation(line: 350, column: 9, scope: !362)
!422 = !DILocation(line: 351, column: 9, scope: !423)
!423 = distinct !DILexicalBlock(scope: !412, file: !69, line: 350, column: 114)
!424 = !DILocation(line: 354, column: 54, scope: !425)
!425 = distinct !DILexicalBlock(scope: !362, file: !69, line: 354, column: 9)
!426 = !DILocation(line: 354, column: 44, scope: !425)
!427 = !DILocation(line: 354, column: 80, scope: !425)
!428 = !DILocation(line: 354, column: 75, scope: !425)
!429 = !DILocation(line: 354, column: 65, scope: !425)
!430 = !DILocation(line: 354, column: 11, scope: !425)
!431 = !DILocation(line: 354, column: 9, scope: !362)
!432 = !DILocation(line: 355, column: 9, scope: !433)
!433 = distinct !DILexicalBlock(scope: !425, file: !69, line: 354, column: 96)
!434 = !DILocation(line: 357, column: 17, scope: !362)
!435 = !DILocation(line: 357, column: 29, scope: !362)
!436 = !DILocation(line: 357, column: 38, scope: !362)
!437 = !DILocation(line: 357, column: 37, scope: !362)
!438 = !DILocation(line: 357, column: 53, scope: !362)
!439 = !DILocation(line: 357, column: 51, scope: !362)
!440 = !DILocation(line: 357, column: 26, scope: !362)
!441 = !DILocation(line: 357, column: 66, scope: !362)
!442 = !DILocation(line: 357, column: 14, scope: !362)
!443 = !DILocation(line: 359, column: 48, scope: !444)
!444 = distinct !DILexicalBlock(scope: !362, file: !69, line: 359, column: 9)
!445 = !DILocation(line: 359, column: 38, scope: !444)
!446 = !DILocation(line: 359, column: 11, scope: !444)
!447 = !DILocation(line: 359, column: 9, scope: !362)
!448 = !DILocation(line: 360, column: 9, scope: !449)
!449 = distinct !DILexicalBlock(scope: !444, file: !69, line: 359, column: 64)
!450 = !DILocation(line: 362, column: 16, scope: !362)
!451 = !DILocation(line: 362, column: 25, scope: !362)
!452 = !DILocation(line: 362, column: 24, scope: !362)
!453 = !DILocation(line: 362, column: 14, scope: !362)
!454 = !DILocation(line: 364, column: 48, scope: !455)
!455 = distinct !DILexicalBlock(scope: !362, file: !69, line: 364, column: 9)
!456 = !DILocation(line: 364, column: 38, scope: !455)
!457 = !DILocation(line: 364, column: 11, scope: !455)
!458 = !DILocation(line: 364, column: 9, scope: !362)
!459 = !DILocation(line: 365, column: 9, scope: !460)
!460 = distinct !DILexicalBlock(scope: !455, file: !69, line: 364, column: 64)
!461 = !DILocation(line: 368, column: 46, scope: !462)
!462 = distinct !DILexicalBlock(scope: !362, file: !69, line: 368, column: 9)
!463 = !DILocation(line: 368, column: 36, scope: !462)
!464 = !DILocation(line: 368, column: 73, scope: !462)
!465 = !DILocation(line: 368, column: 90, scope: !462)
!466 = !DILocation(line: 368, column: 85, scope: !462)
!467 = !DILocation(line: 368, column: 83, scope: !462)
!468 = !DILocation(line: 368, column: 57, scope: !462)
!469 = !DILocation(line: 368, column: 11, scope: !462)
!470 = !DILocation(line: 368, column: 9, scope: !362)
!471 = !DILocation(line: 369, column: 9, scope: !472)
!472 = distinct !DILexicalBlock(scope: !462, file: !69, line: 368, column: 107)
!473 = !DILocation(line: 372, column: 54, scope: !474)
!474 = distinct !DILexicalBlock(scope: !362, file: !69, line: 372, column: 9)
!475 = !DILocation(line: 372, column: 44, scope: !474)
!476 = !DILocation(line: 372, column: 81, scope: !474)
!477 = !DILocation(line: 372, column: 76, scope: !474)
!478 = !DILocation(line: 372, column: 66, scope: !474)
!479 = !DILocation(line: 372, column: 11, scope: !474)
!480 = !DILocation(line: 372, column: 9, scope: !362)
!481 = !DILocation(line: 373, column: 9, scope: !482)
!482 = distinct !DILexicalBlock(scope: !474, file: !69, line: 372, column: 97)
!483 = !DILocation(line: 376, column: 46, scope: !484)
!484 = distinct !DILexicalBlock(scope: !362, file: !69, line: 376, column: 9)
!485 = !DILocation(line: 376, column: 36, scope: !484)
!486 = !DILocation(line: 376, column: 73, scope: !484)
!487 = !DILocation(line: 376, column: 90, scope: !484)
!488 = !DILocation(line: 376, column: 85, scope: !484)
!489 = !DILocation(line: 376, column: 83, scope: !484)
!490 = !DILocation(line: 376, column: 57, scope: !484)
!491 = !DILocation(line: 376, column: 11, scope: !484)
!492 = !DILocation(line: 376, column: 9, scope: !362)
!493 = !DILocation(line: 377, column: 9, scope: !494)
!494 = distinct !DILexicalBlock(scope: !484, file: !69, line: 376, column: 107)
!495 = !DILocation(line: 384, column: 37, scope: !362)
!496 = !DILocation(line: 384, column: 54, scope: !362)
!497 = !DILocation(line: 384, column: 71, scope: !362)
!498 = !DILocation(line: 384, column: 66, scope: !362)
!499 = !DILocation(line: 384, column: 64, scope: !362)
!500 = !DILocation(line: 384, column: 46, scope: !362)
!501 = !DILocation(line: 384, column: 27, scope: !362)
!502 = !DILocation(line: 384, column: 25, scope: !362)
!503 = !DILocation(line: 385, column: 5, scope: !362)
!504 = !DILocation(line: 405, column: 5, scope: !505)
!505 = distinct !DILexicalBlock(scope: !356, file: !69, line: 404, column: 4)
!506 = !DILocation(line: 411, column: 1, scope: !186)
!507 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !508, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!508 = !DISubroutineType(types: !509)
!509 = !{!19, !13}
!510 = !DILocalVariable(name: "denominator", arg: 1, scope: !507, file: !33, line: 24, type: !13)
!511 = !DILocation(line: 24, column: 40, scope: !507)
!512 = !DILocation(line: 26, column: 12, scope: !507)
!513 = !DILocation(line: 26, column: 24, scope: !507)
!514 = !DILocation(line: 26, column: 5, scope: !507)
!515 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !508, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!516 = !DILocalVariable(name: "left", arg: 1, scope: !515, file: !33, line: 84, type: !13)
!517 = !DILocation(line: 84, column: 51, scope: !515)
!518 = !DILocation(line: 86, column: 12, scope: !515)
!519 = !DILocation(line: 86, column: 17, scope: !515)
!520 = !DILocation(line: 86, column: 5, scope: !515)
!521 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !522, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!522 = !DISubroutineType(types: !523)
!523 = !{!19, !13, !20}
!524 = !DILocalVariable(name: "left", arg: 1, scope: !521, file: !33, line: 90, type: !13)
!525 = !DILocation(line: 90, column: 41, scope: !521)
!526 = !DILocalVariable(name: "count", arg: 2, scope: !521, file: !33, line: 90, type: !20)
!527 = !DILocation(line: 90, column: 56, scope: !521)
!528 = !DILocation(line: 92, column: 9, scope: !529)
!529 = distinct !DILexicalBlock(scope: !521, file: !33, line: 92, column: 9)
!530 = !DILocation(line: 92, column: 15, scope: !529)
!531 = !DILocation(line: 92, column: 9, scope: !521)
!532 = !DILocation(line: 93, column: 9, scope: !533)
!533 = distinct !DILexicalBlock(scope: !529, file: !33, line: 92, column: 32)
!534 = !DILocation(line: 95, column: 12, scope: !521)
!535 = !DILocation(line: 95, column: 34, scope: !521)
!536 = !DILocation(line: 95, column: 31, scope: !521)
!537 = !DILocation(line: 95, column: 17, scope: !521)
!538 = !DILocation(line: 95, column: 41, scope: !521)
!539 = !DILocation(line: 95, column: 5, scope: !521)
!540 = !DILocation(line: 96, column: 1, scope: !521)
!541 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !542, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!542 = !DISubroutineType(types: !543)
!543 = !{!19, !13, !13}
!544 = !DILocalVariable(name: "left", arg: 1, scope: !541, file: !33, line: 78, type: !13)
!545 = !DILocation(line: 78, column: 38, scope: !541)
!546 = !DILocalVariable(name: "right", arg: 2, scope: !541, file: !33, line: 78, type: !13)
!547 = !DILocation(line: 78, column: 52, scope: !541)
!548 = !DILocation(line: 80, column: 12, scope: !541)
!549 = !DILocation(line: 80, column: 19, scope: !541)
!550 = !DILocation(line: 80, column: 17, scope: !541)
!551 = !DILocation(line: 80, column: 25, scope: !541)
!552 = !DILocation(line: 80, column: 5, scope: !541)
!553 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !542, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!554 = !DILocalVariable(name: "left", arg: 1, scope: !553, file: !33, line: 72, type: !13)
!555 = !DILocation(line: 72, column: 38, scope: !553)
!556 = !DILocalVariable(name: "right", arg: 2, scope: !553, file: !33, line: 72, type: !13)
!557 = !DILocation(line: 72, column: 52, scope: !553)
!558 = !DILocation(line: 74, column: 12, scope: !553)
!559 = !DILocation(line: 74, column: 19, scope: !553)
!560 = !DILocation(line: 74, column: 17, scope: !553)
!561 = !DILocation(line: 74, column: 25, scope: !553)
!562 = !DILocation(line: 74, column: 5, scope: !553)
!563 = distinct !DISubprogram(name: "klee_alarm_s32_add_lower", scope: !33, file: !33, line: 48, type: !542, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!564 = !DILocalVariable(name: "left", arg: 1, scope: !563, file: !33, line: 48, type: !13)
!565 = !DILocation(line: 48, column: 38, scope: !563)
!566 = !DILocalVariable(name: "right", arg: 2, scope: !563, file: !33, line: 48, type: !13)
!567 = !DILocation(line: 48, column: 52, scope: !563)
!568 = !DILocation(line: 50, column: 12, scope: !563)
!569 = !DILocation(line: 50, column: 19, scope: !563)
!570 = !DILocation(line: 50, column: 17, scope: !563)
!571 = !DILocation(line: 50, column: 25, scope: !563)
!572 = !DILocation(line: 50, column: 5, scope: !563)
!573 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !542, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!574 = !DILocalVariable(name: "left", arg: 1, scope: !573, file: !33, line: 54, type: !13)
!575 = !DILocation(line: 54, column: 38, scope: !573)
!576 = !DILocalVariable(name: "right", arg: 2, scope: !573, file: !33, line: 54, type: !13)
!577 = !DILocation(line: 54, column: 52, scope: !573)
!578 = !DILocation(line: 56, column: 12, scope: !573)
!579 = !DILocation(line: 56, column: 19, scope: !573)
!580 = !DILocation(line: 56, column: 17, scope: !573)
!581 = !DILocation(line: 56, column: 25, scope: !573)
!582 = !DILocation(line: 56, column: 5, scope: !573)
!583 = distinct !DISubprogram(name: "klee_alarm_s32_div_representable", scope: !33, file: !33, line: 30, type: !542, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!584 = !DILocalVariable(name: "numerator", arg: 1, scope: !583, file: !33, line: 30, type: !13)
!585 = !DILocation(line: 30, column: 46, scope: !583)
!586 = !DILocalVariable(name: "denominator", arg: 2, scope: !583, file: !33, line: 30, type: !13)
!587 = !DILocation(line: 30, column: 65, scope: !583)
!588 = !DILocation(line: 32, column: 14, scope: !583)
!589 = !DILocation(line: 32, column: 24, scope: !583)
!590 = !DILocation(line: 32, column: 37, scope: !583)
!591 = !DILocation(line: 32, column: 12, scope: !583)
!592 = !DILocation(line: 32, column: 5, scope: !583)
!593 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 429, type: !594, scopeLine: 430, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!594 = !DISubroutineType(types: !595)
!595 = !{!6, !6, !28}
!596 = !DILocalVariable(name: "numerator", arg: 1, scope: !593, file: !69, line: 429, type: !6)
!597 = !DILocation(line: 429, column: 31, scope: !593)
!598 = !DILocalVariable(name: "denominator", arg: 2, scope: !593, file: !69, line: 429, type: !28)
!599 = !DILocation(line: 429, column: 47, scope: !593)
!600 = !DILocalVariable(name: "u16Temp1", scope: !593, file: !69, line: 431, type: !28)
!601 = !DILocation(line: 431, column: 6, scope: !593)
!602 = !DILocalVariable(name: "s32Temp1", scope: !593, file: !69, line: 432, type: !16)
!603 = !DILocation(line: 432, column: 6, scope: !593)
!604 = !DILocalVariable(name: "s32Temp2", scope: !593, file: !69, line: 432, type: !16)
!605 = !DILocation(line: 432, column: 15, scope: !593)
!606 = !DILocation(line: 433, column: 13, scope: !593)
!607 = !DILocation(line: 433, column: 25, scope: !593)
!608 = !DILocation(line: 433, column: 11, scope: !593)
!609 = !DILocation(line: 434, column: 13, scope: !593)
!610 = !DILocation(line: 434, column: 22, scope: !593)
!611 = !DILocation(line: 434, column: 11, scope: !593)
!612 = !DILocation(line: 435, column: 5, scope: !613)
!613 = distinct !DILexicalBlock(scope: !593, file: !69, line: 435, column: 5)
!614 = !DILocation(line: 435, column: 14, scope: !613)
!615 = !DILocation(line: 435, column: 5, scope: !593)
!616 = !DILocation(line: 437, column: 7, scope: !617)
!617 = distinct !DILexicalBlock(scope: !618, file: !69, line: 437, column: 7)
!618 = distinct !DILexicalBlock(scope: !613, file: !69, line: 436, column: 2)
!619 = !DILocation(line: 437, column: 17, scope: !617)
!620 = !DILocation(line: 437, column: 7, scope: !618)
!621 = !DILocation(line: 439, column: 4, scope: !622)
!622 = distinct !DILexicalBlock(scope: !617, file: !69, line: 438, column: 3)
!623 = !DILocation(line: 443, column: 4, scope: !624)
!624 = distinct !DILexicalBlock(scope: !617, file: !69, line: 442, column: 3)
!625 = !DILocation(line: 448, column: 15, scope: !626)
!626 = distinct !DILexicalBlock(scope: !613, file: !69, line: 447, column: 2)
!627 = !DILocation(line: 448, column: 24, scope: !626)
!628 = !DILocation(line: 448, column: 32, scope: !626)
!629 = !DILocation(line: 448, column: 41, scope: !626)
!630 = !DILocation(line: 448, column: 47, scope: !626)
!631 = !DILocation(line: 448, column: 46, scope: !626)
!632 = !DILocation(line: 448, column: 57, scope: !626)
!633 = !DILocation(line: 448, column: 56, scope: !626)
!634 = !DILocation(line: 448, column: 29, scope: !626)
!635 = !DILocation(line: 448, column: 12, scope: !626)
!636 = !DILocation(line: 449, column: 14, scope: !626)
!637 = !DILocation(line: 449, column: 22, scope: !626)
!638 = !DILocation(line: 449, column: 12, scope: !626)
!639 = !DILocation(line: 450, column: 14, scope: !626)
!640 = !DILocation(line: 450, column: 23, scope: !626)
!641 = !DILocation(line: 450, column: 22, scope: !626)
!642 = !DILocation(line: 450, column: 12, scope: !626)
!643 = !DILocation(line: 451, column: 16, scope: !626)
!644 = !DILocation(line: 451, column: 25, scope: !626)
!645 = !DILocation(line: 451, column: 31, scope: !626)
!646 = !DILocation(line: 451, column: 30, scope: !626)
!647 = !DILocation(line: 451, column: 43, scope: !626)
!648 = !DILocation(line: 451, column: 41, scope: !626)
!649 = !DILocation(line: 451, column: 12, scope: !626)
!650 = !DILocation(line: 452, column: 6, scope: !651)
!651 = distinct !DILexicalBlock(scope: !626, file: !69, line: 452, column: 6)
!652 = !DILocation(line: 452, column: 15, scope: !651)
!653 = !DILocation(line: 452, column: 6, scope: !626)
!654 = !DILocation(line: 454, column: 7, scope: !655)
!655 = distinct !DILexicalBlock(scope: !656, file: !69, line: 454, column: 7)
!656 = distinct !DILexicalBlock(scope: !651, file: !69, line: 453, column: 3)
!657 = !DILocation(line: 454, column: 16, scope: !655)
!658 = !DILocation(line: 454, column: 7, scope: !656)
!659 = !DILocation(line: 456, column: 17, scope: !660)
!660 = distinct !DILexicalBlock(scope: !655, file: !69, line: 455, column: 4)
!661 = !DILocation(line: 456, column: 12, scope: !660)
!662 = !DILocation(line: 456, column: 5, scope: !660)
!663 = !DILocation(line: 460, column: 5, scope: !664)
!664 = distinct !DILexicalBlock(scope: !655, file: !69, line: 459, column: 4)
!665 = !DILocation(line: 465, column: 4, scope: !666)
!666 = distinct !DILexicalBlock(scope: !651, file: !69, line: 464, column: 3)
!667 = !DILocation(line: 468, column: 1, scope: !593)
!668 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 485, type: !594, scopeLine: 486, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!669 = !DILocalVariable(name: "numerator", arg: 1, scope: !668, file: !69, line: 485, type: !6)
!670 = !DILocation(line: 485, column: 30, scope: !668)
!671 = !DILocalVariable(name: "denominator", arg: 2, scope: !668, file: !69, line: 485, type: !28)
!672 = !DILocation(line: 485, column: 45, scope: !668)
!673 = !DILocalVariable(name: "u16Temp1", scope: !668, file: !69, line: 487, type: !28)
!674 = !DILocation(line: 487, column: 6, scope: !668)
!675 = !DILocalVariable(name: "s32Temp1", scope: !668, file: !69, line: 488, type: !16)
!676 = !DILocation(line: 488, column: 6, scope: !668)
!677 = !DILocation(line: 489, column: 13, scope: !668)
!678 = !DILocation(line: 489, column: 25, scope: !668)
!679 = !DILocation(line: 489, column: 11, scope: !668)
!680 = !DILocation(line: 490, column: 5, scope: !681)
!681 = distinct !DILexicalBlock(scope: !668, file: !69, line: 490, column: 5)
!682 = !DILocation(line: 490, column: 13, scope: !681)
!683 = !DILocation(line: 490, column: 5, scope: !668)
!684 = !DILocation(line: 492, column: 6, scope: !685)
!685 = distinct !DILexicalBlock(scope: !686, file: !69, line: 492, column: 6)
!686 = distinct !DILexicalBlock(scope: !681, file: !69, line: 491, column: 2)
!687 = !DILocation(line: 492, column: 15, scope: !685)
!688 = !DILocation(line: 492, column: 6, scope: !686)
!689 = !DILocation(line: 494, column: 4, scope: !690)
!690 = distinct !DILexicalBlock(scope: !685, file: !69, line: 493, column: 3)
!691 = !DILocation(line: 498, column: 4, scope: !692)
!692 = distinct !DILexicalBlock(scope: !685, file: !69, line: 497, column: 3)
!693 = !DILocation(line: 504, column: 15, scope: !694)
!694 = distinct !DILexicalBlock(scope: !681, file: !69, line: 503, column: 2)
!695 = !DILocation(line: 504, column: 27, scope: !694)
!696 = !DILocation(line: 504, column: 37, scope: !694)
!697 = !DILocation(line: 504, column: 36, scope: !694)
!698 = !DILocation(line: 504, column: 49, scope: !694)
!699 = !DILocation(line: 504, column: 47, scope: !694)
!700 = !DILocation(line: 504, column: 25, scope: !694)
!701 = !DILocation(line: 504, column: 59, scope: !694)
!702 = !DILocation(line: 504, column: 12, scope: !694)
!703 = !DILocation(line: 505, column: 15, scope: !694)
!704 = !DILocation(line: 505, column: 24, scope: !694)
!705 = !DILocation(line: 505, column: 23, scope: !694)
!706 = !DILocation(line: 505, column: 37, scope: !694)
!707 = !DILocation(line: 505, column: 47, scope: !694)
!708 = !DILocation(line: 505, column: 46, scope: !694)
!709 = !DILocation(line: 505, column: 34, scope: !694)
!710 = !DILocation(line: 505, column: 12, scope: !694)
!711 = !DILocation(line: 506, column: 10, scope: !694)
!712 = !DILocation(line: 506, column: 3, scope: !694)
!713 = !DILocation(line: 508, column: 1, scope: !668)
!714 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 526, type: !715, scopeLine: 527, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!715 = !DISubroutineType(types: !716)
!716 = !{!24, !28, !28}
!717 = !DILocalVariable(name: "numerator", arg: 1, scope: !714, file: !69, line: 526, type: !28)
!718 = !DILocation(line: 526, column: 28, scope: !714)
!719 = !DILocalVariable(name: "denominator", arg: 2, scope: !714, file: !69, line: 526, type: !28)
!720 = !DILocation(line: 526, column: 43, scope: !714)
!721 = !DILocalVariable(name: "u32Temp1", scope: !714, file: !69, line: 528, type: !722)
!722 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !20)
!723 = !DILocation(line: 528, column: 6, scope: !714)
!724 = !DILocalVariable(name: "u32Temp2", scope: !714, file: !69, line: 528, type: !722)
!725 = !DILocation(line: 528, column: 20, scope: !714)
!726 = !DILocalVariable(name: "u32Temp3", scope: !714, file: !69, line: 528, type: !722)
!727 = !DILocation(line: 528, column: 33, scope: !714)
!728 = !DILocation(line: 529, column: 5, scope: !729)
!729 = distinct !DILexicalBlock(scope: !714, file: !69, line: 529, column: 5)
!730 = !DILocation(line: 529, column: 16, scope: !729)
!731 = !DILocation(line: 529, column: 5, scope: !714)
!732 = !DILocation(line: 531, column: 3, scope: !733)
!733 = distinct !DILexicalBlock(scope: !729, file: !69, line: 530, column: 2)
!734 = !DILocation(line: 535, column: 15, scope: !735)
!735 = distinct !DILexicalBlock(scope: !729, file: !69, line: 534, column: 2)
!736 = !DILocation(line: 535, column: 24, scope: !735)
!737 = !DILocation(line: 535, column: 12, scope: !735)
!738 = !DILocation(line: 536, column: 14, scope: !735)
!739 = !DILocation(line: 536, column: 25, scope: !735)
!740 = !DILocation(line: 536, column: 23, scope: !735)
!741 = !DILocation(line: 536, column: 12, scope: !735)
!742 = !DILocation(line: 537, column: 15, scope: !735)
!743 = !DILocation(line: 537, column: 24, scope: !735)
!744 = !DILocation(line: 537, column: 32, scope: !735)
!745 = !DILocation(line: 537, column: 12, scope: !735)
!746 = !DILocation(line: 538, column: 6, scope: !747)
!747 = distinct !DILexicalBlock(scope: !735, file: !69, line: 538, column: 6)
!748 = !DILocation(line: 538, column: 15, scope: !747)
!749 = !DILocation(line: 538, column: 6, scope: !735)
!750 = !DILocation(line: 540, column: 15, scope: !751)
!751 = distinct !DILexicalBlock(scope: !747, file: !69, line: 539, column: 3)
!752 = !DILocation(line: 540, column: 11, scope: !751)
!753 = !DILocation(line: 540, column: 4, scope: !751)
!754 = !DILocation(line: 544, column: 4, scope: !755)
!755 = distinct !DILexicalBlock(scope: !747, file: !69, line: 543, column: 3)
!756 = !DILocation(line: 547, column: 1, scope: !714)
!757 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 564, type: !758, scopeLine: 565, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!758 = !DISubroutineType(types: !759)
!759 = !{!28, !16, !28}
!760 = !DILocalVariable(name: "x_value", arg: 1, scope: !757, file: !69, line: 564, type: !16)
!761 = !DILocation(line: 564, column: 25, scope: !757)
!762 = !DILocalVariable(name: "y_value", arg: 2, scope: !757, file: !69, line: 564, type: !28)
!763 = !DILocation(line: 564, column: 38, scope: !757)
!764 = !DILocalVariable(name: "s32Temp1", scope: !757, file: !69, line: 566, type: !16)
!765 = !DILocation(line: 566, column: 6, scope: !757)
!766 = !DILocation(line: 567, column: 12, scope: !757)
!767 = !DILocation(line: 567, column: 20, scope: !757)
!768 = !DILocation(line: 567, column: 10, scope: !757)
!769 = !DILocation(line: 568, column: 6, scope: !770)
!770 = distinct !DILexicalBlock(scope: !757, file: !69, line: 568, column: 5)
!771 = !DILocation(line: 568, column: 14, scope: !770)
!772 = !DILocation(line: 568, column: 24, scope: !770)
!773 = !DILocation(line: 568, column: 5, scope: !757)
!774 = !DILocation(line: 570, column: 6, scope: !775)
!775 = distinct !DILexicalBlock(scope: !776, file: !69, line: 570, column: 6)
!776 = distinct !DILexicalBlock(scope: !770, file: !69, line: 569, column: 2)
!777 = !DILocation(line: 570, column: 14, scope: !775)
!778 = !DILocation(line: 570, column: 6, scope: !776)
!779 = !DILocation(line: 572, column: 4, scope: !780)
!780 = distinct !DILexicalBlock(scope: !775, file: !69, line: 571, column: 3)
!781 = !DILocation(line: 576, column: 4, scope: !782)
!782 = distinct !DILexicalBlock(scope: !775, file: !69, line: 575, column: 3)
!783 = !DILocation(line: 581, column: 15, scope: !784)
!784 = distinct !DILexicalBlock(scope: !770, file: !69, line: 580, column: 2)
!785 = !DILocation(line: 581, column: 27, scope: !784)
!786 = !DILocation(line: 581, column: 35, scope: !784)
!787 = !DILocation(line: 581, column: 34, scope: !784)
!788 = !DILocation(line: 581, column: 46, scope: !784)
!789 = !DILocation(line: 581, column: 44, scope: !784)
!790 = !DILocation(line: 581, column: 23, scope: !784)
!791 = !DILocation(line: 581, column: 56, scope: !784)
!792 = !DILocation(line: 581, column: 12, scope: !784)
!793 = !DILocation(line: 582, column: 15, scope: !784)
!794 = !DILocation(line: 582, column: 24, scope: !784)
!795 = !DILocation(line: 582, column: 23, scope: !784)
!796 = !DILocation(line: 582, column: 36, scope: !784)
!797 = !DILocation(line: 582, column: 44, scope: !784)
!798 = !DILocation(line: 582, column: 43, scope: !784)
!799 = !DILocation(line: 582, column: 33, scope: !784)
!800 = !DILocation(line: 582, column: 12, scope: !784)
!801 = !DILocation(line: 583, column: 6, scope: !802)
!802 = distinct !DILexicalBlock(scope: !784, file: !69, line: 583, column: 6)
!803 = !DILocation(line: 583, column: 15, scope: !802)
!804 = !DILocation(line: 583, column: 6, scope: !784)
!805 = !DILocation(line: 585, column: 7, scope: !806)
!806 = distinct !DILexicalBlock(scope: !807, file: !69, line: 585, column: 7)
!807 = distinct !DILexicalBlock(scope: !802, file: !69, line: 584, column: 3)
!808 = !DILocation(line: 585, column: 16, scope: !806)
!809 = !DILocation(line: 585, column: 7, scope: !807)
!810 = !DILocation(line: 587, column: 17, scope: !811)
!811 = distinct !DILexicalBlock(scope: !806, file: !69, line: 586, column: 4)
!812 = !DILocation(line: 587, column: 12, scope: !811)
!813 = !DILocation(line: 587, column: 5, scope: !811)
!814 = !DILocation(line: 591, column: 5, scope: !815)
!815 = distinct !DILexicalBlock(scope: !806, file: !69, line: 590, column: 4)
!816 = !DILocation(line: 596, column: 4, scope: !817)
!817 = distinct !DILexicalBlock(scope: !802, file: !69, line: 595, column: 3)
!818 = !DILocation(line: 599, column: 1, scope: !757)
!819 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 617, type: !820, scopeLine: 618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!820 = !DISubroutineType(types: !821)
!821 = !{!28, !28, !28}
!822 = !DILocalVariable(name: "numerator", arg: 1, scope: !819, file: !69, line: 617, type: !28)
!823 = !DILocation(line: 617, column: 31, scope: !819)
!824 = !DILocalVariable(name: "denominator", arg: 2, scope: !819, file: !69, line: 617, type: !28)
!825 = !DILocation(line: 617, column: 46, scope: !819)
!826 = !DILocalVariable(name: "u32Temp", scope: !819, file: !69, line: 619, type: !722)
!827 = !DILocation(line: 619, column: 6, scope: !819)
!828 = !DILocation(line: 620, column: 5, scope: !829)
!829 = distinct !DILexicalBlock(scope: !819, file: !69, line: 620, column: 5)
!830 = !DILocation(line: 620, column: 17, scope: !829)
!831 = !DILocation(line: 620, column: 5, scope: !819)
!832 = !DILocation(line: 622, column: 3, scope: !833)
!833 = distinct !DILexicalBlock(scope: !829, file: !69, line: 621, column: 2)
!834 = !DILocation(line: 626, column: 14, scope: !835)
!835 = distinct !DILexicalBlock(scope: !829, file: !69, line: 625, column: 2)
!836 = !DILocation(line: 626, column: 23, scope: !835)
!837 = !DILocation(line: 626, column: 32, scope: !835)
!838 = !DILocation(line: 626, column: 44, scope: !835)
!839 = !DILocation(line: 626, column: 29, scope: !835)
!840 = !DILocation(line: 626, column: 11, scope: !835)
!841 = !DILocation(line: 627, column: 13, scope: !835)
!842 = !DILocation(line: 627, column: 21, scope: !835)
!843 = !DILocation(line: 627, column: 20, scope: !835)
!844 = !DILocation(line: 627, column: 11, scope: !835)
!845 = !DILocation(line: 628, column: 6, scope: !846)
!846 = distinct !DILexicalBlock(scope: !835, file: !69, line: 628, column: 6)
!847 = !DILocation(line: 628, column: 14, scope: !846)
!848 = !DILocation(line: 628, column: 6, scope: !835)
!849 = !DILocation(line: 630, column: 11, scope: !850)
!850 = distinct !DILexicalBlock(scope: !846, file: !69, line: 629, column: 3)
!851 = !DILocation(line: 630, column: 19, scope: !850)
!852 = !DILocation(line: 630, column: 4, scope: !850)
!853 = !DILocation(line: 634, column: 4, scope: !854)
!854 = distinct !DILexicalBlock(scope: !846, file: !69, line: 633, column: 3)
!855 = !DILocation(line: 638, column: 1, scope: !819)
!856 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 655, type: !857, scopeLine: 656, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!857 = !DISubroutineType(types: !858)
!858 = !{!28, !722, !28}
!859 = !DILocalVariable(name: "x_value", arg: 1, scope: !856, file: !69, line: 655, type: !722)
!860 = !DILocation(line: 655, column: 25, scope: !856)
!861 = !DILocalVariable(name: "y_value", arg: 2, scope: !856, file: !69, line: 655, type: !28)
!862 = !DILocation(line: 655, column: 38, scope: !856)
!863 = !DILocalVariable(name: "u32Temp1", scope: !856, file: !69, line: 657, type: !722)
!864 = !DILocation(line: 657, column: 6, scope: !856)
!865 = !DILocalVariable(name: "u32Temp2", scope: !856, file: !69, line: 657, type: !722)
!866 = !DILocation(line: 657, column: 17, scope: !856)
!867 = !DILocation(line: 658, column: 12, scope: !856)
!868 = !DILocation(line: 658, column: 20, scope: !856)
!869 = !DILocation(line: 658, column: 10, scope: !856)
!870 = !DILocation(line: 659, column: 5, scope: !871)
!871 = distinct !DILexicalBlock(scope: !856, file: !69, line: 659, column: 5)
!872 = !DILocation(line: 659, column: 13, scope: !871)
!873 = !DILocation(line: 659, column: 5, scope: !856)
!874 = !DILocation(line: 661, column: 3, scope: !875)
!875 = distinct !DILexicalBlock(scope: !871, file: !69, line: 660, column: 2)
!876 = !DILocation(line: 665, column: 14, scope: !877)
!877 = distinct !DILexicalBlock(scope: !871, file: !69, line: 664, column: 2)
!878 = !DILocation(line: 665, column: 22, scope: !877)
!879 = !DILocation(line: 665, column: 21, scope: !877)
!880 = !DILocation(line: 665, column: 12, scope: !877)
!881 = !DILocation(line: 666, column: 14, scope: !877)
!882 = !DILocation(line: 666, column: 25, scope: !877)
!883 = !DILocation(line: 666, column: 36, scope: !877)
!884 = !DILocation(line: 666, column: 34, scope: !877)
!885 = !DILocation(line: 666, column: 22, scope: !877)
!886 = !DILocation(line: 666, column: 45, scope: !877)
!887 = !DILocation(line: 666, column: 12, scope: !877)
!888 = !DILocation(line: 667, column: 15, scope: !877)
!889 = !DILocation(line: 667, column: 24, scope: !877)
!890 = !DILocation(line: 667, column: 23, scope: !877)
!891 = !DILocation(line: 667, column: 36, scope: !877)
!892 = !DILocation(line: 667, column: 44, scope: !877)
!893 = !DILocation(line: 667, column: 43, scope: !877)
!894 = !DILocation(line: 667, column: 33, scope: !877)
!895 = !DILocation(line: 667, column: 12, scope: !877)
!896 = !DILocation(line: 668, column: 6, scope: !897)
!897 = distinct !DILexicalBlock(scope: !877, file: !69, line: 668, column: 6)
!898 = !DILocation(line: 668, column: 15, scope: !897)
!899 = !DILocation(line: 668, column: 6, scope: !877)
!900 = !DILocation(line: 670, column: 11, scope: !901)
!901 = distinct !DILexicalBlock(scope: !897, file: !69, line: 669, column: 3)
!902 = !DILocation(line: 670, column: 20, scope: !901)
!903 = !DILocation(line: 670, column: 4, scope: !901)
!904 = !DILocation(line: 674, column: 4, scope: !905)
!905 = distinct !DILexicalBlock(scope: !897, file: !69, line: 673, column: 3)
!906 = !DILocation(line: 678, column: 1, scope: !856)
!907 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 697, type: !908, scopeLine: 698, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!908 = !DISubroutineType(types: !909)
!909 = !{!6, !6, !28, !6}
!910 = !DILocalVariable(name: "factor1", arg: 1, scope: !907, file: !69, line: 697, type: !6)
!911 = !DILocation(line: 697, column: 33, scope: !907)
!912 = !DILocalVariable(name: "factor2", arg: 2, scope: !907, file: !69, line: 697, type: !28)
!913 = !DILocation(line: 697, column: 46, scope: !907)
!914 = !DILocalVariable(name: "denominator", arg: 3, scope: !907, file: !69, line: 697, type: !6)
!915 = !DILocation(line: 697, column: 59, scope: !907)
!916 = !DILocalVariable(name: "s32Result", scope: !907, file: !69, line: 699, type: !16)
!917 = !DILocation(line: 699, column: 6, scope: !907)
!918 = !DILocalVariable(name: "s32Temp1", scope: !907, file: !69, line: 699, type: !16)
!919 = !DILocation(line: 699, column: 21, scope: !907)
!920 = !DILocation(line: 700, column: 14, scope: !907)
!921 = !DILocation(line: 700, column: 24, scope: !907)
!922 = !DILocation(line: 700, column: 22, scope: !907)
!923 = !DILocation(line: 700, column: 12, scope: !907)
!924 = !DILocation(line: 701, column: 5, scope: !925)
!925 = distinct !DILexicalBlock(scope: !907, file: !69, line: 701, column: 5)
!926 = !DILocation(line: 701, column: 17, scope: !925)
!927 = !DILocation(line: 701, column: 5, scope: !907)
!928 = !DILocation(line: 703, column: 6, scope: !929)
!929 = distinct !DILexicalBlock(scope: !930, file: !69, line: 703, column: 6)
!930 = distinct !DILexicalBlock(scope: !925, file: !69, line: 702, column: 2)
!931 = !DILocation(line: 703, column: 16, scope: !929)
!932 = !DILocation(line: 703, column: 6, scope: !930)
!933 = !DILocation(line: 705, column: 4, scope: !934)
!934 = distinct !DILexicalBlock(scope: !929, file: !69, line: 704, column: 3)
!935 = !DILocation(line: 709, column: 4, scope: !936)
!936 = distinct !DILexicalBlock(scope: !929, file: !69, line: 708, column: 3)
!937 = !DILocation(line: 714, column: 14, scope: !938)
!938 = distinct !DILexicalBlock(scope: !925, file: !69, line: 713, column: 2)
!939 = !DILocation(line: 714, column: 27, scope: !938)
!940 = !DILocation(line: 714, column: 37, scope: !938)
!941 = !DILocation(line: 714, column: 36, scope: !938)
!942 = !DILocation(line: 714, column: 50, scope: !938)
!943 = !DILocation(line: 714, column: 49, scope: !938)
!944 = !DILocation(line: 714, column: 24, scope: !938)
!945 = !DILocation(line: 714, column: 12, scope: !938)
!946 = !DILocation(line: 715, column: 14, scope: !938)
!947 = !DILocation(line: 715, column: 23, scope: !938)
!948 = !DILocation(line: 715, column: 12, scope: !938)
!949 = !DILocation(line: 716, column: 16, scope: !938)
!950 = !DILocation(line: 716, column: 25, scope: !938)
!951 = !DILocation(line: 716, column: 24, scope: !938)
!952 = !DILocation(line: 716, column: 41, scope: !938)
!953 = !DILocation(line: 716, column: 51, scope: !938)
!954 = !DILocation(line: 716, column: 50, scope: !938)
!955 = !DILocation(line: 716, column: 38, scope: !938)
!956 = !DILocation(line: 716, column: 13, scope: !938)
!957 = !DILocation(line: 717, column: 6, scope: !958)
!958 = distinct !DILexicalBlock(scope: !938, file: !69, line: 717, column: 6)
!959 = !DILocation(line: 717, column: 16, scope: !958)
!960 = !DILocation(line: 717, column: 6, scope: !938)
!961 = !DILocation(line: 719, column: 7, scope: !962)
!962 = distinct !DILexicalBlock(scope: !963, file: !69, line: 719, column: 7)
!963 = distinct !DILexicalBlock(scope: !958, file: !69, line: 718, column: 3)
!964 = !DILocation(line: 719, column: 17, scope: !962)
!965 = !DILocation(line: 719, column: 7, scope: !963)
!966 = !DILocation(line: 721, column: 17, scope: !967)
!967 = distinct !DILexicalBlock(scope: !962, file: !69, line: 720, column: 4)
!968 = !DILocation(line: 721, column: 12, scope: !967)
!969 = !DILocation(line: 721, column: 5, scope: !967)
!970 = !DILocation(line: 726, column: 5, scope: !971)
!971 = distinct !DILexicalBlock(scope: !962, file: !69, line: 725, column: 4)
!972 = !DILocation(line: 731, column: 4, scope: !973)
!973 = distinct !DILexicalBlock(scope: !958, file: !69, line: 730, column: 3)
!974 = !DILocation(line: 735, column: 1, scope: !907)
!975 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 753, type: !976, scopeLine: 754, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!976 = !DISubroutineType(types: !977)
!977 = !{!6, !28, !6, !28}
!978 = !DILocalVariable(name: "factor1", arg: 1, scope: !975, file: !69, line: 753, type: !28)
!979 = !DILocation(line: 753, column: 33, scope: !975)
!980 = !DILocalVariable(name: "factor2", arg: 2, scope: !975, file: !69, line: 753, type: !6)
!981 = !DILocation(line: 753, column: 46, scope: !975)
!982 = !DILocalVariable(name: "denominator", arg: 3, scope: !975, file: !69, line: 753, type: !28)
!983 = !DILocation(line: 753, column: 59, scope: !975)
!984 = !DILocalVariable(name: "s32Result", scope: !975, file: !69, line: 755, type: !16)
!985 = !DILocation(line: 755, column: 6, scope: !975)
!986 = !DILocalVariable(name: "s32Temp1", scope: !975, file: !69, line: 755, type: !16)
!987 = !DILocation(line: 755, column: 21, scope: !975)
!988 = !DILocation(line: 756, column: 14, scope: !975)
!989 = !DILocation(line: 756, column: 24, scope: !975)
!990 = !DILocation(line: 756, column: 22, scope: !975)
!991 = !DILocation(line: 756, column: 12, scope: !975)
!992 = !DILocation(line: 757, column: 5, scope: !993)
!993 = distinct !DILexicalBlock(scope: !975, file: !69, line: 757, column: 5)
!994 = !DILocation(line: 757, column: 16, scope: !993)
!995 = !DILocation(line: 757, column: 5, scope: !975)
!996 = !DILocation(line: 759, column: 6, scope: !997)
!997 = distinct !DILexicalBlock(scope: !998, file: !69, line: 759, column: 6)
!998 = distinct !DILexicalBlock(scope: !993, file: !69, line: 758, column: 2)
!999 = !DILocation(line: 759, column: 16, scope: !997)
!1000 = !DILocation(line: 759, column: 6, scope: !998)
!1001 = !DILocation(line: 761, column: 4, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !997, file: !69, line: 760, column: 3)
!1003 = !DILocation(line: 765, column: 4, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !997, file: !69, line: 764, column: 3)
!1005 = !DILocation(line: 770, column: 14, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !993, file: !69, line: 769, column: 2)
!1007 = !DILocation(line: 770, column: 28, scope: !1006)
!1008 = !DILocation(line: 770, column: 38, scope: !1006)
!1009 = !DILocation(line: 770, column: 37, scope: !1006)
!1010 = !DILocation(line: 770, column: 53, scope: !1006)
!1011 = !DILocation(line: 770, column: 51, scope: !1006)
!1012 = !DILocation(line: 770, column: 24, scope: !1006)
!1013 = !DILocation(line: 770, column: 66, scope: !1006)
!1014 = !DILocation(line: 770, column: 12, scope: !1006)
!1015 = !DILocation(line: 771, column: 16, scope: !1006)
!1016 = !DILocation(line: 771, column: 25, scope: !1006)
!1017 = !DILocation(line: 771, column: 24, scope: !1006)
!1018 = !DILocation(line: 771, column: 41, scope: !1006)
!1019 = !DILocation(line: 771, column: 51, scope: !1006)
!1020 = !DILocation(line: 771, column: 50, scope: !1006)
!1021 = !DILocation(line: 771, column: 38, scope: !1006)
!1022 = !DILocation(line: 771, column: 13, scope: !1006)
!1023 = !DILocation(line: 772, column: 6, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1006, file: !69, line: 772, column: 6)
!1025 = !DILocation(line: 772, column: 16, scope: !1024)
!1026 = !DILocation(line: 772, column: 6, scope: !1006)
!1027 = !DILocation(line: 774, column: 7, scope: !1028)
!1028 = distinct !DILexicalBlock(scope: !1029, file: !69, line: 774, column: 7)
!1029 = distinct !DILexicalBlock(scope: !1024, file: !69, line: 773, column: 3)
!1030 = !DILocation(line: 774, column: 17, scope: !1028)
!1031 = !DILocation(line: 774, column: 7, scope: !1029)
!1032 = !DILocation(line: 776, column: 17, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1028, file: !69, line: 775, column: 4)
!1034 = !DILocation(line: 776, column: 12, scope: !1033)
!1035 = !DILocation(line: 776, column: 5, scope: !1033)
!1036 = !DILocation(line: 780, column: 5, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1028, file: !69, line: 779, column: 4)
!1038 = !DILocation(line: 785, column: 4, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1024, file: !69, line: 784, column: 3)
!1040 = !DILocation(line: 788, column: 1, scope: !975)
!1041 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 807, type: !1042, scopeLine: 808, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1042 = !DISubroutineType(types: !1043)
!1043 = !{!28, !6, !28, !6}
!1044 = !DILocalVariable(name: "factor1", arg: 1, scope: !1041, file: !69, line: 807, type: !6)
!1045 = !DILocation(line: 807, column: 33, scope: !1041)
!1046 = !DILocalVariable(name: "factor2", arg: 2, scope: !1041, file: !69, line: 807, type: !28)
!1047 = !DILocation(line: 807, column: 46, scope: !1041)
!1048 = !DILocalVariable(name: "denominator", arg: 3, scope: !1041, file: !69, line: 807, type: !6)
!1049 = !DILocation(line: 807, column: 59, scope: !1041)
!1050 = !DILocalVariable(name: "u32Result", scope: !1041, file: !69, line: 809, type: !722)
!1051 = !DILocation(line: 809, column: 6, scope: !1041)
!1052 = !DILocalVariable(name: "u32Temp1", scope: !1041, file: !69, line: 809, type: !722)
!1053 = !DILocation(line: 809, column: 21, scope: !1041)
!1054 = !DILocalVariable(name: "s32Result", scope: !1041, file: !69, line: 810, type: !16)
!1055 = !DILocation(line: 810, column: 6, scope: !1041)
!1056 = !DILocalVariable(name: "s32Temp1", scope: !1041, file: !69, line: 810, type: !16)
!1057 = !DILocation(line: 810, column: 21, scope: !1041)
!1058 = !DILocation(line: 811, column: 14, scope: !1041)
!1059 = !DILocation(line: 811, column: 24, scope: !1041)
!1060 = !DILocation(line: 811, column: 22, scope: !1041)
!1061 = !DILocation(line: 811, column: 12, scope: !1041)
!1062 = !DILocation(line: 813, column: 5, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1041, file: !69, line: 813, column: 5)
!1064 = !DILocation(line: 813, column: 17, scope: !1063)
!1065 = !DILocation(line: 813, column: 5, scope: !1041)
!1066 = !DILocation(line: 815, column: 6, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !1068, file: !69, line: 815, column: 6)
!1068 = distinct !DILexicalBlock(scope: !1063, file: !69, line: 814, column: 2)
!1069 = !DILocation(line: 815, column: 16, scope: !1067)
!1070 = !DILocation(line: 815, column: 6, scope: !1068)
!1071 = !DILocation(line: 817, column: 4, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1067, file: !69, line: 816, column: 3)
!1073 = !DILocation(line: 821, column: 4, scope: !1074)
!1074 = distinct !DILexicalBlock(scope: !1067, file: !69, line: 820, column: 3)
!1075 = !DILocation(line: 826, column: 15, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1063, file: !69, line: 825, column: 2)
!1077 = !DILocation(line: 826, column: 29, scope: !1076)
!1078 = !DILocation(line: 826, column: 39, scope: !1076)
!1079 = !DILocation(line: 826, column: 38, scope: !1076)
!1080 = !DILocation(line: 826, column: 54, scope: !1076)
!1081 = !DILocation(line: 826, column: 52, scope: !1076)
!1082 = !DILocation(line: 826, column: 25, scope: !1076)
!1083 = !DILocation(line: 826, column: 68, scope: !1076)
!1084 = !DILocation(line: 826, column: 12, scope: !1076)
!1085 = !DILocation(line: 827, column: 16, scope: !1076)
!1086 = !DILocation(line: 827, column: 25, scope: !1076)
!1087 = !DILocation(line: 827, column: 24, scope: !1076)
!1088 = !DILocation(line: 827, column: 41, scope: !1076)
!1089 = !DILocation(line: 827, column: 51, scope: !1076)
!1090 = !DILocation(line: 827, column: 50, scope: !1076)
!1091 = !DILocation(line: 827, column: 38, scope: !1076)
!1092 = !DILocation(line: 827, column: 13, scope: !1076)
!1093 = !DILocation(line: 828, column: 6, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1076, file: !69, line: 828, column: 6)
!1095 = !DILocation(line: 828, column: 16, scope: !1094)
!1096 = !DILocation(line: 828, column: 6, scope: !1076)
!1097 = !DILocation(line: 830, column: 7, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1099, file: !69, line: 830, column: 7)
!1099 = distinct !DILexicalBlock(scope: !1094, file: !69, line: 829, column: 3)
!1100 = !DILocation(line: 830, column: 17, scope: !1098)
!1101 = !DILocation(line: 830, column: 7, scope: !1099)
!1102 = !DILocation(line: 832, column: 17, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1098, file: !69, line: 831, column: 4)
!1104 = !DILocation(line: 832, column: 12, scope: !1103)
!1105 = !DILocation(line: 832, column: 5, scope: !1103)
!1106 = !DILocation(line: 836, column: 5, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1098, file: !69, line: 835, column: 4)
!1108 = !DILocation(line: 841, column: 4, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1094, file: !69, line: 840, column: 3)
!1110 = !DILocation(line: 844, column: 1, scope: !1041)
!1111 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 863, type: !1112, scopeLine: 864, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1112 = !DISubroutineType(types: !1113)
!1113 = !{!28, !6, !28, !28}
!1114 = !DILocalVariable(name: "factor1", arg: 1, scope: !1111, file: !69, line: 863, type: !6)
!1115 = !DILocation(line: 863, column: 33, scope: !1111)
!1116 = !DILocalVariable(name: "factor2", arg: 2, scope: !1111, file: !69, line: 863, type: !28)
!1117 = !DILocation(line: 863, column: 46, scope: !1111)
!1118 = !DILocalVariable(name: "denominator", arg: 3, scope: !1111, file: !69, line: 863, type: !28)
!1119 = !DILocation(line: 863, column: 59, scope: !1111)
!1120 = !DILocalVariable(name: "s32Result", scope: !1111, file: !69, line: 865, type: !16)
!1121 = !DILocation(line: 865, column: 6, scope: !1111)
!1122 = !DILocalVariable(name: "s32Temp1", scope: !1111, file: !69, line: 865, type: !16)
!1123 = !DILocation(line: 865, column: 21, scope: !1111)
!1124 = !DILocation(line: 866, column: 14, scope: !1111)
!1125 = !DILocation(line: 866, column: 24, scope: !1111)
!1126 = !DILocation(line: 866, column: 22, scope: !1111)
!1127 = !DILocation(line: 866, column: 12, scope: !1111)
!1128 = !DILocation(line: 868, column: 5, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1111, file: !69, line: 868, column: 5)
!1130 = !DILocation(line: 868, column: 17, scope: !1129)
!1131 = !DILocation(line: 868, column: 5, scope: !1111)
!1132 = !DILocation(line: 870, column: 6, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1134, file: !69, line: 870, column: 6)
!1134 = distinct !DILexicalBlock(scope: !1129, file: !69, line: 869, column: 2)
!1135 = !DILocation(line: 870, column: 16, scope: !1133)
!1136 = !DILocation(line: 870, column: 6, scope: !1134)
!1137 = !DILocation(line: 872, column: 4, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1133, file: !69, line: 871, column: 3)
!1139 = !DILocation(line: 876, column: 4, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1133, file: !69, line: 875, column: 3)
!1141 = !DILocation(line: 881, column: 15, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1129, file: !69, line: 880, column: 2)
!1143 = !DILocation(line: 881, column: 29, scope: !1142)
!1144 = !DILocation(line: 881, column: 39, scope: !1142)
!1145 = !DILocation(line: 881, column: 38, scope: !1142)
!1146 = !DILocation(line: 881, column: 54, scope: !1142)
!1147 = !DILocation(line: 881, column: 52, scope: !1142)
!1148 = !DILocation(line: 881, column: 25, scope: !1142)
!1149 = !DILocation(line: 881, column: 68, scope: !1142)
!1150 = !DILocation(line: 881, column: 12, scope: !1142)
!1151 = !DILocation(line: 882, column: 16, scope: !1142)
!1152 = !DILocation(line: 882, column: 25, scope: !1142)
!1153 = !DILocation(line: 882, column: 24, scope: !1142)
!1154 = !DILocation(line: 882, column: 41, scope: !1142)
!1155 = !DILocation(line: 882, column: 51, scope: !1142)
!1156 = !DILocation(line: 882, column: 50, scope: !1142)
!1157 = !DILocation(line: 882, column: 38, scope: !1142)
!1158 = !DILocation(line: 882, column: 13, scope: !1142)
!1159 = !DILocation(line: 883, column: 6, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1142, file: !69, line: 883, column: 6)
!1161 = !DILocation(line: 883, column: 16, scope: !1160)
!1162 = !DILocation(line: 883, column: 6, scope: !1142)
!1163 = !DILocation(line: 885, column: 7, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1165, file: !69, line: 885, column: 7)
!1165 = distinct !DILexicalBlock(scope: !1160, file: !69, line: 884, column: 3)
!1166 = !DILocation(line: 885, column: 17, scope: !1164)
!1167 = !DILocation(line: 885, column: 7, scope: !1165)
!1168 = !DILocation(line: 887, column: 17, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1164, file: !69, line: 886, column: 4)
!1170 = !DILocation(line: 887, column: 12, scope: !1169)
!1171 = !DILocation(line: 887, column: 5, scope: !1169)
!1172 = !DILocation(line: 891, column: 5, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1164, file: !69, line: 890, column: 4)
!1174 = !DILocation(line: 896, column: 4, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1160, file: !69, line: 895, column: 3)
!1176 = !DILocation(line: 900, column: 1, scope: !1111)
!1177 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 918, type: !1178, scopeLine: 919, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1178 = !DISubroutineType(types: !1179)
!1179 = !{!28, !28, !28, !28}
!1180 = !DILocalVariable(name: "factor1", arg: 1, scope: !1177, file: !69, line: 918, type: !28)
!1181 = !DILocation(line: 918, column: 33, scope: !1177)
!1182 = !DILocalVariable(name: "factor2", arg: 2, scope: !1177, file: !69, line: 918, type: !28)
!1183 = !DILocation(line: 918, column: 46, scope: !1177)
!1184 = !DILocalVariable(name: "denominator", arg: 3, scope: !1177, file: !69, line: 918, type: !28)
!1185 = !DILocation(line: 918, column: 59, scope: !1177)
!1186 = !DILocalVariable(name: "u32Temp1", scope: !1177, file: !69, line: 920, type: !722)
!1187 = !DILocation(line: 920, column: 6, scope: !1177)
!1188 = !DILocalVariable(name: "u16TempDenom", scope: !1177, file: !69, line: 921, type: !28)
!1189 = !DILocation(line: 921, column: 6, scope: !1177)
!1190 = !DILocation(line: 923, column: 5, scope: !1191)
!1191 = distinct !DILexicalBlock(scope: !1177, file: !69, line: 923, column: 5)
!1192 = !DILocation(line: 923, column: 17, scope: !1191)
!1193 = !DILocation(line: 923, column: 5, scope: !1177)
!1194 = !DILocation(line: 925, column: 3, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1191, file: !69, line: 924, column: 2)
!1196 = !DILocation(line: 929, column: 14, scope: !1197)
!1197 = distinct !DILexicalBlock(scope: !1191, file: !69, line: 928, column: 2)
!1198 = !DILocation(line: 929, column: 24, scope: !1197)
!1199 = !DILocation(line: 929, column: 22, scope: !1197)
!1200 = !DILocation(line: 929, column: 12, scope: !1197)
!1201 = !DILocation(line: 930, column: 18, scope: !1197)
!1202 = !DILocation(line: 930, column: 30, scope: !1197)
!1203 = !DILocation(line: 930, column: 16, scope: !1197)
!1204 = !DILocation(line: 931, column: 14, scope: !1197)
!1205 = !DILocation(line: 931, column: 25, scope: !1197)
!1206 = !DILocation(line: 931, column: 23, scope: !1197)
!1207 = !DILocation(line: 931, column: 12, scope: !1197)
!1208 = !DILocation(line: 932, column: 14, scope: !1197)
!1209 = !DILocation(line: 932, column: 25, scope: !1197)
!1210 = !DILocation(line: 932, column: 23, scope: !1197)
!1211 = !DILocation(line: 932, column: 12, scope: !1197)
!1212 = !DILocation(line: 933, column: 6, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1197, file: !69, line: 933, column: 6)
!1214 = !DILocation(line: 933, column: 15, scope: !1213)
!1215 = !DILocation(line: 933, column: 6, scope: !1197)
!1216 = !DILocation(line: 935, column: 12, scope: !1217)
!1217 = distinct !DILexicalBlock(scope: !1213, file: !69, line: 934, column: 3)
!1218 = !DILocation(line: 935, column: 21, scope: !1217)
!1219 = !DILocation(line: 935, column: 11, scope: !1217)
!1220 = !DILocation(line: 935, column: 4, scope: !1217)
!1221 = !DILocation(line: 940, column: 4, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !1213, file: !69, line: 939, column: 3)
!1223 = !DILocation(line: 945, column: 1, scope: !1177)
!1224 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 962, type: !1225, scopeLine: 963, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1225 = !DISubroutineType(types: !1226)
!1226 = !{!28, !28, !28, !722}
!1227 = !DILocalVariable(name: "factor1", arg: 1, scope: !1224, file: !69, line: 962, type: !28)
!1228 = !DILocation(line: 962, column: 33, scope: !1224)
!1229 = !DILocalVariable(name: "factor2", arg: 2, scope: !1224, file: !69, line: 962, type: !28)
!1230 = !DILocation(line: 962, column: 46, scope: !1224)
!1231 = !DILocalVariable(name: "denominator", arg: 3, scope: !1224, file: !69, line: 962, type: !722)
!1232 = !DILocation(line: 962, column: 59, scope: !1224)
!1233 = !DILocalVariable(name: "u32Temp1", scope: !1224, file: !69, line: 964, type: !722)
!1234 = !DILocation(line: 964, column: 6, scope: !1224)
!1235 = !DILocation(line: 965, column: 5, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1224, file: !69, line: 965, column: 5)
!1237 = !DILocation(line: 965, column: 17, scope: !1236)
!1238 = !DILocation(line: 965, column: 5, scope: !1224)
!1239 = !DILocation(line: 967, column: 3, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1236, file: !69, line: 966, column: 2)
!1241 = !DILocation(line: 971, column: 15, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1236, file: !69, line: 970, column: 2)
!1243 = !DILocation(line: 971, column: 25, scope: !1242)
!1244 = !DILocation(line: 971, column: 23, scope: !1242)
!1245 = !DILocation(line: 971, column: 36, scope: !1242)
!1246 = !DILocation(line: 971, column: 34, scope: !1242)
!1247 = !DILocation(line: 971, column: 12, scope: !1242)
!1248 = !DILocation(line: 972, column: 8, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1242, file: !69, line: 972, column: 6)
!1250 = !DILocation(line: 972, column: 18, scope: !1249)
!1251 = !DILocation(line: 972, column: 16, scope: !1249)
!1252 = !DILocation(line: 972, column: 28, scope: !1249)
!1253 = !DILocation(line: 972, column: 40, scope: !1249)
!1254 = !DILocation(line: 972, column: 39, scope: !1249)
!1255 = !DILocation(line: 972, column: 26, scope: !1249)
!1256 = !DILocation(line: 972, column: 53, scope: !1249)
!1257 = !DILocation(line: 972, column: 64, scope: !1249)
!1258 = !DILocation(line: 972, column: 50, scope: !1249)
!1259 = !DILocation(line: 972, column: 6, scope: !1242)
!1260 = !DILocation(line: 974, column: 12, scope: !1261)
!1261 = distinct !DILexicalBlock(scope: !1249, file: !69, line: 973, column: 3)
!1262 = !DILocation(line: 975, column: 3, scope: !1261)
!1263 = !DILocation(line: 976, column: 6, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1242, file: !69, line: 976, column: 6)
!1265 = !DILocation(line: 976, column: 15, scope: !1264)
!1266 = !DILocation(line: 976, column: 6, scope: !1242)
!1267 = !DILocation(line: 978, column: 12, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1264, file: !69, line: 977, column: 3)
!1269 = !DILocation(line: 978, column: 21, scope: !1268)
!1270 = !DILocation(line: 978, column: 11, scope: !1268)
!1271 = !DILocation(line: 978, column: 4, scope: !1268)
!1272 = !DILocation(line: 982, column: 4, scope: !1273)
!1273 = distinct !DILexicalBlock(scope: !1264, file: !69, line: 981, column: 3)
!1274 = !DILocation(line: 985, column: 1, scope: !1224)
!1275 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 1002, type: !1276, scopeLine: 1003, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1276 = !DISubroutineType(types: !1277)
!1277 = !{!722, !722, !28}
!1278 = !DILocalVariable(name: "x_value", arg: 1, scope: !1275, file: !69, line: 1002, type: !722)
!1279 = !DILocation(line: 1002, column: 25, scope: !1275)
!1280 = !DILocalVariable(name: "y_value", arg: 2, scope: !1275, file: !69, line: 1002, type: !28)
!1281 = !DILocation(line: 1002, column: 38, scope: !1275)
!1282 = !DILocalVariable(name: "u32Temp1", scope: !1275, file: !69, line: 1004, type: !722)
!1283 = !DILocation(line: 1004, column: 6, scope: !1275)
!1284 = !DILocation(line: 1005, column: 5, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1275, file: !69, line: 1005, column: 5)
!1286 = !DILocation(line: 1005, column: 13, scope: !1285)
!1287 = !DILocation(line: 1005, column: 5, scope: !1275)
!1288 = !DILocation(line: 1007, column: 3, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1285, file: !69, line: 1006, column: 2)
!1290 = !DILocation(line: 1011, column: 15, scope: !1291)
!1291 = distinct !DILexicalBlock(scope: !1285, file: !69, line: 1010, column: 2)
!1292 = !DILocation(line: 1011, column: 26, scope: !1291)
!1293 = !DILocation(line: 1011, column: 34, scope: !1291)
!1294 = !DILocation(line: 1011, column: 33, scope: !1291)
!1295 = !DILocation(line: 1011, column: 45, scope: !1291)
!1296 = !DILocation(line: 1011, column: 43, scope: !1291)
!1297 = !DILocation(line: 1011, column: 23, scope: !1291)
!1298 = !DILocation(line: 1011, column: 54, scope: !1291)
!1299 = !DILocation(line: 1011, column: 12, scope: !1291)
!1300 = !DILocation(line: 1012, column: 15, scope: !1291)
!1301 = !DILocation(line: 1012, column: 23, scope: !1291)
!1302 = !DILocation(line: 1012, column: 22, scope: !1291)
!1303 = !DILocation(line: 1012, column: 35, scope: !1291)
!1304 = !DILocation(line: 1012, column: 44, scope: !1291)
!1305 = !DILocation(line: 1012, column: 43, scope: !1291)
!1306 = !DILocation(line: 1012, column: 32, scope: !1291)
!1307 = !DILocation(line: 1012, column: 12, scope: !1291)
!1308 = !DILocation(line: 1013, column: 10, scope: !1291)
!1309 = !DILocation(line: 1013, column: 3, scope: !1291)
!1310 = !DILocation(line: 1015, column: 1, scope: !1275)
!1311 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 1033, type: !1312, scopeLine: 1034, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1312 = !DISubroutineType(types: !1313)
!1313 = !{!6, !6, !6, !6}
!1314 = !DILocalVariable(name: "fak1", arg: 1, scope: !1311, file: !69, line: 1033, type: !6)
!1315 = !DILocation(line: 1033, column: 33, scope: !1311)
!1316 = !DILocalVariable(name: "fak2", arg: 2, scope: !1311, file: !69, line: 1033, type: !6)
!1317 = !DILocation(line: 1033, column: 43, scope: !1311)
!1318 = !DILocalVariable(name: "div", arg: 3, scope: !1311, file: !69, line: 1033, type: !6)
!1319 = !DILocation(line: 1033, column: 53, scope: !1311)
!1320 = !DILocalVariable(name: "s32Temp1", scope: !1311, file: !69, line: 1035, type: !16)
!1321 = !DILocation(line: 1035, column: 6, scope: !1311)
!1322 = !DILocalVariable(name: "s32Temp2", scope: !1311, file: !69, line: 1035, type: !16)
!1323 = !DILocation(line: 1035, column: 20, scope: !1311)
!1324 = !DILocalVariable(name: "s32Temp3", scope: !1311, file: !69, line: 1035, type: !16)
!1325 = !DILocation(line: 1035, column: 34, scope: !1311)
!1326 = !DILocation(line: 1036, column: 13, scope: !1311)
!1327 = !DILocation(line: 1036, column: 20, scope: !1311)
!1328 = !DILocation(line: 1036, column: 18, scope: !1311)
!1329 = !DILocation(line: 1036, column: 11, scope: !1311)
!1330 = !DILocation(line: 1037, column: 5, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !1311, file: !69, line: 1037, column: 5)
!1332 = !DILocation(line: 1037, column: 9, scope: !1331)
!1333 = !DILocation(line: 1037, column: 5, scope: !1311)
!1334 = !DILocation(line: 1039, column: 6, scope: !1335)
!1335 = distinct !DILexicalBlock(scope: !1336, file: !69, line: 1039, column: 6)
!1336 = distinct !DILexicalBlock(scope: !1331, file: !69, line: 1038, column: 2)
!1337 = !DILocation(line: 1039, column: 15, scope: !1335)
!1338 = !DILocation(line: 1039, column: 6, scope: !1336)
!1339 = !DILocation(line: 1041, column: 4, scope: !1340)
!1340 = distinct !DILexicalBlock(scope: !1335, file: !69, line: 1040, column: 3)
!1341 = !DILocation(line: 1045, column: 4, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1335, file: !69, line: 1044, column: 3)
!1343 = !DILocation(line: 1050, column: 15, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1331, file: !69, line: 1049, column: 2)
!1345 = !DILocation(line: 1050, column: 28, scope: !1344)
!1346 = !DILocation(line: 1050, column: 39, scope: !1344)
!1347 = !DILocation(line: 1050, column: 37, scope: !1344)
!1348 = !DILocation(line: 1050, column: 46, scope: !1344)
!1349 = !DILocation(line: 1050, column: 44, scope: !1344)
!1350 = !DILocation(line: 1050, column: 24, scope: !1344)
!1351 = !DILocation(line: 1050, column: 52, scope: !1344)
!1352 = !DILocation(line: 1050, column: 12, scope: !1344)
!1353 = !DILocation(line: 1051, column: 15, scope: !1344)
!1354 = !DILocation(line: 1051, column: 24, scope: !1344)
!1355 = !DILocation(line: 1051, column: 23, scope: !1344)
!1356 = !DILocation(line: 1051, column: 32, scope: !1344)
!1357 = !DILocation(line: 1051, column: 41, scope: !1344)
!1358 = !DILocation(line: 1051, column: 40, scope: !1344)
!1359 = !DILocation(line: 1051, column: 29, scope: !1344)
!1360 = !DILocation(line: 1051, column: 12, scope: !1344)
!1361 = !DILocation(line: 1052, column: 6, scope: !1362)
!1362 = distinct !DILexicalBlock(scope: !1344, file: !69, line: 1052, column: 6)
!1363 = !DILocation(line: 1052, column: 15, scope: !1362)
!1364 = !DILocation(line: 1052, column: 6, scope: !1344)
!1365 = !DILocation(line: 1054, column: 7, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !1367, file: !69, line: 1054, column: 7)
!1367 = distinct !DILexicalBlock(scope: !1362, file: !69, line: 1053, column: 3)
!1368 = !DILocation(line: 1054, column: 16, scope: !1366)
!1369 = !DILocation(line: 1054, column: 7, scope: !1367)
!1370 = !DILocation(line: 1056, column: 17, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1366, file: !69, line: 1055, column: 4)
!1372 = !DILocation(line: 1056, column: 12, scope: !1371)
!1373 = !DILocation(line: 1056, column: 5, scope: !1371)
!1374 = !DILocation(line: 1060, column: 5, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1366, file: !69, line: 1059, column: 4)
!1376 = !DILocation(line: 1065, column: 4, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1362, file: !69, line: 1064, column: 3)
!1378 = !DILocation(line: 1068, column: 1, scope: !1311)
!1379 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1086, type: !1380, scopeLine: 1087, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1380 = !DISubroutineType(types: !1381)
!1381 = !{!6, !6, !6, !28}
!1382 = !DILocalVariable(name: "data1", arg: 1, scope: !1379, file: !69, line: 1086, type: !6)
!1383 = !DILocation(line: 1086, column: 33, scope: !1379)
!1384 = !DILocalVariable(name: "data2", arg: 2, scope: !1379, file: !69, line: 1086, type: !6)
!1385 = !DILocation(line: 1086, column: 43, scope: !1379)
!1386 = !DILocalVariable(name: "denominator", arg: 3, scope: !1379, file: !69, line: 1086, type: !28)
!1387 = !DILocation(line: 1086, column: 53, scope: !1379)
!1388 = !DILocalVariable(name: "s32Result", scope: !1379, file: !69, line: 1088, type: !16)
!1389 = !DILocation(line: 1088, column: 6, scope: !1379)
!1390 = !DILocalVariable(name: "s32Temp1", scope: !1379, file: !69, line: 1088, type: !16)
!1391 = !DILocation(line: 1088, column: 21, scope: !1379)
!1392 = !DILocation(line: 1089, column: 14, scope: !1379)
!1393 = !DILocation(line: 1089, column: 22, scope: !1379)
!1394 = !DILocation(line: 1089, column: 20, scope: !1379)
!1395 = !DILocation(line: 1089, column: 12, scope: !1379)
!1396 = !DILocation(line: 1091, column: 5, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1379, file: !69, line: 1091, column: 5)
!1398 = !DILocation(line: 1091, column: 17, scope: !1397)
!1399 = !DILocation(line: 1091, column: 5, scope: !1379)
!1400 = !DILocation(line: 1093, column: 6, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1402, file: !69, line: 1093, column: 6)
!1402 = distinct !DILexicalBlock(scope: !1397, file: !69, line: 1092, column: 2)
!1403 = !DILocation(line: 1093, column: 16, scope: !1401)
!1404 = !DILocation(line: 1093, column: 6, scope: !1402)
!1405 = !DILocation(line: 1095, column: 4, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1094, column: 3)
!1407 = !DILocation(line: 1097, column: 11, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1097, column: 11)
!1409 = !DILocation(line: 1097, column: 21, scope: !1408)
!1410 = !DILocation(line: 1097, column: 11, scope: !1401)
!1411 = !DILocation(line: 1099, column: 4, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1408, file: !69, line: 1098, column: 3)
!1413 = !DILocation(line: 1103, column: 4, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1408, file: !69, line: 1102, column: 3)
!1415 = !DILocation(line: 1108, column: 15, scope: !1416)
!1416 = distinct !DILexicalBlock(scope: !1397, file: !69, line: 1107, column: 2)
!1417 = !DILocation(line: 1108, column: 28, scope: !1416)
!1418 = !DILocation(line: 1108, column: 38, scope: !1416)
!1419 = !DILocation(line: 1108, column: 37, scope: !1416)
!1420 = !DILocation(line: 1108, column: 51, scope: !1416)
!1421 = !DILocation(line: 1108, column: 50, scope: !1416)
!1422 = !DILocation(line: 1108, column: 25, scope: !1416)
!1423 = !DILocation(line: 1108, column: 64, scope: !1416)
!1424 = !DILocation(line: 1108, column: 12, scope: !1416)
!1425 = !DILocation(line: 1109, column: 16, scope: !1416)
!1426 = !DILocation(line: 1109, column: 25, scope: !1416)
!1427 = !DILocation(line: 1109, column: 24, scope: !1416)
!1428 = !DILocation(line: 1109, column: 41, scope: !1416)
!1429 = !DILocation(line: 1109, column: 51, scope: !1416)
!1430 = !DILocation(line: 1109, column: 50, scope: !1416)
!1431 = !DILocation(line: 1109, column: 38, scope: !1416)
!1432 = !DILocation(line: 1109, column: 13, scope: !1416)
!1433 = !DILocation(line: 1110, column: 6, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1416, file: !69, line: 1110, column: 6)
!1435 = !DILocation(line: 1110, column: 16, scope: !1434)
!1436 = !DILocation(line: 1110, column: 6, scope: !1416)
!1437 = !DILocation(line: 1112, column: 7, scope: !1438)
!1438 = distinct !DILexicalBlock(scope: !1439, file: !69, line: 1112, column: 7)
!1439 = distinct !DILexicalBlock(scope: !1434, file: !69, line: 1111, column: 3)
!1440 = !DILocation(line: 1112, column: 17, scope: !1438)
!1441 = !DILocation(line: 1112, column: 7, scope: !1439)
!1442 = !DILocation(line: 1114, column: 17, scope: !1443)
!1443 = distinct !DILexicalBlock(scope: !1438, file: !69, line: 1113, column: 4)
!1444 = !DILocation(line: 1114, column: 12, scope: !1443)
!1445 = !DILocation(line: 1114, column: 5, scope: !1443)
!1446 = !DILocation(line: 1118, column: 5, scope: !1447)
!1447 = distinct !DILexicalBlock(scope: !1438, file: !69, line: 1117, column: 4)
!1448 = !DILocation(line: 1123, column: 4, scope: !1449)
!1449 = distinct !DILexicalBlock(scope: !1434, file: !69, line: 1122, column: 3)
!1450 = !DILocation(line: 1127, column: 1, scope: !1379)
!1451 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1144, type: !1452, scopeLine: 1145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1452 = !DISubroutineType(types: !1453)
!1453 = !{!722, !722, !16}
!1454 = !DILocalVariable(name: "numerator", arg: 1, scope: !1451, file: !69, line: 1144, type: !722)
!1455 = !DILocation(line: 1144, column: 25, scope: !1451)
!1456 = !DILocalVariable(name: "denominator", arg: 2, scope: !1451, file: !69, line: 1144, type: !16)
!1457 = !DILocation(line: 1144, column: 40, scope: !1451)
!1458 = !DILocalVariable(name: "u32Temp1", scope: !1451, file: !69, line: 1146, type: !722)
!1459 = !DILocation(line: 1146, column: 6, scope: !1451)
!1460 = !DILocation(line: 1147, column: 5, scope: !1461)
!1461 = distinct !DILexicalBlock(scope: !1451, file: !69, line: 1147, column: 5)
!1462 = !DILocation(line: 1147, column: 17, scope: !1461)
!1463 = !DILocation(line: 1147, column: 5, scope: !1451)
!1464 = !DILocation(line: 1149, column: 3, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1461, file: !69, line: 1148, column: 2)
!1466 = !DILocation(line: 1153, column: 6, scope: !1467)
!1467 = distinct !DILexicalBlock(scope: !1468, file: !69, line: 1153, column: 6)
!1468 = distinct !DILexicalBlock(scope: !1461, file: !69, line: 1152, column: 2)
!1469 = !DILocation(line: 1153, column: 18, scope: !1467)
!1470 = !DILocation(line: 1153, column: 6, scope: !1468)
!1471 = !DILocation(line: 1155, column: 4, scope: !1472)
!1472 = distinct !DILexicalBlock(scope: !1467, file: !69, line: 1154, column: 3)
!1473 = !DILocation(line: 1159, column: 16, scope: !1474)
!1474 = distinct !DILexicalBlock(scope: !1467, file: !69, line: 1158, column: 3)
!1475 = !DILocation(line: 1159, column: 30, scope: !1474)
!1476 = !DILocation(line: 1159, column: 40, scope: !1474)
!1477 = !DILocation(line: 1159, column: 39, scope: !1474)
!1478 = !DILocation(line: 1159, column: 55, scope: !1474)
!1479 = !DILocation(line: 1159, column: 53, scope: !1474)
!1480 = !DILocation(line: 1159, column: 26, scope: !1474)
!1481 = !DILocation(line: 1159, column: 68, scope: !1474)
!1482 = !DILocation(line: 1159, column: 13, scope: !1474)
!1483 = !DILocation(line: 1160, column: 16, scope: !1474)
!1484 = !DILocation(line: 1160, column: 25, scope: !1474)
!1485 = !DILocation(line: 1160, column: 24, scope: !1474)
!1486 = !DILocation(line: 1160, column: 41, scope: !1474)
!1487 = !DILocation(line: 1160, column: 51, scope: !1474)
!1488 = !DILocation(line: 1160, column: 50, scope: !1474)
!1489 = !DILocation(line: 1160, column: 38, scope: !1474)
!1490 = !DILocation(line: 1160, column: 13, scope: !1474)
!1491 = !DILocation(line: 1161, column: 11, scope: !1474)
!1492 = !DILocation(line: 1161, column: 4, scope: !1474)
!1493 = !DILocation(line: 1164, column: 1, scope: !1451)
!1494 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1181, type: !1495, scopeLine: 1182, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1495 = !DISubroutineType(types: !1496)
!1496 = !{!722, !16, !722}
!1497 = !DILocalVariable(name: "numerator", arg: 1, scope: !1494, file: !69, line: 1181, type: !16)
!1498 = !DILocation(line: 1181, column: 25, scope: !1494)
!1499 = !DILocalVariable(name: "denominator", arg: 2, scope: !1494, file: !69, line: 1181, type: !722)
!1500 = !DILocation(line: 1181, column: 40, scope: !1494)
!1501 = !DILocalVariable(name: "s32Temp1", scope: !1494, file: !69, line: 1183, type: !16)
!1502 = !DILocation(line: 1183, column: 6, scope: !1494)
!1503 = !DILocation(line: 1184, column: 5, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1494, file: !69, line: 1184, column: 5)
!1505 = !DILocation(line: 1184, column: 17, scope: !1504)
!1506 = !DILocation(line: 1184, column: 5, scope: !1494)
!1507 = !DILocation(line: 1186, column: 6, scope: !1508)
!1508 = distinct !DILexicalBlock(scope: !1509, file: !69, line: 1186, column: 6)
!1509 = distinct !DILexicalBlock(scope: !1504, file: !69, line: 1185, column: 2)
!1510 = !DILocation(line: 1186, column: 16, scope: !1508)
!1511 = !DILocation(line: 1186, column: 6, scope: !1509)
!1512 = !DILocation(line: 1188, column: 4, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1508, file: !69, line: 1187, column: 3)
!1514 = !DILocation(line: 1192, column: 4, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1508, file: !69, line: 1191, column: 3)
!1516 = !DILocation(line: 1197, column: 6, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1518, file: !69, line: 1197, column: 6)
!1518 = distinct !DILexicalBlock(scope: !1504, file: !69, line: 1196, column: 2)
!1519 = !DILocation(line: 1197, column: 16, scope: !1517)
!1520 = !DILocation(line: 1197, column: 6, scope: !1518)
!1521 = !DILocation(line: 1199, column: 17, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1517, file: !69, line: 1198, column: 3)
!1523 = !DILocation(line: 1199, column: 31, scope: !1522)
!1524 = !DILocation(line: 1199, column: 41, scope: !1522)
!1525 = !DILocation(line: 1199, column: 40, scope: !1522)
!1526 = !DILocation(line: 1199, column: 56, scope: !1522)
!1527 = !DILocation(line: 1199, column: 54, scope: !1522)
!1528 = !DILocation(line: 1199, column: 27, scope: !1522)
!1529 = !DILocation(line: 1199, column: 69, scope: !1522)
!1530 = !DILocation(line: 1199, column: 13, scope: !1522)
!1531 = !DILocation(line: 1200, column: 13, scope: !1522)
!1532 = !DILocation(line: 1200, column: 23, scope: !1522)
!1533 = !DILocation(line: 1200, column: 22, scope: !1522)
!1534 = !DILocation(line: 1200, column: 39, scope: !1522)
!1535 = !DILocation(line: 1200, column: 48, scope: !1522)
!1536 = !DILocation(line: 1200, column: 47, scope: !1522)
!1537 = !DILocation(line: 1200, column: 36, scope: !1522)
!1538 = !DILocation(line: 1200, column: 4, scope: !1522)
!1539 = !DILocation(line: 1204, column: 4, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1517, file: !69, line: 1203, column: 3)
!1541 = !DILocation(line: 1207, column: 1, scope: !1494)
!1542 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1224, type: !1543, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1543 = !DISubroutineType(types: !1544)
!1544 = !{!722, !16, !16}
!1545 = !DILocalVariable(name: "numerator", arg: 1, scope: !1542, file: !69, line: 1224, type: !16)
!1546 = !DILocation(line: 1224, column: 25, scope: !1542)
!1547 = !DILocalVariable(name: "denominator", arg: 2, scope: !1542, file: !69, line: 1224, type: !16)
!1548 = !DILocation(line: 1224, column: 40, scope: !1542)
!1549 = !DILocalVariable(name: "u32Temp1", scope: !1542, file: !69, line: 1226, type: !722)
!1550 = !DILocation(line: 1226, column: 6, scope: !1542)
!1551 = !DILocalVariable(name: "u32Temp2", scope: !1542, file: !69, line: 1226, type: !722)
!1552 = !DILocation(line: 1226, column: 20, scope: !1542)
!1553 = !DILocation(line: 1227, column: 5, scope: !1554)
!1554 = distinct !DILexicalBlock(scope: !1542, file: !69, line: 1227, column: 5)
!1555 = !DILocation(line: 1227, column: 17, scope: !1554)
!1556 = !DILocation(line: 1227, column: 5, scope: !1542)
!1557 = !DILocation(line: 1229, column: 6, scope: !1558)
!1558 = distinct !DILexicalBlock(scope: !1559, file: !69, line: 1229, column: 6)
!1559 = distinct !DILexicalBlock(scope: !1554, file: !69, line: 1228, column: 2)
!1560 = !DILocation(line: 1229, column: 16, scope: !1558)
!1561 = !DILocation(line: 1229, column: 6, scope: !1559)
!1562 = !DILocation(line: 1231, column: 4, scope: !1563)
!1563 = distinct !DILexicalBlock(scope: !1558, file: !69, line: 1230, column: 3)
!1564 = !DILocation(line: 1235, column: 4, scope: !1565)
!1565 = distinct !DILexicalBlock(scope: !1558, file: !69, line: 1234, column: 3)
!1566 = !DILocation(line: 1240, column: 6, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1568, file: !69, line: 1240, column: 6)
!1568 = distinct !DILexicalBlock(scope: !1554, file: !69, line: 1239, column: 2)
!1569 = !DILocation(line: 1240, column: 16, scope: !1567)
!1570 = !DILocation(line: 1240, column: 6, scope: !1568)
!1571 = !DILocation(line: 1242, column: 7, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1573, file: !69, line: 1242, column: 7)
!1573 = distinct !DILexicalBlock(scope: !1567, file: !69, line: 1241, column: 3)
!1574 = !DILocation(line: 1242, column: 17, scope: !1572)
!1575 = !DILocation(line: 1242, column: 7, scope: !1573)
!1576 = !DILocation(line: 1244, column: 5, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1572, file: !69, line: 1243, column: 4)
!1578 = !DILocation(line: 1248, column: 8, scope: !1579)
!1579 = distinct !DILexicalBlock(scope: !1580, file: !69, line: 1248, column: 8)
!1580 = distinct !DILexicalBlock(scope: !1572, file: !69, line: 1247, column: 4)
!1581 = !DILocation(line: 1248, column: 20, scope: !1579)
!1582 = !DILocation(line: 1248, column: 8, scope: !1580)
!1583 = !DILocation(line: 1250, column: 6, scope: !1584)
!1584 = distinct !DILexicalBlock(scope: !1579, file: !69, line: 1249, column: 5)
!1585 = !DILocation(line: 1254, column: 18, scope: !1586)
!1586 = distinct !DILexicalBlock(scope: !1579, file: !69, line: 1253, column: 5)
!1587 = !DILocation(line: 1254, column: 32, scope: !1586)
!1588 = !DILocation(line: 1254, column: 42, scope: !1586)
!1589 = !DILocation(line: 1254, column: 41, scope: !1586)
!1590 = !DILocation(line: 1254, column: 57, scope: !1586)
!1591 = !DILocation(line: 1254, column: 55, scope: !1586)
!1592 = !DILocation(line: 1254, column: 28, scope: !1586)
!1593 = !DILocation(line: 1254, column: 71, scope: !1586)
!1594 = !DILocation(line: 1254, column: 15, scope: !1586)
!1595 = !DILocation(line: 1255, column: 18, scope: !1586)
!1596 = !DILocation(line: 1255, column: 29, scope: !1586)
!1597 = !DILocation(line: 1255, column: 27, scope: !1586)
!1598 = !DILocation(line: 1255, column: 45, scope: !1586)
!1599 = !DILocation(line: 1255, column: 57, scope: !1586)
!1600 = !DILocation(line: 1255, column: 55, scope: !1586)
!1601 = !DILocation(line: 1255, column: 42, scope: !1586)
!1602 = !DILocation(line: 1255, column: 15, scope: !1586)
!1603 = !DILocation(line: 1256, column: 13, scope: !1586)
!1604 = !DILocation(line: 1256, column: 6, scope: !1586)
!1605 = !DILocation(line: 1262, column: 7, scope: !1606)
!1606 = distinct !DILexicalBlock(scope: !1607, file: !69, line: 1262, column: 7)
!1607 = distinct !DILexicalBlock(scope: !1567, file: !69, line: 1261, column: 3)
!1608 = !DILocation(line: 1262, column: 19, scope: !1606)
!1609 = !DILocation(line: 1262, column: 7, scope: !1607)
!1610 = !DILocation(line: 1264, column: 5, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1606, file: !69, line: 1263, column: 4)
!1612 = !DILocation(line: 1268, column: 18, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1606, file: !69, line: 1267, column: 4)
!1614 = !DILocation(line: 1268, column: 17, scope: !1613)
!1615 = !DILocation(line: 1268, column: 15, scope: !1613)
!1616 = !DILocation(line: 1269, column: 20, scope: !1613)
!1617 = !DILocation(line: 1269, column: 19, scope: !1613)
!1618 = !DILocation(line: 1269, column: 17, scope: !1613)
!1619 = !DILocation(line: 1270, column: 17, scope: !1613)
!1620 = !DILocation(line: 1270, column: 31, scope: !1613)
!1621 = !DILocation(line: 1270, column: 41, scope: !1613)
!1622 = !DILocation(line: 1270, column: 40, scope: !1613)
!1623 = !DILocation(line: 1270, column: 56, scope: !1613)
!1624 = !DILocation(line: 1270, column: 54, scope: !1613)
!1625 = !DILocation(line: 1270, column: 27, scope: !1613)
!1626 = !DILocation(line: 1270, column: 70, scope: !1613)
!1627 = !DILocation(line: 1270, column: 14, scope: !1613)
!1628 = !DILocation(line: 1271, column: 17, scope: !1613)
!1629 = !DILocation(line: 1271, column: 28, scope: !1613)
!1630 = !DILocation(line: 1271, column: 26, scope: !1613)
!1631 = !DILocation(line: 1271, column: 44, scope: !1613)
!1632 = !DILocation(line: 1271, column: 56, scope: !1613)
!1633 = !DILocation(line: 1271, column: 54, scope: !1613)
!1634 = !DILocation(line: 1271, column: 41, scope: !1613)
!1635 = !DILocation(line: 1271, column: 14, scope: !1613)
!1636 = !DILocation(line: 1272, column: 12, scope: !1613)
!1637 = !DILocation(line: 1272, column: 5, scope: !1613)
!1638 = !DILocation(line: 1277, column: 1, scope: !1542)
!1639 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1294, type: !1640, scopeLine: 1295, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1640 = !DISubroutineType(types: !1641)
!1641 = !{!722, !722, !722}
!1642 = !DILocalVariable(name: "numerator", arg: 1, scope: !1639, file: !69, line: 1294, type: !722)
!1643 = !DILocation(line: 1294, column: 25, scope: !1639)
!1644 = !DILocalVariable(name: "denominator", arg: 2, scope: !1639, file: !69, line: 1294, type: !722)
!1645 = !DILocation(line: 1294, column: 40, scope: !1639)
!1646 = !DILocalVariable(name: "u32Temp1", scope: !1639, file: !69, line: 1297, type: !722)
!1647 = !DILocation(line: 1297, column: 6, scope: !1639)
!1648 = !DILocalVariable(name: "u32Temp2", scope: !1639, file: !69, line: 1297, type: !722)
!1649 = !DILocation(line: 1297, column: 20, scope: !1639)
!1650 = !DILocalVariable(name: "u32Temp3", scope: !1639, file: !69, line: 1297, type: !722)
!1651 = !DILocation(line: 1297, column: 34, scope: !1639)
!1652 = !DILocalVariable(name: "numerator_old", scope: !1639, file: !69, line: 1297, type: !722)
!1653 = !DILocation(line: 1297, column: 48, scope: !1639)
!1654 = !DILocation(line: 1298, column: 5, scope: !1655)
!1655 = distinct !DILexicalBlock(scope: !1639, file: !69, line: 1298, column: 5)
!1656 = !DILocation(line: 1298, column: 16, scope: !1655)
!1657 = !DILocation(line: 1298, column: 5, scope: !1639)
!1658 = !DILocation(line: 1300, column: 3, scope: !1659)
!1659 = distinct !DILexicalBlock(scope: !1655, file: !69, line: 1299, column: 2)
!1660 = !DILocation(line: 1304, column: 14, scope: !1661)
!1661 = distinct !DILexicalBlock(scope: !1655, file: !69, line: 1303, column: 2)
!1662 = !DILocation(line: 1304, column: 26, scope: !1661)
!1663 = !DILocation(line: 1304, column: 41, scope: !1661)
!1664 = !DILocation(line: 1304, column: 51, scope: !1661)
!1665 = !DILocation(line: 1304, column: 50, scope: !1661)
!1666 = !DILocation(line: 1304, column: 38, scope: !1661)
!1667 = !DILocation(line: 1304, column: 24, scope: !1661)
!1668 = !DILocation(line: 1304, column: 12, scope: !1661)
!1669 = !DILocation(line: 1305, column: 7, scope: !1670)
!1670 = distinct !DILexicalBlock(scope: !1661, file: !69, line: 1305, column: 6)
!1671 = !DILocation(line: 1305, column: 16, scope: !1670)
!1672 = !DILocation(line: 1305, column: 24, scope: !1670)
!1673 = !DILocation(line: 1305, column: 6, scope: !1661)
!1674 = !DILocation(line: 1307, column: 16, scope: !1675)
!1675 = distinct !DILexicalBlock(scope: !1670, file: !69, line: 1306, column: 3)
!1676 = !DILocation(line: 1307, column: 27, scope: !1675)
!1677 = !DILocation(line: 1307, column: 13, scope: !1675)
!1678 = !DILocation(line: 1308, column: 3, scope: !1675)
!1679 = !DILocation(line: 1311, column: 16, scope: !1680)
!1680 = distinct !DILexicalBlock(scope: !1670, file: !69, line: 1310, column: 3)
!1681 = !DILocation(line: 1311, column: 27, scope: !1680)
!1682 = !DILocation(line: 1311, column: 32, scope: !1680)
!1683 = !DILocation(line: 1311, column: 13, scope: !1680)
!1684 = !DILocation(line: 1314, column: 6, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1661, file: !69, line: 1314, column: 6)
!1686 = !DILocation(line: 1314, column: 17, scope: !1685)
!1687 = !DILocation(line: 1314, column: 15, scope: !1685)
!1688 = !DILocation(line: 1314, column: 6, scope: !1661)
!1689 = !DILocation(line: 1316, column: 12, scope: !1690)
!1690 = distinct !DILexicalBlock(scope: !1685, file: !69, line: 1315, column: 3)
!1691 = !DILocation(line: 1316, column: 22, scope: !1690)
!1692 = !DILocation(line: 1316, column: 21, scope: !1690)
!1693 = !DILocation(line: 1316, column: 4, scope: !1690)
!1694 = !DILocation(line: 1320, column: 13, scope: !1695)
!1695 = distinct !DILexicalBlock(scope: !1685, file: !69, line: 1319, column: 3)
!1696 = !DILocation(line: 1320, column: 23, scope: !1695)
!1697 = !DILocation(line: 1320, column: 22, scope: !1695)
!1698 = !DILocation(line: 1320, column: 36, scope: !1695)
!1699 = !DILocation(line: 1320, column: 4, scope: !1695)
!1700 = !DILocation(line: 1325, column: 1, scope: !1639)
!1701 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1342, type: !1702, scopeLine: 1343, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1702 = !DISubroutineType(types: !1703)
!1703 = !{!16, !722, !16}
!1704 = !DILocalVariable(name: "numerator", arg: 1, scope: !1701, file: !69, line: 1342, type: !722)
!1705 = !DILocation(line: 1342, column: 25, scope: !1701)
!1706 = !DILocalVariable(name: "denominator", arg: 2, scope: !1701, file: !69, line: 1342, type: !16)
!1707 = !DILocation(line: 1342, column: 40, scope: !1701)
!1708 = !DILocalVariable(name: "u32Temp1", scope: !1701, file: !69, line: 1344, type: !722)
!1709 = !DILocation(line: 1344, column: 6, scope: !1701)
!1710 = !DILocalVariable(name: "u32Temp2", scope: !1701, file: !69, line: 1344, type: !722)
!1711 = !DILocation(line: 1344, column: 20, scope: !1701)
!1712 = !DILocation(line: 1345, column: 5, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1701, file: !69, line: 1345, column: 5)
!1714 = !DILocation(line: 1345, column: 17, scope: !1713)
!1715 = !DILocation(line: 1345, column: 5, scope: !1701)
!1716 = !DILocation(line: 1347, column: 6, scope: !1717)
!1717 = distinct !DILexicalBlock(scope: !1718, file: !69, line: 1347, column: 6)
!1718 = distinct !DILexicalBlock(scope: !1713, file: !69, line: 1346, column: 2)
!1719 = !DILocation(line: 1347, column: 18, scope: !1717)
!1720 = !DILocation(line: 1347, column: 6, scope: !1718)
!1721 = !DILocation(line: 1349, column: 4, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1717, file: !69, line: 1348, column: 3)
!1723 = !DILocation(line: 1353, column: 19, scope: !1724)
!1724 = distinct !DILexicalBlock(scope: !1717, file: !69, line: 1352, column: 3)
!1725 = !DILocation(line: 1353, column: 18, scope: !1724)
!1726 = !DILocation(line: 1353, column: 16, scope: !1724)
!1727 = !DILocation(line: 1354, column: 16, scope: !1724)
!1728 = !DILocation(line: 1354, column: 30, scope: !1724)
!1729 = !DILocation(line: 1354, column: 40, scope: !1724)
!1730 = !DILocation(line: 1354, column: 39, scope: !1724)
!1731 = !DILocation(line: 1354, column: 55, scope: !1724)
!1732 = !DILocation(line: 1354, column: 53, scope: !1724)
!1733 = !DILocation(line: 1354, column: 26, scope: !1724)
!1734 = !DILocation(line: 1354, column: 69, scope: !1724)
!1735 = !DILocation(line: 1354, column: 13, scope: !1724)
!1736 = !DILocation(line: 1355, column: 16, scope: !1724)
!1737 = !DILocation(line: 1355, column: 25, scope: !1724)
!1738 = !DILocation(line: 1355, column: 24, scope: !1724)
!1739 = !DILocation(line: 1355, column: 41, scope: !1724)
!1740 = !DILocation(line: 1355, column: 51, scope: !1724)
!1741 = !DILocation(line: 1355, column: 50, scope: !1724)
!1742 = !DILocation(line: 1355, column: 38, scope: !1724)
!1743 = !DILocation(line: 1355, column: 13, scope: !1724)
!1744 = !DILocation(line: 1356, column: 7, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1724, file: !69, line: 1356, column: 7)
!1746 = !DILocation(line: 1356, column: 16, scope: !1745)
!1747 = !DILocation(line: 1356, column: 7, scope: !1724)
!1748 = !DILocation(line: 1358, column: 13, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !1745, file: !69, line: 1357, column: 4)
!1750 = !DILocation(line: 1358, column: 12, scope: !1749)
!1751 = !DILocation(line: 1358, column: 5, scope: !1749)
!1752 = !DILocation(line: 1362, column: 5, scope: !1753)
!1753 = distinct !DILexicalBlock(scope: !1745, file: !69, line: 1361, column: 4)
!1754 = !DILocation(line: 1368, column: 15, scope: !1755)
!1755 = distinct !DILexicalBlock(scope: !1713, file: !69, line: 1367, column: 2)
!1756 = !DILocation(line: 1368, column: 29, scope: !1755)
!1757 = !DILocation(line: 1368, column: 39, scope: !1755)
!1758 = !DILocation(line: 1368, column: 38, scope: !1755)
!1759 = !DILocation(line: 1368, column: 54, scope: !1755)
!1760 = !DILocation(line: 1368, column: 52, scope: !1755)
!1761 = !DILocation(line: 1368, column: 25, scope: !1755)
!1762 = !DILocation(line: 1368, column: 68, scope: !1755)
!1763 = !DILocation(line: 1368, column: 12, scope: !1755)
!1764 = !DILocation(line: 1369, column: 15, scope: !1755)
!1765 = !DILocation(line: 1369, column: 24, scope: !1755)
!1766 = !DILocation(line: 1369, column: 23, scope: !1755)
!1767 = !DILocation(line: 1369, column: 40, scope: !1755)
!1768 = !DILocation(line: 1369, column: 50, scope: !1755)
!1769 = !DILocation(line: 1369, column: 49, scope: !1755)
!1770 = !DILocation(line: 1369, column: 37, scope: !1755)
!1771 = !DILocation(line: 1369, column: 12, scope: !1755)
!1772 = !DILocation(line: 1370, column: 6, scope: !1773)
!1773 = distinct !DILexicalBlock(scope: !1755, file: !69, line: 1370, column: 6)
!1774 = !DILocation(line: 1370, column: 15, scope: !1773)
!1775 = !DILocation(line: 1370, column: 6, scope: !1755)
!1776 = !DILocation(line: 1372, column: 11, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1773, file: !69, line: 1371, column: 3)
!1778 = !DILocation(line: 1372, column: 4, scope: !1777)
!1779 = !DILocation(line: 1376, column: 4, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1773, file: !69, line: 1375, column: 3)
!1781 = !DILocation(line: 1379, column: 1, scope: !1701)
!1782 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1397, type: !1783, scopeLine: 1398, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1783 = !DISubroutineType(types: !1784)
!1784 = !{!16, !16, !722}
!1785 = !DILocalVariable(name: "numerator", arg: 1, scope: !1782, file: !69, line: 1397, type: !16)
!1786 = !DILocation(line: 1397, column: 25, scope: !1782)
!1787 = !DILocalVariable(name: "denominator", arg: 2, scope: !1782, file: !69, line: 1397, type: !722)
!1788 = !DILocation(line: 1397, column: 40, scope: !1782)
!1789 = !DILocalVariable(name: "s32Temp1", scope: !1782, file: !69, line: 1399, type: !16)
!1790 = !DILocation(line: 1399, column: 6, scope: !1782)
!1791 = !DILocalVariable(name: "s32Temp2", scope: !1782, file: !69, line: 1399, type: !16)
!1792 = !DILocation(line: 1399, column: 20, scope: !1782)
!1793 = !DILocalVariable(name: "u32Temp0", scope: !1782, file: !69, line: 1400, type: !722)
!1794 = !DILocation(line: 1400, column: 6, scope: !1782)
!1795 = !DILocalVariable(name: "u32Temp1", scope: !1782, file: !69, line: 1400, type: !722)
!1796 = !DILocation(line: 1400, column: 20, scope: !1782)
!1797 = !DILocalVariable(name: "u32Temp2", scope: !1782, file: !69, line: 1400, type: !722)
!1798 = !DILocation(line: 1400, column: 34, scope: !1782)
!1799 = !DILocation(line: 1401, column: 5, scope: !1800)
!1800 = distinct !DILexicalBlock(scope: !1782, file: !69, line: 1401, column: 5)
!1801 = !DILocation(line: 1401, column: 17, scope: !1800)
!1802 = !DILocation(line: 1401, column: 5, scope: !1782)
!1803 = !DILocation(line: 1403, column: 6, scope: !1804)
!1804 = distinct !DILexicalBlock(scope: !1805, file: !69, line: 1403, column: 6)
!1805 = distinct !DILexicalBlock(scope: !1800, file: !69, line: 1402, column: 2)
!1806 = !DILocation(line: 1403, column: 16, scope: !1804)
!1807 = !DILocation(line: 1403, column: 6, scope: !1805)
!1808 = !DILocation(line: 1405, column: 4, scope: !1809)
!1809 = distinct !DILexicalBlock(scope: !1804, file: !69, line: 1404, column: 3)
!1810 = !DILocation(line: 1409, column: 4, scope: !1811)
!1811 = distinct !DILexicalBlock(scope: !1804, file: !69, line: 1408, column: 3)
!1812 = !DILocation(line: 1414, column: 6, scope: !1813)
!1813 = distinct !DILexicalBlock(scope: !1814, file: !69, line: 1414, column: 6)
!1814 = distinct !DILexicalBlock(scope: !1800, file: !69, line: 1413, column: 2)
!1815 = !DILocation(line: 1414, column: 16, scope: !1813)
!1816 = !DILocation(line: 1414, column: 6, scope: !1814)
!1817 = !DILocation(line: 1416, column: 16, scope: !1818)
!1818 = distinct !DILexicalBlock(scope: !1813, file: !69, line: 1415, column: 3)
!1819 = !DILocation(line: 1416, column: 15, scope: !1818)
!1820 = !DILocation(line: 1416, column: 13, scope: !1818)
!1821 = !DILocation(line: 1417, column: 16, scope: !1818)
!1822 = !DILocation(line: 1417, column: 25, scope: !1818)
!1823 = !DILocation(line: 1417, column: 24, scope: !1818)
!1824 = !DILocation(line: 1417, column: 13, scope: !1818)
!1825 = !DILocation(line: 1418, column: 15, scope: !1818)
!1826 = !DILocation(line: 1418, column: 28, scope: !1818)
!1827 = !DILocation(line: 1418, column: 37, scope: !1818)
!1828 = !DILocation(line: 1418, column: 36, scope: !1818)
!1829 = !DILocation(line: 1418, column: 52, scope: !1818)
!1830 = !DILocation(line: 1418, column: 50, scope: !1818)
!1831 = !DILocation(line: 1418, column: 24, scope: !1818)
!1832 = !DILocation(line: 1418, column: 13, scope: !1818)
!1833 = !DILocation(line: 1420, column: 8, scope: !1834)
!1834 = distinct !DILexicalBlock(scope: !1818, file: !69, line: 1420, column: 7)
!1835 = !DILocation(line: 1420, column: 20, scope: !1834)
!1836 = !DILocation(line: 1420, column: 27, scope: !1834)
!1837 = !DILocation(line: 1420, column: 7, scope: !1818)
!1838 = !DILocation(line: 1422, column: 20, scope: !1839)
!1839 = distinct !DILexicalBlock(scope: !1834, file: !69, line: 1421, column: 4)
!1840 = !DILocation(line: 1422, column: 32, scope: !1839)
!1841 = !DILocation(line: 1422, column: 17, scope: !1839)
!1842 = !DILocation(line: 1423, column: 4, scope: !1839)
!1843 = !DILocation(line: 1426, column: 20, scope: !1844)
!1844 = distinct !DILexicalBlock(scope: !1834, file: !69, line: 1425, column: 4)
!1845 = !DILocation(line: 1426, column: 32, scope: !1844)
!1846 = !DILocation(line: 1426, column: 38, scope: !1844)
!1847 = !DILocation(line: 1426, column: 17, scope: !1844)
!1848 = !DILocation(line: 1430, column: 7, scope: !1849)
!1849 = distinct !DILexicalBlock(scope: !1818, file: !69, line: 1430, column: 7)
!1850 = !DILocation(line: 1430, column: 18, scope: !1849)
!1851 = !DILocation(line: 1430, column: 16, scope: !1849)
!1852 = !DILocation(line: 1430, column: 7, scope: !1818)
!1853 = !DILocation(line: 1432, column: 14, scope: !1854)
!1854 = distinct !DILexicalBlock(scope: !1849, file: !69, line: 1431, column: 4)
!1855 = !DILocation(line: 1432, column: 13, scope: !1854)
!1856 = !DILocation(line: 1432, column: 23, scope: !1854)
!1857 = !DILocation(line: 1432, column: 5, scope: !1854)
!1858 = !DILocation(line: 1436, column: 14, scope: !1859)
!1859 = distinct !DILexicalBlock(scope: !1849, file: !69, line: 1435, column: 4)
!1860 = !DILocation(line: 1436, column: 23, scope: !1859)
!1861 = !DILocation(line: 1436, column: 12, scope: !1859)
!1862 = !DILocation(line: 1436, column: 27, scope: !1859)
!1863 = !DILocation(line: 1436, column: 5, scope: !1859)
!1864 = !DILocation(line: 1443, column: 16, scope: !1865)
!1865 = distinct !DILexicalBlock(scope: !1813, file: !69, line: 1442, column: 3)
!1866 = !DILocation(line: 1443, column: 30, scope: !1865)
!1867 = !DILocation(line: 1443, column: 40, scope: !1865)
!1868 = !DILocation(line: 1443, column: 39, scope: !1865)
!1869 = !DILocation(line: 1443, column: 55, scope: !1865)
!1870 = !DILocation(line: 1443, column: 53, scope: !1865)
!1871 = !DILocation(line: 1443, column: 26, scope: !1865)
!1872 = !DILocation(line: 1443, column: 69, scope: !1865)
!1873 = !DILocation(line: 1443, column: 13, scope: !1865)
!1874 = !DILocation(line: 1444, column: 16, scope: !1865)
!1875 = !DILocation(line: 1444, column: 26, scope: !1865)
!1876 = !DILocation(line: 1444, column: 25, scope: !1865)
!1877 = !DILocation(line: 1444, column: 42, scope: !1865)
!1878 = !DILocation(line: 1444, column: 51, scope: !1865)
!1879 = !DILocation(line: 1444, column: 50, scope: !1865)
!1880 = !DILocation(line: 1444, column: 39, scope: !1865)
!1881 = !DILocation(line: 1444, column: 13, scope: !1865)
!1882 = !DILocation(line: 1445, column: 11, scope: !1865)
!1883 = !DILocation(line: 1445, column: 4, scope: !1865)
!1884 = !DILocation(line: 1448, column: 1, scope: !1782)
!1885 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1465, type: !1886, scopeLine: 1466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1886 = !DISubroutineType(types: !1887)
!1887 = !{!16, !16, !16}
!1888 = !DILocalVariable(name: "numerator", arg: 1, scope: !1885, file: !69, line: 1465, type: !16)
!1889 = !DILocation(line: 1465, column: 25, scope: !1885)
!1890 = !DILocalVariable(name: "denominator", arg: 2, scope: !1885, file: !69, line: 1465, type: !16)
!1891 = !DILocation(line: 1465, column: 40, scope: !1885)
!1892 = !DILocalVariable(name: "s32Temp1", scope: !1885, file: !69, line: 1467, type: !16)
!1893 = !DILocation(line: 1467, column: 6, scope: !1885)
!1894 = !DILocalVariable(name: "s32Temp2", scope: !1885, file: !69, line: 1467, type: !16)
!1895 = !DILocation(line: 1467, column: 20, scope: !1885)
!1896 = !DILocalVariable(name: "denominator_prime", scope: !1885, file: !69, line: 1468, type: !722)
!1897 = !DILocation(line: 1468, column: 6, scope: !1885)
!1898 = !DILocalVariable(name: "u32Temp1", scope: !1885, file: !69, line: 1468, type: !722)
!1899 = !DILocation(line: 1468, column: 29, scope: !1885)
!1900 = !DILocalVariable(name: "u32Temp2", scope: !1885, file: !69, line: 1468, type: !722)
!1901 = !DILocation(line: 1468, column: 43, scope: !1885)
!1902 = !DILocalVariable(name: "u32numerator", scope: !1885, file: !69, line: 1469, type: !722)
!1903 = !DILocation(line: 1469, column: 6, scope: !1885)
!1904 = !DILocalVariable(name: "u32denominator", scope: !1885, file: !69, line: 1469, type: !722)
!1905 = !DILocation(line: 1469, column: 23, scope: !1885)
!1906 = !DILocation(line: 1470, column: 5, scope: !1907)
!1907 = distinct !DILexicalBlock(scope: !1885, file: !69, line: 1470, column: 5)
!1908 = !DILocation(line: 1470, column: 15, scope: !1907)
!1909 = !DILocation(line: 1470, column: 5, scope: !1885)
!1910 = !DILocation(line: 1472, column: 6, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1912, file: !69, line: 1472, column: 6)
!1912 = distinct !DILexicalBlock(scope: !1907, file: !69, line: 1471, column: 2)
!1913 = !DILocation(line: 1472, column: 18, scope: !1911)
!1914 = !DILocation(line: 1472, column: 6, scope: !1912)
!1915 = !DILocation(line: 1474, column: 7, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1917, file: !69, line: 1474, column: 7)
!1917 = distinct !DILexicalBlock(scope: !1911, file: !69, line: 1473, column: 3)
!1918 = !DILocation(line: 1474, column: 19, scope: !1916)
!1919 = !DILocation(line: 1474, column: 7, scope: !1917)
!1920 = !DILocation(line: 1476, column: 5, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1916, file: !69, line: 1475, column: 4)
!1922 = !DILocation(line: 1480, column: 21, scope: !1923)
!1923 = distinct !DILexicalBlock(scope: !1916, file: !69, line: 1479, column: 4)
!1924 = !DILocation(line: 1480, column: 20, scope: !1923)
!1925 = !DILocation(line: 1480, column: 18, scope: !1923)
!1926 = !DILocation(line: 1481, column: 23, scope: !1923)
!1927 = !DILocation(line: 1481, column: 22, scope: !1923)
!1928 = !DILocation(line: 1481, column: 20, scope: !1923)
!1929 = !DILocation(line: 1482, column: 16, scope: !1923)
!1930 = !DILocation(line: 1482, column: 33, scope: !1923)
!1931 = !DILocation(line: 1482, column: 46, scope: !1923)
!1932 = !DILocation(line: 1482, column: 45, scope: !1923)
!1933 = !DILocation(line: 1482, column: 64, scope: !1923)
!1934 = !DILocation(line: 1482, column: 62, scope: !1923)
!1935 = !DILocation(line: 1482, column: 29, scope: !1923)
!1936 = !DILocation(line: 1482, column: 81, scope: !1923)
!1937 = !DILocation(line: 1482, column: 14, scope: !1923)
!1938 = !DILocation(line: 1483, column: 17, scope: !1923)
!1939 = !DILocation(line: 1483, column: 30, scope: !1923)
!1940 = !DILocation(line: 1483, column: 29, scope: !1923)
!1941 = !DILocation(line: 1483, column: 49, scope: !1923)
!1942 = !DILocation(line: 1483, column: 58, scope: !1923)
!1943 = !DILocation(line: 1483, column: 57, scope: !1923)
!1944 = !DILocation(line: 1483, column: 46, scope: !1923)
!1945 = !DILocation(line: 1483, column: 14, scope: !1923)
!1946 = !DILocation(line: 1484, column: 8, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1923, file: !69, line: 1484, column: 8)
!1948 = !DILocation(line: 1484, column: 17, scope: !1947)
!1949 = !DILocation(line: 1484, column: 8, scope: !1923)
!1950 = !DILocation(line: 1486, column: 13, scope: !1951)
!1951 = distinct !DILexicalBlock(scope: !1947, file: !69, line: 1485, column: 5)
!1952 = !DILocation(line: 1486, column: 6, scope: !1951)
!1953 = !DILocation(line: 1490, column: 6, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1947, file: !69, line: 1489, column: 5)
!1955 = !DILocation(line: 1496, column: 20, scope: !1956)
!1956 = distinct !DILexicalBlock(scope: !1911, file: !69, line: 1495, column: 3)
!1957 = !DILocation(line: 1496, column: 19, scope: !1956)
!1958 = !DILocation(line: 1496, column: 29, scope: !1956)
!1959 = !DILocation(line: 1496, column: 17, scope: !1956)
!1960 = !DILocation(line: 1497, column: 16, scope: !1956)
!1961 = !DILocation(line: 1497, column: 33, scope: !1956)
!1962 = !DILocation(line: 1497, column: 46, scope: !1956)
!1963 = !DILocation(line: 1497, column: 45, scope: !1956)
!1964 = !DILocation(line: 1497, column: 61, scope: !1956)
!1965 = !DILocation(line: 1497, column: 59, scope: !1956)
!1966 = !DILocation(line: 1497, column: 29, scope: !1956)
!1967 = !DILocation(line: 1497, column: 75, scope: !1956)
!1968 = !DILocation(line: 1497, column: 13, scope: !1956)
!1969 = !DILocation(line: 1498, column: 16, scope: !1956)
!1970 = !DILocation(line: 1498, column: 29, scope: !1956)
!1971 = !DILocation(line: 1498, column: 28, scope: !1956)
!1972 = !DILocation(line: 1498, column: 45, scope: !1956)
!1973 = !DILocation(line: 1498, column: 54, scope: !1956)
!1974 = !DILocation(line: 1498, column: 53, scope: !1956)
!1975 = !DILocation(line: 1498, column: 42, scope: !1956)
!1976 = !DILocation(line: 1498, column: 13, scope: !1956)
!1977 = !DILocation(line: 1499, column: 13, scope: !1956)
!1978 = !DILocation(line: 1499, column: 12, scope: !1956)
!1979 = !DILocation(line: 1499, column: 22, scope: !1956)
!1980 = !DILocation(line: 1499, column: 4, scope: !1956)
!1981 = !DILocation(line: 1504, column: 6, scope: !1982)
!1982 = distinct !DILexicalBlock(scope: !1983, file: !69, line: 1504, column: 6)
!1983 = distinct !DILexicalBlock(scope: !1907, file: !69, line: 1503, column: 2)
!1984 = !DILocation(line: 1504, column: 18, scope: !1982)
!1985 = !DILocation(line: 1504, column: 6, scope: !1983)
!1986 = !DILocation(line: 1506, column: 7, scope: !1987)
!1987 = distinct !DILexicalBlock(scope: !1988, file: !69, line: 1506, column: 7)
!1988 = distinct !DILexicalBlock(scope: !1982, file: !69, line: 1505, column: 3)
!1989 = !DILocation(line: 1506, column: 19, scope: !1987)
!1990 = !DILocation(line: 1506, column: 7, scope: !1988)
!1991 = !DILocation(line: 1508, column: 5, scope: !1992)
!1992 = distinct !DILexicalBlock(scope: !1987, file: !69, line: 1507, column: 4)
!1993 = !DILocation(line: 1512, column: 23, scope: !1994)
!1994 = distinct !DILexicalBlock(scope: !1987, file: !69, line: 1511, column: 4)
!1995 = !DILocation(line: 1512, column: 22, scope: !1994)
!1996 = !DILocation(line: 1512, column: 35, scope: !1994)
!1997 = !DILocation(line: 1512, column: 20, scope: !1994)
!1998 = !DILocation(line: 1513, column: 17, scope: !1994)
!1999 = !DILocation(line: 1513, column: 31, scope: !1994)
!2000 = !DILocation(line: 1513, column: 41, scope: !1994)
!2001 = !DILocation(line: 1513, column: 40, scope: !1994)
!2002 = !DILocation(line: 1513, column: 59, scope: !1994)
!2003 = !DILocation(line: 1513, column: 57, scope: !1994)
!2004 = !DILocation(line: 1513, column: 27, scope: !1994)
!2005 = !DILocation(line: 1513, column: 76, scope: !1994)
!2006 = !DILocation(line: 1513, column: 14, scope: !1994)
!2007 = !DILocation(line: 1514, column: 17, scope: !1994)
!2008 = !DILocation(line: 1514, column: 27, scope: !1994)
!2009 = !DILocation(line: 1514, column: 26, scope: !1994)
!2010 = !DILocation(line: 1514, column: 46, scope: !1994)
!2011 = !DILocation(line: 1514, column: 55, scope: !1994)
!2012 = !DILocation(line: 1514, column: 54, scope: !1994)
!2013 = !DILocation(line: 1514, column: 43, scope: !1994)
!2014 = !DILocation(line: 1514, column: 14, scope: !1994)
!2015 = !DILocation(line: 1515, column: 14, scope: !1994)
!2016 = !DILocation(line: 1515, column: 13, scope: !1994)
!2017 = !DILocation(line: 1515, column: 23, scope: !1994)
!2018 = !DILocation(line: 1515, column: 5, scope: !1994)
!2019 = !DILocation(line: 1520, column: 16, scope: !2020)
!2020 = distinct !DILexicalBlock(scope: !1982, file: !69, line: 1519, column: 3)
!2021 = !DILocation(line: 1520, column: 30, scope: !2020)
!2022 = !DILocation(line: 1520, column: 40, scope: !2020)
!2023 = !DILocation(line: 1520, column: 39, scope: !2020)
!2024 = !DILocation(line: 1520, column: 55, scope: !2020)
!2025 = !DILocation(line: 1520, column: 53, scope: !2020)
!2026 = !DILocation(line: 1520, column: 26, scope: !2020)
!2027 = !DILocation(line: 1520, column: 69, scope: !2020)
!2028 = !DILocation(line: 1520, column: 13, scope: !2020)
!2029 = !DILocation(line: 1521, column: 16, scope: !2020)
!2030 = !DILocation(line: 1521, column: 26, scope: !2020)
!2031 = !DILocation(line: 1521, column: 25, scope: !2020)
!2032 = !DILocation(line: 1521, column: 42, scope: !2020)
!2033 = !DILocation(line: 1521, column: 51, scope: !2020)
!2034 = !DILocation(line: 1521, column: 50, scope: !2020)
!2035 = !DILocation(line: 1521, column: 39, scope: !2020)
!2036 = !DILocation(line: 1521, column: 13, scope: !2020)
!2037 = !DILocation(line: 1522, column: 11, scope: !2020)
!2038 = !DILocation(line: 1522, column: 4, scope: !2020)
!2039 = !DILocation(line: 1525, column: 1, scope: !1885)
!2040 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1543, type: !2041, scopeLine: 1544, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2041 = !DISubroutineType(types: !2042)
!2042 = !{!6, !16, !722}
!2043 = !DILocalVariable(name: "numerator", arg: 1, scope: !2040, file: !69, line: 1543, type: !16)
!2044 = !DILocation(line: 1543, column: 25, scope: !2040)
!2045 = !DILocalVariable(name: "denominator", arg: 2, scope: !2040, file: !69, line: 1543, type: !722)
!2046 = !DILocation(line: 1543, column: 40, scope: !2040)
!2047 = !DILocalVariable(name: "numerator_prime", scope: !2040, file: !69, line: 1546, type: !722)
!2048 = !DILocation(line: 1546, column: 6, scope: !2040)
!2049 = !DILocalVariable(name: "u32Temp1", scope: !2040, file: !69, line: 1546, type: !722)
!2050 = !DILocation(line: 1546, column: 27, scope: !2040)
!2051 = !DILocalVariable(name: "u32Temp2", scope: !2040, file: !69, line: 1546, type: !722)
!2052 = !DILocation(line: 1546, column: 41, scope: !2040)
!2053 = !DILocalVariable(name: "u32Temp3", scope: !2040, file: !69, line: 1546, type: !722)
!2054 = !DILocation(line: 1546, column: 55, scope: !2040)
!2055 = !DILocalVariable(name: "s32Temp1", scope: !2040, file: !69, line: 1547, type: !16)
!2056 = !DILocation(line: 1547, column: 6, scope: !2040)
!2057 = !DILocalVariable(name: "s32Temp2", scope: !2040, file: !69, line: 1547, type: !16)
!2058 = !DILocation(line: 1547, column: 20, scope: !2040)
!2059 = !DILocalVariable(name: "s32Temp3", scope: !2040, file: !69, line: 1547, type: !16)
!2060 = !DILocation(line: 1547, column: 34, scope: !2040)
!2061 = !DILocation(line: 1548, column: 5, scope: !2062)
!2062 = distinct !DILexicalBlock(scope: !2040, file: !69, line: 1548, column: 5)
!2063 = !DILocation(line: 1548, column: 17, scope: !2062)
!2064 = !DILocation(line: 1548, column: 5, scope: !2040)
!2065 = !DILocation(line: 1550, column: 6, scope: !2066)
!2066 = distinct !DILexicalBlock(scope: !2067, file: !69, line: 1550, column: 6)
!2067 = distinct !DILexicalBlock(scope: !2062, file: !69, line: 1549, column: 2)
!2068 = !DILocation(line: 1550, column: 15, scope: !2066)
!2069 = !DILocation(line: 1550, column: 6, scope: !2067)
!2070 = !DILocation(line: 1552, column: 4, scope: !2071)
!2071 = distinct !DILexicalBlock(scope: !2066, file: !69, line: 1551, column: 3)
!2072 = !DILocation(line: 1556, column: 4, scope: !2073)
!2073 = distinct !DILexicalBlock(scope: !2066, file: !69, line: 1555, column: 3)
!2074 = !DILocation(line: 1561, column: 6, scope: !2075)
!2075 = distinct !DILexicalBlock(scope: !2076, file: !69, line: 1561, column: 6)
!2076 = distinct !DILexicalBlock(scope: !2062, file: !69, line: 1560, column: 2)
!2077 = !DILocation(line: 1561, column: 16, scope: !2075)
!2078 = !DILocation(line: 1561, column: 6, scope: !2076)
!2079 = !DILocation(line: 1563, column: 23, scope: !2080)
!2080 = distinct !DILexicalBlock(scope: !2075, file: !69, line: 1562, column: 3)
!2081 = !DILocation(line: 1563, column: 22, scope: !2080)
!2082 = !DILocation(line: 1563, column: 20, scope: !2080)
!2083 = !DILocation(line: 1564, column: 16, scope: !2080)
!2084 = !DILocation(line: 1564, column: 32, scope: !2080)
!2085 = !DILocation(line: 1564, column: 31, scope: !2080)
!2086 = !DILocation(line: 1564, column: 13, scope: !2080)
!2087 = !DILocation(line: 1565, column: 15, scope: !2080)
!2088 = !DILocation(line: 1565, column: 34, scope: !2080)
!2089 = !DILocation(line: 1565, column: 45, scope: !2080)
!2090 = !DILocation(line: 1565, column: 43, scope: !2080)
!2091 = !DILocation(line: 1565, column: 31, scope: !2080)
!2092 = !DILocation(line: 1565, column: 13, scope: !2080)
!2093 = !DILocation(line: 1567, column: 8, scope: !2094)
!2094 = distinct !DILexicalBlock(scope: !2080, file: !69, line: 1567, column: 7)
!2095 = !DILocation(line: 1567, column: 20, scope: !2094)
!2096 = !DILocation(line: 1567, column: 27, scope: !2094)
!2097 = !DILocation(line: 1567, column: 7, scope: !2080)
!2098 = !DILocation(line: 1569, column: 19, scope: !2099)
!2099 = distinct !DILexicalBlock(scope: !2094, file: !69, line: 1568, column: 4)
!2100 = !DILocation(line: 1569, column: 31, scope: !2099)
!2101 = !DILocation(line: 1569, column: 17, scope: !2099)
!2102 = !DILocation(line: 1570, column: 4, scope: !2099)
!2103 = !DILocation(line: 1573, column: 20, scope: !2104)
!2104 = distinct !DILexicalBlock(scope: !2094, file: !69, line: 1572, column: 4)
!2105 = !DILocation(line: 1573, column: 32, scope: !2104)
!2106 = !DILocation(line: 1573, column: 38, scope: !2104)
!2107 = !DILocation(line: 1573, column: 17, scope: !2104)
!2108 = !DILocation(line: 1576, column: 7, scope: !2109)
!2109 = distinct !DILexicalBlock(scope: !2080, file: !69, line: 1576, column: 7)
!2110 = !DILocation(line: 1576, column: 18, scope: !2109)
!2111 = !DILocation(line: 1576, column: 16, scope: !2109)
!2112 = !DILocation(line: 1576, column: 7, scope: !2080)
!2113 = !DILocation(line: 1578, column: 18, scope: !2114)
!2114 = distinct !DILexicalBlock(scope: !2109, file: !69, line: 1577, column: 4)
!2115 = !DILocation(line: 1578, column: 16, scope: !2114)
!2116 = !DILocation(line: 1578, column: 28, scope: !2114)
!2117 = !DILocation(line: 1578, column: 14, scope: !2114)
!2118 = !DILocation(line: 1579, column: 4, scope: !2114)
!2119 = !DILocation(line: 1582, column: 18, scope: !2120)
!2120 = distinct !DILexicalBlock(scope: !2109, file: !69, line: 1581, column: 4)
!2121 = !DILocation(line: 1582, column: 26, scope: !2120)
!2122 = !DILocation(line: 1582, column: 16, scope: !2120)
!2123 = !DILocation(line: 1582, column: 30, scope: !2120)
!2124 = !DILocation(line: 1582, column: 14, scope: !2120)
!2125 = !DILocation(line: 1584, column: 8, scope: !2126)
!2126 = distinct !DILexicalBlock(scope: !2080, file: !69, line: 1584, column: 7)
!2127 = !DILocation(line: 1584, column: 18, scope: !2126)
!2128 = !DILocation(line: 1584, column: 7, scope: !2080)
!2129 = !DILocation(line: 1586, column: 18, scope: !2130)
!2130 = distinct !DILexicalBlock(scope: !2126, file: !69, line: 1585, column: 4)
!2131 = !DILocation(line: 1586, column: 12, scope: !2130)
!2132 = !DILocation(line: 1586, column: 5, scope: !2130)
!2133 = !DILocation(line: 1590, column: 5, scope: !2134)
!2134 = distinct !DILexicalBlock(scope: !2126, file: !69, line: 1589, column: 4)
!2135 = !DILocation(line: 1595, column: 16, scope: !2136)
!2136 = distinct !DILexicalBlock(scope: !2075, file: !69, line: 1594, column: 3)
!2137 = !DILocation(line: 1595, column: 26, scope: !2136)
!2138 = !DILocation(line: 1595, column: 25, scope: !2136)
!2139 = !DILocation(line: 1595, column: 41, scope: !2136)
!2140 = !DILocation(line: 1595, column: 39, scope: !2136)
!2141 = !DILocation(line: 1595, column: 13, scope: !2136)
!2142 = !DILocation(line: 1596, column: 16, scope: !2136)
!2143 = !DILocation(line: 1596, column: 30, scope: !2136)
!2144 = !DILocation(line: 1596, column: 40, scope: !2136)
!2145 = !DILocation(line: 1596, column: 39, scope: !2136)
!2146 = !DILocation(line: 1596, column: 55, scope: !2136)
!2147 = !DILocation(line: 1596, column: 53, scope: !2136)
!2148 = !DILocation(line: 1596, column: 26, scope: !2136)
!2149 = !DILocation(line: 1596, column: 68, scope: !2136)
!2150 = !DILocation(line: 1596, column: 13, scope: !2136)
!2151 = !DILocation(line: 1597, column: 16, scope: !2136)
!2152 = !DILocation(line: 1597, column: 25, scope: !2136)
!2153 = !DILocation(line: 1597, column: 24, scope: !2136)
!2154 = !DILocation(line: 1597, column: 41, scope: !2136)
!2155 = !DILocation(line: 1597, column: 51, scope: !2136)
!2156 = !DILocation(line: 1597, column: 50, scope: !2136)
!2157 = !DILocation(line: 1597, column: 38, scope: !2136)
!2158 = !DILocation(line: 1597, column: 13, scope: !2136)
!2159 = !DILocation(line: 1598, column: 7, scope: !2160)
!2160 = distinct !DILexicalBlock(scope: !2136, file: !69, line: 1598, column: 7)
!2161 = !DILocation(line: 1598, column: 16, scope: !2160)
!2162 = !DILocation(line: 1598, column: 7, scope: !2136)
!2163 = !DILocation(line: 1600, column: 17, scope: !2164)
!2164 = distinct !DILexicalBlock(scope: !2160, file: !69, line: 1599, column: 4)
!2165 = !DILocation(line: 1600, column: 12, scope: !2164)
!2166 = !DILocation(line: 1600, column: 5, scope: !2164)
!2167 = !DILocation(line: 1604, column: 5, scope: !2168)
!2168 = distinct !DILexicalBlock(scope: !2160, file: !69, line: 1603, column: 4)
!2169 = !DILocation(line: 1608, column: 1, scope: !2040)
!2170 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2171, file: !2171, line: 12, type: !2172, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2175)
!2171 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2172 = !DISubroutineType(types: !2173)
!2173 = !{null, !2174}
!2174 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2175 = !{!2176}
!2176 = !DILocalVariable(name: "z", arg: 1, scope: !2170, file: !2171, line: 12, type: !2174)
!2177 = !DILocation(line: 0, scope: !2170)
!2178 = !DILocation(line: 13, column: 9, scope: !2179)
!2179 = distinct !DILexicalBlock(scope: !2170, file: !2171, line: 13, column: 7)
!2180 = !DILocation(line: 13, column: 7, scope: !2170)
!2181 = !DILocation(line: 14, column: 5, scope: !2179)
!2182 = !DILocation(line: 15, column: 1, scope: !2170)
!2183 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2184, file: !2184, line: 20, type: !2185, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2188)
!2184 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2185 = !DISubroutineType(types: !2186)
!2186 = !{null, !2187, !2187}
!2187 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2188 = !{!2189, !2190}
!2189 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2183, file: !2184, line: 20, type: !2187)
!2190 = !DILocalVariable(name: "shift", arg: 2, scope: !2183, file: !2184, line: 20, type: !2187)
!2191 = !DILocation(line: 0, scope: !2183)
!2192 = !DILocation(line: 21, column: 13, scope: !2193)
!2193 = distinct !DILexicalBlock(scope: !2183, file: !2184, line: 21, column: 7)
!2194 = !DILocation(line: 21, column: 7, scope: !2183)
!2195 = !DILocation(line: 27, column: 5, scope: !2196)
!2196 = distinct !DILexicalBlock(scope: !2193, file: !2184, line: 21, column: 26)
!2197 = !DILocation(line: 29, column: 1, scope: !2183)
