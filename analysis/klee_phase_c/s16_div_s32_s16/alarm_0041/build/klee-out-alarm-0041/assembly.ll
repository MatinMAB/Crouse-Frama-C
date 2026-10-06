; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0041/build/s16_div_s32_s16_alarm_0041.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [85 x i8] c"KLEE-ALARM-0041: signed overflow. assert numerator / (s32)denominator <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0041.err\00", align 1
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
  br i1 %cmp92, label %if.then94, label %if.else168, !dbg !359

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
  %64 = load i32, i32* %numerator.addr, align 4, !dbg !454
  %conv158 = sext i32 %64 to i64, !dbg !456
  %65 = load i16, i16* %denominator.addr, align 2, !dbg !457
  %conv159 = sext i16 %65 to i32, !dbg !458
  %conv160 = sext i32 %conv159 to i64, !dbg !459
  %call161 = call i32 @klee_alarm_s32_div_representable(i64 %conv158, i64 %conv160), !dbg !460
  %tobool162 = icmp ne i32 %call161, 0, !dbg !460
  br i1 %tobool162, label %if.end164, label %if.then163, !dbg !461

if.then163:                                       ; preds = %if.end155
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 367, i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !462
  unreachable, !dbg !462

if.end164:                                        ; preds = %if.end155
  %66 = load i32, i32* %numerator.addr, align 4, !dbg !464
  %67 = load i16, i16* %denominator.addr, align 2, !dbg !465
  %conv165 = sext i16 %67 to i32, !dbg !466
  %int_cast_to_i6415 = zext i32 %conv165 to i64, !dbg !467
  call void @klee_div_zero_check(i64 %int_cast_to_i6415), !dbg !467
  %div166 = sdiv i32 %66, %conv165, !dbg !467, !klee.check.div !106
  %conv167 = sext i32 %div166 to i64, !dbg !468
  store volatile i64 %conv167, i64* @klee_alarm_sink_s64, align 8, !dbg !469
  store i16 0, i16* %retval, align 2, !dbg !470
  br label %return, !dbg !470

if.else168:                                       ; preds = %if.else90
  store i16 32767, i16* %retval, align 2, !dbg !471
  br label %return, !dbg !471

return:                                           ; preds = %if.else168, %if.end164, %if.then154, %if.then143, %if.then136, %if.then127, %if.then118, %if.then108, %if.then98, %if.else89, %if.else88, %if.then86, %if.then77, %if.then69, %if.then61, %if.then54, %if.then44, %if.then35, %if.then26, %if.then16, %if.then10, %if.else, %if.then4
  %68 = load i16, i16* %retval, align 2, !dbg !473
  ret i16 %68, !dbg !473
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !474 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !477, metadata !DIExpression()), !dbg !478
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !479
  %cmp = icmp ne i64 %0, 0, !dbg !480
  %conv = zext i1 %cmp to i32, !dbg !480
  ret i32 %conv, !dbg !481
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !482 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !483, metadata !DIExpression()), !dbg !484
  %0 = load i64, i64* %left.addr, align 8, !dbg !485
  %cmp = icmp sge i64 %0, 0, !dbg !486
  %conv = zext i1 %cmp to i32, !dbg !486
  ret i32 %conv, !dbg !487
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !488 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !491, metadata !DIExpression()), !dbg !492
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !493, metadata !DIExpression()), !dbg !494
  %0 = load i32, i32* %count.addr, align 4, !dbg !495
  %cmp = icmp uge i32 %0, 63, !dbg !497
  br i1 %cmp, label %if.then, label %if.end, !dbg !498

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !499
  br label %return, !dbg !499

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !501
  %2 = load i32, i32* %count.addr, align 4, !dbg !502
  %sh_prom = zext i32 %2 to i64, !dbg !503
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !503
  %shl = shl i64 1, %sh_prom, !dbg !503, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !504
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !505
  %conv = zext i1 %cmp1 to i32, !dbg !505
  store i32 %conv, i32* %retval, align 4, !dbg !506
  br label %return, !dbg !506

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !507
  ret i32 %3, !dbg !507
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !508 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !511, metadata !DIExpression()), !dbg !512
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !513, metadata !DIExpression()), !dbg !514
  %0 = load i64, i64* %left.addr, align 8, !dbg !515
  %1 = load i64, i64* %right.addr, align 8, !dbg !516
  %mul = mul nsw i64 %0, %1, !dbg !517
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !518
  %conv = zext i1 %cmp to i32, !dbg !518
  ret i32 %conv, !dbg !519
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !520 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !521, metadata !DIExpression()), !dbg !522
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !523, metadata !DIExpression()), !dbg !524
  %0 = load i64, i64* %left.addr, align 8, !dbg !525
  %1 = load i64, i64* %right.addr, align 8, !dbg !526
  %mul = mul nsw i64 %0, %1, !dbg !527
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !528
  %conv = zext i1 %cmp to i32, !dbg !528
  ret i32 %conv, !dbg !529
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_lower(i64 %left, i64 %right) #0 !dbg !530 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !531, metadata !DIExpression()), !dbg !532
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !533, metadata !DIExpression()), !dbg !534
  %0 = load i64, i64* %left.addr, align 8, !dbg !535
  %1 = load i64, i64* %right.addr, align 8, !dbg !536
  %add = add nsw i64 %0, %1, !dbg !537
  %cmp = icmp sge i64 %add, -2147483648, !dbg !538
  %conv = zext i1 %cmp to i32, !dbg !538
  ret i32 %conv, !dbg !539
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !540 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !541, metadata !DIExpression()), !dbg !542
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !543, metadata !DIExpression()), !dbg !544
  %0 = load i64, i64* %left.addr, align 8, !dbg !545
  %1 = load i64, i64* %right.addr, align 8, !dbg !546
  %add = add nsw i64 %0, %1, !dbg !547
  %cmp = icmp sle i64 %add, 2147483647, !dbg !548
  %conv = zext i1 %cmp to i32, !dbg !548
  ret i32 %conv, !dbg !549
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_div_representable(i64 %numerator, i64 %denominator) #0 !dbg !550 {
entry:
  %numerator.addr = alloca i64, align 8
  %denominator.addr = alloca i64, align 8
  store i64 %numerator, i64* %numerator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %numerator.addr, metadata !551, metadata !DIExpression()), !dbg !552
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !553, metadata !DIExpression()), !dbg !554
  %0 = load i64, i64* %numerator.addr, align 8, !dbg !555
  %cmp = icmp eq i64 %0, -2147483648, !dbg !556
  %1 = load i64, i64* %denominator.addr, align 8, !dbg !557
  %cmp1 = icmp eq i64 %1, -1, !dbg !557
  %2 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !557
  %lnot = xor i1 %2, true, !dbg !558
  %lnot.ext = zext i1 %lnot to i32, !dbg !558
  ret i32 %lnot.ext, !dbg !559
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !560 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !563, metadata !DIExpression()), !dbg !564
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !565, metadata !DIExpression()), !dbg !566
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !567, metadata !DIExpression()), !dbg !568
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !569, metadata !DIExpression()), !dbg !570
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !571, metadata !DIExpression()), !dbg !572
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !573
  %conv = zext i16 %0 to i32, !dbg !573
  %and = and i32 %conv, 65535, !dbg !574
  %conv1 = trunc i32 %and to i16, !dbg !573
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !575
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !576
  %conv2 = sext i16 %1 to i32, !dbg !576
  %shl = shl i32 %conv2, 16, !dbg !577
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !578
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !579
  %conv3 = zext i16 %2 to i32, !dbg !579
  %cmp = icmp eq i32 %conv3, 0, !dbg !581
  br i1 %cmp, label %if.then, label %if.else9, !dbg !582

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !583
  %conv5 = sext i16 %3 to i32, !dbg !583
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !586
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !587

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !588
  br label %return, !dbg !588

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !590
  br label %return, !dbg !590

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !592
  %conv10 = sext i16 %4 to i32, !dbg !592
  %shl11 = shl i32 %conv10, 16, !dbg !594
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !595
  %conv12 = sext i16 %5 to i32, !dbg !595
  %shl13 = shl i32 %conv12, 16, !dbg !596
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !597
  %conv14 = zext i16 %6 to i32, !dbg !597
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !598
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !598
  %div = sdiv i32 %shl13, %conv14, !dbg !598, !klee.check.div !106
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !599
  %conv15 = zext i16 %7 to i32, !dbg !599
  %mul = mul nsw i32 %div, %conv15, !dbg !600
  %sub = sub nsw i32 %shl11, %mul, !dbg !601
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !602
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !603
  %shl16 = shl i32 %8, 1, !dbg !604
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !605
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !606
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !607
  %conv17 = zext i16 %10 to i32, !dbg !607
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !608
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !608
  %div18 = sdiv i32 %9, %conv17, !dbg !608, !klee.check.div !106
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !609
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !610
  %conv19 = sext i16 %11 to i32, !dbg !610
  %shl20 = shl i32 %conv19, 16, !dbg !611
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !612
  %conv21 = zext i16 %12 to i32, !dbg !612
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !613
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !613
  %div22 = sdiv i32 %shl20, %conv21, !dbg !613, !klee.check.div !106
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !614
  %add = add nsw i32 %div22, %13, !dbg !615
  store i32 %add, i32* %s32Temp1, align 4, !dbg !616
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !617
  %cmp23 = icmp slt i32 %14, 32767, !dbg !619
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !620

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !621
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !624
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !625

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !626
  %conv29 = trunc i32 %16 to i16, !dbg !628
  store i16 %conv29, i16* %retval, align 2, !dbg !629
  br label %return, !dbg !629

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !630
  br label %return, !dbg !630

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !632
  br label %return, !dbg !632

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !634
  ret i16 %17, !dbg !634
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !635 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !636, metadata !DIExpression()), !dbg !637
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !638, metadata !DIExpression()), !dbg !639
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !640, metadata !DIExpression()), !dbg !641
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !642, metadata !DIExpression()), !dbg !643
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !644
  %conv = zext i16 %0 to i32, !dbg !644
  %and = and i32 %conv, 65535, !dbg !645
  %conv1 = trunc i32 %and to i16, !dbg !644
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !646
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !647
  %conv2 = zext i16 %1 to i32, !dbg !647
  %cmp = icmp eq i32 %conv2, 0, !dbg !649
  br i1 %cmp, label %if.then, label %if.else8, !dbg !650

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !651
  %conv4 = sext i16 %2 to i32, !dbg !651
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !654
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !655

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !656
  br label %return, !dbg !656

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !658
  br label %return, !dbg !658

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !660
  %conv9 = sext i16 %3 to i32, !dbg !660
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !662
  %conv10 = sext i16 %4 to i32, !dbg !662
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !663
  %conv11 = zext i16 %5 to i32, !dbg !663
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !664
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !664
  %div = sdiv i32 %conv10, %conv11, !dbg !664, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !665
  %conv12 = zext i16 %6 to i32, !dbg !665
  %mul = mul nsw i32 %div, %conv12, !dbg !666
  %sub = sub nsw i32 %conv9, %mul, !dbg !667
  %shl = shl i32 %sub, 1, !dbg !668
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !669
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !670
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !671
  %conv13 = zext i16 %8 to i32, !dbg !671
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !672
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !672
  %div14 = sdiv i32 %7, %conv13, !dbg !672, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !673
  %conv15 = sext i16 %9 to i32, !dbg !673
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !674
  %conv16 = zext i16 %10 to i32, !dbg !674
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !675
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !675
  %div17 = sdiv i32 %conv15, %conv16, !dbg !675, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !676
  store i32 %add, i32* %s32Temp1, align 4, !dbg !677
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !678
  %conv18 = trunc i32 %11 to i16, !dbg !678
  store i16 %conv18, i16* %retval, align 2, !dbg !679
  br label %return, !dbg !679

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !680
  ret i16 %12, !dbg !680
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !681 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !684, metadata !DIExpression()), !dbg !685
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !686, metadata !DIExpression()), !dbg !687
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !688, metadata !DIExpression()), !dbg !690
  store i32 0, i32* %u32Temp1, align 4, !dbg !690
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !691, metadata !DIExpression()), !dbg !692
  store i32 0, i32* %u32Temp2, align 4, !dbg !692
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !693, metadata !DIExpression()), !dbg !694
  store i32 0, i32* %u32Temp3, align 4, !dbg !694
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !695
  %conv = zext i16 %0 to i32, !dbg !695
  %cmp = icmp eq i32 %conv, 0, !dbg !697
  br i1 %cmp, label %if.then, label %if.else, !dbg !698

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !699
  br label %return, !dbg !699

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !701
  %conv2 = zext i16 %1 to i32, !dbg !701
  %shl = shl i32 %conv2, 16, !dbg !703
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !704
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !705
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !706
  %conv3 = zext i16 %3 to i32, !dbg !706
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !707
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !707
  %div = udiv i32 %2, %conv3, !dbg !707, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !708
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !709
  %add = add i32 %4, 128, !dbg !710
  %shr = lshr i32 %add, 8, !dbg !711
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !712
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !713
  %cmp4 = icmp ult i32 %5, 255, !dbg !715
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !716

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !717
  %conv7 = trunc i32 %6 to i8, !dbg !719
  store i8 %conv7, i8* %retval, align 1, !dbg !720
  br label %return, !dbg !720

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !721
  br label %return, !dbg !721

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !723
  ret i8 %7, !dbg !723
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !724 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !727, metadata !DIExpression()), !dbg !728
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !729, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !731, metadata !DIExpression()), !dbg !732
  store i32 0, i32* %s32Temp1, align 4, !dbg !732
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !733
  %conv = zext i16 %0 to i32, !dbg !733
  %and = and i32 %conv, 65535, !dbg !734
  %conv1 = trunc i32 %and to i16, !dbg !733
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !735
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !736
  %conv2 = zext i16 %1 to i32, !dbg !736
  %and3 = and i32 %conv2, 65535, !dbg !738
  %cmp = icmp eq i32 %and3, 0, !dbg !739
  br i1 %cmp, label %if.then, label %if.else8, !dbg !740

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !741
  %cmp5 = icmp sge i32 %2, 0, !dbg !744
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !745

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !746
  br label %return, !dbg !746

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !748
  br label %return, !dbg !748

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !750
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !752
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !753
  %conv9 = zext i16 %5 to i32, !dbg !753
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !754
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !754
  %div = sdiv i32 %4, %conv9, !dbg !754, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !755
  %conv10 = zext i16 %6 to i32, !dbg !755
  %mul = mul nsw i32 %div, %conv10, !dbg !756
  %sub = sub nsw i32 %3, %mul, !dbg !757
  %shl = shl i32 %sub, 1, !dbg !758
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !759
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !760
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !761
  %conv11 = zext i16 %8 to i32, !dbg !761
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !762
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !762
  %div12 = sdiv i32 %7, %conv11, !dbg !762, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !763
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !764
  %conv13 = zext i16 %10 to i32, !dbg !764
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !765
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !765
  %div14 = sdiv i32 %9, %conv13, !dbg !765, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !766
  store i32 %add, i32* %s32Temp1, align 4, !dbg !767
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !768
  %cmp15 = icmp slt i32 %11, 65535, !dbg !770
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !771

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !772
  %cmp18 = icmp sgt i32 %12, 0, !dbg !775
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !776

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !777
  %conv21 = trunc i32 %13 to i16, !dbg !779
  store i16 %conv21, i16* %retval, align 2, !dbg !780
  br label %return, !dbg !780

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !781
  br label %return, !dbg !781

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !783
  br label %return, !dbg !783

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !785
  ret i16 %14, !dbg !785
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !786 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !789, metadata !DIExpression()), !dbg !790
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !791, metadata !DIExpression()), !dbg !792
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !793, metadata !DIExpression()), !dbg !794
  store i32 0, i32* %u32Temp, align 4, !dbg !794
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !795
  %conv = zext i16 %0 to i32, !dbg !795
  %cmp = icmp eq i32 %conv, 0, !dbg !797
  br i1 %cmp, label %if.then, label %if.else, !dbg !798

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !799
  br label %return, !dbg !799

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !801
  %conv2 = zext i16 %1 to i32, !dbg !801
  %shl = shl i32 %conv2, 16, !dbg !803
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !804
  %conv3 = zext i16 %2 to i32, !dbg !804
  %shr = ashr i32 %conv3, 1, !dbg !805
  %add = add nsw i32 %shl, %shr, !dbg !806
  store i32 %add, i32* %u32Temp, align 4, !dbg !807
  %3 = load i32, i32* %u32Temp, align 4, !dbg !808
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !809
  %conv4 = zext i16 %4 to i32, !dbg !809
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !810
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !810
  %div = udiv i32 %3, %conv4, !dbg !810, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !811
  %5 = load i32, i32* %u32Temp, align 4, !dbg !812
  %cmp5 = icmp ult i32 %5, 65535, !dbg !814
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !815

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !816
  %and = and i32 %6, 65535, !dbg !818
  %conv8 = trunc i32 %and to i16, !dbg !816
  store i16 %conv8, i16* %retval, align 2, !dbg !819
  br label %return, !dbg !819

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !820
  br label %return, !dbg !820

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !822
  ret i16 %7, !dbg !822
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !823 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !826, metadata !DIExpression()), !dbg !827
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !828, metadata !DIExpression()), !dbg !829
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !830, metadata !DIExpression()), !dbg !831
  store i32 0, i32* %u32Temp1, align 4, !dbg !831
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !832, metadata !DIExpression()), !dbg !833
  store i32 0, i32* %u32Temp2, align 4, !dbg !833
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !834
  %conv = zext i16 %0 to i32, !dbg !834
  %and = and i32 %conv, 65535, !dbg !835
  %conv1 = trunc i32 %and to i16, !dbg !834
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !836
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !837
  %conv2 = zext i16 %1 to i32, !dbg !837
  %cmp = icmp eq i32 %conv2, 0, !dbg !839
  br i1 %cmp, label %if.then, label %if.else, !dbg !840

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !841
  br label %return, !dbg !841

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !843
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !845
  %conv4 = zext i16 %3 to i32, !dbg !845
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !846
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !846
  %div = udiv i32 %2, %conv4, !dbg !846, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !847
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !848
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !849
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !850
  %conv5 = zext i16 %6 to i32, !dbg !850
  %mul = mul i32 %5, %conv5, !dbg !851
  %sub = sub i32 %4, %mul, !dbg !852
  %shl = shl i32 %sub, 1, !dbg !853
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !854
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !855
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !856
  %conv6 = zext i16 %8 to i32, !dbg !856
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !857
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !857
  %div7 = udiv i32 %7, %conv6, !dbg !857, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !858
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !859
  %conv8 = zext i16 %10 to i32, !dbg !859
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !860
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !860
  %div9 = udiv i32 %9, %conv8, !dbg !860, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !861
  store i32 %add, i32* %u32Temp2, align 4, !dbg !862
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !863
  %cmp10 = icmp ult i32 %11, 65535, !dbg !865
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !866

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !867
  %and13 = and i32 %12, 65535, !dbg !869
  %conv14 = trunc i32 %and13 to i16, !dbg !867
  store i16 %conv14, i16* %retval, align 2, !dbg !870
  br label %return, !dbg !870

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !871
  br label %return, !dbg !871

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !873
  ret i16 %13, !dbg !873
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !874 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !877, metadata !DIExpression()), !dbg !878
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !879, metadata !DIExpression()), !dbg !880
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !881, metadata !DIExpression()), !dbg !882
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !883, metadata !DIExpression()), !dbg !884
  store i32 0, i32* %s32Result, align 4, !dbg !884
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !885, metadata !DIExpression()), !dbg !886
  store i32 0, i32* %s32Temp1, align 4, !dbg !886
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !887
  %conv = sext i16 %0 to i32, !dbg !887
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !888
  %conv1 = zext i16 %1 to i32, !dbg !888
  %mul = mul nsw i32 %conv, %conv1, !dbg !889
  store i32 %mul, i32* %s32Result, align 4, !dbg !890
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !891
  %conv2 = sext i16 %2 to i32, !dbg !891
  %cmp = icmp eq i32 %conv2, 0, !dbg !893
  br i1 %cmp, label %if.then, label %if.else7, !dbg !894

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !895
  %cmp4 = icmp slt i32 %3, 0, !dbg !898
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !899

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !900
  br label %return, !dbg !900

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !902
  br label %return, !dbg !902

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !904
  %5 = load i32, i32* %s32Result, align 4, !dbg !906
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !907
  %conv8 = sext i16 %6 to i32, !dbg !907
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !908
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !908
  %div = sdiv i32 %5, %conv8, !dbg !908, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !909
  %conv9 = sext i16 %7 to i32, !dbg !909
  %mul10 = mul nsw i32 %div, %conv9, !dbg !910
  %sub = sub nsw i32 %4, %mul10, !dbg !911
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !912
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !913
  %shl = shl i32 %8, 1, !dbg !914
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !915
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !916
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !917
  %conv11 = sext i16 %10 to i32, !dbg !917
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !918
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !918
  %div12 = sdiv i32 %9, %conv11, !dbg !918, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !919
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !920
  %conv13 = sext i16 %12 to i32, !dbg !920
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !921
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !921
  %div14 = sdiv i32 %11, %conv13, !dbg !921, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !922
  store i32 %add, i32* %s32Result, align 4, !dbg !923
  %13 = load i32, i32* %s32Result, align 4, !dbg !924
  %cmp15 = icmp slt i32 %13, 32767, !dbg !926
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !927

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !928
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !931
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !932

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !933
  %conv21 = trunc i32 %15 to i16, !dbg !935
  store i16 %conv21, i16* %retval, align 2, !dbg !936
  br label %return, !dbg !936

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !937
  br label %return, !dbg !937

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !939
  br label %return, !dbg !939

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !941
  ret i16 %16, !dbg !941
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !942 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !945, metadata !DIExpression()), !dbg !946
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !947, metadata !DIExpression()), !dbg !948
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !949, metadata !DIExpression()), !dbg !950
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !951, metadata !DIExpression()), !dbg !952
  store i32 0, i32* %s32Result, align 4, !dbg !952
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !953, metadata !DIExpression()), !dbg !954
  store i32 0, i32* %s32Temp1, align 4, !dbg !954
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !955
  %conv = zext i16 %0 to i32, !dbg !955
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !956
  %conv1 = sext i16 %1 to i32, !dbg !956
  %mul = mul nsw i32 %conv, %conv1, !dbg !957
  store i32 %mul, i32* %s32Result, align 4, !dbg !958
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !959
  %conv2 = zext i16 %2 to i32, !dbg !959
  %cmp = icmp eq i32 %conv2, 0, !dbg !961
  br i1 %cmp, label %if.then, label %if.else7, !dbg !962

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !963
  %cmp4 = icmp slt i32 %3, 0, !dbg !966
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !967

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !968
  br label %return, !dbg !968

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !970
  br label %return, !dbg !970

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !972
  %5 = load i32, i32* %s32Result, align 4, !dbg !974
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !975
  %conv8 = zext i16 %6 to i32, !dbg !975
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !976
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !976
  %div = sdiv i32 %5, %conv8, !dbg !976, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !977
  %conv9 = zext i16 %7 to i32, !dbg !977
  %mul10 = mul nsw i32 %div, %conv9, !dbg !978
  %sub = sub nsw i32 %4, %mul10, !dbg !979
  %shl = shl i32 %sub, 1, !dbg !980
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !981
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !982
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !983
  %conv11 = zext i16 %9 to i32, !dbg !983
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !984
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !984
  %div12 = sdiv i32 %8, %conv11, !dbg !984, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !985
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !986
  %conv13 = zext i16 %11 to i32, !dbg !986
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !987
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !987
  %div14 = sdiv i32 %10, %conv13, !dbg !987, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !988
  store i32 %add, i32* %s32Result, align 4, !dbg !989
  %12 = load i32, i32* %s32Result, align 4, !dbg !990
  %cmp15 = icmp slt i32 %12, 32767, !dbg !992
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !993

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !994
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !997
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !998

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !999
  %conv21 = trunc i32 %14 to i16, !dbg !1001
  store i16 %conv21, i16* %retval, align 2, !dbg !1002
  br label %return, !dbg !1002

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !1003
  br label %return, !dbg !1003

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1005
  br label %return, !dbg !1005

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1007
  ret i16 %15, !dbg !1007
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !1008 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1011, metadata !DIExpression()), !dbg !1012
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1013, metadata !DIExpression()), !dbg !1014
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1015, metadata !DIExpression()), !dbg !1016
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !1017, metadata !DIExpression()), !dbg !1018
  store i32 0, i32* %u32Result, align 4, !dbg !1018
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1019, metadata !DIExpression()), !dbg !1020
  store i32 0, i32* %u32Temp1, align 4, !dbg !1020
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1021, metadata !DIExpression()), !dbg !1022
  store i32 0, i32* %s32Result, align 4, !dbg !1022
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1023, metadata !DIExpression()), !dbg !1024
  store i32 0, i32* %s32Temp1, align 4, !dbg !1024
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !1025
  %conv = sext i16 %0 to i32, !dbg !1025
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !1026
  %conv1 = zext i16 %1 to i32, !dbg !1026
  %mul = mul nsw i32 %conv, %conv1, !dbg !1027
  store i32 %mul, i32* %s32Result, align 4, !dbg !1028
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1029
  %conv2 = sext i16 %2 to i32, !dbg !1029
  %cmp = icmp eq i32 %conv2, 0, !dbg !1031
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1032

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1033
  %cmp4 = icmp sge i32 %3, 0, !dbg !1036
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1037

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !1038
  br label %return, !dbg !1038

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1040
  br label %return, !dbg !1040

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1042
  %5 = load i32, i32* %s32Result, align 4, !dbg !1044
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1045
  %conv8 = sext i16 %6 to i32, !dbg !1045
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1046
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1046
  %div = sdiv i32 %5, %conv8, !dbg !1046, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1047
  %conv9 = sext i16 %7 to i32, !dbg !1047
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1048
  %sub = sub nsw i32 %4, %mul10, !dbg !1049
  %shl = shl i32 %sub, 1, !dbg !1050
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1051
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1052
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1053
  %conv11 = sext i16 %9 to i32, !dbg !1053
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1054
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1054
  %div12 = sdiv i32 %8, %conv11, !dbg !1054, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1055
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1056
  %conv13 = sext i16 %11 to i32, !dbg !1056
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1057
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1057
  %div14 = sdiv i32 %10, %conv13, !dbg !1057, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1058
  store i32 %add, i32* %s32Result, align 4, !dbg !1059
  %12 = load i32, i32* %s32Result, align 4, !dbg !1060
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1062
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1063

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1064
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1067
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1068

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1069
  %conv21 = trunc i32 %14 to i16, !dbg !1071
  store i16 %conv21, i16* %retval, align 2, !dbg !1072
  br label %return, !dbg !1072

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1073
  br label %return, !dbg !1073

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1075
  br label %return, !dbg !1075

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1077
  ret i16 %15, !dbg !1077
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1078 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1081, metadata !DIExpression()), !dbg !1082
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1083, metadata !DIExpression()), !dbg !1084
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1085, metadata !DIExpression()), !dbg !1086
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1087, metadata !DIExpression()), !dbg !1088
  store i32 0, i32* %s32Result, align 4, !dbg !1088
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1089, metadata !DIExpression()), !dbg !1090
  store i32 0, i32* %s32Temp1, align 4, !dbg !1090
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !1091
  %conv = sext i16 %0 to i32, !dbg !1091
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !1092
  %conv1 = zext i16 %1 to i32, !dbg !1092
  %mul = mul nsw i32 %conv, %conv1, !dbg !1093
  store i32 %mul, i32* %s32Result, align 4, !dbg !1094
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1095
  %conv2 = zext i16 %2 to i32, !dbg !1095
  %cmp = icmp eq i32 %conv2, 0, !dbg !1097
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1098

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1099
  %cmp4 = icmp sge i32 %3, 0, !dbg !1102
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1103

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !1104
  br label %return, !dbg !1104

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1106
  br label %return, !dbg !1106

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1108
  %5 = load i32, i32* %s32Result, align 4, !dbg !1110
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1111
  %conv8 = zext i16 %6 to i32, !dbg !1111
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1112
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1112
  %div = sdiv i32 %5, %conv8, !dbg !1112, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1113
  %conv9 = zext i16 %7 to i32, !dbg !1113
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1114
  %sub = sub nsw i32 %4, %mul10, !dbg !1115
  %shl = shl i32 %sub, 1, !dbg !1116
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1117
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1118
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1119
  %conv11 = zext i16 %9 to i32, !dbg !1119
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1120
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1120
  %div12 = sdiv i32 %8, %conv11, !dbg !1120, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1121
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1122
  %conv13 = zext i16 %11 to i32, !dbg !1122
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1123
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1123
  %div14 = sdiv i32 %10, %conv13, !dbg !1123, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1124
  store i32 %add, i32* %s32Result, align 4, !dbg !1125
  %12 = load i32, i32* %s32Result, align 4, !dbg !1126
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1128
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1129

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1130
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1133
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1134

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1135
  %conv21 = trunc i32 %14 to i16, !dbg !1137
  store i16 %conv21, i16* %retval, align 2, !dbg !1138
  br label %return, !dbg !1138

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1139
  br label %return, !dbg !1139

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1141
  br label %return, !dbg !1141

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1143
  ret i16 %15, !dbg !1143
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1144 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1147, metadata !DIExpression()), !dbg !1148
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1149, metadata !DIExpression()), !dbg !1150
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1151, metadata !DIExpression()), !dbg !1152
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1153, metadata !DIExpression()), !dbg !1154
  store i32 0, i32* %u32Temp1, align 4, !dbg !1154
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1155, metadata !DIExpression()), !dbg !1156
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1156
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1157
  %conv = zext i16 %0 to i32, !dbg !1157
  %cmp = icmp eq i32 %conv, 0, !dbg !1159
  br i1 %cmp, label %if.then, label %if.else, !dbg !1160

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1161
  br label %return, !dbg !1161

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1163
  %conv2 = zext i16 %1 to i32, !dbg !1163
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1165
  %conv3 = zext i16 %2 to i32, !dbg !1165
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1166
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1167
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1168
  %conv4 = zext i16 %3 to i32, !dbg !1168
  %shr = ashr i32 %conv4, 1, !dbg !1169
  %conv5 = trunc i32 %shr to i16, !dbg !1168
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1170
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1171
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1172
  %conv6 = zext i16 %5 to i32, !dbg !1172
  %add = add i32 %4, %conv6, !dbg !1173
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1174
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1175
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1176
  %conv7 = zext i16 %7 to i32, !dbg !1176
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1177
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1177
  %div = udiv i32 %6, %conv7, !dbg !1177, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1178
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1179
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1181
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1182

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1183
  %and = and i32 %9, 65535, !dbg !1185
  %conv11 = trunc i32 %and to i16, !dbg !1186
  store i16 %conv11, i16* %retval, align 2, !dbg !1187
  br label %return, !dbg !1187

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1188
  br label %return, !dbg !1188

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1190
  ret i16 %10, !dbg !1190
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1191 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1194, metadata !DIExpression()), !dbg !1195
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1196, metadata !DIExpression()), !dbg !1197
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1198, metadata !DIExpression()), !dbg !1199
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1200, metadata !DIExpression()), !dbg !1201
  store i32 0, i32* %u32Temp1, align 4, !dbg !1201
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1202
  %cmp = icmp eq i32 %0, 0, !dbg !1204
  br i1 %cmp, label %if.then, label %if.else, !dbg !1205

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1206
  br label %return, !dbg !1206

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1208
  %conv = zext i16 %1 to i32, !dbg !1208
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1210
  %conv1 = zext i16 %2 to i32, !dbg !1210
  %mul = mul nsw i32 %conv, %conv1, !dbg !1211
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1212
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1213
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1213
  %div = udiv i32 %mul, %3, !dbg !1213, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1214
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1215
  %conv2 = zext i16 %4 to i32, !dbg !1215
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1217
  %conv3 = zext i16 %5 to i32, !dbg !1217
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1218
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1219
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1220
  %mul5 = mul i32 %6, %7, !dbg !1221
  %sub = sub i32 %mul4, %mul5, !dbg !1222
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1223
  %div6 = udiv i32 %8, 2, !dbg !1224
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1225
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1226

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1227
  %inc = add i32 %9, 1, !dbg !1227
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1227
  br label %if.end, !dbg !1229

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1230
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1232
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1233

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1234
  %and = and i32 %11, 65535, !dbg !1236
  %conv13 = trunc i32 %and to i16, !dbg !1237
  store i16 %conv13, i16* %retval, align 2, !dbg !1238
  br label %return, !dbg !1238

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1239
  br label %return, !dbg !1239

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1241
  ret i16 %12, !dbg !1241
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1242 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1245, metadata !DIExpression()), !dbg !1246
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1247, metadata !DIExpression()), !dbg !1248
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1249, metadata !DIExpression()), !dbg !1250
  store i32 0, i32* %u32Temp1, align 4, !dbg !1250
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1251
  %conv = zext i16 %0 to i32, !dbg !1251
  %cmp = icmp eq i32 %conv, 0, !dbg !1253
  br i1 %cmp, label %if.then, label %if.else, !dbg !1254

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1255
  br label %return, !dbg !1255

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1257
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1259
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1260
  %conv2 = zext i16 %3 to i32, !dbg !1260
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1261
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1261
  %div = udiv i32 %2, %conv2, !dbg !1261, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1262
  %conv3 = zext i16 %4 to i32, !dbg !1262
  %mul = mul i32 %div, %conv3, !dbg !1263
  %sub = sub i32 %1, %mul, !dbg !1264
  %shl = shl i32 %sub, 1, !dbg !1265
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1266
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1267
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1268
  %conv4 = zext i16 %6 to i32, !dbg !1268
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1269
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1269
  %div5 = udiv i32 %5, %conv4, !dbg !1269, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1270
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1271
  %conv6 = zext i16 %8 to i32, !dbg !1271
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1272
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1272
  %div7 = udiv i32 %7, %conv6, !dbg !1272, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1273
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1274
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1275
  store i32 %9, i32* %retval, align 4, !dbg !1276
  br label %return, !dbg !1276

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1277
  ret i32 %10, !dbg !1277
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1278 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1281, metadata !DIExpression()), !dbg !1282
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1283, metadata !DIExpression()), !dbg !1284
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1285, metadata !DIExpression()), !dbg !1286
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1287, metadata !DIExpression()), !dbg !1288
  store i32 0, i32* %s32Temp1, align 4, !dbg !1288
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1289, metadata !DIExpression()), !dbg !1290
  store i32 0, i32* %s32Temp2, align 4, !dbg !1290
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1291, metadata !DIExpression()), !dbg !1292
  store i32 0, i32* %s32Temp3, align 4, !dbg !1292
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1293
  %conv = sext i16 %0 to i32, !dbg !1293
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1294
  %conv1 = sext i16 %1 to i32, !dbg !1294
  %mul = mul nsw i32 %conv, %conv1, !dbg !1295
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1296
  %2 = load i16, i16* %div.addr, align 2, !dbg !1297
  %conv2 = sext i16 %2 to i32, !dbg !1297
  %cmp = icmp eq i32 %conv2, 0, !dbg !1299
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1300

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1301
  %cmp4 = icmp slt i32 %3, 0, !dbg !1304
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1305

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1306
  br label %return, !dbg !1306

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1308
  br label %return, !dbg !1308

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1310
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1312
  %6 = load i16, i16* %div.addr, align 2, !dbg !1313
  %conv8 = sext i16 %6 to i32, !dbg !1313
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1314
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1314
  %div9 = sdiv i32 %5, %conv8, !dbg !1314, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1315
  %conv10 = sext i16 %7 to i32, !dbg !1315
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1316
  %sub = sub nsw i32 %4, %mul11, !dbg !1317
  %shl = shl i32 %sub, 1, !dbg !1318
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1319
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1320
  %9 = load i16, i16* %div.addr, align 2, !dbg !1321
  %conv12 = sext i16 %9 to i32, !dbg !1321
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1322
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1322
  %div13 = sdiv i32 %8, %conv12, !dbg !1322, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1323
  %11 = load i16, i16* %div.addr, align 2, !dbg !1324
  %conv14 = sext i16 %11 to i32, !dbg !1324
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1325
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1325
  %div15 = sdiv i32 %10, %conv14, !dbg !1325, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1326
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1327
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1328
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1330
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1331

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1332
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1335
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1336

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1337
  %conv22 = trunc i32 %14 to i16, !dbg !1339
  store i16 %conv22, i16* %retval, align 2, !dbg !1340
  br label %return, !dbg !1340

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1341
  br label %return, !dbg !1341

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1343
  br label %return, !dbg !1343

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1345
  ret i16 %15, !dbg !1345
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1346 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1349, metadata !DIExpression()), !dbg !1350
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1351, metadata !DIExpression()), !dbg !1352
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1353, metadata !DIExpression()), !dbg !1354
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1355, metadata !DIExpression()), !dbg !1356
  store i32 0, i32* %s32Result, align 4, !dbg !1356
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1357, metadata !DIExpression()), !dbg !1358
  store i32 0, i32* %s32Temp1, align 4, !dbg !1358
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1359
  %conv = sext i16 %0 to i32, !dbg !1359
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1360
  %conv1 = sext i16 %1 to i32, !dbg !1360
  %mul = mul nsw i32 %conv, %conv1, !dbg !1361
  store i32 %mul, i32* %s32Result, align 4, !dbg !1362
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1363
  %conv2 = zext i16 %2 to i32, !dbg !1363
  %cmp = icmp eq i32 %conv2, 0, !dbg !1365
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1366

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1367
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1370
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1371

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1372
  br label %return, !dbg !1372

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1374
  %cmp7 = icmp eq i32 %4, 0, !dbg !1376
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1377

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1378
  br label %return, !dbg !1378

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1380
  br label %return, !dbg !1380

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1382
  %6 = load i32, i32* %s32Result, align 4, !dbg !1384
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1385
  %conv12 = zext i16 %7 to i32, !dbg !1385
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1386
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1386
  %div = sdiv i32 %6, %conv12, !dbg !1386, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1387
  %conv13 = zext i16 %8 to i32, !dbg !1387
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1388
  %sub = sub nsw i32 %5, %mul14, !dbg !1389
  %shl = shl i32 %sub, 1, !dbg !1390
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1391
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1392
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1393
  %conv15 = zext i16 %10 to i32, !dbg !1393
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1394
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1394
  %div16 = sdiv i32 %9, %conv15, !dbg !1394, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1395
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1396
  %conv17 = zext i16 %12 to i32, !dbg !1396
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1397
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1397
  %div18 = sdiv i32 %11, %conv17, !dbg !1397, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1398
  store i32 %add, i32* %s32Result, align 4, !dbg !1399
  %13 = load i32, i32* %s32Result, align 4, !dbg !1400
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1402
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1403

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1404
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1407
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1408

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1409
  %conv25 = trunc i32 %15 to i16, !dbg !1411
  store i16 %conv25, i16* %retval, align 2, !dbg !1412
  br label %return, !dbg !1412

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1413
  br label %return, !dbg !1413

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1415
  br label %return, !dbg !1415

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1417
  ret i16 %16, !dbg !1417
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1418 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1421, metadata !DIExpression()), !dbg !1422
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1423, metadata !DIExpression()), !dbg !1424
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1425, metadata !DIExpression()), !dbg !1426
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1427
  %cmp = icmp eq i32 %0, 0, !dbg !1429
  br i1 %cmp, label %if.then, label %if.else, !dbg !1430

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1431
  br label %return, !dbg !1431

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1433
  %cmp1 = icmp sle i32 %1, 0, !dbg !1436
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1437

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1438
  br label %return, !dbg !1438

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1440
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1442
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1443
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1444
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1444
  %div = udiv i32 %3, %4, !dbg !1444, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1445
  %mul = mul i32 %div, %5, !dbg !1446
  %sub = sub i32 %2, %mul, !dbg !1447
  %shl = shl i32 %sub, 1, !dbg !1448
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1449
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1450
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1451
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1452
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1452
  %div4 = udiv i32 %6, %7, !dbg !1452, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1453
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1454
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1455
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1455
  %div5 = udiv i32 %8, %9, !dbg !1455, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1456
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1457
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1458
  store i32 %10, i32* %retval, align 4, !dbg !1459
  br label %return, !dbg !1459

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1460
  ret i32 %11, !dbg !1460
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1461 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1464, metadata !DIExpression()), !dbg !1465
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1466, metadata !DIExpression()), !dbg !1467
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1468, metadata !DIExpression()), !dbg !1469
  store i32 0, i32* %s32Temp1, align 4, !dbg !1469
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1470
  %cmp = icmp eq i32 %0, 0, !dbg !1472
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1473

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1474
  %cmp1 = icmp sge i32 %1, 0, !dbg !1477
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1478

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1479
  br label %return, !dbg !1479

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1481
  br label %return, !dbg !1481

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1483
  %cmp4 = icmp sge i32 %2, 0, !dbg !1486
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1487

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1488
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1490
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1491
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1492
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1492
  %div = udiv i32 %4, %5, !dbg !1492, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1493
  %mul = mul i32 %div, %6, !dbg !1494
  %sub = sub i32 %3, %mul, !dbg !1495
  %shl = shl i32 %sub, 1, !dbg !1496
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1497
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1498
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1499
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1500
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1500
  %div6 = udiv i32 %7, %8, !dbg !1500, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1501
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1502
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1503
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1503
  %div7 = udiv i32 %9, %10, !dbg !1503, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1504
  store i32 %add, i32* %retval, align 4, !dbg !1505
  br label %return, !dbg !1505

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1506
  br label %return, !dbg !1506

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1508
  ret i32 %11, !dbg !1508
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1509 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1512, metadata !DIExpression()), !dbg !1513
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1514, metadata !DIExpression()), !dbg !1515
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1516, metadata !DIExpression()), !dbg !1517
  store i32 0, i32* %u32Temp1, align 4, !dbg !1517
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1518, metadata !DIExpression()), !dbg !1519
  store i32 0, i32* %u32Temp2, align 4, !dbg !1519
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1520
  %cmp = icmp eq i32 %0, 0, !dbg !1522
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1523

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1524
  %cmp1 = icmp slt i32 %1, 0, !dbg !1527
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1528

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1529
  br label %return, !dbg !1529

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1531
  br label %return, !dbg !1531

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1533
  %cmp4 = icmp sge i32 %2, 0, !dbg !1536
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1537

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1538
  %cmp6 = icmp eq i32 %3, 0, !dbg !1541
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1542

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1543
  br label %return, !dbg !1543

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1545
  %cmp9 = icmp sle i32 %4, 0, !dbg !1548
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1549

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1550
  br label %return, !dbg !1550

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1552
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1554
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1555
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1556
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1556
  %div = sdiv i32 %6, %7, !dbg !1556, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1557
  %mul = mul nsw i32 %div, %8, !dbg !1558
  %sub = sub nsw i32 %5, %mul, !dbg !1559
  %shl = shl i32 %sub, 1, !dbg !1560
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1561
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1562
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1563
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1564
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1564
  %div12 = udiv i32 %9, %10, !dbg !1564, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1565
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1566
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1567
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1567
  %div13 = sdiv i32 %11, %12, !dbg !1567, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1568
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1569
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1570
  store i32 %13, i32* %retval, align 4, !dbg !1571
  br label %return, !dbg !1571

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1572
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1575
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1576

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1577
  br label %return, !dbg !1577

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1579
  %sub18 = sub nsw i32 0, %15, !dbg !1581
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1582
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1583
  %sub19 = sub nsw i32 0, %16, !dbg !1584
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1585
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1586
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1587
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1588
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1589
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1589
  %div20 = sdiv i32 %18, %19, !dbg !1589, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1590
  %mul21 = mul nsw i32 %div20, %20, !dbg !1591
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1592
  %shl23 = shl i32 %sub22, 1, !dbg !1593
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1594
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1595
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1596
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1597
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1597
  %div24 = udiv i32 %21, %22, !dbg !1597, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1598
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1599
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1600
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1600
  %div25 = sdiv i32 %23, %24, !dbg !1600, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1601
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1602
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1603
  store i32 %25, i32* %retval, align 4, !dbg !1604
  br label %return, !dbg !1604

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1605
  ret i32 %26, !dbg !1605
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1606 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1609, metadata !DIExpression()), !dbg !1610
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1611, metadata !DIExpression()), !dbg !1612
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1613, metadata !DIExpression()), !dbg !1614
  store i32 0, i32* %u32Temp1, align 4, !dbg !1614
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1615, metadata !DIExpression()), !dbg !1616
  store i32 0, i32* %u32Temp2, align 4, !dbg !1616
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1617, metadata !DIExpression()), !dbg !1618
  store i32 0, i32* %u32Temp3, align 4, !dbg !1618
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1619, metadata !DIExpression()), !dbg !1620
  store i32 0, i32* %numerator_old, align 4, !dbg !1620
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1621
  %cmp = icmp eq i32 %0, 0, !dbg !1623
  br i1 %cmp, label %if.then, label %if.else, !dbg !1624

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1625
  br label %return, !dbg !1625

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1627
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1629
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1630
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1631
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1632
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1632
  %div = udiv i32 %3, %4, !dbg !1632, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1633
  %sub = sub i32 %1, %mul, !dbg !1634
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1635
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1636
  %and = and i32 %5, 1, !dbg !1638
  %cmp1 = icmp eq i32 %and, 0, !dbg !1639
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1640

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1641
  %shr = lshr i32 %6, 1, !dbg !1643
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1644
  br label %if.end, !dbg !1645

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1646
  %shr4 = lshr i32 %7, 1, !dbg !1648
  %add = add i32 %shr4, 1, !dbg !1649
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1650
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1651
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1653
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1654
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1655

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1656
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1658
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1659
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1659
  %div7 = udiv i32 %10, %11, !dbg !1659, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1660
  br label %return, !dbg !1660

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1661
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1663
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1664
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1664
  %div9 = udiv i32 %12, %13, !dbg !1664, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1665
  store i32 %add10, i32* %retval, align 4, !dbg !1666
  br label %return, !dbg !1666

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1667
  ret i32 %14, !dbg !1667
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1668 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1671, metadata !DIExpression()), !dbg !1672
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1673, metadata !DIExpression()), !dbg !1674
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1675, metadata !DIExpression()), !dbg !1676
  store i32 0, i32* %u32Temp1, align 4, !dbg !1676
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1677, metadata !DIExpression()), !dbg !1678
  store i32 0, i32* %u32Temp2, align 4, !dbg !1678
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1679
  %cmp = icmp sle i32 %0, 0, !dbg !1681
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1682

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1683
  %cmp1 = icmp sge i32 %1, 0, !dbg !1686
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1687

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1688
  br label %return, !dbg !1688

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1690
  %sub = sub nsw i32 0, %2, !dbg !1692
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1693
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1694
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1695
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1696
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1697
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1697
  %div = udiv i32 %4, %5, !dbg !1697, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1698
  %mul = mul i32 %div, %6, !dbg !1699
  %sub3 = sub i32 %3, %mul, !dbg !1700
  %shl = shl i32 %sub3, 1, !dbg !1701
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1702
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1703
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1704
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1705
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1705
  %div4 = udiv i32 %7, %8, !dbg !1705, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1706
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1707
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1708
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1708
  %div5 = udiv i32 %9, %10, !dbg !1708, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1709
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1710
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1711
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1713
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1714

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1715
  %sub8 = sub i32 0, %12, !dbg !1717
  store i32 %sub8, i32* %retval, align 4, !dbg !1718
  br label %return, !dbg !1718

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1719
  br label %return, !dbg !1719

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1721
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1723
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1724
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1725
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1725
  %div11 = udiv i32 %14, %15, !dbg !1725, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1726
  %mul12 = mul i32 %div11, %16, !dbg !1727
  %sub13 = sub i32 %13, %mul12, !dbg !1728
  %shl14 = shl i32 %sub13, 1, !dbg !1729
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1730
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1731
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1732
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1733
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1733
  %div15 = udiv i32 %17, %18, !dbg !1733, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1734
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1735
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1736
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1736
  %div16 = udiv i32 %19, %20, !dbg !1736, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1737
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1738
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1739
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1741
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1742

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1743
  store i32 %22, i32* %retval, align 4, !dbg !1745
  br label %return, !dbg !1745

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1746
  br label %return, !dbg !1746

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1748
  ret i32 %23, !dbg !1748
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1749 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1752, metadata !DIExpression()), !dbg !1753
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1754, metadata !DIExpression()), !dbg !1755
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1756, metadata !DIExpression()), !dbg !1757
  store i32 0, i32* %s32Temp1, align 4, !dbg !1757
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1758, metadata !DIExpression()), !dbg !1759
  store i32 0, i32* %s32Temp2, align 4, !dbg !1759
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1760, metadata !DIExpression()), !dbg !1761
  store i32 0, i32* %u32Temp0, align 4, !dbg !1761
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1762, metadata !DIExpression()), !dbg !1763
  store i32 0, i32* %u32Temp1, align 4, !dbg !1763
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1764, metadata !DIExpression()), !dbg !1765
  store i32 0, i32* %u32Temp2, align 4, !dbg !1765
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1766
  %cmp = icmp eq i32 %0, 0, !dbg !1768
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1769

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1770
  %cmp1 = icmp slt i32 %1, 0, !dbg !1773
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1774

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1775
  br label %return, !dbg !1775

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1777
  br label %return, !dbg !1777

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1779
  %cmp4 = icmp sle i32 %2, 0, !dbg !1782
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1783

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1784
  %sub = sub nsw i32 0, %3, !dbg !1786
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1787
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1788
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1789
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1790
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1790
  %div = udiv i32 %4, %5, !dbg !1790, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1791
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1792
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1793
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1794
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1795
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1795
  %div6 = udiv i32 %7, %8, !dbg !1795, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1796
  %mul = mul i32 %div6, %9, !dbg !1797
  %sub7 = sub i32 %6, %mul, !dbg !1798
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1799
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1800
  %and = and i32 %10, 1, !dbg !1802
  %cmp8 = icmp eq i32 %and, 0, !dbg !1803
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1804

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1805
  %shr = lshr i32 %11, 1, !dbg !1807
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1808
  br label %if.end, !dbg !1809

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1810
  %shr11 = lshr i32 %12, 1, !dbg !1812
  %add = add i32 %shr11, 1, !dbg !1813
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1814
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1815
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1817
  %cmp12 = icmp ult i32 %13, %14, !dbg !1818
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1819

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1820
  %neg = xor i32 %15, -1, !dbg !1822
  %add14 = add i32 %neg, 1, !dbg !1823
  store i32 %add14, i32* %retval, align 4, !dbg !1824
  br label %return, !dbg !1824

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1825
  %add16 = add i32 %16, 1, !dbg !1827
  %neg17 = xor i32 %add16, -1, !dbg !1828
  %add18 = add i32 %neg17, 1, !dbg !1829
  store i32 %add18, i32* %retval, align 4, !dbg !1830
  br label %return, !dbg !1830

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1831
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1833
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1834
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1835
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1835
  %div20 = udiv i32 %18, %19, !dbg !1835, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1836
  %mul21 = mul i32 %div20, %20, !dbg !1837
  %sub22 = sub i32 %17, %mul21, !dbg !1838
  %shl = shl i32 %sub22, 1, !dbg !1839
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1840
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1841
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1842
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1843
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1843
  %div23 = udiv i32 %21, %22, !dbg !1843, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1844
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1845
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1846
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1846
  %div24 = udiv i32 %23, %24, !dbg !1846, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1847
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1848
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1849
  store i32 %25, i32* %retval, align 4, !dbg !1850
  br label %return, !dbg !1850

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1851
  ret i32 %26, !dbg !1851
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1852 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1855, metadata !DIExpression()), !dbg !1856
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1857, metadata !DIExpression()), !dbg !1858
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1859, metadata !DIExpression()), !dbg !1860
  store i32 0, i32* %s32Temp1, align 4, !dbg !1860
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1861, metadata !DIExpression()), !dbg !1862
  store i32 0, i32* %s32Temp2, align 4, !dbg !1862
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1863, metadata !DIExpression()), !dbg !1864
  store i32 0, i32* %denominator_prime, align 4, !dbg !1864
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1865, metadata !DIExpression()), !dbg !1866
  store i32 0, i32* %u32Temp1, align 4, !dbg !1866
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1867, metadata !DIExpression()), !dbg !1868
  store i32 0, i32* %u32Temp2, align 4, !dbg !1868
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1869, metadata !DIExpression()), !dbg !1870
  store i32 0, i32* %u32numerator, align 4, !dbg !1870
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1871, metadata !DIExpression()), !dbg !1872
  store i32 0, i32* %u32denominator, align 4, !dbg !1872
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1873
  %cmp = icmp slt i32 %0, 0, !dbg !1875
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1876

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1877
  %cmp1 = icmp sle i32 %1, 0, !dbg !1880
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1881

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1882
  %cmp3 = icmp sge i32 %2, 0, !dbg !1885
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1886

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1887
  br label %return, !dbg !1887

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1889
  %sub = sub nsw i32 0, %3, !dbg !1891
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1892
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1893
  %sub5 = sub nsw i32 0, %4, !dbg !1894
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1895
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1896
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1897
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1898
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1899
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1899
  %div = udiv i32 %6, %7, !dbg !1899, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1900
  %mul = mul i32 %div, %8, !dbg !1901
  %sub6 = sub i32 %5, %mul, !dbg !1902
  %shl = shl i32 %sub6, 1, !dbg !1903
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1904
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1905
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1906
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1907
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1907
  %div7 = udiv i32 %9, %10, !dbg !1907, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1908
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1909
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1910
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1910
  %div8 = udiv i32 %11, %12, !dbg !1910, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1911
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1912
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1913
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1915
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1916

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1917
  store i32 %14, i32* %retval, align 4, !dbg !1919
  br label %return, !dbg !1919

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1920
  br label %return, !dbg !1920

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1922
  %neg = xor i32 %15, -1, !dbg !1924
  %add13 = add nsw i32 %neg, 1, !dbg !1925
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1926
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1927
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1928
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1929
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1930
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1930
  %div14 = udiv i32 %17, %18, !dbg !1930, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1931
  %mul15 = mul i32 %div14, %19, !dbg !1932
  %sub16 = sub i32 %16, %mul15, !dbg !1933
  %shl17 = shl i32 %sub16, 1, !dbg !1934
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1935
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1936
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1937
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1938
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1938
  %div18 = udiv i32 %20, %21, !dbg !1938, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1939
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1940
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1941
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1941
  %div19 = sdiv i32 %22, %23, !dbg !1941, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1942
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1943
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1944
  %neg21 = xor i32 %24, -1, !dbg !1945
  %add22 = add nsw i32 %neg21, 1, !dbg !1946
  store i32 %add22, i32* %retval, align 4, !dbg !1947
  br label %return, !dbg !1947

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1948
  %cmp24 = icmp sle i32 %25, 0, !dbg !1951
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1952

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1953
  %cmp26 = icmp sge i32 %26, 0, !dbg !1956
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1957

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1958
  br label %return, !dbg !1958

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1960
  %neg29 = xor i32 %27, -1, !dbg !1962
  %add30 = add nsw i32 %neg29, 1, !dbg !1963
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1964
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1965
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1966
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1967
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1968
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1968
  %div31 = udiv i32 %29, %30, !dbg !1968, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1969
  %mul32 = mul i32 %div31, %31, !dbg !1970
  %sub33 = sub i32 %28, %mul32, !dbg !1971
  %shl34 = shl i32 %sub33, 1, !dbg !1972
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1973
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1974
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1975
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1976
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1976
  %div35 = udiv i32 %32, %33, !dbg !1976, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1977
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1978
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1979
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1979
  %div36 = udiv i32 %34, %35, !dbg !1979, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1980
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1981
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1982
  %neg38 = xor i32 %36, -1, !dbg !1983
  %add39 = add nsw i32 %neg38, 1, !dbg !1984
  store i32 %add39, i32* %retval, align 4, !dbg !1985
  br label %return, !dbg !1985

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1986
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1988
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1989
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1990
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1990
  %div41 = sdiv i32 %38, %39, !dbg !1990, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1991
  %mul42 = mul nsw i32 %div41, %40, !dbg !1992
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1993
  %shl44 = shl i32 %sub43, 1, !dbg !1994
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1995
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1996
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1997
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1998
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1998
  %div45 = sdiv i32 %41, %42, !dbg !1998, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1999
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !2000
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !2001
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !2001
  %div46 = udiv i32 %43, %44, !dbg !2001, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !2002
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !2003
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !2004
  store i32 %45, i32* %retval, align 4, !dbg !2005
  br label %return, !dbg !2005

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !2006
  ret i32 %46, !dbg !2006
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !2007 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !2010, metadata !DIExpression()), !dbg !2011
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !2012, metadata !DIExpression()), !dbg !2013
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !2014, metadata !DIExpression()), !dbg !2015
  store i32 0, i32* %numerator_prime, align 4, !dbg !2015
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2016, metadata !DIExpression()), !dbg !2017
  store i32 0, i32* %u32Temp1, align 4, !dbg !2017
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2018, metadata !DIExpression()), !dbg !2019
  store i32 0, i32* %u32Temp2, align 4, !dbg !2019
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2020, metadata !DIExpression()), !dbg !2021
  store i32 0, i32* %u32Temp3, align 4, !dbg !2021
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !2022, metadata !DIExpression()), !dbg !2023
  store i32 0, i32* %s32Temp1, align 4, !dbg !2023
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !2024, metadata !DIExpression()), !dbg !2025
  store i32 0, i32* %s32Temp2, align 4, !dbg !2025
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !2026, metadata !DIExpression()), !dbg !2027
  store i32 0, i32* %s32Temp3, align 4, !dbg !2027
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !2028
  %cmp = icmp eq i32 %0, 0, !dbg !2030
  br i1 %cmp, label %if.then, label %if.else3, !dbg !2031

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !2032
  %cmp1 = icmp slt i32 %1, 0, !dbg !2035
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !2036

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !2037
  br label %return, !dbg !2037

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !2039
  br label %return, !dbg !2039

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !2041
  %cmp4 = icmp slt i32 %2, 0, !dbg !2044
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !2045

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !2046
  %sub = sub nsw i32 0, %3, !dbg !2048
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !2049
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !2050
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !2051
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !2052
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !2052
  %div = udiv i32 %4, %5, !dbg !2052, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !2053
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !2054
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !2055
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !2056
  %mul = mul i32 %7, %8, !dbg !2057
  %sub6 = sub i32 %6, %mul, !dbg !2058
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !2059
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !2060
  %and = and i32 %9, 1, !dbg !2062
  %cmp7 = icmp eq i32 %and, 0, !dbg !2063
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !2064

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !2065
  %shr = lshr i32 %10, 1, !dbg !2067
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !2068
  br label %if.end, !dbg !2069

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !2070
  %shr10 = lshr i32 %11, 1, !dbg !2072
  %add = add i32 %shr10, 1, !dbg !2073
  store i32 %add, i32* %denominator.addr, align 4, !dbg !2074
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2075
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !2077
  %cmp11 = icmp ult i32 %12, %13, !dbg !2078
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !2079

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2080
  %neg = xor i32 %14, -1, !dbg !2082
  %add13 = add i32 %neg, 1, !dbg !2083
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !2084
  br label %if.end18, !dbg !2085

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !2086
  %add15 = add i32 %15, 1, !dbg !2088
  %neg16 = xor i32 %add15, -1, !dbg !2089
  %add17 = add i32 %neg16, 1, !dbg !2090
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !2091
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !2092
  %cmp19 = icmp sge i32 %16, -32768, !dbg !2094
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !2095

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !2096
  %conv = trunc i32 %17 to i16, !dbg !2098
  store i16 %conv, i16* %retval, align 2, !dbg !2099
  br label %return, !dbg !2099

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !2100
  br label %return, !dbg !2100

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !2102
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !2104
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !2105
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !2105
  %div23 = udiv i32 %18, %19, !dbg !2105, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !2106
  %mul24 = mul i32 %div23, %20, !dbg !2107
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !2108
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !2109
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !2110
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !2111
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !2112
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !2112
  %div25 = udiv i32 %22, %23, !dbg !2112, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !2113
  %mul26 = mul i32 %div25, %24, !dbg !2114
  %sub27 = sub i32 %21, %mul26, !dbg !2115
  %shl = shl i32 %sub27, 1, !dbg !2116
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !2117
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !2118
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !2119
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !2120
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !2120
  %div28 = udiv i32 %25, %26, !dbg !2120, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !2121
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !2122
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !2123
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !2123
  %div29 = udiv i32 %27, %28, !dbg !2123, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !2124
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2125
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2126
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2128
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2129

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2130
  %conv34 = trunc i32 %30 to i16, !dbg !2132
  store i16 %conv34, i16* %retval, align 2, !dbg !2133
  br label %return, !dbg !2133

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2134
  br label %return, !dbg !2134

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2136
  ret i16 %31, !dbg !2136
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2137 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2143, metadata !DIExpression()), !dbg !2144
  %2 = icmp eq i64 %0, 0, !dbg !2145
  br i1 %2, label %3, label %4, !dbg !2147

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2148
  unreachable, !dbg !2148

4:                                                ; preds = %1
  ret void, !dbg !2149
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2150 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2156, metadata !DIExpression()), !dbg !2158
  call void @llvm.dbg.value(metadata i64 %1, metadata !2157, metadata !DIExpression()), !dbg !2158
  %3 = icmp ult i64 %1, %0, !dbg !2159
  br i1 %3, label %5, label %4, !dbg !2161

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2162
  unreachable, !dbg !2162

5:                                                ; preds = %2
  ret void, !dbg !2164
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0041/div_Ccode_alarm_0041.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0041")
!4 = !{}
!5 = !{!6, !13, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0041")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0041")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0041/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0041")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0041")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0041")
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
!454 = !DILocation(line: 364, column: 54, scope: !455)
!455 = distinct !DILexicalBlock(scope: !362, file: !69, line: 364, column: 9)
!456 = !DILocation(line: 364, column: 44, scope: !455)
!457 = !DILocation(line: 364, column: 81, scope: !455)
!458 = !DILocation(line: 364, column: 76, scope: !455)
!459 = !DILocation(line: 364, column: 66, scope: !455)
!460 = !DILocation(line: 364, column: 11, scope: !455)
!461 = !DILocation(line: 364, column: 9, scope: !362)
!462 = !DILocation(line: 365, column: 9, scope: !463)
!463 = distinct !DILexicalBlock(scope: !455, file: !69, line: 364, column: 97)
!464 = !DILocation(line: 372, column: 37, scope: !362)
!465 = !DILocation(line: 372, column: 54, scope: !362)
!466 = !DILocation(line: 372, column: 49, scope: !362)
!467 = !DILocation(line: 372, column: 47, scope: !362)
!468 = !DILocation(line: 372, column: 27, scope: !362)
!469 = !DILocation(line: 372, column: 25, scope: !362)
!470 = !DILocation(line: 373, column: 5, scope: !362)
!471 = !DILocation(line: 393, column: 5, scope: !472)
!472 = distinct !DILexicalBlock(scope: !356, file: !69, line: 392, column: 4)
!473 = !DILocation(line: 399, column: 1, scope: !186)
!474 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !475, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!475 = !DISubroutineType(types: !476)
!476 = !{!19, !13}
!477 = !DILocalVariable(name: "denominator", arg: 1, scope: !474, file: !33, line: 24, type: !13)
!478 = !DILocation(line: 24, column: 40, scope: !474)
!479 = !DILocation(line: 26, column: 12, scope: !474)
!480 = !DILocation(line: 26, column: 24, scope: !474)
!481 = !DILocation(line: 26, column: 5, scope: !474)
!482 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !475, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!483 = !DILocalVariable(name: "left", arg: 1, scope: !482, file: !33, line: 84, type: !13)
!484 = !DILocation(line: 84, column: 51, scope: !482)
!485 = !DILocation(line: 86, column: 12, scope: !482)
!486 = !DILocation(line: 86, column: 17, scope: !482)
!487 = !DILocation(line: 86, column: 5, scope: !482)
!488 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !489, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!489 = !DISubroutineType(types: !490)
!490 = !{!19, !13, !20}
!491 = !DILocalVariable(name: "left", arg: 1, scope: !488, file: !33, line: 90, type: !13)
!492 = !DILocation(line: 90, column: 41, scope: !488)
!493 = !DILocalVariable(name: "count", arg: 2, scope: !488, file: !33, line: 90, type: !20)
!494 = !DILocation(line: 90, column: 56, scope: !488)
!495 = !DILocation(line: 92, column: 9, scope: !496)
!496 = distinct !DILexicalBlock(scope: !488, file: !33, line: 92, column: 9)
!497 = !DILocation(line: 92, column: 15, scope: !496)
!498 = !DILocation(line: 92, column: 9, scope: !488)
!499 = !DILocation(line: 93, column: 9, scope: !500)
!500 = distinct !DILexicalBlock(scope: !496, file: !33, line: 92, column: 32)
!501 = !DILocation(line: 95, column: 12, scope: !488)
!502 = !DILocation(line: 95, column: 34, scope: !488)
!503 = !DILocation(line: 95, column: 31, scope: !488)
!504 = !DILocation(line: 95, column: 17, scope: !488)
!505 = !DILocation(line: 95, column: 41, scope: !488)
!506 = !DILocation(line: 95, column: 5, scope: !488)
!507 = !DILocation(line: 96, column: 1, scope: !488)
!508 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !509, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!509 = !DISubroutineType(types: !510)
!510 = !{!19, !13, !13}
!511 = !DILocalVariable(name: "left", arg: 1, scope: !508, file: !33, line: 78, type: !13)
!512 = !DILocation(line: 78, column: 38, scope: !508)
!513 = !DILocalVariable(name: "right", arg: 2, scope: !508, file: !33, line: 78, type: !13)
!514 = !DILocation(line: 78, column: 52, scope: !508)
!515 = !DILocation(line: 80, column: 12, scope: !508)
!516 = !DILocation(line: 80, column: 19, scope: !508)
!517 = !DILocation(line: 80, column: 17, scope: !508)
!518 = !DILocation(line: 80, column: 25, scope: !508)
!519 = !DILocation(line: 80, column: 5, scope: !508)
!520 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !509, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!521 = !DILocalVariable(name: "left", arg: 1, scope: !520, file: !33, line: 72, type: !13)
!522 = !DILocation(line: 72, column: 38, scope: !520)
!523 = !DILocalVariable(name: "right", arg: 2, scope: !520, file: !33, line: 72, type: !13)
!524 = !DILocation(line: 72, column: 52, scope: !520)
!525 = !DILocation(line: 74, column: 12, scope: !520)
!526 = !DILocation(line: 74, column: 19, scope: !520)
!527 = !DILocation(line: 74, column: 17, scope: !520)
!528 = !DILocation(line: 74, column: 25, scope: !520)
!529 = !DILocation(line: 74, column: 5, scope: !520)
!530 = distinct !DISubprogram(name: "klee_alarm_s32_add_lower", scope: !33, file: !33, line: 48, type: !509, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!531 = !DILocalVariable(name: "left", arg: 1, scope: !530, file: !33, line: 48, type: !13)
!532 = !DILocation(line: 48, column: 38, scope: !530)
!533 = !DILocalVariable(name: "right", arg: 2, scope: !530, file: !33, line: 48, type: !13)
!534 = !DILocation(line: 48, column: 52, scope: !530)
!535 = !DILocation(line: 50, column: 12, scope: !530)
!536 = !DILocation(line: 50, column: 19, scope: !530)
!537 = !DILocation(line: 50, column: 17, scope: !530)
!538 = !DILocation(line: 50, column: 25, scope: !530)
!539 = !DILocation(line: 50, column: 5, scope: !530)
!540 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !509, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!541 = !DILocalVariable(name: "left", arg: 1, scope: !540, file: !33, line: 54, type: !13)
!542 = !DILocation(line: 54, column: 38, scope: !540)
!543 = !DILocalVariable(name: "right", arg: 2, scope: !540, file: !33, line: 54, type: !13)
!544 = !DILocation(line: 54, column: 52, scope: !540)
!545 = !DILocation(line: 56, column: 12, scope: !540)
!546 = !DILocation(line: 56, column: 19, scope: !540)
!547 = !DILocation(line: 56, column: 17, scope: !540)
!548 = !DILocation(line: 56, column: 25, scope: !540)
!549 = !DILocation(line: 56, column: 5, scope: !540)
!550 = distinct !DISubprogram(name: "klee_alarm_s32_div_representable", scope: !33, file: !33, line: 30, type: !509, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!551 = !DILocalVariable(name: "numerator", arg: 1, scope: !550, file: !33, line: 30, type: !13)
!552 = !DILocation(line: 30, column: 46, scope: !550)
!553 = !DILocalVariable(name: "denominator", arg: 2, scope: !550, file: !33, line: 30, type: !13)
!554 = !DILocation(line: 30, column: 65, scope: !550)
!555 = !DILocation(line: 32, column: 14, scope: !550)
!556 = !DILocation(line: 32, column: 24, scope: !550)
!557 = !DILocation(line: 32, column: 37, scope: !550)
!558 = !DILocation(line: 32, column: 12, scope: !550)
!559 = !DILocation(line: 32, column: 5, scope: !550)
!560 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 417, type: !561, scopeLine: 418, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!561 = !DISubroutineType(types: !562)
!562 = !{!6, !6, !28}
!563 = !DILocalVariable(name: "numerator", arg: 1, scope: !560, file: !69, line: 417, type: !6)
!564 = !DILocation(line: 417, column: 31, scope: !560)
!565 = !DILocalVariable(name: "denominator", arg: 2, scope: !560, file: !69, line: 417, type: !28)
!566 = !DILocation(line: 417, column: 47, scope: !560)
!567 = !DILocalVariable(name: "u16Temp1", scope: !560, file: !69, line: 419, type: !28)
!568 = !DILocation(line: 419, column: 6, scope: !560)
!569 = !DILocalVariable(name: "s32Temp1", scope: !560, file: !69, line: 420, type: !16)
!570 = !DILocation(line: 420, column: 6, scope: !560)
!571 = !DILocalVariable(name: "s32Temp2", scope: !560, file: !69, line: 420, type: !16)
!572 = !DILocation(line: 420, column: 15, scope: !560)
!573 = !DILocation(line: 421, column: 13, scope: !560)
!574 = !DILocation(line: 421, column: 25, scope: !560)
!575 = !DILocation(line: 421, column: 11, scope: !560)
!576 = !DILocation(line: 422, column: 13, scope: !560)
!577 = !DILocation(line: 422, column: 22, scope: !560)
!578 = !DILocation(line: 422, column: 11, scope: !560)
!579 = !DILocation(line: 423, column: 5, scope: !580)
!580 = distinct !DILexicalBlock(scope: !560, file: !69, line: 423, column: 5)
!581 = !DILocation(line: 423, column: 14, scope: !580)
!582 = !DILocation(line: 423, column: 5, scope: !560)
!583 = !DILocation(line: 425, column: 7, scope: !584)
!584 = distinct !DILexicalBlock(scope: !585, file: !69, line: 425, column: 7)
!585 = distinct !DILexicalBlock(scope: !580, file: !69, line: 424, column: 2)
!586 = !DILocation(line: 425, column: 17, scope: !584)
!587 = !DILocation(line: 425, column: 7, scope: !585)
!588 = !DILocation(line: 427, column: 4, scope: !589)
!589 = distinct !DILexicalBlock(scope: !584, file: !69, line: 426, column: 3)
!590 = !DILocation(line: 431, column: 4, scope: !591)
!591 = distinct !DILexicalBlock(scope: !584, file: !69, line: 430, column: 3)
!592 = !DILocation(line: 436, column: 15, scope: !593)
!593 = distinct !DILexicalBlock(scope: !580, file: !69, line: 435, column: 2)
!594 = !DILocation(line: 436, column: 24, scope: !593)
!595 = !DILocation(line: 436, column: 32, scope: !593)
!596 = !DILocation(line: 436, column: 41, scope: !593)
!597 = !DILocation(line: 436, column: 47, scope: !593)
!598 = !DILocation(line: 436, column: 46, scope: !593)
!599 = !DILocation(line: 436, column: 57, scope: !593)
!600 = !DILocation(line: 436, column: 56, scope: !593)
!601 = !DILocation(line: 436, column: 29, scope: !593)
!602 = !DILocation(line: 436, column: 12, scope: !593)
!603 = !DILocation(line: 437, column: 14, scope: !593)
!604 = !DILocation(line: 437, column: 22, scope: !593)
!605 = !DILocation(line: 437, column: 12, scope: !593)
!606 = !DILocation(line: 438, column: 14, scope: !593)
!607 = !DILocation(line: 438, column: 23, scope: !593)
!608 = !DILocation(line: 438, column: 22, scope: !593)
!609 = !DILocation(line: 438, column: 12, scope: !593)
!610 = !DILocation(line: 439, column: 16, scope: !593)
!611 = !DILocation(line: 439, column: 25, scope: !593)
!612 = !DILocation(line: 439, column: 31, scope: !593)
!613 = !DILocation(line: 439, column: 30, scope: !593)
!614 = !DILocation(line: 439, column: 43, scope: !593)
!615 = !DILocation(line: 439, column: 41, scope: !593)
!616 = !DILocation(line: 439, column: 12, scope: !593)
!617 = !DILocation(line: 440, column: 6, scope: !618)
!618 = distinct !DILexicalBlock(scope: !593, file: !69, line: 440, column: 6)
!619 = !DILocation(line: 440, column: 15, scope: !618)
!620 = !DILocation(line: 440, column: 6, scope: !593)
!621 = !DILocation(line: 442, column: 7, scope: !622)
!622 = distinct !DILexicalBlock(scope: !623, file: !69, line: 442, column: 7)
!623 = distinct !DILexicalBlock(scope: !618, file: !69, line: 441, column: 3)
!624 = !DILocation(line: 442, column: 16, scope: !622)
!625 = !DILocation(line: 442, column: 7, scope: !623)
!626 = !DILocation(line: 444, column: 17, scope: !627)
!627 = distinct !DILexicalBlock(scope: !622, file: !69, line: 443, column: 4)
!628 = !DILocation(line: 444, column: 12, scope: !627)
!629 = !DILocation(line: 444, column: 5, scope: !627)
!630 = !DILocation(line: 448, column: 5, scope: !631)
!631 = distinct !DILexicalBlock(scope: !622, file: !69, line: 447, column: 4)
!632 = !DILocation(line: 453, column: 4, scope: !633)
!633 = distinct !DILexicalBlock(scope: !618, file: !69, line: 452, column: 3)
!634 = !DILocation(line: 456, column: 1, scope: !560)
!635 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 473, type: !561, scopeLine: 474, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!636 = !DILocalVariable(name: "numerator", arg: 1, scope: !635, file: !69, line: 473, type: !6)
!637 = !DILocation(line: 473, column: 30, scope: !635)
!638 = !DILocalVariable(name: "denominator", arg: 2, scope: !635, file: !69, line: 473, type: !28)
!639 = !DILocation(line: 473, column: 45, scope: !635)
!640 = !DILocalVariable(name: "u16Temp1", scope: !635, file: !69, line: 475, type: !28)
!641 = !DILocation(line: 475, column: 6, scope: !635)
!642 = !DILocalVariable(name: "s32Temp1", scope: !635, file: !69, line: 476, type: !16)
!643 = !DILocation(line: 476, column: 6, scope: !635)
!644 = !DILocation(line: 477, column: 13, scope: !635)
!645 = !DILocation(line: 477, column: 25, scope: !635)
!646 = !DILocation(line: 477, column: 11, scope: !635)
!647 = !DILocation(line: 478, column: 5, scope: !648)
!648 = distinct !DILexicalBlock(scope: !635, file: !69, line: 478, column: 5)
!649 = !DILocation(line: 478, column: 13, scope: !648)
!650 = !DILocation(line: 478, column: 5, scope: !635)
!651 = !DILocation(line: 480, column: 6, scope: !652)
!652 = distinct !DILexicalBlock(scope: !653, file: !69, line: 480, column: 6)
!653 = distinct !DILexicalBlock(scope: !648, file: !69, line: 479, column: 2)
!654 = !DILocation(line: 480, column: 15, scope: !652)
!655 = !DILocation(line: 480, column: 6, scope: !653)
!656 = !DILocation(line: 482, column: 4, scope: !657)
!657 = distinct !DILexicalBlock(scope: !652, file: !69, line: 481, column: 3)
!658 = !DILocation(line: 486, column: 4, scope: !659)
!659 = distinct !DILexicalBlock(scope: !652, file: !69, line: 485, column: 3)
!660 = !DILocation(line: 492, column: 15, scope: !661)
!661 = distinct !DILexicalBlock(scope: !648, file: !69, line: 491, column: 2)
!662 = !DILocation(line: 492, column: 27, scope: !661)
!663 = !DILocation(line: 492, column: 37, scope: !661)
!664 = !DILocation(line: 492, column: 36, scope: !661)
!665 = !DILocation(line: 492, column: 49, scope: !661)
!666 = !DILocation(line: 492, column: 47, scope: !661)
!667 = !DILocation(line: 492, column: 25, scope: !661)
!668 = !DILocation(line: 492, column: 59, scope: !661)
!669 = !DILocation(line: 492, column: 12, scope: !661)
!670 = !DILocation(line: 493, column: 15, scope: !661)
!671 = !DILocation(line: 493, column: 24, scope: !661)
!672 = !DILocation(line: 493, column: 23, scope: !661)
!673 = !DILocation(line: 493, column: 37, scope: !661)
!674 = !DILocation(line: 493, column: 47, scope: !661)
!675 = !DILocation(line: 493, column: 46, scope: !661)
!676 = !DILocation(line: 493, column: 34, scope: !661)
!677 = !DILocation(line: 493, column: 12, scope: !661)
!678 = !DILocation(line: 494, column: 10, scope: !661)
!679 = !DILocation(line: 494, column: 3, scope: !661)
!680 = !DILocation(line: 496, column: 1, scope: !635)
!681 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 514, type: !682, scopeLine: 515, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!682 = !DISubroutineType(types: !683)
!683 = !{!24, !28, !28}
!684 = !DILocalVariable(name: "numerator", arg: 1, scope: !681, file: !69, line: 514, type: !28)
!685 = !DILocation(line: 514, column: 28, scope: !681)
!686 = !DILocalVariable(name: "denominator", arg: 2, scope: !681, file: !69, line: 514, type: !28)
!687 = !DILocation(line: 514, column: 43, scope: !681)
!688 = !DILocalVariable(name: "u32Temp1", scope: !681, file: !69, line: 516, type: !689)
!689 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !20)
!690 = !DILocation(line: 516, column: 6, scope: !681)
!691 = !DILocalVariable(name: "u32Temp2", scope: !681, file: !69, line: 516, type: !689)
!692 = !DILocation(line: 516, column: 20, scope: !681)
!693 = !DILocalVariable(name: "u32Temp3", scope: !681, file: !69, line: 516, type: !689)
!694 = !DILocation(line: 516, column: 33, scope: !681)
!695 = !DILocation(line: 517, column: 5, scope: !696)
!696 = distinct !DILexicalBlock(scope: !681, file: !69, line: 517, column: 5)
!697 = !DILocation(line: 517, column: 16, scope: !696)
!698 = !DILocation(line: 517, column: 5, scope: !681)
!699 = !DILocation(line: 519, column: 3, scope: !700)
!700 = distinct !DILexicalBlock(scope: !696, file: !69, line: 518, column: 2)
!701 = !DILocation(line: 523, column: 15, scope: !702)
!702 = distinct !DILexicalBlock(scope: !696, file: !69, line: 522, column: 2)
!703 = !DILocation(line: 523, column: 24, scope: !702)
!704 = !DILocation(line: 523, column: 12, scope: !702)
!705 = !DILocation(line: 524, column: 14, scope: !702)
!706 = !DILocation(line: 524, column: 25, scope: !702)
!707 = !DILocation(line: 524, column: 23, scope: !702)
!708 = !DILocation(line: 524, column: 12, scope: !702)
!709 = !DILocation(line: 525, column: 15, scope: !702)
!710 = !DILocation(line: 525, column: 24, scope: !702)
!711 = !DILocation(line: 525, column: 32, scope: !702)
!712 = !DILocation(line: 525, column: 12, scope: !702)
!713 = !DILocation(line: 526, column: 6, scope: !714)
!714 = distinct !DILexicalBlock(scope: !702, file: !69, line: 526, column: 6)
!715 = !DILocation(line: 526, column: 15, scope: !714)
!716 = !DILocation(line: 526, column: 6, scope: !702)
!717 = !DILocation(line: 528, column: 15, scope: !718)
!718 = distinct !DILexicalBlock(scope: !714, file: !69, line: 527, column: 3)
!719 = !DILocation(line: 528, column: 11, scope: !718)
!720 = !DILocation(line: 528, column: 4, scope: !718)
!721 = !DILocation(line: 532, column: 4, scope: !722)
!722 = distinct !DILexicalBlock(scope: !714, file: !69, line: 531, column: 3)
!723 = !DILocation(line: 535, column: 1, scope: !681)
!724 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 552, type: !725, scopeLine: 553, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!725 = !DISubroutineType(types: !726)
!726 = !{!28, !16, !28}
!727 = !DILocalVariable(name: "x_value", arg: 1, scope: !724, file: !69, line: 552, type: !16)
!728 = !DILocation(line: 552, column: 25, scope: !724)
!729 = !DILocalVariable(name: "y_value", arg: 2, scope: !724, file: !69, line: 552, type: !28)
!730 = !DILocation(line: 552, column: 38, scope: !724)
!731 = !DILocalVariable(name: "s32Temp1", scope: !724, file: !69, line: 554, type: !16)
!732 = !DILocation(line: 554, column: 6, scope: !724)
!733 = !DILocation(line: 555, column: 12, scope: !724)
!734 = !DILocation(line: 555, column: 20, scope: !724)
!735 = !DILocation(line: 555, column: 10, scope: !724)
!736 = !DILocation(line: 556, column: 6, scope: !737)
!737 = distinct !DILexicalBlock(scope: !724, file: !69, line: 556, column: 5)
!738 = !DILocation(line: 556, column: 14, scope: !737)
!739 = !DILocation(line: 556, column: 24, scope: !737)
!740 = !DILocation(line: 556, column: 5, scope: !724)
!741 = !DILocation(line: 558, column: 6, scope: !742)
!742 = distinct !DILexicalBlock(scope: !743, file: !69, line: 558, column: 6)
!743 = distinct !DILexicalBlock(scope: !737, file: !69, line: 557, column: 2)
!744 = !DILocation(line: 558, column: 14, scope: !742)
!745 = !DILocation(line: 558, column: 6, scope: !743)
!746 = !DILocation(line: 560, column: 4, scope: !747)
!747 = distinct !DILexicalBlock(scope: !742, file: !69, line: 559, column: 3)
!748 = !DILocation(line: 564, column: 4, scope: !749)
!749 = distinct !DILexicalBlock(scope: !742, file: !69, line: 563, column: 3)
!750 = !DILocation(line: 569, column: 15, scope: !751)
!751 = distinct !DILexicalBlock(scope: !737, file: !69, line: 568, column: 2)
!752 = !DILocation(line: 569, column: 27, scope: !751)
!753 = !DILocation(line: 569, column: 35, scope: !751)
!754 = !DILocation(line: 569, column: 34, scope: !751)
!755 = !DILocation(line: 569, column: 46, scope: !751)
!756 = !DILocation(line: 569, column: 44, scope: !751)
!757 = !DILocation(line: 569, column: 23, scope: !751)
!758 = !DILocation(line: 569, column: 56, scope: !751)
!759 = !DILocation(line: 569, column: 12, scope: !751)
!760 = !DILocation(line: 570, column: 15, scope: !751)
!761 = !DILocation(line: 570, column: 24, scope: !751)
!762 = !DILocation(line: 570, column: 23, scope: !751)
!763 = !DILocation(line: 570, column: 36, scope: !751)
!764 = !DILocation(line: 570, column: 44, scope: !751)
!765 = !DILocation(line: 570, column: 43, scope: !751)
!766 = !DILocation(line: 570, column: 33, scope: !751)
!767 = !DILocation(line: 570, column: 12, scope: !751)
!768 = !DILocation(line: 571, column: 6, scope: !769)
!769 = distinct !DILexicalBlock(scope: !751, file: !69, line: 571, column: 6)
!770 = !DILocation(line: 571, column: 15, scope: !769)
!771 = !DILocation(line: 571, column: 6, scope: !751)
!772 = !DILocation(line: 573, column: 7, scope: !773)
!773 = distinct !DILexicalBlock(scope: !774, file: !69, line: 573, column: 7)
!774 = distinct !DILexicalBlock(scope: !769, file: !69, line: 572, column: 3)
!775 = !DILocation(line: 573, column: 16, scope: !773)
!776 = !DILocation(line: 573, column: 7, scope: !774)
!777 = !DILocation(line: 575, column: 17, scope: !778)
!778 = distinct !DILexicalBlock(scope: !773, file: !69, line: 574, column: 4)
!779 = !DILocation(line: 575, column: 12, scope: !778)
!780 = !DILocation(line: 575, column: 5, scope: !778)
!781 = !DILocation(line: 579, column: 5, scope: !782)
!782 = distinct !DILexicalBlock(scope: !773, file: !69, line: 578, column: 4)
!783 = !DILocation(line: 584, column: 4, scope: !784)
!784 = distinct !DILexicalBlock(scope: !769, file: !69, line: 583, column: 3)
!785 = !DILocation(line: 587, column: 1, scope: !724)
!786 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 605, type: !787, scopeLine: 606, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!787 = !DISubroutineType(types: !788)
!788 = !{!28, !28, !28}
!789 = !DILocalVariable(name: "numerator", arg: 1, scope: !786, file: !69, line: 605, type: !28)
!790 = !DILocation(line: 605, column: 31, scope: !786)
!791 = !DILocalVariable(name: "denominator", arg: 2, scope: !786, file: !69, line: 605, type: !28)
!792 = !DILocation(line: 605, column: 46, scope: !786)
!793 = !DILocalVariable(name: "u32Temp", scope: !786, file: !69, line: 607, type: !689)
!794 = !DILocation(line: 607, column: 6, scope: !786)
!795 = !DILocation(line: 608, column: 5, scope: !796)
!796 = distinct !DILexicalBlock(scope: !786, file: !69, line: 608, column: 5)
!797 = !DILocation(line: 608, column: 17, scope: !796)
!798 = !DILocation(line: 608, column: 5, scope: !786)
!799 = !DILocation(line: 610, column: 3, scope: !800)
!800 = distinct !DILexicalBlock(scope: !796, file: !69, line: 609, column: 2)
!801 = !DILocation(line: 614, column: 14, scope: !802)
!802 = distinct !DILexicalBlock(scope: !796, file: !69, line: 613, column: 2)
!803 = !DILocation(line: 614, column: 23, scope: !802)
!804 = !DILocation(line: 614, column: 32, scope: !802)
!805 = !DILocation(line: 614, column: 44, scope: !802)
!806 = !DILocation(line: 614, column: 29, scope: !802)
!807 = !DILocation(line: 614, column: 11, scope: !802)
!808 = !DILocation(line: 615, column: 13, scope: !802)
!809 = !DILocation(line: 615, column: 21, scope: !802)
!810 = !DILocation(line: 615, column: 20, scope: !802)
!811 = !DILocation(line: 615, column: 11, scope: !802)
!812 = !DILocation(line: 616, column: 6, scope: !813)
!813 = distinct !DILexicalBlock(scope: !802, file: !69, line: 616, column: 6)
!814 = !DILocation(line: 616, column: 14, scope: !813)
!815 = !DILocation(line: 616, column: 6, scope: !802)
!816 = !DILocation(line: 618, column: 11, scope: !817)
!817 = distinct !DILexicalBlock(scope: !813, file: !69, line: 617, column: 3)
!818 = !DILocation(line: 618, column: 19, scope: !817)
!819 = !DILocation(line: 618, column: 4, scope: !817)
!820 = !DILocation(line: 622, column: 4, scope: !821)
!821 = distinct !DILexicalBlock(scope: !813, file: !69, line: 621, column: 3)
!822 = !DILocation(line: 626, column: 1, scope: !786)
!823 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 643, type: !824, scopeLine: 644, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!824 = !DISubroutineType(types: !825)
!825 = !{!28, !689, !28}
!826 = !DILocalVariable(name: "x_value", arg: 1, scope: !823, file: !69, line: 643, type: !689)
!827 = !DILocation(line: 643, column: 25, scope: !823)
!828 = !DILocalVariable(name: "y_value", arg: 2, scope: !823, file: !69, line: 643, type: !28)
!829 = !DILocation(line: 643, column: 38, scope: !823)
!830 = !DILocalVariable(name: "u32Temp1", scope: !823, file: !69, line: 645, type: !689)
!831 = !DILocation(line: 645, column: 6, scope: !823)
!832 = !DILocalVariable(name: "u32Temp2", scope: !823, file: !69, line: 645, type: !689)
!833 = !DILocation(line: 645, column: 17, scope: !823)
!834 = !DILocation(line: 646, column: 12, scope: !823)
!835 = !DILocation(line: 646, column: 20, scope: !823)
!836 = !DILocation(line: 646, column: 10, scope: !823)
!837 = !DILocation(line: 647, column: 5, scope: !838)
!838 = distinct !DILexicalBlock(scope: !823, file: !69, line: 647, column: 5)
!839 = !DILocation(line: 647, column: 13, scope: !838)
!840 = !DILocation(line: 647, column: 5, scope: !823)
!841 = !DILocation(line: 649, column: 3, scope: !842)
!842 = distinct !DILexicalBlock(scope: !838, file: !69, line: 648, column: 2)
!843 = !DILocation(line: 653, column: 14, scope: !844)
!844 = distinct !DILexicalBlock(scope: !838, file: !69, line: 652, column: 2)
!845 = !DILocation(line: 653, column: 22, scope: !844)
!846 = !DILocation(line: 653, column: 21, scope: !844)
!847 = !DILocation(line: 653, column: 12, scope: !844)
!848 = !DILocation(line: 654, column: 14, scope: !844)
!849 = !DILocation(line: 654, column: 25, scope: !844)
!850 = !DILocation(line: 654, column: 36, scope: !844)
!851 = !DILocation(line: 654, column: 34, scope: !844)
!852 = !DILocation(line: 654, column: 22, scope: !844)
!853 = !DILocation(line: 654, column: 45, scope: !844)
!854 = !DILocation(line: 654, column: 12, scope: !844)
!855 = !DILocation(line: 655, column: 15, scope: !844)
!856 = !DILocation(line: 655, column: 24, scope: !844)
!857 = !DILocation(line: 655, column: 23, scope: !844)
!858 = !DILocation(line: 655, column: 36, scope: !844)
!859 = !DILocation(line: 655, column: 44, scope: !844)
!860 = !DILocation(line: 655, column: 43, scope: !844)
!861 = !DILocation(line: 655, column: 33, scope: !844)
!862 = !DILocation(line: 655, column: 12, scope: !844)
!863 = !DILocation(line: 656, column: 6, scope: !864)
!864 = distinct !DILexicalBlock(scope: !844, file: !69, line: 656, column: 6)
!865 = !DILocation(line: 656, column: 15, scope: !864)
!866 = !DILocation(line: 656, column: 6, scope: !844)
!867 = !DILocation(line: 658, column: 11, scope: !868)
!868 = distinct !DILexicalBlock(scope: !864, file: !69, line: 657, column: 3)
!869 = !DILocation(line: 658, column: 20, scope: !868)
!870 = !DILocation(line: 658, column: 4, scope: !868)
!871 = !DILocation(line: 662, column: 4, scope: !872)
!872 = distinct !DILexicalBlock(scope: !864, file: !69, line: 661, column: 3)
!873 = !DILocation(line: 666, column: 1, scope: !823)
!874 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 685, type: !875, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!875 = !DISubroutineType(types: !876)
!876 = !{!6, !6, !28, !6}
!877 = !DILocalVariable(name: "factor1", arg: 1, scope: !874, file: !69, line: 685, type: !6)
!878 = !DILocation(line: 685, column: 33, scope: !874)
!879 = !DILocalVariable(name: "factor2", arg: 2, scope: !874, file: !69, line: 685, type: !28)
!880 = !DILocation(line: 685, column: 46, scope: !874)
!881 = !DILocalVariable(name: "denominator", arg: 3, scope: !874, file: !69, line: 685, type: !6)
!882 = !DILocation(line: 685, column: 59, scope: !874)
!883 = !DILocalVariable(name: "s32Result", scope: !874, file: !69, line: 687, type: !16)
!884 = !DILocation(line: 687, column: 6, scope: !874)
!885 = !DILocalVariable(name: "s32Temp1", scope: !874, file: !69, line: 687, type: !16)
!886 = !DILocation(line: 687, column: 21, scope: !874)
!887 = !DILocation(line: 688, column: 14, scope: !874)
!888 = !DILocation(line: 688, column: 24, scope: !874)
!889 = !DILocation(line: 688, column: 22, scope: !874)
!890 = !DILocation(line: 688, column: 12, scope: !874)
!891 = !DILocation(line: 689, column: 5, scope: !892)
!892 = distinct !DILexicalBlock(scope: !874, file: !69, line: 689, column: 5)
!893 = !DILocation(line: 689, column: 17, scope: !892)
!894 = !DILocation(line: 689, column: 5, scope: !874)
!895 = !DILocation(line: 691, column: 6, scope: !896)
!896 = distinct !DILexicalBlock(scope: !897, file: !69, line: 691, column: 6)
!897 = distinct !DILexicalBlock(scope: !892, file: !69, line: 690, column: 2)
!898 = !DILocation(line: 691, column: 16, scope: !896)
!899 = !DILocation(line: 691, column: 6, scope: !897)
!900 = !DILocation(line: 693, column: 4, scope: !901)
!901 = distinct !DILexicalBlock(scope: !896, file: !69, line: 692, column: 3)
!902 = !DILocation(line: 697, column: 4, scope: !903)
!903 = distinct !DILexicalBlock(scope: !896, file: !69, line: 696, column: 3)
!904 = !DILocation(line: 702, column: 14, scope: !905)
!905 = distinct !DILexicalBlock(scope: !892, file: !69, line: 701, column: 2)
!906 = !DILocation(line: 702, column: 27, scope: !905)
!907 = !DILocation(line: 702, column: 37, scope: !905)
!908 = !DILocation(line: 702, column: 36, scope: !905)
!909 = !DILocation(line: 702, column: 50, scope: !905)
!910 = !DILocation(line: 702, column: 49, scope: !905)
!911 = !DILocation(line: 702, column: 24, scope: !905)
!912 = !DILocation(line: 702, column: 12, scope: !905)
!913 = !DILocation(line: 703, column: 14, scope: !905)
!914 = !DILocation(line: 703, column: 23, scope: !905)
!915 = !DILocation(line: 703, column: 12, scope: !905)
!916 = !DILocation(line: 704, column: 16, scope: !905)
!917 = !DILocation(line: 704, column: 25, scope: !905)
!918 = !DILocation(line: 704, column: 24, scope: !905)
!919 = !DILocation(line: 704, column: 41, scope: !905)
!920 = !DILocation(line: 704, column: 51, scope: !905)
!921 = !DILocation(line: 704, column: 50, scope: !905)
!922 = !DILocation(line: 704, column: 38, scope: !905)
!923 = !DILocation(line: 704, column: 13, scope: !905)
!924 = !DILocation(line: 705, column: 6, scope: !925)
!925 = distinct !DILexicalBlock(scope: !905, file: !69, line: 705, column: 6)
!926 = !DILocation(line: 705, column: 16, scope: !925)
!927 = !DILocation(line: 705, column: 6, scope: !905)
!928 = !DILocation(line: 707, column: 7, scope: !929)
!929 = distinct !DILexicalBlock(scope: !930, file: !69, line: 707, column: 7)
!930 = distinct !DILexicalBlock(scope: !925, file: !69, line: 706, column: 3)
!931 = !DILocation(line: 707, column: 17, scope: !929)
!932 = !DILocation(line: 707, column: 7, scope: !930)
!933 = !DILocation(line: 709, column: 17, scope: !934)
!934 = distinct !DILexicalBlock(scope: !929, file: !69, line: 708, column: 4)
!935 = !DILocation(line: 709, column: 12, scope: !934)
!936 = !DILocation(line: 709, column: 5, scope: !934)
!937 = !DILocation(line: 714, column: 5, scope: !938)
!938 = distinct !DILexicalBlock(scope: !929, file: !69, line: 713, column: 4)
!939 = !DILocation(line: 719, column: 4, scope: !940)
!940 = distinct !DILexicalBlock(scope: !925, file: !69, line: 718, column: 3)
!941 = !DILocation(line: 723, column: 1, scope: !874)
!942 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 741, type: !943, scopeLine: 742, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!943 = !DISubroutineType(types: !944)
!944 = !{!6, !28, !6, !28}
!945 = !DILocalVariable(name: "factor1", arg: 1, scope: !942, file: !69, line: 741, type: !28)
!946 = !DILocation(line: 741, column: 33, scope: !942)
!947 = !DILocalVariable(name: "factor2", arg: 2, scope: !942, file: !69, line: 741, type: !6)
!948 = !DILocation(line: 741, column: 46, scope: !942)
!949 = !DILocalVariable(name: "denominator", arg: 3, scope: !942, file: !69, line: 741, type: !28)
!950 = !DILocation(line: 741, column: 59, scope: !942)
!951 = !DILocalVariable(name: "s32Result", scope: !942, file: !69, line: 743, type: !16)
!952 = !DILocation(line: 743, column: 6, scope: !942)
!953 = !DILocalVariable(name: "s32Temp1", scope: !942, file: !69, line: 743, type: !16)
!954 = !DILocation(line: 743, column: 21, scope: !942)
!955 = !DILocation(line: 744, column: 14, scope: !942)
!956 = !DILocation(line: 744, column: 24, scope: !942)
!957 = !DILocation(line: 744, column: 22, scope: !942)
!958 = !DILocation(line: 744, column: 12, scope: !942)
!959 = !DILocation(line: 745, column: 5, scope: !960)
!960 = distinct !DILexicalBlock(scope: !942, file: !69, line: 745, column: 5)
!961 = !DILocation(line: 745, column: 16, scope: !960)
!962 = !DILocation(line: 745, column: 5, scope: !942)
!963 = !DILocation(line: 747, column: 6, scope: !964)
!964 = distinct !DILexicalBlock(scope: !965, file: !69, line: 747, column: 6)
!965 = distinct !DILexicalBlock(scope: !960, file: !69, line: 746, column: 2)
!966 = !DILocation(line: 747, column: 16, scope: !964)
!967 = !DILocation(line: 747, column: 6, scope: !965)
!968 = !DILocation(line: 749, column: 4, scope: !969)
!969 = distinct !DILexicalBlock(scope: !964, file: !69, line: 748, column: 3)
!970 = !DILocation(line: 753, column: 4, scope: !971)
!971 = distinct !DILexicalBlock(scope: !964, file: !69, line: 752, column: 3)
!972 = !DILocation(line: 758, column: 14, scope: !973)
!973 = distinct !DILexicalBlock(scope: !960, file: !69, line: 757, column: 2)
!974 = !DILocation(line: 758, column: 28, scope: !973)
!975 = !DILocation(line: 758, column: 38, scope: !973)
!976 = !DILocation(line: 758, column: 37, scope: !973)
!977 = !DILocation(line: 758, column: 53, scope: !973)
!978 = !DILocation(line: 758, column: 51, scope: !973)
!979 = !DILocation(line: 758, column: 24, scope: !973)
!980 = !DILocation(line: 758, column: 66, scope: !973)
!981 = !DILocation(line: 758, column: 12, scope: !973)
!982 = !DILocation(line: 759, column: 16, scope: !973)
!983 = !DILocation(line: 759, column: 25, scope: !973)
!984 = !DILocation(line: 759, column: 24, scope: !973)
!985 = !DILocation(line: 759, column: 41, scope: !973)
!986 = !DILocation(line: 759, column: 51, scope: !973)
!987 = !DILocation(line: 759, column: 50, scope: !973)
!988 = !DILocation(line: 759, column: 38, scope: !973)
!989 = !DILocation(line: 759, column: 13, scope: !973)
!990 = !DILocation(line: 760, column: 6, scope: !991)
!991 = distinct !DILexicalBlock(scope: !973, file: !69, line: 760, column: 6)
!992 = !DILocation(line: 760, column: 16, scope: !991)
!993 = !DILocation(line: 760, column: 6, scope: !973)
!994 = !DILocation(line: 762, column: 7, scope: !995)
!995 = distinct !DILexicalBlock(scope: !996, file: !69, line: 762, column: 7)
!996 = distinct !DILexicalBlock(scope: !991, file: !69, line: 761, column: 3)
!997 = !DILocation(line: 762, column: 17, scope: !995)
!998 = !DILocation(line: 762, column: 7, scope: !996)
!999 = !DILocation(line: 764, column: 17, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !995, file: !69, line: 763, column: 4)
!1001 = !DILocation(line: 764, column: 12, scope: !1000)
!1002 = !DILocation(line: 764, column: 5, scope: !1000)
!1003 = !DILocation(line: 768, column: 5, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !995, file: !69, line: 767, column: 4)
!1005 = !DILocation(line: 773, column: 4, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !991, file: !69, line: 772, column: 3)
!1007 = !DILocation(line: 776, column: 1, scope: !942)
!1008 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 795, type: !1009, scopeLine: 796, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1009 = !DISubroutineType(types: !1010)
!1010 = !{!28, !6, !28, !6}
!1011 = !DILocalVariable(name: "factor1", arg: 1, scope: !1008, file: !69, line: 795, type: !6)
!1012 = !DILocation(line: 795, column: 33, scope: !1008)
!1013 = !DILocalVariable(name: "factor2", arg: 2, scope: !1008, file: !69, line: 795, type: !28)
!1014 = !DILocation(line: 795, column: 46, scope: !1008)
!1015 = !DILocalVariable(name: "denominator", arg: 3, scope: !1008, file: !69, line: 795, type: !6)
!1016 = !DILocation(line: 795, column: 59, scope: !1008)
!1017 = !DILocalVariable(name: "u32Result", scope: !1008, file: !69, line: 797, type: !689)
!1018 = !DILocation(line: 797, column: 6, scope: !1008)
!1019 = !DILocalVariable(name: "u32Temp1", scope: !1008, file: !69, line: 797, type: !689)
!1020 = !DILocation(line: 797, column: 21, scope: !1008)
!1021 = !DILocalVariable(name: "s32Result", scope: !1008, file: !69, line: 798, type: !16)
!1022 = !DILocation(line: 798, column: 6, scope: !1008)
!1023 = !DILocalVariable(name: "s32Temp1", scope: !1008, file: !69, line: 798, type: !16)
!1024 = !DILocation(line: 798, column: 21, scope: !1008)
!1025 = !DILocation(line: 799, column: 14, scope: !1008)
!1026 = !DILocation(line: 799, column: 24, scope: !1008)
!1027 = !DILocation(line: 799, column: 22, scope: !1008)
!1028 = !DILocation(line: 799, column: 12, scope: !1008)
!1029 = !DILocation(line: 801, column: 5, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1008, file: !69, line: 801, column: 5)
!1031 = !DILocation(line: 801, column: 17, scope: !1030)
!1032 = !DILocation(line: 801, column: 5, scope: !1008)
!1033 = !DILocation(line: 803, column: 6, scope: !1034)
!1034 = distinct !DILexicalBlock(scope: !1035, file: !69, line: 803, column: 6)
!1035 = distinct !DILexicalBlock(scope: !1030, file: !69, line: 802, column: 2)
!1036 = !DILocation(line: 803, column: 16, scope: !1034)
!1037 = !DILocation(line: 803, column: 6, scope: !1035)
!1038 = !DILocation(line: 805, column: 4, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1034, file: !69, line: 804, column: 3)
!1040 = !DILocation(line: 809, column: 4, scope: !1041)
!1041 = distinct !DILexicalBlock(scope: !1034, file: !69, line: 808, column: 3)
!1042 = !DILocation(line: 814, column: 15, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !1030, file: !69, line: 813, column: 2)
!1044 = !DILocation(line: 814, column: 29, scope: !1043)
!1045 = !DILocation(line: 814, column: 39, scope: !1043)
!1046 = !DILocation(line: 814, column: 38, scope: !1043)
!1047 = !DILocation(line: 814, column: 54, scope: !1043)
!1048 = !DILocation(line: 814, column: 52, scope: !1043)
!1049 = !DILocation(line: 814, column: 25, scope: !1043)
!1050 = !DILocation(line: 814, column: 68, scope: !1043)
!1051 = !DILocation(line: 814, column: 12, scope: !1043)
!1052 = !DILocation(line: 815, column: 16, scope: !1043)
!1053 = !DILocation(line: 815, column: 25, scope: !1043)
!1054 = !DILocation(line: 815, column: 24, scope: !1043)
!1055 = !DILocation(line: 815, column: 41, scope: !1043)
!1056 = !DILocation(line: 815, column: 51, scope: !1043)
!1057 = !DILocation(line: 815, column: 50, scope: !1043)
!1058 = !DILocation(line: 815, column: 38, scope: !1043)
!1059 = !DILocation(line: 815, column: 13, scope: !1043)
!1060 = !DILocation(line: 816, column: 6, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1043, file: !69, line: 816, column: 6)
!1062 = !DILocation(line: 816, column: 16, scope: !1061)
!1063 = !DILocation(line: 816, column: 6, scope: !1043)
!1064 = !DILocation(line: 818, column: 7, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1066, file: !69, line: 818, column: 7)
!1066 = distinct !DILexicalBlock(scope: !1061, file: !69, line: 817, column: 3)
!1067 = !DILocation(line: 818, column: 17, scope: !1065)
!1068 = !DILocation(line: 818, column: 7, scope: !1066)
!1069 = !DILocation(line: 820, column: 17, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1065, file: !69, line: 819, column: 4)
!1071 = !DILocation(line: 820, column: 12, scope: !1070)
!1072 = !DILocation(line: 820, column: 5, scope: !1070)
!1073 = !DILocation(line: 824, column: 5, scope: !1074)
!1074 = distinct !DILexicalBlock(scope: !1065, file: !69, line: 823, column: 4)
!1075 = !DILocation(line: 829, column: 4, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1061, file: !69, line: 828, column: 3)
!1077 = !DILocation(line: 832, column: 1, scope: !1008)
!1078 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 851, type: !1079, scopeLine: 852, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1079 = !DISubroutineType(types: !1080)
!1080 = !{!28, !6, !28, !28}
!1081 = !DILocalVariable(name: "factor1", arg: 1, scope: !1078, file: !69, line: 851, type: !6)
!1082 = !DILocation(line: 851, column: 33, scope: !1078)
!1083 = !DILocalVariable(name: "factor2", arg: 2, scope: !1078, file: !69, line: 851, type: !28)
!1084 = !DILocation(line: 851, column: 46, scope: !1078)
!1085 = !DILocalVariable(name: "denominator", arg: 3, scope: !1078, file: !69, line: 851, type: !28)
!1086 = !DILocation(line: 851, column: 59, scope: !1078)
!1087 = !DILocalVariable(name: "s32Result", scope: !1078, file: !69, line: 853, type: !16)
!1088 = !DILocation(line: 853, column: 6, scope: !1078)
!1089 = !DILocalVariable(name: "s32Temp1", scope: !1078, file: !69, line: 853, type: !16)
!1090 = !DILocation(line: 853, column: 21, scope: !1078)
!1091 = !DILocation(line: 854, column: 14, scope: !1078)
!1092 = !DILocation(line: 854, column: 24, scope: !1078)
!1093 = !DILocation(line: 854, column: 22, scope: !1078)
!1094 = !DILocation(line: 854, column: 12, scope: !1078)
!1095 = !DILocation(line: 856, column: 5, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1078, file: !69, line: 856, column: 5)
!1097 = !DILocation(line: 856, column: 17, scope: !1096)
!1098 = !DILocation(line: 856, column: 5, scope: !1078)
!1099 = !DILocation(line: 858, column: 6, scope: !1100)
!1100 = distinct !DILexicalBlock(scope: !1101, file: !69, line: 858, column: 6)
!1101 = distinct !DILexicalBlock(scope: !1096, file: !69, line: 857, column: 2)
!1102 = !DILocation(line: 858, column: 16, scope: !1100)
!1103 = !DILocation(line: 858, column: 6, scope: !1101)
!1104 = !DILocation(line: 860, column: 4, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1100, file: !69, line: 859, column: 3)
!1106 = !DILocation(line: 864, column: 4, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1100, file: !69, line: 863, column: 3)
!1108 = !DILocation(line: 869, column: 15, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1096, file: !69, line: 868, column: 2)
!1110 = !DILocation(line: 869, column: 29, scope: !1109)
!1111 = !DILocation(line: 869, column: 39, scope: !1109)
!1112 = !DILocation(line: 869, column: 38, scope: !1109)
!1113 = !DILocation(line: 869, column: 54, scope: !1109)
!1114 = !DILocation(line: 869, column: 52, scope: !1109)
!1115 = !DILocation(line: 869, column: 25, scope: !1109)
!1116 = !DILocation(line: 869, column: 68, scope: !1109)
!1117 = !DILocation(line: 869, column: 12, scope: !1109)
!1118 = !DILocation(line: 870, column: 16, scope: !1109)
!1119 = !DILocation(line: 870, column: 25, scope: !1109)
!1120 = !DILocation(line: 870, column: 24, scope: !1109)
!1121 = !DILocation(line: 870, column: 41, scope: !1109)
!1122 = !DILocation(line: 870, column: 51, scope: !1109)
!1123 = !DILocation(line: 870, column: 50, scope: !1109)
!1124 = !DILocation(line: 870, column: 38, scope: !1109)
!1125 = !DILocation(line: 870, column: 13, scope: !1109)
!1126 = !DILocation(line: 871, column: 6, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1109, file: !69, line: 871, column: 6)
!1128 = !DILocation(line: 871, column: 16, scope: !1127)
!1129 = !DILocation(line: 871, column: 6, scope: !1109)
!1130 = !DILocation(line: 873, column: 7, scope: !1131)
!1131 = distinct !DILexicalBlock(scope: !1132, file: !69, line: 873, column: 7)
!1132 = distinct !DILexicalBlock(scope: !1127, file: !69, line: 872, column: 3)
!1133 = !DILocation(line: 873, column: 17, scope: !1131)
!1134 = !DILocation(line: 873, column: 7, scope: !1132)
!1135 = !DILocation(line: 875, column: 17, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1131, file: !69, line: 874, column: 4)
!1137 = !DILocation(line: 875, column: 12, scope: !1136)
!1138 = !DILocation(line: 875, column: 5, scope: !1136)
!1139 = !DILocation(line: 879, column: 5, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1131, file: !69, line: 878, column: 4)
!1141 = !DILocation(line: 884, column: 4, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1127, file: !69, line: 883, column: 3)
!1143 = !DILocation(line: 888, column: 1, scope: !1078)
!1144 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 906, type: !1145, scopeLine: 907, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1145 = !DISubroutineType(types: !1146)
!1146 = !{!28, !28, !28, !28}
!1147 = !DILocalVariable(name: "factor1", arg: 1, scope: !1144, file: !69, line: 906, type: !28)
!1148 = !DILocation(line: 906, column: 33, scope: !1144)
!1149 = !DILocalVariable(name: "factor2", arg: 2, scope: !1144, file: !69, line: 906, type: !28)
!1150 = !DILocation(line: 906, column: 46, scope: !1144)
!1151 = !DILocalVariable(name: "denominator", arg: 3, scope: !1144, file: !69, line: 906, type: !28)
!1152 = !DILocation(line: 906, column: 59, scope: !1144)
!1153 = !DILocalVariable(name: "u32Temp1", scope: !1144, file: !69, line: 908, type: !689)
!1154 = !DILocation(line: 908, column: 6, scope: !1144)
!1155 = !DILocalVariable(name: "u16TempDenom", scope: !1144, file: !69, line: 909, type: !28)
!1156 = !DILocation(line: 909, column: 6, scope: !1144)
!1157 = !DILocation(line: 911, column: 5, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1144, file: !69, line: 911, column: 5)
!1159 = !DILocation(line: 911, column: 17, scope: !1158)
!1160 = !DILocation(line: 911, column: 5, scope: !1144)
!1161 = !DILocation(line: 913, column: 3, scope: !1162)
!1162 = distinct !DILexicalBlock(scope: !1158, file: !69, line: 912, column: 2)
!1163 = !DILocation(line: 917, column: 14, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1158, file: !69, line: 916, column: 2)
!1165 = !DILocation(line: 917, column: 24, scope: !1164)
!1166 = !DILocation(line: 917, column: 22, scope: !1164)
!1167 = !DILocation(line: 917, column: 12, scope: !1164)
!1168 = !DILocation(line: 918, column: 18, scope: !1164)
!1169 = !DILocation(line: 918, column: 30, scope: !1164)
!1170 = !DILocation(line: 918, column: 16, scope: !1164)
!1171 = !DILocation(line: 919, column: 14, scope: !1164)
!1172 = !DILocation(line: 919, column: 25, scope: !1164)
!1173 = !DILocation(line: 919, column: 23, scope: !1164)
!1174 = !DILocation(line: 919, column: 12, scope: !1164)
!1175 = !DILocation(line: 920, column: 14, scope: !1164)
!1176 = !DILocation(line: 920, column: 25, scope: !1164)
!1177 = !DILocation(line: 920, column: 23, scope: !1164)
!1178 = !DILocation(line: 920, column: 12, scope: !1164)
!1179 = !DILocation(line: 921, column: 6, scope: !1180)
!1180 = distinct !DILexicalBlock(scope: !1164, file: !69, line: 921, column: 6)
!1181 = !DILocation(line: 921, column: 15, scope: !1180)
!1182 = !DILocation(line: 921, column: 6, scope: !1164)
!1183 = !DILocation(line: 923, column: 12, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1180, file: !69, line: 922, column: 3)
!1185 = !DILocation(line: 923, column: 21, scope: !1184)
!1186 = !DILocation(line: 923, column: 11, scope: !1184)
!1187 = !DILocation(line: 923, column: 4, scope: !1184)
!1188 = !DILocation(line: 928, column: 4, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1180, file: !69, line: 927, column: 3)
!1190 = !DILocation(line: 933, column: 1, scope: !1144)
!1191 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 950, type: !1192, scopeLine: 951, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1192 = !DISubroutineType(types: !1193)
!1193 = !{!28, !28, !28, !689}
!1194 = !DILocalVariable(name: "factor1", arg: 1, scope: !1191, file: !69, line: 950, type: !28)
!1195 = !DILocation(line: 950, column: 33, scope: !1191)
!1196 = !DILocalVariable(name: "factor2", arg: 2, scope: !1191, file: !69, line: 950, type: !28)
!1197 = !DILocation(line: 950, column: 46, scope: !1191)
!1198 = !DILocalVariable(name: "denominator", arg: 3, scope: !1191, file: !69, line: 950, type: !689)
!1199 = !DILocation(line: 950, column: 59, scope: !1191)
!1200 = !DILocalVariable(name: "u32Temp1", scope: !1191, file: !69, line: 952, type: !689)
!1201 = !DILocation(line: 952, column: 6, scope: !1191)
!1202 = !DILocation(line: 953, column: 5, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1191, file: !69, line: 953, column: 5)
!1204 = !DILocation(line: 953, column: 17, scope: !1203)
!1205 = !DILocation(line: 953, column: 5, scope: !1191)
!1206 = !DILocation(line: 955, column: 3, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1203, file: !69, line: 954, column: 2)
!1208 = !DILocation(line: 959, column: 15, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1203, file: !69, line: 958, column: 2)
!1210 = !DILocation(line: 959, column: 25, scope: !1209)
!1211 = !DILocation(line: 959, column: 23, scope: !1209)
!1212 = !DILocation(line: 959, column: 36, scope: !1209)
!1213 = !DILocation(line: 959, column: 34, scope: !1209)
!1214 = !DILocation(line: 959, column: 12, scope: !1209)
!1215 = !DILocation(line: 960, column: 8, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1209, file: !69, line: 960, column: 6)
!1217 = !DILocation(line: 960, column: 18, scope: !1216)
!1218 = !DILocation(line: 960, column: 16, scope: !1216)
!1219 = !DILocation(line: 960, column: 28, scope: !1216)
!1220 = !DILocation(line: 960, column: 40, scope: !1216)
!1221 = !DILocation(line: 960, column: 39, scope: !1216)
!1222 = !DILocation(line: 960, column: 26, scope: !1216)
!1223 = !DILocation(line: 960, column: 53, scope: !1216)
!1224 = !DILocation(line: 960, column: 64, scope: !1216)
!1225 = !DILocation(line: 960, column: 50, scope: !1216)
!1226 = !DILocation(line: 960, column: 6, scope: !1209)
!1227 = !DILocation(line: 962, column: 12, scope: !1228)
!1228 = distinct !DILexicalBlock(scope: !1216, file: !69, line: 961, column: 3)
!1229 = !DILocation(line: 963, column: 3, scope: !1228)
!1230 = !DILocation(line: 964, column: 6, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1209, file: !69, line: 964, column: 6)
!1232 = !DILocation(line: 964, column: 15, scope: !1231)
!1233 = !DILocation(line: 964, column: 6, scope: !1209)
!1234 = !DILocation(line: 966, column: 12, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1231, file: !69, line: 965, column: 3)
!1236 = !DILocation(line: 966, column: 21, scope: !1235)
!1237 = !DILocation(line: 966, column: 11, scope: !1235)
!1238 = !DILocation(line: 966, column: 4, scope: !1235)
!1239 = !DILocation(line: 970, column: 4, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1231, file: !69, line: 969, column: 3)
!1241 = !DILocation(line: 973, column: 1, scope: !1191)
!1242 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 990, type: !1243, scopeLine: 991, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1243 = !DISubroutineType(types: !1244)
!1244 = !{!689, !689, !28}
!1245 = !DILocalVariable(name: "x_value", arg: 1, scope: !1242, file: !69, line: 990, type: !689)
!1246 = !DILocation(line: 990, column: 25, scope: !1242)
!1247 = !DILocalVariable(name: "y_value", arg: 2, scope: !1242, file: !69, line: 990, type: !28)
!1248 = !DILocation(line: 990, column: 38, scope: !1242)
!1249 = !DILocalVariable(name: "u32Temp1", scope: !1242, file: !69, line: 992, type: !689)
!1250 = !DILocation(line: 992, column: 6, scope: !1242)
!1251 = !DILocation(line: 993, column: 5, scope: !1252)
!1252 = distinct !DILexicalBlock(scope: !1242, file: !69, line: 993, column: 5)
!1253 = !DILocation(line: 993, column: 13, scope: !1252)
!1254 = !DILocation(line: 993, column: 5, scope: !1242)
!1255 = !DILocation(line: 995, column: 3, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1252, file: !69, line: 994, column: 2)
!1257 = !DILocation(line: 999, column: 15, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1252, file: !69, line: 998, column: 2)
!1259 = !DILocation(line: 999, column: 26, scope: !1258)
!1260 = !DILocation(line: 999, column: 34, scope: !1258)
!1261 = !DILocation(line: 999, column: 33, scope: !1258)
!1262 = !DILocation(line: 999, column: 45, scope: !1258)
!1263 = !DILocation(line: 999, column: 43, scope: !1258)
!1264 = !DILocation(line: 999, column: 23, scope: !1258)
!1265 = !DILocation(line: 999, column: 54, scope: !1258)
!1266 = !DILocation(line: 999, column: 12, scope: !1258)
!1267 = !DILocation(line: 1000, column: 15, scope: !1258)
!1268 = !DILocation(line: 1000, column: 23, scope: !1258)
!1269 = !DILocation(line: 1000, column: 22, scope: !1258)
!1270 = !DILocation(line: 1000, column: 35, scope: !1258)
!1271 = !DILocation(line: 1000, column: 44, scope: !1258)
!1272 = !DILocation(line: 1000, column: 43, scope: !1258)
!1273 = !DILocation(line: 1000, column: 32, scope: !1258)
!1274 = !DILocation(line: 1000, column: 12, scope: !1258)
!1275 = !DILocation(line: 1001, column: 10, scope: !1258)
!1276 = !DILocation(line: 1001, column: 3, scope: !1258)
!1277 = !DILocation(line: 1003, column: 1, scope: !1242)
!1278 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 1021, type: !1279, scopeLine: 1022, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1279 = !DISubroutineType(types: !1280)
!1280 = !{!6, !6, !6, !6}
!1281 = !DILocalVariable(name: "fak1", arg: 1, scope: !1278, file: !69, line: 1021, type: !6)
!1282 = !DILocation(line: 1021, column: 33, scope: !1278)
!1283 = !DILocalVariable(name: "fak2", arg: 2, scope: !1278, file: !69, line: 1021, type: !6)
!1284 = !DILocation(line: 1021, column: 43, scope: !1278)
!1285 = !DILocalVariable(name: "div", arg: 3, scope: !1278, file: !69, line: 1021, type: !6)
!1286 = !DILocation(line: 1021, column: 53, scope: !1278)
!1287 = !DILocalVariable(name: "s32Temp1", scope: !1278, file: !69, line: 1023, type: !16)
!1288 = !DILocation(line: 1023, column: 6, scope: !1278)
!1289 = !DILocalVariable(name: "s32Temp2", scope: !1278, file: !69, line: 1023, type: !16)
!1290 = !DILocation(line: 1023, column: 20, scope: !1278)
!1291 = !DILocalVariable(name: "s32Temp3", scope: !1278, file: !69, line: 1023, type: !16)
!1292 = !DILocation(line: 1023, column: 34, scope: !1278)
!1293 = !DILocation(line: 1024, column: 13, scope: !1278)
!1294 = !DILocation(line: 1024, column: 20, scope: !1278)
!1295 = !DILocation(line: 1024, column: 18, scope: !1278)
!1296 = !DILocation(line: 1024, column: 11, scope: !1278)
!1297 = !DILocation(line: 1025, column: 5, scope: !1298)
!1298 = distinct !DILexicalBlock(scope: !1278, file: !69, line: 1025, column: 5)
!1299 = !DILocation(line: 1025, column: 9, scope: !1298)
!1300 = !DILocation(line: 1025, column: 5, scope: !1278)
!1301 = !DILocation(line: 1027, column: 6, scope: !1302)
!1302 = distinct !DILexicalBlock(scope: !1303, file: !69, line: 1027, column: 6)
!1303 = distinct !DILexicalBlock(scope: !1298, file: !69, line: 1026, column: 2)
!1304 = !DILocation(line: 1027, column: 15, scope: !1302)
!1305 = !DILocation(line: 1027, column: 6, scope: !1303)
!1306 = !DILocation(line: 1029, column: 4, scope: !1307)
!1307 = distinct !DILexicalBlock(scope: !1302, file: !69, line: 1028, column: 3)
!1308 = !DILocation(line: 1033, column: 4, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1302, file: !69, line: 1032, column: 3)
!1310 = !DILocation(line: 1038, column: 15, scope: !1311)
!1311 = distinct !DILexicalBlock(scope: !1298, file: !69, line: 1037, column: 2)
!1312 = !DILocation(line: 1038, column: 28, scope: !1311)
!1313 = !DILocation(line: 1038, column: 39, scope: !1311)
!1314 = !DILocation(line: 1038, column: 37, scope: !1311)
!1315 = !DILocation(line: 1038, column: 46, scope: !1311)
!1316 = !DILocation(line: 1038, column: 44, scope: !1311)
!1317 = !DILocation(line: 1038, column: 24, scope: !1311)
!1318 = !DILocation(line: 1038, column: 52, scope: !1311)
!1319 = !DILocation(line: 1038, column: 12, scope: !1311)
!1320 = !DILocation(line: 1039, column: 15, scope: !1311)
!1321 = !DILocation(line: 1039, column: 24, scope: !1311)
!1322 = !DILocation(line: 1039, column: 23, scope: !1311)
!1323 = !DILocation(line: 1039, column: 32, scope: !1311)
!1324 = !DILocation(line: 1039, column: 41, scope: !1311)
!1325 = !DILocation(line: 1039, column: 40, scope: !1311)
!1326 = !DILocation(line: 1039, column: 29, scope: !1311)
!1327 = !DILocation(line: 1039, column: 12, scope: !1311)
!1328 = !DILocation(line: 1040, column: 6, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1311, file: !69, line: 1040, column: 6)
!1330 = !DILocation(line: 1040, column: 15, scope: !1329)
!1331 = !DILocation(line: 1040, column: 6, scope: !1311)
!1332 = !DILocation(line: 1042, column: 7, scope: !1333)
!1333 = distinct !DILexicalBlock(scope: !1334, file: !69, line: 1042, column: 7)
!1334 = distinct !DILexicalBlock(scope: !1329, file: !69, line: 1041, column: 3)
!1335 = !DILocation(line: 1042, column: 16, scope: !1333)
!1336 = !DILocation(line: 1042, column: 7, scope: !1334)
!1337 = !DILocation(line: 1044, column: 17, scope: !1338)
!1338 = distinct !DILexicalBlock(scope: !1333, file: !69, line: 1043, column: 4)
!1339 = !DILocation(line: 1044, column: 12, scope: !1338)
!1340 = !DILocation(line: 1044, column: 5, scope: !1338)
!1341 = !DILocation(line: 1048, column: 5, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1333, file: !69, line: 1047, column: 4)
!1343 = !DILocation(line: 1053, column: 4, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1329, file: !69, line: 1052, column: 3)
!1345 = !DILocation(line: 1056, column: 1, scope: !1278)
!1346 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1074, type: !1347, scopeLine: 1075, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1347 = !DISubroutineType(types: !1348)
!1348 = !{!6, !6, !6, !28}
!1349 = !DILocalVariable(name: "data1", arg: 1, scope: !1346, file: !69, line: 1074, type: !6)
!1350 = !DILocation(line: 1074, column: 33, scope: !1346)
!1351 = !DILocalVariable(name: "data2", arg: 2, scope: !1346, file: !69, line: 1074, type: !6)
!1352 = !DILocation(line: 1074, column: 43, scope: !1346)
!1353 = !DILocalVariable(name: "denominator", arg: 3, scope: !1346, file: !69, line: 1074, type: !28)
!1354 = !DILocation(line: 1074, column: 53, scope: !1346)
!1355 = !DILocalVariable(name: "s32Result", scope: !1346, file: !69, line: 1076, type: !16)
!1356 = !DILocation(line: 1076, column: 6, scope: !1346)
!1357 = !DILocalVariable(name: "s32Temp1", scope: !1346, file: !69, line: 1076, type: !16)
!1358 = !DILocation(line: 1076, column: 21, scope: !1346)
!1359 = !DILocation(line: 1077, column: 14, scope: !1346)
!1360 = !DILocation(line: 1077, column: 22, scope: !1346)
!1361 = !DILocation(line: 1077, column: 20, scope: !1346)
!1362 = !DILocation(line: 1077, column: 12, scope: !1346)
!1363 = !DILocation(line: 1079, column: 5, scope: !1364)
!1364 = distinct !DILexicalBlock(scope: !1346, file: !69, line: 1079, column: 5)
!1365 = !DILocation(line: 1079, column: 17, scope: !1364)
!1366 = !DILocation(line: 1079, column: 5, scope: !1346)
!1367 = !DILocation(line: 1081, column: 6, scope: !1368)
!1368 = distinct !DILexicalBlock(scope: !1369, file: !69, line: 1081, column: 6)
!1369 = distinct !DILexicalBlock(scope: !1364, file: !69, line: 1080, column: 2)
!1370 = !DILocation(line: 1081, column: 16, scope: !1368)
!1371 = !DILocation(line: 1081, column: 6, scope: !1369)
!1372 = !DILocation(line: 1083, column: 4, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1368, file: !69, line: 1082, column: 3)
!1374 = !DILocation(line: 1085, column: 11, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1368, file: !69, line: 1085, column: 11)
!1376 = !DILocation(line: 1085, column: 21, scope: !1375)
!1377 = !DILocation(line: 1085, column: 11, scope: !1368)
!1378 = !DILocation(line: 1087, column: 4, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1375, file: !69, line: 1086, column: 3)
!1380 = !DILocation(line: 1091, column: 4, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1375, file: !69, line: 1090, column: 3)
!1382 = !DILocation(line: 1096, column: 15, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1364, file: !69, line: 1095, column: 2)
!1384 = !DILocation(line: 1096, column: 28, scope: !1383)
!1385 = !DILocation(line: 1096, column: 38, scope: !1383)
!1386 = !DILocation(line: 1096, column: 37, scope: !1383)
!1387 = !DILocation(line: 1096, column: 51, scope: !1383)
!1388 = !DILocation(line: 1096, column: 50, scope: !1383)
!1389 = !DILocation(line: 1096, column: 25, scope: !1383)
!1390 = !DILocation(line: 1096, column: 64, scope: !1383)
!1391 = !DILocation(line: 1096, column: 12, scope: !1383)
!1392 = !DILocation(line: 1097, column: 16, scope: !1383)
!1393 = !DILocation(line: 1097, column: 25, scope: !1383)
!1394 = !DILocation(line: 1097, column: 24, scope: !1383)
!1395 = !DILocation(line: 1097, column: 41, scope: !1383)
!1396 = !DILocation(line: 1097, column: 51, scope: !1383)
!1397 = !DILocation(line: 1097, column: 50, scope: !1383)
!1398 = !DILocation(line: 1097, column: 38, scope: !1383)
!1399 = !DILocation(line: 1097, column: 13, scope: !1383)
!1400 = !DILocation(line: 1098, column: 6, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1383, file: !69, line: 1098, column: 6)
!1402 = !DILocation(line: 1098, column: 16, scope: !1401)
!1403 = !DILocation(line: 1098, column: 6, scope: !1383)
!1404 = !DILocation(line: 1100, column: 7, scope: !1405)
!1405 = distinct !DILexicalBlock(scope: !1406, file: !69, line: 1100, column: 7)
!1406 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1099, column: 3)
!1407 = !DILocation(line: 1100, column: 17, scope: !1405)
!1408 = !DILocation(line: 1100, column: 7, scope: !1406)
!1409 = !DILocation(line: 1102, column: 17, scope: !1410)
!1410 = distinct !DILexicalBlock(scope: !1405, file: !69, line: 1101, column: 4)
!1411 = !DILocation(line: 1102, column: 12, scope: !1410)
!1412 = !DILocation(line: 1102, column: 5, scope: !1410)
!1413 = !DILocation(line: 1106, column: 5, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1405, file: !69, line: 1105, column: 4)
!1415 = !DILocation(line: 1111, column: 4, scope: !1416)
!1416 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1110, column: 3)
!1417 = !DILocation(line: 1115, column: 1, scope: !1346)
!1418 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1132, type: !1419, scopeLine: 1133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1419 = !DISubroutineType(types: !1420)
!1420 = !{!689, !689, !16}
!1421 = !DILocalVariable(name: "numerator", arg: 1, scope: !1418, file: !69, line: 1132, type: !689)
!1422 = !DILocation(line: 1132, column: 25, scope: !1418)
!1423 = !DILocalVariable(name: "denominator", arg: 2, scope: !1418, file: !69, line: 1132, type: !16)
!1424 = !DILocation(line: 1132, column: 40, scope: !1418)
!1425 = !DILocalVariable(name: "u32Temp1", scope: !1418, file: !69, line: 1134, type: !689)
!1426 = !DILocation(line: 1134, column: 6, scope: !1418)
!1427 = !DILocation(line: 1135, column: 5, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1418, file: !69, line: 1135, column: 5)
!1429 = !DILocation(line: 1135, column: 17, scope: !1428)
!1430 = !DILocation(line: 1135, column: 5, scope: !1418)
!1431 = !DILocation(line: 1137, column: 3, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1428, file: !69, line: 1136, column: 2)
!1433 = !DILocation(line: 1141, column: 6, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1435, file: !69, line: 1141, column: 6)
!1435 = distinct !DILexicalBlock(scope: !1428, file: !69, line: 1140, column: 2)
!1436 = !DILocation(line: 1141, column: 18, scope: !1434)
!1437 = !DILocation(line: 1141, column: 6, scope: !1435)
!1438 = !DILocation(line: 1143, column: 4, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1434, file: !69, line: 1142, column: 3)
!1440 = !DILocation(line: 1147, column: 16, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1434, file: !69, line: 1146, column: 3)
!1442 = !DILocation(line: 1147, column: 30, scope: !1441)
!1443 = !DILocation(line: 1147, column: 40, scope: !1441)
!1444 = !DILocation(line: 1147, column: 39, scope: !1441)
!1445 = !DILocation(line: 1147, column: 55, scope: !1441)
!1446 = !DILocation(line: 1147, column: 53, scope: !1441)
!1447 = !DILocation(line: 1147, column: 26, scope: !1441)
!1448 = !DILocation(line: 1147, column: 68, scope: !1441)
!1449 = !DILocation(line: 1147, column: 13, scope: !1441)
!1450 = !DILocation(line: 1148, column: 16, scope: !1441)
!1451 = !DILocation(line: 1148, column: 25, scope: !1441)
!1452 = !DILocation(line: 1148, column: 24, scope: !1441)
!1453 = !DILocation(line: 1148, column: 41, scope: !1441)
!1454 = !DILocation(line: 1148, column: 51, scope: !1441)
!1455 = !DILocation(line: 1148, column: 50, scope: !1441)
!1456 = !DILocation(line: 1148, column: 38, scope: !1441)
!1457 = !DILocation(line: 1148, column: 13, scope: !1441)
!1458 = !DILocation(line: 1149, column: 11, scope: !1441)
!1459 = !DILocation(line: 1149, column: 4, scope: !1441)
!1460 = !DILocation(line: 1152, column: 1, scope: !1418)
!1461 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1169, type: !1462, scopeLine: 1170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1462 = !DISubroutineType(types: !1463)
!1463 = !{!689, !16, !689}
!1464 = !DILocalVariable(name: "numerator", arg: 1, scope: !1461, file: !69, line: 1169, type: !16)
!1465 = !DILocation(line: 1169, column: 25, scope: !1461)
!1466 = !DILocalVariable(name: "denominator", arg: 2, scope: !1461, file: !69, line: 1169, type: !689)
!1467 = !DILocation(line: 1169, column: 40, scope: !1461)
!1468 = !DILocalVariable(name: "s32Temp1", scope: !1461, file: !69, line: 1171, type: !16)
!1469 = !DILocation(line: 1171, column: 6, scope: !1461)
!1470 = !DILocation(line: 1172, column: 5, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1461, file: !69, line: 1172, column: 5)
!1472 = !DILocation(line: 1172, column: 17, scope: !1471)
!1473 = !DILocation(line: 1172, column: 5, scope: !1461)
!1474 = !DILocation(line: 1174, column: 6, scope: !1475)
!1475 = distinct !DILexicalBlock(scope: !1476, file: !69, line: 1174, column: 6)
!1476 = distinct !DILexicalBlock(scope: !1471, file: !69, line: 1173, column: 2)
!1477 = !DILocation(line: 1174, column: 16, scope: !1475)
!1478 = !DILocation(line: 1174, column: 6, scope: !1476)
!1479 = !DILocation(line: 1176, column: 4, scope: !1480)
!1480 = distinct !DILexicalBlock(scope: !1475, file: !69, line: 1175, column: 3)
!1481 = !DILocation(line: 1180, column: 4, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1475, file: !69, line: 1179, column: 3)
!1483 = !DILocation(line: 1185, column: 6, scope: !1484)
!1484 = distinct !DILexicalBlock(scope: !1485, file: !69, line: 1185, column: 6)
!1485 = distinct !DILexicalBlock(scope: !1471, file: !69, line: 1184, column: 2)
!1486 = !DILocation(line: 1185, column: 16, scope: !1484)
!1487 = !DILocation(line: 1185, column: 6, scope: !1485)
!1488 = !DILocation(line: 1187, column: 17, scope: !1489)
!1489 = distinct !DILexicalBlock(scope: !1484, file: !69, line: 1186, column: 3)
!1490 = !DILocation(line: 1187, column: 31, scope: !1489)
!1491 = !DILocation(line: 1187, column: 41, scope: !1489)
!1492 = !DILocation(line: 1187, column: 40, scope: !1489)
!1493 = !DILocation(line: 1187, column: 56, scope: !1489)
!1494 = !DILocation(line: 1187, column: 54, scope: !1489)
!1495 = !DILocation(line: 1187, column: 27, scope: !1489)
!1496 = !DILocation(line: 1187, column: 69, scope: !1489)
!1497 = !DILocation(line: 1187, column: 13, scope: !1489)
!1498 = !DILocation(line: 1188, column: 13, scope: !1489)
!1499 = !DILocation(line: 1188, column: 23, scope: !1489)
!1500 = !DILocation(line: 1188, column: 22, scope: !1489)
!1501 = !DILocation(line: 1188, column: 39, scope: !1489)
!1502 = !DILocation(line: 1188, column: 48, scope: !1489)
!1503 = !DILocation(line: 1188, column: 47, scope: !1489)
!1504 = !DILocation(line: 1188, column: 36, scope: !1489)
!1505 = !DILocation(line: 1188, column: 4, scope: !1489)
!1506 = !DILocation(line: 1192, column: 4, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1484, file: !69, line: 1191, column: 3)
!1508 = !DILocation(line: 1195, column: 1, scope: !1461)
!1509 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1212, type: !1510, scopeLine: 1213, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1510 = !DISubroutineType(types: !1511)
!1511 = !{!689, !16, !16}
!1512 = !DILocalVariable(name: "numerator", arg: 1, scope: !1509, file: !69, line: 1212, type: !16)
!1513 = !DILocation(line: 1212, column: 25, scope: !1509)
!1514 = !DILocalVariable(name: "denominator", arg: 2, scope: !1509, file: !69, line: 1212, type: !16)
!1515 = !DILocation(line: 1212, column: 40, scope: !1509)
!1516 = !DILocalVariable(name: "u32Temp1", scope: !1509, file: !69, line: 1214, type: !689)
!1517 = !DILocation(line: 1214, column: 6, scope: !1509)
!1518 = !DILocalVariable(name: "u32Temp2", scope: !1509, file: !69, line: 1214, type: !689)
!1519 = !DILocation(line: 1214, column: 20, scope: !1509)
!1520 = !DILocation(line: 1215, column: 5, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1509, file: !69, line: 1215, column: 5)
!1522 = !DILocation(line: 1215, column: 17, scope: !1521)
!1523 = !DILocation(line: 1215, column: 5, scope: !1509)
!1524 = !DILocation(line: 1217, column: 6, scope: !1525)
!1525 = distinct !DILexicalBlock(scope: !1526, file: !69, line: 1217, column: 6)
!1526 = distinct !DILexicalBlock(scope: !1521, file: !69, line: 1216, column: 2)
!1527 = !DILocation(line: 1217, column: 16, scope: !1525)
!1528 = !DILocation(line: 1217, column: 6, scope: !1526)
!1529 = !DILocation(line: 1219, column: 4, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1525, file: !69, line: 1218, column: 3)
!1531 = !DILocation(line: 1223, column: 4, scope: !1532)
!1532 = distinct !DILexicalBlock(scope: !1525, file: !69, line: 1222, column: 3)
!1533 = !DILocation(line: 1228, column: 6, scope: !1534)
!1534 = distinct !DILexicalBlock(scope: !1535, file: !69, line: 1228, column: 6)
!1535 = distinct !DILexicalBlock(scope: !1521, file: !69, line: 1227, column: 2)
!1536 = !DILocation(line: 1228, column: 16, scope: !1534)
!1537 = !DILocation(line: 1228, column: 6, scope: !1535)
!1538 = !DILocation(line: 1230, column: 7, scope: !1539)
!1539 = distinct !DILexicalBlock(scope: !1540, file: !69, line: 1230, column: 7)
!1540 = distinct !DILexicalBlock(scope: !1534, file: !69, line: 1229, column: 3)
!1541 = !DILocation(line: 1230, column: 17, scope: !1539)
!1542 = !DILocation(line: 1230, column: 7, scope: !1540)
!1543 = !DILocation(line: 1232, column: 5, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1539, file: !69, line: 1231, column: 4)
!1545 = !DILocation(line: 1236, column: 8, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1547, file: !69, line: 1236, column: 8)
!1547 = distinct !DILexicalBlock(scope: !1539, file: !69, line: 1235, column: 4)
!1548 = !DILocation(line: 1236, column: 20, scope: !1546)
!1549 = !DILocation(line: 1236, column: 8, scope: !1547)
!1550 = !DILocation(line: 1238, column: 6, scope: !1551)
!1551 = distinct !DILexicalBlock(scope: !1546, file: !69, line: 1237, column: 5)
!1552 = !DILocation(line: 1242, column: 18, scope: !1553)
!1553 = distinct !DILexicalBlock(scope: !1546, file: !69, line: 1241, column: 5)
!1554 = !DILocation(line: 1242, column: 32, scope: !1553)
!1555 = !DILocation(line: 1242, column: 42, scope: !1553)
!1556 = !DILocation(line: 1242, column: 41, scope: !1553)
!1557 = !DILocation(line: 1242, column: 57, scope: !1553)
!1558 = !DILocation(line: 1242, column: 55, scope: !1553)
!1559 = !DILocation(line: 1242, column: 28, scope: !1553)
!1560 = !DILocation(line: 1242, column: 71, scope: !1553)
!1561 = !DILocation(line: 1242, column: 15, scope: !1553)
!1562 = !DILocation(line: 1243, column: 18, scope: !1553)
!1563 = !DILocation(line: 1243, column: 29, scope: !1553)
!1564 = !DILocation(line: 1243, column: 27, scope: !1553)
!1565 = !DILocation(line: 1243, column: 45, scope: !1553)
!1566 = !DILocation(line: 1243, column: 57, scope: !1553)
!1567 = !DILocation(line: 1243, column: 55, scope: !1553)
!1568 = !DILocation(line: 1243, column: 42, scope: !1553)
!1569 = !DILocation(line: 1243, column: 15, scope: !1553)
!1570 = !DILocation(line: 1244, column: 13, scope: !1553)
!1571 = !DILocation(line: 1244, column: 6, scope: !1553)
!1572 = !DILocation(line: 1250, column: 7, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1574, file: !69, line: 1250, column: 7)
!1574 = distinct !DILexicalBlock(scope: !1534, file: !69, line: 1249, column: 3)
!1575 = !DILocation(line: 1250, column: 19, scope: !1573)
!1576 = !DILocation(line: 1250, column: 7, scope: !1574)
!1577 = !DILocation(line: 1252, column: 5, scope: !1578)
!1578 = distinct !DILexicalBlock(scope: !1573, file: !69, line: 1251, column: 4)
!1579 = !DILocation(line: 1256, column: 18, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1573, file: !69, line: 1255, column: 4)
!1581 = !DILocation(line: 1256, column: 17, scope: !1580)
!1582 = !DILocation(line: 1256, column: 15, scope: !1580)
!1583 = !DILocation(line: 1257, column: 20, scope: !1580)
!1584 = !DILocation(line: 1257, column: 19, scope: !1580)
!1585 = !DILocation(line: 1257, column: 17, scope: !1580)
!1586 = !DILocation(line: 1258, column: 17, scope: !1580)
!1587 = !DILocation(line: 1258, column: 31, scope: !1580)
!1588 = !DILocation(line: 1258, column: 41, scope: !1580)
!1589 = !DILocation(line: 1258, column: 40, scope: !1580)
!1590 = !DILocation(line: 1258, column: 56, scope: !1580)
!1591 = !DILocation(line: 1258, column: 54, scope: !1580)
!1592 = !DILocation(line: 1258, column: 27, scope: !1580)
!1593 = !DILocation(line: 1258, column: 70, scope: !1580)
!1594 = !DILocation(line: 1258, column: 14, scope: !1580)
!1595 = !DILocation(line: 1259, column: 17, scope: !1580)
!1596 = !DILocation(line: 1259, column: 28, scope: !1580)
!1597 = !DILocation(line: 1259, column: 26, scope: !1580)
!1598 = !DILocation(line: 1259, column: 44, scope: !1580)
!1599 = !DILocation(line: 1259, column: 56, scope: !1580)
!1600 = !DILocation(line: 1259, column: 54, scope: !1580)
!1601 = !DILocation(line: 1259, column: 41, scope: !1580)
!1602 = !DILocation(line: 1259, column: 14, scope: !1580)
!1603 = !DILocation(line: 1260, column: 12, scope: !1580)
!1604 = !DILocation(line: 1260, column: 5, scope: !1580)
!1605 = !DILocation(line: 1265, column: 1, scope: !1509)
!1606 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1282, type: !1607, scopeLine: 1283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1607 = !DISubroutineType(types: !1608)
!1608 = !{!689, !689, !689}
!1609 = !DILocalVariable(name: "numerator", arg: 1, scope: !1606, file: !69, line: 1282, type: !689)
!1610 = !DILocation(line: 1282, column: 25, scope: !1606)
!1611 = !DILocalVariable(name: "denominator", arg: 2, scope: !1606, file: !69, line: 1282, type: !689)
!1612 = !DILocation(line: 1282, column: 40, scope: !1606)
!1613 = !DILocalVariable(name: "u32Temp1", scope: !1606, file: !69, line: 1285, type: !689)
!1614 = !DILocation(line: 1285, column: 6, scope: !1606)
!1615 = !DILocalVariable(name: "u32Temp2", scope: !1606, file: !69, line: 1285, type: !689)
!1616 = !DILocation(line: 1285, column: 20, scope: !1606)
!1617 = !DILocalVariable(name: "u32Temp3", scope: !1606, file: !69, line: 1285, type: !689)
!1618 = !DILocation(line: 1285, column: 34, scope: !1606)
!1619 = !DILocalVariable(name: "numerator_old", scope: !1606, file: !69, line: 1285, type: !689)
!1620 = !DILocation(line: 1285, column: 48, scope: !1606)
!1621 = !DILocation(line: 1286, column: 5, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1606, file: !69, line: 1286, column: 5)
!1623 = !DILocation(line: 1286, column: 16, scope: !1622)
!1624 = !DILocation(line: 1286, column: 5, scope: !1606)
!1625 = !DILocation(line: 1288, column: 3, scope: !1626)
!1626 = distinct !DILexicalBlock(scope: !1622, file: !69, line: 1287, column: 2)
!1627 = !DILocation(line: 1292, column: 14, scope: !1628)
!1628 = distinct !DILexicalBlock(scope: !1622, file: !69, line: 1291, column: 2)
!1629 = !DILocation(line: 1292, column: 26, scope: !1628)
!1630 = !DILocation(line: 1292, column: 41, scope: !1628)
!1631 = !DILocation(line: 1292, column: 51, scope: !1628)
!1632 = !DILocation(line: 1292, column: 50, scope: !1628)
!1633 = !DILocation(line: 1292, column: 38, scope: !1628)
!1634 = !DILocation(line: 1292, column: 24, scope: !1628)
!1635 = !DILocation(line: 1292, column: 12, scope: !1628)
!1636 = !DILocation(line: 1293, column: 7, scope: !1637)
!1637 = distinct !DILexicalBlock(scope: !1628, file: !69, line: 1293, column: 6)
!1638 = !DILocation(line: 1293, column: 16, scope: !1637)
!1639 = !DILocation(line: 1293, column: 24, scope: !1637)
!1640 = !DILocation(line: 1293, column: 6, scope: !1628)
!1641 = !DILocation(line: 1295, column: 16, scope: !1642)
!1642 = distinct !DILexicalBlock(scope: !1637, file: !69, line: 1294, column: 3)
!1643 = !DILocation(line: 1295, column: 27, scope: !1642)
!1644 = !DILocation(line: 1295, column: 13, scope: !1642)
!1645 = !DILocation(line: 1296, column: 3, scope: !1642)
!1646 = !DILocation(line: 1299, column: 16, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1637, file: !69, line: 1298, column: 3)
!1648 = !DILocation(line: 1299, column: 27, scope: !1647)
!1649 = !DILocation(line: 1299, column: 32, scope: !1647)
!1650 = !DILocation(line: 1299, column: 13, scope: !1647)
!1651 = !DILocation(line: 1302, column: 6, scope: !1652)
!1652 = distinct !DILexicalBlock(scope: !1628, file: !69, line: 1302, column: 6)
!1653 = !DILocation(line: 1302, column: 17, scope: !1652)
!1654 = !DILocation(line: 1302, column: 15, scope: !1652)
!1655 = !DILocation(line: 1302, column: 6, scope: !1628)
!1656 = !DILocation(line: 1304, column: 12, scope: !1657)
!1657 = distinct !DILexicalBlock(scope: !1652, file: !69, line: 1303, column: 3)
!1658 = !DILocation(line: 1304, column: 22, scope: !1657)
!1659 = !DILocation(line: 1304, column: 21, scope: !1657)
!1660 = !DILocation(line: 1304, column: 4, scope: !1657)
!1661 = !DILocation(line: 1308, column: 13, scope: !1662)
!1662 = distinct !DILexicalBlock(scope: !1652, file: !69, line: 1307, column: 3)
!1663 = !DILocation(line: 1308, column: 23, scope: !1662)
!1664 = !DILocation(line: 1308, column: 22, scope: !1662)
!1665 = !DILocation(line: 1308, column: 36, scope: !1662)
!1666 = !DILocation(line: 1308, column: 4, scope: !1662)
!1667 = !DILocation(line: 1313, column: 1, scope: !1606)
!1668 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1330, type: !1669, scopeLine: 1331, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1669 = !DISubroutineType(types: !1670)
!1670 = !{!16, !689, !16}
!1671 = !DILocalVariable(name: "numerator", arg: 1, scope: !1668, file: !69, line: 1330, type: !689)
!1672 = !DILocation(line: 1330, column: 25, scope: !1668)
!1673 = !DILocalVariable(name: "denominator", arg: 2, scope: !1668, file: !69, line: 1330, type: !16)
!1674 = !DILocation(line: 1330, column: 40, scope: !1668)
!1675 = !DILocalVariable(name: "u32Temp1", scope: !1668, file: !69, line: 1332, type: !689)
!1676 = !DILocation(line: 1332, column: 6, scope: !1668)
!1677 = !DILocalVariable(name: "u32Temp2", scope: !1668, file: !69, line: 1332, type: !689)
!1678 = !DILocation(line: 1332, column: 20, scope: !1668)
!1679 = !DILocation(line: 1333, column: 5, scope: !1680)
!1680 = distinct !DILexicalBlock(scope: !1668, file: !69, line: 1333, column: 5)
!1681 = !DILocation(line: 1333, column: 17, scope: !1680)
!1682 = !DILocation(line: 1333, column: 5, scope: !1668)
!1683 = !DILocation(line: 1335, column: 6, scope: !1684)
!1684 = distinct !DILexicalBlock(scope: !1685, file: !69, line: 1335, column: 6)
!1685 = distinct !DILexicalBlock(scope: !1680, file: !69, line: 1334, column: 2)
!1686 = !DILocation(line: 1335, column: 18, scope: !1684)
!1687 = !DILocation(line: 1335, column: 6, scope: !1685)
!1688 = !DILocation(line: 1337, column: 4, scope: !1689)
!1689 = distinct !DILexicalBlock(scope: !1684, file: !69, line: 1336, column: 3)
!1690 = !DILocation(line: 1341, column: 19, scope: !1691)
!1691 = distinct !DILexicalBlock(scope: !1684, file: !69, line: 1340, column: 3)
!1692 = !DILocation(line: 1341, column: 18, scope: !1691)
!1693 = !DILocation(line: 1341, column: 16, scope: !1691)
!1694 = !DILocation(line: 1342, column: 16, scope: !1691)
!1695 = !DILocation(line: 1342, column: 30, scope: !1691)
!1696 = !DILocation(line: 1342, column: 40, scope: !1691)
!1697 = !DILocation(line: 1342, column: 39, scope: !1691)
!1698 = !DILocation(line: 1342, column: 55, scope: !1691)
!1699 = !DILocation(line: 1342, column: 53, scope: !1691)
!1700 = !DILocation(line: 1342, column: 26, scope: !1691)
!1701 = !DILocation(line: 1342, column: 69, scope: !1691)
!1702 = !DILocation(line: 1342, column: 13, scope: !1691)
!1703 = !DILocation(line: 1343, column: 16, scope: !1691)
!1704 = !DILocation(line: 1343, column: 25, scope: !1691)
!1705 = !DILocation(line: 1343, column: 24, scope: !1691)
!1706 = !DILocation(line: 1343, column: 41, scope: !1691)
!1707 = !DILocation(line: 1343, column: 51, scope: !1691)
!1708 = !DILocation(line: 1343, column: 50, scope: !1691)
!1709 = !DILocation(line: 1343, column: 38, scope: !1691)
!1710 = !DILocation(line: 1343, column: 13, scope: !1691)
!1711 = !DILocation(line: 1344, column: 7, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1691, file: !69, line: 1344, column: 7)
!1713 = !DILocation(line: 1344, column: 16, scope: !1712)
!1714 = !DILocation(line: 1344, column: 7, scope: !1691)
!1715 = !DILocation(line: 1346, column: 13, scope: !1716)
!1716 = distinct !DILexicalBlock(scope: !1712, file: !69, line: 1345, column: 4)
!1717 = !DILocation(line: 1346, column: 12, scope: !1716)
!1718 = !DILocation(line: 1346, column: 5, scope: !1716)
!1719 = !DILocation(line: 1350, column: 5, scope: !1720)
!1720 = distinct !DILexicalBlock(scope: !1712, file: !69, line: 1349, column: 4)
!1721 = !DILocation(line: 1356, column: 15, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1680, file: !69, line: 1355, column: 2)
!1723 = !DILocation(line: 1356, column: 29, scope: !1722)
!1724 = !DILocation(line: 1356, column: 39, scope: !1722)
!1725 = !DILocation(line: 1356, column: 38, scope: !1722)
!1726 = !DILocation(line: 1356, column: 54, scope: !1722)
!1727 = !DILocation(line: 1356, column: 52, scope: !1722)
!1728 = !DILocation(line: 1356, column: 25, scope: !1722)
!1729 = !DILocation(line: 1356, column: 68, scope: !1722)
!1730 = !DILocation(line: 1356, column: 12, scope: !1722)
!1731 = !DILocation(line: 1357, column: 15, scope: !1722)
!1732 = !DILocation(line: 1357, column: 24, scope: !1722)
!1733 = !DILocation(line: 1357, column: 23, scope: !1722)
!1734 = !DILocation(line: 1357, column: 40, scope: !1722)
!1735 = !DILocation(line: 1357, column: 50, scope: !1722)
!1736 = !DILocation(line: 1357, column: 49, scope: !1722)
!1737 = !DILocation(line: 1357, column: 37, scope: !1722)
!1738 = !DILocation(line: 1357, column: 12, scope: !1722)
!1739 = !DILocation(line: 1358, column: 6, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1722, file: !69, line: 1358, column: 6)
!1741 = !DILocation(line: 1358, column: 15, scope: !1740)
!1742 = !DILocation(line: 1358, column: 6, scope: !1722)
!1743 = !DILocation(line: 1360, column: 11, scope: !1744)
!1744 = distinct !DILexicalBlock(scope: !1740, file: !69, line: 1359, column: 3)
!1745 = !DILocation(line: 1360, column: 4, scope: !1744)
!1746 = !DILocation(line: 1364, column: 4, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1740, file: !69, line: 1363, column: 3)
!1748 = !DILocation(line: 1367, column: 1, scope: !1668)
!1749 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1385, type: !1750, scopeLine: 1386, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1750 = !DISubroutineType(types: !1751)
!1751 = !{!16, !16, !689}
!1752 = !DILocalVariable(name: "numerator", arg: 1, scope: !1749, file: !69, line: 1385, type: !16)
!1753 = !DILocation(line: 1385, column: 25, scope: !1749)
!1754 = !DILocalVariable(name: "denominator", arg: 2, scope: !1749, file: !69, line: 1385, type: !689)
!1755 = !DILocation(line: 1385, column: 40, scope: !1749)
!1756 = !DILocalVariable(name: "s32Temp1", scope: !1749, file: !69, line: 1387, type: !16)
!1757 = !DILocation(line: 1387, column: 6, scope: !1749)
!1758 = !DILocalVariable(name: "s32Temp2", scope: !1749, file: !69, line: 1387, type: !16)
!1759 = !DILocation(line: 1387, column: 20, scope: !1749)
!1760 = !DILocalVariable(name: "u32Temp0", scope: !1749, file: !69, line: 1388, type: !689)
!1761 = !DILocation(line: 1388, column: 6, scope: !1749)
!1762 = !DILocalVariable(name: "u32Temp1", scope: !1749, file: !69, line: 1388, type: !689)
!1763 = !DILocation(line: 1388, column: 20, scope: !1749)
!1764 = !DILocalVariable(name: "u32Temp2", scope: !1749, file: !69, line: 1388, type: !689)
!1765 = !DILocation(line: 1388, column: 34, scope: !1749)
!1766 = !DILocation(line: 1389, column: 5, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1749, file: !69, line: 1389, column: 5)
!1768 = !DILocation(line: 1389, column: 17, scope: !1767)
!1769 = !DILocation(line: 1389, column: 5, scope: !1749)
!1770 = !DILocation(line: 1391, column: 6, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1772, file: !69, line: 1391, column: 6)
!1772 = distinct !DILexicalBlock(scope: !1767, file: !69, line: 1390, column: 2)
!1773 = !DILocation(line: 1391, column: 16, scope: !1771)
!1774 = !DILocation(line: 1391, column: 6, scope: !1772)
!1775 = !DILocation(line: 1393, column: 4, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1771, file: !69, line: 1392, column: 3)
!1777 = !DILocation(line: 1397, column: 4, scope: !1778)
!1778 = distinct !DILexicalBlock(scope: !1771, file: !69, line: 1396, column: 3)
!1779 = !DILocation(line: 1402, column: 6, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1781, file: !69, line: 1402, column: 6)
!1781 = distinct !DILexicalBlock(scope: !1767, file: !69, line: 1401, column: 2)
!1782 = !DILocation(line: 1402, column: 16, scope: !1780)
!1783 = !DILocation(line: 1402, column: 6, scope: !1781)
!1784 = !DILocation(line: 1404, column: 16, scope: !1785)
!1785 = distinct !DILexicalBlock(scope: !1780, file: !69, line: 1403, column: 3)
!1786 = !DILocation(line: 1404, column: 15, scope: !1785)
!1787 = !DILocation(line: 1404, column: 13, scope: !1785)
!1788 = !DILocation(line: 1405, column: 16, scope: !1785)
!1789 = !DILocation(line: 1405, column: 25, scope: !1785)
!1790 = !DILocation(line: 1405, column: 24, scope: !1785)
!1791 = !DILocation(line: 1405, column: 13, scope: !1785)
!1792 = !DILocation(line: 1406, column: 15, scope: !1785)
!1793 = !DILocation(line: 1406, column: 28, scope: !1785)
!1794 = !DILocation(line: 1406, column: 37, scope: !1785)
!1795 = !DILocation(line: 1406, column: 36, scope: !1785)
!1796 = !DILocation(line: 1406, column: 52, scope: !1785)
!1797 = !DILocation(line: 1406, column: 50, scope: !1785)
!1798 = !DILocation(line: 1406, column: 24, scope: !1785)
!1799 = !DILocation(line: 1406, column: 13, scope: !1785)
!1800 = !DILocation(line: 1408, column: 8, scope: !1801)
!1801 = distinct !DILexicalBlock(scope: !1785, file: !69, line: 1408, column: 7)
!1802 = !DILocation(line: 1408, column: 20, scope: !1801)
!1803 = !DILocation(line: 1408, column: 27, scope: !1801)
!1804 = !DILocation(line: 1408, column: 7, scope: !1785)
!1805 = !DILocation(line: 1410, column: 20, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1801, file: !69, line: 1409, column: 4)
!1807 = !DILocation(line: 1410, column: 32, scope: !1806)
!1808 = !DILocation(line: 1410, column: 17, scope: !1806)
!1809 = !DILocation(line: 1411, column: 4, scope: !1806)
!1810 = !DILocation(line: 1414, column: 20, scope: !1811)
!1811 = distinct !DILexicalBlock(scope: !1801, file: !69, line: 1413, column: 4)
!1812 = !DILocation(line: 1414, column: 32, scope: !1811)
!1813 = !DILocation(line: 1414, column: 38, scope: !1811)
!1814 = !DILocation(line: 1414, column: 17, scope: !1811)
!1815 = !DILocation(line: 1418, column: 7, scope: !1816)
!1816 = distinct !DILexicalBlock(scope: !1785, file: !69, line: 1418, column: 7)
!1817 = !DILocation(line: 1418, column: 18, scope: !1816)
!1818 = !DILocation(line: 1418, column: 16, scope: !1816)
!1819 = !DILocation(line: 1418, column: 7, scope: !1785)
!1820 = !DILocation(line: 1420, column: 14, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1816, file: !69, line: 1419, column: 4)
!1822 = !DILocation(line: 1420, column: 13, scope: !1821)
!1823 = !DILocation(line: 1420, column: 23, scope: !1821)
!1824 = !DILocation(line: 1420, column: 5, scope: !1821)
!1825 = !DILocation(line: 1424, column: 14, scope: !1826)
!1826 = distinct !DILexicalBlock(scope: !1816, file: !69, line: 1423, column: 4)
!1827 = !DILocation(line: 1424, column: 23, scope: !1826)
!1828 = !DILocation(line: 1424, column: 12, scope: !1826)
!1829 = !DILocation(line: 1424, column: 27, scope: !1826)
!1830 = !DILocation(line: 1424, column: 5, scope: !1826)
!1831 = !DILocation(line: 1431, column: 16, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !1780, file: !69, line: 1430, column: 3)
!1833 = !DILocation(line: 1431, column: 30, scope: !1832)
!1834 = !DILocation(line: 1431, column: 40, scope: !1832)
!1835 = !DILocation(line: 1431, column: 39, scope: !1832)
!1836 = !DILocation(line: 1431, column: 55, scope: !1832)
!1837 = !DILocation(line: 1431, column: 53, scope: !1832)
!1838 = !DILocation(line: 1431, column: 26, scope: !1832)
!1839 = !DILocation(line: 1431, column: 69, scope: !1832)
!1840 = !DILocation(line: 1431, column: 13, scope: !1832)
!1841 = !DILocation(line: 1432, column: 16, scope: !1832)
!1842 = !DILocation(line: 1432, column: 26, scope: !1832)
!1843 = !DILocation(line: 1432, column: 25, scope: !1832)
!1844 = !DILocation(line: 1432, column: 42, scope: !1832)
!1845 = !DILocation(line: 1432, column: 51, scope: !1832)
!1846 = !DILocation(line: 1432, column: 50, scope: !1832)
!1847 = !DILocation(line: 1432, column: 39, scope: !1832)
!1848 = !DILocation(line: 1432, column: 13, scope: !1832)
!1849 = !DILocation(line: 1433, column: 11, scope: !1832)
!1850 = !DILocation(line: 1433, column: 4, scope: !1832)
!1851 = !DILocation(line: 1436, column: 1, scope: !1749)
!1852 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1453, type: !1853, scopeLine: 1454, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1853 = !DISubroutineType(types: !1854)
!1854 = !{!16, !16, !16}
!1855 = !DILocalVariable(name: "numerator", arg: 1, scope: !1852, file: !69, line: 1453, type: !16)
!1856 = !DILocation(line: 1453, column: 25, scope: !1852)
!1857 = !DILocalVariable(name: "denominator", arg: 2, scope: !1852, file: !69, line: 1453, type: !16)
!1858 = !DILocation(line: 1453, column: 40, scope: !1852)
!1859 = !DILocalVariable(name: "s32Temp1", scope: !1852, file: !69, line: 1455, type: !16)
!1860 = !DILocation(line: 1455, column: 6, scope: !1852)
!1861 = !DILocalVariable(name: "s32Temp2", scope: !1852, file: !69, line: 1455, type: !16)
!1862 = !DILocation(line: 1455, column: 20, scope: !1852)
!1863 = !DILocalVariable(name: "denominator_prime", scope: !1852, file: !69, line: 1456, type: !689)
!1864 = !DILocation(line: 1456, column: 6, scope: !1852)
!1865 = !DILocalVariable(name: "u32Temp1", scope: !1852, file: !69, line: 1456, type: !689)
!1866 = !DILocation(line: 1456, column: 29, scope: !1852)
!1867 = !DILocalVariable(name: "u32Temp2", scope: !1852, file: !69, line: 1456, type: !689)
!1868 = !DILocation(line: 1456, column: 43, scope: !1852)
!1869 = !DILocalVariable(name: "u32numerator", scope: !1852, file: !69, line: 1457, type: !689)
!1870 = !DILocation(line: 1457, column: 6, scope: !1852)
!1871 = !DILocalVariable(name: "u32denominator", scope: !1852, file: !69, line: 1457, type: !689)
!1872 = !DILocation(line: 1457, column: 23, scope: !1852)
!1873 = !DILocation(line: 1458, column: 5, scope: !1874)
!1874 = distinct !DILexicalBlock(scope: !1852, file: !69, line: 1458, column: 5)
!1875 = !DILocation(line: 1458, column: 15, scope: !1874)
!1876 = !DILocation(line: 1458, column: 5, scope: !1852)
!1877 = !DILocation(line: 1460, column: 6, scope: !1878)
!1878 = distinct !DILexicalBlock(scope: !1879, file: !69, line: 1460, column: 6)
!1879 = distinct !DILexicalBlock(scope: !1874, file: !69, line: 1459, column: 2)
!1880 = !DILocation(line: 1460, column: 18, scope: !1878)
!1881 = !DILocation(line: 1460, column: 6, scope: !1879)
!1882 = !DILocation(line: 1462, column: 7, scope: !1883)
!1883 = distinct !DILexicalBlock(scope: !1884, file: !69, line: 1462, column: 7)
!1884 = distinct !DILexicalBlock(scope: !1878, file: !69, line: 1461, column: 3)
!1885 = !DILocation(line: 1462, column: 19, scope: !1883)
!1886 = !DILocation(line: 1462, column: 7, scope: !1884)
!1887 = !DILocation(line: 1464, column: 5, scope: !1888)
!1888 = distinct !DILexicalBlock(scope: !1883, file: !69, line: 1463, column: 4)
!1889 = !DILocation(line: 1468, column: 21, scope: !1890)
!1890 = distinct !DILexicalBlock(scope: !1883, file: !69, line: 1467, column: 4)
!1891 = !DILocation(line: 1468, column: 20, scope: !1890)
!1892 = !DILocation(line: 1468, column: 18, scope: !1890)
!1893 = !DILocation(line: 1469, column: 23, scope: !1890)
!1894 = !DILocation(line: 1469, column: 22, scope: !1890)
!1895 = !DILocation(line: 1469, column: 20, scope: !1890)
!1896 = !DILocation(line: 1470, column: 16, scope: !1890)
!1897 = !DILocation(line: 1470, column: 33, scope: !1890)
!1898 = !DILocation(line: 1470, column: 46, scope: !1890)
!1899 = !DILocation(line: 1470, column: 45, scope: !1890)
!1900 = !DILocation(line: 1470, column: 64, scope: !1890)
!1901 = !DILocation(line: 1470, column: 62, scope: !1890)
!1902 = !DILocation(line: 1470, column: 29, scope: !1890)
!1903 = !DILocation(line: 1470, column: 81, scope: !1890)
!1904 = !DILocation(line: 1470, column: 14, scope: !1890)
!1905 = !DILocation(line: 1471, column: 17, scope: !1890)
!1906 = !DILocation(line: 1471, column: 30, scope: !1890)
!1907 = !DILocation(line: 1471, column: 29, scope: !1890)
!1908 = !DILocation(line: 1471, column: 49, scope: !1890)
!1909 = !DILocation(line: 1471, column: 58, scope: !1890)
!1910 = !DILocation(line: 1471, column: 57, scope: !1890)
!1911 = !DILocation(line: 1471, column: 46, scope: !1890)
!1912 = !DILocation(line: 1471, column: 14, scope: !1890)
!1913 = !DILocation(line: 1472, column: 8, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1890, file: !69, line: 1472, column: 8)
!1915 = !DILocation(line: 1472, column: 17, scope: !1914)
!1916 = !DILocation(line: 1472, column: 8, scope: !1890)
!1917 = !DILocation(line: 1474, column: 13, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1914, file: !69, line: 1473, column: 5)
!1919 = !DILocation(line: 1474, column: 6, scope: !1918)
!1920 = !DILocation(line: 1478, column: 6, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1914, file: !69, line: 1477, column: 5)
!1922 = !DILocation(line: 1484, column: 20, scope: !1923)
!1923 = distinct !DILexicalBlock(scope: !1878, file: !69, line: 1483, column: 3)
!1924 = !DILocation(line: 1484, column: 19, scope: !1923)
!1925 = !DILocation(line: 1484, column: 29, scope: !1923)
!1926 = !DILocation(line: 1484, column: 17, scope: !1923)
!1927 = !DILocation(line: 1485, column: 16, scope: !1923)
!1928 = !DILocation(line: 1485, column: 33, scope: !1923)
!1929 = !DILocation(line: 1485, column: 46, scope: !1923)
!1930 = !DILocation(line: 1485, column: 45, scope: !1923)
!1931 = !DILocation(line: 1485, column: 61, scope: !1923)
!1932 = !DILocation(line: 1485, column: 59, scope: !1923)
!1933 = !DILocation(line: 1485, column: 29, scope: !1923)
!1934 = !DILocation(line: 1485, column: 75, scope: !1923)
!1935 = !DILocation(line: 1485, column: 13, scope: !1923)
!1936 = !DILocation(line: 1486, column: 16, scope: !1923)
!1937 = !DILocation(line: 1486, column: 29, scope: !1923)
!1938 = !DILocation(line: 1486, column: 28, scope: !1923)
!1939 = !DILocation(line: 1486, column: 45, scope: !1923)
!1940 = !DILocation(line: 1486, column: 54, scope: !1923)
!1941 = !DILocation(line: 1486, column: 53, scope: !1923)
!1942 = !DILocation(line: 1486, column: 42, scope: !1923)
!1943 = !DILocation(line: 1486, column: 13, scope: !1923)
!1944 = !DILocation(line: 1487, column: 13, scope: !1923)
!1945 = !DILocation(line: 1487, column: 12, scope: !1923)
!1946 = !DILocation(line: 1487, column: 22, scope: !1923)
!1947 = !DILocation(line: 1487, column: 4, scope: !1923)
!1948 = !DILocation(line: 1492, column: 6, scope: !1949)
!1949 = distinct !DILexicalBlock(scope: !1950, file: !69, line: 1492, column: 6)
!1950 = distinct !DILexicalBlock(scope: !1874, file: !69, line: 1491, column: 2)
!1951 = !DILocation(line: 1492, column: 18, scope: !1949)
!1952 = !DILocation(line: 1492, column: 6, scope: !1950)
!1953 = !DILocation(line: 1494, column: 7, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1955, file: !69, line: 1494, column: 7)
!1955 = distinct !DILexicalBlock(scope: !1949, file: !69, line: 1493, column: 3)
!1956 = !DILocation(line: 1494, column: 19, scope: !1954)
!1957 = !DILocation(line: 1494, column: 7, scope: !1955)
!1958 = !DILocation(line: 1496, column: 5, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1954, file: !69, line: 1495, column: 4)
!1960 = !DILocation(line: 1500, column: 23, scope: !1961)
!1961 = distinct !DILexicalBlock(scope: !1954, file: !69, line: 1499, column: 4)
!1962 = !DILocation(line: 1500, column: 22, scope: !1961)
!1963 = !DILocation(line: 1500, column: 35, scope: !1961)
!1964 = !DILocation(line: 1500, column: 20, scope: !1961)
!1965 = !DILocation(line: 1501, column: 17, scope: !1961)
!1966 = !DILocation(line: 1501, column: 31, scope: !1961)
!1967 = !DILocation(line: 1501, column: 41, scope: !1961)
!1968 = !DILocation(line: 1501, column: 40, scope: !1961)
!1969 = !DILocation(line: 1501, column: 59, scope: !1961)
!1970 = !DILocation(line: 1501, column: 57, scope: !1961)
!1971 = !DILocation(line: 1501, column: 27, scope: !1961)
!1972 = !DILocation(line: 1501, column: 76, scope: !1961)
!1973 = !DILocation(line: 1501, column: 14, scope: !1961)
!1974 = !DILocation(line: 1502, column: 17, scope: !1961)
!1975 = !DILocation(line: 1502, column: 27, scope: !1961)
!1976 = !DILocation(line: 1502, column: 26, scope: !1961)
!1977 = !DILocation(line: 1502, column: 46, scope: !1961)
!1978 = !DILocation(line: 1502, column: 55, scope: !1961)
!1979 = !DILocation(line: 1502, column: 54, scope: !1961)
!1980 = !DILocation(line: 1502, column: 43, scope: !1961)
!1981 = !DILocation(line: 1502, column: 14, scope: !1961)
!1982 = !DILocation(line: 1503, column: 14, scope: !1961)
!1983 = !DILocation(line: 1503, column: 13, scope: !1961)
!1984 = !DILocation(line: 1503, column: 23, scope: !1961)
!1985 = !DILocation(line: 1503, column: 5, scope: !1961)
!1986 = !DILocation(line: 1508, column: 16, scope: !1987)
!1987 = distinct !DILexicalBlock(scope: !1949, file: !69, line: 1507, column: 3)
!1988 = !DILocation(line: 1508, column: 30, scope: !1987)
!1989 = !DILocation(line: 1508, column: 40, scope: !1987)
!1990 = !DILocation(line: 1508, column: 39, scope: !1987)
!1991 = !DILocation(line: 1508, column: 55, scope: !1987)
!1992 = !DILocation(line: 1508, column: 53, scope: !1987)
!1993 = !DILocation(line: 1508, column: 26, scope: !1987)
!1994 = !DILocation(line: 1508, column: 69, scope: !1987)
!1995 = !DILocation(line: 1508, column: 13, scope: !1987)
!1996 = !DILocation(line: 1509, column: 16, scope: !1987)
!1997 = !DILocation(line: 1509, column: 26, scope: !1987)
!1998 = !DILocation(line: 1509, column: 25, scope: !1987)
!1999 = !DILocation(line: 1509, column: 42, scope: !1987)
!2000 = !DILocation(line: 1509, column: 51, scope: !1987)
!2001 = !DILocation(line: 1509, column: 50, scope: !1987)
!2002 = !DILocation(line: 1509, column: 39, scope: !1987)
!2003 = !DILocation(line: 1509, column: 13, scope: !1987)
!2004 = !DILocation(line: 1510, column: 11, scope: !1987)
!2005 = !DILocation(line: 1510, column: 4, scope: !1987)
!2006 = !DILocation(line: 1513, column: 1, scope: !1852)
!2007 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1531, type: !2008, scopeLine: 1532, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2008 = !DISubroutineType(types: !2009)
!2009 = !{!6, !16, !689}
!2010 = !DILocalVariable(name: "numerator", arg: 1, scope: !2007, file: !69, line: 1531, type: !16)
!2011 = !DILocation(line: 1531, column: 25, scope: !2007)
!2012 = !DILocalVariable(name: "denominator", arg: 2, scope: !2007, file: !69, line: 1531, type: !689)
!2013 = !DILocation(line: 1531, column: 40, scope: !2007)
!2014 = !DILocalVariable(name: "numerator_prime", scope: !2007, file: !69, line: 1534, type: !689)
!2015 = !DILocation(line: 1534, column: 6, scope: !2007)
!2016 = !DILocalVariable(name: "u32Temp1", scope: !2007, file: !69, line: 1534, type: !689)
!2017 = !DILocation(line: 1534, column: 27, scope: !2007)
!2018 = !DILocalVariable(name: "u32Temp2", scope: !2007, file: !69, line: 1534, type: !689)
!2019 = !DILocation(line: 1534, column: 41, scope: !2007)
!2020 = !DILocalVariable(name: "u32Temp3", scope: !2007, file: !69, line: 1534, type: !689)
!2021 = !DILocation(line: 1534, column: 55, scope: !2007)
!2022 = !DILocalVariable(name: "s32Temp1", scope: !2007, file: !69, line: 1535, type: !16)
!2023 = !DILocation(line: 1535, column: 6, scope: !2007)
!2024 = !DILocalVariable(name: "s32Temp2", scope: !2007, file: !69, line: 1535, type: !16)
!2025 = !DILocation(line: 1535, column: 20, scope: !2007)
!2026 = !DILocalVariable(name: "s32Temp3", scope: !2007, file: !69, line: 1535, type: !16)
!2027 = !DILocation(line: 1535, column: 34, scope: !2007)
!2028 = !DILocation(line: 1536, column: 5, scope: !2029)
!2029 = distinct !DILexicalBlock(scope: !2007, file: !69, line: 1536, column: 5)
!2030 = !DILocation(line: 1536, column: 17, scope: !2029)
!2031 = !DILocation(line: 1536, column: 5, scope: !2007)
!2032 = !DILocation(line: 1538, column: 6, scope: !2033)
!2033 = distinct !DILexicalBlock(scope: !2034, file: !69, line: 1538, column: 6)
!2034 = distinct !DILexicalBlock(scope: !2029, file: !69, line: 1537, column: 2)
!2035 = !DILocation(line: 1538, column: 15, scope: !2033)
!2036 = !DILocation(line: 1538, column: 6, scope: !2034)
!2037 = !DILocation(line: 1540, column: 4, scope: !2038)
!2038 = distinct !DILexicalBlock(scope: !2033, file: !69, line: 1539, column: 3)
!2039 = !DILocation(line: 1544, column: 4, scope: !2040)
!2040 = distinct !DILexicalBlock(scope: !2033, file: !69, line: 1543, column: 3)
!2041 = !DILocation(line: 1549, column: 6, scope: !2042)
!2042 = distinct !DILexicalBlock(scope: !2043, file: !69, line: 1549, column: 6)
!2043 = distinct !DILexicalBlock(scope: !2029, file: !69, line: 1548, column: 2)
!2044 = !DILocation(line: 1549, column: 16, scope: !2042)
!2045 = !DILocation(line: 1549, column: 6, scope: !2043)
!2046 = !DILocation(line: 1551, column: 23, scope: !2047)
!2047 = distinct !DILexicalBlock(scope: !2042, file: !69, line: 1550, column: 3)
!2048 = !DILocation(line: 1551, column: 22, scope: !2047)
!2049 = !DILocation(line: 1551, column: 20, scope: !2047)
!2050 = !DILocation(line: 1552, column: 16, scope: !2047)
!2051 = !DILocation(line: 1552, column: 32, scope: !2047)
!2052 = !DILocation(line: 1552, column: 31, scope: !2047)
!2053 = !DILocation(line: 1552, column: 13, scope: !2047)
!2054 = !DILocation(line: 1553, column: 15, scope: !2047)
!2055 = !DILocation(line: 1553, column: 34, scope: !2047)
!2056 = !DILocation(line: 1553, column: 45, scope: !2047)
!2057 = !DILocation(line: 1553, column: 43, scope: !2047)
!2058 = !DILocation(line: 1553, column: 31, scope: !2047)
!2059 = !DILocation(line: 1553, column: 13, scope: !2047)
!2060 = !DILocation(line: 1555, column: 8, scope: !2061)
!2061 = distinct !DILexicalBlock(scope: !2047, file: !69, line: 1555, column: 7)
!2062 = !DILocation(line: 1555, column: 20, scope: !2061)
!2063 = !DILocation(line: 1555, column: 27, scope: !2061)
!2064 = !DILocation(line: 1555, column: 7, scope: !2047)
!2065 = !DILocation(line: 1557, column: 19, scope: !2066)
!2066 = distinct !DILexicalBlock(scope: !2061, file: !69, line: 1556, column: 4)
!2067 = !DILocation(line: 1557, column: 31, scope: !2066)
!2068 = !DILocation(line: 1557, column: 17, scope: !2066)
!2069 = !DILocation(line: 1558, column: 4, scope: !2066)
!2070 = !DILocation(line: 1561, column: 20, scope: !2071)
!2071 = distinct !DILexicalBlock(scope: !2061, file: !69, line: 1560, column: 4)
!2072 = !DILocation(line: 1561, column: 32, scope: !2071)
!2073 = !DILocation(line: 1561, column: 38, scope: !2071)
!2074 = !DILocation(line: 1561, column: 17, scope: !2071)
!2075 = !DILocation(line: 1564, column: 7, scope: !2076)
!2076 = distinct !DILexicalBlock(scope: !2047, file: !69, line: 1564, column: 7)
!2077 = !DILocation(line: 1564, column: 18, scope: !2076)
!2078 = !DILocation(line: 1564, column: 16, scope: !2076)
!2079 = !DILocation(line: 1564, column: 7, scope: !2047)
!2080 = !DILocation(line: 1566, column: 18, scope: !2081)
!2081 = distinct !DILexicalBlock(scope: !2076, file: !69, line: 1565, column: 4)
!2082 = !DILocation(line: 1566, column: 16, scope: !2081)
!2083 = !DILocation(line: 1566, column: 28, scope: !2081)
!2084 = !DILocation(line: 1566, column: 14, scope: !2081)
!2085 = !DILocation(line: 1567, column: 4, scope: !2081)
!2086 = !DILocation(line: 1570, column: 18, scope: !2087)
!2087 = distinct !DILexicalBlock(scope: !2076, file: !69, line: 1569, column: 4)
!2088 = !DILocation(line: 1570, column: 26, scope: !2087)
!2089 = !DILocation(line: 1570, column: 16, scope: !2087)
!2090 = !DILocation(line: 1570, column: 30, scope: !2087)
!2091 = !DILocation(line: 1570, column: 14, scope: !2087)
!2092 = !DILocation(line: 1572, column: 8, scope: !2093)
!2093 = distinct !DILexicalBlock(scope: !2047, file: !69, line: 1572, column: 7)
!2094 = !DILocation(line: 1572, column: 18, scope: !2093)
!2095 = !DILocation(line: 1572, column: 7, scope: !2047)
!2096 = !DILocation(line: 1574, column: 18, scope: !2097)
!2097 = distinct !DILexicalBlock(scope: !2093, file: !69, line: 1573, column: 4)
!2098 = !DILocation(line: 1574, column: 12, scope: !2097)
!2099 = !DILocation(line: 1574, column: 5, scope: !2097)
!2100 = !DILocation(line: 1578, column: 5, scope: !2101)
!2101 = distinct !DILexicalBlock(scope: !2093, file: !69, line: 1577, column: 4)
!2102 = !DILocation(line: 1583, column: 16, scope: !2103)
!2103 = distinct !DILexicalBlock(scope: !2042, file: !69, line: 1582, column: 3)
!2104 = !DILocation(line: 1583, column: 26, scope: !2103)
!2105 = !DILocation(line: 1583, column: 25, scope: !2103)
!2106 = !DILocation(line: 1583, column: 41, scope: !2103)
!2107 = !DILocation(line: 1583, column: 39, scope: !2103)
!2108 = !DILocation(line: 1583, column: 13, scope: !2103)
!2109 = !DILocation(line: 1584, column: 16, scope: !2103)
!2110 = !DILocation(line: 1584, column: 30, scope: !2103)
!2111 = !DILocation(line: 1584, column: 40, scope: !2103)
!2112 = !DILocation(line: 1584, column: 39, scope: !2103)
!2113 = !DILocation(line: 1584, column: 55, scope: !2103)
!2114 = !DILocation(line: 1584, column: 53, scope: !2103)
!2115 = !DILocation(line: 1584, column: 26, scope: !2103)
!2116 = !DILocation(line: 1584, column: 68, scope: !2103)
!2117 = !DILocation(line: 1584, column: 13, scope: !2103)
!2118 = !DILocation(line: 1585, column: 16, scope: !2103)
!2119 = !DILocation(line: 1585, column: 25, scope: !2103)
!2120 = !DILocation(line: 1585, column: 24, scope: !2103)
!2121 = !DILocation(line: 1585, column: 41, scope: !2103)
!2122 = !DILocation(line: 1585, column: 51, scope: !2103)
!2123 = !DILocation(line: 1585, column: 50, scope: !2103)
!2124 = !DILocation(line: 1585, column: 38, scope: !2103)
!2125 = !DILocation(line: 1585, column: 13, scope: !2103)
!2126 = !DILocation(line: 1586, column: 7, scope: !2127)
!2127 = distinct !DILexicalBlock(scope: !2103, file: !69, line: 1586, column: 7)
!2128 = !DILocation(line: 1586, column: 16, scope: !2127)
!2129 = !DILocation(line: 1586, column: 7, scope: !2103)
!2130 = !DILocation(line: 1588, column: 17, scope: !2131)
!2131 = distinct !DILexicalBlock(scope: !2127, file: !69, line: 1587, column: 4)
!2132 = !DILocation(line: 1588, column: 12, scope: !2131)
!2133 = !DILocation(line: 1588, column: 5, scope: !2131)
!2134 = !DILocation(line: 1592, column: 5, scope: !2135)
!2135 = distinct !DILexicalBlock(scope: !2127, file: !69, line: 1591, column: 4)
!2136 = !DILocation(line: 1596, column: 1, scope: !2007)
!2137 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2138, file: !2138, line: 12, type: !2139, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2142)
!2138 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2139 = !DISubroutineType(types: !2140)
!2140 = !{null, !2141}
!2141 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2142 = !{!2143}
!2143 = !DILocalVariable(name: "z", arg: 1, scope: !2137, file: !2138, line: 12, type: !2141)
!2144 = !DILocation(line: 0, scope: !2137)
!2145 = !DILocation(line: 13, column: 9, scope: !2146)
!2146 = distinct !DILexicalBlock(scope: !2137, file: !2138, line: 13, column: 7)
!2147 = !DILocation(line: 13, column: 7, scope: !2137)
!2148 = !DILocation(line: 14, column: 5, scope: !2146)
!2149 = !DILocation(line: 15, column: 1, scope: !2137)
!2150 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2151, file: !2151, line: 20, type: !2152, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2155)
!2151 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2152 = !DISubroutineType(types: !2153)
!2153 = !{null, !2154, !2154}
!2154 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2155 = !{!2156, !2157}
!2156 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2150, file: !2151, line: 20, type: !2154)
!2157 = !DILocalVariable(name: "shift", arg: 2, scope: !2150, file: !2151, line: 20, type: !2154)
!2158 = !DILocation(line: 0, scope: !2150)
!2159 = !DILocation(line: 21, column: 13, scope: !2160)
!2160 = distinct !DILexicalBlock(scope: !2150, file: !2151, line: 21, column: 7)
!2161 = !DILocation(line: 21, column: 7, scope: !2150)
!2162 = !DILocation(line: 27, column: 5, scope: !2163)
!2163 = distinct !DILexicalBlock(scope: !2160, file: !2151, line: 21, column: 26)
!2164 = !DILocation(line: 29, column: 1, scope: !2150)
