; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0038/build/s16_div_s32_s16_alarm_0038.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [65 x i8] c"KLEE-ALARM-0038: division by zero. assert (s32)denominator != 0;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0038.err\00", align 1
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
  br i1 %cmp92, label %if.then94, label %if.else159, !dbg !359

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
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 362, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !448
  unreachable, !dbg !448

if.end155:                                        ; preds = %if.end144
  %62 = load i32, i32* %s32Temp2, align 4, !dbg !450
  %63 = load i16, i16* %denominator.addr, align 2, !dbg !451
  %conv156 = sext i16 %63 to i32, !dbg !451
  %int_cast_to_i6414 = zext i32 %conv156 to i64, !dbg !452
  call void @klee_div_zero_check(i64 %int_cast_to_i6414), !dbg !452
  %div157 = sdiv i32 %62, %conv156, !dbg !452, !klee.check.div !106
  %conv158 = sext i32 %div157 to i64, !dbg !453
  store volatile i64 %conv158, i64* @klee_alarm_sink_s64, align 8, !dbg !454
  store i16 0, i16* %retval, align 2, !dbg !455
  br label %return, !dbg !455

if.else159:                                       ; preds = %if.else90
  store i16 32767, i16* %retval, align 2, !dbg !456
  br label %return, !dbg !456

return:                                           ; preds = %if.else159, %if.end155, %if.then143, %if.then136, %if.then127, %if.then118, %if.then108, %if.then98, %if.else89, %if.else88, %if.then86, %if.then77, %if.then69, %if.then61, %if.then54, %if.then44, %if.then35, %if.then26, %if.then16, %if.then10, %if.else, %if.then4
  %64 = load i16, i16* %retval, align 2, !dbg !458
  ret i16 %64, !dbg !458
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !459 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !462, metadata !DIExpression()), !dbg !463
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !464
  %cmp = icmp ne i64 %0, 0, !dbg !465
  %conv = zext i1 %cmp to i32, !dbg !465
  ret i32 %conv, !dbg !466
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !467 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !468, metadata !DIExpression()), !dbg !469
  %0 = load i64, i64* %left.addr, align 8, !dbg !470
  %cmp = icmp sge i64 %0, 0, !dbg !471
  %conv = zext i1 %cmp to i32, !dbg !471
  ret i32 %conv, !dbg !472
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !473 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !476, metadata !DIExpression()), !dbg !477
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !478, metadata !DIExpression()), !dbg !479
  %0 = load i32, i32* %count.addr, align 4, !dbg !480
  %cmp = icmp uge i32 %0, 63, !dbg !482
  br i1 %cmp, label %if.then, label %if.end, !dbg !483

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !484
  br label %return, !dbg !484

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !486
  %2 = load i32, i32* %count.addr, align 4, !dbg !487
  %sh_prom = zext i32 %2 to i64, !dbg !488
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !488
  %shl = shl i64 1, %sh_prom, !dbg !488, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !489
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !490
  %conv = zext i1 %cmp1 to i32, !dbg !490
  store i32 %conv, i32* %retval, align 4, !dbg !491
  br label %return, !dbg !491

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !492
  ret i32 %3, !dbg !492
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !493 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !496, metadata !DIExpression()), !dbg !497
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !498, metadata !DIExpression()), !dbg !499
  %0 = load i64, i64* %left.addr, align 8, !dbg !500
  %1 = load i64, i64* %right.addr, align 8, !dbg !501
  %mul = mul nsw i64 %0, %1, !dbg !502
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !503
  %conv = zext i1 %cmp to i32, !dbg !503
  ret i32 %conv, !dbg !504
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !505 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !506, metadata !DIExpression()), !dbg !507
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !508, metadata !DIExpression()), !dbg !509
  %0 = load i64, i64* %left.addr, align 8, !dbg !510
  %1 = load i64, i64* %right.addr, align 8, !dbg !511
  %mul = mul nsw i64 %0, %1, !dbg !512
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !513
  %conv = zext i1 %cmp to i32, !dbg !513
  ret i32 %conv, !dbg !514
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_lower(i64 %left, i64 %right) #0 !dbg !515 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !516, metadata !DIExpression()), !dbg !517
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !518, metadata !DIExpression()), !dbg !519
  %0 = load i64, i64* %left.addr, align 8, !dbg !520
  %1 = load i64, i64* %right.addr, align 8, !dbg !521
  %add = add nsw i64 %0, %1, !dbg !522
  %cmp = icmp sge i64 %add, -2147483648, !dbg !523
  %conv = zext i1 %cmp to i32, !dbg !523
  ret i32 %conv, !dbg !524
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !525 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !526, metadata !DIExpression()), !dbg !527
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !528, metadata !DIExpression()), !dbg !529
  %0 = load i64, i64* %left.addr, align 8, !dbg !530
  %1 = load i64, i64* %right.addr, align 8, !dbg !531
  %add = add nsw i64 %0, %1, !dbg !532
  %cmp = icmp sle i64 %add, 2147483647, !dbg !533
  %conv = zext i1 %cmp to i32, !dbg !533
  ret i32 %conv, !dbg !534
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_div_representable(i64 %numerator, i64 %denominator) #0 !dbg !535 {
entry:
  %numerator.addr = alloca i64, align 8
  %denominator.addr = alloca i64, align 8
  store i64 %numerator, i64* %numerator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %numerator.addr, metadata !536, metadata !DIExpression()), !dbg !537
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !538, metadata !DIExpression()), !dbg !539
  %0 = load i64, i64* %numerator.addr, align 8, !dbg !540
  %cmp = icmp eq i64 %0, -2147483648, !dbg !541
  %1 = load i64, i64* %denominator.addr, align 8, !dbg !542
  %cmp1 = icmp eq i64 %1, -1, !dbg !542
  %2 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !542
  %lnot = xor i1 %2, true, !dbg !543
  %lnot.ext = zext i1 %lnot to i32, !dbg !543
  ret i32 %lnot.ext, !dbg !544
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !545 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !548, metadata !DIExpression()), !dbg !549
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !550, metadata !DIExpression()), !dbg !551
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !552, metadata !DIExpression()), !dbg !553
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !554, metadata !DIExpression()), !dbg !555
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !556, metadata !DIExpression()), !dbg !557
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !558
  %conv = zext i16 %0 to i32, !dbg !558
  %and = and i32 %conv, 65535, !dbg !559
  %conv1 = trunc i32 %and to i16, !dbg !558
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !560
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !561
  %conv2 = sext i16 %1 to i32, !dbg !561
  %shl = shl i32 %conv2, 16, !dbg !562
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !563
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !564
  %conv3 = zext i16 %2 to i32, !dbg !564
  %cmp = icmp eq i32 %conv3, 0, !dbg !566
  br i1 %cmp, label %if.then, label %if.else9, !dbg !567

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !568
  %conv5 = sext i16 %3 to i32, !dbg !568
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !571
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !572

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !573
  br label %return, !dbg !573

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !575
  br label %return, !dbg !575

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !577
  %conv10 = sext i16 %4 to i32, !dbg !577
  %shl11 = shl i32 %conv10, 16, !dbg !579
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !580
  %conv12 = sext i16 %5 to i32, !dbg !580
  %shl13 = shl i32 %conv12, 16, !dbg !581
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !582
  %conv14 = zext i16 %6 to i32, !dbg !582
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !583
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !583
  %div = sdiv i32 %shl13, %conv14, !dbg !583, !klee.check.div !106
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !584
  %conv15 = zext i16 %7 to i32, !dbg !584
  %mul = mul nsw i32 %div, %conv15, !dbg !585
  %sub = sub nsw i32 %shl11, %mul, !dbg !586
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !587
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !588
  %shl16 = shl i32 %8, 1, !dbg !589
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !590
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !591
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !592
  %conv17 = zext i16 %10 to i32, !dbg !592
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !593
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !593
  %div18 = sdiv i32 %9, %conv17, !dbg !593, !klee.check.div !106
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !594
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !595
  %conv19 = sext i16 %11 to i32, !dbg !595
  %shl20 = shl i32 %conv19, 16, !dbg !596
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !597
  %conv21 = zext i16 %12 to i32, !dbg !597
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !598
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !598
  %div22 = sdiv i32 %shl20, %conv21, !dbg !598, !klee.check.div !106
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !599
  %add = add nsw i32 %div22, %13, !dbg !600
  store i32 %add, i32* %s32Temp1, align 4, !dbg !601
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !602
  %cmp23 = icmp slt i32 %14, 32767, !dbg !604
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !605

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !606
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !609
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !610

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !611
  %conv29 = trunc i32 %16 to i16, !dbg !613
  store i16 %conv29, i16* %retval, align 2, !dbg !614
  br label %return, !dbg !614

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !615
  br label %return, !dbg !615

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !617
  br label %return, !dbg !617

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !619
  ret i16 %17, !dbg !619
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !620 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !621, metadata !DIExpression()), !dbg !622
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !623, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !625, metadata !DIExpression()), !dbg !626
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !627, metadata !DIExpression()), !dbg !628
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !629
  %conv = zext i16 %0 to i32, !dbg !629
  %and = and i32 %conv, 65535, !dbg !630
  %conv1 = trunc i32 %and to i16, !dbg !629
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !631
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !632
  %conv2 = zext i16 %1 to i32, !dbg !632
  %cmp = icmp eq i32 %conv2, 0, !dbg !634
  br i1 %cmp, label %if.then, label %if.else8, !dbg !635

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !636
  %conv4 = sext i16 %2 to i32, !dbg !636
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !639
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !640

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !641
  br label %return, !dbg !641

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !643
  br label %return, !dbg !643

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !645
  %conv9 = sext i16 %3 to i32, !dbg !645
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !647
  %conv10 = sext i16 %4 to i32, !dbg !647
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !648
  %conv11 = zext i16 %5 to i32, !dbg !648
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !649
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !649
  %div = sdiv i32 %conv10, %conv11, !dbg !649, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !650
  %conv12 = zext i16 %6 to i32, !dbg !650
  %mul = mul nsw i32 %div, %conv12, !dbg !651
  %sub = sub nsw i32 %conv9, %mul, !dbg !652
  %shl = shl i32 %sub, 1, !dbg !653
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !654
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !655
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !656
  %conv13 = zext i16 %8 to i32, !dbg !656
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !657
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !657
  %div14 = sdiv i32 %7, %conv13, !dbg !657, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !658
  %conv15 = sext i16 %9 to i32, !dbg !658
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !659
  %conv16 = zext i16 %10 to i32, !dbg !659
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !660
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !660
  %div17 = sdiv i32 %conv15, %conv16, !dbg !660, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !661
  store i32 %add, i32* %s32Temp1, align 4, !dbg !662
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !663
  %conv18 = trunc i32 %11 to i16, !dbg !663
  store i16 %conv18, i16* %retval, align 2, !dbg !664
  br label %return, !dbg !664

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !665
  ret i16 %12, !dbg !665
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !666 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !669, metadata !DIExpression()), !dbg !670
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !671, metadata !DIExpression()), !dbg !672
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !673, metadata !DIExpression()), !dbg !675
  store i32 0, i32* %u32Temp1, align 4, !dbg !675
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !676, metadata !DIExpression()), !dbg !677
  store i32 0, i32* %u32Temp2, align 4, !dbg !677
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !678, metadata !DIExpression()), !dbg !679
  store i32 0, i32* %u32Temp3, align 4, !dbg !679
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !680
  %conv = zext i16 %0 to i32, !dbg !680
  %cmp = icmp eq i32 %conv, 0, !dbg !682
  br i1 %cmp, label %if.then, label %if.else, !dbg !683

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !684
  br label %return, !dbg !684

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !686
  %conv2 = zext i16 %1 to i32, !dbg !686
  %shl = shl i32 %conv2, 16, !dbg !688
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !689
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !690
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !691
  %conv3 = zext i16 %3 to i32, !dbg !691
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !692
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !692
  %div = udiv i32 %2, %conv3, !dbg !692, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !693
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !694
  %add = add i32 %4, 128, !dbg !695
  %shr = lshr i32 %add, 8, !dbg !696
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !697
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !698
  %cmp4 = icmp ult i32 %5, 255, !dbg !700
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !701

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !702
  %conv7 = trunc i32 %6 to i8, !dbg !704
  store i8 %conv7, i8* %retval, align 1, !dbg !705
  br label %return, !dbg !705

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !706
  br label %return, !dbg !706

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !708
  ret i8 %7, !dbg !708
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !709 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !712, metadata !DIExpression()), !dbg !713
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !714, metadata !DIExpression()), !dbg !715
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !716, metadata !DIExpression()), !dbg !717
  store i32 0, i32* %s32Temp1, align 4, !dbg !717
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !718
  %conv = zext i16 %0 to i32, !dbg !718
  %and = and i32 %conv, 65535, !dbg !719
  %conv1 = trunc i32 %and to i16, !dbg !718
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !720
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !721
  %conv2 = zext i16 %1 to i32, !dbg !721
  %and3 = and i32 %conv2, 65535, !dbg !723
  %cmp = icmp eq i32 %and3, 0, !dbg !724
  br i1 %cmp, label %if.then, label %if.else8, !dbg !725

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !726
  %cmp5 = icmp sge i32 %2, 0, !dbg !729
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !730

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !731
  br label %return, !dbg !731

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !733
  br label %return, !dbg !733

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !735
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !737
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !738
  %conv9 = zext i16 %5 to i32, !dbg !738
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !739
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !739
  %div = sdiv i32 %4, %conv9, !dbg !739, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !740
  %conv10 = zext i16 %6 to i32, !dbg !740
  %mul = mul nsw i32 %div, %conv10, !dbg !741
  %sub = sub nsw i32 %3, %mul, !dbg !742
  %shl = shl i32 %sub, 1, !dbg !743
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !744
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !745
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !746
  %conv11 = zext i16 %8 to i32, !dbg !746
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !747
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !747
  %div12 = sdiv i32 %7, %conv11, !dbg !747, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !748
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !749
  %conv13 = zext i16 %10 to i32, !dbg !749
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !750
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !750
  %div14 = sdiv i32 %9, %conv13, !dbg !750, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !751
  store i32 %add, i32* %s32Temp1, align 4, !dbg !752
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !753
  %cmp15 = icmp slt i32 %11, 65535, !dbg !755
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !756

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !757
  %cmp18 = icmp sgt i32 %12, 0, !dbg !760
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !761

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !762
  %conv21 = trunc i32 %13 to i16, !dbg !764
  store i16 %conv21, i16* %retval, align 2, !dbg !765
  br label %return, !dbg !765

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !766
  br label %return, !dbg !766

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !768
  br label %return, !dbg !768

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !770
  ret i16 %14, !dbg !770
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !771 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !774, metadata !DIExpression()), !dbg !775
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !776, metadata !DIExpression()), !dbg !777
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !778, metadata !DIExpression()), !dbg !779
  store i32 0, i32* %u32Temp, align 4, !dbg !779
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !780
  %conv = zext i16 %0 to i32, !dbg !780
  %cmp = icmp eq i32 %conv, 0, !dbg !782
  br i1 %cmp, label %if.then, label %if.else, !dbg !783

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !784
  br label %return, !dbg !784

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !786
  %conv2 = zext i16 %1 to i32, !dbg !786
  %shl = shl i32 %conv2, 16, !dbg !788
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !789
  %conv3 = zext i16 %2 to i32, !dbg !789
  %shr = ashr i32 %conv3, 1, !dbg !790
  %add = add nsw i32 %shl, %shr, !dbg !791
  store i32 %add, i32* %u32Temp, align 4, !dbg !792
  %3 = load i32, i32* %u32Temp, align 4, !dbg !793
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !794
  %conv4 = zext i16 %4 to i32, !dbg !794
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !795
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !795
  %div = udiv i32 %3, %conv4, !dbg !795, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !796
  %5 = load i32, i32* %u32Temp, align 4, !dbg !797
  %cmp5 = icmp ult i32 %5, 65535, !dbg !799
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !800

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !801
  %and = and i32 %6, 65535, !dbg !803
  %conv8 = trunc i32 %and to i16, !dbg !801
  store i16 %conv8, i16* %retval, align 2, !dbg !804
  br label %return, !dbg !804

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !805
  br label %return, !dbg !805

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !807
  ret i16 %7, !dbg !807
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !808 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !811, metadata !DIExpression()), !dbg !812
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !813, metadata !DIExpression()), !dbg !814
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !815, metadata !DIExpression()), !dbg !816
  store i32 0, i32* %u32Temp1, align 4, !dbg !816
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !817, metadata !DIExpression()), !dbg !818
  store i32 0, i32* %u32Temp2, align 4, !dbg !818
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !819
  %conv = zext i16 %0 to i32, !dbg !819
  %and = and i32 %conv, 65535, !dbg !820
  %conv1 = trunc i32 %and to i16, !dbg !819
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !821
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !822
  %conv2 = zext i16 %1 to i32, !dbg !822
  %cmp = icmp eq i32 %conv2, 0, !dbg !824
  br i1 %cmp, label %if.then, label %if.else, !dbg !825

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !826
  br label %return, !dbg !826

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !828
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !830
  %conv4 = zext i16 %3 to i32, !dbg !830
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !831
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !831
  %div = udiv i32 %2, %conv4, !dbg !831, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !832
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !833
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !834
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !835
  %conv5 = zext i16 %6 to i32, !dbg !835
  %mul = mul i32 %5, %conv5, !dbg !836
  %sub = sub i32 %4, %mul, !dbg !837
  %shl = shl i32 %sub, 1, !dbg !838
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !839
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !840
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !841
  %conv6 = zext i16 %8 to i32, !dbg !841
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !842
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !842
  %div7 = udiv i32 %7, %conv6, !dbg !842, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !843
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !844
  %conv8 = zext i16 %10 to i32, !dbg !844
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !845
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !845
  %div9 = udiv i32 %9, %conv8, !dbg !845, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !846
  store i32 %add, i32* %u32Temp2, align 4, !dbg !847
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !848
  %cmp10 = icmp ult i32 %11, 65535, !dbg !850
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !851

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !852
  %and13 = and i32 %12, 65535, !dbg !854
  %conv14 = trunc i32 %and13 to i16, !dbg !852
  store i16 %conv14, i16* %retval, align 2, !dbg !855
  br label %return, !dbg !855

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !856
  br label %return, !dbg !856

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !858
  ret i16 %13, !dbg !858
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !859 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !862, metadata !DIExpression()), !dbg !863
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !864, metadata !DIExpression()), !dbg !865
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !866, metadata !DIExpression()), !dbg !867
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !868, metadata !DIExpression()), !dbg !869
  store i32 0, i32* %s32Result, align 4, !dbg !869
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !870, metadata !DIExpression()), !dbg !871
  store i32 0, i32* %s32Temp1, align 4, !dbg !871
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !872
  %conv = sext i16 %0 to i32, !dbg !872
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !873
  %conv1 = zext i16 %1 to i32, !dbg !873
  %mul = mul nsw i32 %conv, %conv1, !dbg !874
  store i32 %mul, i32* %s32Result, align 4, !dbg !875
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !876
  %conv2 = sext i16 %2 to i32, !dbg !876
  %cmp = icmp eq i32 %conv2, 0, !dbg !878
  br i1 %cmp, label %if.then, label %if.else7, !dbg !879

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !880
  %cmp4 = icmp slt i32 %3, 0, !dbg !883
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !884

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !885
  br label %return, !dbg !885

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !887
  br label %return, !dbg !887

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !889
  %5 = load i32, i32* %s32Result, align 4, !dbg !891
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !892
  %conv8 = sext i16 %6 to i32, !dbg !892
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !893
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !893
  %div = sdiv i32 %5, %conv8, !dbg !893, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !894
  %conv9 = sext i16 %7 to i32, !dbg !894
  %mul10 = mul nsw i32 %div, %conv9, !dbg !895
  %sub = sub nsw i32 %4, %mul10, !dbg !896
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !897
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !898
  %shl = shl i32 %8, 1, !dbg !899
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !900
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !901
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !902
  %conv11 = sext i16 %10 to i32, !dbg !902
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !903
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !903
  %div12 = sdiv i32 %9, %conv11, !dbg !903, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !904
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !905
  %conv13 = sext i16 %12 to i32, !dbg !905
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !906
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !906
  %div14 = sdiv i32 %11, %conv13, !dbg !906, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !907
  store i32 %add, i32* %s32Result, align 4, !dbg !908
  %13 = load i32, i32* %s32Result, align 4, !dbg !909
  %cmp15 = icmp slt i32 %13, 32767, !dbg !911
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !912

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !913
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !916
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !917

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !918
  %conv21 = trunc i32 %15 to i16, !dbg !920
  store i16 %conv21, i16* %retval, align 2, !dbg !921
  br label %return, !dbg !921

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !922
  br label %return, !dbg !922

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !924
  br label %return, !dbg !924

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !926
  ret i16 %16, !dbg !926
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !927 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !930, metadata !DIExpression()), !dbg !931
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !932, metadata !DIExpression()), !dbg !933
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !934, metadata !DIExpression()), !dbg !935
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !936, metadata !DIExpression()), !dbg !937
  store i32 0, i32* %s32Result, align 4, !dbg !937
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !938, metadata !DIExpression()), !dbg !939
  store i32 0, i32* %s32Temp1, align 4, !dbg !939
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !940
  %conv = zext i16 %0 to i32, !dbg !940
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !941
  %conv1 = sext i16 %1 to i32, !dbg !941
  %mul = mul nsw i32 %conv, %conv1, !dbg !942
  store i32 %mul, i32* %s32Result, align 4, !dbg !943
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !944
  %conv2 = zext i16 %2 to i32, !dbg !944
  %cmp = icmp eq i32 %conv2, 0, !dbg !946
  br i1 %cmp, label %if.then, label %if.else7, !dbg !947

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !948
  %cmp4 = icmp slt i32 %3, 0, !dbg !951
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !952

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !953
  br label %return, !dbg !953

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !955
  br label %return, !dbg !955

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !957
  %5 = load i32, i32* %s32Result, align 4, !dbg !959
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !960
  %conv8 = zext i16 %6 to i32, !dbg !960
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !961
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !961
  %div = sdiv i32 %5, %conv8, !dbg !961, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !962
  %conv9 = zext i16 %7 to i32, !dbg !962
  %mul10 = mul nsw i32 %div, %conv9, !dbg !963
  %sub = sub nsw i32 %4, %mul10, !dbg !964
  %shl = shl i32 %sub, 1, !dbg !965
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !966
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !967
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !968
  %conv11 = zext i16 %9 to i32, !dbg !968
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !969
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !969
  %div12 = sdiv i32 %8, %conv11, !dbg !969, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !970
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !971
  %conv13 = zext i16 %11 to i32, !dbg !971
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !972
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !972
  %div14 = sdiv i32 %10, %conv13, !dbg !972, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !973
  store i32 %add, i32* %s32Result, align 4, !dbg !974
  %12 = load i32, i32* %s32Result, align 4, !dbg !975
  %cmp15 = icmp slt i32 %12, 32767, !dbg !977
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !978

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !979
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !982
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !983

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !984
  %conv21 = trunc i32 %14 to i16, !dbg !986
  store i16 %conv21, i16* %retval, align 2, !dbg !987
  br label %return, !dbg !987

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !988
  br label %return, !dbg !988

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !990
  br label %return, !dbg !990

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !992
  ret i16 %15, !dbg !992
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !993 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !996, metadata !DIExpression()), !dbg !997
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !998, metadata !DIExpression()), !dbg !999
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1000, metadata !DIExpression()), !dbg !1001
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !1002, metadata !DIExpression()), !dbg !1003
  store i32 0, i32* %u32Result, align 4, !dbg !1003
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1004, metadata !DIExpression()), !dbg !1005
  store i32 0, i32* %u32Temp1, align 4, !dbg !1005
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1006, metadata !DIExpression()), !dbg !1007
  store i32 0, i32* %s32Result, align 4, !dbg !1007
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1008, metadata !DIExpression()), !dbg !1009
  store i32 0, i32* %s32Temp1, align 4, !dbg !1009
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !1010
  %conv = sext i16 %0 to i32, !dbg !1010
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !1011
  %conv1 = zext i16 %1 to i32, !dbg !1011
  %mul = mul nsw i32 %conv, %conv1, !dbg !1012
  store i32 %mul, i32* %s32Result, align 4, !dbg !1013
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1014
  %conv2 = sext i16 %2 to i32, !dbg !1014
  %cmp = icmp eq i32 %conv2, 0, !dbg !1016
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1017

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1018
  %cmp4 = icmp sge i32 %3, 0, !dbg !1021
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1022

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !1023
  br label %return, !dbg !1023

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1025
  br label %return, !dbg !1025

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1027
  %5 = load i32, i32* %s32Result, align 4, !dbg !1029
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1030
  %conv8 = sext i16 %6 to i32, !dbg !1030
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1031
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1031
  %div = sdiv i32 %5, %conv8, !dbg !1031, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1032
  %conv9 = sext i16 %7 to i32, !dbg !1032
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1033
  %sub = sub nsw i32 %4, %mul10, !dbg !1034
  %shl = shl i32 %sub, 1, !dbg !1035
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1036
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1037
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1038
  %conv11 = sext i16 %9 to i32, !dbg !1038
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1039
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1039
  %div12 = sdiv i32 %8, %conv11, !dbg !1039, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1040
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1041
  %conv13 = sext i16 %11 to i32, !dbg !1041
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1042
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1042
  %div14 = sdiv i32 %10, %conv13, !dbg !1042, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1043
  store i32 %add, i32* %s32Result, align 4, !dbg !1044
  %12 = load i32, i32* %s32Result, align 4, !dbg !1045
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1047
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1048

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1049
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1052
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1053

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1054
  %conv21 = trunc i32 %14 to i16, !dbg !1056
  store i16 %conv21, i16* %retval, align 2, !dbg !1057
  br label %return, !dbg !1057

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1058
  br label %return, !dbg !1058

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1060
  br label %return, !dbg !1060

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1062
  ret i16 %15, !dbg !1062
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1063 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1066, metadata !DIExpression()), !dbg !1067
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1068, metadata !DIExpression()), !dbg !1069
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1070, metadata !DIExpression()), !dbg !1071
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1072, metadata !DIExpression()), !dbg !1073
  store i32 0, i32* %s32Result, align 4, !dbg !1073
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1074, metadata !DIExpression()), !dbg !1075
  store i32 0, i32* %s32Temp1, align 4, !dbg !1075
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !1076
  %conv = sext i16 %0 to i32, !dbg !1076
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !1077
  %conv1 = zext i16 %1 to i32, !dbg !1077
  %mul = mul nsw i32 %conv, %conv1, !dbg !1078
  store i32 %mul, i32* %s32Result, align 4, !dbg !1079
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1080
  %conv2 = zext i16 %2 to i32, !dbg !1080
  %cmp = icmp eq i32 %conv2, 0, !dbg !1082
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1083

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1084
  %cmp4 = icmp sge i32 %3, 0, !dbg !1087
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1088

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !1089
  br label %return, !dbg !1089

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1091
  br label %return, !dbg !1091

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1093
  %5 = load i32, i32* %s32Result, align 4, !dbg !1095
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1096
  %conv8 = zext i16 %6 to i32, !dbg !1096
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1097
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1097
  %div = sdiv i32 %5, %conv8, !dbg !1097, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1098
  %conv9 = zext i16 %7 to i32, !dbg !1098
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1099
  %sub = sub nsw i32 %4, %mul10, !dbg !1100
  %shl = shl i32 %sub, 1, !dbg !1101
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1102
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1103
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1104
  %conv11 = zext i16 %9 to i32, !dbg !1104
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1105
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1105
  %div12 = sdiv i32 %8, %conv11, !dbg !1105, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1106
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1107
  %conv13 = zext i16 %11 to i32, !dbg !1107
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1108
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1108
  %div14 = sdiv i32 %10, %conv13, !dbg !1108, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1109
  store i32 %add, i32* %s32Result, align 4, !dbg !1110
  %12 = load i32, i32* %s32Result, align 4, !dbg !1111
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1113
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1114

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1115
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1118
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1119

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1120
  %conv21 = trunc i32 %14 to i16, !dbg !1122
  store i16 %conv21, i16* %retval, align 2, !dbg !1123
  br label %return, !dbg !1123

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1124
  br label %return, !dbg !1124

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1126
  br label %return, !dbg !1126

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1128
  ret i16 %15, !dbg !1128
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1129 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1132, metadata !DIExpression()), !dbg !1133
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1134, metadata !DIExpression()), !dbg !1135
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1136, metadata !DIExpression()), !dbg !1137
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1138, metadata !DIExpression()), !dbg !1139
  store i32 0, i32* %u32Temp1, align 4, !dbg !1139
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1140, metadata !DIExpression()), !dbg !1141
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1141
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1142
  %conv = zext i16 %0 to i32, !dbg !1142
  %cmp = icmp eq i32 %conv, 0, !dbg !1144
  br i1 %cmp, label %if.then, label %if.else, !dbg !1145

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1146
  br label %return, !dbg !1146

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1148
  %conv2 = zext i16 %1 to i32, !dbg !1148
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1150
  %conv3 = zext i16 %2 to i32, !dbg !1150
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1151
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1152
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1153
  %conv4 = zext i16 %3 to i32, !dbg !1153
  %shr = ashr i32 %conv4, 1, !dbg !1154
  %conv5 = trunc i32 %shr to i16, !dbg !1153
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1155
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1156
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1157
  %conv6 = zext i16 %5 to i32, !dbg !1157
  %add = add i32 %4, %conv6, !dbg !1158
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1159
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1160
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1161
  %conv7 = zext i16 %7 to i32, !dbg !1161
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1162
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1162
  %div = udiv i32 %6, %conv7, !dbg !1162, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1163
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1164
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1166
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1167

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1168
  %and = and i32 %9, 65535, !dbg !1170
  %conv11 = trunc i32 %and to i16, !dbg !1171
  store i16 %conv11, i16* %retval, align 2, !dbg !1172
  br label %return, !dbg !1172

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1173
  br label %return, !dbg !1173

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1175
  ret i16 %10, !dbg !1175
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1176 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1179, metadata !DIExpression()), !dbg !1180
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1181, metadata !DIExpression()), !dbg !1182
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1183, metadata !DIExpression()), !dbg !1184
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1185, metadata !DIExpression()), !dbg !1186
  store i32 0, i32* %u32Temp1, align 4, !dbg !1186
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1187
  %cmp = icmp eq i32 %0, 0, !dbg !1189
  br i1 %cmp, label %if.then, label %if.else, !dbg !1190

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1191
  br label %return, !dbg !1191

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1193
  %conv = zext i16 %1 to i32, !dbg !1193
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1195
  %conv1 = zext i16 %2 to i32, !dbg !1195
  %mul = mul nsw i32 %conv, %conv1, !dbg !1196
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1197
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1198
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1198
  %div = udiv i32 %mul, %3, !dbg !1198, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1199
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1200
  %conv2 = zext i16 %4 to i32, !dbg !1200
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1202
  %conv3 = zext i16 %5 to i32, !dbg !1202
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1203
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1204
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1205
  %mul5 = mul i32 %6, %7, !dbg !1206
  %sub = sub i32 %mul4, %mul5, !dbg !1207
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1208
  %div6 = udiv i32 %8, 2, !dbg !1209
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1210
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1211

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1212
  %inc = add i32 %9, 1, !dbg !1212
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1212
  br label %if.end, !dbg !1214

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1215
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1217
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1218

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1219
  %and = and i32 %11, 65535, !dbg !1221
  %conv13 = trunc i32 %and to i16, !dbg !1222
  store i16 %conv13, i16* %retval, align 2, !dbg !1223
  br label %return, !dbg !1223

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1224
  br label %return, !dbg !1224

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1226
  ret i16 %12, !dbg !1226
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1227 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1230, metadata !DIExpression()), !dbg !1231
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1232, metadata !DIExpression()), !dbg !1233
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1234, metadata !DIExpression()), !dbg !1235
  store i32 0, i32* %u32Temp1, align 4, !dbg !1235
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1236
  %conv = zext i16 %0 to i32, !dbg !1236
  %cmp = icmp eq i32 %conv, 0, !dbg !1238
  br i1 %cmp, label %if.then, label %if.else, !dbg !1239

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1240
  br label %return, !dbg !1240

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1242
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1244
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1245
  %conv2 = zext i16 %3 to i32, !dbg !1245
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1246
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1246
  %div = udiv i32 %2, %conv2, !dbg !1246, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1247
  %conv3 = zext i16 %4 to i32, !dbg !1247
  %mul = mul i32 %div, %conv3, !dbg !1248
  %sub = sub i32 %1, %mul, !dbg !1249
  %shl = shl i32 %sub, 1, !dbg !1250
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1251
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1252
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1253
  %conv4 = zext i16 %6 to i32, !dbg !1253
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1254
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1254
  %div5 = udiv i32 %5, %conv4, !dbg !1254, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1255
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1256
  %conv6 = zext i16 %8 to i32, !dbg !1256
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1257
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1257
  %div7 = udiv i32 %7, %conv6, !dbg !1257, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1258
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1259
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1260
  store i32 %9, i32* %retval, align 4, !dbg !1261
  br label %return, !dbg !1261

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1262
  ret i32 %10, !dbg !1262
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1263 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1266, metadata !DIExpression()), !dbg !1267
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1268, metadata !DIExpression()), !dbg !1269
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1270, metadata !DIExpression()), !dbg !1271
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1272, metadata !DIExpression()), !dbg !1273
  store i32 0, i32* %s32Temp1, align 4, !dbg !1273
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1274, metadata !DIExpression()), !dbg !1275
  store i32 0, i32* %s32Temp2, align 4, !dbg !1275
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1276, metadata !DIExpression()), !dbg !1277
  store i32 0, i32* %s32Temp3, align 4, !dbg !1277
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1278
  %conv = sext i16 %0 to i32, !dbg !1278
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1279
  %conv1 = sext i16 %1 to i32, !dbg !1279
  %mul = mul nsw i32 %conv, %conv1, !dbg !1280
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1281
  %2 = load i16, i16* %div.addr, align 2, !dbg !1282
  %conv2 = sext i16 %2 to i32, !dbg !1282
  %cmp = icmp eq i32 %conv2, 0, !dbg !1284
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1285

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1286
  %cmp4 = icmp slt i32 %3, 0, !dbg !1289
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1290

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1291
  br label %return, !dbg !1291

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1293
  br label %return, !dbg !1293

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1295
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1297
  %6 = load i16, i16* %div.addr, align 2, !dbg !1298
  %conv8 = sext i16 %6 to i32, !dbg !1298
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1299
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1299
  %div9 = sdiv i32 %5, %conv8, !dbg !1299, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1300
  %conv10 = sext i16 %7 to i32, !dbg !1300
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1301
  %sub = sub nsw i32 %4, %mul11, !dbg !1302
  %shl = shl i32 %sub, 1, !dbg !1303
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1304
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1305
  %9 = load i16, i16* %div.addr, align 2, !dbg !1306
  %conv12 = sext i16 %9 to i32, !dbg !1306
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1307
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1307
  %div13 = sdiv i32 %8, %conv12, !dbg !1307, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1308
  %11 = load i16, i16* %div.addr, align 2, !dbg !1309
  %conv14 = sext i16 %11 to i32, !dbg !1309
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1310
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1310
  %div15 = sdiv i32 %10, %conv14, !dbg !1310, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1311
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1312
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1313
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1315
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1316

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1317
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1320
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1321

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1322
  %conv22 = trunc i32 %14 to i16, !dbg !1324
  store i16 %conv22, i16* %retval, align 2, !dbg !1325
  br label %return, !dbg !1325

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1326
  br label %return, !dbg !1326

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1328
  br label %return, !dbg !1328

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1330
  ret i16 %15, !dbg !1330
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1331 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1334, metadata !DIExpression()), !dbg !1335
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1336, metadata !DIExpression()), !dbg !1337
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1338, metadata !DIExpression()), !dbg !1339
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1340, metadata !DIExpression()), !dbg !1341
  store i32 0, i32* %s32Result, align 4, !dbg !1341
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1342, metadata !DIExpression()), !dbg !1343
  store i32 0, i32* %s32Temp1, align 4, !dbg !1343
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1344
  %conv = sext i16 %0 to i32, !dbg !1344
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1345
  %conv1 = sext i16 %1 to i32, !dbg !1345
  %mul = mul nsw i32 %conv, %conv1, !dbg !1346
  store i32 %mul, i32* %s32Result, align 4, !dbg !1347
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1348
  %conv2 = zext i16 %2 to i32, !dbg !1348
  %cmp = icmp eq i32 %conv2, 0, !dbg !1350
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1351

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1352
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1355
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1356

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1357
  br label %return, !dbg !1357

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1359
  %cmp7 = icmp eq i32 %4, 0, !dbg !1361
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1362

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1363
  br label %return, !dbg !1363

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1365
  br label %return, !dbg !1365

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1367
  %6 = load i32, i32* %s32Result, align 4, !dbg !1369
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1370
  %conv12 = zext i16 %7 to i32, !dbg !1370
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1371
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1371
  %div = sdiv i32 %6, %conv12, !dbg !1371, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1372
  %conv13 = zext i16 %8 to i32, !dbg !1372
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1373
  %sub = sub nsw i32 %5, %mul14, !dbg !1374
  %shl = shl i32 %sub, 1, !dbg !1375
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1376
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1377
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1378
  %conv15 = zext i16 %10 to i32, !dbg !1378
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1379
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1379
  %div16 = sdiv i32 %9, %conv15, !dbg !1379, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1380
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1381
  %conv17 = zext i16 %12 to i32, !dbg !1381
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1382
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1382
  %div18 = sdiv i32 %11, %conv17, !dbg !1382, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1383
  store i32 %add, i32* %s32Result, align 4, !dbg !1384
  %13 = load i32, i32* %s32Result, align 4, !dbg !1385
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1387
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1388

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1389
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1392
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1393

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1394
  %conv25 = trunc i32 %15 to i16, !dbg !1396
  store i16 %conv25, i16* %retval, align 2, !dbg !1397
  br label %return, !dbg !1397

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1398
  br label %return, !dbg !1398

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1400
  br label %return, !dbg !1400

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1402
  ret i16 %16, !dbg !1402
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1403 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1406, metadata !DIExpression()), !dbg !1407
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1408, metadata !DIExpression()), !dbg !1409
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1410, metadata !DIExpression()), !dbg !1411
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1412
  %cmp = icmp eq i32 %0, 0, !dbg !1414
  br i1 %cmp, label %if.then, label %if.else, !dbg !1415

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1416
  br label %return, !dbg !1416

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1418
  %cmp1 = icmp sle i32 %1, 0, !dbg !1421
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1422

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1423
  br label %return, !dbg !1423

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1425
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1427
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1428
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1429
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1429
  %div = udiv i32 %3, %4, !dbg !1429, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1430
  %mul = mul i32 %div, %5, !dbg !1431
  %sub = sub i32 %2, %mul, !dbg !1432
  %shl = shl i32 %sub, 1, !dbg !1433
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1434
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1435
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1436
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1437
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1437
  %div4 = udiv i32 %6, %7, !dbg !1437, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1438
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1439
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1440
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1440
  %div5 = udiv i32 %8, %9, !dbg !1440, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1441
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1442
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1443
  store i32 %10, i32* %retval, align 4, !dbg !1444
  br label %return, !dbg !1444

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1445
  ret i32 %11, !dbg !1445
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1446 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1449, metadata !DIExpression()), !dbg !1450
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1451, metadata !DIExpression()), !dbg !1452
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1453, metadata !DIExpression()), !dbg !1454
  store i32 0, i32* %s32Temp1, align 4, !dbg !1454
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1455
  %cmp = icmp eq i32 %0, 0, !dbg !1457
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1458

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1459
  %cmp1 = icmp sge i32 %1, 0, !dbg !1462
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1463

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1464
  br label %return, !dbg !1464

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1466
  br label %return, !dbg !1466

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1468
  %cmp4 = icmp sge i32 %2, 0, !dbg !1471
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1472

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1473
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1475
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1476
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1477
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1477
  %div = udiv i32 %4, %5, !dbg !1477, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1478
  %mul = mul i32 %div, %6, !dbg !1479
  %sub = sub i32 %3, %mul, !dbg !1480
  %shl = shl i32 %sub, 1, !dbg !1481
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1482
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1483
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1484
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1485
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1485
  %div6 = udiv i32 %7, %8, !dbg !1485, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1486
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1487
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1488
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1488
  %div7 = udiv i32 %9, %10, !dbg !1488, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1489
  store i32 %add, i32* %retval, align 4, !dbg !1490
  br label %return, !dbg !1490

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1491
  br label %return, !dbg !1491

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1493
  ret i32 %11, !dbg !1493
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1494 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1497, metadata !DIExpression()), !dbg !1498
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1499, metadata !DIExpression()), !dbg !1500
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1501, metadata !DIExpression()), !dbg !1502
  store i32 0, i32* %u32Temp1, align 4, !dbg !1502
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1503, metadata !DIExpression()), !dbg !1504
  store i32 0, i32* %u32Temp2, align 4, !dbg !1504
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1505
  %cmp = icmp eq i32 %0, 0, !dbg !1507
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1508

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1509
  %cmp1 = icmp slt i32 %1, 0, !dbg !1512
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1513

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1514
  br label %return, !dbg !1514

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1516
  br label %return, !dbg !1516

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1518
  %cmp4 = icmp sge i32 %2, 0, !dbg !1521
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1522

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1523
  %cmp6 = icmp eq i32 %3, 0, !dbg !1526
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1527

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1528
  br label %return, !dbg !1528

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1530
  %cmp9 = icmp sle i32 %4, 0, !dbg !1533
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1534

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1535
  br label %return, !dbg !1535

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1537
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1539
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1540
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1541
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1541
  %div = sdiv i32 %6, %7, !dbg !1541, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1542
  %mul = mul nsw i32 %div, %8, !dbg !1543
  %sub = sub nsw i32 %5, %mul, !dbg !1544
  %shl = shl i32 %sub, 1, !dbg !1545
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1546
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1547
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1548
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1549
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1549
  %div12 = udiv i32 %9, %10, !dbg !1549, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1550
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1551
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1552
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1552
  %div13 = sdiv i32 %11, %12, !dbg !1552, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1553
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1554
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1555
  store i32 %13, i32* %retval, align 4, !dbg !1556
  br label %return, !dbg !1556

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1557
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1560
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1561

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1562
  br label %return, !dbg !1562

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1564
  %sub18 = sub nsw i32 0, %15, !dbg !1566
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1567
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1568
  %sub19 = sub nsw i32 0, %16, !dbg !1569
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1570
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1571
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1572
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1573
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1574
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1574
  %div20 = sdiv i32 %18, %19, !dbg !1574, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1575
  %mul21 = mul nsw i32 %div20, %20, !dbg !1576
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1577
  %shl23 = shl i32 %sub22, 1, !dbg !1578
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1579
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1580
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1581
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1582
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1582
  %div24 = udiv i32 %21, %22, !dbg !1582, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1583
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1584
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1585
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1585
  %div25 = sdiv i32 %23, %24, !dbg !1585, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1586
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1587
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1588
  store i32 %25, i32* %retval, align 4, !dbg !1589
  br label %return, !dbg !1589

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1590
  ret i32 %26, !dbg !1590
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1591 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1594, metadata !DIExpression()), !dbg !1595
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1596, metadata !DIExpression()), !dbg !1597
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1598, metadata !DIExpression()), !dbg !1599
  store i32 0, i32* %u32Temp1, align 4, !dbg !1599
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1600, metadata !DIExpression()), !dbg !1601
  store i32 0, i32* %u32Temp2, align 4, !dbg !1601
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1602, metadata !DIExpression()), !dbg !1603
  store i32 0, i32* %u32Temp3, align 4, !dbg !1603
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1604, metadata !DIExpression()), !dbg !1605
  store i32 0, i32* %numerator_old, align 4, !dbg !1605
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1606
  %cmp = icmp eq i32 %0, 0, !dbg !1608
  br i1 %cmp, label %if.then, label %if.else, !dbg !1609

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1610
  br label %return, !dbg !1610

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1612
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1614
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1615
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1616
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1617
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1617
  %div = udiv i32 %3, %4, !dbg !1617, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1618
  %sub = sub i32 %1, %mul, !dbg !1619
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1620
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1621
  %and = and i32 %5, 1, !dbg !1623
  %cmp1 = icmp eq i32 %and, 0, !dbg !1624
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1625

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1626
  %shr = lshr i32 %6, 1, !dbg !1628
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1629
  br label %if.end, !dbg !1630

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1631
  %shr4 = lshr i32 %7, 1, !dbg !1633
  %add = add i32 %shr4, 1, !dbg !1634
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1635
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1636
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1638
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1639
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1640

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1641
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1643
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1644
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1644
  %div7 = udiv i32 %10, %11, !dbg !1644, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1645
  br label %return, !dbg !1645

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1646
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1648
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1649
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1649
  %div9 = udiv i32 %12, %13, !dbg !1649, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1650
  store i32 %add10, i32* %retval, align 4, !dbg !1651
  br label %return, !dbg !1651

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1652
  ret i32 %14, !dbg !1652
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1653 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1656, metadata !DIExpression()), !dbg !1657
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1658, metadata !DIExpression()), !dbg !1659
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1660, metadata !DIExpression()), !dbg !1661
  store i32 0, i32* %u32Temp1, align 4, !dbg !1661
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1662, metadata !DIExpression()), !dbg !1663
  store i32 0, i32* %u32Temp2, align 4, !dbg !1663
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1664
  %cmp = icmp sle i32 %0, 0, !dbg !1666
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1667

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1668
  %cmp1 = icmp sge i32 %1, 0, !dbg !1671
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1672

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1673
  br label %return, !dbg !1673

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1675
  %sub = sub nsw i32 0, %2, !dbg !1677
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1678
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1679
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1680
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1681
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1682
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1682
  %div = udiv i32 %4, %5, !dbg !1682, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1683
  %mul = mul i32 %div, %6, !dbg !1684
  %sub3 = sub i32 %3, %mul, !dbg !1685
  %shl = shl i32 %sub3, 1, !dbg !1686
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1687
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1688
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1689
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1690
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1690
  %div4 = udiv i32 %7, %8, !dbg !1690, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1691
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1692
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1693
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1693
  %div5 = udiv i32 %9, %10, !dbg !1693, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1694
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1695
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1696
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1698
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1699

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1700
  %sub8 = sub i32 0, %12, !dbg !1702
  store i32 %sub8, i32* %retval, align 4, !dbg !1703
  br label %return, !dbg !1703

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1704
  br label %return, !dbg !1704

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1706
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1708
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1709
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1710
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1710
  %div11 = udiv i32 %14, %15, !dbg !1710, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1711
  %mul12 = mul i32 %div11, %16, !dbg !1712
  %sub13 = sub i32 %13, %mul12, !dbg !1713
  %shl14 = shl i32 %sub13, 1, !dbg !1714
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1715
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1716
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1717
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1718
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1718
  %div15 = udiv i32 %17, %18, !dbg !1718, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1719
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1720
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1721
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1721
  %div16 = udiv i32 %19, %20, !dbg !1721, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1722
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1723
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1724
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1726
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1727

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1728
  store i32 %22, i32* %retval, align 4, !dbg !1730
  br label %return, !dbg !1730

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1731
  br label %return, !dbg !1731

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1733
  ret i32 %23, !dbg !1733
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1734 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1737, metadata !DIExpression()), !dbg !1738
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1739, metadata !DIExpression()), !dbg !1740
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1741, metadata !DIExpression()), !dbg !1742
  store i32 0, i32* %s32Temp1, align 4, !dbg !1742
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1743, metadata !DIExpression()), !dbg !1744
  store i32 0, i32* %s32Temp2, align 4, !dbg !1744
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1745, metadata !DIExpression()), !dbg !1746
  store i32 0, i32* %u32Temp0, align 4, !dbg !1746
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1747, metadata !DIExpression()), !dbg !1748
  store i32 0, i32* %u32Temp1, align 4, !dbg !1748
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1749, metadata !DIExpression()), !dbg !1750
  store i32 0, i32* %u32Temp2, align 4, !dbg !1750
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1751
  %cmp = icmp eq i32 %0, 0, !dbg !1753
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1754

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1755
  %cmp1 = icmp slt i32 %1, 0, !dbg !1758
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1759

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1760
  br label %return, !dbg !1760

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1762
  br label %return, !dbg !1762

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1764
  %cmp4 = icmp sle i32 %2, 0, !dbg !1767
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1768

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1769
  %sub = sub nsw i32 0, %3, !dbg !1771
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1772
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1773
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1774
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1775
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1775
  %div = udiv i32 %4, %5, !dbg !1775, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1776
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1777
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1778
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1779
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1780
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1780
  %div6 = udiv i32 %7, %8, !dbg !1780, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1781
  %mul = mul i32 %div6, %9, !dbg !1782
  %sub7 = sub i32 %6, %mul, !dbg !1783
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1784
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1785
  %and = and i32 %10, 1, !dbg !1787
  %cmp8 = icmp eq i32 %and, 0, !dbg !1788
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1789

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1790
  %shr = lshr i32 %11, 1, !dbg !1792
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1793
  br label %if.end, !dbg !1794

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1795
  %shr11 = lshr i32 %12, 1, !dbg !1797
  %add = add i32 %shr11, 1, !dbg !1798
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1799
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1800
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1802
  %cmp12 = icmp ult i32 %13, %14, !dbg !1803
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1804

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1805
  %neg = xor i32 %15, -1, !dbg !1807
  %add14 = add i32 %neg, 1, !dbg !1808
  store i32 %add14, i32* %retval, align 4, !dbg !1809
  br label %return, !dbg !1809

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1810
  %add16 = add i32 %16, 1, !dbg !1812
  %neg17 = xor i32 %add16, -1, !dbg !1813
  %add18 = add i32 %neg17, 1, !dbg !1814
  store i32 %add18, i32* %retval, align 4, !dbg !1815
  br label %return, !dbg !1815

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1816
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1818
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1819
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1820
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1820
  %div20 = udiv i32 %18, %19, !dbg !1820, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1821
  %mul21 = mul i32 %div20, %20, !dbg !1822
  %sub22 = sub i32 %17, %mul21, !dbg !1823
  %shl = shl i32 %sub22, 1, !dbg !1824
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1825
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1826
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1827
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1828
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1828
  %div23 = udiv i32 %21, %22, !dbg !1828, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1829
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1830
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1831
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1831
  %div24 = udiv i32 %23, %24, !dbg !1831, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1832
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1833
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1834
  store i32 %25, i32* %retval, align 4, !dbg !1835
  br label %return, !dbg !1835

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1836
  ret i32 %26, !dbg !1836
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1837 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1840, metadata !DIExpression()), !dbg !1841
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1842, metadata !DIExpression()), !dbg !1843
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1844, metadata !DIExpression()), !dbg !1845
  store i32 0, i32* %s32Temp1, align 4, !dbg !1845
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1846, metadata !DIExpression()), !dbg !1847
  store i32 0, i32* %s32Temp2, align 4, !dbg !1847
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1848, metadata !DIExpression()), !dbg !1849
  store i32 0, i32* %denominator_prime, align 4, !dbg !1849
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1850, metadata !DIExpression()), !dbg !1851
  store i32 0, i32* %u32Temp1, align 4, !dbg !1851
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1852, metadata !DIExpression()), !dbg !1853
  store i32 0, i32* %u32Temp2, align 4, !dbg !1853
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1854, metadata !DIExpression()), !dbg !1855
  store i32 0, i32* %u32numerator, align 4, !dbg !1855
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1856, metadata !DIExpression()), !dbg !1857
  store i32 0, i32* %u32denominator, align 4, !dbg !1857
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1858
  %cmp = icmp slt i32 %0, 0, !dbg !1860
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1861

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1862
  %cmp1 = icmp sle i32 %1, 0, !dbg !1865
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1866

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1867
  %cmp3 = icmp sge i32 %2, 0, !dbg !1870
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1871

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1872
  br label %return, !dbg !1872

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1874
  %sub = sub nsw i32 0, %3, !dbg !1876
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1877
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1878
  %sub5 = sub nsw i32 0, %4, !dbg !1879
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1880
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1881
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1882
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1883
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1884
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1884
  %div = udiv i32 %6, %7, !dbg !1884, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1885
  %mul = mul i32 %div, %8, !dbg !1886
  %sub6 = sub i32 %5, %mul, !dbg !1887
  %shl = shl i32 %sub6, 1, !dbg !1888
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1889
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1890
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1891
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1892
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1892
  %div7 = udiv i32 %9, %10, !dbg !1892, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1893
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1894
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1895
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1895
  %div8 = udiv i32 %11, %12, !dbg !1895, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1896
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1897
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1898
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1900
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1901

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1902
  store i32 %14, i32* %retval, align 4, !dbg !1904
  br label %return, !dbg !1904

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1905
  br label %return, !dbg !1905

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1907
  %neg = xor i32 %15, -1, !dbg !1909
  %add13 = add nsw i32 %neg, 1, !dbg !1910
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1911
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1912
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1913
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1914
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1915
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1915
  %div14 = udiv i32 %17, %18, !dbg !1915, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1916
  %mul15 = mul i32 %div14, %19, !dbg !1917
  %sub16 = sub i32 %16, %mul15, !dbg !1918
  %shl17 = shl i32 %sub16, 1, !dbg !1919
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1920
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1921
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1922
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1923
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1923
  %div18 = udiv i32 %20, %21, !dbg !1923, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1924
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1925
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1926
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1926
  %div19 = sdiv i32 %22, %23, !dbg !1926, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1927
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1928
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1929
  %neg21 = xor i32 %24, -1, !dbg !1930
  %add22 = add nsw i32 %neg21, 1, !dbg !1931
  store i32 %add22, i32* %retval, align 4, !dbg !1932
  br label %return, !dbg !1932

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1933
  %cmp24 = icmp sle i32 %25, 0, !dbg !1936
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1937

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1938
  %cmp26 = icmp sge i32 %26, 0, !dbg !1941
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1942

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1943
  br label %return, !dbg !1943

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1945
  %neg29 = xor i32 %27, -1, !dbg !1947
  %add30 = add nsw i32 %neg29, 1, !dbg !1948
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1949
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1950
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1951
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1952
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1953
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1953
  %div31 = udiv i32 %29, %30, !dbg !1953, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1954
  %mul32 = mul i32 %div31, %31, !dbg !1955
  %sub33 = sub i32 %28, %mul32, !dbg !1956
  %shl34 = shl i32 %sub33, 1, !dbg !1957
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1958
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1959
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1960
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1961
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1961
  %div35 = udiv i32 %32, %33, !dbg !1961, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1962
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1963
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1964
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1964
  %div36 = udiv i32 %34, %35, !dbg !1964, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1965
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1966
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1967
  %neg38 = xor i32 %36, -1, !dbg !1968
  %add39 = add nsw i32 %neg38, 1, !dbg !1969
  store i32 %add39, i32* %retval, align 4, !dbg !1970
  br label %return, !dbg !1970

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1971
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1973
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1974
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1975
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1975
  %div41 = sdiv i32 %38, %39, !dbg !1975, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1976
  %mul42 = mul nsw i32 %div41, %40, !dbg !1977
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1978
  %shl44 = shl i32 %sub43, 1, !dbg !1979
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1980
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1981
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1982
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1983
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1983
  %div45 = sdiv i32 %41, %42, !dbg !1983, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1984
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1985
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1986
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1986
  %div46 = udiv i32 %43, %44, !dbg !1986, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1987
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1988
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1989
  store i32 %45, i32* %retval, align 4, !dbg !1990
  br label %return, !dbg !1990

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1991
  ret i32 %46, !dbg !1991
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1992 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1995, metadata !DIExpression()), !dbg !1996
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1997, metadata !DIExpression()), !dbg !1998
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1999, metadata !DIExpression()), !dbg !2000
  store i32 0, i32* %numerator_prime, align 4, !dbg !2000
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2001, metadata !DIExpression()), !dbg !2002
  store i32 0, i32* %u32Temp1, align 4, !dbg !2002
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2003, metadata !DIExpression()), !dbg !2004
  store i32 0, i32* %u32Temp2, align 4, !dbg !2004
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2005, metadata !DIExpression()), !dbg !2006
  store i32 0, i32* %u32Temp3, align 4, !dbg !2006
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !2007, metadata !DIExpression()), !dbg !2008
  store i32 0, i32* %s32Temp1, align 4, !dbg !2008
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !2009, metadata !DIExpression()), !dbg !2010
  store i32 0, i32* %s32Temp2, align 4, !dbg !2010
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !2011, metadata !DIExpression()), !dbg !2012
  store i32 0, i32* %s32Temp3, align 4, !dbg !2012
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !2013
  %cmp = icmp eq i32 %0, 0, !dbg !2015
  br i1 %cmp, label %if.then, label %if.else3, !dbg !2016

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !2017
  %cmp1 = icmp slt i32 %1, 0, !dbg !2020
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !2021

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !2022
  br label %return, !dbg !2022

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !2024
  br label %return, !dbg !2024

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !2026
  %cmp4 = icmp slt i32 %2, 0, !dbg !2029
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !2030

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !2031
  %sub = sub nsw i32 0, %3, !dbg !2033
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !2034
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !2035
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !2036
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !2037
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !2037
  %div = udiv i32 %4, %5, !dbg !2037, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !2038
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !2039
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !2040
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !2041
  %mul = mul i32 %7, %8, !dbg !2042
  %sub6 = sub i32 %6, %mul, !dbg !2043
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !2044
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !2045
  %and = and i32 %9, 1, !dbg !2047
  %cmp7 = icmp eq i32 %and, 0, !dbg !2048
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !2049

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !2050
  %shr = lshr i32 %10, 1, !dbg !2052
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !2053
  br label %if.end, !dbg !2054

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !2055
  %shr10 = lshr i32 %11, 1, !dbg !2057
  %add = add i32 %shr10, 1, !dbg !2058
  store i32 %add, i32* %denominator.addr, align 4, !dbg !2059
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2060
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !2062
  %cmp11 = icmp ult i32 %12, %13, !dbg !2063
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !2064

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2065
  %neg = xor i32 %14, -1, !dbg !2067
  %add13 = add i32 %neg, 1, !dbg !2068
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !2069
  br label %if.end18, !dbg !2070

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !2071
  %add15 = add i32 %15, 1, !dbg !2073
  %neg16 = xor i32 %add15, -1, !dbg !2074
  %add17 = add i32 %neg16, 1, !dbg !2075
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !2076
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !2077
  %cmp19 = icmp sge i32 %16, -32768, !dbg !2079
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !2080

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !2081
  %conv = trunc i32 %17 to i16, !dbg !2083
  store i16 %conv, i16* %retval, align 2, !dbg !2084
  br label %return, !dbg !2084

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !2085
  br label %return, !dbg !2085

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !2087
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !2089
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !2090
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !2090
  %div23 = udiv i32 %18, %19, !dbg !2090, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !2091
  %mul24 = mul i32 %div23, %20, !dbg !2092
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !2093
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !2094
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !2095
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !2096
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !2097
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !2097
  %div25 = udiv i32 %22, %23, !dbg !2097, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !2098
  %mul26 = mul i32 %div25, %24, !dbg !2099
  %sub27 = sub i32 %21, %mul26, !dbg !2100
  %shl = shl i32 %sub27, 1, !dbg !2101
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !2102
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !2103
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !2104
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !2105
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !2105
  %div28 = udiv i32 %25, %26, !dbg !2105, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !2106
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !2107
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !2108
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !2108
  %div29 = udiv i32 %27, %28, !dbg !2108, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !2109
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2110
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2111
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2113
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2114

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2115
  %conv34 = trunc i32 %30 to i16, !dbg !2117
  store i16 %conv34, i16* %retval, align 2, !dbg !2118
  br label %return, !dbg !2118

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2119
  br label %return, !dbg !2119

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2121
  ret i16 %31, !dbg !2121
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2122 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2128, metadata !DIExpression()), !dbg !2129
  %2 = icmp eq i64 %0, 0, !dbg !2130
  br i1 %2, label %3, label %4, !dbg !2132

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2133
  unreachable, !dbg !2133

4:                                                ; preds = %1
  ret void, !dbg !2134
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2135 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2141, metadata !DIExpression()), !dbg !2143
  call void @llvm.dbg.value(metadata i64 %1, metadata !2142, metadata !DIExpression()), !dbg !2143
  %3 = icmp ult i64 %1, %0, !dbg !2144
  br i1 %3, label %5, label %4, !dbg !2146

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2147
  unreachable, !dbg !2147

5:                                                ; preds = %2
  ret void, !dbg !2149
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0038/div_Ccode_alarm_0038.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0038")
!4 = !{}
!5 = !{!6, !13, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0038")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0038")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0038/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0038")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0038")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0038")
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
!450 = !DILocation(line: 367, column: 37, scope: !362)
!451 = !DILocation(line: 367, column: 48, scope: !362)
!452 = !DILocation(line: 367, column: 46, scope: !362)
!453 = !DILocation(line: 367, column: 27, scope: !362)
!454 = !DILocation(line: 367, column: 25, scope: !362)
!455 = !DILocation(line: 368, column: 5, scope: !362)
!456 = !DILocation(line: 389, column: 5, scope: !457)
!457 = distinct !DILexicalBlock(scope: !356, file: !69, line: 388, column: 4)
!458 = !DILocation(line: 395, column: 1, scope: !186)
!459 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !460, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!460 = !DISubroutineType(types: !461)
!461 = !{!19, !13}
!462 = !DILocalVariable(name: "denominator", arg: 1, scope: !459, file: !33, line: 24, type: !13)
!463 = !DILocation(line: 24, column: 40, scope: !459)
!464 = !DILocation(line: 26, column: 12, scope: !459)
!465 = !DILocation(line: 26, column: 24, scope: !459)
!466 = !DILocation(line: 26, column: 5, scope: !459)
!467 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !460, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!468 = !DILocalVariable(name: "left", arg: 1, scope: !467, file: !33, line: 84, type: !13)
!469 = !DILocation(line: 84, column: 51, scope: !467)
!470 = !DILocation(line: 86, column: 12, scope: !467)
!471 = !DILocation(line: 86, column: 17, scope: !467)
!472 = !DILocation(line: 86, column: 5, scope: !467)
!473 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !474, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!474 = !DISubroutineType(types: !475)
!475 = !{!19, !13, !20}
!476 = !DILocalVariable(name: "left", arg: 1, scope: !473, file: !33, line: 90, type: !13)
!477 = !DILocation(line: 90, column: 41, scope: !473)
!478 = !DILocalVariable(name: "count", arg: 2, scope: !473, file: !33, line: 90, type: !20)
!479 = !DILocation(line: 90, column: 56, scope: !473)
!480 = !DILocation(line: 92, column: 9, scope: !481)
!481 = distinct !DILexicalBlock(scope: !473, file: !33, line: 92, column: 9)
!482 = !DILocation(line: 92, column: 15, scope: !481)
!483 = !DILocation(line: 92, column: 9, scope: !473)
!484 = !DILocation(line: 93, column: 9, scope: !485)
!485 = distinct !DILexicalBlock(scope: !481, file: !33, line: 92, column: 32)
!486 = !DILocation(line: 95, column: 12, scope: !473)
!487 = !DILocation(line: 95, column: 34, scope: !473)
!488 = !DILocation(line: 95, column: 31, scope: !473)
!489 = !DILocation(line: 95, column: 17, scope: !473)
!490 = !DILocation(line: 95, column: 41, scope: !473)
!491 = !DILocation(line: 95, column: 5, scope: !473)
!492 = !DILocation(line: 96, column: 1, scope: !473)
!493 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !494, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!494 = !DISubroutineType(types: !495)
!495 = !{!19, !13, !13}
!496 = !DILocalVariable(name: "left", arg: 1, scope: !493, file: !33, line: 78, type: !13)
!497 = !DILocation(line: 78, column: 38, scope: !493)
!498 = !DILocalVariable(name: "right", arg: 2, scope: !493, file: !33, line: 78, type: !13)
!499 = !DILocation(line: 78, column: 52, scope: !493)
!500 = !DILocation(line: 80, column: 12, scope: !493)
!501 = !DILocation(line: 80, column: 19, scope: !493)
!502 = !DILocation(line: 80, column: 17, scope: !493)
!503 = !DILocation(line: 80, column: 25, scope: !493)
!504 = !DILocation(line: 80, column: 5, scope: !493)
!505 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !494, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!506 = !DILocalVariable(name: "left", arg: 1, scope: !505, file: !33, line: 72, type: !13)
!507 = !DILocation(line: 72, column: 38, scope: !505)
!508 = !DILocalVariable(name: "right", arg: 2, scope: !505, file: !33, line: 72, type: !13)
!509 = !DILocation(line: 72, column: 52, scope: !505)
!510 = !DILocation(line: 74, column: 12, scope: !505)
!511 = !DILocation(line: 74, column: 19, scope: !505)
!512 = !DILocation(line: 74, column: 17, scope: !505)
!513 = !DILocation(line: 74, column: 25, scope: !505)
!514 = !DILocation(line: 74, column: 5, scope: !505)
!515 = distinct !DISubprogram(name: "klee_alarm_s32_add_lower", scope: !33, file: !33, line: 48, type: !494, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!516 = !DILocalVariable(name: "left", arg: 1, scope: !515, file: !33, line: 48, type: !13)
!517 = !DILocation(line: 48, column: 38, scope: !515)
!518 = !DILocalVariable(name: "right", arg: 2, scope: !515, file: !33, line: 48, type: !13)
!519 = !DILocation(line: 48, column: 52, scope: !515)
!520 = !DILocation(line: 50, column: 12, scope: !515)
!521 = !DILocation(line: 50, column: 19, scope: !515)
!522 = !DILocation(line: 50, column: 17, scope: !515)
!523 = !DILocation(line: 50, column: 25, scope: !515)
!524 = !DILocation(line: 50, column: 5, scope: !515)
!525 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !494, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!526 = !DILocalVariable(name: "left", arg: 1, scope: !525, file: !33, line: 54, type: !13)
!527 = !DILocation(line: 54, column: 38, scope: !525)
!528 = !DILocalVariable(name: "right", arg: 2, scope: !525, file: !33, line: 54, type: !13)
!529 = !DILocation(line: 54, column: 52, scope: !525)
!530 = !DILocation(line: 56, column: 12, scope: !525)
!531 = !DILocation(line: 56, column: 19, scope: !525)
!532 = !DILocation(line: 56, column: 17, scope: !525)
!533 = !DILocation(line: 56, column: 25, scope: !525)
!534 = !DILocation(line: 56, column: 5, scope: !525)
!535 = distinct !DISubprogram(name: "klee_alarm_s32_div_representable", scope: !33, file: !33, line: 30, type: !494, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!536 = !DILocalVariable(name: "numerator", arg: 1, scope: !535, file: !33, line: 30, type: !13)
!537 = !DILocation(line: 30, column: 46, scope: !535)
!538 = !DILocalVariable(name: "denominator", arg: 2, scope: !535, file: !33, line: 30, type: !13)
!539 = !DILocation(line: 30, column: 65, scope: !535)
!540 = !DILocation(line: 32, column: 14, scope: !535)
!541 = !DILocation(line: 32, column: 24, scope: !535)
!542 = !DILocation(line: 32, column: 37, scope: !535)
!543 = !DILocation(line: 32, column: 12, scope: !535)
!544 = !DILocation(line: 32, column: 5, scope: !535)
!545 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 413, type: !546, scopeLine: 414, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!546 = !DISubroutineType(types: !547)
!547 = !{!6, !6, !28}
!548 = !DILocalVariable(name: "numerator", arg: 1, scope: !545, file: !69, line: 413, type: !6)
!549 = !DILocation(line: 413, column: 31, scope: !545)
!550 = !DILocalVariable(name: "denominator", arg: 2, scope: !545, file: !69, line: 413, type: !28)
!551 = !DILocation(line: 413, column: 47, scope: !545)
!552 = !DILocalVariable(name: "u16Temp1", scope: !545, file: !69, line: 415, type: !28)
!553 = !DILocation(line: 415, column: 6, scope: !545)
!554 = !DILocalVariable(name: "s32Temp1", scope: !545, file: !69, line: 416, type: !16)
!555 = !DILocation(line: 416, column: 6, scope: !545)
!556 = !DILocalVariable(name: "s32Temp2", scope: !545, file: !69, line: 416, type: !16)
!557 = !DILocation(line: 416, column: 15, scope: !545)
!558 = !DILocation(line: 417, column: 13, scope: !545)
!559 = !DILocation(line: 417, column: 25, scope: !545)
!560 = !DILocation(line: 417, column: 11, scope: !545)
!561 = !DILocation(line: 418, column: 13, scope: !545)
!562 = !DILocation(line: 418, column: 22, scope: !545)
!563 = !DILocation(line: 418, column: 11, scope: !545)
!564 = !DILocation(line: 419, column: 5, scope: !565)
!565 = distinct !DILexicalBlock(scope: !545, file: !69, line: 419, column: 5)
!566 = !DILocation(line: 419, column: 14, scope: !565)
!567 = !DILocation(line: 419, column: 5, scope: !545)
!568 = !DILocation(line: 421, column: 7, scope: !569)
!569 = distinct !DILexicalBlock(scope: !570, file: !69, line: 421, column: 7)
!570 = distinct !DILexicalBlock(scope: !565, file: !69, line: 420, column: 2)
!571 = !DILocation(line: 421, column: 17, scope: !569)
!572 = !DILocation(line: 421, column: 7, scope: !570)
!573 = !DILocation(line: 423, column: 4, scope: !574)
!574 = distinct !DILexicalBlock(scope: !569, file: !69, line: 422, column: 3)
!575 = !DILocation(line: 427, column: 4, scope: !576)
!576 = distinct !DILexicalBlock(scope: !569, file: !69, line: 426, column: 3)
!577 = !DILocation(line: 432, column: 15, scope: !578)
!578 = distinct !DILexicalBlock(scope: !565, file: !69, line: 431, column: 2)
!579 = !DILocation(line: 432, column: 24, scope: !578)
!580 = !DILocation(line: 432, column: 32, scope: !578)
!581 = !DILocation(line: 432, column: 41, scope: !578)
!582 = !DILocation(line: 432, column: 47, scope: !578)
!583 = !DILocation(line: 432, column: 46, scope: !578)
!584 = !DILocation(line: 432, column: 57, scope: !578)
!585 = !DILocation(line: 432, column: 56, scope: !578)
!586 = !DILocation(line: 432, column: 29, scope: !578)
!587 = !DILocation(line: 432, column: 12, scope: !578)
!588 = !DILocation(line: 433, column: 14, scope: !578)
!589 = !DILocation(line: 433, column: 22, scope: !578)
!590 = !DILocation(line: 433, column: 12, scope: !578)
!591 = !DILocation(line: 434, column: 14, scope: !578)
!592 = !DILocation(line: 434, column: 23, scope: !578)
!593 = !DILocation(line: 434, column: 22, scope: !578)
!594 = !DILocation(line: 434, column: 12, scope: !578)
!595 = !DILocation(line: 435, column: 16, scope: !578)
!596 = !DILocation(line: 435, column: 25, scope: !578)
!597 = !DILocation(line: 435, column: 31, scope: !578)
!598 = !DILocation(line: 435, column: 30, scope: !578)
!599 = !DILocation(line: 435, column: 43, scope: !578)
!600 = !DILocation(line: 435, column: 41, scope: !578)
!601 = !DILocation(line: 435, column: 12, scope: !578)
!602 = !DILocation(line: 436, column: 6, scope: !603)
!603 = distinct !DILexicalBlock(scope: !578, file: !69, line: 436, column: 6)
!604 = !DILocation(line: 436, column: 15, scope: !603)
!605 = !DILocation(line: 436, column: 6, scope: !578)
!606 = !DILocation(line: 438, column: 7, scope: !607)
!607 = distinct !DILexicalBlock(scope: !608, file: !69, line: 438, column: 7)
!608 = distinct !DILexicalBlock(scope: !603, file: !69, line: 437, column: 3)
!609 = !DILocation(line: 438, column: 16, scope: !607)
!610 = !DILocation(line: 438, column: 7, scope: !608)
!611 = !DILocation(line: 440, column: 17, scope: !612)
!612 = distinct !DILexicalBlock(scope: !607, file: !69, line: 439, column: 4)
!613 = !DILocation(line: 440, column: 12, scope: !612)
!614 = !DILocation(line: 440, column: 5, scope: !612)
!615 = !DILocation(line: 444, column: 5, scope: !616)
!616 = distinct !DILexicalBlock(scope: !607, file: !69, line: 443, column: 4)
!617 = !DILocation(line: 449, column: 4, scope: !618)
!618 = distinct !DILexicalBlock(scope: !603, file: !69, line: 448, column: 3)
!619 = !DILocation(line: 452, column: 1, scope: !545)
!620 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 469, type: !546, scopeLine: 470, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!621 = !DILocalVariable(name: "numerator", arg: 1, scope: !620, file: !69, line: 469, type: !6)
!622 = !DILocation(line: 469, column: 30, scope: !620)
!623 = !DILocalVariable(name: "denominator", arg: 2, scope: !620, file: !69, line: 469, type: !28)
!624 = !DILocation(line: 469, column: 45, scope: !620)
!625 = !DILocalVariable(name: "u16Temp1", scope: !620, file: !69, line: 471, type: !28)
!626 = !DILocation(line: 471, column: 6, scope: !620)
!627 = !DILocalVariable(name: "s32Temp1", scope: !620, file: !69, line: 472, type: !16)
!628 = !DILocation(line: 472, column: 6, scope: !620)
!629 = !DILocation(line: 473, column: 13, scope: !620)
!630 = !DILocation(line: 473, column: 25, scope: !620)
!631 = !DILocation(line: 473, column: 11, scope: !620)
!632 = !DILocation(line: 474, column: 5, scope: !633)
!633 = distinct !DILexicalBlock(scope: !620, file: !69, line: 474, column: 5)
!634 = !DILocation(line: 474, column: 13, scope: !633)
!635 = !DILocation(line: 474, column: 5, scope: !620)
!636 = !DILocation(line: 476, column: 6, scope: !637)
!637 = distinct !DILexicalBlock(scope: !638, file: !69, line: 476, column: 6)
!638 = distinct !DILexicalBlock(scope: !633, file: !69, line: 475, column: 2)
!639 = !DILocation(line: 476, column: 15, scope: !637)
!640 = !DILocation(line: 476, column: 6, scope: !638)
!641 = !DILocation(line: 478, column: 4, scope: !642)
!642 = distinct !DILexicalBlock(scope: !637, file: !69, line: 477, column: 3)
!643 = !DILocation(line: 482, column: 4, scope: !644)
!644 = distinct !DILexicalBlock(scope: !637, file: !69, line: 481, column: 3)
!645 = !DILocation(line: 488, column: 15, scope: !646)
!646 = distinct !DILexicalBlock(scope: !633, file: !69, line: 487, column: 2)
!647 = !DILocation(line: 488, column: 27, scope: !646)
!648 = !DILocation(line: 488, column: 37, scope: !646)
!649 = !DILocation(line: 488, column: 36, scope: !646)
!650 = !DILocation(line: 488, column: 49, scope: !646)
!651 = !DILocation(line: 488, column: 47, scope: !646)
!652 = !DILocation(line: 488, column: 25, scope: !646)
!653 = !DILocation(line: 488, column: 59, scope: !646)
!654 = !DILocation(line: 488, column: 12, scope: !646)
!655 = !DILocation(line: 489, column: 15, scope: !646)
!656 = !DILocation(line: 489, column: 24, scope: !646)
!657 = !DILocation(line: 489, column: 23, scope: !646)
!658 = !DILocation(line: 489, column: 37, scope: !646)
!659 = !DILocation(line: 489, column: 47, scope: !646)
!660 = !DILocation(line: 489, column: 46, scope: !646)
!661 = !DILocation(line: 489, column: 34, scope: !646)
!662 = !DILocation(line: 489, column: 12, scope: !646)
!663 = !DILocation(line: 490, column: 10, scope: !646)
!664 = !DILocation(line: 490, column: 3, scope: !646)
!665 = !DILocation(line: 492, column: 1, scope: !620)
!666 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 510, type: !667, scopeLine: 511, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!667 = !DISubroutineType(types: !668)
!668 = !{!24, !28, !28}
!669 = !DILocalVariable(name: "numerator", arg: 1, scope: !666, file: !69, line: 510, type: !28)
!670 = !DILocation(line: 510, column: 28, scope: !666)
!671 = !DILocalVariable(name: "denominator", arg: 2, scope: !666, file: !69, line: 510, type: !28)
!672 = !DILocation(line: 510, column: 43, scope: !666)
!673 = !DILocalVariable(name: "u32Temp1", scope: !666, file: !69, line: 512, type: !674)
!674 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !20)
!675 = !DILocation(line: 512, column: 6, scope: !666)
!676 = !DILocalVariable(name: "u32Temp2", scope: !666, file: !69, line: 512, type: !674)
!677 = !DILocation(line: 512, column: 20, scope: !666)
!678 = !DILocalVariable(name: "u32Temp3", scope: !666, file: !69, line: 512, type: !674)
!679 = !DILocation(line: 512, column: 33, scope: !666)
!680 = !DILocation(line: 513, column: 5, scope: !681)
!681 = distinct !DILexicalBlock(scope: !666, file: !69, line: 513, column: 5)
!682 = !DILocation(line: 513, column: 16, scope: !681)
!683 = !DILocation(line: 513, column: 5, scope: !666)
!684 = !DILocation(line: 515, column: 3, scope: !685)
!685 = distinct !DILexicalBlock(scope: !681, file: !69, line: 514, column: 2)
!686 = !DILocation(line: 519, column: 15, scope: !687)
!687 = distinct !DILexicalBlock(scope: !681, file: !69, line: 518, column: 2)
!688 = !DILocation(line: 519, column: 24, scope: !687)
!689 = !DILocation(line: 519, column: 12, scope: !687)
!690 = !DILocation(line: 520, column: 14, scope: !687)
!691 = !DILocation(line: 520, column: 25, scope: !687)
!692 = !DILocation(line: 520, column: 23, scope: !687)
!693 = !DILocation(line: 520, column: 12, scope: !687)
!694 = !DILocation(line: 521, column: 15, scope: !687)
!695 = !DILocation(line: 521, column: 24, scope: !687)
!696 = !DILocation(line: 521, column: 32, scope: !687)
!697 = !DILocation(line: 521, column: 12, scope: !687)
!698 = !DILocation(line: 522, column: 6, scope: !699)
!699 = distinct !DILexicalBlock(scope: !687, file: !69, line: 522, column: 6)
!700 = !DILocation(line: 522, column: 15, scope: !699)
!701 = !DILocation(line: 522, column: 6, scope: !687)
!702 = !DILocation(line: 524, column: 15, scope: !703)
!703 = distinct !DILexicalBlock(scope: !699, file: !69, line: 523, column: 3)
!704 = !DILocation(line: 524, column: 11, scope: !703)
!705 = !DILocation(line: 524, column: 4, scope: !703)
!706 = !DILocation(line: 528, column: 4, scope: !707)
!707 = distinct !DILexicalBlock(scope: !699, file: !69, line: 527, column: 3)
!708 = !DILocation(line: 531, column: 1, scope: !666)
!709 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 548, type: !710, scopeLine: 549, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!710 = !DISubroutineType(types: !711)
!711 = !{!28, !16, !28}
!712 = !DILocalVariable(name: "x_value", arg: 1, scope: !709, file: !69, line: 548, type: !16)
!713 = !DILocation(line: 548, column: 25, scope: !709)
!714 = !DILocalVariable(name: "y_value", arg: 2, scope: !709, file: !69, line: 548, type: !28)
!715 = !DILocation(line: 548, column: 38, scope: !709)
!716 = !DILocalVariable(name: "s32Temp1", scope: !709, file: !69, line: 550, type: !16)
!717 = !DILocation(line: 550, column: 6, scope: !709)
!718 = !DILocation(line: 551, column: 12, scope: !709)
!719 = !DILocation(line: 551, column: 20, scope: !709)
!720 = !DILocation(line: 551, column: 10, scope: !709)
!721 = !DILocation(line: 552, column: 6, scope: !722)
!722 = distinct !DILexicalBlock(scope: !709, file: !69, line: 552, column: 5)
!723 = !DILocation(line: 552, column: 14, scope: !722)
!724 = !DILocation(line: 552, column: 24, scope: !722)
!725 = !DILocation(line: 552, column: 5, scope: !709)
!726 = !DILocation(line: 554, column: 6, scope: !727)
!727 = distinct !DILexicalBlock(scope: !728, file: !69, line: 554, column: 6)
!728 = distinct !DILexicalBlock(scope: !722, file: !69, line: 553, column: 2)
!729 = !DILocation(line: 554, column: 14, scope: !727)
!730 = !DILocation(line: 554, column: 6, scope: !728)
!731 = !DILocation(line: 556, column: 4, scope: !732)
!732 = distinct !DILexicalBlock(scope: !727, file: !69, line: 555, column: 3)
!733 = !DILocation(line: 560, column: 4, scope: !734)
!734 = distinct !DILexicalBlock(scope: !727, file: !69, line: 559, column: 3)
!735 = !DILocation(line: 565, column: 15, scope: !736)
!736 = distinct !DILexicalBlock(scope: !722, file: !69, line: 564, column: 2)
!737 = !DILocation(line: 565, column: 27, scope: !736)
!738 = !DILocation(line: 565, column: 35, scope: !736)
!739 = !DILocation(line: 565, column: 34, scope: !736)
!740 = !DILocation(line: 565, column: 46, scope: !736)
!741 = !DILocation(line: 565, column: 44, scope: !736)
!742 = !DILocation(line: 565, column: 23, scope: !736)
!743 = !DILocation(line: 565, column: 56, scope: !736)
!744 = !DILocation(line: 565, column: 12, scope: !736)
!745 = !DILocation(line: 566, column: 15, scope: !736)
!746 = !DILocation(line: 566, column: 24, scope: !736)
!747 = !DILocation(line: 566, column: 23, scope: !736)
!748 = !DILocation(line: 566, column: 36, scope: !736)
!749 = !DILocation(line: 566, column: 44, scope: !736)
!750 = !DILocation(line: 566, column: 43, scope: !736)
!751 = !DILocation(line: 566, column: 33, scope: !736)
!752 = !DILocation(line: 566, column: 12, scope: !736)
!753 = !DILocation(line: 567, column: 6, scope: !754)
!754 = distinct !DILexicalBlock(scope: !736, file: !69, line: 567, column: 6)
!755 = !DILocation(line: 567, column: 15, scope: !754)
!756 = !DILocation(line: 567, column: 6, scope: !736)
!757 = !DILocation(line: 569, column: 7, scope: !758)
!758 = distinct !DILexicalBlock(scope: !759, file: !69, line: 569, column: 7)
!759 = distinct !DILexicalBlock(scope: !754, file: !69, line: 568, column: 3)
!760 = !DILocation(line: 569, column: 16, scope: !758)
!761 = !DILocation(line: 569, column: 7, scope: !759)
!762 = !DILocation(line: 571, column: 17, scope: !763)
!763 = distinct !DILexicalBlock(scope: !758, file: !69, line: 570, column: 4)
!764 = !DILocation(line: 571, column: 12, scope: !763)
!765 = !DILocation(line: 571, column: 5, scope: !763)
!766 = !DILocation(line: 575, column: 5, scope: !767)
!767 = distinct !DILexicalBlock(scope: !758, file: !69, line: 574, column: 4)
!768 = !DILocation(line: 580, column: 4, scope: !769)
!769 = distinct !DILexicalBlock(scope: !754, file: !69, line: 579, column: 3)
!770 = !DILocation(line: 583, column: 1, scope: !709)
!771 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 601, type: !772, scopeLine: 602, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!772 = !DISubroutineType(types: !773)
!773 = !{!28, !28, !28}
!774 = !DILocalVariable(name: "numerator", arg: 1, scope: !771, file: !69, line: 601, type: !28)
!775 = !DILocation(line: 601, column: 31, scope: !771)
!776 = !DILocalVariable(name: "denominator", arg: 2, scope: !771, file: !69, line: 601, type: !28)
!777 = !DILocation(line: 601, column: 46, scope: !771)
!778 = !DILocalVariable(name: "u32Temp", scope: !771, file: !69, line: 603, type: !674)
!779 = !DILocation(line: 603, column: 6, scope: !771)
!780 = !DILocation(line: 604, column: 5, scope: !781)
!781 = distinct !DILexicalBlock(scope: !771, file: !69, line: 604, column: 5)
!782 = !DILocation(line: 604, column: 17, scope: !781)
!783 = !DILocation(line: 604, column: 5, scope: !771)
!784 = !DILocation(line: 606, column: 3, scope: !785)
!785 = distinct !DILexicalBlock(scope: !781, file: !69, line: 605, column: 2)
!786 = !DILocation(line: 610, column: 14, scope: !787)
!787 = distinct !DILexicalBlock(scope: !781, file: !69, line: 609, column: 2)
!788 = !DILocation(line: 610, column: 23, scope: !787)
!789 = !DILocation(line: 610, column: 32, scope: !787)
!790 = !DILocation(line: 610, column: 44, scope: !787)
!791 = !DILocation(line: 610, column: 29, scope: !787)
!792 = !DILocation(line: 610, column: 11, scope: !787)
!793 = !DILocation(line: 611, column: 13, scope: !787)
!794 = !DILocation(line: 611, column: 21, scope: !787)
!795 = !DILocation(line: 611, column: 20, scope: !787)
!796 = !DILocation(line: 611, column: 11, scope: !787)
!797 = !DILocation(line: 612, column: 6, scope: !798)
!798 = distinct !DILexicalBlock(scope: !787, file: !69, line: 612, column: 6)
!799 = !DILocation(line: 612, column: 14, scope: !798)
!800 = !DILocation(line: 612, column: 6, scope: !787)
!801 = !DILocation(line: 614, column: 11, scope: !802)
!802 = distinct !DILexicalBlock(scope: !798, file: !69, line: 613, column: 3)
!803 = !DILocation(line: 614, column: 19, scope: !802)
!804 = !DILocation(line: 614, column: 4, scope: !802)
!805 = !DILocation(line: 618, column: 4, scope: !806)
!806 = distinct !DILexicalBlock(scope: !798, file: !69, line: 617, column: 3)
!807 = !DILocation(line: 622, column: 1, scope: !771)
!808 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 639, type: !809, scopeLine: 640, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!809 = !DISubroutineType(types: !810)
!810 = !{!28, !674, !28}
!811 = !DILocalVariable(name: "x_value", arg: 1, scope: !808, file: !69, line: 639, type: !674)
!812 = !DILocation(line: 639, column: 25, scope: !808)
!813 = !DILocalVariable(name: "y_value", arg: 2, scope: !808, file: !69, line: 639, type: !28)
!814 = !DILocation(line: 639, column: 38, scope: !808)
!815 = !DILocalVariable(name: "u32Temp1", scope: !808, file: !69, line: 641, type: !674)
!816 = !DILocation(line: 641, column: 6, scope: !808)
!817 = !DILocalVariable(name: "u32Temp2", scope: !808, file: !69, line: 641, type: !674)
!818 = !DILocation(line: 641, column: 17, scope: !808)
!819 = !DILocation(line: 642, column: 12, scope: !808)
!820 = !DILocation(line: 642, column: 20, scope: !808)
!821 = !DILocation(line: 642, column: 10, scope: !808)
!822 = !DILocation(line: 643, column: 5, scope: !823)
!823 = distinct !DILexicalBlock(scope: !808, file: !69, line: 643, column: 5)
!824 = !DILocation(line: 643, column: 13, scope: !823)
!825 = !DILocation(line: 643, column: 5, scope: !808)
!826 = !DILocation(line: 645, column: 3, scope: !827)
!827 = distinct !DILexicalBlock(scope: !823, file: !69, line: 644, column: 2)
!828 = !DILocation(line: 649, column: 14, scope: !829)
!829 = distinct !DILexicalBlock(scope: !823, file: !69, line: 648, column: 2)
!830 = !DILocation(line: 649, column: 22, scope: !829)
!831 = !DILocation(line: 649, column: 21, scope: !829)
!832 = !DILocation(line: 649, column: 12, scope: !829)
!833 = !DILocation(line: 650, column: 14, scope: !829)
!834 = !DILocation(line: 650, column: 25, scope: !829)
!835 = !DILocation(line: 650, column: 36, scope: !829)
!836 = !DILocation(line: 650, column: 34, scope: !829)
!837 = !DILocation(line: 650, column: 22, scope: !829)
!838 = !DILocation(line: 650, column: 45, scope: !829)
!839 = !DILocation(line: 650, column: 12, scope: !829)
!840 = !DILocation(line: 651, column: 15, scope: !829)
!841 = !DILocation(line: 651, column: 24, scope: !829)
!842 = !DILocation(line: 651, column: 23, scope: !829)
!843 = !DILocation(line: 651, column: 36, scope: !829)
!844 = !DILocation(line: 651, column: 44, scope: !829)
!845 = !DILocation(line: 651, column: 43, scope: !829)
!846 = !DILocation(line: 651, column: 33, scope: !829)
!847 = !DILocation(line: 651, column: 12, scope: !829)
!848 = !DILocation(line: 652, column: 6, scope: !849)
!849 = distinct !DILexicalBlock(scope: !829, file: !69, line: 652, column: 6)
!850 = !DILocation(line: 652, column: 15, scope: !849)
!851 = !DILocation(line: 652, column: 6, scope: !829)
!852 = !DILocation(line: 654, column: 11, scope: !853)
!853 = distinct !DILexicalBlock(scope: !849, file: !69, line: 653, column: 3)
!854 = !DILocation(line: 654, column: 20, scope: !853)
!855 = !DILocation(line: 654, column: 4, scope: !853)
!856 = !DILocation(line: 658, column: 4, scope: !857)
!857 = distinct !DILexicalBlock(scope: !849, file: !69, line: 657, column: 3)
!858 = !DILocation(line: 662, column: 1, scope: !808)
!859 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 681, type: !860, scopeLine: 682, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!860 = !DISubroutineType(types: !861)
!861 = !{!6, !6, !28, !6}
!862 = !DILocalVariable(name: "factor1", arg: 1, scope: !859, file: !69, line: 681, type: !6)
!863 = !DILocation(line: 681, column: 33, scope: !859)
!864 = !DILocalVariable(name: "factor2", arg: 2, scope: !859, file: !69, line: 681, type: !28)
!865 = !DILocation(line: 681, column: 46, scope: !859)
!866 = !DILocalVariable(name: "denominator", arg: 3, scope: !859, file: !69, line: 681, type: !6)
!867 = !DILocation(line: 681, column: 59, scope: !859)
!868 = !DILocalVariable(name: "s32Result", scope: !859, file: !69, line: 683, type: !16)
!869 = !DILocation(line: 683, column: 6, scope: !859)
!870 = !DILocalVariable(name: "s32Temp1", scope: !859, file: !69, line: 683, type: !16)
!871 = !DILocation(line: 683, column: 21, scope: !859)
!872 = !DILocation(line: 684, column: 14, scope: !859)
!873 = !DILocation(line: 684, column: 24, scope: !859)
!874 = !DILocation(line: 684, column: 22, scope: !859)
!875 = !DILocation(line: 684, column: 12, scope: !859)
!876 = !DILocation(line: 685, column: 5, scope: !877)
!877 = distinct !DILexicalBlock(scope: !859, file: !69, line: 685, column: 5)
!878 = !DILocation(line: 685, column: 17, scope: !877)
!879 = !DILocation(line: 685, column: 5, scope: !859)
!880 = !DILocation(line: 687, column: 6, scope: !881)
!881 = distinct !DILexicalBlock(scope: !882, file: !69, line: 687, column: 6)
!882 = distinct !DILexicalBlock(scope: !877, file: !69, line: 686, column: 2)
!883 = !DILocation(line: 687, column: 16, scope: !881)
!884 = !DILocation(line: 687, column: 6, scope: !882)
!885 = !DILocation(line: 689, column: 4, scope: !886)
!886 = distinct !DILexicalBlock(scope: !881, file: !69, line: 688, column: 3)
!887 = !DILocation(line: 693, column: 4, scope: !888)
!888 = distinct !DILexicalBlock(scope: !881, file: !69, line: 692, column: 3)
!889 = !DILocation(line: 698, column: 14, scope: !890)
!890 = distinct !DILexicalBlock(scope: !877, file: !69, line: 697, column: 2)
!891 = !DILocation(line: 698, column: 27, scope: !890)
!892 = !DILocation(line: 698, column: 37, scope: !890)
!893 = !DILocation(line: 698, column: 36, scope: !890)
!894 = !DILocation(line: 698, column: 50, scope: !890)
!895 = !DILocation(line: 698, column: 49, scope: !890)
!896 = !DILocation(line: 698, column: 24, scope: !890)
!897 = !DILocation(line: 698, column: 12, scope: !890)
!898 = !DILocation(line: 699, column: 14, scope: !890)
!899 = !DILocation(line: 699, column: 23, scope: !890)
!900 = !DILocation(line: 699, column: 12, scope: !890)
!901 = !DILocation(line: 700, column: 16, scope: !890)
!902 = !DILocation(line: 700, column: 25, scope: !890)
!903 = !DILocation(line: 700, column: 24, scope: !890)
!904 = !DILocation(line: 700, column: 41, scope: !890)
!905 = !DILocation(line: 700, column: 51, scope: !890)
!906 = !DILocation(line: 700, column: 50, scope: !890)
!907 = !DILocation(line: 700, column: 38, scope: !890)
!908 = !DILocation(line: 700, column: 13, scope: !890)
!909 = !DILocation(line: 701, column: 6, scope: !910)
!910 = distinct !DILexicalBlock(scope: !890, file: !69, line: 701, column: 6)
!911 = !DILocation(line: 701, column: 16, scope: !910)
!912 = !DILocation(line: 701, column: 6, scope: !890)
!913 = !DILocation(line: 703, column: 7, scope: !914)
!914 = distinct !DILexicalBlock(scope: !915, file: !69, line: 703, column: 7)
!915 = distinct !DILexicalBlock(scope: !910, file: !69, line: 702, column: 3)
!916 = !DILocation(line: 703, column: 17, scope: !914)
!917 = !DILocation(line: 703, column: 7, scope: !915)
!918 = !DILocation(line: 705, column: 17, scope: !919)
!919 = distinct !DILexicalBlock(scope: !914, file: !69, line: 704, column: 4)
!920 = !DILocation(line: 705, column: 12, scope: !919)
!921 = !DILocation(line: 705, column: 5, scope: !919)
!922 = !DILocation(line: 710, column: 5, scope: !923)
!923 = distinct !DILexicalBlock(scope: !914, file: !69, line: 709, column: 4)
!924 = !DILocation(line: 715, column: 4, scope: !925)
!925 = distinct !DILexicalBlock(scope: !910, file: !69, line: 714, column: 3)
!926 = !DILocation(line: 719, column: 1, scope: !859)
!927 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 737, type: !928, scopeLine: 738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!928 = !DISubroutineType(types: !929)
!929 = !{!6, !28, !6, !28}
!930 = !DILocalVariable(name: "factor1", arg: 1, scope: !927, file: !69, line: 737, type: !28)
!931 = !DILocation(line: 737, column: 33, scope: !927)
!932 = !DILocalVariable(name: "factor2", arg: 2, scope: !927, file: !69, line: 737, type: !6)
!933 = !DILocation(line: 737, column: 46, scope: !927)
!934 = !DILocalVariable(name: "denominator", arg: 3, scope: !927, file: !69, line: 737, type: !28)
!935 = !DILocation(line: 737, column: 59, scope: !927)
!936 = !DILocalVariable(name: "s32Result", scope: !927, file: !69, line: 739, type: !16)
!937 = !DILocation(line: 739, column: 6, scope: !927)
!938 = !DILocalVariable(name: "s32Temp1", scope: !927, file: !69, line: 739, type: !16)
!939 = !DILocation(line: 739, column: 21, scope: !927)
!940 = !DILocation(line: 740, column: 14, scope: !927)
!941 = !DILocation(line: 740, column: 24, scope: !927)
!942 = !DILocation(line: 740, column: 22, scope: !927)
!943 = !DILocation(line: 740, column: 12, scope: !927)
!944 = !DILocation(line: 741, column: 5, scope: !945)
!945 = distinct !DILexicalBlock(scope: !927, file: !69, line: 741, column: 5)
!946 = !DILocation(line: 741, column: 16, scope: !945)
!947 = !DILocation(line: 741, column: 5, scope: !927)
!948 = !DILocation(line: 743, column: 6, scope: !949)
!949 = distinct !DILexicalBlock(scope: !950, file: !69, line: 743, column: 6)
!950 = distinct !DILexicalBlock(scope: !945, file: !69, line: 742, column: 2)
!951 = !DILocation(line: 743, column: 16, scope: !949)
!952 = !DILocation(line: 743, column: 6, scope: !950)
!953 = !DILocation(line: 745, column: 4, scope: !954)
!954 = distinct !DILexicalBlock(scope: !949, file: !69, line: 744, column: 3)
!955 = !DILocation(line: 749, column: 4, scope: !956)
!956 = distinct !DILexicalBlock(scope: !949, file: !69, line: 748, column: 3)
!957 = !DILocation(line: 754, column: 14, scope: !958)
!958 = distinct !DILexicalBlock(scope: !945, file: !69, line: 753, column: 2)
!959 = !DILocation(line: 754, column: 28, scope: !958)
!960 = !DILocation(line: 754, column: 38, scope: !958)
!961 = !DILocation(line: 754, column: 37, scope: !958)
!962 = !DILocation(line: 754, column: 53, scope: !958)
!963 = !DILocation(line: 754, column: 51, scope: !958)
!964 = !DILocation(line: 754, column: 24, scope: !958)
!965 = !DILocation(line: 754, column: 66, scope: !958)
!966 = !DILocation(line: 754, column: 12, scope: !958)
!967 = !DILocation(line: 755, column: 16, scope: !958)
!968 = !DILocation(line: 755, column: 25, scope: !958)
!969 = !DILocation(line: 755, column: 24, scope: !958)
!970 = !DILocation(line: 755, column: 41, scope: !958)
!971 = !DILocation(line: 755, column: 51, scope: !958)
!972 = !DILocation(line: 755, column: 50, scope: !958)
!973 = !DILocation(line: 755, column: 38, scope: !958)
!974 = !DILocation(line: 755, column: 13, scope: !958)
!975 = !DILocation(line: 756, column: 6, scope: !976)
!976 = distinct !DILexicalBlock(scope: !958, file: !69, line: 756, column: 6)
!977 = !DILocation(line: 756, column: 16, scope: !976)
!978 = !DILocation(line: 756, column: 6, scope: !958)
!979 = !DILocation(line: 758, column: 7, scope: !980)
!980 = distinct !DILexicalBlock(scope: !981, file: !69, line: 758, column: 7)
!981 = distinct !DILexicalBlock(scope: !976, file: !69, line: 757, column: 3)
!982 = !DILocation(line: 758, column: 17, scope: !980)
!983 = !DILocation(line: 758, column: 7, scope: !981)
!984 = !DILocation(line: 760, column: 17, scope: !985)
!985 = distinct !DILexicalBlock(scope: !980, file: !69, line: 759, column: 4)
!986 = !DILocation(line: 760, column: 12, scope: !985)
!987 = !DILocation(line: 760, column: 5, scope: !985)
!988 = !DILocation(line: 764, column: 5, scope: !989)
!989 = distinct !DILexicalBlock(scope: !980, file: !69, line: 763, column: 4)
!990 = !DILocation(line: 769, column: 4, scope: !991)
!991 = distinct !DILexicalBlock(scope: !976, file: !69, line: 768, column: 3)
!992 = !DILocation(line: 772, column: 1, scope: !927)
!993 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 791, type: !994, scopeLine: 792, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!994 = !DISubroutineType(types: !995)
!995 = !{!28, !6, !28, !6}
!996 = !DILocalVariable(name: "factor1", arg: 1, scope: !993, file: !69, line: 791, type: !6)
!997 = !DILocation(line: 791, column: 33, scope: !993)
!998 = !DILocalVariable(name: "factor2", arg: 2, scope: !993, file: !69, line: 791, type: !28)
!999 = !DILocation(line: 791, column: 46, scope: !993)
!1000 = !DILocalVariable(name: "denominator", arg: 3, scope: !993, file: !69, line: 791, type: !6)
!1001 = !DILocation(line: 791, column: 59, scope: !993)
!1002 = !DILocalVariable(name: "u32Result", scope: !993, file: !69, line: 793, type: !674)
!1003 = !DILocation(line: 793, column: 6, scope: !993)
!1004 = !DILocalVariable(name: "u32Temp1", scope: !993, file: !69, line: 793, type: !674)
!1005 = !DILocation(line: 793, column: 21, scope: !993)
!1006 = !DILocalVariable(name: "s32Result", scope: !993, file: !69, line: 794, type: !16)
!1007 = !DILocation(line: 794, column: 6, scope: !993)
!1008 = !DILocalVariable(name: "s32Temp1", scope: !993, file: !69, line: 794, type: !16)
!1009 = !DILocation(line: 794, column: 21, scope: !993)
!1010 = !DILocation(line: 795, column: 14, scope: !993)
!1011 = !DILocation(line: 795, column: 24, scope: !993)
!1012 = !DILocation(line: 795, column: 22, scope: !993)
!1013 = !DILocation(line: 795, column: 12, scope: !993)
!1014 = !DILocation(line: 797, column: 5, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !993, file: !69, line: 797, column: 5)
!1016 = !DILocation(line: 797, column: 17, scope: !1015)
!1017 = !DILocation(line: 797, column: 5, scope: !993)
!1018 = !DILocation(line: 799, column: 6, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1020, file: !69, line: 799, column: 6)
!1020 = distinct !DILexicalBlock(scope: !1015, file: !69, line: 798, column: 2)
!1021 = !DILocation(line: 799, column: 16, scope: !1019)
!1022 = !DILocation(line: 799, column: 6, scope: !1020)
!1023 = !DILocation(line: 801, column: 4, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1019, file: !69, line: 800, column: 3)
!1025 = !DILocation(line: 805, column: 4, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1019, file: !69, line: 804, column: 3)
!1027 = !DILocation(line: 810, column: 15, scope: !1028)
!1028 = distinct !DILexicalBlock(scope: !1015, file: !69, line: 809, column: 2)
!1029 = !DILocation(line: 810, column: 29, scope: !1028)
!1030 = !DILocation(line: 810, column: 39, scope: !1028)
!1031 = !DILocation(line: 810, column: 38, scope: !1028)
!1032 = !DILocation(line: 810, column: 54, scope: !1028)
!1033 = !DILocation(line: 810, column: 52, scope: !1028)
!1034 = !DILocation(line: 810, column: 25, scope: !1028)
!1035 = !DILocation(line: 810, column: 68, scope: !1028)
!1036 = !DILocation(line: 810, column: 12, scope: !1028)
!1037 = !DILocation(line: 811, column: 16, scope: !1028)
!1038 = !DILocation(line: 811, column: 25, scope: !1028)
!1039 = !DILocation(line: 811, column: 24, scope: !1028)
!1040 = !DILocation(line: 811, column: 41, scope: !1028)
!1041 = !DILocation(line: 811, column: 51, scope: !1028)
!1042 = !DILocation(line: 811, column: 50, scope: !1028)
!1043 = !DILocation(line: 811, column: 38, scope: !1028)
!1044 = !DILocation(line: 811, column: 13, scope: !1028)
!1045 = !DILocation(line: 812, column: 6, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1028, file: !69, line: 812, column: 6)
!1047 = !DILocation(line: 812, column: 16, scope: !1046)
!1048 = !DILocation(line: 812, column: 6, scope: !1028)
!1049 = !DILocation(line: 814, column: 7, scope: !1050)
!1050 = distinct !DILexicalBlock(scope: !1051, file: !69, line: 814, column: 7)
!1051 = distinct !DILexicalBlock(scope: !1046, file: !69, line: 813, column: 3)
!1052 = !DILocation(line: 814, column: 17, scope: !1050)
!1053 = !DILocation(line: 814, column: 7, scope: !1051)
!1054 = !DILocation(line: 816, column: 17, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1050, file: !69, line: 815, column: 4)
!1056 = !DILocation(line: 816, column: 12, scope: !1055)
!1057 = !DILocation(line: 816, column: 5, scope: !1055)
!1058 = !DILocation(line: 820, column: 5, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1050, file: !69, line: 819, column: 4)
!1060 = !DILocation(line: 825, column: 4, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1046, file: !69, line: 824, column: 3)
!1062 = !DILocation(line: 828, column: 1, scope: !993)
!1063 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 847, type: !1064, scopeLine: 848, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1064 = !DISubroutineType(types: !1065)
!1065 = !{!28, !6, !28, !28}
!1066 = !DILocalVariable(name: "factor1", arg: 1, scope: !1063, file: !69, line: 847, type: !6)
!1067 = !DILocation(line: 847, column: 33, scope: !1063)
!1068 = !DILocalVariable(name: "factor2", arg: 2, scope: !1063, file: !69, line: 847, type: !28)
!1069 = !DILocation(line: 847, column: 46, scope: !1063)
!1070 = !DILocalVariable(name: "denominator", arg: 3, scope: !1063, file: !69, line: 847, type: !28)
!1071 = !DILocation(line: 847, column: 59, scope: !1063)
!1072 = !DILocalVariable(name: "s32Result", scope: !1063, file: !69, line: 849, type: !16)
!1073 = !DILocation(line: 849, column: 6, scope: !1063)
!1074 = !DILocalVariable(name: "s32Temp1", scope: !1063, file: !69, line: 849, type: !16)
!1075 = !DILocation(line: 849, column: 21, scope: !1063)
!1076 = !DILocation(line: 850, column: 14, scope: !1063)
!1077 = !DILocation(line: 850, column: 24, scope: !1063)
!1078 = !DILocation(line: 850, column: 22, scope: !1063)
!1079 = !DILocation(line: 850, column: 12, scope: !1063)
!1080 = !DILocation(line: 852, column: 5, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1063, file: !69, line: 852, column: 5)
!1082 = !DILocation(line: 852, column: 17, scope: !1081)
!1083 = !DILocation(line: 852, column: 5, scope: !1063)
!1084 = !DILocation(line: 854, column: 6, scope: !1085)
!1085 = distinct !DILexicalBlock(scope: !1086, file: !69, line: 854, column: 6)
!1086 = distinct !DILexicalBlock(scope: !1081, file: !69, line: 853, column: 2)
!1087 = !DILocation(line: 854, column: 16, scope: !1085)
!1088 = !DILocation(line: 854, column: 6, scope: !1086)
!1089 = !DILocation(line: 856, column: 4, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1085, file: !69, line: 855, column: 3)
!1091 = !DILocation(line: 860, column: 4, scope: !1092)
!1092 = distinct !DILexicalBlock(scope: !1085, file: !69, line: 859, column: 3)
!1093 = !DILocation(line: 865, column: 15, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1081, file: !69, line: 864, column: 2)
!1095 = !DILocation(line: 865, column: 29, scope: !1094)
!1096 = !DILocation(line: 865, column: 39, scope: !1094)
!1097 = !DILocation(line: 865, column: 38, scope: !1094)
!1098 = !DILocation(line: 865, column: 54, scope: !1094)
!1099 = !DILocation(line: 865, column: 52, scope: !1094)
!1100 = !DILocation(line: 865, column: 25, scope: !1094)
!1101 = !DILocation(line: 865, column: 68, scope: !1094)
!1102 = !DILocation(line: 865, column: 12, scope: !1094)
!1103 = !DILocation(line: 866, column: 16, scope: !1094)
!1104 = !DILocation(line: 866, column: 25, scope: !1094)
!1105 = !DILocation(line: 866, column: 24, scope: !1094)
!1106 = !DILocation(line: 866, column: 41, scope: !1094)
!1107 = !DILocation(line: 866, column: 51, scope: !1094)
!1108 = !DILocation(line: 866, column: 50, scope: !1094)
!1109 = !DILocation(line: 866, column: 38, scope: !1094)
!1110 = !DILocation(line: 866, column: 13, scope: !1094)
!1111 = !DILocation(line: 867, column: 6, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1094, file: !69, line: 867, column: 6)
!1113 = !DILocation(line: 867, column: 16, scope: !1112)
!1114 = !DILocation(line: 867, column: 6, scope: !1094)
!1115 = !DILocation(line: 869, column: 7, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1117, file: !69, line: 869, column: 7)
!1117 = distinct !DILexicalBlock(scope: !1112, file: !69, line: 868, column: 3)
!1118 = !DILocation(line: 869, column: 17, scope: !1116)
!1119 = !DILocation(line: 869, column: 7, scope: !1117)
!1120 = !DILocation(line: 871, column: 17, scope: !1121)
!1121 = distinct !DILexicalBlock(scope: !1116, file: !69, line: 870, column: 4)
!1122 = !DILocation(line: 871, column: 12, scope: !1121)
!1123 = !DILocation(line: 871, column: 5, scope: !1121)
!1124 = !DILocation(line: 875, column: 5, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1116, file: !69, line: 874, column: 4)
!1126 = !DILocation(line: 880, column: 4, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1112, file: !69, line: 879, column: 3)
!1128 = !DILocation(line: 884, column: 1, scope: !1063)
!1129 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 902, type: !1130, scopeLine: 903, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1130 = !DISubroutineType(types: !1131)
!1131 = !{!28, !28, !28, !28}
!1132 = !DILocalVariable(name: "factor1", arg: 1, scope: !1129, file: !69, line: 902, type: !28)
!1133 = !DILocation(line: 902, column: 33, scope: !1129)
!1134 = !DILocalVariable(name: "factor2", arg: 2, scope: !1129, file: !69, line: 902, type: !28)
!1135 = !DILocation(line: 902, column: 46, scope: !1129)
!1136 = !DILocalVariable(name: "denominator", arg: 3, scope: !1129, file: !69, line: 902, type: !28)
!1137 = !DILocation(line: 902, column: 59, scope: !1129)
!1138 = !DILocalVariable(name: "u32Temp1", scope: !1129, file: !69, line: 904, type: !674)
!1139 = !DILocation(line: 904, column: 6, scope: !1129)
!1140 = !DILocalVariable(name: "u16TempDenom", scope: !1129, file: !69, line: 905, type: !28)
!1141 = !DILocation(line: 905, column: 6, scope: !1129)
!1142 = !DILocation(line: 907, column: 5, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1129, file: !69, line: 907, column: 5)
!1144 = !DILocation(line: 907, column: 17, scope: !1143)
!1145 = !DILocation(line: 907, column: 5, scope: !1129)
!1146 = !DILocation(line: 909, column: 3, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !1143, file: !69, line: 908, column: 2)
!1148 = !DILocation(line: 913, column: 14, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1143, file: !69, line: 912, column: 2)
!1150 = !DILocation(line: 913, column: 24, scope: !1149)
!1151 = !DILocation(line: 913, column: 22, scope: !1149)
!1152 = !DILocation(line: 913, column: 12, scope: !1149)
!1153 = !DILocation(line: 914, column: 18, scope: !1149)
!1154 = !DILocation(line: 914, column: 30, scope: !1149)
!1155 = !DILocation(line: 914, column: 16, scope: !1149)
!1156 = !DILocation(line: 915, column: 14, scope: !1149)
!1157 = !DILocation(line: 915, column: 25, scope: !1149)
!1158 = !DILocation(line: 915, column: 23, scope: !1149)
!1159 = !DILocation(line: 915, column: 12, scope: !1149)
!1160 = !DILocation(line: 916, column: 14, scope: !1149)
!1161 = !DILocation(line: 916, column: 25, scope: !1149)
!1162 = !DILocation(line: 916, column: 23, scope: !1149)
!1163 = !DILocation(line: 916, column: 12, scope: !1149)
!1164 = !DILocation(line: 917, column: 6, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1149, file: !69, line: 917, column: 6)
!1166 = !DILocation(line: 917, column: 15, scope: !1165)
!1167 = !DILocation(line: 917, column: 6, scope: !1149)
!1168 = !DILocation(line: 919, column: 12, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1165, file: !69, line: 918, column: 3)
!1170 = !DILocation(line: 919, column: 21, scope: !1169)
!1171 = !DILocation(line: 919, column: 11, scope: !1169)
!1172 = !DILocation(line: 919, column: 4, scope: !1169)
!1173 = !DILocation(line: 924, column: 4, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1165, file: !69, line: 923, column: 3)
!1175 = !DILocation(line: 929, column: 1, scope: !1129)
!1176 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 946, type: !1177, scopeLine: 947, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1177 = !DISubroutineType(types: !1178)
!1178 = !{!28, !28, !28, !674}
!1179 = !DILocalVariable(name: "factor1", arg: 1, scope: !1176, file: !69, line: 946, type: !28)
!1180 = !DILocation(line: 946, column: 33, scope: !1176)
!1181 = !DILocalVariable(name: "factor2", arg: 2, scope: !1176, file: !69, line: 946, type: !28)
!1182 = !DILocation(line: 946, column: 46, scope: !1176)
!1183 = !DILocalVariable(name: "denominator", arg: 3, scope: !1176, file: !69, line: 946, type: !674)
!1184 = !DILocation(line: 946, column: 59, scope: !1176)
!1185 = !DILocalVariable(name: "u32Temp1", scope: !1176, file: !69, line: 948, type: !674)
!1186 = !DILocation(line: 948, column: 6, scope: !1176)
!1187 = !DILocation(line: 949, column: 5, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1176, file: !69, line: 949, column: 5)
!1189 = !DILocation(line: 949, column: 17, scope: !1188)
!1190 = !DILocation(line: 949, column: 5, scope: !1176)
!1191 = !DILocation(line: 951, column: 3, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1188, file: !69, line: 950, column: 2)
!1193 = !DILocation(line: 955, column: 15, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1188, file: !69, line: 954, column: 2)
!1195 = !DILocation(line: 955, column: 25, scope: !1194)
!1196 = !DILocation(line: 955, column: 23, scope: !1194)
!1197 = !DILocation(line: 955, column: 36, scope: !1194)
!1198 = !DILocation(line: 955, column: 34, scope: !1194)
!1199 = !DILocation(line: 955, column: 12, scope: !1194)
!1200 = !DILocation(line: 956, column: 8, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1194, file: !69, line: 956, column: 6)
!1202 = !DILocation(line: 956, column: 18, scope: !1201)
!1203 = !DILocation(line: 956, column: 16, scope: !1201)
!1204 = !DILocation(line: 956, column: 28, scope: !1201)
!1205 = !DILocation(line: 956, column: 40, scope: !1201)
!1206 = !DILocation(line: 956, column: 39, scope: !1201)
!1207 = !DILocation(line: 956, column: 26, scope: !1201)
!1208 = !DILocation(line: 956, column: 53, scope: !1201)
!1209 = !DILocation(line: 956, column: 64, scope: !1201)
!1210 = !DILocation(line: 956, column: 50, scope: !1201)
!1211 = !DILocation(line: 956, column: 6, scope: !1194)
!1212 = !DILocation(line: 958, column: 12, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1201, file: !69, line: 957, column: 3)
!1214 = !DILocation(line: 959, column: 3, scope: !1213)
!1215 = !DILocation(line: 960, column: 6, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1194, file: !69, line: 960, column: 6)
!1217 = !DILocation(line: 960, column: 15, scope: !1216)
!1218 = !DILocation(line: 960, column: 6, scope: !1194)
!1219 = !DILocation(line: 962, column: 12, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1216, file: !69, line: 961, column: 3)
!1221 = !DILocation(line: 962, column: 21, scope: !1220)
!1222 = !DILocation(line: 962, column: 11, scope: !1220)
!1223 = !DILocation(line: 962, column: 4, scope: !1220)
!1224 = !DILocation(line: 966, column: 4, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1216, file: !69, line: 965, column: 3)
!1226 = !DILocation(line: 969, column: 1, scope: !1176)
!1227 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 986, type: !1228, scopeLine: 987, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1228 = !DISubroutineType(types: !1229)
!1229 = !{!674, !674, !28}
!1230 = !DILocalVariable(name: "x_value", arg: 1, scope: !1227, file: !69, line: 986, type: !674)
!1231 = !DILocation(line: 986, column: 25, scope: !1227)
!1232 = !DILocalVariable(name: "y_value", arg: 2, scope: !1227, file: !69, line: 986, type: !28)
!1233 = !DILocation(line: 986, column: 38, scope: !1227)
!1234 = !DILocalVariable(name: "u32Temp1", scope: !1227, file: !69, line: 988, type: !674)
!1235 = !DILocation(line: 988, column: 6, scope: !1227)
!1236 = !DILocation(line: 989, column: 5, scope: !1237)
!1237 = distinct !DILexicalBlock(scope: !1227, file: !69, line: 989, column: 5)
!1238 = !DILocation(line: 989, column: 13, scope: !1237)
!1239 = !DILocation(line: 989, column: 5, scope: !1227)
!1240 = !DILocation(line: 991, column: 3, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1237, file: !69, line: 990, column: 2)
!1242 = !DILocation(line: 995, column: 15, scope: !1243)
!1243 = distinct !DILexicalBlock(scope: !1237, file: !69, line: 994, column: 2)
!1244 = !DILocation(line: 995, column: 26, scope: !1243)
!1245 = !DILocation(line: 995, column: 34, scope: !1243)
!1246 = !DILocation(line: 995, column: 33, scope: !1243)
!1247 = !DILocation(line: 995, column: 45, scope: !1243)
!1248 = !DILocation(line: 995, column: 43, scope: !1243)
!1249 = !DILocation(line: 995, column: 23, scope: !1243)
!1250 = !DILocation(line: 995, column: 54, scope: !1243)
!1251 = !DILocation(line: 995, column: 12, scope: !1243)
!1252 = !DILocation(line: 996, column: 15, scope: !1243)
!1253 = !DILocation(line: 996, column: 23, scope: !1243)
!1254 = !DILocation(line: 996, column: 22, scope: !1243)
!1255 = !DILocation(line: 996, column: 35, scope: !1243)
!1256 = !DILocation(line: 996, column: 44, scope: !1243)
!1257 = !DILocation(line: 996, column: 43, scope: !1243)
!1258 = !DILocation(line: 996, column: 32, scope: !1243)
!1259 = !DILocation(line: 996, column: 12, scope: !1243)
!1260 = !DILocation(line: 997, column: 10, scope: !1243)
!1261 = !DILocation(line: 997, column: 3, scope: !1243)
!1262 = !DILocation(line: 999, column: 1, scope: !1227)
!1263 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 1017, type: !1264, scopeLine: 1018, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1264 = !DISubroutineType(types: !1265)
!1265 = !{!6, !6, !6, !6}
!1266 = !DILocalVariable(name: "fak1", arg: 1, scope: !1263, file: !69, line: 1017, type: !6)
!1267 = !DILocation(line: 1017, column: 33, scope: !1263)
!1268 = !DILocalVariable(name: "fak2", arg: 2, scope: !1263, file: !69, line: 1017, type: !6)
!1269 = !DILocation(line: 1017, column: 43, scope: !1263)
!1270 = !DILocalVariable(name: "div", arg: 3, scope: !1263, file: !69, line: 1017, type: !6)
!1271 = !DILocation(line: 1017, column: 53, scope: !1263)
!1272 = !DILocalVariable(name: "s32Temp1", scope: !1263, file: !69, line: 1019, type: !16)
!1273 = !DILocation(line: 1019, column: 6, scope: !1263)
!1274 = !DILocalVariable(name: "s32Temp2", scope: !1263, file: !69, line: 1019, type: !16)
!1275 = !DILocation(line: 1019, column: 20, scope: !1263)
!1276 = !DILocalVariable(name: "s32Temp3", scope: !1263, file: !69, line: 1019, type: !16)
!1277 = !DILocation(line: 1019, column: 34, scope: !1263)
!1278 = !DILocation(line: 1020, column: 13, scope: !1263)
!1279 = !DILocation(line: 1020, column: 20, scope: !1263)
!1280 = !DILocation(line: 1020, column: 18, scope: !1263)
!1281 = !DILocation(line: 1020, column: 11, scope: !1263)
!1282 = !DILocation(line: 1021, column: 5, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1263, file: !69, line: 1021, column: 5)
!1284 = !DILocation(line: 1021, column: 9, scope: !1283)
!1285 = !DILocation(line: 1021, column: 5, scope: !1263)
!1286 = !DILocation(line: 1023, column: 6, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1288, file: !69, line: 1023, column: 6)
!1288 = distinct !DILexicalBlock(scope: !1283, file: !69, line: 1022, column: 2)
!1289 = !DILocation(line: 1023, column: 15, scope: !1287)
!1290 = !DILocation(line: 1023, column: 6, scope: !1288)
!1291 = !DILocation(line: 1025, column: 4, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1287, file: !69, line: 1024, column: 3)
!1293 = !DILocation(line: 1029, column: 4, scope: !1294)
!1294 = distinct !DILexicalBlock(scope: !1287, file: !69, line: 1028, column: 3)
!1295 = !DILocation(line: 1034, column: 15, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1283, file: !69, line: 1033, column: 2)
!1297 = !DILocation(line: 1034, column: 28, scope: !1296)
!1298 = !DILocation(line: 1034, column: 39, scope: !1296)
!1299 = !DILocation(line: 1034, column: 37, scope: !1296)
!1300 = !DILocation(line: 1034, column: 46, scope: !1296)
!1301 = !DILocation(line: 1034, column: 44, scope: !1296)
!1302 = !DILocation(line: 1034, column: 24, scope: !1296)
!1303 = !DILocation(line: 1034, column: 52, scope: !1296)
!1304 = !DILocation(line: 1034, column: 12, scope: !1296)
!1305 = !DILocation(line: 1035, column: 15, scope: !1296)
!1306 = !DILocation(line: 1035, column: 24, scope: !1296)
!1307 = !DILocation(line: 1035, column: 23, scope: !1296)
!1308 = !DILocation(line: 1035, column: 32, scope: !1296)
!1309 = !DILocation(line: 1035, column: 41, scope: !1296)
!1310 = !DILocation(line: 1035, column: 40, scope: !1296)
!1311 = !DILocation(line: 1035, column: 29, scope: !1296)
!1312 = !DILocation(line: 1035, column: 12, scope: !1296)
!1313 = !DILocation(line: 1036, column: 6, scope: !1314)
!1314 = distinct !DILexicalBlock(scope: !1296, file: !69, line: 1036, column: 6)
!1315 = !DILocation(line: 1036, column: 15, scope: !1314)
!1316 = !DILocation(line: 1036, column: 6, scope: !1296)
!1317 = !DILocation(line: 1038, column: 7, scope: !1318)
!1318 = distinct !DILexicalBlock(scope: !1319, file: !69, line: 1038, column: 7)
!1319 = distinct !DILexicalBlock(scope: !1314, file: !69, line: 1037, column: 3)
!1320 = !DILocation(line: 1038, column: 16, scope: !1318)
!1321 = !DILocation(line: 1038, column: 7, scope: !1319)
!1322 = !DILocation(line: 1040, column: 17, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1318, file: !69, line: 1039, column: 4)
!1324 = !DILocation(line: 1040, column: 12, scope: !1323)
!1325 = !DILocation(line: 1040, column: 5, scope: !1323)
!1326 = !DILocation(line: 1044, column: 5, scope: !1327)
!1327 = distinct !DILexicalBlock(scope: !1318, file: !69, line: 1043, column: 4)
!1328 = !DILocation(line: 1049, column: 4, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1314, file: !69, line: 1048, column: 3)
!1330 = !DILocation(line: 1052, column: 1, scope: !1263)
!1331 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1070, type: !1332, scopeLine: 1071, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1332 = !DISubroutineType(types: !1333)
!1333 = !{!6, !6, !6, !28}
!1334 = !DILocalVariable(name: "data1", arg: 1, scope: !1331, file: !69, line: 1070, type: !6)
!1335 = !DILocation(line: 1070, column: 33, scope: !1331)
!1336 = !DILocalVariable(name: "data2", arg: 2, scope: !1331, file: !69, line: 1070, type: !6)
!1337 = !DILocation(line: 1070, column: 43, scope: !1331)
!1338 = !DILocalVariable(name: "denominator", arg: 3, scope: !1331, file: !69, line: 1070, type: !28)
!1339 = !DILocation(line: 1070, column: 53, scope: !1331)
!1340 = !DILocalVariable(name: "s32Result", scope: !1331, file: !69, line: 1072, type: !16)
!1341 = !DILocation(line: 1072, column: 6, scope: !1331)
!1342 = !DILocalVariable(name: "s32Temp1", scope: !1331, file: !69, line: 1072, type: !16)
!1343 = !DILocation(line: 1072, column: 21, scope: !1331)
!1344 = !DILocation(line: 1073, column: 14, scope: !1331)
!1345 = !DILocation(line: 1073, column: 22, scope: !1331)
!1346 = !DILocation(line: 1073, column: 20, scope: !1331)
!1347 = !DILocation(line: 1073, column: 12, scope: !1331)
!1348 = !DILocation(line: 1075, column: 5, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1331, file: !69, line: 1075, column: 5)
!1350 = !DILocation(line: 1075, column: 17, scope: !1349)
!1351 = !DILocation(line: 1075, column: 5, scope: !1331)
!1352 = !DILocation(line: 1077, column: 6, scope: !1353)
!1353 = distinct !DILexicalBlock(scope: !1354, file: !69, line: 1077, column: 6)
!1354 = distinct !DILexicalBlock(scope: !1349, file: !69, line: 1076, column: 2)
!1355 = !DILocation(line: 1077, column: 16, scope: !1353)
!1356 = !DILocation(line: 1077, column: 6, scope: !1354)
!1357 = !DILocation(line: 1079, column: 4, scope: !1358)
!1358 = distinct !DILexicalBlock(scope: !1353, file: !69, line: 1078, column: 3)
!1359 = !DILocation(line: 1081, column: 11, scope: !1360)
!1360 = distinct !DILexicalBlock(scope: !1353, file: !69, line: 1081, column: 11)
!1361 = !DILocation(line: 1081, column: 21, scope: !1360)
!1362 = !DILocation(line: 1081, column: 11, scope: !1353)
!1363 = !DILocation(line: 1083, column: 4, scope: !1364)
!1364 = distinct !DILexicalBlock(scope: !1360, file: !69, line: 1082, column: 3)
!1365 = !DILocation(line: 1087, column: 4, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !1360, file: !69, line: 1086, column: 3)
!1367 = !DILocation(line: 1092, column: 15, scope: !1368)
!1368 = distinct !DILexicalBlock(scope: !1349, file: !69, line: 1091, column: 2)
!1369 = !DILocation(line: 1092, column: 28, scope: !1368)
!1370 = !DILocation(line: 1092, column: 38, scope: !1368)
!1371 = !DILocation(line: 1092, column: 37, scope: !1368)
!1372 = !DILocation(line: 1092, column: 51, scope: !1368)
!1373 = !DILocation(line: 1092, column: 50, scope: !1368)
!1374 = !DILocation(line: 1092, column: 25, scope: !1368)
!1375 = !DILocation(line: 1092, column: 64, scope: !1368)
!1376 = !DILocation(line: 1092, column: 12, scope: !1368)
!1377 = !DILocation(line: 1093, column: 16, scope: !1368)
!1378 = !DILocation(line: 1093, column: 25, scope: !1368)
!1379 = !DILocation(line: 1093, column: 24, scope: !1368)
!1380 = !DILocation(line: 1093, column: 41, scope: !1368)
!1381 = !DILocation(line: 1093, column: 51, scope: !1368)
!1382 = !DILocation(line: 1093, column: 50, scope: !1368)
!1383 = !DILocation(line: 1093, column: 38, scope: !1368)
!1384 = !DILocation(line: 1093, column: 13, scope: !1368)
!1385 = !DILocation(line: 1094, column: 6, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1368, file: !69, line: 1094, column: 6)
!1387 = !DILocation(line: 1094, column: 16, scope: !1386)
!1388 = !DILocation(line: 1094, column: 6, scope: !1368)
!1389 = !DILocation(line: 1096, column: 7, scope: !1390)
!1390 = distinct !DILexicalBlock(scope: !1391, file: !69, line: 1096, column: 7)
!1391 = distinct !DILexicalBlock(scope: !1386, file: !69, line: 1095, column: 3)
!1392 = !DILocation(line: 1096, column: 17, scope: !1390)
!1393 = !DILocation(line: 1096, column: 7, scope: !1391)
!1394 = !DILocation(line: 1098, column: 17, scope: !1395)
!1395 = distinct !DILexicalBlock(scope: !1390, file: !69, line: 1097, column: 4)
!1396 = !DILocation(line: 1098, column: 12, scope: !1395)
!1397 = !DILocation(line: 1098, column: 5, scope: !1395)
!1398 = !DILocation(line: 1102, column: 5, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1390, file: !69, line: 1101, column: 4)
!1400 = !DILocation(line: 1107, column: 4, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1386, file: !69, line: 1106, column: 3)
!1402 = !DILocation(line: 1111, column: 1, scope: !1331)
!1403 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1128, type: !1404, scopeLine: 1129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1404 = !DISubroutineType(types: !1405)
!1405 = !{!674, !674, !16}
!1406 = !DILocalVariable(name: "numerator", arg: 1, scope: !1403, file: !69, line: 1128, type: !674)
!1407 = !DILocation(line: 1128, column: 25, scope: !1403)
!1408 = !DILocalVariable(name: "denominator", arg: 2, scope: !1403, file: !69, line: 1128, type: !16)
!1409 = !DILocation(line: 1128, column: 40, scope: !1403)
!1410 = !DILocalVariable(name: "u32Temp1", scope: !1403, file: !69, line: 1130, type: !674)
!1411 = !DILocation(line: 1130, column: 6, scope: !1403)
!1412 = !DILocation(line: 1131, column: 5, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !1403, file: !69, line: 1131, column: 5)
!1414 = !DILocation(line: 1131, column: 17, scope: !1413)
!1415 = !DILocation(line: 1131, column: 5, scope: !1403)
!1416 = !DILocation(line: 1133, column: 3, scope: !1417)
!1417 = distinct !DILexicalBlock(scope: !1413, file: !69, line: 1132, column: 2)
!1418 = !DILocation(line: 1137, column: 6, scope: !1419)
!1419 = distinct !DILexicalBlock(scope: !1420, file: !69, line: 1137, column: 6)
!1420 = distinct !DILexicalBlock(scope: !1413, file: !69, line: 1136, column: 2)
!1421 = !DILocation(line: 1137, column: 18, scope: !1419)
!1422 = !DILocation(line: 1137, column: 6, scope: !1420)
!1423 = !DILocation(line: 1139, column: 4, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !1419, file: !69, line: 1138, column: 3)
!1425 = !DILocation(line: 1143, column: 16, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1419, file: !69, line: 1142, column: 3)
!1427 = !DILocation(line: 1143, column: 30, scope: !1426)
!1428 = !DILocation(line: 1143, column: 40, scope: !1426)
!1429 = !DILocation(line: 1143, column: 39, scope: !1426)
!1430 = !DILocation(line: 1143, column: 55, scope: !1426)
!1431 = !DILocation(line: 1143, column: 53, scope: !1426)
!1432 = !DILocation(line: 1143, column: 26, scope: !1426)
!1433 = !DILocation(line: 1143, column: 68, scope: !1426)
!1434 = !DILocation(line: 1143, column: 13, scope: !1426)
!1435 = !DILocation(line: 1144, column: 16, scope: !1426)
!1436 = !DILocation(line: 1144, column: 25, scope: !1426)
!1437 = !DILocation(line: 1144, column: 24, scope: !1426)
!1438 = !DILocation(line: 1144, column: 41, scope: !1426)
!1439 = !DILocation(line: 1144, column: 51, scope: !1426)
!1440 = !DILocation(line: 1144, column: 50, scope: !1426)
!1441 = !DILocation(line: 1144, column: 38, scope: !1426)
!1442 = !DILocation(line: 1144, column: 13, scope: !1426)
!1443 = !DILocation(line: 1145, column: 11, scope: !1426)
!1444 = !DILocation(line: 1145, column: 4, scope: !1426)
!1445 = !DILocation(line: 1148, column: 1, scope: !1403)
!1446 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1165, type: !1447, scopeLine: 1166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1447 = !DISubroutineType(types: !1448)
!1448 = !{!674, !16, !674}
!1449 = !DILocalVariable(name: "numerator", arg: 1, scope: !1446, file: !69, line: 1165, type: !16)
!1450 = !DILocation(line: 1165, column: 25, scope: !1446)
!1451 = !DILocalVariable(name: "denominator", arg: 2, scope: !1446, file: !69, line: 1165, type: !674)
!1452 = !DILocation(line: 1165, column: 40, scope: !1446)
!1453 = !DILocalVariable(name: "s32Temp1", scope: !1446, file: !69, line: 1167, type: !16)
!1454 = !DILocation(line: 1167, column: 6, scope: !1446)
!1455 = !DILocation(line: 1168, column: 5, scope: !1456)
!1456 = distinct !DILexicalBlock(scope: !1446, file: !69, line: 1168, column: 5)
!1457 = !DILocation(line: 1168, column: 17, scope: !1456)
!1458 = !DILocation(line: 1168, column: 5, scope: !1446)
!1459 = !DILocation(line: 1170, column: 6, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1461, file: !69, line: 1170, column: 6)
!1461 = distinct !DILexicalBlock(scope: !1456, file: !69, line: 1169, column: 2)
!1462 = !DILocation(line: 1170, column: 16, scope: !1460)
!1463 = !DILocation(line: 1170, column: 6, scope: !1461)
!1464 = !DILocation(line: 1172, column: 4, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1460, file: !69, line: 1171, column: 3)
!1466 = !DILocation(line: 1176, column: 4, scope: !1467)
!1467 = distinct !DILexicalBlock(scope: !1460, file: !69, line: 1175, column: 3)
!1468 = !DILocation(line: 1181, column: 6, scope: !1469)
!1469 = distinct !DILexicalBlock(scope: !1470, file: !69, line: 1181, column: 6)
!1470 = distinct !DILexicalBlock(scope: !1456, file: !69, line: 1180, column: 2)
!1471 = !DILocation(line: 1181, column: 16, scope: !1469)
!1472 = !DILocation(line: 1181, column: 6, scope: !1470)
!1473 = !DILocation(line: 1183, column: 17, scope: !1474)
!1474 = distinct !DILexicalBlock(scope: !1469, file: !69, line: 1182, column: 3)
!1475 = !DILocation(line: 1183, column: 31, scope: !1474)
!1476 = !DILocation(line: 1183, column: 41, scope: !1474)
!1477 = !DILocation(line: 1183, column: 40, scope: !1474)
!1478 = !DILocation(line: 1183, column: 56, scope: !1474)
!1479 = !DILocation(line: 1183, column: 54, scope: !1474)
!1480 = !DILocation(line: 1183, column: 27, scope: !1474)
!1481 = !DILocation(line: 1183, column: 69, scope: !1474)
!1482 = !DILocation(line: 1183, column: 13, scope: !1474)
!1483 = !DILocation(line: 1184, column: 13, scope: !1474)
!1484 = !DILocation(line: 1184, column: 23, scope: !1474)
!1485 = !DILocation(line: 1184, column: 22, scope: !1474)
!1486 = !DILocation(line: 1184, column: 39, scope: !1474)
!1487 = !DILocation(line: 1184, column: 48, scope: !1474)
!1488 = !DILocation(line: 1184, column: 47, scope: !1474)
!1489 = !DILocation(line: 1184, column: 36, scope: !1474)
!1490 = !DILocation(line: 1184, column: 4, scope: !1474)
!1491 = !DILocation(line: 1188, column: 4, scope: !1492)
!1492 = distinct !DILexicalBlock(scope: !1469, file: !69, line: 1187, column: 3)
!1493 = !DILocation(line: 1191, column: 1, scope: !1446)
!1494 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1208, type: !1495, scopeLine: 1209, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1495 = !DISubroutineType(types: !1496)
!1496 = !{!674, !16, !16}
!1497 = !DILocalVariable(name: "numerator", arg: 1, scope: !1494, file: !69, line: 1208, type: !16)
!1498 = !DILocation(line: 1208, column: 25, scope: !1494)
!1499 = !DILocalVariable(name: "denominator", arg: 2, scope: !1494, file: !69, line: 1208, type: !16)
!1500 = !DILocation(line: 1208, column: 40, scope: !1494)
!1501 = !DILocalVariable(name: "u32Temp1", scope: !1494, file: !69, line: 1210, type: !674)
!1502 = !DILocation(line: 1210, column: 6, scope: !1494)
!1503 = !DILocalVariable(name: "u32Temp2", scope: !1494, file: !69, line: 1210, type: !674)
!1504 = !DILocation(line: 1210, column: 20, scope: !1494)
!1505 = !DILocation(line: 1211, column: 5, scope: !1506)
!1506 = distinct !DILexicalBlock(scope: !1494, file: !69, line: 1211, column: 5)
!1507 = !DILocation(line: 1211, column: 17, scope: !1506)
!1508 = !DILocation(line: 1211, column: 5, scope: !1494)
!1509 = !DILocation(line: 1213, column: 6, scope: !1510)
!1510 = distinct !DILexicalBlock(scope: !1511, file: !69, line: 1213, column: 6)
!1511 = distinct !DILexicalBlock(scope: !1506, file: !69, line: 1212, column: 2)
!1512 = !DILocation(line: 1213, column: 16, scope: !1510)
!1513 = !DILocation(line: 1213, column: 6, scope: !1511)
!1514 = !DILocation(line: 1215, column: 4, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1510, file: !69, line: 1214, column: 3)
!1516 = !DILocation(line: 1219, column: 4, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1510, file: !69, line: 1218, column: 3)
!1518 = !DILocation(line: 1224, column: 6, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1520, file: !69, line: 1224, column: 6)
!1520 = distinct !DILexicalBlock(scope: !1506, file: !69, line: 1223, column: 2)
!1521 = !DILocation(line: 1224, column: 16, scope: !1519)
!1522 = !DILocation(line: 1224, column: 6, scope: !1520)
!1523 = !DILocation(line: 1226, column: 7, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1525, file: !69, line: 1226, column: 7)
!1525 = distinct !DILexicalBlock(scope: !1519, file: !69, line: 1225, column: 3)
!1526 = !DILocation(line: 1226, column: 17, scope: !1524)
!1527 = !DILocation(line: 1226, column: 7, scope: !1525)
!1528 = !DILocation(line: 1228, column: 5, scope: !1529)
!1529 = distinct !DILexicalBlock(scope: !1524, file: !69, line: 1227, column: 4)
!1530 = !DILocation(line: 1232, column: 8, scope: !1531)
!1531 = distinct !DILexicalBlock(scope: !1532, file: !69, line: 1232, column: 8)
!1532 = distinct !DILexicalBlock(scope: !1524, file: !69, line: 1231, column: 4)
!1533 = !DILocation(line: 1232, column: 20, scope: !1531)
!1534 = !DILocation(line: 1232, column: 8, scope: !1532)
!1535 = !DILocation(line: 1234, column: 6, scope: !1536)
!1536 = distinct !DILexicalBlock(scope: !1531, file: !69, line: 1233, column: 5)
!1537 = !DILocation(line: 1238, column: 18, scope: !1538)
!1538 = distinct !DILexicalBlock(scope: !1531, file: !69, line: 1237, column: 5)
!1539 = !DILocation(line: 1238, column: 32, scope: !1538)
!1540 = !DILocation(line: 1238, column: 42, scope: !1538)
!1541 = !DILocation(line: 1238, column: 41, scope: !1538)
!1542 = !DILocation(line: 1238, column: 57, scope: !1538)
!1543 = !DILocation(line: 1238, column: 55, scope: !1538)
!1544 = !DILocation(line: 1238, column: 28, scope: !1538)
!1545 = !DILocation(line: 1238, column: 71, scope: !1538)
!1546 = !DILocation(line: 1238, column: 15, scope: !1538)
!1547 = !DILocation(line: 1239, column: 18, scope: !1538)
!1548 = !DILocation(line: 1239, column: 29, scope: !1538)
!1549 = !DILocation(line: 1239, column: 27, scope: !1538)
!1550 = !DILocation(line: 1239, column: 45, scope: !1538)
!1551 = !DILocation(line: 1239, column: 57, scope: !1538)
!1552 = !DILocation(line: 1239, column: 55, scope: !1538)
!1553 = !DILocation(line: 1239, column: 42, scope: !1538)
!1554 = !DILocation(line: 1239, column: 15, scope: !1538)
!1555 = !DILocation(line: 1240, column: 13, scope: !1538)
!1556 = !DILocation(line: 1240, column: 6, scope: !1538)
!1557 = !DILocation(line: 1246, column: 7, scope: !1558)
!1558 = distinct !DILexicalBlock(scope: !1559, file: !69, line: 1246, column: 7)
!1559 = distinct !DILexicalBlock(scope: !1519, file: !69, line: 1245, column: 3)
!1560 = !DILocation(line: 1246, column: 19, scope: !1558)
!1561 = !DILocation(line: 1246, column: 7, scope: !1559)
!1562 = !DILocation(line: 1248, column: 5, scope: !1563)
!1563 = distinct !DILexicalBlock(scope: !1558, file: !69, line: 1247, column: 4)
!1564 = !DILocation(line: 1252, column: 18, scope: !1565)
!1565 = distinct !DILexicalBlock(scope: !1558, file: !69, line: 1251, column: 4)
!1566 = !DILocation(line: 1252, column: 17, scope: !1565)
!1567 = !DILocation(line: 1252, column: 15, scope: !1565)
!1568 = !DILocation(line: 1253, column: 20, scope: !1565)
!1569 = !DILocation(line: 1253, column: 19, scope: !1565)
!1570 = !DILocation(line: 1253, column: 17, scope: !1565)
!1571 = !DILocation(line: 1254, column: 17, scope: !1565)
!1572 = !DILocation(line: 1254, column: 31, scope: !1565)
!1573 = !DILocation(line: 1254, column: 41, scope: !1565)
!1574 = !DILocation(line: 1254, column: 40, scope: !1565)
!1575 = !DILocation(line: 1254, column: 56, scope: !1565)
!1576 = !DILocation(line: 1254, column: 54, scope: !1565)
!1577 = !DILocation(line: 1254, column: 27, scope: !1565)
!1578 = !DILocation(line: 1254, column: 70, scope: !1565)
!1579 = !DILocation(line: 1254, column: 14, scope: !1565)
!1580 = !DILocation(line: 1255, column: 17, scope: !1565)
!1581 = !DILocation(line: 1255, column: 28, scope: !1565)
!1582 = !DILocation(line: 1255, column: 26, scope: !1565)
!1583 = !DILocation(line: 1255, column: 44, scope: !1565)
!1584 = !DILocation(line: 1255, column: 56, scope: !1565)
!1585 = !DILocation(line: 1255, column: 54, scope: !1565)
!1586 = !DILocation(line: 1255, column: 41, scope: !1565)
!1587 = !DILocation(line: 1255, column: 14, scope: !1565)
!1588 = !DILocation(line: 1256, column: 12, scope: !1565)
!1589 = !DILocation(line: 1256, column: 5, scope: !1565)
!1590 = !DILocation(line: 1261, column: 1, scope: !1494)
!1591 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1278, type: !1592, scopeLine: 1279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1592 = !DISubroutineType(types: !1593)
!1593 = !{!674, !674, !674}
!1594 = !DILocalVariable(name: "numerator", arg: 1, scope: !1591, file: !69, line: 1278, type: !674)
!1595 = !DILocation(line: 1278, column: 25, scope: !1591)
!1596 = !DILocalVariable(name: "denominator", arg: 2, scope: !1591, file: !69, line: 1278, type: !674)
!1597 = !DILocation(line: 1278, column: 40, scope: !1591)
!1598 = !DILocalVariable(name: "u32Temp1", scope: !1591, file: !69, line: 1281, type: !674)
!1599 = !DILocation(line: 1281, column: 6, scope: !1591)
!1600 = !DILocalVariable(name: "u32Temp2", scope: !1591, file: !69, line: 1281, type: !674)
!1601 = !DILocation(line: 1281, column: 20, scope: !1591)
!1602 = !DILocalVariable(name: "u32Temp3", scope: !1591, file: !69, line: 1281, type: !674)
!1603 = !DILocation(line: 1281, column: 34, scope: !1591)
!1604 = !DILocalVariable(name: "numerator_old", scope: !1591, file: !69, line: 1281, type: !674)
!1605 = !DILocation(line: 1281, column: 48, scope: !1591)
!1606 = !DILocation(line: 1282, column: 5, scope: !1607)
!1607 = distinct !DILexicalBlock(scope: !1591, file: !69, line: 1282, column: 5)
!1608 = !DILocation(line: 1282, column: 16, scope: !1607)
!1609 = !DILocation(line: 1282, column: 5, scope: !1591)
!1610 = !DILocation(line: 1284, column: 3, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1607, file: !69, line: 1283, column: 2)
!1612 = !DILocation(line: 1288, column: 14, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1607, file: !69, line: 1287, column: 2)
!1614 = !DILocation(line: 1288, column: 26, scope: !1613)
!1615 = !DILocation(line: 1288, column: 41, scope: !1613)
!1616 = !DILocation(line: 1288, column: 51, scope: !1613)
!1617 = !DILocation(line: 1288, column: 50, scope: !1613)
!1618 = !DILocation(line: 1288, column: 38, scope: !1613)
!1619 = !DILocation(line: 1288, column: 24, scope: !1613)
!1620 = !DILocation(line: 1288, column: 12, scope: !1613)
!1621 = !DILocation(line: 1289, column: 7, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1613, file: !69, line: 1289, column: 6)
!1623 = !DILocation(line: 1289, column: 16, scope: !1622)
!1624 = !DILocation(line: 1289, column: 24, scope: !1622)
!1625 = !DILocation(line: 1289, column: 6, scope: !1613)
!1626 = !DILocation(line: 1291, column: 16, scope: !1627)
!1627 = distinct !DILexicalBlock(scope: !1622, file: !69, line: 1290, column: 3)
!1628 = !DILocation(line: 1291, column: 27, scope: !1627)
!1629 = !DILocation(line: 1291, column: 13, scope: !1627)
!1630 = !DILocation(line: 1292, column: 3, scope: !1627)
!1631 = !DILocation(line: 1295, column: 16, scope: !1632)
!1632 = distinct !DILexicalBlock(scope: !1622, file: !69, line: 1294, column: 3)
!1633 = !DILocation(line: 1295, column: 27, scope: !1632)
!1634 = !DILocation(line: 1295, column: 32, scope: !1632)
!1635 = !DILocation(line: 1295, column: 13, scope: !1632)
!1636 = !DILocation(line: 1298, column: 6, scope: !1637)
!1637 = distinct !DILexicalBlock(scope: !1613, file: !69, line: 1298, column: 6)
!1638 = !DILocation(line: 1298, column: 17, scope: !1637)
!1639 = !DILocation(line: 1298, column: 15, scope: !1637)
!1640 = !DILocation(line: 1298, column: 6, scope: !1613)
!1641 = !DILocation(line: 1300, column: 12, scope: !1642)
!1642 = distinct !DILexicalBlock(scope: !1637, file: !69, line: 1299, column: 3)
!1643 = !DILocation(line: 1300, column: 22, scope: !1642)
!1644 = !DILocation(line: 1300, column: 21, scope: !1642)
!1645 = !DILocation(line: 1300, column: 4, scope: !1642)
!1646 = !DILocation(line: 1304, column: 13, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1637, file: !69, line: 1303, column: 3)
!1648 = !DILocation(line: 1304, column: 23, scope: !1647)
!1649 = !DILocation(line: 1304, column: 22, scope: !1647)
!1650 = !DILocation(line: 1304, column: 36, scope: !1647)
!1651 = !DILocation(line: 1304, column: 4, scope: !1647)
!1652 = !DILocation(line: 1309, column: 1, scope: !1591)
!1653 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1326, type: !1654, scopeLine: 1327, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1654 = !DISubroutineType(types: !1655)
!1655 = !{!16, !674, !16}
!1656 = !DILocalVariable(name: "numerator", arg: 1, scope: !1653, file: !69, line: 1326, type: !674)
!1657 = !DILocation(line: 1326, column: 25, scope: !1653)
!1658 = !DILocalVariable(name: "denominator", arg: 2, scope: !1653, file: !69, line: 1326, type: !16)
!1659 = !DILocation(line: 1326, column: 40, scope: !1653)
!1660 = !DILocalVariable(name: "u32Temp1", scope: !1653, file: !69, line: 1328, type: !674)
!1661 = !DILocation(line: 1328, column: 6, scope: !1653)
!1662 = !DILocalVariable(name: "u32Temp2", scope: !1653, file: !69, line: 1328, type: !674)
!1663 = !DILocation(line: 1328, column: 20, scope: !1653)
!1664 = !DILocation(line: 1329, column: 5, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1653, file: !69, line: 1329, column: 5)
!1666 = !DILocation(line: 1329, column: 17, scope: !1665)
!1667 = !DILocation(line: 1329, column: 5, scope: !1653)
!1668 = !DILocation(line: 1331, column: 6, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1670, file: !69, line: 1331, column: 6)
!1670 = distinct !DILexicalBlock(scope: !1665, file: !69, line: 1330, column: 2)
!1671 = !DILocation(line: 1331, column: 18, scope: !1669)
!1672 = !DILocation(line: 1331, column: 6, scope: !1670)
!1673 = !DILocation(line: 1333, column: 4, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1669, file: !69, line: 1332, column: 3)
!1675 = !DILocation(line: 1337, column: 19, scope: !1676)
!1676 = distinct !DILexicalBlock(scope: !1669, file: !69, line: 1336, column: 3)
!1677 = !DILocation(line: 1337, column: 18, scope: !1676)
!1678 = !DILocation(line: 1337, column: 16, scope: !1676)
!1679 = !DILocation(line: 1338, column: 16, scope: !1676)
!1680 = !DILocation(line: 1338, column: 30, scope: !1676)
!1681 = !DILocation(line: 1338, column: 40, scope: !1676)
!1682 = !DILocation(line: 1338, column: 39, scope: !1676)
!1683 = !DILocation(line: 1338, column: 55, scope: !1676)
!1684 = !DILocation(line: 1338, column: 53, scope: !1676)
!1685 = !DILocation(line: 1338, column: 26, scope: !1676)
!1686 = !DILocation(line: 1338, column: 69, scope: !1676)
!1687 = !DILocation(line: 1338, column: 13, scope: !1676)
!1688 = !DILocation(line: 1339, column: 16, scope: !1676)
!1689 = !DILocation(line: 1339, column: 25, scope: !1676)
!1690 = !DILocation(line: 1339, column: 24, scope: !1676)
!1691 = !DILocation(line: 1339, column: 41, scope: !1676)
!1692 = !DILocation(line: 1339, column: 51, scope: !1676)
!1693 = !DILocation(line: 1339, column: 50, scope: !1676)
!1694 = !DILocation(line: 1339, column: 38, scope: !1676)
!1695 = !DILocation(line: 1339, column: 13, scope: !1676)
!1696 = !DILocation(line: 1340, column: 7, scope: !1697)
!1697 = distinct !DILexicalBlock(scope: !1676, file: !69, line: 1340, column: 7)
!1698 = !DILocation(line: 1340, column: 16, scope: !1697)
!1699 = !DILocation(line: 1340, column: 7, scope: !1676)
!1700 = !DILocation(line: 1342, column: 13, scope: !1701)
!1701 = distinct !DILexicalBlock(scope: !1697, file: !69, line: 1341, column: 4)
!1702 = !DILocation(line: 1342, column: 12, scope: !1701)
!1703 = !DILocation(line: 1342, column: 5, scope: !1701)
!1704 = !DILocation(line: 1346, column: 5, scope: !1705)
!1705 = distinct !DILexicalBlock(scope: !1697, file: !69, line: 1345, column: 4)
!1706 = !DILocation(line: 1352, column: 15, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !1665, file: !69, line: 1351, column: 2)
!1708 = !DILocation(line: 1352, column: 29, scope: !1707)
!1709 = !DILocation(line: 1352, column: 39, scope: !1707)
!1710 = !DILocation(line: 1352, column: 38, scope: !1707)
!1711 = !DILocation(line: 1352, column: 54, scope: !1707)
!1712 = !DILocation(line: 1352, column: 52, scope: !1707)
!1713 = !DILocation(line: 1352, column: 25, scope: !1707)
!1714 = !DILocation(line: 1352, column: 68, scope: !1707)
!1715 = !DILocation(line: 1352, column: 12, scope: !1707)
!1716 = !DILocation(line: 1353, column: 15, scope: !1707)
!1717 = !DILocation(line: 1353, column: 24, scope: !1707)
!1718 = !DILocation(line: 1353, column: 23, scope: !1707)
!1719 = !DILocation(line: 1353, column: 40, scope: !1707)
!1720 = !DILocation(line: 1353, column: 50, scope: !1707)
!1721 = !DILocation(line: 1353, column: 49, scope: !1707)
!1722 = !DILocation(line: 1353, column: 37, scope: !1707)
!1723 = !DILocation(line: 1353, column: 12, scope: !1707)
!1724 = !DILocation(line: 1354, column: 6, scope: !1725)
!1725 = distinct !DILexicalBlock(scope: !1707, file: !69, line: 1354, column: 6)
!1726 = !DILocation(line: 1354, column: 15, scope: !1725)
!1727 = !DILocation(line: 1354, column: 6, scope: !1707)
!1728 = !DILocation(line: 1356, column: 11, scope: !1729)
!1729 = distinct !DILexicalBlock(scope: !1725, file: !69, line: 1355, column: 3)
!1730 = !DILocation(line: 1356, column: 4, scope: !1729)
!1731 = !DILocation(line: 1360, column: 4, scope: !1732)
!1732 = distinct !DILexicalBlock(scope: !1725, file: !69, line: 1359, column: 3)
!1733 = !DILocation(line: 1363, column: 1, scope: !1653)
!1734 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1381, type: !1735, scopeLine: 1382, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1735 = !DISubroutineType(types: !1736)
!1736 = !{!16, !16, !674}
!1737 = !DILocalVariable(name: "numerator", arg: 1, scope: !1734, file: !69, line: 1381, type: !16)
!1738 = !DILocation(line: 1381, column: 25, scope: !1734)
!1739 = !DILocalVariable(name: "denominator", arg: 2, scope: !1734, file: !69, line: 1381, type: !674)
!1740 = !DILocation(line: 1381, column: 40, scope: !1734)
!1741 = !DILocalVariable(name: "s32Temp1", scope: !1734, file: !69, line: 1383, type: !16)
!1742 = !DILocation(line: 1383, column: 6, scope: !1734)
!1743 = !DILocalVariable(name: "s32Temp2", scope: !1734, file: !69, line: 1383, type: !16)
!1744 = !DILocation(line: 1383, column: 20, scope: !1734)
!1745 = !DILocalVariable(name: "u32Temp0", scope: !1734, file: !69, line: 1384, type: !674)
!1746 = !DILocation(line: 1384, column: 6, scope: !1734)
!1747 = !DILocalVariable(name: "u32Temp1", scope: !1734, file: !69, line: 1384, type: !674)
!1748 = !DILocation(line: 1384, column: 20, scope: !1734)
!1749 = !DILocalVariable(name: "u32Temp2", scope: !1734, file: !69, line: 1384, type: !674)
!1750 = !DILocation(line: 1384, column: 34, scope: !1734)
!1751 = !DILocation(line: 1385, column: 5, scope: !1752)
!1752 = distinct !DILexicalBlock(scope: !1734, file: !69, line: 1385, column: 5)
!1753 = !DILocation(line: 1385, column: 17, scope: !1752)
!1754 = !DILocation(line: 1385, column: 5, scope: !1734)
!1755 = !DILocation(line: 1387, column: 6, scope: !1756)
!1756 = distinct !DILexicalBlock(scope: !1757, file: !69, line: 1387, column: 6)
!1757 = distinct !DILexicalBlock(scope: !1752, file: !69, line: 1386, column: 2)
!1758 = !DILocation(line: 1387, column: 16, scope: !1756)
!1759 = !DILocation(line: 1387, column: 6, scope: !1757)
!1760 = !DILocation(line: 1389, column: 4, scope: !1761)
!1761 = distinct !DILexicalBlock(scope: !1756, file: !69, line: 1388, column: 3)
!1762 = !DILocation(line: 1393, column: 4, scope: !1763)
!1763 = distinct !DILexicalBlock(scope: !1756, file: !69, line: 1392, column: 3)
!1764 = !DILocation(line: 1398, column: 6, scope: !1765)
!1765 = distinct !DILexicalBlock(scope: !1766, file: !69, line: 1398, column: 6)
!1766 = distinct !DILexicalBlock(scope: !1752, file: !69, line: 1397, column: 2)
!1767 = !DILocation(line: 1398, column: 16, scope: !1765)
!1768 = !DILocation(line: 1398, column: 6, scope: !1766)
!1769 = !DILocation(line: 1400, column: 16, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1765, file: !69, line: 1399, column: 3)
!1771 = !DILocation(line: 1400, column: 15, scope: !1770)
!1772 = !DILocation(line: 1400, column: 13, scope: !1770)
!1773 = !DILocation(line: 1401, column: 16, scope: !1770)
!1774 = !DILocation(line: 1401, column: 25, scope: !1770)
!1775 = !DILocation(line: 1401, column: 24, scope: !1770)
!1776 = !DILocation(line: 1401, column: 13, scope: !1770)
!1777 = !DILocation(line: 1402, column: 15, scope: !1770)
!1778 = !DILocation(line: 1402, column: 28, scope: !1770)
!1779 = !DILocation(line: 1402, column: 37, scope: !1770)
!1780 = !DILocation(line: 1402, column: 36, scope: !1770)
!1781 = !DILocation(line: 1402, column: 52, scope: !1770)
!1782 = !DILocation(line: 1402, column: 50, scope: !1770)
!1783 = !DILocation(line: 1402, column: 24, scope: !1770)
!1784 = !DILocation(line: 1402, column: 13, scope: !1770)
!1785 = !DILocation(line: 1404, column: 8, scope: !1786)
!1786 = distinct !DILexicalBlock(scope: !1770, file: !69, line: 1404, column: 7)
!1787 = !DILocation(line: 1404, column: 20, scope: !1786)
!1788 = !DILocation(line: 1404, column: 27, scope: !1786)
!1789 = !DILocation(line: 1404, column: 7, scope: !1770)
!1790 = !DILocation(line: 1406, column: 20, scope: !1791)
!1791 = distinct !DILexicalBlock(scope: !1786, file: !69, line: 1405, column: 4)
!1792 = !DILocation(line: 1406, column: 32, scope: !1791)
!1793 = !DILocation(line: 1406, column: 17, scope: !1791)
!1794 = !DILocation(line: 1407, column: 4, scope: !1791)
!1795 = !DILocation(line: 1410, column: 20, scope: !1796)
!1796 = distinct !DILexicalBlock(scope: !1786, file: !69, line: 1409, column: 4)
!1797 = !DILocation(line: 1410, column: 32, scope: !1796)
!1798 = !DILocation(line: 1410, column: 38, scope: !1796)
!1799 = !DILocation(line: 1410, column: 17, scope: !1796)
!1800 = !DILocation(line: 1414, column: 7, scope: !1801)
!1801 = distinct !DILexicalBlock(scope: !1770, file: !69, line: 1414, column: 7)
!1802 = !DILocation(line: 1414, column: 18, scope: !1801)
!1803 = !DILocation(line: 1414, column: 16, scope: !1801)
!1804 = !DILocation(line: 1414, column: 7, scope: !1770)
!1805 = !DILocation(line: 1416, column: 14, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1801, file: !69, line: 1415, column: 4)
!1807 = !DILocation(line: 1416, column: 13, scope: !1806)
!1808 = !DILocation(line: 1416, column: 23, scope: !1806)
!1809 = !DILocation(line: 1416, column: 5, scope: !1806)
!1810 = !DILocation(line: 1420, column: 14, scope: !1811)
!1811 = distinct !DILexicalBlock(scope: !1801, file: !69, line: 1419, column: 4)
!1812 = !DILocation(line: 1420, column: 23, scope: !1811)
!1813 = !DILocation(line: 1420, column: 12, scope: !1811)
!1814 = !DILocation(line: 1420, column: 27, scope: !1811)
!1815 = !DILocation(line: 1420, column: 5, scope: !1811)
!1816 = !DILocation(line: 1427, column: 16, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1765, file: !69, line: 1426, column: 3)
!1818 = !DILocation(line: 1427, column: 30, scope: !1817)
!1819 = !DILocation(line: 1427, column: 40, scope: !1817)
!1820 = !DILocation(line: 1427, column: 39, scope: !1817)
!1821 = !DILocation(line: 1427, column: 55, scope: !1817)
!1822 = !DILocation(line: 1427, column: 53, scope: !1817)
!1823 = !DILocation(line: 1427, column: 26, scope: !1817)
!1824 = !DILocation(line: 1427, column: 69, scope: !1817)
!1825 = !DILocation(line: 1427, column: 13, scope: !1817)
!1826 = !DILocation(line: 1428, column: 16, scope: !1817)
!1827 = !DILocation(line: 1428, column: 26, scope: !1817)
!1828 = !DILocation(line: 1428, column: 25, scope: !1817)
!1829 = !DILocation(line: 1428, column: 42, scope: !1817)
!1830 = !DILocation(line: 1428, column: 51, scope: !1817)
!1831 = !DILocation(line: 1428, column: 50, scope: !1817)
!1832 = !DILocation(line: 1428, column: 39, scope: !1817)
!1833 = !DILocation(line: 1428, column: 13, scope: !1817)
!1834 = !DILocation(line: 1429, column: 11, scope: !1817)
!1835 = !DILocation(line: 1429, column: 4, scope: !1817)
!1836 = !DILocation(line: 1432, column: 1, scope: !1734)
!1837 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1449, type: !1838, scopeLine: 1450, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1838 = !DISubroutineType(types: !1839)
!1839 = !{!16, !16, !16}
!1840 = !DILocalVariable(name: "numerator", arg: 1, scope: !1837, file: !69, line: 1449, type: !16)
!1841 = !DILocation(line: 1449, column: 25, scope: !1837)
!1842 = !DILocalVariable(name: "denominator", arg: 2, scope: !1837, file: !69, line: 1449, type: !16)
!1843 = !DILocation(line: 1449, column: 40, scope: !1837)
!1844 = !DILocalVariable(name: "s32Temp1", scope: !1837, file: !69, line: 1451, type: !16)
!1845 = !DILocation(line: 1451, column: 6, scope: !1837)
!1846 = !DILocalVariable(name: "s32Temp2", scope: !1837, file: !69, line: 1451, type: !16)
!1847 = !DILocation(line: 1451, column: 20, scope: !1837)
!1848 = !DILocalVariable(name: "denominator_prime", scope: !1837, file: !69, line: 1452, type: !674)
!1849 = !DILocation(line: 1452, column: 6, scope: !1837)
!1850 = !DILocalVariable(name: "u32Temp1", scope: !1837, file: !69, line: 1452, type: !674)
!1851 = !DILocation(line: 1452, column: 29, scope: !1837)
!1852 = !DILocalVariable(name: "u32Temp2", scope: !1837, file: !69, line: 1452, type: !674)
!1853 = !DILocation(line: 1452, column: 43, scope: !1837)
!1854 = !DILocalVariable(name: "u32numerator", scope: !1837, file: !69, line: 1453, type: !674)
!1855 = !DILocation(line: 1453, column: 6, scope: !1837)
!1856 = !DILocalVariable(name: "u32denominator", scope: !1837, file: !69, line: 1453, type: !674)
!1857 = !DILocation(line: 1453, column: 23, scope: !1837)
!1858 = !DILocation(line: 1454, column: 5, scope: !1859)
!1859 = distinct !DILexicalBlock(scope: !1837, file: !69, line: 1454, column: 5)
!1860 = !DILocation(line: 1454, column: 15, scope: !1859)
!1861 = !DILocation(line: 1454, column: 5, scope: !1837)
!1862 = !DILocation(line: 1456, column: 6, scope: !1863)
!1863 = distinct !DILexicalBlock(scope: !1864, file: !69, line: 1456, column: 6)
!1864 = distinct !DILexicalBlock(scope: !1859, file: !69, line: 1455, column: 2)
!1865 = !DILocation(line: 1456, column: 18, scope: !1863)
!1866 = !DILocation(line: 1456, column: 6, scope: !1864)
!1867 = !DILocation(line: 1458, column: 7, scope: !1868)
!1868 = distinct !DILexicalBlock(scope: !1869, file: !69, line: 1458, column: 7)
!1869 = distinct !DILexicalBlock(scope: !1863, file: !69, line: 1457, column: 3)
!1870 = !DILocation(line: 1458, column: 19, scope: !1868)
!1871 = !DILocation(line: 1458, column: 7, scope: !1869)
!1872 = !DILocation(line: 1460, column: 5, scope: !1873)
!1873 = distinct !DILexicalBlock(scope: !1868, file: !69, line: 1459, column: 4)
!1874 = !DILocation(line: 1464, column: 21, scope: !1875)
!1875 = distinct !DILexicalBlock(scope: !1868, file: !69, line: 1463, column: 4)
!1876 = !DILocation(line: 1464, column: 20, scope: !1875)
!1877 = !DILocation(line: 1464, column: 18, scope: !1875)
!1878 = !DILocation(line: 1465, column: 23, scope: !1875)
!1879 = !DILocation(line: 1465, column: 22, scope: !1875)
!1880 = !DILocation(line: 1465, column: 20, scope: !1875)
!1881 = !DILocation(line: 1466, column: 16, scope: !1875)
!1882 = !DILocation(line: 1466, column: 33, scope: !1875)
!1883 = !DILocation(line: 1466, column: 46, scope: !1875)
!1884 = !DILocation(line: 1466, column: 45, scope: !1875)
!1885 = !DILocation(line: 1466, column: 64, scope: !1875)
!1886 = !DILocation(line: 1466, column: 62, scope: !1875)
!1887 = !DILocation(line: 1466, column: 29, scope: !1875)
!1888 = !DILocation(line: 1466, column: 81, scope: !1875)
!1889 = !DILocation(line: 1466, column: 14, scope: !1875)
!1890 = !DILocation(line: 1467, column: 17, scope: !1875)
!1891 = !DILocation(line: 1467, column: 30, scope: !1875)
!1892 = !DILocation(line: 1467, column: 29, scope: !1875)
!1893 = !DILocation(line: 1467, column: 49, scope: !1875)
!1894 = !DILocation(line: 1467, column: 58, scope: !1875)
!1895 = !DILocation(line: 1467, column: 57, scope: !1875)
!1896 = !DILocation(line: 1467, column: 46, scope: !1875)
!1897 = !DILocation(line: 1467, column: 14, scope: !1875)
!1898 = !DILocation(line: 1468, column: 8, scope: !1899)
!1899 = distinct !DILexicalBlock(scope: !1875, file: !69, line: 1468, column: 8)
!1900 = !DILocation(line: 1468, column: 17, scope: !1899)
!1901 = !DILocation(line: 1468, column: 8, scope: !1875)
!1902 = !DILocation(line: 1470, column: 13, scope: !1903)
!1903 = distinct !DILexicalBlock(scope: !1899, file: !69, line: 1469, column: 5)
!1904 = !DILocation(line: 1470, column: 6, scope: !1903)
!1905 = !DILocation(line: 1474, column: 6, scope: !1906)
!1906 = distinct !DILexicalBlock(scope: !1899, file: !69, line: 1473, column: 5)
!1907 = !DILocation(line: 1480, column: 20, scope: !1908)
!1908 = distinct !DILexicalBlock(scope: !1863, file: !69, line: 1479, column: 3)
!1909 = !DILocation(line: 1480, column: 19, scope: !1908)
!1910 = !DILocation(line: 1480, column: 29, scope: !1908)
!1911 = !DILocation(line: 1480, column: 17, scope: !1908)
!1912 = !DILocation(line: 1481, column: 16, scope: !1908)
!1913 = !DILocation(line: 1481, column: 33, scope: !1908)
!1914 = !DILocation(line: 1481, column: 46, scope: !1908)
!1915 = !DILocation(line: 1481, column: 45, scope: !1908)
!1916 = !DILocation(line: 1481, column: 61, scope: !1908)
!1917 = !DILocation(line: 1481, column: 59, scope: !1908)
!1918 = !DILocation(line: 1481, column: 29, scope: !1908)
!1919 = !DILocation(line: 1481, column: 75, scope: !1908)
!1920 = !DILocation(line: 1481, column: 13, scope: !1908)
!1921 = !DILocation(line: 1482, column: 16, scope: !1908)
!1922 = !DILocation(line: 1482, column: 29, scope: !1908)
!1923 = !DILocation(line: 1482, column: 28, scope: !1908)
!1924 = !DILocation(line: 1482, column: 45, scope: !1908)
!1925 = !DILocation(line: 1482, column: 54, scope: !1908)
!1926 = !DILocation(line: 1482, column: 53, scope: !1908)
!1927 = !DILocation(line: 1482, column: 42, scope: !1908)
!1928 = !DILocation(line: 1482, column: 13, scope: !1908)
!1929 = !DILocation(line: 1483, column: 13, scope: !1908)
!1930 = !DILocation(line: 1483, column: 12, scope: !1908)
!1931 = !DILocation(line: 1483, column: 22, scope: !1908)
!1932 = !DILocation(line: 1483, column: 4, scope: !1908)
!1933 = !DILocation(line: 1488, column: 6, scope: !1934)
!1934 = distinct !DILexicalBlock(scope: !1935, file: !69, line: 1488, column: 6)
!1935 = distinct !DILexicalBlock(scope: !1859, file: !69, line: 1487, column: 2)
!1936 = !DILocation(line: 1488, column: 18, scope: !1934)
!1937 = !DILocation(line: 1488, column: 6, scope: !1935)
!1938 = !DILocation(line: 1490, column: 7, scope: !1939)
!1939 = distinct !DILexicalBlock(scope: !1940, file: !69, line: 1490, column: 7)
!1940 = distinct !DILexicalBlock(scope: !1934, file: !69, line: 1489, column: 3)
!1941 = !DILocation(line: 1490, column: 19, scope: !1939)
!1942 = !DILocation(line: 1490, column: 7, scope: !1940)
!1943 = !DILocation(line: 1492, column: 5, scope: !1944)
!1944 = distinct !DILexicalBlock(scope: !1939, file: !69, line: 1491, column: 4)
!1945 = !DILocation(line: 1496, column: 23, scope: !1946)
!1946 = distinct !DILexicalBlock(scope: !1939, file: !69, line: 1495, column: 4)
!1947 = !DILocation(line: 1496, column: 22, scope: !1946)
!1948 = !DILocation(line: 1496, column: 35, scope: !1946)
!1949 = !DILocation(line: 1496, column: 20, scope: !1946)
!1950 = !DILocation(line: 1497, column: 17, scope: !1946)
!1951 = !DILocation(line: 1497, column: 31, scope: !1946)
!1952 = !DILocation(line: 1497, column: 41, scope: !1946)
!1953 = !DILocation(line: 1497, column: 40, scope: !1946)
!1954 = !DILocation(line: 1497, column: 59, scope: !1946)
!1955 = !DILocation(line: 1497, column: 57, scope: !1946)
!1956 = !DILocation(line: 1497, column: 27, scope: !1946)
!1957 = !DILocation(line: 1497, column: 76, scope: !1946)
!1958 = !DILocation(line: 1497, column: 14, scope: !1946)
!1959 = !DILocation(line: 1498, column: 17, scope: !1946)
!1960 = !DILocation(line: 1498, column: 27, scope: !1946)
!1961 = !DILocation(line: 1498, column: 26, scope: !1946)
!1962 = !DILocation(line: 1498, column: 46, scope: !1946)
!1963 = !DILocation(line: 1498, column: 55, scope: !1946)
!1964 = !DILocation(line: 1498, column: 54, scope: !1946)
!1965 = !DILocation(line: 1498, column: 43, scope: !1946)
!1966 = !DILocation(line: 1498, column: 14, scope: !1946)
!1967 = !DILocation(line: 1499, column: 14, scope: !1946)
!1968 = !DILocation(line: 1499, column: 13, scope: !1946)
!1969 = !DILocation(line: 1499, column: 23, scope: !1946)
!1970 = !DILocation(line: 1499, column: 5, scope: !1946)
!1971 = !DILocation(line: 1504, column: 16, scope: !1972)
!1972 = distinct !DILexicalBlock(scope: !1934, file: !69, line: 1503, column: 3)
!1973 = !DILocation(line: 1504, column: 30, scope: !1972)
!1974 = !DILocation(line: 1504, column: 40, scope: !1972)
!1975 = !DILocation(line: 1504, column: 39, scope: !1972)
!1976 = !DILocation(line: 1504, column: 55, scope: !1972)
!1977 = !DILocation(line: 1504, column: 53, scope: !1972)
!1978 = !DILocation(line: 1504, column: 26, scope: !1972)
!1979 = !DILocation(line: 1504, column: 69, scope: !1972)
!1980 = !DILocation(line: 1504, column: 13, scope: !1972)
!1981 = !DILocation(line: 1505, column: 16, scope: !1972)
!1982 = !DILocation(line: 1505, column: 26, scope: !1972)
!1983 = !DILocation(line: 1505, column: 25, scope: !1972)
!1984 = !DILocation(line: 1505, column: 42, scope: !1972)
!1985 = !DILocation(line: 1505, column: 51, scope: !1972)
!1986 = !DILocation(line: 1505, column: 50, scope: !1972)
!1987 = !DILocation(line: 1505, column: 39, scope: !1972)
!1988 = !DILocation(line: 1505, column: 13, scope: !1972)
!1989 = !DILocation(line: 1506, column: 11, scope: !1972)
!1990 = !DILocation(line: 1506, column: 4, scope: !1972)
!1991 = !DILocation(line: 1509, column: 1, scope: !1837)
!1992 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1527, type: !1993, scopeLine: 1528, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1993 = !DISubroutineType(types: !1994)
!1994 = !{!6, !16, !674}
!1995 = !DILocalVariable(name: "numerator", arg: 1, scope: !1992, file: !69, line: 1527, type: !16)
!1996 = !DILocation(line: 1527, column: 25, scope: !1992)
!1997 = !DILocalVariable(name: "denominator", arg: 2, scope: !1992, file: !69, line: 1527, type: !674)
!1998 = !DILocation(line: 1527, column: 40, scope: !1992)
!1999 = !DILocalVariable(name: "numerator_prime", scope: !1992, file: !69, line: 1530, type: !674)
!2000 = !DILocation(line: 1530, column: 6, scope: !1992)
!2001 = !DILocalVariable(name: "u32Temp1", scope: !1992, file: !69, line: 1530, type: !674)
!2002 = !DILocation(line: 1530, column: 27, scope: !1992)
!2003 = !DILocalVariable(name: "u32Temp2", scope: !1992, file: !69, line: 1530, type: !674)
!2004 = !DILocation(line: 1530, column: 41, scope: !1992)
!2005 = !DILocalVariable(name: "u32Temp3", scope: !1992, file: !69, line: 1530, type: !674)
!2006 = !DILocation(line: 1530, column: 55, scope: !1992)
!2007 = !DILocalVariable(name: "s32Temp1", scope: !1992, file: !69, line: 1531, type: !16)
!2008 = !DILocation(line: 1531, column: 6, scope: !1992)
!2009 = !DILocalVariable(name: "s32Temp2", scope: !1992, file: !69, line: 1531, type: !16)
!2010 = !DILocation(line: 1531, column: 20, scope: !1992)
!2011 = !DILocalVariable(name: "s32Temp3", scope: !1992, file: !69, line: 1531, type: !16)
!2012 = !DILocation(line: 1531, column: 34, scope: !1992)
!2013 = !DILocation(line: 1532, column: 5, scope: !2014)
!2014 = distinct !DILexicalBlock(scope: !1992, file: !69, line: 1532, column: 5)
!2015 = !DILocation(line: 1532, column: 17, scope: !2014)
!2016 = !DILocation(line: 1532, column: 5, scope: !1992)
!2017 = !DILocation(line: 1534, column: 6, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !2019, file: !69, line: 1534, column: 6)
!2019 = distinct !DILexicalBlock(scope: !2014, file: !69, line: 1533, column: 2)
!2020 = !DILocation(line: 1534, column: 15, scope: !2018)
!2021 = !DILocation(line: 1534, column: 6, scope: !2019)
!2022 = !DILocation(line: 1536, column: 4, scope: !2023)
!2023 = distinct !DILexicalBlock(scope: !2018, file: !69, line: 1535, column: 3)
!2024 = !DILocation(line: 1540, column: 4, scope: !2025)
!2025 = distinct !DILexicalBlock(scope: !2018, file: !69, line: 1539, column: 3)
!2026 = !DILocation(line: 1545, column: 6, scope: !2027)
!2027 = distinct !DILexicalBlock(scope: !2028, file: !69, line: 1545, column: 6)
!2028 = distinct !DILexicalBlock(scope: !2014, file: !69, line: 1544, column: 2)
!2029 = !DILocation(line: 1545, column: 16, scope: !2027)
!2030 = !DILocation(line: 1545, column: 6, scope: !2028)
!2031 = !DILocation(line: 1547, column: 23, scope: !2032)
!2032 = distinct !DILexicalBlock(scope: !2027, file: !69, line: 1546, column: 3)
!2033 = !DILocation(line: 1547, column: 22, scope: !2032)
!2034 = !DILocation(line: 1547, column: 20, scope: !2032)
!2035 = !DILocation(line: 1548, column: 16, scope: !2032)
!2036 = !DILocation(line: 1548, column: 32, scope: !2032)
!2037 = !DILocation(line: 1548, column: 31, scope: !2032)
!2038 = !DILocation(line: 1548, column: 13, scope: !2032)
!2039 = !DILocation(line: 1549, column: 15, scope: !2032)
!2040 = !DILocation(line: 1549, column: 34, scope: !2032)
!2041 = !DILocation(line: 1549, column: 45, scope: !2032)
!2042 = !DILocation(line: 1549, column: 43, scope: !2032)
!2043 = !DILocation(line: 1549, column: 31, scope: !2032)
!2044 = !DILocation(line: 1549, column: 13, scope: !2032)
!2045 = !DILocation(line: 1551, column: 8, scope: !2046)
!2046 = distinct !DILexicalBlock(scope: !2032, file: !69, line: 1551, column: 7)
!2047 = !DILocation(line: 1551, column: 20, scope: !2046)
!2048 = !DILocation(line: 1551, column: 27, scope: !2046)
!2049 = !DILocation(line: 1551, column: 7, scope: !2032)
!2050 = !DILocation(line: 1553, column: 19, scope: !2051)
!2051 = distinct !DILexicalBlock(scope: !2046, file: !69, line: 1552, column: 4)
!2052 = !DILocation(line: 1553, column: 31, scope: !2051)
!2053 = !DILocation(line: 1553, column: 17, scope: !2051)
!2054 = !DILocation(line: 1554, column: 4, scope: !2051)
!2055 = !DILocation(line: 1557, column: 20, scope: !2056)
!2056 = distinct !DILexicalBlock(scope: !2046, file: !69, line: 1556, column: 4)
!2057 = !DILocation(line: 1557, column: 32, scope: !2056)
!2058 = !DILocation(line: 1557, column: 38, scope: !2056)
!2059 = !DILocation(line: 1557, column: 17, scope: !2056)
!2060 = !DILocation(line: 1560, column: 7, scope: !2061)
!2061 = distinct !DILexicalBlock(scope: !2032, file: !69, line: 1560, column: 7)
!2062 = !DILocation(line: 1560, column: 18, scope: !2061)
!2063 = !DILocation(line: 1560, column: 16, scope: !2061)
!2064 = !DILocation(line: 1560, column: 7, scope: !2032)
!2065 = !DILocation(line: 1562, column: 18, scope: !2066)
!2066 = distinct !DILexicalBlock(scope: !2061, file: !69, line: 1561, column: 4)
!2067 = !DILocation(line: 1562, column: 16, scope: !2066)
!2068 = !DILocation(line: 1562, column: 28, scope: !2066)
!2069 = !DILocation(line: 1562, column: 14, scope: !2066)
!2070 = !DILocation(line: 1563, column: 4, scope: !2066)
!2071 = !DILocation(line: 1566, column: 18, scope: !2072)
!2072 = distinct !DILexicalBlock(scope: !2061, file: !69, line: 1565, column: 4)
!2073 = !DILocation(line: 1566, column: 26, scope: !2072)
!2074 = !DILocation(line: 1566, column: 16, scope: !2072)
!2075 = !DILocation(line: 1566, column: 30, scope: !2072)
!2076 = !DILocation(line: 1566, column: 14, scope: !2072)
!2077 = !DILocation(line: 1568, column: 8, scope: !2078)
!2078 = distinct !DILexicalBlock(scope: !2032, file: !69, line: 1568, column: 7)
!2079 = !DILocation(line: 1568, column: 18, scope: !2078)
!2080 = !DILocation(line: 1568, column: 7, scope: !2032)
!2081 = !DILocation(line: 1570, column: 18, scope: !2082)
!2082 = distinct !DILexicalBlock(scope: !2078, file: !69, line: 1569, column: 4)
!2083 = !DILocation(line: 1570, column: 12, scope: !2082)
!2084 = !DILocation(line: 1570, column: 5, scope: !2082)
!2085 = !DILocation(line: 1574, column: 5, scope: !2086)
!2086 = distinct !DILexicalBlock(scope: !2078, file: !69, line: 1573, column: 4)
!2087 = !DILocation(line: 1579, column: 16, scope: !2088)
!2088 = distinct !DILexicalBlock(scope: !2027, file: !69, line: 1578, column: 3)
!2089 = !DILocation(line: 1579, column: 26, scope: !2088)
!2090 = !DILocation(line: 1579, column: 25, scope: !2088)
!2091 = !DILocation(line: 1579, column: 41, scope: !2088)
!2092 = !DILocation(line: 1579, column: 39, scope: !2088)
!2093 = !DILocation(line: 1579, column: 13, scope: !2088)
!2094 = !DILocation(line: 1580, column: 16, scope: !2088)
!2095 = !DILocation(line: 1580, column: 30, scope: !2088)
!2096 = !DILocation(line: 1580, column: 40, scope: !2088)
!2097 = !DILocation(line: 1580, column: 39, scope: !2088)
!2098 = !DILocation(line: 1580, column: 55, scope: !2088)
!2099 = !DILocation(line: 1580, column: 53, scope: !2088)
!2100 = !DILocation(line: 1580, column: 26, scope: !2088)
!2101 = !DILocation(line: 1580, column: 68, scope: !2088)
!2102 = !DILocation(line: 1580, column: 13, scope: !2088)
!2103 = !DILocation(line: 1581, column: 16, scope: !2088)
!2104 = !DILocation(line: 1581, column: 25, scope: !2088)
!2105 = !DILocation(line: 1581, column: 24, scope: !2088)
!2106 = !DILocation(line: 1581, column: 41, scope: !2088)
!2107 = !DILocation(line: 1581, column: 51, scope: !2088)
!2108 = !DILocation(line: 1581, column: 50, scope: !2088)
!2109 = !DILocation(line: 1581, column: 38, scope: !2088)
!2110 = !DILocation(line: 1581, column: 13, scope: !2088)
!2111 = !DILocation(line: 1582, column: 7, scope: !2112)
!2112 = distinct !DILexicalBlock(scope: !2088, file: !69, line: 1582, column: 7)
!2113 = !DILocation(line: 1582, column: 16, scope: !2112)
!2114 = !DILocation(line: 1582, column: 7, scope: !2088)
!2115 = !DILocation(line: 1584, column: 17, scope: !2116)
!2116 = distinct !DILexicalBlock(scope: !2112, file: !69, line: 1583, column: 4)
!2117 = !DILocation(line: 1584, column: 12, scope: !2116)
!2118 = !DILocation(line: 1584, column: 5, scope: !2116)
!2119 = !DILocation(line: 1588, column: 5, scope: !2120)
!2120 = distinct !DILexicalBlock(scope: !2112, file: !69, line: 1587, column: 4)
!2121 = !DILocation(line: 1592, column: 1, scope: !1992)
!2122 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2123, file: !2123, line: 12, type: !2124, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2127)
!2123 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2124 = !DISubroutineType(types: !2125)
!2125 = !{null, !2126}
!2126 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2127 = !{!2128}
!2128 = !DILocalVariable(name: "z", arg: 1, scope: !2122, file: !2123, line: 12, type: !2126)
!2129 = !DILocation(line: 0, scope: !2122)
!2130 = !DILocation(line: 13, column: 9, scope: !2131)
!2131 = distinct !DILexicalBlock(scope: !2122, file: !2123, line: 13, column: 7)
!2132 = !DILocation(line: 13, column: 7, scope: !2122)
!2133 = !DILocation(line: 14, column: 5, scope: !2131)
!2134 = !DILocation(line: 15, column: 1, scope: !2122)
!2135 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2136, file: !2136, line: 20, type: !2137, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2140)
!2136 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2137 = !DISubroutineType(types: !2138)
!2138 = !{null, !2139, !2139}
!2139 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2140 = !{!2141, !2142}
!2141 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2135, file: !2136, line: 20, type: !2139)
!2142 = !DILocalVariable(name: "shift", arg: 2, scope: !2135, file: !2136, line: 20, type: !2139)
!2143 = !DILocation(line: 0, scope: !2135)
!2144 = !DILocation(line: 21, column: 13, scope: !2145)
!2145 = distinct !DILexicalBlock(scope: !2135, file: !2136, line: 21, column: 7)
!2146 = !DILocation(line: 21, column: 7, scope: !2135)
!2147 = !DILocation(line: 27, column: 5, scope: !2148)
!2148 = distinct !DILexicalBlock(scope: !2145, file: !2136, line: 21, column: 26)
!2149 = !DILocation(line: 29, column: 1, scope: !2135)
