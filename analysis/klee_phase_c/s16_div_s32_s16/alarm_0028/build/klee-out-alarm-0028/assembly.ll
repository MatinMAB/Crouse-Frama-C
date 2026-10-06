; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0028/build/s16_div_s32_s16_alarm_0028.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [65 x i8] c"KLEE-ALARM-0028: division by zero. assert (s32)denominator != 0;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0028.err\00", align 1
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
  br i1 %cmp6, label %if.then8, label %if.else59, !dbg !216

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
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 299, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !295
  unreachable, !dbg !295

if.end55:                                         ; preds = %if.end45
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !297
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !298
  %conv56 = sext i16 %25 to i32, !dbg !298
  %int_cast_to_i645 = zext i32 %conv56 to i64, !dbg !299
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !299
  %div57 = sdiv i32 %24, %conv56, !dbg !299, !klee.check.div !106
  %conv58 = sext i32 %div57 to i64, !dbg !300
  store volatile i64 %conv58, i64* @klee_alarm_sink_s64, align 8, !dbg !301
  store i16 0, i16* %retval, align 2, !dbg !302
  br label %return, !dbg !302

if.else59:                                        ; preds = %if.else5
  %26 = load i16, i16* %denominator.addr, align 2, !dbg !303
  %conv60 = sext i16 %26 to i32, !dbg !303
  %cmp61 = icmp ne i32 %conv60, -1, !dbg !306
  br i1 %cmp61, label %if.then63, label %if.else83, !dbg !307

if.then63:                                        ; preds = %if.else59
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !308
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !310
  %29 = load i16, i16* %denominator.addr, align 2, !dbg !311
  %conv64 = sext i16 %29 to i32, !dbg !311
  %int_cast_to_i646 = zext i32 %conv64 to i64, !dbg !312
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !312
  %div65 = sdiv i32 %28, %conv64, !dbg !312, !klee.check.div !106
  %30 = load i16, i16* %denominator.addr, align 2, !dbg !313
  %conv66 = sext i16 %30 to i32, !dbg !313
  %mul67 = mul nsw i32 %div65, %conv66, !dbg !314
  %sub68 = sub nsw i32 %27, %mul67, !dbg !315
  %shl69 = shl i32 %sub68, 1, !dbg !316
  store i32 %shl69, i32* %s32Temp2, align 4, !dbg !317
  %31 = load i32, i32* %s32Temp2, align 4, !dbg !318
  %32 = load i16, i16* %denominator.addr, align 2, !dbg !319
  %conv70 = sext i16 %32 to i32, !dbg !319
  %int_cast_to_i647 = zext i32 %conv70 to i64, !dbg !320
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !320
  %div71 = sdiv i32 %31, %conv70, !dbg !320, !klee.check.div !106
  store i32 %div71, i32* %s32Temp1, align 4, !dbg !321
  %33 = load i32, i32* %s32Temp1, align 4, !dbg !322
  %34 = load i32, i32* %numerator.addr, align 4, !dbg !323
  %35 = load i16, i16* %denominator.addr, align 2, !dbg !324
  %conv72 = sext i16 %35 to i32, !dbg !324
  %int_cast_to_i648 = zext i32 %conv72 to i64, !dbg !325
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !325
  %div73 = sdiv i32 %34, %conv72, !dbg !325, !klee.check.div !106
  %add = add nsw i32 %33, %div73, !dbg !326
  store i32 %add, i32* %s32Temp1, align 4, !dbg !327
  %36 = load i32, i32* %s32Temp1, align 4, !dbg !328
  %cmp74 = icmp slt i32 %36, 32767, !dbg !330
  br i1 %cmp74, label %if.then76, label %if.else82, !dbg !331

if.then76:                                        ; preds = %if.then63
  %37 = load i32, i32* %s32Temp1, align 4, !dbg !332
  %cmp77 = icmp sgt i32 %37, -32768, !dbg !335
  br i1 %cmp77, label %if.then79, label %if.else81, !dbg !336

if.then79:                                        ; preds = %if.then76
  %38 = load i32, i32* %s32Temp1, align 4, !dbg !337
  %conv80 = trunc i32 %38 to i16, !dbg !339
  store i16 %conv80, i16* %retval, align 2, !dbg !340
  br label %return, !dbg !340

if.else81:                                        ; preds = %if.then76
  store i16 -32768, i16* %retval, align 2, !dbg !341
  br label %return, !dbg !341

if.else82:                                        ; preds = %if.then63
  store i16 32767, i16* %retval, align 2, !dbg !343
  br label %return, !dbg !343

if.else83:                                        ; preds = %if.else59
  store i16 32767, i16* %retval, align 2, !dbg !345
  br label %return, !dbg !345

return:                                           ; preds = %if.else83, %if.else82, %if.else81, %if.then79, %if.end55, %if.then44, %if.then35, %if.then26, %if.then16, %if.then10, %if.else, %if.then4
  %39 = load i16, i16* %retval, align 2, !dbg !347
  ret i16 %39, !dbg !347
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !348 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !351, metadata !DIExpression()), !dbg !352
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !353
  %cmp = icmp ne i64 %0, 0, !dbg !354
  %conv = zext i1 %cmp to i32, !dbg !354
  ret i32 %conv, !dbg !355
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !356 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !357, metadata !DIExpression()), !dbg !358
  %0 = load i64, i64* %left.addr, align 8, !dbg !359
  %cmp = icmp sge i64 %0, 0, !dbg !360
  %conv = zext i1 %cmp to i32, !dbg !360
  ret i32 %conv, !dbg !361
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !362 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !365, metadata !DIExpression()), !dbg !366
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !367, metadata !DIExpression()), !dbg !368
  %0 = load i32, i32* %count.addr, align 4, !dbg !369
  %cmp = icmp uge i32 %0, 63, !dbg !371
  br i1 %cmp, label %if.then, label %if.end, !dbg !372

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !373
  br label %return, !dbg !373

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !375
  %2 = load i32, i32* %count.addr, align 4, !dbg !376
  %sh_prom = zext i32 %2 to i64, !dbg !377
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !377
  %shl = shl i64 1, %sh_prom, !dbg !377, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !378
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !379
  %conv = zext i1 %cmp1 to i32, !dbg !379
  store i32 %conv, i32* %retval, align 4, !dbg !380
  br label %return, !dbg !380

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !381
  ret i32 %3, !dbg !381
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !382 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !385, metadata !DIExpression()), !dbg !386
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !387, metadata !DIExpression()), !dbg !388
  %0 = load i64, i64* %left.addr, align 8, !dbg !389
  %1 = load i64, i64* %right.addr, align 8, !dbg !390
  %mul = mul nsw i64 %0, %1, !dbg !391
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !392
  %conv = zext i1 %cmp to i32, !dbg !392
  ret i32 %conv, !dbg !393
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !394 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !395, metadata !DIExpression()), !dbg !396
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !397, metadata !DIExpression()), !dbg !398
  %0 = load i64, i64* %left.addr, align 8, !dbg !399
  %1 = load i64, i64* %right.addr, align 8, !dbg !400
  %mul = mul nsw i64 %0, %1, !dbg !401
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !402
  %conv = zext i1 %cmp to i32, !dbg !402
  ret i32 %conv, !dbg !403
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !404 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !407, metadata !DIExpression()), !dbg !408
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !409, metadata !DIExpression()), !dbg !410
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !411, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !413, metadata !DIExpression()), !dbg !414
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !415, metadata !DIExpression()), !dbg !416
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !417
  %conv = zext i16 %0 to i32, !dbg !417
  %and = and i32 %conv, 65535, !dbg !418
  %conv1 = trunc i32 %and to i16, !dbg !417
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !419
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !420
  %conv2 = sext i16 %1 to i32, !dbg !420
  %shl = shl i32 %conv2, 16, !dbg !421
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !422
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !423
  %conv3 = zext i16 %2 to i32, !dbg !423
  %cmp = icmp eq i32 %conv3, 0, !dbg !425
  br i1 %cmp, label %if.then, label %if.else9, !dbg !426

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !427
  %conv5 = sext i16 %3 to i32, !dbg !427
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !430
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !431

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !432
  br label %return, !dbg !432

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !434
  br label %return, !dbg !434

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !436
  %conv10 = sext i16 %4 to i32, !dbg !436
  %shl11 = shl i32 %conv10, 16, !dbg !438
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !439
  %conv12 = sext i16 %5 to i32, !dbg !439
  %shl13 = shl i32 %conv12, 16, !dbg !440
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !441
  %conv14 = zext i16 %6 to i32, !dbg !441
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !442
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !442
  %div = sdiv i32 %shl13, %conv14, !dbg !442, !klee.check.div !106
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !443
  %conv15 = zext i16 %7 to i32, !dbg !443
  %mul = mul nsw i32 %div, %conv15, !dbg !444
  %sub = sub nsw i32 %shl11, %mul, !dbg !445
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !446
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !447
  %shl16 = shl i32 %8, 1, !dbg !448
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !449
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !450
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !451
  %conv17 = zext i16 %10 to i32, !dbg !451
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !452
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !452
  %div18 = sdiv i32 %9, %conv17, !dbg !452, !klee.check.div !106
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !453
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !454
  %conv19 = sext i16 %11 to i32, !dbg !454
  %shl20 = shl i32 %conv19, 16, !dbg !455
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !456
  %conv21 = zext i16 %12 to i32, !dbg !456
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !457
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !457
  %div22 = sdiv i32 %shl20, %conv21, !dbg !457, !klee.check.div !106
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !458
  %add = add nsw i32 %div22, %13, !dbg !459
  store i32 %add, i32* %s32Temp1, align 4, !dbg !460
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !461
  %cmp23 = icmp slt i32 %14, 32767, !dbg !463
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !464

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !465
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !468
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !469

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !470
  %conv29 = trunc i32 %16 to i16, !dbg !472
  store i16 %conv29, i16* %retval, align 2, !dbg !473
  br label %return, !dbg !473

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !474
  br label %return, !dbg !474

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !476
  br label %return, !dbg !476

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !478
  ret i16 %17, !dbg !478
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !479 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !480, metadata !DIExpression()), !dbg !481
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !482, metadata !DIExpression()), !dbg !483
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !484, metadata !DIExpression()), !dbg !485
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !486, metadata !DIExpression()), !dbg !487
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !488
  %conv = zext i16 %0 to i32, !dbg !488
  %and = and i32 %conv, 65535, !dbg !489
  %conv1 = trunc i32 %and to i16, !dbg !488
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !490
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !491
  %conv2 = zext i16 %1 to i32, !dbg !491
  %cmp = icmp eq i32 %conv2, 0, !dbg !493
  br i1 %cmp, label %if.then, label %if.else8, !dbg !494

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !495
  %conv4 = sext i16 %2 to i32, !dbg !495
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !498
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !499

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !500
  br label %return, !dbg !500

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !502
  br label %return, !dbg !502

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !504
  %conv9 = sext i16 %3 to i32, !dbg !504
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !506
  %conv10 = sext i16 %4 to i32, !dbg !506
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !507
  %conv11 = zext i16 %5 to i32, !dbg !507
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !508
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !508
  %div = sdiv i32 %conv10, %conv11, !dbg !508, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !509
  %conv12 = zext i16 %6 to i32, !dbg !509
  %mul = mul nsw i32 %div, %conv12, !dbg !510
  %sub = sub nsw i32 %conv9, %mul, !dbg !511
  %shl = shl i32 %sub, 1, !dbg !512
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !513
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !514
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !515
  %conv13 = zext i16 %8 to i32, !dbg !515
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !516
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !516
  %div14 = sdiv i32 %7, %conv13, !dbg !516, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !517
  %conv15 = sext i16 %9 to i32, !dbg !517
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !518
  %conv16 = zext i16 %10 to i32, !dbg !518
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !519
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !519
  %div17 = sdiv i32 %conv15, %conv16, !dbg !519, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !520
  store i32 %add, i32* %s32Temp1, align 4, !dbg !521
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !522
  %conv18 = trunc i32 %11 to i16, !dbg !522
  store i16 %conv18, i16* %retval, align 2, !dbg !523
  br label %return, !dbg !523

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !524
  ret i16 %12, !dbg !524
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !525 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !528, metadata !DIExpression()), !dbg !529
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !530, metadata !DIExpression()), !dbg !531
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !532, metadata !DIExpression()), !dbg !534
  store i32 0, i32* %u32Temp1, align 4, !dbg !534
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !535, metadata !DIExpression()), !dbg !536
  store i32 0, i32* %u32Temp2, align 4, !dbg !536
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !537, metadata !DIExpression()), !dbg !538
  store i32 0, i32* %u32Temp3, align 4, !dbg !538
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !539
  %conv = zext i16 %0 to i32, !dbg !539
  %cmp = icmp eq i32 %conv, 0, !dbg !541
  br i1 %cmp, label %if.then, label %if.else, !dbg !542

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !543
  br label %return, !dbg !543

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !545
  %conv2 = zext i16 %1 to i32, !dbg !545
  %shl = shl i32 %conv2, 16, !dbg !547
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !548
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !549
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !550
  %conv3 = zext i16 %3 to i32, !dbg !550
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !551
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !551
  %div = udiv i32 %2, %conv3, !dbg !551, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !552
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !553
  %add = add i32 %4, 128, !dbg !554
  %shr = lshr i32 %add, 8, !dbg !555
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !556
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !557
  %cmp4 = icmp ult i32 %5, 255, !dbg !559
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !560

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !561
  %conv7 = trunc i32 %6 to i8, !dbg !563
  store i8 %conv7, i8* %retval, align 1, !dbg !564
  br label %return, !dbg !564

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !565
  br label %return, !dbg !565

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !567
  ret i8 %7, !dbg !567
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !568 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !571, metadata !DIExpression()), !dbg !572
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !573, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !575, metadata !DIExpression()), !dbg !576
  store i32 0, i32* %s32Temp1, align 4, !dbg !576
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !577
  %conv = zext i16 %0 to i32, !dbg !577
  %and = and i32 %conv, 65535, !dbg !578
  %conv1 = trunc i32 %and to i16, !dbg !577
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !579
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !580
  %conv2 = zext i16 %1 to i32, !dbg !580
  %and3 = and i32 %conv2, 65535, !dbg !582
  %cmp = icmp eq i32 %and3, 0, !dbg !583
  br i1 %cmp, label %if.then, label %if.else8, !dbg !584

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !585
  %cmp5 = icmp sge i32 %2, 0, !dbg !588
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !589

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !590
  br label %return, !dbg !590

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !592
  br label %return, !dbg !592

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !594
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !596
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !597
  %conv9 = zext i16 %5 to i32, !dbg !597
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !598
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !598
  %div = sdiv i32 %4, %conv9, !dbg !598, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !599
  %conv10 = zext i16 %6 to i32, !dbg !599
  %mul = mul nsw i32 %div, %conv10, !dbg !600
  %sub = sub nsw i32 %3, %mul, !dbg !601
  %shl = shl i32 %sub, 1, !dbg !602
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !603
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !604
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !605
  %conv11 = zext i16 %8 to i32, !dbg !605
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !606
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !606
  %div12 = sdiv i32 %7, %conv11, !dbg !606, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !607
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !608
  %conv13 = zext i16 %10 to i32, !dbg !608
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !609
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !609
  %div14 = sdiv i32 %9, %conv13, !dbg !609, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !610
  store i32 %add, i32* %s32Temp1, align 4, !dbg !611
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !612
  %cmp15 = icmp slt i32 %11, 65535, !dbg !614
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !615

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !616
  %cmp18 = icmp sgt i32 %12, 0, !dbg !619
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !620

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !621
  %conv21 = trunc i32 %13 to i16, !dbg !623
  store i16 %conv21, i16* %retval, align 2, !dbg !624
  br label %return, !dbg !624

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !625
  br label %return, !dbg !625

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !627
  br label %return, !dbg !627

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !629
  ret i16 %14, !dbg !629
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !630 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !633, metadata !DIExpression()), !dbg !634
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !635, metadata !DIExpression()), !dbg !636
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !637, metadata !DIExpression()), !dbg !638
  store i32 0, i32* %u32Temp, align 4, !dbg !638
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !639
  %conv = zext i16 %0 to i32, !dbg !639
  %cmp = icmp eq i32 %conv, 0, !dbg !641
  br i1 %cmp, label %if.then, label %if.else, !dbg !642

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !643
  br label %return, !dbg !643

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !645
  %conv2 = zext i16 %1 to i32, !dbg !645
  %shl = shl i32 %conv2, 16, !dbg !647
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !648
  %conv3 = zext i16 %2 to i32, !dbg !648
  %shr = ashr i32 %conv3, 1, !dbg !649
  %add = add nsw i32 %shl, %shr, !dbg !650
  store i32 %add, i32* %u32Temp, align 4, !dbg !651
  %3 = load i32, i32* %u32Temp, align 4, !dbg !652
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !653
  %conv4 = zext i16 %4 to i32, !dbg !653
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !654
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !654
  %div = udiv i32 %3, %conv4, !dbg !654, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !655
  %5 = load i32, i32* %u32Temp, align 4, !dbg !656
  %cmp5 = icmp ult i32 %5, 65535, !dbg !658
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !659

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !660
  %and = and i32 %6, 65535, !dbg !662
  %conv8 = trunc i32 %and to i16, !dbg !660
  store i16 %conv8, i16* %retval, align 2, !dbg !663
  br label %return, !dbg !663

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !664
  br label %return, !dbg !664

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !666
  ret i16 %7, !dbg !666
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !667 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !670, metadata !DIExpression()), !dbg !671
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !672, metadata !DIExpression()), !dbg !673
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !674, metadata !DIExpression()), !dbg !675
  store i32 0, i32* %u32Temp1, align 4, !dbg !675
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !676, metadata !DIExpression()), !dbg !677
  store i32 0, i32* %u32Temp2, align 4, !dbg !677
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !678
  %conv = zext i16 %0 to i32, !dbg !678
  %and = and i32 %conv, 65535, !dbg !679
  %conv1 = trunc i32 %and to i16, !dbg !678
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !680
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !681
  %conv2 = zext i16 %1 to i32, !dbg !681
  %cmp = icmp eq i32 %conv2, 0, !dbg !683
  br i1 %cmp, label %if.then, label %if.else, !dbg !684

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !685
  br label %return, !dbg !685

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !687
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !689
  %conv4 = zext i16 %3 to i32, !dbg !689
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !690
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !690
  %div = udiv i32 %2, %conv4, !dbg !690, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !691
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !692
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !693
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !694
  %conv5 = zext i16 %6 to i32, !dbg !694
  %mul = mul i32 %5, %conv5, !dbg !695
  %sub = sub i32 %4, %mul, !dbg !696
  %shl = shl i32 %sub, 1, !dbg !697
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !698
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !699
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !700
  %conv6 = zext i16 %8 to i32, !dbg !700
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !701
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !701
  %div7 = udiv i32 %7, %conv6, !dbg !701, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !702
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !703
  %conv8 = zext i16 %10 to i32, !dbg !703
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !704
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !704
  %div9 = udiv i32 %9, %conv8, !dbg !704, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !705
  store i32 %add, i32* %u32Temp2, align 4, !dbg !706
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !707
  %cmp10 = icmp ult i32 %11, 65535, !dbg !709
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !710

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !711
  %and13 = and i32 %12, 65535, !dbg !713
  %conv14 = trunc i32 %and13 to i16, !dbg !711
  store i16 %conv14, i16* %retval, align 2, !dbg !714
  br label %return, !dbg !714

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !715
  br label %return, !dbg !715

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !717
  ret i16 %13, !dbg !717
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !718 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !721, metadata !DIExpression()), !dbg !722
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !723, metadata !DIExpression()), !dbg !724
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !725, metadata !DIExpression()), !dbg !726
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !727, metadata !DIExpression()), !dbg !728
  store i32 0, i32* %s32Result, align 4, !dbg !728
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !729, metadata !DIExpression()), !dbg !730
  store i32 0, i32* %s32Temp1, align 4, !dbg !730
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !731
  %conv = sext i16 %0 to i32, !dbg !731
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !732
  %conv1 = zext i16 %1 to i32, !dbg !732
  %mul = mul nsw i32 %conv, %conv1, !dbg !733
  store i32 %mul, i32* %s32Result, align 4, !dbg !734
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !735
  %conv2 = sext i16 %2 to i32, !dbg !735
  %cmp = icmp eq i32 %conv2, 0, !dbg !737
  br i1 %cmp, label %if.then, label %if.else7, !dbg !738

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !739
  %cmp4 = icmp slt i32 %3, 0, !dbg !742
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !743

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !744
  br label %return, !dbg !744

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !746
  br label %return, !dbg !746

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !748
  %5 = load i32, i32* %s32Result, align 4, !dbg !750
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !751
  %conv8 = sext i16 %6 to i32, !dbg !751
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !752
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !752
  %div = sdiv i32 %5, %conv8, !dbg !752, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !753
  %conv9 = sext i16 %7 to i32, !dbg !753
  %mul10 = mul nsw i32 %div, %conv9, !dbg !754
  %sub = sub nsw i32 %4, %mul10, !dbg !755
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !756
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !757
  %shl = shl i32 %8, 1, !dbg !758
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !759
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !760
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !761
  %conv11 = sext i16 %10 to i32, !dbg !761
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !762
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !762
  %div12 = sdiv i32 %9, %conv11, !dbg !762, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !763
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !764
  %conv13 = sext i16 %12 to i32, !dbg !764
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !765
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !765
  %div14 = sdiv i32 %11, %conv13, !dbg !765, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !766
  store i32 %add, i32* %s32Result, align 4, !dbg !767
  %13 = load i32, i32* %s32Result, align 4, !dbg !768
  %cmp15 = icmp slt i32 %13, 32767, !dbg !770
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !771

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !772
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !775
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !776

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !777
  %conv21 = trunc i32 %15 to i16, !dbg !779
  store i16 %conv21, i16* %retval, align 2, !dbg !780
  br label %return, !dbg !780

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !781
  br label %return, !dbg !781

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !783
  br label %return, !dbg !783

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !785
  ret i16 %16, !dbg !785
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !786 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !789, metadata !DIExpression()), !dbg !790
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !791, metadata !DIExpression()), !dbg !792
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !793, metadata !DIExpression()), !dbg !794
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !795, metadata !DIExpression()), !dbg !796
  store i32 0, i32* %s32Result, align 4, !dbg !796
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !797, metadata !DIExpression()), !dbg !798
  store i32 0, i32* %s32Temp1, align 4, !dbg !798
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !799
  %conv = zext i16 %0 to i32, !dbg !799
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !800
  %conv1 = sext i16 %1 to i32, !dbg !800
  %mul = mul nsw i32 %conv, %conv1, !dbg !801
  store i32 %mul, i32* %s32Result, align 4, !dbg !802
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !803
  %conv2 = zext i16 %2 to i32, !dbg !803
  %cmp = icmp eq i32 %conv2, 0, !dbg !805
  br i1 %cmp, label %if.then, label %if.else7, !dbg !806

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !807
  %cmp4 = icmp slt i32 %3, 0, !dbg !810
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !811

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !812
  br label %return, !dbg !812

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !814
  br label %return, !dbg !814

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !816
  %5 = load i32, i32* %s32Result, align 4, !dbg !818
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !819
  %conv8 = zext i16 %6 to i32, !dbg !819
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !820
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !820
  %div = sdiv i32 %5, %conv8, !dbg !820, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !821
  %conv9 = zext i16 %7 to i32, !dbg !821
  %mul10 = mul nsw i32 %div, %conv9, !dbg !822
  %sub = sub nsw i32 %4, %mul10, !dbg !823
  %shl = shl i32 %sub, 1, !dbg !824
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !825
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !826
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !827
  %conv11 = zext i16 %9 to i32, !dbg !827
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !828
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !828
  %div12 = sdiv i32 %8, %conv11, !dbg !828, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !829
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !830
  %conv13 = zext i16 %11 to i32, !dbg !830
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !831
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !831
  %div14 = sdiv i32 %10, %conv13, !dbg !831, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !832
  store i32 %add, i32* %s32Result, align 4, !dbg !833
  %12 = load i32, i32* %s32Result, align 4, !dbg !834
  %cmp15 = icmp slt i32 %12, 32767, !dbg !836
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !837

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !838
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !841
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !842

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !843
  %conv21 = trunc i32 %14 to i16, !dbg !845
  store i16 %conv21, i16* %retval, align 2, !dbg !846
  br label %return, !dbg !846

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !847
  br label %return, !dbg !847

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !849
  br label %return, !dbg !849

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !851
  ret i16 %15, !dbg !851
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !852 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !855, metadata !DIExpression()), !dbg !856
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !857, metadata !DIExpression()), !dbg !858
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !859, metadata !DIExpression()), !dbg !860
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !861, metadata !DIExpression()), !dbg !862
  store i32 0, i32* %u32Result, align 4, !dbg !862
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !863, metadata !DIExpression()), !dbg !864
  store i32 0, i32* %u32Temp1, align 4, !dbg !864
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !865, metadata !DIExpression()), !dbg !866
  store i32 0, i32* %s32Result, align 4, !dbg !866
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !867, metadata !DIExpression()), !dbg !868
  store i32 0, i32* %s32Temp1, align 4, !dbg !868
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !869
  %conv = sext i16 %0 to i32, !dbg !869
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !870
  %conv1 = zext i16 %1 to i32, !dbg !870
  %mul = mul nsw i32 %conv, %conv1, !dbg !871
  store i32 %mul, i32* %s32Result, align 4, !dbg !872
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !873
  %conv2 = sext i16 %2 to i32, !dbg !873
  %cmp = icmp eq i32 %conv2, 0, !dbg !875
  br i1 %cmp, label %if.then, label %if.else7, !dbg !876

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !877
  %cmp4 = icmp sge i32 %3, 0, !dbg !880
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !881

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !882
  br label %return, !dbg !882

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !884
  br label %return, !dbg !884

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !886
  %5 = load i32, i32* %s32Result, align 4, !dbg !888
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !889
  %conv8 = sext i16 %6 to i32, !dbg !889
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !890
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !890
  %div = sdiv i32 %5, %conv8, !dbg !890, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !891
  %conv9 = sext i16 %7 to i32, !dbg !891
  %mul10 = mul nsw i32 %div, %conv9, !dbg !892
  %sub = sub nsw i32 %4, %mul10, !dbg !893
  %shl = shl i32 %sub, 1, !dbg !894
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !895
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !896
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !897
  %conv11 = sext i16 %9 to i32, !dbg !897
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !898
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !898
  %div12 = sdiv i32 %8, %conv11, !dbg !898, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !899
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !900
  %conv13 = sext i16 %11 to i32, !dbg !900
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !901
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !901
  %div14 = sdiv i32 %10, %conv13, !dbg !901, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !902
  store i32 %add, i32* %s32Result, align 4, !dbg !903
  %12 = load i32, i32* %s32Result, align 4, !dbg !904
  %cmp15 = icmp slt i32 %12, 65535, !dbg !906
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !907

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !908
  %cmp18 = icmp sgt i32 %13, 0, !dbg !911
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !912

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !913
  %conv21 = trunc i32 %14 to i16, !dbg !915
  store i16 %conv21, i16* %retval, align 2, !dbg !916
  br label %return, !dbg !916

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !917
  br label %return, !dbg !917

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !919
  br label %return, !dbg !919

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !921
  ret i16 %15, !dbg !921
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !922 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !925, metadata !DIExpression()), !dbg !926
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !927, metadata !DIExpression()), !dbg !928
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !929, metadata !DIExpression()), !dbg !930
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !931, metadata !DIExpression()), !dbg !932
  store i32 0, i32* %s32Result, align 4, !dbg !932
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !933, metadata !DIExpression()), !dbg !934
  store i32 0, i32* %s32Temp1, align 4, !dbg !934
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !935
  %conv = sext i16 %0 to i32, !dbg !935
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !936
  %conv1 = zext i16 %1 to i32, !dbg !936
  %mul = mul nsw i32 %conv, %conv1, !dbg !937
  store i32 %mul, i32* %s32Result, align 4, !dbg !938
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !939
  %conv2 = zext i16 %2 to i32, !dbg !939
  %cmp = icmp eq i32 %conv2, 0, !dbg !941
  br i1 %cmp, label %if.then, label %if.else7, !dbg !942

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !943
  %cmp4 = icmp sge i32 %3, 0, !dbg !946
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !947

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !948
  br label %return, !dbg !948

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !950
  br label %return, !dbg !950

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !952
  %5 = load i32, i32* %s32Result, align 4, !dbg !954
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !955
  %conv8 = zext i16 %6 to i32, !dbg !955
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !956
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !956
  %div = sdiv i32 %5, %conv8, !dbg !956, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !957
  %conv9 = zext i16 %7 to i32, !dbg !957
  %mul10 = mul nsw i32 %div, %conv9, !dbg !958
  %sub = sub nsw i32 %4, %mul10, !dbg !959
  %shl = shl i32 %sub, 1, !dbg !960
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !961
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !962
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !963
  %conv11 = zext i16 %9 to i32, !dbg !963
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !964
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !964
  %div12 = sdiv i32 %8, %conv11, !dbg !964, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !965
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !966
  %conv13 = zext i16 %11 to i32, !dbg !966
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !967
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !967
  %div14 = sdiv i32 %10, %conv13, !dbg !967, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !968
  store i32 %add, i32* %s32Result, align 4, !dbg !969
  %12 = load i32, i32* %s32Result, align 4, !dbg !970
  %cmp15 = icmp slt i32 %12, 65535, !dbg !972
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !973

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !974
  %cmp18 = icmp sgt i32 %13, 0, !dbg !977
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !978

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !979
  %conv21 = trunc i32 %14 to i16, !dbg !981
  store i16 %conv21, i16* %retval, align 2, !dbg !982
  br label %return, !dbg !982

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !983
  br label %return, !dbg !983

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !985
  br label %return, !dbg !985

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !987
  ret i16 %15, !dbg !987
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !988 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !991, metadata !DIExpression()), !dbg !992
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !993, metadata !DIExpression()), !dbg !994
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !995, metadata !DIExpression()), !dbg !996
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !997, metadata !DIExpression()), !dbg !998
  store i32 0, i32* %u32Temp1, align 4, !dbg !998
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !999, metadata !DIExpression()), !dbg !1000
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1000
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1001
  %conv = zext i16 %0 to i32, !dbg !1001
  %cmp = icmp eq i32 %conv, 0, !dbg !1003
  br i1 %cmp, label %if.then, label %if.else, !dbg !1004

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1005
  br label %return, !dbg !1005

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1007
  %conv2 = zext i16 %1 to i32, !dbg !1007
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1009
  %conv3 = zext i16 %2 to i32, !dbg !1009
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1010
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1011
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1012
  %conv4 = zext i16 %3 to i32, !dbg !1012
  %shr = ashr i32 %conv4, 1, !dbg !1013
  %conv5 = trunc i32 %shr to i16, !dbg !1012
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1014
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1015
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1016
  %conv6 = zext i16 %5 to i32, !dbg !1016
  %add = add i32 %4, %conv6, !dbg !1017
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1018
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1019
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1020
  %conv7 = zext i16 %7 to i32, !dbg !1020
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1021
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1021
  %div = udiv i32 %6, %conv7, !dbg !1021, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1022
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1023
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1025
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1026

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1027
  %and = and i32 %9, 65535, !dbg !1029
  %conv11 = trunc i32 %and to i16, !dbg !1030
  store i16 %conv11, i16* %retval, align 2, !dbg !1031
  br label %return, !dbg !1031

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1032
  br label %return, !dbg !1032

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1034
  ret i16 %10, !dbg !1034
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1035 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1038, metadata !DIExpression()), !dbg !1039
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1040, metadata !DIExpression()), !dbg !1041
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1042, metadata !DIExpression()), !dbg !1043
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1044, metadata !DIExpression()), !dbg !1045
  store i32 0, i32* %u32Temp1, align 4, !dbg !1045
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1046
  %cmp = icmp eq i32 %0, 0, !dbg !1048
  br i1 %cmp, label %if.then, label %if.else, !dbg !1049

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1050
  br label %return, !dbg !1050

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1052
  %conv = zext i16 %1 to i32, !dbg !1052
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1054
  %conv1 = zext i16 %2 to i32, !dbg !1054
  %mul = mul nsw i32 %conv, %conv1, !dbg !1055
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1056
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1057
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1057
  %div = udiv i32 %mul, %3, !dbg !1057, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1058
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1059
  %conv2 = zext i16 %4 to i32, !dbg !1059
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1061
  %conv3 = zext i16 %5 to i32, !dbg !1061
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1062
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1063
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1064
  %mul5 = mul i32 %6, %7, !dbg !1065
  %sub = sub i32 %mul4, %mul5, !dbg !1066
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1067
  %div6 = udiv i32 %8, 2, !dbg !1068
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1069
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1070

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1071
  %inc = add i32 %9, 1, !dbg !1071
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1071
  br label %if.end, !dbg !1073

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1074
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1076
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1077

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1078
  %and = and i32 %11, 65535, !dbg !1080
  %conv13 = trunc i32 %and to i16, !dbg !1081
  store i16 %conv13, i16* %retval, align 2, !dbg !1082
  br label %return, !dbg !1082

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1083
  br label %return, !dbg !1083

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1085
  ret i16 %12, !dbg !1085
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1086 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1089, metadata !DIExpression()), !dbg !1090
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1091, metadata !DIExpression()), !dbg !1092
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1093, metadata !DIExpression()), !dbg !1094
  store i32 0, i32* %u32Temp1, align 4, !dbg !1094
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1095
  %conv = zext i16 %0 to i32, !dbg !1095
  %cmp = icmp eq i32 %conv, 0, !dbg !1097
  br i1 %cmp, label %if.then, label %if.else, !dbg !1098

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1099
  br label %return, !dbg !1099

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1101
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1103
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1104
  %conv2 = zext i16 %3 to i32, !dbg !1104
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1105
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1105
  %div = udiv i32 %2, %conv2, !dbg !1105, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1106
  %conv3 = zext i16 %4 to i32, !dbg !1106
  %mul = mul i32 %div, %conv3, !dbg !1107
  %sub = sub i32 %1, %mul, !dbg !1108
  %shl = shl i32 %sub, 1, !dbg !1109
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1110
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1111
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1112
  %conv4 = zext i16 %6 to i32, !dbg !1112
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1113
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1113
  %div5 = udiv i32 %5, %conv4, !dbg !1113, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1114
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1115
  %conv6 = zext i16 %8 to i32, !dbg !1115
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1116
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1116
  %div7 = udiv i32 %7, %conv6, !dbg !1116, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1117
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1118
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1119
  store i32 %9, i32* %retval, align 4, !dbg !1120
  br label %return, !dbg !1120

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1121
  ret i32 %10, !dbg !1121
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1122 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1125, metadata !DIExpression()), !dbg !1126
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1127, metadata !DIExpression()), !dbg !1128
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1129, metadata !DIExpression()), !dbg !1130
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1131, metadata !DIExpression()), !dbg !1132
  store i32 0, i32* %s32Temp1, align 4, !dbg !1132
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1133, metadata !DIExpression()), !dbg !1134
  store i32 0, i32* %s32Temp2, align 4, !dbg !1134
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1135, metadata !DIExpression()), !dbg !1136
  store i32 0, i32* %s32Temp3, align 4, !dbg !1136
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1137
  %conv = sext i16 %0 to i32, !dbg !1137
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1138
  %conv1 = sext i16 %1 to i32, !dbg !1138
  %mul = mul nsw i32 %conv, %conv1, !dbg !1139
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1140
  %2 = load i16, i16* %div.addr, align 2, !dbg !1141
  %conv2 = sext i16 %2 to i32, !dbg !1141
  %cmp = icmp eq i32 %conv2, 0, !dbg !1143
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1144

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1145
  %cmp4 = icmp slt i32 %3, 0, !dbg !1148
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1149

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1150
  br label %return, !dbg !1150

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1152
  br label %return, !dbg !1152

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1154
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1156
  %6 = load i16, i16* %div.addr, align 2, !dbg !1157
  %conv8 = sext i16 %6 to i32, !dbg !1157
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1158
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1158
  %div9 = sdiv i32 %5, %conv8, !dbg !1158, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1159
  %conv10 = sext i16 %7 to i32, !dbg !1159
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1160
  %sub = sub nsw i32 %4, %mul11, !dbg !1161
  %shl = shl i32 %sub, 1, !dbg !1162
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1163
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1164
  %9 = load i16, i16* %div.addr, align 2, !dbg !1165
  %conv12 = sext i16 %9 to i32, !dbg !1165
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1166
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1166
  %div13 = sdiv i32 %8, %conv12, !dbg !1166, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1167
  %11 = load i16, i16* %div.addr, align 2, !dbg !1168
  %conv14 = sext i16 %11 to i32, !dbg !1168
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1169
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1169
  %div15 = sdiv i32 %10, %conv14, !dbg !1169, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1170
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1171
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1172
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1174
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1175

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1176
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1179
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1180

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1181
  %conv22 = trunc i32 %14 to i16, !dbg !1183
  store i16 %conv22, i16* %retval, align 2, !dbg !1184
  br label %return, !dbg !1184

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1185
  br label %return, !dbg !1185

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1187
  br label %return, !dbg !1187

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1189
  ret i16 %15, !dbg !1189
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1190 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1193, metadata !DIExpression()), !dbg !1194
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1195, metadata !DIExpression()), !dbg !1196
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1197, metadata !DIExpression()), !dbg !1198
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1199, metadata !DIExpression()), !dbg !1200
  store i32 0, i32* %s32Result, align 4, !dbg !1200
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1201, metadata !DIExpression()), !dbg !1202
  store i32 0, i32* %s32Temp1, align 4, !dbg !1202
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1203
  %conv = sext i16 %0 to i32, !dbg !1203
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1204
  %conv1 = sext i16 %1 to i32, !dbg !1204
  %mul = mul nsw i32 %conv, %conv1, !dbg !1205
  store i32 %mul, i32* %s32Result, align 4, !dbg !1206
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1207
  %conv2 = zext i16 %2 to i32, !dbg !1207
  %cmp = icmp eq i32 %conv2, 0, !dbg !1209
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1210

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1211
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1214
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1215

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1216
  br label %return, !dbg !1216

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1218
  %cmp7 = icmp eq i32 %4, 0, !dbg !1220
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1221

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1222
  br label %return, !dbg !1222

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1224
  br label %return, !dbg !1224

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1226
  %6 = load i32, i32* %s32Result, align 4, !dbg !1228
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1229
  %conv12 = zext i16 %7 to i32, !dbg !1229
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1230
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1230
  %div = sdiv i32 %6, %conv12, !dbg !1230, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1231
  %conv13 = zext i16 %8 to i32, !dbg !1231
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1232
  %sub = sub nsw i32 %5, %mul14, !dbg !1233
  %shl = shl i32 %sub, 1, !dbg !1234
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1235
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1236
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1237
  %conv15 = zext i16 %10 to i32, !dbg !1237
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1238
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1238
  %div16 = sdiv i32 %9, %conv15, !dbg !1238, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1239
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1240
  %conv17 = zext i16 %12 to i32, !dbg !1240
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1241
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1241
  %div18 = sdiv i32 %11, %conv17, !dbg !1241, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1242
  store i32 %add, i32* %s32Result, align 4, !dbg !1243
  %13 = load i32, i32* %s32Result, align 4, !dbg !1244
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1246
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1247

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1248
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1251
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1252

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1253
  %conv25 = trunc i32 %15 to i16, !dbg !1255
  store i16 %conv25, i16* %retval, align 2, !dbg !1256
  br label %return, !dbg !1256

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1257
  br label %return, !dbg !1257

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1259
  br label %return, !dbg !1259

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1261
  ret i16 %16, !dbg !1261
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1262 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1265, metadata !DIExpression()), !dbg !1266
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1267, metadata !DIExpression()), !dbg !1268
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1269, metadata !DIExpression()), !dbg !1270
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1271
  %cmp = icmp eq i32 %0, 0, !dbg !1273
  br i1 %cmp, label %if.then, label %if.else, !dbg !1274

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1275
  br label %return, !dbg !1275

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1277
  %cmp1 = icmp sle i32 %1, 0, !dbg !1280
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1281

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1282
  br label %return, !dbg !1282

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1284
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1286
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1287
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1288
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1288
  %div = udiv i32 %3, %4, !dbg !1288, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1289
  %mul = mul i32 %div, %5, !dbg !1290
  %sub = sub i32 %2, %mul, !dbg !1291
  %shl = shl i32 %sub, 1, !dbg !1292
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1293
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1294
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1295
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1296
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1296
  %div4 = udiv i32 %6, %7, !dbg !1296, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1297
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1298
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1299
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1299
  %div5 = udiv i32 %8, %9, !dbg !1299, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1300
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1301
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1302
  store i32 %10, i32* %retval, align 4, !dbg !1303
  br label %return, !dbg !1303

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1304
  ret i32 %11, !dbg !1304
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1305 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1308, metadata !DIExpression()), !dbg !1309
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1310, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1312, metadata !DIExpression()), !dbg !1313
  store i32 0, i32* %s32Temp1, align 4, !dbg !1313
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1314
  %cmp = icmp eq i32 %0, 0, !dbg !1316
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1317

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1318
  %cmp1 = icmp sge i32 %1, 0, !dbg !1321
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1322

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1323
  br label %return, !dbg !1323

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1325
  br label %return, !dbg !1325

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1327
  %cmp4 = icmp sge i32 %2, 0, !dbg !1330
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1331

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1332
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1334
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1335
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1336
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1336
  %div = udiv i32 %4, %5, !dbg !1336, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1337
  %mul = mul i32 %div, %6, !dbg !1338
  %sub = sub i32 %3, %mul, !dbg !1339
  %shl = shl i32 %sub, 1, !dbg !1340
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1341
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1342
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1343
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1344
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1344
  %div6 = udiv i32 %7, %8, !dbg !1344, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1345
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1346
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1347
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1347
  %div7 = udiv i32 %9, %10, !dbg !1347, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1348
  store i32 %add, i32* %retval, align 4, !dbg !1349
  br label %return, !dbg !1349

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1350
  br label %return, !dbg !1350

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1352
  ret i32 %11, !dbg !1352
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1353 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1356, metadata !DIExpression()), !dbg !1357
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1358, metadata !DIExpression()), !dbg !1359
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1360, metadata !DIExpression()), !dbg !1361
  store i32 0, i32* %u32Temp1, align 4, !dbg !1361
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1362, metadata !DIExpression()), !dbg !1363
  store i32 0, i32* %u32Temp2, align 4, !dbg !1363
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1364
  %cmp = icmp eq i32 %0, 0, !dbg !1366
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1367

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1368
  %cmp1 = icmp slt i32 %1, 0, !dbg !1371
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1372

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1373
  br label %return, !dbg !1373

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1375
  br label %return, !dbg !1375

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1377
  %cmp4 = icmp sge i32 %2, 0, !dbg !1380
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1381

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1382
  %cmp6 = icmp eq i32 %3, 0, !dbg !1385
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1386

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1387
  br label %return, !dbg !1387

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1389
  %cmp9 = icmp sle i32 %4, 0, !dbg !1392
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1393

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1394
  br label %return, !dbg !1394

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1396
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1398
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1399
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1400
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1400
  %div = sdiv i32 %6, %7, !dbg !1400, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1401
  %mul = mul nsw i32 %div, %8, !dbg !1402
  %sub = sub nsw i32 %5, %mul, !dbg !1403
  %shl = shl i32 %sub, 1, !dbg !1404
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1405
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1406
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1407
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1408
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1408
  %div12 = udiv i32 %9, %10, !dbg !1408, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1409
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1410
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1411
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1411
  %div13 = sdiv i32 %11, %12, !dbg !1411, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1412
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1413
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1414
  store i32 %13, i32* %retval, align 4, !dbg !1415
  br label %return, !dbg !1415

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1416
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1419
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1420

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1421
  br label %return, !dbg !1421

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1423
  %sub18 = sub nsw i32 0, %15, !dbg !1425
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1426
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1427
  %sub19 = sub nsw i32 0, %16, !dbg !1428
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1429
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1430
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1431
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1432
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1433
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1433
  %div20 = sdiv i32 %18, %19, !dbg !1433, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1434
  %mul21 = mul nsw i32 %div20, %20, !dbg !1435
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1436
  %shl23 = shl i32 %sub22, 1, !dbg !1437
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1438
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1439
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1440
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1441
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1441
  %div24 = udiv i32 %21, %22, !dbg !1441, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1442
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1443
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1444
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1444
  %div25 = sdiv i32 %23, %24, !dbg !1444, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1445
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1446
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1447
  store i32 %25, i32* %retval, align 4, !dbg !1448
  br label %return, !dbg !1448

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1449
  ret i32 %26, !dbg !1449
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1450 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1453, metadata !DIExpression()), !dbg !1454
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1455, metadata !DIExpression()), !dbg !1456
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1457, metadata !DIExpression()), !dbg !1458
  store i32 0, i32* %u32Temp1, align 4, !dbg !1458
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1459, metadata !DIExpression()), !dbg !1460
  store i32 0, i32* %u32Temp2, align 4, !dbg !1460
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1461, metadata !DIExpression()), !dbg !1462
  store i32 0, i32* %u32Temp3, align 4, !dbg !1462
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1463, metadata !DIExpression()), !dbg !1464
  store i32 0, i32* %numerator_old, align 4, !dbg !1464
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1465
  %cmp = icmp eq i32 %0, 0, !dbg !1467
  br i1 %cmp, label %if.then, label %if.else, !dbg !1468

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1469
  br label %return, !dbg !1469

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1471
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1473
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1474
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1475
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1476
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1476
  %div = udiv i32 %3, %4, !dbg !1476, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1477
  %sub = sub i32 %1, %mul, !dbg !1478
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1479
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1480
  %and = and i32 %5, 1, !dbg !1482
  %cmp1 = icmp eq i32 %and, 0, !dbg !1483
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1484

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1485
  %shr = lshr i32 %6, 1, !dbg !1487
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1488
  br label %if.end, !dbg !1489

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1490
  %shr4 = lshr i32 %7, 1, !dbg !1492
  %add = add i32 %shr4, 1, !dbg !1493
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1494
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1495
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1497
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1498
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1499

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1500
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1502
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1503
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1503
  %div7 = udiv i32 %10, %11, !dbg !1503, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1504
  br label %return, !dbg !1504

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1505
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1507
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1508
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1508
  %div9 = udiv i32 %12, %13, !dbg !1508, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1509
  store i32 %add10, i32* %retval, align 4, !dbg !1510
  br label %return, !dbg !1510

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1511
  ret i32 %14, !dbg !1511
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1512 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1515, metadata !DIExpression()), !dbg !1516
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1517, metadata !DIExpression()), !dbg !1518
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1519, metadata !DIExpression()), !dbg !1520
  store i32 0, i32* %u32Temp1, align 4, !dbg !1520
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1521, metadata !DIExpression()), !dbg !1522
  store i32 0, i32* %u32Temp2, align 4, !dbg !1522
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1523
  %cmp = icmp sle i32 %0, 0, !dbg !1525
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1526

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1527
  %cmp1 = icmp sge i32 %1, 0, !dbg !1530
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1531

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1532
  br label %return, !dbg !1532

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1534
  %sub = sub nsw i32 0, %2, !dbg !1536
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1537
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1538
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1539
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1540
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1541
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1541
  %div = udiv i32 %4, %5, !dbg !1541, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1542
  %mul = mul i32 %div, %6, !dbg !1543
  %sub3 = sub i32 %3, %mul, !dbg !1544
  %shl = shl i32 %sub3, 1, !dbg !1545
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1546
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1547
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1548
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1549
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1549
  %div4 = udiv i32 %7, %8, !dbg !1549, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1550
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1551
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1552
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1552
  %div5 = udiv i32 %9, %10, !dbg !1552, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1553
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1554
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1555
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1557
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1558

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1559
  %sub8 = sub i32 0, %12, !dbg !1561
  store i32 %sub8, i32* %retval, align 4, !dbg !1562
  br label %return, !dbg !1562

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1563
  br label %return, !dbg !1563

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1565
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1567
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1568
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1569
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1569
  %div11 = udiv i32 %14, %15, !dbg !1569, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1570
  %mul12 = mul i32 %div11, %16, !dbg !1571
  %sub13 = sub i32 %13, %mul12, !dbg !1572
  %shl14 = shl i32 %sub13, 1, !dbg !1573
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1574
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1575
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1576
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1577
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1577
  %div15 = udiv i32 %17, %18, !dbg !1577, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1578
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1579
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1580
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1580
  %div16 = udiv i32 %19, %20, !dbg !1580, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1581
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1582
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1583
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1585
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1586

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1587
  store i32 %22, i32* %retval, align 4, !dbg !1589
  br label %return, !dbg !1589

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1590
  br label %return, !dbg !1590

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1592
  ret i32 %23, !dbg !1592
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1593 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1596, metadata !DIExpression()), !dbg !1597
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1598, metadata !DIExpression()), !dbg !1599
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1600, metadata !DIExpression()), !dbg !1601
  store i32 0, i32* %s32Temp1, align 4, !dbg !1601
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1602, metadata !DIExpression()), !dbg !1603
  store i32 0, i32* %s32Temp2, align 4, !dbg !1603
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1604, metadata !DIExpression()), !dbg !1605
  store i32 0, i32* %u32Temp0, align 4, !dbg !1605
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1606, metadata !DIExpression()), !dbg !1607
  store i32 0, i32* %u32Temp1, align 4, !dbg !1607
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1608, metadata !DIExpression()), !dbg !1609
  store i32 0, i32* %u32Temp2, align 4, !dbg !1609
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1610
  %cmp = icmp eq i32 %0, 0, !dbg !1612
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1613

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1614
  %cmp1 = icmp slt i32 %1, 0, !dbg !1617
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1618

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1619
  br label %return, !dbg !1619

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1621
  br label %return, !dbg !1621

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1623
  %cmp4 = icmp sle i32 %2, 0, !dbg !1626
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1627

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1628
  %sub = sub nsw i32 0, %3, !dbg !1630
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1631
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1632
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1633
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1634
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1634
  %div = udiv i32 %4, %5, !dbg !1634, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1635
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1636
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1637
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1638
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1639
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1639
  %div6 = udiv i32 %7, %8, !dbg !1639, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1640
  %mul = mul i32 %div6, %9, !dbg !1641
  %sub7 = sub i32 %6, %mul, !dbg !1642
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1643
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1644
  %and = and i32 %10, 1, !dbg !1646
  %cmp8 = icmp eq i32 %and, 0, !dbg !1647
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1648

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1649
  %shr = lshr i32 %11, 1, !dbg !1651
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1652
  br label %if.end, !dbg !1653

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1654
  %shr11 = lshr i32 %12, 1, !dbg !1656
  %add = add i32 %shr11, 1, !dbg !1657
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1658
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1659
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1661
  %cmp12 = icmp ult i32 %13, %14, !dbg !1662
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1663

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1664
  %neg = xor i32 %15, -1, !dbg !1666
  %add14 = add i32 %neg, 1, !dbg !1667
  store i32 %add14, i32* %retval, align 4, !dbg !1668
  br label %return, !dbg !1668

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1669
  %add16 = add i32 %16, 1, !dbg !1671
  %neg17 = xor i32 %add16, -1, !dbg !1672
  %add18 = add i32 %neg17, 1, !dbg !1673
  store i32 %add18, i32* %retval, align 4, !dbg !1674
  br label %return, !dbg !1674

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1675
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1677
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1678
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1679
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1679
  %div20 = udiv i32 %18, %19, !dbg !1679, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1680
  %mul21 = mul i32 %div20, %20, !dbg !1681
  %sub22 = sub i32 %17, %mul21, !dbg !1682
  %shl = shl i32 %sub22, 1, !dbg !1683
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1684
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1685
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1686
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1687
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1687
  %div23 = udiv i32 %21, %22, !dbg !1687, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1688
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1689
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1690
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1690
  %div24 = udiv i32 %23, %24, !dbg !1690, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1691
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1692
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1693
  store i32 %25, i32* %retval, align 4, !dbg !1694
  br label %return, !dbg !1694

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1695
  ret i32 %26, !dbg !1695
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1696 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1699, metadata !DIExpression()), !dbg !1700
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1701, metadata !DIExpression()), !dbg !1702
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1703, metadata !DIExpression()), !dbg !1704
  store i32 0, i32* %s32Temp1, align 4, !dbg !1704
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1705, metadata !DIExpression()), !dbg !1706
  store i32 0, i32* %s32Temp2, align 4, !dbg !1706
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1707, metadata !DIExpression()), !dbg !1708
  store i32 0, i32* %denominator_prime, align 4, !dbg !1708
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1709, metadata !DIExpression()), !dbg !1710
  store i32 0, i32* %u32Temp1, align 4, !dbg !1710
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1711, metadata !DIExpression()), !dbg !1712
  store i32 0, i32* %u32Temp2, align 4, !dbg !1712
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1713, metadata !DIExpression()), !dbg !1714
  store i32 0, i32* %u32numerator, align 4, !dbg !1714
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1715, metadata !DIExpression()), !dbg !1716
  store i32 0, i32* %u32denominator, align 4, !dbg !1716
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1717
  %cmp = icmp slt i32 %0, 0, !dbg !1719
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1720

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1721
  %cmp1 = icmp sle i32 %1, 0, !dbg !1724
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1725

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1726
  %cmp3 = icmp sge i32 %2, 0, !dbg !1729
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1730

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1731
  br label %return, !dbg !1731

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1733
  %sub = sub nsw i32 0, %3, !dbg !1735
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1736
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1737
  %sub5 = sub nsw i32 0, %4, !dbg !1738
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1739
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1740
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1741
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1742
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1743
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1743
  %div = udiv i32 %6, %7, !dbg !1743, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1744
  %mul = mul i32 %div, %8, !dbg !1745
  %sub6 = sub i32 %5, %mul, !dbg !1746
  %shl = shl i32 %sub6, 1, !dbg !1747
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1748
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1749
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1750
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1751
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1751
  %div7 = udiv i32 %9, %10, !dbg !1751, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1752
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1753
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1754
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1754
  %div8 = udiv i32 %11, %12, !dbg !1754, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1755
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1756
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1757
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1759
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1760

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1761
  store i32 %14, i32* %retval, align 4, !dbg !1763
  br label %return, !dbg !1763

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1764
  br label %return, !dbg !1764

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1766
  %neg = xor i32 %15, -1, !dbg !1768
  %add13 = add nsw i32 %neg, 1, !dbg !1769
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1770
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1771
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1772
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1773
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1774
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1774
  %div14 = udiv i32 %17, %18, !dbg !1774, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1775
  %mul15 = mul i32 %div14, %19, !dbg !1776
  %sub16 = sub i32 %16, %mul15, !dbg !1777
  %shl17 = shl i32 %sub16, 1, !dbg !1778
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1779
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1780
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1781
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1782
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1782
  %div18 = udiv i32 %20, %21, !dbg !1782, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1783
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1784
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1785
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1785
  %div19 = sdiv i32 %22, %23, !dbg !1785, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1786
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1787
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1788
  %neg21 = xor i32 %24, -1, !dbg !1789
  %add22 = add nsw i32 %neg21, 1, !dbg !1790
  store i32 %add22, i32* %retval, align 4, !dbg !1791
  br label %return, !dbg !1791

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1792
  %cmp24 = icmp sle i32 %25, 0, !dbg !1795
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1796

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1797
  %cmp26 = icmp sge i32 %26, 0, !dbg !1800
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1801

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1802
  br label %return, !dbg !1802

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1804
  %neg29 = xor i32 %27, -1, !dbg !1806
  %add30 = add nsw i32 %neg29, 1, !dbg !1807
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1808
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1809
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1810
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1811
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1812
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1812
  %div31 = udiv i32 %29, %30, !dbg !1812, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1813
  %mul32 = mul i32 %div31, %31, !dbg !1814
  %sub33 = sub i32 %28, %mul32, !dbg !1815
  %shl34 = shl i32 %sub33, 1, !dbg !1816
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1817
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1818
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1819
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1820
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1820
  %div35 = udiv i32 %32, %33, !dbg !1820, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1821
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1822
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1823
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1823
  %div36 = udiv i32 %34, %35, !dbg !1823, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1824
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1825
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1826
  %neg38 = xor i32 %36, -1, !dbg !1827
  %add39 = add nsw i32 %neg38, 1, !dbg !1828
  store i32 %add39, i32* %retval, align 4, !dbg !1829
  br label %return, !dbg !1829

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1830
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1832
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1833
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1834
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1834
  %div41 = sdiv i32 %38, %39, !dbg !1834, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1835
  %mul42 = mul nsw i32 %div41, %40, !dbg !1836
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1837
  %shl44 = shl i32 %sub43, 1, !dbg !1838
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1839
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1840
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1841
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1842
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1842
  %div45 = sdiv i32 %41, %42, !dbg !1842, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1843
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1844
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1845
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1845
  %div46 = udiv i32 %43, %44, !dbg !1845, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1846
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1847
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1848
  store i32 %45, i32* %retval, align 4, !dbg !1849
  br label %return, !dbg !1849

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1850
  ret i32 %46, !dbg !1850
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1851 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1854, metadata !DIExpression()), !dbg !1855
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1856, metadata !DIExpression()), !dbg !1857
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1858, metadata !DIExpression()), !dbg !1859
  store i32 0, i32* %numerator_prime, align 4, !dbg !1859
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1860, metadata !DIExpression()), !dbg !1861
  store i32 0, i32* %u32Temp1, align 4, !dbg !1861
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1862, metadata !DIExpression()), !dbg !1863
  store i32 0, i32* %u32Temp2, align 4, !dbg !1863
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1864, metadata !DIExpression()), !dbg !1865
  store i32 0, i32* %u32Temp3, align 4, !dbg !1865
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1866, metadata !DIExpression()), !dbg !1867
  store i32 0, i32* %s32Temp1, align 4, !dbg !1867
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1868, metadata !DIExpression()), !dbg !1869
  store i32 0, i32* %s32Temp2, align 4, !dbg !1869
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1870, metadata !DIExpression()), !dbg !1871
  store i32 0, i32* %s32Temp3, align 4, !dbg !1871
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1872
  %cmp = icmp eq i32 %0, 0, !dbg !1874
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1875

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1876
  %cmp1 = icmp slt i32 %1, 0, !dbg !1879
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1880

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1881
  br label %return, !dbg !1881

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1883
  br label %return, !dbg !1883

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1885
  %cmp4 = icmp slt i32 %2, 0, !dbg !1888
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1889

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1890
  %sub = sub nsw i32 0, %3, !dbg !1892
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1893
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1894
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1895
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1896
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1896
  %div = udiv i32 %4, %5, !dbg !1896, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1897
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1898
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1899
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1900
  %mul = mul i32 %7, %8, !dbg !1901
  %sub6 = sub i32 %6, %mul, !dbg !1902
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1903
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1904
  %and = and i32 %9, 1, !dbg !1906
  %cmp7 = icmp eq i32 %and, 0, !dbg !1907
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1908

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1909
  %shr = lshr i32 %10, 1, !dbg !1911
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1912
  br label %if.end, !dbg !1913

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1914
  %shr10 = lshr i32 %11, 1, !dbg !1916
  %add = add i32 %shr10, 1, !dbg !1917
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1918
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1919
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1921
  %cmp11 = icmp ult i32 %12, %13, !dbg !1922
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1923

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1924
  %neg = xor i32 %14, -1, !dbg !1926
  %add13 = add i32 %neg, 1, !dbg !1927
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1928
  br label %if.end18, !dbg !1929

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1930
  %add15 = add i32 %15, 1, !dbg !1932
  %neg16 = xor i32 %add15, -1, !dbg !1933
  %add17 = add i32 %neg16, 1, !dbg !1934
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1935
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1936
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1938
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1939

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1940
  %conv = trunc i32 %17 to i16, !dbg !1942
  store i16 %conv, i16* %retval, align 2, !dbg !1943
  br label %return, !dbg !1943

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1944
  br label %return, !dbg !1944

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1946
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1948
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1949
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1949
  %div23 = udiv i32 %18, %19, !dbg !1949, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1950
  %mul24 = mul i32 %div23, %20, !dbg !1951
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1952
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1953
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1954
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1955
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1956
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1956
  %div25 = udiv i32 %22, %23, !dbg !1956, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1957
  %mul26 = mul i32 %div25, %24, !dbg !1958
  %sub27 = sub i32 %21, %mul26, !dbg !1959
  %shl = shl i32 %sub27, 1, !dbg !1960
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1961
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1962
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1963
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1964
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1964
  %div28 = udiv i32 %25, %26, !dbg !1964, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1965
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1966
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1967
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1967
  %div29 = udiv i32 %27, %28, !dbg !1967, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !1968
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1969
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1970
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1972
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1973

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1974
  %conv34 = trunc i32 %30 to i16, !dbg !1976
  store i16 %conv34, i16* %retval, align 2, !dbg !1977
  br label %return, !dbg !1977

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1978
  br label %return, !dbg !1978

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1980
  ret i16 %31, !dbg !1980
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1981 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1987, metadata !DIExpression()), !dbg !1988
  %2 = icmp eq i64 %0, 0, !dbg !1989
  br i1 %2, label %3, label %4, !dbg !1991

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1992
  unreachable, !dbg !1992

4:                                                ; preds = %1
  ret void, !dbg !1993
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !1994 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2000, metadata !DIExpression()), !dbg !2002
  call void @llvm.dbg.value(metadata i64 %1, metadata !2001, metadata !DIExpression()), !dbg !2002
  %3 = icmp ult i64 %1, %0, !dbg !2003
  br i1 %3, label %5, label %4, !dbg !2005

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2006
  unreachable, !dbg !2006

5:                                                ; preds = %2
  ret void, !dbg !2008
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0028/div_Ccode_alarm_0028.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0028")
!4 = !{}
!5 = !{!6, !13, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0028")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0028")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0028/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0028")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0028")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0028")
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
!297 = !DILocation(line: 304, column: 36, scope: !219)
!298 = !DILocation(line: 304, column: 47, scope: !219)
!299 = !DILocation(line: 304, column: 45, scope: !219)
!300 = !DILocation(line: 304, column: 26, scope: !219)
!301 = !DILocation(line: 304, column: 24, scope: !219)
!302 = !DILocation(line: 305, column: 4, scope: !219)
!303 = !DILocation(line: 325, column: 7, scope: !304)
!304 = distinct !DILexicalBlock(scope: !305, file: !69, line: 325, column: 7)
!305 = distinct !DILexicalBlock(scope: !213, file: !69, line: 324, column: 3)
!306 = !DILocation(line: 325, column: 19, scope: !304)
!307 = !DILocation(line: 325, column: 7, scope: !305)
!308 = !DILocation(line: 327, column: 17, scope: !309)
!309 = distinct !DILexicalBlock(scope: !304, file: !69, line: 326, column: 4)
!310 = !DILocation(line: 327, column: 29, scope: !309)
!311 = !DILocation(line: 327, column: 38, scope: !309)
!312 = !DILocation(line: 327, column: 37, scope: !309)
!313 = !DILocation(line: 327, column: 53, scope: !309)
!314 = !DILocation(line: 327, column: 51, scope: !309)
!315 = !DILocation(line: 327, column: 26, scope: !309)
!316 = !DILocation(line: 327, column: 66, scope: !309)
!317 = !DILocation(line: 327, column: 14, scope: !309)
!318 = !DILocation(line: 328, column: 16, scope: !309)
!319 = !DILocation(line: 328, column: 25, scope: !309)
!320 = !DILocation(line: 328, column: 24, scope: !309)
!321 = !DILocation(line: 328, column: 14, scope: !309)
!322 = !DILocation(line: 329, column: 16, scope: !309)
!323 = !DILocation(line: 329, column: 28, scope: !309)
!324 = !DILocation(line: 329, column: 39, scope: !309)
!325 = !DILocation(line: 329, column: 38, scope: !309)
!326 = !DILocation(line: 329, column: 25, scope: !309)
!327 = !DILocation(line: 329, column: 14, scope: !309)
!328 = !DILocation(line: 330, column: 8, scope: !329)
!329 = distinct !DILexicalBlock(scope: !309, file: !69, line: 330, column: 8)
!330 = !DILocation(line: 330, column: 17, scope: !329)
!331 = !DILocation(line: 330, column: 8, scope: !309)
!332 = !DILocation(line: 332, column: 9, scope: !333)
!333 = distinct !DILexicalBlock(scope: !334, file: !69, line: 332, column: 9)
!334 = distinct !DILexicalBlock(scope: !329, file: !69, line: 331, column: 5)
!335 = !DILocation(line: 332, column: 18, scope: !333)
!336 = !DILocation(line: 332, column: 9, scope: !334)
!337 = !DILocation(line: 334, column: 19, scope: !338)
!338 = distinct !DILexicalBlock(scope: !333, file: !69, line: 333, column: 6)
!339 = !DILocation(line: 334, column: 14, scope: !338)
!340 = !DILocation(line: 334, column: 7, scope: !338)
!341 = !DILocation(line: 338, column: 7, scope: !342)
!342 = distinct !DILexicalBlock(scope: !333, file: !69, line: 337, column: 6)
!343 = !DILocation(line: 343, column: 6, scope: !344)
!344 = distinct !DILexicalBlock(scope: !329, file: !69, line: 342, column: 5)
!345 = !DILocation(line: 349, column: 5, scope: !346)
!346 = distinct !DILexicalBlock(scope: !304, file: !69, line: 348, column: 4)
!347 = !DILocation(line: 355, column: 1, scope: !186)
!348 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !349, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!349 = !DISubroutineType(types: !350)
!350 = !{!19, !13}
!351 = !DILocalVariable(name: "denominator", arg: 1, scope: !348, file: !33, line: 24, type: !13)
!352 = !DILocation(line: 24, column: 40, scope: !348)
!353 = !DILocation(line: 26, column: 12, scope: !348)
!354 = !DILocation(line: 26, column: 24, scope: !348)
!355 = !DILocation(line: 26, column: 5, scope: !348)
!356 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !349, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!357 = !DILocalVariable(name: "left", arg: 1, scope: !356, file: !33, line: 84, type: !13)
!358 = !DILocation(line: 84, column: 51, scope: !356)
!359 = !DILocation(line: 86, column: 12, scope: !356)
!360 = !DILocation(line: 86, column: 17, scope: !356)
!361 = !DILocation(line: 86, column: 5, scope: !356)
!362 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !363, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!363 = !DISubroutineType(types: !364)
!364 = !{!19, !13, !20}
!365 = !DILocalVariable(name: "left", arg: 1, scope: !362, file: !33, line: 90, type: !13)
!366 = !DILocation(line: 90, column: 41, scope: !362)
!367 = !DILocalVariable(name: "count", arg: 2, scope: !362, file: !33, line: 90, type: !20)
!368 = !DILocation(line: 90, column: 56, scope: !362)
!369 = !DILocation(line: 92, column: 9, scope: !370)
!370 = distinct !DILexicalBlock(scope: !362, file: !33, line: 92, column: 9)
!371 = !DILocation(line: 92, column: 15, scope: !370)
!372 = !DILocation(line: 92, column: 9, scope: !362)
!373 = !DILocation(line: 93, column: 9, scope: !374)
!374 = distinct !DILexicalBlock(scope: !370, file: !33, line: 92, column: 32)
!375 = !DILocation(line: 95, column: 12, scope: !362)
!376 = !DILocation(line: 95, column: 34, scope: !362)
!377 = !DILocation(line: 95, column: 31, scope: !362)
!378 = !DILocation(line: 95, column: 17, scope: !362)
!379 = !DILocation(line: 95, column: 41, scope: !362)
!380 = !DILocation(line: 95, column: 5, scope: !362)
!381 = !DILocation(line: 96, column: 1, scope: !362)
!382 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !383, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!383 = !DISubroutineType(types: !384)
!384 = !{!19, !13, !13}
!385 = !DILocalVariable(name: "left", arg: 1, scope: !382, file: !33, line: 78, type: !13)
!386 = !DILocation(line: 78, column: 38, scope: !382)
!387 = !DILocalVariable(name: "right", arg: 2, scope: !382, file: !33, line: 78, type: !13)
!388 = !DILocation(line: 78, column: 52, scope: !382)
!389 = !DILocation(line: 80, column: 12, scope: !382)
!390 = !DILocation(line: 80, column: 19, scope: !382)
!391 = !DILocation(line: 80, column: 17, scope: !382)
!392 = !DILocation(line: 80, column: 25, scope: !382)
!393 = !DILocation(line: 80, column: 5, scope: !382)
!394 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !383, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!395 = !DILocalVariable(name: "left", arg: 1, scope: !394, file: !33, line: 72, type: !13)
!396 = !DILocation(line: 72, column: 38, scope: !394)
!397 = !DILocalVariable(name: "right", arg: 2, scope: !394, file: !33, line: 72, type: !13)
!398 = !DILocation(line: 72, column: 52, scope: !394)
!399 = !DILocation(line: 74, column: 12, scope: !394)
!400 = !DILocation(line: 74, column: 19, scope: !394)
!401 = !DILocation(line: 74, column: 17, scope: !394)
!402 = !DILocation(line: 74, column: 25, scope: !394)
!403 = !DILocation(line: 74, column: 5, scope: !394)
!404 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 373, type: !405, scopeLine: 374, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!405 = !DISubroutineType(types: !406)
!406 = !{!6, !6, !28}
!407 = !DILocalVariable(name: "numerator", arg: 1, scope: !404, file: !69, line: 373, type: !6)
!408 = !DILocation(line: 373, column: 31, scope: !404)
!409 = !DILocalVariable(name: "denominator", arg: 2, scope: !404, file: !69, line: 373, type: !28)
!410 = !DILocation(line: 373, column: 47, scope: !404)
!411 = !DILocalVariable(name: "u16Temp1", scope: !404, file: !69, line: 375, type: !28)
!412 = !DILocation(line: 375, column: 6, scope: !404)
!413 = !DILocalVariable(name: "s32Temp1", scope: !404, file: !69, line: 376, type: !16)
!414 = !DILocation(line: 376, column: 6, scope: !404)
!415 = !DILocalVariable(name: "s32Temp2", scope: !404, file: !69, line: 376, type: !16)
!416 = !DILocation(line: 376, column: 15, scope: !404)
!417 = !DILocation(line: 377, column: 13, scope: !404)
!418 = !DILocation(line: 377, column: 25, scope: !404)
!419 = !DILocation(line: 377, column: 11, scope: !404)
!420 = !DILocation(line: 378, column: 13, scope: !404)
!421 = !DILocation(line: 378, column: 22, scope: !404)
!422 = !DILocation(line: 378, column: 11, scope: !404)
!423 = !DILocation(line: 379, column: 5, scope: !424)
!424 = distinct !DILexicalBlock(scope: !404, file: !69, line: 379, column: 5)
!425 = !DILocation(line: 379, column: 14, scope: !424)
!426 = !DILocation(line: 379, column: 5, scope: !404)
!427 = !DILocation(line: 381, column: 7, scope: !428)
!428 = distinct !DILexicalBlock(scope: !429, file: !69, line: 381, column: 7)
!429 = distinct !DILexicalBlock(scope: !424, file: !69, line: 380, column: 2)
!430 = !DILocation(line: 381, column: 17, scope: !428)
!431 = !DILocation(line: 381, column: 7, scope: !429)
!432 = !DILocation(line: 383, column: 4, scope: !433)
!433 = distinct !DILexicalBlock(scope: !428, file: !69, line: 382, column: 3)
!434 = !DILocation(line: 387, column: 4, scope: !435)
!435 = distinct !DILexicalBlock(scope: !428, file: !69, line: 386, column: 3)
!436 = !DILocation(line: 392, column: 15, scope: !437)
!437 = distinct !DILexicalBlock(scope: !424, file: !69, line: 391, column: 2)
!438 = !DILocation(line: 392, column: 24, scope: !437)
!439 = !DILocation(line: 392, column: 32, scope: !437)
!440 = !DILocation(line: 392, column: 41, scope: !437)
!441 = !DILocation(line: 392, column: 47, scope: !437)
!442 = !DILocation(line: 392, column: 46, scope: !437)
!443 = !DILocation(line: 392, column: 57, scope: !437)
!444 = !DILocation(line: 392, column: 56, scope: !437)
!445 = !DILocation(line: 392, column: 29, scope: !437)
!446 = !DILocation(line: 392, column: 12, scope: !437)
!447 = !DILocation(line: 393, column: 14, scope: !437)
!448 = !DILocation(line: 393, column: 22, scope: !437)
!449 = !DILocation(line: 393, column: 12, scope: !437)
!450 = !DILocation(line: 394, column: 14, scope: !437)
!451 = !DILocation(line: 394, column: 23, scope: !437)
!452 = !DILocation(line: 394, column: 22, scope: !437)
!453 = !DILocation(line: 394, column: 12, scope: !437)
!454 = !DILocation(line: 395, column: 16, scope: !437)
!455 = !DILocation(line: 395, column: 25, scope: !437)
!456 = !DILocation(line: 395, column: 31, scope: !437)
!457 = !DILocation(line: 395, column: 30, scope: !437)
!458 = !DILocation(line: 395, column: 43, scope: !437)
!459 = !DILocation(line: 395, column: 41, scope: !437)
!460 = !DILocation(line: 395, column: 12, scope: !437)
!461 = !DILocation(line: 396, column: 6, scope: !462)
!462 = distinct !DILexicalBlock(scope: !437, file: !69, line: 396, column: 6)
!463 = !DILocation(line: 396, column: 15, scope: !462)
!464 = !DILocation(line: 396, column: 6, scope: !437)
!465 = !DILocation(line: 398, column: 7, scope: !466)
!466 = distinct !DILexicalBlock(scope: !467, file: !69, line: 398, column: 7)
!467 = distinct !DILexicalBlock(scope: !462, file: !69, line: 397, column: 3)
!468 = !DILocation(line: 398, column: 16, scope: !466)
!469 = !DILocation(line: 398, column: 7, scope: !467)
!470 = !DILocation(line: 400, column: 17, scope: !471)
!471 = distinct !DILexicalBlock(scope: !466, file: !69, line: 399, column: 4)
!472 = !DILocation(line: 400, column: 12, scope: !471)
!473 = !DILocation(line: 400, column: 5, scope: !471)
!474 = !DILocation(line: 404, column: 5, scope: !475)
!475 = distinct !DILexicalBlock(scope: !466, file: !69, line: 403, column: 4)
!476 = !DILocation(line: 409, column: 4, scope: !477)
!477 = distinct !DILexicalBlock(scope: !462, file: !69, line: 408, column: 3)
!478 = !DILocation(line: 412, column: 1, scope: !404)
!479 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 429, type: !405, scopeLine: 430, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!480 = !DILocalVariable(name: "numerator", arg: 1, scope: !479, file: !69, line: 429, type: !6)
!481 = !DILocation(line: 429, column: 30, scope: !479)
!482 = !DILocalVariable(name: "denominator", arg: 2, scope: !479, file: !69, line: 429, type: !28)
!483 = !DILocation(line: 429, column: 45, scope: !479)
!484 = !DILocalVariable(name: "u16Temp1", scope: !479, file: !69, line: 431, type: !28)
!485 = !DILocation(line: 431, column: 6, scope: !479)
!486 = !DILocalVariable(name: "s32Temp1", scope: !479, file: !69, line: 432, type: !16)
!487 = !DILocation(line: 432, column: 6, scope: !479)
!488 = !DILocation(line: 433, column: 13, scope: !479)
!489 = !DILocation(line: 433, column: 25, scope: !479)
!490 = !DILocation(line: 433, column: 11, scope: !479)
!491 = !DILocation(line: 434, column: 5, scope: !492)
!492 = distinct !DILexicalBlock(scope: !479, file: !69, line: 434, column: 5)
!493 = !DILocation(line: 434, column: 13, scope: !492)
!494 = !DILocation(line: 434, column: 5, scope: !479)
!495 = !DILocation(line: 436, column: 6, scope: !496)
!496 = distinct !DILexicalBlock(scope: !497, file: !69, line: 436, column: 6)
!497 = distinct !DILexicalBlock(scope: !492, file: !69, line: 435, column: 2)
!498 = !DILocation(line: 436, column: 15, scope: !496)
!499 = !DILocation(line: 436, column: 6, scope: !497)
!500 = !DILocation(line: 438, column: 4, scope: !501)
!501 = distinct !DILexicalBlock(scope: !496, file: !69, line: 437, column: 3)
!502 = !DILocation(line: 442, column: 4, scope: !503)
!503 = distinct !DILexicalBlock(scope: !496, file: !69, line: 441, column: 3)
!504 = !DILocation(line: 448, column: 15, scope: !505)
!505 = distinct !DILexicalBlock(scope: !492, file: !69, line: 447, column: 2)
!506 = !DILocation(line: 448, column: 27, scope: !505)
!507 = !DILocation(line: 448, column: 37, scope: !505)
!508 = !DILocation(line: 448, column: 36, scope: !505)
!509 = !DILocation(line: 448, column: 49, scope: !505)
!510 = !DILocation(line: 448, column: 47, scope: !505)
!511 = !DILocation(line: 448, column: 25, scope: !505)
!512 = !DILocation(line: 448, column: 59, scope: !505)
!513 = !DILocation(line: 448, column: 12, scope: !505)
!514 = !DILocation(line: 449, column: 15, scope: !505)
!515 = !DILocation(line: 449, column: 24, scope: !505)
!516 = !DILocation(line: 449, column: 23, scope: !505)
!517 = !DILocation(line: 449, column: 37, scope: !505)
!518 = !DILocation(line: 449, column: 47, scope: !505)
!519 = !DILocation(line: 449, column: 46, scope: !505)
!520 = !DILocation(line: 449, column: 34, scope: !505)
!521 = !DILocation(line: 449, column: 12, scope: !505)
!522 = !DILocation(line: 450, column: 10, scope: !505)
!523 = !DILocation(line: 450, column: 3, scope: !505)
!524 = !DILocation(line: 452, column: 1, scope: !479)
!525 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 470, type: !526, scopeLine: 471, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!526 = !DISubroutineType(types: !527)
!527 = !{!24, !28, !28}
!528 = !DILocalVariable(name: "numerator", arg: 1, scope: !525, file: !69, line: 470, type: !28)
!529 = !DILocation(line: 470, column: 28, scope: !525)
!530 = !DILocalVariable(name: "denominator", arg: 2, scope: !525, file: !69, line: 470, type: !28)
!531 = !DILocation(line: 470, column: 43, scope: !525)
!532 = !DILocalVariable(name: "u32Temp1", scope: !525, file: !69, line: 472, type: !533)
!533 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !20)
!534 = !DILocation(line: 472, column: 6, scope: !525)
!535 = !DILocalVariable(name: "u32Temp2", scope: !525, file: !69, line: 472, type: !533)
!536 = !DILocation(line: 472, column: 20, scope: !525)
!537 = !DILocalVariable(name: "u32Temp3", scope: !525, file: !69, line: 472, type: !533)
!538 = !DILocation(line: 472, column: 33, scope: !525)
!539 = !DILocation(line: 473, column: 5, scope: !540)
!540 = distinct !DILexicalBlock(scope: !525, file: !69, line: 473, column: 5)
!541 = !DILocation(line: 473, column: 16, scope: !540)
!542 = !DILocation(line: 473, column: 5, scope: !525)
!543 = !DILocation(line: 475, column: 3, scope: !544)
!544 = distinct !DILexicalBlock(scope: !540, file: !69, line: 474, column: 2)
!545 = !DILocation(line: 479, column: 15, scope: !546)
!546 = distinct !DILexicalBlock(scope: !540, file: !69, line: 478, column: 2)
!547 = !DILocation(line: 479, column: 24, scope: !546)
!548 = !DILocation(line: 479, column: 12, scope: !546)
!549 = !DILocation(line: 480, column: 14, scope: !546)
!550 = !DILocation(line: 480, column: 25, scope: !546)
!551 = !DILocation(line: 480, column: 23, scope: !546)
!552 = !DILocation(line: 480, column: 12, scope: !546)
!553 = !DILocation(line: 481, column: 15, scope: !546)
!554 = !DILocation(line: 481, column: 24, scope: !546)
!555 = !DILocation(line: 481, column: 32, scope: !546)
!556 = !DILocation(line: 481, column: 12, scope: !546)
!557 = !DILocation(line: 482, column: 6, scope: !558)
!558 = distinct !DILexicalBlock(scope: !546, file: !69, line: 482, column: 6)
!559 = !DILocation(line: 482, column: 15, scope: !558)
!560 = !DILocation(line: 482, column: 6, scope: !546)
!561 = !DILocation(line: 484, column: 15, scope: !562)
!562 = distinct !DILexicalBlock(scope: !558, file: !69, line: 483, column: 3)
!563 = !DILocation(line: 484, column: 11, scope: !562)
!564 = !DILocation(line: 484, column: 4, scope: !562)
!565 = !DILocation(line: 488, column: 4, scope: !566)
!566 = distinct !DILexicalBlock(scope: !558, file: !69, line: 487, column: 3)
!567 = !DILocation(line: 491, column: 1, scope: !525)
!568 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 508, type: !569, scopeLine: 509, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!569 = !DISubroutineType(types: !570)
!570 = !{!28, !16, !28}
!571 = !DILocalVariable(name: "x_value", arg: 1, scope: !568, file: !69, line: 508, type: !16)
!572 = !DILocation(line: 508, column: 25, scope: !568)
!573 = !DILocalVariable(name: "y_value", arg: 2, scope: !568, file: !69, line: 508, type: !28)
!574 = !DILocation(line: 508, column: 38, scope: !568)
!575 = !DILocalVariable(name: "s32Temp1", scope: !568, file: !69, line: 510, type: !16)
!576 = !DILocation(line: 510, column: 6, scope: !568)
!577 = !DILocation(line: 511, column: 12, scope: !568)
!578 = !DILocation(line: 511, column: 20, scope: !568)
!579 = !DILocation(line: 511, column: 10, scope: !568)
!580 = !DILocation(line: 512, column: 6, scope: !581)
!581 = distinct !DILexicalBlock(scope: !568, file: !69, line: 512, column: 5)
!582 = !DILocation(line: 512, column: 14, scope: !581)
!583 = !DILocation(line: 512, column: 24, scope: !581)
!584 = !DILocation(line: 512, column: 5, scope: !568)
!585 = !DILocation(line: 514, column: 6, scope: !586)
!586 = distinct !DILexicalBlock(scope: !587, file: !69, line: 514, column: 6)
!587 = distinct !DILexicalBlock(scope: !581, file: !69, line: 513, column: 2)
!588 = !DILocation(line: 514, column: 14, scope: !586)
!589 = !DILocation(line: 514, column: 6, scope: !587)
!590 = !DILocation(line: 516, column: 4, scope: !591)
!591 = distinct !DILexicalBlock(scope: !586, file: !69, line: 515, column: 3)
!592 = !DILocation(line: 520, column: 4, scope: !593)
!593 = distinct !DILexicalBlock(scope: !586, file: !69, line: 519, column: 3)
!594 = !DILocation(line: 525, column: 15, scope: !595)
!595 = distinct !DILexicalBlock(scope: !581, file: !69, line: 524, column: 2)
!596 = !DILocation(line: 525, column: 27, scope: !595)
!597 = !DILocation(line: 525, column: 35, scope: !595)
!598 = !DILocation(line: 525, column: 34, scope: !595)
!599 = !DILocation(line: 525, column: 46, scope: !595)
!600 = !DILocation(line: 525, column: 44, scope: !595)
!601 = !DILocation(line: 525, column: 23, scope: !595)
!602 = !DILocation(line: 525, column: 56, scope: !595)
!603 = !DILocation(line: 525, column: 12, scope: !595)
!604 = !DILocation(line: 526, column: 15, scope: !595)
!605 = !DILocation(line: 526, column: 24, scope: !595)
!606 = !DILocation(line: 526, column: 23, scope: !595)
!607 = !DILocation(line: 526, column: 36, scope: !595)
!608 = !DILocation(line: 526, column: 44, scope: !595)
!609 = !DILocation(line: 526, column: 43, scope: !595)
!610 = !DILocation(line: 526, column: 33, scope: !595)
!611 = !DILocation(line: 526, column: 12, scope: !595)
!612 = !DILocation(line: 527, column: 6, scope: !613)
!613 = distinct !DILexicalBlock(scope: !595, file: !69, line: 527, column: 6)
!614 = !DILocation(line: 527, column: 15, scope: !613)
!615 = !DILocation(line: 527, column: 6, scope: !595)
!616 = !DILocation(line: 529, column: 7, scope: !617)
!617 = distinct !DILexicalBlock(scope: !618, file: !69, line: 529, column: 7)
!618 = distinct !DILexicalBlock(scope: !613, file: !69, line: 528, column: 3)
!619 = !DILocation(line: 529, column: 16, scope: !617)
!620 = !DILocation(line: 529, column: 7, scope: !618)
!621 = !DILocation(line: 531, column: 17, scope: !622)
!622 = distinct !DILexicalBlock(scope: !617, file: !69, line: 530, column: 4)
!623 = !DILocation(line: 531, column: 12, scope: !622)
!624 = !DILocation(line: 531, column: 5, scope: !622)
!625 = !DILocation(line: 535, column: 5, scope: !626)
!626 = distinct !DILexicalBlock(scope: !617, file: !69, line: 534, column: 4)
!627 = !DILocation(line: 540, column: 4, scope: !628)
!628 = distinct !DILexicalBlock(scope: !613, file: !69, line: 539, column: 3)
!629 = !DILocation(line: 543, column: 1, scope: !568)
!630 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 561, type: !631, scopeLine: 562, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!631 = !DISubroutineType(types: !632)
!632 = !{!28, !28, !28}
!633 = !DILocalVariable(name: "numerator", arg: 1, scope: !630, file: !69, line: 561, type: !28)
!634 = !DILocation(line: 561, column: 31, scope: !630)
!635 = !DILocalVariable(name: "denominator", arg: 2, scope: !630, file: !69, line: 561, type: !28)
!636 = !DILocation(line: 561, column: 46, scope: !630)
!637 = !DILocalVariable(name: "u32Temp", scope: !630, file: !69, line: 563, type: !533)
!638 = !DILocation(line: 563, column: 6, scope: !630)
!639 = !DILocation(line: 564, column: 5, scope: !640)
!640 = distinct !DILexicalBlock(scope: !630, file: !69, line: 564, column: 5)
!641 = !DILocation(line: 564, column: 17, scope: !640)
!642 = !DILocation(line: 564, column: 5, scope: !630)
!643 = !DILocation(line: 566, column: 3, scope: !644)
!644 = distinct !DILexicalBlock(scope: !640, file: !69, line: 565, column: 2)
!645 = !DILocation(line: 570, column: 14, scope: !646)
!646 = distinct !DILexicalBlock(scope: !640, file: !69, line: 569, column: 2)
!647 = !DILocation(line: 570, column: 23, scope: !646)
!648 = !DILocation(line: 570, column: 32, scope: !646)
!649 = !DILocation(line: 570, column: 44, scope: !646)
!650 = !DILocation(line: 570, column: 29, scope: !646)
!651 = !DILocation(line: 570, column: 11, scope: !646)
!652 = !DILocation(line: 571, column: 13, scope: !646)
!653 = !DILocation(line: 571, column: 21, scope: !646)
!654 = !DILocation(line: 571, column: 20, scope: !646)
!655 = !DILocation(line: 571, column: 11, scope: !646)
!656 = !DILocation(line: 572, column: 6, scope: !657)
!657 = distinct !DILexicalBlock(scope: !646, file: !69, line: 572, column: 6)
!658 = !DILocation(line: 572, column: 14, scope: !657)
!659 = !DILocation(line: 572, column: 6, scope: !646)
!660 = !DILocation(line: 574, column: 11, scope: !661)
!661 = distinct !DILexicalBlock(scope: !657, file: !69, line: 573, column: 3)
!662 = !DILocation(line: 574, column: 19, scope: !661)
!663 = !DILocation(line: 574, column: 4, scope: !661)
!664 = !DILocation(line: 578, column: 4, scope: !665)
!665 = distinct !DILexicalBlock(scope: !657, file: !69, line: 577, column: 3)
!666 = !DILocation(line: 582, column: 1, scope: !630)
!667 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 599, type: !668, scopeLine: 600, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!668 = !DISubroutineType(types: !669)
!669 = !{!28, !533, !28}
!670 = !DILocalVariable(name: "x_value", arg: 1, scope: !667, file: !69, line: 599, type: !533)
!671 = !DILocation(line: 599, column: 25, scope: !667)
!672 = !DILocalVariable(name: "y_value", arg: 2, scope: !667, file: !69, line: 599, type: !28)
!673 = !DILocation(line: 599, column: 38, scope: !667)
!674 = !DILocalVariable(name: "u32Temp1", scope: !667, file: !69, line: 601, type: !533)
!675 = !DILocation(line: 601, column: 6, scope: !667)
!676 = !DILocalVariable(name: "u32Temp2", scope: !667, file: !69, line: 601, type: !533)
!677 = !DILocation(line: 601, column: 17, scope: !667)
!678 = !DILocation(line: 602, column: 12, scope: !667)
!679 = !DILocation(line: 602, column: 20, scope: !667)
!680 = !DILocation(line: 602, column: 10, scope: !667)
!681 = !DILocation(line: 603, column: 5, scope: !682)
!682 = distinct !DILexicalBlock(scope: !667, file: !69, line: 603, column: 5)
!683 = !DILocation(line: 603, column: 13, scope: !682)
!684 = !DILocation(line: 603, column: 5, scope: !667)
!685 = !DILocation(line: 605, column: 3, scope: !686)
!686 = distinct !DILexicalBlock(scope: !682, file: !69, line: 604, column: 2)
!687 = !DILocation(line: 609, column: 14, scope: !688)
!688 = distinct !DILexicalBlock(scope: !682, file: !69, line: 608, column: 2)
!689 = !DILocation(line: 609, column: 22, scope: !688)
!690 = !DILocation(line: 609, column: 21, scope: !688)
!691 = !DILocation(line: 609, column: 12, scope: !688)
!692 = !DILocation(line: 610, column: 14, scope: !688)
!693 = !DILocation(line: 610, column: 25, scope: !688)
!694 = !DILocation(line: 610, column: 36, scope: !688)
!695 = !DILocation(line: 610, column: 34, scope: !688)
!696 = !DILocation(line: 610, column: 22, scope: !688)
!697 = !DILocation(line: 610, column: 45, scope: !688)
!698 = !DILocation(line: 610, column: 12, scope: !688)
!699 = !DILocation(line: 611, column: 15, scope: !688)
!700 = !DILocation(line: 611, column: 24, scope: !688)
!701 = !DILocation(line: 611, column: 23, scope: !688)
!702 = !DILocation(line: 611, column: 36, scope: !688)
!703 = !DILocation(line: 611, column: 44, scope: !688)
!704 = !DILocation(line: 611, column: 43, scope: !688)
!705 = !DILocation(line: 611, column: 33, scope: !688)
!706 = !DILocation(line: 611, column: 12, scope: !688)
!707 = !DILocation(line: 612, column: 6, scope: !708)
!708 = distinct !DILexicalBlock(scope: !688, file: !69, line: 612, column: 6)
!709 = !DILocation(line: 612, column: 15, scope: !708)
!710 = !DILocation(line: 612, column: 6, scope: !688)
!711 = !DILocation(line: 614, column: 11, scope: !712)
!712 = distinct !DILexicalBlock(scope: !708, file: !69, line: 613, column: 3)
!713 = !DILocation(line: 614, column: 20, scope: !712)
!714 = !DILocation(line: 614, column: 4, scope: !712)
!715 = !DILocation(line: 618, column: 4, scope: !716)
!716 = distinct !DILexicalBlock(scope: !708, file: !69, line: 617, column: 3)
!717 = !DILocation(line: 622, column: 1, scope: !667)
!718 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 641, type: !719, scopeLine: 642, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!719 = !DISubroutineType(types: !720)
!720 = !{!6, !6, !28, !6}
!721 = !DILocalVariable(name: "factor1", arg: 1, scope: !718, file: !69, line: 641, type: !6)
!722 = !DILocation(line: 641, column: 33, scope: !718)
!723 = !DILocalVariable(name: "factor2", arg: 2, scope: !718, file: !69, line: 641, type: !28)
!724 = !DILocation(line: 641, column: 46, scope: !718)
!725 = !DILocalVariable(name: "denominator", arg: 3, scope: !718, file: !69, line: 641, type: !6)
!726 = !DILocation(line: 641, column: 59, scope: !718)
!727 = !DILocalVariable(name: "s32Result", scope: !718, file: !69, line: 643, type: !16)
!728 = !DILocation(line: 643, column: 6, scope: !718)
!729 = !DILocalVariable(name: "s32Temp1", scope: !718, file: !69, line: 643, type: !16)
!730 = !DILocation(line: 643, column: 21, scope: !718)
!731 = !DILocation(line: 644, column: 14, scope: !718)
!732 = !DILocation(line: 644, column: 24, scope: !718)
!733 = !DILocation(line: 644, column: 22, scope: !718)
!734 = !DILocation(line: 644, column: 12, scope: !718)
!735 = !DILocation(line: 645, column: 5, scope: !736)
!736 = distinct !DILexicalBlock(scope: !718, file: !69, line: 645, column: 5)
!737 = !DILocation(line: 645, column: 17, scope: !736)
!738 = !DILocation(line: 645, column: 5, scope: !718)
!739 = !DILocation(line: 647, column: 6, scope: !740)
!740 = distinct !DILexicalBlock(scope: !741, file: !69, line: 647, column: 6)
!741 = distinct !DILexicalBlock(scope: !736, file: !69, line: 646, column: 2)
!742 = !DILocation(line: 647, column: 16, scope: !740)
!743 = !DILocation(line: 647, column: 6, scope: !741)
!744 = !DILocation(line: 649, column: 4, scope: !745)
!745 = distinct !DILexicalBlock(scope: !740, file: !69, line: 648, column: 3)
!746 = !DILocation(line: 653, column: 4, scope: !747)
!747 = distinct !DILexicalBlock(scope: !740, file: !69, line: 652, column: 3)
!748 = !DILocation(line: 658, column: 14, scope: !749)
!749 = distinct !DILexicalBlock(scope: !736, file: !69, line: 657, column: 2)
!750 = !DILocation(line: 658, column: 27, scope: !749)
!751 = !DILocation(line: 658, column: 37, scope: !749)
!752 = !DILocation(line: 658, column: 36, scope: !749)
!753 = !DILocation(line: 658, column: 50, scope: !749)
!754 = !DILocation(line: 658, column: 49, scope: !749)
!755 = !DILocation(line: 658, column: 24, scope: !749)
!756 = !DILocation(line: 658, column: 12, scope: !749)
!757 = !DILocation(line: 659, column: 14, scope: !749)
!758 = !DILocation(line: 659, column: 23, scope: !749)
!759 = !DILocation(line: 659, column: 12, scope: !749)
!760 = !DILocation(line: 660, column: 16, scope: !749)
!761 = !DILocation(line: 660, column: 25, scope: !749)
!762 = !DILocation(line: 660, column: 24, scope: !749)
!763 = !DILocation(line: 660, column: 41, scope: !749)
!764 = !DILocation(line: 660, column: 51, scope: !749)
!765 = !DILocation(line: 660, column: 50, scope: !749)
!766 = !DILocation(line: 660, column: 38, scope: !749)
!767 = !DILocation(line: 660, column: 13, scope: !749)
!768 = !DILocation(line: 661, column: 6, scope: !769)
!769 = distinct !DILexicalBlock(scope: !749, file: !69, line: 661, column: 6)
!770 = !DILocation(line: 661, column: 16, scope: !769)
!771 = !DILocation(line: 661, column: 6, scope: !749)
!772 = !DILocation(line: 663, column: 7, scope: !773)
!773 = distinct !DILexicalBlock(scope: !774, file: !69, line: 663, column: 7)
!774 = distinct !DILexicalBlock(scope: !769, file: !69, line: 662, column: 3)
!775 = !DILocation(line: 663, column: 17, scope: !773)
!776 = !DILocation(line: 663, column: 7, scope: !774)
!777 = !DILocation(line: 665, column: 17, scope: !778)
!778 = distinct !DILexicalBlock(scope: !773, file: !69, line: 664, column: 4)
!779 = !DILocation(line: 665, column: 12, scope: !778)
!780 = !DILocation(line: 665, column: 5, scope: !778)
!781 = !DILocation(line: 670, column: 5, scope: !782)
!782 = distinct !DILexicalBlock(scope: !773, file: !69, line: 669, column: 4)
!783 = !DILocation(line: 675, column: 4, scope: !784)
!784 = distinct !DILexicalBlock(scope: !769, file: !69, line: 674, column: 3)
!785 = !DILocation(line: 679, column: 1, scope: !718)
!786 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 697, type: !787, scopeLine: 698, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!787 = !DISubroutineType(types: !788)
!788 = !{!6, !28, !6, !28}
!789 = !DILocalVariable(name: "factor1", arg: 1, scope: !786, file: !69, line: 697, type: !28)
!790 = !DILocation(line: 697, column: 33, scope: !786)
!791 = !DILocalVariable(name: "factor2", arg: 2, scope: !786, file: !69, line: 697, type: !6)
!792 = !DILocation(line: 697, column: 46, scope: !786)
!793 = !DILocalVariable(name: "denominator", arg: 3, scope: !786, file: !69, line: 697, type: !28)
!794 = !DILocation(line: 697, column: 59, scope: !786)
!795 = !DILocalVariable(name: "s32Result", scope: !786, file: !69, line: 699, type: !16)
!796 = !DILocation(line: 699, column: 6, scope: !786)
!797 = !DILocalVariable(name: "s32Temp1", scope: !786, file: !69, line: 699, type: !16)
!798 = !DILocation(line: 699, column: 21, scope: !786)
!799 = !DILocation(line: 700, column: 14, scope: !786)
!800 = !DILocation(line: 700, column: 24, scope: !786)
!801 = !DILocation(line: 700, column: 22, scope: !786)
!802 = !DILocation(line: 700, column: 12, scope: !786)
!803 = !DILocation(line: 701, column: 5, scope: !804)
!804 = distinct !DILexicalBlock(scope: !786, file: !69, line: 701, column: 5)
!805 = !DILocation(line: 701, column: 16, scope: !804)
!806 = !DILocation(line: 701, column: 5, scope: !786)
!807 = !DILocation(line: 703, column: 6, scope: !808)
!808 = distinct !DILexicalBlock(scope: !809, file: !69, line: 703, column: 6)
!809 = distinct !DILexicalBlock(scope: !804, file: !69, line: 702, column: 2)
!810 = !DILocation(line: 703, column: 16, scope: !808)
!811 = !DILocation(line: 703, column: 6, scope: !809)
!812 = !DILocation(line: 705, column: 4, scope: !813)
!813 = distinct !DILexicalBlock(scope: !808, file: !69, line: 704, column: 3)
!814 = !DILocation(line: 709, column: 4, scope: !815)
!815 = distinct !DILexicalBlock(scope: !808, file: !69, line: 708, column: 3)
!816 = !DILocation(line: 714, column: 14, scope: !817)
!817 = distinct !DILexicalBlock(scope: !804, file: !69, line: 713, column: 2)
!818 = !DILocation(line: 714, column: 28, scope: !817)
!819 = !DILocation(line: 714, column: 38, scope: !817)
!820 = !DILocation(line: 714, column: 37, scope: !817)
!821 = !DILocation(line: 714, column: 53, scope: !817)
!822 = !DILocation(line: 714, column: 51, scope: !817)
!823 = !DILocation(line: 714, column: 24, scope: !817)
!824 = !DILocation(line: 714, column: 66, scope: !817)
!825 = !DILocation(line: 714, column: 12, scope: !817)
!826 = !DILocation(line: 715, column: 16, scope: !817)
!827 = !DILocation(line: 715, column: 25, scope: !817)
!828 = !DILocation(line: 715, column: 24, scope: !817)
!829 = !DILocation(line: 715, column: 41, scope: !817)
!830 = !DILocation(line: 715, column: 51, scope: !817)
!831 = !DILocation(line: 715, column: 50, scope: !817)
!832 = !DILocation(line: 715, column: 38, scope: !817)
!833 = !DILocation(line: 715, column: 13, scope: !817)
!834 = !DILocation(line: 716, column: 6, scope: !835)
!835 = distinct !DILexicalBlock(scope: !817, file: !69, line: 716, column: 6)
!836 = !DILocation(line: 716, column: 16, scope: !835)
!837 = !DILocation(line: 716, column: 6, scope: !817)
!838 = !DILocation(line: 718, column: 7, scope: !839)
!839 = distinct !DILexicalBlock(scope: !840, file: !69, line: 718, column: 7)
!840 = distinct !DILexicalBlock(scope: !835, file: !69, line: 717, column: 3)
!841 = !DILocation(line: 718, column: 17, scope: !839)
!842 = !DILocation(line: 718, column: 7, scope: !840)
!843 = !DILocation(line: 720, column: 17, scope: !844)
!844 = distinct !DILexicalBlock(scope: !839, file: !69, line: 719, column: 4)
!845 = !DILocation(line: 720, column: 12, scope: !844)
!846 = !DILocation(line: 720, column: 5, scope: !844)
!847 = !DILocation(line: 724, column: 5, scope: !848)
!848 = distinct !DILexicalBlock(scope: !839, file: !69, line: 723, column: 4)
!849 = !DILocation(line: 729, column: 4, scope: !850)
!850 = distinct !DILexicalBlock(scope: !835, file: !69, line: 728, column: 3)
!851 = !DILocation(line: 732, column: 1, scope: !786)
!852 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 751, type: !853, scopeLine: 752, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!853 = !DISubroutineType(types: !854)
!854 = !{!28, !6, !28, !6}
!855 = !DILocalVariable(name: "factor1", arg: 1, scope: !852, file: !69, line: 751, type: !6)
!856 = !DILocation(line: 751, column: 33, scope: !852)
!857 = !DILocalVariable(name: "factor2", arg: 2, scope: !852, file: !69, line: 751, type: !28)
!858 = !DILocation(line: 751, column: 46, scope: !852)
!859 = !DILocalVariable(name: "denominator", arg: 3, scope: !852, file: !69, line: 751, type: !6)
!860 = !DILocation(line: 751, column: 59, scope: !852)
!861 = !DILocalVariable(name: "u32Result", scope: !852, file: !69, line: 753, type: !533)
!862 = !DILocation(line: 753, column: 6, scope: !852)
!863 = !DILocalVariable(name: "u32Temp1", scope: !852, file: !69, line: 753, type: !533)
!864 = !DILocation(line: 753, column: 21, scope: !852)
!865 = !DILocalVariable(name: "s32Result", scope: !852, file: !69, line: 754, type: !16)
!866 = !DILocation(line: 754, column: 6, scope: !852)
!867 = !DILocalVariable(name: "s32Temp1", scope: !852, file: !69, line: 754, type: !16)
!868 = !DILocation(line: 754, column: 21, scope: !852)
!869 = !DILocation(line: 755, column: 14, scope: !852)
!870 = !DILocation(line: 755, column: 24, scope: !852)
!871 = !DILocation(line: 755, column: 22, scope: !852)
!872 = !DILocation(line: 755, column: 12, scope: !852)
!873 = !DILocation(line: 757, column: 5, scope: !874)
!874 = distinct !DILexicalBlock(scope: !852, file: !69, line: 757, column: 5)
!875 = !DILocation(line: 757, column: 17, scope: !874)
!876 = !DILocation(line: 757, column: 5, scope: !852)
!877 = !DILocation(line: 759, column: 6, scope: !878)
!878 = distinct !DILexicalBlock(scope: !879, file: !69, line: 759, column: 6)
!879 = distinct !DILexicalBlock(scope: !874, file: !69, line: 758, column: 2)
!880 = !DILocation(line: 759, column: 16, scope: !878)
!881 = !DILocation(line: 759, column: 6, scope: !879)
!882 = !DILocation(line: 761, column: 4, scope: !883)
!883 = distinct !DILexicalBlock(scope: !878, file: !69, line: 760, column: 3)
!884 = !DILocation(line: 765, column: 4, scope: !885)
!885 = distinct !DILexicalBlock(scope: !878, file: !69, line: 764, column: 3)
!886 = !DILocation(line: 770, column: 15, scope: !887)
!887 = distinct !DILexicalBlock(scope: !874, file: !69, line: 769, column: 2)
!888 = !DILocation(line: 770, column: 29, scope: !887)
!889 = !DILocation(line: 770, column: 39, scope: !887)
!890 = !DILocation(line: 770, column: 38, scope: !887)
!891 = !DILocation(line: 770, column: 54, scope: !887)
!892 = !DILocation(line: 770, column: 52, scope: !887)
!893 = !DILocation(line: 770, column: 25, scope: !887)
!894 = !DILocation(line: 770, column: 68, scope: !887)
!895 = !DILocation(line: 770, column: 12, scope: !887)
!896 = !DILocation(line: 771, column: 16, scope: !887)
!897 = !DILocation(line: 771, column: 25, scope: !887)
!898 = !DILocation(line: 771, column: 24, scope: !887)
!899 = !DILocation(line: 771, column: 41, scope: !887)
!900 = !DILocation(line: 771, column: 51, scope: !887)
!901 = !DILocation(line: 771, column: 50, scope: !887)
!902 = !DILocation(line: 771, column: 38, scope: !887)
!903 = !DILocation(line: 771, column: 13, scope: !887)
!904 = !DILocation(line: 772, column: 6, scope: !905)
!905 = distinct !DILexicalBlock(scope: !887, file: !69, line: 772, column: 6)
!906 = !DILocation(line: 772, column: 16, scope: !905)
!907 = !DILocation(line: 772, column: 6, scope: !887)
!908 = !DILocation(line: 774, column: 7, scope: !909)
!909 = distinct !DILexicalBlock(scope: !910, file: !69, line: 774, column: 7)
!910 = distinct !DILexicalBlock(scope: !905, file: !69, line: 773, column: 3)
!911 = !DILocation(line: 774, column: 17, scope: !909)
!912 = !DILocation(line: 774, column: 7, scope: !910)
!913 = !DILocation(line: 776, column: 17, scope: !914)
!914 = distinct !DILexicalBlock(scope: !909, file: !69, line: 775, column: 4)
!915 = !DILocation(line: 776, column: 12, scope: !914)
!916 = !DILocation(line: 776, column: 5, scope: !914)
!917 = !DILocation(line: 780, column: 5, scope: !918)
!918 = distinct !DILexicalBlock(scope: !909, file: !69, line: 779, column: 4)
!919 = !DILocation(line: 785, column: 4, scope: !920)
!920 = distinct !DILexicalBlock(scope: !905, file: !69, line: 784, column: 3)
!921 = !DILocation(line: 788, column: 1, scope: !852)
!922 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 807, type: !923, scopeLine: 808, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!923 = !DISubroutineType(types: !924)
!924 = !{!28, !6, !28, !28}
!925 = !DILocalVariable(name: "factor1", arg: 1, scope: !922, file: !69, line: 807, type: !6)
!926 = !DILocation(line: 807, column: 33, scope: !922)
!927 = !DILocalVariable(name: "factor2", arg: 2, scope: !922, file: !69, line: 807, type: !28)
!928 = !DILocation(line: 807, column: 46, scope: !922)
!929 = !DILocalVariable(name: "denominator", arg: 3, scope: !922, file: !69, line: 807, type: !28)
!930 = !DILocation(line: 807, column: 59, scope: !922)
!931 = !DILocalVariable(name: "s32Result", scope: !922, file: !69, line: 809, type: !16)
!932 = !DILocation(line: 809, column: 6, scope: !922)
!933 = !DILocalVariable(name: "s32Temp1", scope: !922, file: !69, line: 809, type: !16)
!934 = !DILocation(line: 809, column: 21, scope: !922)
!935 = !DILocation(line: 810, column: 14, scope: !922)
!936 = !DILocation(line: 810, column: 24, scope: !922)
!937 = !DILocation(line: 810, column: 22, scope: !922)
!938 = !DILocation(line: 810, column: 12, scope: !922)
!939 = !DILocation(line: 812, column: 5, scope: !940)
!940 = distinct !DILexicalBlock(scope: !922, file: !69, line: 812, column: 5)
!941 = !DILocation(line: 812, column: 17, scope: !940)
!942 = !DILocation(line: 812, column: 5, scope: !922)
!943 = !DILocation(line: 814, column: 6, scope: !944)
!944 = distinct !DILexicalBlock(scope: !945, file: !69, line: 814, column: 6)
!945 = distinct !DILexicalBlock(scope: !940, file: !69, line: 813, column: 2)
!946 = !DILocation(line: 814, column: 16, scope: !944)
!947 = !DILocation(line: 814, column: 6, scope: !945)
!948 = !DILocation(line: 816, column: 4, scope: !949)
!949 = distinct !DILexicalBlock(scope: !944, file: !69, line: 815, column: 3)
!950 = !DILocation(line: 820, column: 4, scope: !951)
!951 = distinct !DILexicalBlock(scope: !944, file: !69, line: 819, column: 3)
!952 = !DILocation(line: 825, column: 15, scope: !953)
!953 = distinct !DILexicalBlock(scope: !940, file: !69, line: 824, column: 2)
!954 = !DILocation(line: 825, column: 29, scope: !953)
!955 = !DILocation(line: 825, column: 39, scope: !953)
!956 = !DILocation(line: 825, column: 38, scope: !953)
!957 = !DILocation(line: 825, column: 54, scope: !953)
!958 = !DILocation(line: 825, column: 52, scope: !953)
!959 = !DILocation(line: 825, column: 25, scope: !953)
!960 = !DILocation(line: 825, column: 68, scope: !953)
!961 = !DILocation(line: 825, column: 12, scope: !953)
!962 = !DILocation(line: 826, column: 16, scope: !953)
!963 = !DILocation(line: 826, column: 25, scope: !953)
!964 = !DILocation(line: 826, column: 24, scope: !953)
!965 = !DILocation(line: 826, column: 41, scope: !953)
!966 = !DILocation(line: 826, column: 51, scope: !953)
!967 = !DILocation(line: 826, column: 50, scope: !953)
!968 = !DILocation(line: 826, column: 38, scope: !953)
!969 = !DILocation(line: 826, column: 13, scope: !953)
!970 = !DILocation(line: 827, column: 6, scope: !971)
!971 = distinct !DILexicalBlock(scope: !953, file: !69, line: 827, column: 6)
!972 = !DILocation(line: 827, column: 16, scope: !971)
!973 = !DILocation(line: 827, column: 6, scope: !953)
!974 = !DILocation(line: 829, column: 7, scope: !975)
!975 = distinct !DILexicalBlock(scope: !976, file: !69, line: 829, column: 7)
!976 = distinct !DILexicalBlock(scope: !971, file: !69, line: 828, column: 3)
!977 = !DILocation(line: 829, column: 17, scope: !975)
!978 = !DILocation(line: 829, column: 7, scope: !976)
!979 = !DILocation(line: 831, column: 17, scope: !980)
!980 = distinct !DILexicalBlock(scope: !975, file: !69, line: 830, column: 4)
!981 = !DILocation(line: 831, column: 12, scope: !980)
!982 = !DILocation(line: 831, column: 5, scope: !980)
!983 = !DILocation(line: 835, column: 5, scope: !984)
!984 = distinct !DILexicalBlock(scope: !975, file: !69, line: 834, column: 4)
!985 = !DILocation(line: 840, column: 4, scope: !986)
!986 = distinct !DILexicalBlock(scope: !971, file: !69, line: 839, column: 3)
!987 = !DILocation(line: 844, column: 1, scope: !922)
!988 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 862, type: !989, scopeLine: 863, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!989 = !DISubroutineType(types: !990)
!990 = !{!28, !28, !28, !28}
!991 = !DILocalVariable(name: "factor1", arg: 1, scope: !988, file: !69, line: 862, type: !28)
!992 = !DILocation(line: 862, column: 33, scope: !988)
!993 = !DILocalVariable(name: "factor2", arg: 2, scope: !988, file: !69, line: 862, type: !28)
!994 = !DILocation(line: 862, column: 46, scope: !988)
!995 = !DILocalVariable(name: "denominator", arg: 3, scope: !988, file: !69, line: 862, type: !28)
!996 = !DILocation(line: 862, column: 59, scope: !988)
!997 = !DILocalVariable(name: "u32Temp1", scope: !988, file: !69, line: 864, type: !533)
!998 = !DILocation(line: 864, column: 6, scope: !988)
!999 = !DILocalVariable(name: "u16TempDenom", scope: !988, file: !69, line: 865, type: !28)
!1000 = !DILocation(line: 865, column: 6, scope: !988)
!1001 = !DILocation(line: 867, column: 5, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !988, file: !69, line: 867, column: 5)
!1003 = !DILocation(line: 867, column: 17, scope: !1002)
!1004 = !DILocation(line: 867, column: 5, scope: !988)
!1005 = !DILocation(line: 869, column: 3, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !1002, file: !69, line: 868, column: 2)
!1007 = !DILocation(line: 873, column: 14, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !1002, file: !69, line: 872, column: 2)
!1009 = !DILocation(line: 873, column: 24, scope: !1008)
!1010 = !DILocation(line: 873, column: 22, scope: !1008)
!1011 = !DILocation(line: 873, column: 12, scope: !1008)
!1012 = !DILocation(line: 874, column: 18, scope: !1008)
!1013 = !DILocation(line: 874, column: 30, scope: !1008)
!1014 = !DILocation(line: 874, column: 16, scope: !1008)
!1015 = !DILocation(line: 875, column: 14, scope: !1008)
!1016 = !DILocation(line: 875, column: 25, scope: !1008)
!1017 = !DILocation(line: 875, column: 23, scope: !1008)
!1018 = !DILocation(line: 875, column: 12, scope: !1008)
!1019 = !DILocation(line: 876, column: 14, scope: !1008)
!1020 = !DILocation(line: 876, column: 25, scope: !1008)
!1021 = !DILocation(line: 876, column: 23, scope: !1008)
!1022 = !DILocation(line: 876, column: 12, scope: !1008)
!1023 = !DILocation(line: 877, column: 6, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1008, file: !69, line: 877, column: 6)
!1025 = !DILocation(line: 877, column: 15, scope: !1024)
!1026 = !DILocation(line: 877, column: 6, scope: !1008)
!1027 = !DILocation(line: 879, column: 12, scope: !1028)
!1028 = distinct !DILexicalBlock(scope: !1024, file: !69, line: 878, column: 3)
!1029 = !DILocation(line: 879, column: 21, scope: !1028)
!1030 = !DILocation(line: 879, column: 11, scope: !1028)
!1031 = !DILocation(line: 879, column: 4, scope: !1028)
!1032 = !DILocation(line: 884, column: 4, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1024, file: !69, line: 883, column: 3)
!1034 = !DILocation(line: 889, column: 1, scope: !988)
!1035 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 906, type: !1036, scopeLine: 907, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1036 = !DISubroutineType(types: !1037)
!1037 = !{!28, !28, !28, !533}
!1038 = !DILocalVariable(name: "factor1", arg: 1, scope: !1035, file: !69, line: 906, type: !28)
!1039 = !DILocation(line: 906, column: 33, scope: !1035)
!1040 = !DILocalVariable(name: "factor2", arg: 2, scope: !1035, file: !69, line: 906, type: !28)
!1041 = !DILocation(line: 906, column: 46, scope: !1035)
!1042 = !DILocalVariable(name: "denominator", arg: 3, scope: !1035, file: !69, line: 906, type: !533)
!1043 = !DILocation(line: 906, column: 59, scope: !1035)
!1044 = !DILocalVariable(name: "u32Temp1", scope: !1035, file: !69, line: 908, type: !533)
!1045 = !DILocation(line: 908, column: 6, scope: !1035)
!1046 = !DILocation(line: 909, column: 5, scope: !1047)
!1047 = distinct !DILexicalBlock(scope: !1035, file: !69, line: 909, column: 5)
!1048 = !DILocation(line: 909, column: 17, scope: !1047)
!1049 = !DILocation(line: 909, column: 5, scope: !1035)
!1050 = !DILocation(line: 911, column: 3, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1047, file: !69, line: 910, column: 2)
!1052 = !DILocation(line: 915, column: 15, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1047, file: !69, line: 914, column: 2)
!1054 = !DILocation(line: 915, column: 25, scope: !1053)
!1055 = !DILocation(line: 915, column: 23, scope: !1053)
!1056 = !DILocation(line: 915, column: 36, scope: !1053)
!1057 = !DILocation(line: 915, column: 34, scope: !1053)
!1058 = !DILocation(line: 915, column: 12, scope: !1053)
!1059 = !DILocation(line: 916, column: 8, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1053, file: !69, line: 916, column: 6)
!1061 = !DILocation(line: 916, column: 18, scope: !1060)
!1062 = !DILocation(line: 916, column: 16, scope: !1060)
!1063 = !DILocation(line: 916, column: 28, scope: !1060)
!1064 = !DILocation(line: 916, column: 40, scope: !1060)
!1065 = !DILocation(line: 916, column: 39, scope: !1060)
!1066 = !DILocation(line: 916, column: 26, scope: !1060)
!1067 = !DILocation(line: 916, column: 53, scope: !1060)
!1068 = !DILocation(line: 916, column: 64, scope: !1060)
!1069 = !DILocation(line: 916, column: 50, scope: !1060)
!1070 = !DILocation(line: 916, column: 6, scope: !1053)
!1071 = !DILocation(line: 918, column: 12, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1060, file: !69, line: 917, column: 3)
!1073 = !DILocation(line: 919, column: 3, scope: !1072)
!1074 = !DILocation(line: 920, column: 6, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1053, file: !69, line: 920, column: 6)
!1076 = !DILocation(line: 920, column: 15, scope: !1075)
!1077 = !DILocation(line: 920, column: 6, scope: !1053)
!1078 = !DILocation(line: 922, column: 12, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1075, file: !69, line: 921, column: 3)
!1080 = !DILocation(line: 922, column: 21, scope: !1079)
!1081 = !DILocation(line: 922, column: 11, scope: !1079)
!1082 = !DILocation(line: 922, column: 4, scope: !1079)
!1083 = !DILocation(line: 926, column: 4, scope: !1084)
!1084 = distinct !DILexicalBlock(scope: !1075, file: !69, line: 925, column: 3)
!1085 = !DILocation(line: 929, column: 1, scope: !1035)
!1086 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 946, type: !1087, scopeLine: 947, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1087 = !DISubroutineType(types: !1088)
!1088 = !{!533, !533, !28}
!1089 = !DILocalVariable(name: "x_value", arg: 1, scope: !1086, file: !69, line: 946, type: !533)
!1090 = !DILocation(line: 946, column: 25, scope: !1086)
!1091 = !DILocalVariable(name: "y_value", arg: 2, scope: !1086, file: !69, line: 946, type: !28)
!1092 = !DILocation(line: 946, column: 38, scope: !1086)
!1093 = !DILocalVariable(name: "u32Temp1", scope: !1086, file: !69, line: 948, type: !533)
!1094 = !DILocation(line: 948, column: 6, scope: !1086)
!1095 = !DILocation(line: 949, column: 5, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1086, file: !69, line: 949, column: 5)
!1097 = !DILocation(line: 949, column: 13, scope: !1096)
!1098 = !DILocation(line: 949, column: 5, scope: !1086)
!1099 = !DILocation(line: 951, column: 3, scope: !1100)
!1100 = distinct !DILexicalBlock(scope: !1096, file: !69, line: 950, column: 2)
!1101 = !DILocation(line: 955, column: 15, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1096, file: !69, line: 954, column: 2)
!1103 = !DILocation(line: 955, column: 26, scope: !1102)
!1104 = !DILocation(line: 955, column: 34, scope: !1102)
!1105 = !DILocation(line: 955, column: 33, scope: !1102)
!1106 = !DILocation(line: 955, column: 45, scope: !1102)
!1107 = !DILocation(line: 955, column: 43, scope: !1102)
!1108 = !DILocation(line: 955, column: 23, scope: !1102)
!1109 = !DILocation(line: 955, column: 54, scope: !1102)
!1110 = !DILocation(line: 955, column: 12, scope: !1102)
!1111 = !DILocation(line: 956, column: 15, scope: !1102)
!1112 = !DILocation(line: 956, column: 23, scope: !1102)
!1113 = !DILocation(line: 956, column: 22, scope: !1102)
!1114 = !DILocation(line: 956, column: 35, scope: !1102)
!1115 = !DILocation(line: 956, column: 44, scope: !1102)
!1116 = !DILocation(line: 956, column: 43, scope: !1102)
!1117 = !DILocation(line: 956, column: 32, scope: !1102)
!1118 = !DILocation(line: 956, column: 12, scope: !1102)
!1119 = !DILocation(line: 957, column: 10, scope: !1102)
!1120 = !DILocation(line: 957, column: 3, scope: !1102)
!1121 = !DILocation(line: 959, column: 1, scope: !1086)
!1122 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 977, type: !1123, scopeLine: 978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1123 = !DISubroutineType(types: !1124)
!1124 = !{!6, !6, !6, !6}
!1125 = !DILocalVariable(name: "fak1", arg: 1, scope: !1122, file: !69, line: 977, type: !6)
!1126 = !DILocation(line: 977, column: 33, scope: !1122)
!1127 = !DILocalVariable(name: "fak2", arg: 2, scope: !1122, file: !69, line: 977, type: !6)
!1128 = !DILocation(line: 977, column: 43, scope: !1122)
!1129 = !DILocalVariable(name: "div", arg: 3, scope: !1122, file: !69, line: 977, type: !6)
!1130 = !DILocation(line: 977, column: 53, scope: !1122)
!1131 = !DILocalVariable(name: "s32Temp1", scope: !1122, file: !69, line: 979, type: !16)
!1132 = !DILocation(line: 979, column: 6, scope: !1122)
!1133 = !DILocalVariable(name: "s32Temp2", scope: !1122, file: !69, line: 979, type: !16)
!1134 = !DILocation(line: 979, column: 20, scope: !1122)
!1135 = !DILocalVariable(name: "s32Temp3", scope: !1122, file: !69, line: 979, type: !16)
!1136 = !DILocation(line: 979, column: 34, scope: !1122)
!1137 = !DILocation(line: 980, column: 13, scope: !1122)
!1138 = !DILocation(line: 980, column: 20, scope: !1122)
!1139 = !DILocation(line: 980, column: 18, scope: !1122)
!1140 = !DILocation(line: 980, column: 11, scope: !1122)
!1141 = !DILocation(line: 981, column: 5, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1122, file: !69, line: 981, column: 5)
!1143 = !DILocation(line: 981, column: 9, scope: !1142)
!1144 = !DILocation(line: 981, column: 5, scope: !1122)
!1145 = !DILocation(line: 983, column: 6, scope: !1146)
!1146 = distinct !DILexicalBlock(scope: !1147, file: !69, line: 983, column: 6)
!1147 = distinct !DILexicalBlock(scope: !1142, file: !69, line: 982, column: 2)
!1148 = !DILocation(line: 983, column: 15, scope: !1146)
!1149 = !DILocation(line: 983, column: 6, scope: !1147)
!1150 = !DILocation(line: 985, column: 4, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1146, file: !69, line: 984, column: 3)
!1152 = !DILocation(line: 989, column: 4, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1146, file: !69, line: 988, column: 3)
!1154 = !DILocation(line: 994, column: 15, scope: !1155)
!1155 = distinct !DILexicalBlock(scope: !1142, file: !69, line: 993, column: 2)
!1156 = !DILocation(line: 994, column: 28, scope: !1155)
!1157 = !DILocation(line: 994, column: 39, scope: !1155)
!1158 = !DILocation(line: 994, column: 37, scope: !1155)
!1159 = !DILocation(line: 994, column: 46, scope: !1155)
!1160 = !DILocation(line: 994, column: 44, scope: !1155)
!1161 = !DILocation(line: 994, column: 24, scope: !1155)
!1162 = !DILocation(line: 994, column: 52, scope: !1155)
!1163 = !DILocation(line: 994, column: 12, scope: !1155)
!1164 = !DILocation(line: 995, column: 15, scope: !1155)
!1165 = !DILocation(line: 995, column: 24, scope: !1155)
!1166 = !DILocation(line: 995, column: 23, scope: !1155)
!1167 = !DILocation(line: 995, column: 32, scope: !1155)
!1168 = !DILocation(line: 995, column: 41, scope: !1155)
!1169 = !DILocation(line: 995, column: 40, scope: !1155)
!1170 = !DILocation(line: 995, column: 29, scope: !1155)
!1171 = !DILocation(line: 995, column: 12, scope: !1155)
!1172 = !DILocation(line: 996, column: 6, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1155, file: !69, line: 996, column: 6)
!1174 = !DILocation(line: 996, column: 15, scope: !1173)
!1175 = !DILocation(line: 996, column: 6, scope: !1155)
!1176 = !DILocation(line: 998, column: 7, scope: !1177)
!1177 = distinct !DILexicalBlock(scope: !1178, file: !69, line: 998, column: 7)
!1178 = distinct !DILexicalBlock(scope: !1173, file: !69, line: 997, column: 3)
!1179 = !DILocation(line: 998, column: 16, scope: !1177)
!1180 = !DILocation(line: 998, column: 7, scope: !1178)
!1181 = !DILocation(line: 1000, column: 17, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1177, file: !69, line: 999, column: 4)
!1183 = !DILocation(line: 1000, column: 12, scope: !1182)
!1184 = !DILocation(line: 1000, column: 5, scope: !1182)
!1185 = !DILocation(line: 1004, column: 5, scope: !1186)
!1186 = distinct !DILexicalBlock(scope: !1177, file: !69, line: 1003, column: 4)
!1187 = !DILocation(line: 1009, column: 4, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1173, file: !69, line: 1008, column: 3)
!1189 = !DILocation(line: 1012, column: 1, scope: !1122)
!1190 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1030, type: !1191, scopeLine: 1031, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1191 = !DISubroutineType(types: !1192)
!1192 = !{!6, !6, !6, !28}
!1193 = !DILocalVariable(name: "data1", arg: 1, scope: !1190, file: !69, line: 1030, type: !6)
!1194 = !DILocation(line: 1030, column: 33, scope: !1190)
!1195 = !DILocalVariable(name: "data2", arg: 2, scope: !1190, file: !69, line: 1030, type: !6)
!1196 = !DILocation(line: 1030, column: 43, scope: !1190)
!1197 = !DILocalVariable(name: "denominator", arg: 3, scope: !1190, file: !69, line: 1030, type: !28)
!1198 = !DILocation(line: 1030, column: 53, scope: !1190)
!1199 = !DILocalVariable(name: "s32Result", scope: !1190, file: !69, line: 1032, type: !16)
!1200 = !DILocation(line: 1032, column: 6, scope: !1190)
!1201 = !DILocalVariable(name: "s32Temp1", scope: !1190, file: !69, line: 1032, type: !16)
!1202 = !DILocation(line: 1032, column: 21, scope: !1190)
!1203 = !DILocation(line: 1033, column: 14, scope: !1190)
!1204 = !DILocation(line: 1033, column: 22, scope: !1190)
!1205 = !DILocation(line: 1033, column: 20, scope: !1190)
!1206 = !DILocation(line: 1033, column: 12, scope: !1190)
!1207 = !DILocation(line: 1035, column: 5, scope: !1208)
!1208 = distinct !DILexicalBlock(scope: !1190, file: !69, line: 1035, column: 5)
!1209 = !DILocation(line: 1035, column: 17, scope: !1208)
!1210 = !DILocation(line: 1035, column: 5, scope: !1190)
!1211 = !DILocation(line: 1037, column: 6, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1213, file: !69, line: 1037, column: 6)
!1213 = distinct !DILexicalBlock(scope: !1208, file: !69, line: 1036, column: 2)
!1214 = !DILocation(line: 1037, column: 16, scope: !1212)
!1215 = !DILocation(line: 1037, column: 6, scope: !1213)
!1216 = !DILocation(line: 1039, column: 4, scope: !1217)
!1217 = distinct !DILexicalBlock(scope: !1212, file: !69, line: 1038, column: 3)
!1218 = !DILocation(line: 1041, column: 11, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1212, file: !69, line: 1041, column: 11)
!1220 = !DILocation(line: 1041, column: 21, scope: !1219)
!1221 = !DILocation(line: 1041, column: 11, scope: !1212)
!1222 = !DILocation(line: 1043, column: 4, scope: !1223)
!1223 = distinct !DILexicalBlock(scope: !1219, file: !69, line: 1042, column: 3)
!1224 = !DILocation(line: 1047, column: 4, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1219, file: !69, line: 1046, column: 3)
!1226 = !DILocation(line: 1052, column: 15, scope: !1227)
!1227 = distinct !DILexicalBlock(scope: !1208, file: !69, line: 1051, column: 2)
!1228 = !DILocation(line: 1052, column: 28, scope: !1227)
!1229 = !DILocation(line: 1052, column: 38, scope: !1227)
!1230 = !DILocation(line: 1052, column: 37, scope: !1227)
!1231 = !DILocation(line: 1052, column: 51, scope: !1227)
!1232 = !DILocation(line: 1052, column: 50, scope: !1227)
!1233 = !DILocation(line: 1052, column: 25, scope: !1227)
!1234 = !DILocation(line: 1052, column: 64, scope: !1227)
!1235 = !DILocation(line: 1052, column: 12, scope: !1227)
!1236 = !DILocation(line: 1053, column: 16, scope: !1227)
!1237 = !DILocation(line: 1053, column: 25, scope: !1227)
!1238 = !DILocation(line: 1053, column: 24, scope: !1227)
!1239 = !DILocation(line: 1053, column: 41, scope: !1227)
!1240 = !DILocation(line: 1053, column: 51, scope: !1227)
!1241 = !DILocation(line: 1053, column: 50, scope: !1227)
!1242 = !DILocation(line: 1053, column: 38, scope: !1227)
!1243 = !DILocation(line: 1053, column: 13, scope: !1227)
!1244 = !DILocation(line: 1054, column: 6, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1227, file: !69, line: 1054, column: 6)
!1246 = !DILocation(line: 1054, column: 16, scope: !1245)
!1247 = !DILocation(line: 1054, column: 6, scope: !1227)
!1248 = !DILocation(line: 1056, column: 7, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1250, file: !69, line: 1056, column: 7)
!1250 = distinct !DILexicalBlock(scope: !1245, file: !69, line: 1055, column: 3)
!1251 = !DILocation(line: 1056, column: 17, scope: !1249)
!1252 = !DILocation(line: 1056, column: 7, scope: !1250)
!1253 = !DILocation(line: 1058, column: 17, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1249, file: !69, line: 1057, column: 4)
!1255 = !DILocation(line: 1058, column: 12, scope: !1254)
!1256 = !DILocation(line: 1058, column: 5, scope: !1254)
!1257 = !DILocation(line: 1062, column: 5, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1249, file: !69, line: 1061, column: 4)
!1259 = !DILocation(line: 1067, column: 4, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1245, file: !69, line: 1066, column: 3)
!1261 = !DILocation(line: 1071, column: 1, scope: !1190)
!1262 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1088, type: !1263, scopeLine: 1089, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1263 = !DISubroutineType(types: !1264)
!1264 = !{!533, !533, !16}
!1265 = !DILocalVariable(name: "numerator", arg: 1, scope: !1262, file: !69, line: 1088, type: !533)
!1266 = !DILocation(line: 1088, column: 25, scope: !1262)
!1267 = !DILocalVariable(name: "denominator", arg: 2, scope: !1262, file: !69, line: 1088, type: !16)
!1268 = !DILocation(line: 1088, column: 40, scope: !1262)
!1269 = !DILocalVariable(name: "u32Temp1", scope: !1262, file: !69, line: 1090, type: !533)
!1270 = !DILocation(line: 1090, column: 6, scope: !1262)
!1271 = !DILocation(line: 1091, column: 5, scope: !1272)
!1272 = distinct !DILexicalBlock(scope: !1262, file: !69, line: 1091, column: 5)
!1273 = !DILocation(line: 1091, column: 17, scope: !1272)
!1274 = !DILocation(line: 1091, column: 5, scope: !1262)
!1275 = !DILocation(line: 1093, column: 3, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1272, file: !69, line: 1092, column: 2)
!1277 = !DILocation(line: 1097, column: 6, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1279, file: !69, line: 1097, column: 6)
!1279 = distinct !DILexicalBlock(scope: !1272, file: !69, line: 1096, column: 2)
!1280 = !DILocation(line: 1097, column: 18, scope: !1278)
!1281 = !DILocation(line: 1097, column: 6, scope: !1279)
!1282 = !DILocation(line: 1099, column: 4, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1278, file: !69, line: 1098, column: 3)
!1284 = !DILocation(line: 1103, column: 16, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1278, file: !69, line: 1102, column: 3)
!1286 = !DILocation(line: 1103, column: 30, scope: !1285)
!1287 = !DILocation(line: 1103, column: 40, scope: !1285)
!1288 = !DILocation(line: 1103, column: 39, scope: !1285)
!1289 = !DILocation(line: 1103, column: 55, scope: !1285)
!1290 = !DILocation(line: 1103, column: 53, scope: !1285)
!1291 = !DILocation(line: 1103, column: 26, scope: !1285)
!1292 = !DILocation(line: 1103, column: 68, scope: !1285)
!1293 = !DILocation(line: 1103, column: 13, scope: !1285)
!1294 = !DILocation(line: 1104, column: 16, scope: !1285)
!1295 = !DILocation(line: 1104, column: 25, scope: !1285)
!1296 = !DILocation(line: 1104, column: 24, scope: !1285)
!1297 = !DILocation(line: 1104, column: 41, scope: !1285)
!1298 = !DILocation(line: 1104, column: 51, scope: !1285)
!1299 = !DILocation(line: 1104, column: 50, scope: !1285)
!1300 = !DILocation(line: 1104, column: 38, scope: !1285)
!1301 = !DILocation(line: 1104, column: 13, scope: !1285)
!1302 = !DILocation(line: 1105, column: 11, scope: !1285)
!1303 = !DILocation(line: 1105, column: 4, scope: !1285)
!1304 = !DILocation(line: 1108, column: 1, scope: !1262)
!1305 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1125, type: !1306, scopeLine: 1126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1306 = !DISubroutineType(types: !1307)
!1307 = !{!533, !16, !533}
!1308 = !DILocalVariable(name: "numerator", arg: 1, scope: !1305, file: !69, line: 1125, type: !16)
!1309 = !DILocation(line: 1125, column: 25, scope: !1305)
!1310 = !DILocalVariable(name: "denominator", arg: 2, scope: !1305, file: !69, line: 1125, type: !533)
!1311 = !DILocation(line: 1125, column: 40, scope: !1305)
!1312 = !DILocalVariable(name: "s32Temp1", scope: !1305, file: !69, line: 1127, type: !16)
!1313 = !DILocation(line: 1127, column: 6, scope: !1305)
!1314 = !DILocation(line: 1128, column: 5, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1305, file: !69, line: 1128, column: 5)
!1316 = !DILocation(line: 1128, column: 17, scope: !1315)
!1317 = !DILocation(line: 1128, column: 5, scope: !1305)
!1318 = !DILocation(line: 1130, column: 6, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1320, file: !69, line: 1130, column: 6)
!1320 = distinct !DILexicalBlock(scope: !1315, file: !69, line: 1129, column: 2)
!1321 = !DILocation(line: 1130, column: 16, scope: !1319)
!1322 = !DILocation(line: 1130, column: 6, scope: !1320)
!1323 = !DILocation(line: 1132, column: 4, scope: !1324)
!1324 = distinct !DILexicalBlock(scope: !1319, file: !69, line: 1131, column: 3)
!1325 = !DILocation(line: 1136, column: 4, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1319, file: !69, line: 1135, column: 3)
!1327 = !DILocation(line: 1141, column: 6, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1329, file: !69, line: 1141, column: 6)
!1329 = distinct !DILexicalBlock(scope: !1315, file: !69, line: 1140, column: 2)
!1330 = !DILocation(line: 1141, column: 16, scope: !1328)
!1331 = !DILocation(line: 1141, column: 6, scope: !1329)
!1332 = !DILocation(line: 1143, column: 17, scope: !1333)
!1333 = distinct !DILexicalBlock(scope: !1328, file: !69, line: 1142, column: 3)
!1334 = !DILocation(line: 1143, column: 31, scope: !1333)
!1335 = !DILocation(line: 1143, column: 41, scope: !1333)
!1336 = !DILocation(line: 1143, column: 40, scope: !1333)
!1337 = !DILocation(line: 1143, column: 56, scope: !1333)
!1338 = !DILocation(line: 1143, column: 54, scope: !1333)
!1339 = !DILocation(line: 1143, column: 27, scope: !1333)
!1340 = !DILocation(line: 1143, column: 69, scope: !1333)
!1341 = !DILocation(line: 1143, column: 13, scope: !1333)
!1342 = !DILocation(line: 1144, column: 13, scope: !1333)
!1343 = !DILocation(line: 1144, column: 23, scope: !1333)
!1344 = !DILocation(line: 1144, column: 22, scope: !1333)
!1345 = !DILocation(line: 1144, column: 39, scope: !1333)
!1346 = !DILocation(line: 1144, column: 48, scope: !1333)
!1347 = !DILocation(line: 1144, column: 47, scope: !1333)
!1348 = !DILocation(line: 1144, column: 36, scope: !1333)
!1349 = !DILocation(line: 1144, column: 4, scope: !1333)
!1350 = !DILocation(line: 1148, column: 4, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1328, file: !69, line: 1147, column: 3)
!1352 = !DILocation(line: 1151, column: 1, scope: !1305)
!1353 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1168, type: !1354, scopeLine: 1169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1354 = !DISubroutineType(types: !1355)
!1355 = !{!533, !16, !16}
!1356 = !DILocalVariable(name: "numerator", arg: 1, scope: !1353, file: !69, line: 1168, type: !16)
!1357 = !DILocation(line: 1168, column: 25, scope: !1353)
!1358 = !DILocalVariable(name: "denominator", arg: 2, scope: !1353, file: !69, line: 1168, type: !16)
!1359 = !DILocation(line: 1168, column: 40, scope: !1353)
!1360 = !DILocalVariable(name: "u32Temp1", scope: !1353, file: !69, line: 1170, type: !533)
!1361 = !DILocation(line: 1170, column: 6, scope: !1353)
!1362 = !DILocalVariable(name: "u32Temp2", scope: !1353, file: !69, line: 1170, type: !533)
!1363 = !DILocation(line: 1170, column: 20, scope: !1353)
!1364 = !DILocation(line: 1171, column: 5, scope: !1365)
!1365 = distinct !DILexicalBlock(scope: !1353, file: !69, line: 1171, column: 5)
!1366 = !DILocation(line: 1171, column: 17, scope: !1365)
!1367 = !DILocation(line: 1171, column: 5, scope: !1353)
!1368 = !DILocation(line: 1173, column: 6, scope: !1369)
!1369 = distinct !DILexicalBlock(scope: !1370, file: !69, line: 1173, column: 6)
!1370 = distinct !DILexicalBlock(scope: !1365, file: !69, line: 1172, column: 2)
!1371 = !DILocation(line: 1173, column: 16, scope: !1369)
!1372 = !DILocation(line: 1173, column: 6, scope: !1370)
!1373 = !DILocation(line: 1175, column: 4, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1369, file: !69, line: 1174, column: 3)
!1375 = !DILocation(line: 1179, column: 4, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1369, file: !69, line: 1178, column: 3)
!1377 = !DILocation(line: 1184, column: 6, scope: !1378)
!1378 = distinct !DILexicalBlock(scope: !1379, file: !69, line: 1184, column: 6)
!1379 = distinct !DILexicalBlock(scope: !1365, file: !69, line: 1183, column: 2)
!1380 = !DILocation(line: 1184, column: 16, scope: !1378)
!1381 = !DILocation(line: 1184, column: 6, scope: !1379)
!1382 = !DILocation(line: 1186, column: 7, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1384, file: !69, line: 1186, column: 7)
!1384 = distinct !DILexicalBlock(scope: !1378, file: !69, line: 1185, column: 3)
!1385 = !DILocation(line: 1186, column: 17, scope: !1383)
!1386 = !DILocation(line: 1186, column: 7, scope: !1384)
!1387 = !DILocation(line: 1188, column: 5, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1383, file: !69, line: 1187, column: 4)
!1389 = !DILocation(line: 1192, column: 8, scope: !1390)
!1390 = distinct !DILexicalBlock(scope: !1391, file: !69, line: 1192, column: 8)
!1391 = distinct !DILexicalBlock(scope: !1383, file: !69, line: 1191, column: 4)
!1392 = !DILocation(line: 1192, column: 20, scope: !1390)
!1393 = !DILocation(line: 1192, column: 8, scope: !1391)
!1394 = !DILocation(line: 1194, column: 6, scope: !1395)
!1395 = distinct !DILexicalBlock(scope: !1390, file: !69, line: 1193, column: 5)
!1396 = !DILocation(line: 1198, column: 18, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1390, file: !69, line: 1197, column: 5)
!1398 = !DILocation(line: 1198, column: 32, scope: !1397)
!1399 = !DILocation(line: 1198, column: 42, scope: !1397)
!1400 = !DILocation(line: 1198, column: 41, scope: !1397)
!1401 = !DILocation(line: 1198, column: 57, scope: !1397)
!1402 = !DILocation(line: 1198, column: 55, scope: !1397)
!1403 = !DILocation(line: 1198, column: 28, scope: !1397)
!1404 = !DILocation(line: 1198, column: 71, scope: !1397)
!1405 = !DILocation(line: 1198, column: 15, scope: !1397)
!1406 = !DILocation(line: 1199, column: 18, scope: !1397)
!1407 = !DILocation(line: 1199, column: 29, scope: !1397)
!1408 = !DILocation(line: 1199, column: 27, scope: !1397)
!1409 = !DILocation(line: 1199, column: 45, scope: !1397)
!1410 = !DILocation(line: 1199, column: 57, scope: !1397)
!1411 = !DILocation(line: 1199, column: 55, scope: !1397)
!1412 = !DILocation(line: 1199, column: 42, scope: !1397)
!1413 = !DILocation(line: 1199, column: 15, scope: !1397)
!1414 = !DILocation(line: 1200, column: 13, scope: !1397)
!1415 = !DILocation(line: 1200, column: 6, scope: !1397)
!1416 = !DILocation(line: 1206, column: 7, scope: !1417)
!1417 = distinct !DILexicalBlock(scope: !1418, file: !69, line: 1206, column: 7)
!1418 = distinct !DILexicalBlock(scope: !1378, file: !69, line: 1205, column: 3)
!1419 = !DILocation(line: 1206, column: 19, scope: !1417)
!1420 = !DILocation(line: 1206, column: 7, scope: !1418)
!1421 = !DILocation(line: 1208, column: 5, scope: !1422)
!1422 = distinct !DILexicalBlock(scope: !1417, file: !69, line: 1207, column: 4)
!1423 = !DILocation(line: 1212, column: 18, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !1417, file: !69, line: 1211, column: 4)
!1425 = !DILocation(line: 1212, column: 17, scope: !1424)
!1426 = !DILocation(line: 1212, column: 15, scope: !1424)
!1427 = !DILocation(line: 1213, column: 20, scope: !1424)
!1428 = !DILocation(line: 1213, column: 19, scope: !1424)
!1429 = !DILocation(line: 1213, column: 17, scope: !1424)
!1430 = !DILocation(line: 1214, column: 17, scope: !1424)
!1431 = !DILocation(line: 1214, column: 31, scope: !1424)
!1432 = !DILocation(line: 1214, column: 41, scope: !1424)
!1433 = !DILocation(line: 1214, column: 40, scope: !1424)
!1434 = !DILocation(line: 1214, column: 56, scope: !1424)
!1435 = !DILocation(line: 1214, column: 54, scope: !1424)
!1436 = !DILocation(line: 1214, column: 27, scope: !1424)
!1437 = !DILocation(line: 1214, column: 70, scope: !1424)
!1438 = !DILocation(line: 1214, column: 14, scope: !1424)
!1439 = !DILocation(line: 1215, column: 17, scope: !1424)
!1440 = !DILocation(line: 1215, column: 28, scope: !1424)
!1441 = !DILocation(line: 1215, column: 26, scope: !1424)
!1442 = !DILocation(line: 1215, column: 44, scope: !1424)
!1443 = !DILocation(line: 1215, column: 56, scope: !1424)
!1444 = !DILocation(line: 1215, column: 54, scope: !1424)
!1445 = !DILocation(line: 1215, column: 41, scope: !1424)
!1446 = !DILocation(line: 1215, column: 14, scope: !1424)
!1447 = !DILocation(line: 1216, column: 12, scope: !1424)
!1448 = !DILocation(line: 1216, column: 5, scope: !1424)
!1449 = !DILocation(line: 1221, column: 1, scope: !1353)
!1450 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1238, type: !1451, scopeLine: 1239, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1451 = !DISubroutineType(types: !1452)
!1452 = !{!533, !533, !533}
!1453 = !DILocalVariable(name: "numerator", arg: 1, scope: !1450, file: !69, line: 1238, type: !533)
!1454 = !DILocation(line: 1238, column: 25, scope: !1450)
!1455 = !DILocalVariable(name: "denominator", arg: 2, scope: !1450, file: !69, line: 1238, type: !533)
!1456 = !DILocation(line: 1238, column: 40, scope: !1450)
!1457 = !DILocalVariable(name: "u32Temp1", scope: !1450, file: !69, line: 1241, type: !533)
!1458 = !DILocation(line: 1241, column: 6, scope: !1450)
!1459 = !DILocalVariable(name: "u32Temp2", scope: !1450, file: !69, line: 1241, type: !533)
!1460 = !DILocation(line: 1241, column: 20, scope: !1450)
!1461 = !DILocalVariable(name: "u32Temp3", scope: !1450, file: !69, line: 1241, type: !533)
!1462 = !DILocation(line: 1241, column: 34, scope: !1450)
!1463 = !DILocalVariable(name: "numerator_old", scope: !1450, file: !69, line: 1241, type: !533)
!1464 = !DILocation(line: 1241, column: 48, scope: !1450)
!1465 = !DILocation(line: 1242, column: 5, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1450, file: !69, line: 1242, column: 5)
!1467 = !DILocation(line: 1242, column: 16, scope: !1466)
!1468 = !DILocation(line: 1242, column: 5, scope: !1450)
!1469 = !DILocation(line: 1244, column: 3, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1466, file: !69, line: 1243, column: 2)
!1471 = !DILocation(line: 1248, column: 14, scope: !1472)
!1472 = distinct !DILexicalBlock(scope: !1466, file: !69, line: 1247, column: 2)
!1473 = !DILocation(line: 1248, column: 26, scope: !1472)
!1474 = !DILocation(line: 1248, column: 41, scope: !1472)
!1475 = !DILocation(line: 1248, column: 51, scope: !1472)
!1476 = !DILocation(line: 1248, column: 50, scope: !1472)
!1477 = !DILocation(line: 1248, column: 38, scope: !1472)
!1478 = !DILocation(line: 1248, column: 24, scope: !1472)
!1479 = !DILocation(line: 1248, column: 12, scope: !1472)
!1480 = !DILocation(line: 1249, column: 7, scope: !1481)
!1481 = distinct !DILexicalBlock(scope: !1472, file: !69, line: 1249, column: 6)
!1482 = !DILocation(line: 1249, column: 16, scope: !1481)
!1483 = !DILocation(line: 1249, column: 24, scope: !1481)
!1484 = !DILocation(line: 1249, column: 6, scope: !1472)
!1485 = !DILocation(line: 1251, column: 16, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1481, file: !69, line: 1250, column: 3)
!1487 = !DILocation(line: 1251, column: 27, scope: !1486)
!1488 = !DILocation(line: 1251, column: 13, scope: !1486)
!1489 = !DILocation(line: 1252, column: 3, scope: !1486)
!1490 = !DILocation(line: 1255, column: 16, scope: !1491)
!1491 = distinct !DILexicalBlock(scope: !1481, file: !69, line: 1254, column: 3)
!1492 = !DILocation(line: 1255, column: 27, scope: !1491)
!1493 = !DILocation(line: 1255, column: 32, scope: !1491)
!1494 = !DILocation(line: 1255, column: 13, scope: !1491)
!1495 = !DILocation(line: 1258, column: 6, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1472, file: !69, line: 1258, column: 6)
!1497 = !DILocation(line: 1258, column: 17, scope: !1496)
!1498 = !DILocation(line: 1258, column: 15, scope: !1496)
!1499 = !DILocation(line: 1258, column: 6, scope: !1472)
!1500 = !DILocation(line: 1260, column: 12, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1496, file: !69, line: 1259, column: 3)
!1502 = !DILocation(line: 1260, column: 22, scope: !1501)
!1503 = !DILocation(line: 1260, column: 21, scope: !1501)
!1504 = !DILocation(line: 1260, column: 4, scope: !1501)
!1505 = !DILocation(line: 1264, column: 13, scope: !1506)
!1506 = distinct !DILexicalBlock(scope: !1496, file: !69, line: 1263, column: 3)
!1507 = !DILocation(line: 1264, column: 23, scope: !1506)
!1508 = !DILocation(line: 1264, column: 22, scope: !1506)
!1509 = !DILocation(line: 1264, column: 36, scope: !1506)
!1510 = !DILocation(line: 1264, column: 4, scope: !1506)
!1511 = !DILocation(line: 1269, column: 1, scope: !1450)
!1512 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1286, type: !1513, scopeLine: 1287, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1513 = !DISubroutineType(types: !1514)
!1514 = !{!16, !533, !16}
!1515 = !DILocalVariable(name: "numerator", arg: 1, scope: !1512, file: !69, line: 1286, type: !533)
!1516 = !DILocation(line: 1286, column: 25, scope: !1512)
!1517 = !DILocalVariable(name: "denominator", arg: 2, scope: !1512, file: !69, line: 1286, type: !16)
!1518 = !DILocation(line: 1286, column: 40, scope: !1512)
!1519 = !DILocalVariable(name: "u32Temp1", scope: !1512, file: !69, line: 1288, type: !533)
!1520 = !DILocation(line: 1288, column: 6, scope: !1512)
!1521 = !DILocalVariable(name: "u32Temp2", scope: !1512, file: !69, line: 1288, type: !533)
!1522 = !DILocation(line: 1288, column: 20, scope: !1512)
!1523 = !DILocation(line: 1289, column: 5, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1512, file: !69, line: 1289, column: 5)
!1525 = !DILocation(line: 1289, column: 17, scope: !1524)
!1526 = !DILocation(line: 1289, column: 5, scope: !1512)
!1527 = !DILocation(line: 1291, column: 6, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1529, file: !69, line: 1291, column: 6)
!1529 = distinct !DILexicalBlock(scope: !1524, file: !69, line: 1290, column: 2)
!1530 = !DILocation(line: 1291, column: 18, scope: !1528)
!1531 = !DILocation(line: 1291, column: 6, scope: !1529)
!1532 = !DILocation(line: 1293, column: 4, scope: !1533)
!1533 = distinct !DILexicalBlock(scope: !1528, file: !69, line: 1292, column: 3)
!1534 = !DILocation(line: 1297, column: 19, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1528, file: !69, line: 1296, column: 3)
!1536 = !DILocation(line: 1297, column: 18, scope: !1535)
!1537 = !DILocation(line: 1297, column: 16, scope: !1535)
!1538 = !DILocation(line: 1298, column: 16, scope: !1535)
!1539 = !DILocation(line: 1298, column: 30, scope: !1535)
!1540 = !DILocation(line: 1298, column: 40, scope: !1535)
!1541 = !DILocation(line: 1298, column: 39, scope: !1535)
!1542 = !DILocation(line: 1298, column: 55, scope: !1535)
!1543 = !DILocation(line: 1298, column: 53, scope: !1535)
!1544 = !DILocation(line: 1298, column: 26, scope: !1535)
!1545 = !DILocation(line: 1298, column: 69, scope: !1535)
!1546 = !DILocation(line: 1298, column: 13, scope: !1535)
!1547 = !DILocation(line: 1299, column: 16, scope: !1535)
!1548 = !DILocation(line: 1299, column: 25, scope: !1535)
!1549 = !DILocation(line: 1299, column: 24, scope: !1535)
!1550 = !DILocation(line: 1299, column: 41, scope: !1535)
!1551 = !DILocation(line: 1299, column: 51, scope: !1535)
!1552 = !DILocation(line: 1299, column: 50, scope: !1535)
!1553 = !DILocation(line: 1299, column: 38, scope: !1535)
!1554 = !DILocation(line: 1299, column: 13, scope: !1535)
!1555 = !DILocation(line: 1300, column: 7, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1535, file: !69, line: 1300, column: 7)
!1557 = !DILocation(line: 1300, column: 16, scope: !1556)
!1558 = !DILocation(line: 1300, column: 7, scope: !1535)
!1559 = !DILocation(line: 1302, column: 13, scope: !1560)
!1560 = distinct !DILexicalBlock(scope: !1556, file: !69, line: 1301, column: 4)
!1561 = !DILocation(line: 1302, column: 12, scope: !1560)
!1562 = !DILocation(line: 1302, column: 5, scope: !1560)
!1563 = !DILocation(line: 1306, column: 5, scope: !1564)
!1564 = distinct !DILexicalBlock(scope: !1556, file: !69, line: 1305, column: 4)
!1565 = !DILocation(line: 1312, column: 15, scope: !1566)
!1566 = distinct !DILexicalBlock(scope: !1524, file: !69, line: 1311, column: 2)
!1567 = !DILocation(line: 1312, column: 29, scope: !1566)
!1568 = !DILocation(line: 1312, column: 39, scope: !1566)
!1569 = !DILocation(line: 1312, column: 38, scope: !1566)
!1570 = !DILocation(line: 1312, column: 54, scope: !1566)
!1571 = !DILocation(line: 1312, column: 52, scope: !1566)
!1572 = !DILocation(line: 1312, column: 25, scope: !1566)
!1573 = !DILocation(line: 1312, column: 68, scope: !1566)
!1574 = !DILocation(line: 1312, column: 12, scope: !1566)
!1575 = !DILocation(line: 1313, column: 15, scope: !1566)
!1576 = !DILocation(line: 1313, column: 24, scope: !1566)
!1577 = !DILocation(line: 1313, column: 23, scope: !1566)
!1578 = !DILocation(line: 1313, column: 40, scope: !1566)
!1579 = !DILocation(line: 1313, column: 50, scope: !1566)
!1580 = !DILocation(line: 1313, column: 49, scope: !1566)
!1581 = !DILocation(line: 1313, column: 37, scope: !1566)
!1582 = !DILocation(line: 1313, column: 12, scope: !1566)
!1583 = !DILocation(line: 1314, column: 6, scope: !1584)
!1584 = distinct !DILexicalBlock(scope: !1566, file: !69, line: 1314, column: 6)
!1585 = !DILocation(line: 1314, column: 15, scope: !1584)
!1586 = !DILocation(line: 1314, column: 6, scope: !1566)
!1587 = !DILocation(line: 1316, column: 11, scope: !1588)
!1588 = distinct !DILexicalBlock(scope: !1584, file: !69, line: 1315, column: 3)
!1589 = !DILocation(line: 1316, column: 4, scope: !1588)
!1590 = !DILocation(line: 1320, column: 4, scope: !1591)
!1591 = distinct !DILexicalBlock(scope: !1584, file: !69, line: 1319, column: 3)
!1592 = !DILocation(line: 1323, column: 1, scope: !1512)
!1593 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1341, type: !1594, scopeLine: 1342, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1594 = !DISubroutineType(types: !1595)
!1595 = !{!16, !16, !533}
!1596 = !DILocalVariable(name: "numerator", arg: 1, scope: !1593, file: !69, line: 1341, type: !16)
!1597 = !DILocation(line: 1341, column: 25, scope: !1593)
!1598 = !DILocalVariable(name: "denominator", arg: 2, scope: !1593, file: !69, line: 1341, type: !533)
!1599 = !DILocation(line: 1341, column: 40, scope: !1593)
!1600 = !DILocalVariable(name: "s32Temp1", scope: !1593, file: !69, line: 1343, type: !16)
!1601 = !DILocation(line: 1343, column: 6, scope: !1593)
!1602 = !DILocalVariable(name: "s32Temp2", scope: !1593, file: !69, line: 1343, type: !16)
!1603 = !DILocation(line: 1343, column: 20, scope: !1593)
!1604 = !DILocalVariable(name: "u32Temp0", scope: !1593, file: !69, line: 1344, type: !533)
!1605 = !DILocation(line: 1344, column: 6, scope: !1593)
!1606 = !DILocalVariable(name: "u32Temp1", scope: !1593, file: !69, line: 1344, type: !533)
!1607 = !DILocation(line: 1344, column: 20, scope: !1593)
!1608 = !DILocalVariable(name: "u32Temp2", scope: !1593, file: !69, line: 1344, type: !533)
!1609 = !DILocation(line: 1344, column: 34, scope: !1593)
!1610 = !DILocation(line: 1345, column: 5, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1593, file: !69, line: 1345, column: 5)
!1612 = !DILocation(line: 1345, column: 17, scope: !1611)
!1613 = !DILocation(line: 1345, column: 5, scope: !1593)
!1614 = !DILocation(line: 1347, column: 6, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1616, file: !69, line: 1347, column: 6)
!1616 = distinct !DILexicalBlock(scope: !1611, file: !69, line: 1346, column: 2)
!1617 = !DILocation(line: 1347, column: 16, scope: !1615)
!1618 = !DILocation(line: 1347, column: 6, scope: !1616)
!1619 = !DILocation(line: 1349, column: 4, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1615, file: !69, line: 1348, column: 3)
!1621 = !DILocation(line: 1353, column: 4, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1615, file: !69, line: 1352, column: 3)
!1623 = !DILocation(line: 1358, column: 6, scope: !1624)
!1624 = distinct !DILexicalBlock(scope: !1625, file: !69, line: 1358, column: 6)
!1625 = distinct !DILexicalBlock(scope: !1611, file: !69, line: 1357, column: 2)
!1626 = !DILocation(line: 1358, column: 16, scope: !1624)
!1627 = !DILocation(line: 1358, column: 6, scope: !1625)
!1628 = !DILocation(line: 1360, column: 16, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1624, file: !69, line: 1359, column: 3)
!1630 = !DILocation(line: 1360, column: 15, scope: !1629)
!1631 = !DILocation(line: 1360, column: 13, scope: !1629)
!1632 = !DILocation(line: 1361, column: 16, scope: !1629)
!1633 = !DILocation(line: 1361, column: 25, scope: !1629)
!1634 = !DILocation(line: 1361, column: 24, scope: !1629)
!1635 = !DILocation(line: 1361, column: 13, scope: !1629)
!1636 = !DILocation(line: 1362, column: 15, scope: !1629)
!1637 = !DILocation(line: 1362, column: 28, scope: !1629)
!1638 = !DILocation(line: 1362, column: 37, scope: !1629)
!1639 = !DILocation(line: 1362, column: 36, scope: !1629)
!1640 = !DILocation(line: 1362, column: 52, scope: !1629)
!1641 = !DILocation(line: 1362, column: 50, scope: !1629)
!1642 = !DILocation(line: 1362, column: 24, scope: !1629)
!1643 = !DILocation(line: 1362, column: 13, scope: !1629)
!1644 = !DILocation(line: 1364, column: 8, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1629, file: !69, line: 1364, column: 7)
!1646 = !DILocation(line: 1364, column: 20, scope: !1645)
!1647 = !DILocation(line: 1364, column: 27, scope: !1645)
!1648 = !DILocation(line: 1364, column: 7, scope: !1629)
!1649 = !DILocation(line: 1366, column: 20, scope: !1650)
!1650 = distinct !DILexicalBlock(scope: !1645, file: !69, line: 1365, column: 4)
!1651 = !DILocation(line: 1366, column: 32, scope: !1650)
!1652 = !DILocation(line: 1366, column: 17, scope: !1650)
!1653 = !DILocation(line: 1367, column: 4, scope: !1650)
!1654 = !DILocation(line: 1370, column: 20, scope: !1655)
!1655 = distinct !DILexicalBlock(scope: !1645, file: !69, line: 1369, column: 4)
!1656 = !DILocation(line: 1370, column: 32, scope: !1655)
!1657 = !DILocation(line: 1370, column: 38, scope: !1655)
!1658 = !DILocation(line: 1370, column: 17, scope: !1655)
!1659 = !DILocation(line: 1374, column: 7, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1629, file: !69, line: 1374, column: 7)
!1661 = !DILocation(line: 1374, column: 18, scope: !1660)
!1662 = !DILocation(line: 1374, column: 16, scope: !1660)
!1663 = !DILocation(line: 1374, column: 7, scope: !1629)
!1664 = !DILocation(line: 1376, column: 14, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1660, file: !69, line: 1375, column: 4)
!1666 = !DILocation(line: 1376, column: 13, scope: !1665)
!1667 = !DILocation(line: 1376, column: 23, scope: !1665)
!1668 = !DILocation(line: 1376, column: 5, scope: !1665)
!1669 = !DILocation(line: 1380, column: 14, scope: !1670)
!1670 = distinct !DILexicalBlock(scope: !1660, file: !69, line: 1379, column: 4)
!1671 = !DILocation(line: 1380, column: 23, scope: !1670)
!1672 = !DILocation(line: 1380, column: 12, scope: !1670)
!1673 = !DILocation(line: 1380, column: 27, scope: !1670)
!1674 = !DILocation(line: 1380, column: 5, scope: !1670)
!1675 = !DILocation(line: 1387, column: 16, scope: !1676)
!1676 = distinct !DILexicalBlock(scope: !1624, file: !69, line: 1386, column: 3)
!1677 = !DILocation(line: 1387, column: 30, scope: !1676)
!1678 = !DILocation(line: 1387, column: 40, scope: !1676)
!1679 = !DILocation(line: 1387, column: 39, scope: !1676)
!1680 = !DILocation(line: 1387, column: 55, scope: !1676)
!1681 = !DILocation(line: 1387, column: 53, scope: !1676)
!1682 = !DILocation(line: 1387, column: 26, scope: !1676)
!1683 = !DILocation(line: 1387, column: 69, scope: !1676)
!1684 = !DILocation(line: 1387, column: 13, scope: !1676)
!1685 = !DILocation(line: 1388, column: 16, scope: !1676)
!1686 = !DILocation(line: 1388, column: 26, scope: !1676)
!1687 = !DILocation(line: 1388, column: 25, scope: !1676)
!1688 = !DILocation(line: 1388, column: 42, scope: !1676)
!1689 = !DILocation(line: 1388, column: 51, scope: !1676)
!1690 = !DILocation(line: 1388, column: 50, scope: !1676)
!1691 = !DILocation(line: 1388, column: 39, scope: !1676)
!1692 = !DILocation(line: 1388, column: 13, scope: !1676)
!1693 = !DILocation(line: 1389, column: 11, scope: !1676)
!1694 = !DILocation(line: 1389, column: 4, scope: !1676)
!1695 = !DILocation(line: 1392, column: 1, scope: !1593)
!1696 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1409, type: !1697, scopeLine: 1410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1697 = !DISubroutineType(types: !1698)
!1698 = !{!16, !16, !16}
!1699 = !DILocalVariable(name: "numerator", arg: 1, scope: !1696, file: !69, line: 1409, type: !16)
!1700 = !DILocation(line: 1409, column: 25, scope: !1696)
!1701 = !DILocalVariable(name: "denominator", arg: 2, scope: !1696, file: !69, line: 1409, type: !16)
!1702 = !DILocation(line: 1409, column: 40, scope: !1696)
!1703 = !DILocalVariable(name: "s32Temp1", scope: !1696, file: !69, line: 1411, type: !16)
!1704 = !DILocation(line: 1411, column: 6, scope: !1696)
!1705 = !DILocalVariable(name: "s32Temp2", scope: !1696, file: !69, line: 1411, type: !16)
!1706 = !DILocation(line: 1411, column: 20, scope: !1696)
!1707 = !DILocalVariable(name: "denominator_prime", scope: !1696, file: !69, line: 1412, type: !533)
!1708 = !DILocation(line: 1412, column: 6, scope: !1696)
!1709 = !DILocalVariable(name: "u32Temp1", scope: !1696, file: !69, line: 1412, type: !533)
!1710 = !DILocation(line: 1412, column: 29, scope: !1696)
!1711 = !DILocalVariable(name: "u32Temp2", scope: !1696, file: !69, line: 1412, type: !533)
!1712 = !DILocation(line: 1412, column: 43, scope: !1696)
!1713 = !DILocalVariable(name: "u32numerator", scope: !1696, file: !69, line: 1413, type: !533)
!1714 = !DILocation(line: 1413, column: 6, scope: !1696)
!1715 = !DILocalVariable(name: "u32denominator", scope: !1696, file: !69, line: 1413, type: !533)
!1716 = !DILocation(line: 1413, column: 23, scope: !1696)
!1717 = !DILocation(line: 1414, column: 5, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1696, file: !69, line: 1414, column: 5)
!1719 = !DILocation(line: 1414, column: 15, scope: !1718)
!1720 = !DILocation(line: 1414, column: 5, scope: !1696)
!1721 = !DILocation(line: 1416, column: 6, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1723, file: !69, line: 1416, column: 6)
!1723 = distinct !DILexicalBlock(scope: !1718, file: !69, line: 1415, column: 2)
!1724 = !DILocation(line: 1416, column: 18, scope: !1722)
!1725 = !DILocation(line: 1416, column: 6, scope: !1723)
!1726 = !DILocation(line: 1418, column: 7, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1728, file: !69, line: 1418, column: 7)
!1728 = distinct !DILexicalBlock(scope: !1722, file: !69, line: 1417, column: 3)
!1729 = !DILocation(line: 1418, column: 19, scope: !1727)
!1730 = !DILocation(line: 1418, column: 7, scope: !1728)
!1731 = !DILocation(line: 1420, column: 5, scope: !1732)
!1732 = distinct !DILexicalBlock(scope: !1727, file: !69, line: 1419, column: 4)
!1733 = !DILocation(line: 1424, column: 21, scope: !1734)
!1734 = distinct !DILexicalBlock(scope: !1727, file: !69, line: 1423, column: 4)
!1735 = !DILocation(line: 1424, column: 20, scope: !1734)
!1736 = !DILocation(line: 1424, column: 18, scope: !1734)
!1737 = !DILocation(line: 1425, column: 23, scope: !1734)
!1738 = !DILocation(line: 1425, column: 22, scope: !1734)
!1739 = !DILocation(line: 1425, column: 20, scope: !1734)
!1740 = !DILocation(line: 1426, column: 16, scope: !1734)
!1741 = !DILocation(line: 1426, column: 33, scope: !1734)
!1742 = !DILocation(line: 1426, column: 46, scope: !1734)
!1743 = !DILocation(line: 1426, column: 45, scope: !1734)
!1744 = !DILocation(line: 1426, column: 64, scope: !1734)
!1745 = !DILocation(line: 1426, column: 62, scope: !1734)
!1746 = !DILocation(line: 1426, column: 29, scope: !1734)
!1747 = !DILocation(line: 1426, column: 81, scope: !1734)
!1748 = !DILocation(line: 1426, column: 14, scope: !1734)
!1749 = !DILocation(line: 1427, column: 17, scope: !1734)
!1750 = !DILocation(line: 1427, column: 30, scope: !1734)
!1751 = !DILocation(line: 1427, column: 29, scope: !1734)
!1752 = !DILocation(line: 1427, column: 49, scope: !1734)
!1753 = !DILocation(line: 1427, column: 58, scope: !1734)
!1754 = !DILocation(line: 1427, column: 57, scope: !1734)
!1755 = !DILocation(line: 1427, column: 46, scope: !1734)
!1756 = !DILocation(line: 1427, column: 14, scope: !1734)
!1757 = !DILocation(line: 1428, column: 8, scope: !1758)
!1758 = distinct !DILexicalBlock(scope: !1734, file: !69, line: 1428, column: 8)
!1759 = !DILocation(line: 1428, column: 17, scope: !1758)
!1760 = !DILocation(line: 1428, column: 8, scope: !1734)
!1761 = !DILocation(line: 1430, column: 13, scope: !1762)
!1762 = distinct !DILexicalBlock(scope: !1758, file: !69, line: 1429, column: 5)
!1763 = !DILocation(line: 1430, column: 6, scope: !1762)
!1764 = !DILocation(line: 1434, column: 6, scope: !1765)
!1765 = distinct !DILexicalBlock(scope: !1758, file: !69, line: 1433, column: 5)
!1766 = !DILocation(line: 1440, column: 20, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1722, file: !69, line: 1439, column: 3)
!1768 = !DILocation(line: 1440, column: 19, scope: !1767)
!1769 = !DILocation(line: 1440, column: 29, scope: !1767)
!1770 = !DILocation(line: 1440, column: 17, scope: !1767)
!1771 = !DILocation(line: 1441, column: 16, scope: !1767)
!1772 = !DILocation(line: 1441, column: 33, scope: !1767)
!1773 = !DILocation(line: 1441, column: 46, scope: !1767)
!1774 = !DILocation(line: 1441, column: 45, scope: !1767)
!1775 = !DILocation(line: 1441, column: 61, scope: !1767)
!1776 = !DILocation(line: 1441, column: 59, scope: !1767)
!1777 = !DILocation(line: 1441, column: 29, scope: !1767)
!1778 = !DILocation(line: 1441, column: 75, scope: !1767)
!1779 = !DILocation(line: 1441, column: 13, scope: !1767)
!1780 = !DILocation(line: 1442, column: 16, scope: !1767)
!1781 = !DILocation(line: 1442, column: 29, scope: !1767)
!1782 = !DILocation(line: 1442, column: 28, scope: !1767)
!1783 = !DILocation(line: 1442, column: 45, scope: !1767)
!1784 = !DILocation(line: 1442, column: 54, scope: !1767)
!1785 = !DILocation(line: 1442, column: 53, scope: !1767)
!1786 = !DILocation(line: 1442, column: 42, scope: !1767)
!1787 = !DILocation(line: 1442, column: 13, scope: !1767)
!1788 = !DILocation(line: 1443, column: 13, scope: !1767)
!1789 = !DILocation(line: 1443, column: 12, scope: !1767)
!1790 = !DILocation(line: 1443, column: 22, scope: !1767)
!1791 = !DILocation(line: 1443, column: 4, scope: !1767)
!1792 = !DILocation(line: 1448, column: 6, scope: !1793)
!1793 = distinct !DILexicalBlock(scope: !1794, file: !69, line: 1448, column: 6)
!1794 = distinct !DILexicalBlock(scope: !1718, file: !69, line: 1447, column: 2)
!1795 = !DILocation(line: 1448, column: 18, scope: !1793)
!1796 = !DILocation(line: 1448, column: 6, scope: !1794)
!1797 = !DILocation(line: 1450, column: 7, scope: !1798)
!1798 = distinct !DILexicalBlock(scope: !1799, file: !69, line: 1450, column: 7)
!1799 = distinct !DILexicalBlock(scope: !1793, file: !69, line: 1449, column: 3)
!1800 = !DILocation(line: 1450, column: 19, scope: !1798)
!1801 = !DILocation(line: 1450, column: 7, scope: !1799)
!1802 = !DILocation(line: 1452, column: 5, scope: !1803)
!1803 = distinct !DILexicalBlock(scope: !1798, file: !69, line: 1451, column: 4)
!1804 = !DILocation(line: 1456, column: 23, scope: !1805)
!1805 = distinct !DILexicalBlock(scope: !1798, file: !69, line: 1455, column: 4)
!1806 = !DILocation(line: 1456, column: 22, scope: !1805)
!1807 = !DILocation(line: 1456, column: 35, scope: !1805)
!1808 = !DILocation(line: 1456, column: 20, scope: !1805)
!1809 = !DILocation(line: 1457, column: 17, scope: !1805)
!1810 = !DILocation(line: 1457, column: 31, scope: !1805)
!1811 = !DILocation(line: 1457, column: 41, scope: !1805)
!1812 = !DILocation(line: 1457, column: 40, scope: !1805)
!1813 = !DILocation(line: 1457, column: 59, scope: !1805)
!1814 = !DILocation(line: 1457, column: 57, scope: !1805)
!1815 = !DILocation(line: 1457, column: 27, scope: !1805)
!1816 = !DILocation(line: 1457, column: 76, scope: !1805)
!1817 = !DILocation(line: 1457, column: 14, scope: !1805)
!1818 = !DILocation(line: 1458, column: 17, scope: !1805)
!1819 = !DILocation(line: 1458, column: 27, scope: !1805)
!1820 = !DILocation(line: 1458, column: 26, scope: !1805)
!1821 = !DILocation(line: 1458, column: 46, scope: !1805)
!1822 = !DILocation(line: 1458, column: 55, scope: !1805)
!1823 = !DILocation(line: 1458, column: 54, scope: !1805)
!1824 = !DILocation(line: 1458, column: 43, scope: !1805)
!1825 = !DILocation(line: 1458, column: 14, scope: !1805)
!1826 = !DILocation(line: 1459, column: 14, scope: !1805)
!1827 = !DILocation(line: 1459, column: 13, scope: !1805)
!1828 = !DILocation(line: 1459, column: 23, scope: !1805)
!1829 = !DILocation(line: 1459, column: 5, scope: !1805)
!1830 = !DILocation(line: 1464, column: 16, scope: !1831)
!1831 = distinct !DILexicalBlock(scope: !1793, file: !69, line: 1463, column: 3)
!1832 = !DILocation(line: 1464, column: 30, scope: !1831)
!1833 = !DILocation(line: 1464, column: 40, scope: !1831)
!1834 = !DILocation(line: 1464, column: 39, scope: !1831)
!1835 = !DILocation(line: 1464, column: 55, scope: !1831)
!1836 = !DILocation(line: 1464, column: 53, scope: !1831)
!1837 = !DILocation(line: 1464, column: 26, scope: !1831)
!1838 = !DILocation(line: 1464, column: 69, scope: !1831)
!1839 = !DILocation(line: 1464, column: 13, scope: !1831)
!1840 = !DILocation(line: 1465, column: 16, scope: !1831)
!1841 = !DILocation(line: 1465, column: 26, scope: !1831)
!1842 = !DILocation(line: 1465, column: 25, scope: !1831)
!1843 = !DILocation(line: 1465, column: 42, scope: !1831)
!1844 = !DILocation(line: 1465, column: 51, scope: !1831)
!1845 = !DILocation(line: 1465, column: 50, scope: !1831)
!1846 = !DILocation(line: 1465, column: 39, scope: !1831)
!1847 = !DILocation(line: 1465, column: 13, scope: !1831)
!1848 = !DILocation(line: 1466, column: 11, scope: !1831)
!1849 = !DILocation(line: 1466, column: 4, scope: !1831)
!1850 = !DILocation(line: 1469, column: 1, scope: !1696)
!1851 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1487, type: !1852, scopeLine: 1488, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1852 = !DISubroutineType(types: !1853)
!1853 = !{!6, !16, !533}
!1854 = !DILocalVariable(name: "numerator", arg: 1, scope: !1851, file: !69, line: 1487, type: !16)
!1855 = !DILocation(line: 1487, column: 25, scope: !1851)
!1856 = !DILocalVariable(name: "denominator", arg: 2, scope: !1851, file: !69, line: 1487, type: !533)
!1857 = !DILocation(line: 1487, column: 40, scope: !1851)
!1858 = !DILocalVariable(name: "numerator_prime", scope: !1851, file: !69, line: 1490, type: !533)
!1859 = !DILocation(line: 1490, column: 6, scope: !1851)
!1860 = !DILocalVariable(name: "u32Temp1", scope: !1851, file: !69, line: 1490, type: !533)
!1861 = !DILocation(line: 1490, column: 27, scope: !1851)
!1862 = !DILocalVariable(name: "u32Temp2", scope: !1851, file: !69, line: 1490, type: !533)
!1863 = !DILocation(line: 1490, column: 41, scope: !1851)
!1864 = !DILocalVariable(name: "u32Temp3", scope: !1851, file: !69, line: 1490, type: !533)
!1865 = !DILocation(line: 1490, column: 55, scope: !1851)
!1866 = !DILocalVariable(name: "s32Temp1", scope: !1851, file: !69, line: 1491, type: !16)
!1867 = !DILocation(line: 1491, column: 6, scope: !1851)
!1868 = !DILocalVariable(name: "s32Temp2", scope: !1851, file: !69, line: 1491, type: !16)
!1869 = !DILocation(line: 1491, column: 20, scope: !1851)
!1870 = !DILocalVariable(name: "s32Temp3", scope: !1851, file: !69, line: 1491, type: !16)
!1871 = !DILocation(line: 1491, column: 34, scope: !1851)
!1872 = !DILocation(line: 1492, column: 5, scope: !1873)
!1873 = distinct !DILexicalBlock(scope: !1851, file: !69, line: 1492, column: 5)
!1874 = !DILocation(line: 1492, column: 17, scope: !1873)
!1875 = !DILocation(line: 1492, column: 5, scope: !1851)
!1876 = !DILocation(line: 1494, column: 6, scope: !1877)
!1877 = distinct !DILexicalBlock(scope: !1878, file: !69, line: 1494, column: 6)
!1878 = distinct !DILexicalBlock(scope: !1873, file: !69, line: 1493, column: 2)
!1879 = !DILocation(line: 1494, column: 15, scope: !1877)
!1880 = !DILocation(line: 1494, column: 6, scope: !1878)
!1881 = !DILocation(line: 1496, column: 4, scope: !1882)
!1882 = distinct !DILexicalBlock(scope: !1877, file: !69, line: 1495, column: 3)
!1883 = !DILocation(line: 1500, column: 4, scope: !1884)
!1884 = distinct !DILexicalBlock(scope: !1877, file: !69, line: 1499, column: 3)
!1885 = !DILocation(line: 1505, column: 6, scope: !1886)
!1886 = distinct !DILexicalBlock(scope: !1887, file: !69, line: 1505, column: 6)
!1887 = distinct !DILexicalBlock(scope: !1873, file: !69, line: 1504, column: 2)
!1888 = !DILocation(line: 1505, column: 16, scope: !1886)
!1889 = !DILocation(line: 1505, column: 6, scope: !1887)
!1890 = !DILocation(line: 1507, column: 23, scope: !1891)
!1891 = distinct !DILexicalBlock(scope: !1886, file: !69, line: 1506, column: 3)
!1892 = !DILocation(line: 1507, column: 22, scope: !1891)
!1893 = !DILocation(line: 1507, column: 20, scope: !1891)
!1894 = !DILocation(line: 1508, column: 16, scope: !1891)
!1895 = !DILocation(line: 1508, column: 32, scope: !1891)
!1896 = !DILocation(line: 1508, column: 31, scope: !1891)
!1897 = !DILocation(line: 1508, column: 13, scope: !1891)
!1898 = !DILocation(line: 1509, column: 15, scope: !1891)
!1899 = !DILocation(line: 1509, column: 34, scope: !1891)
!1900 = !DILocation(line: 1509, column: 45, scope: !1891)
!1901 = !DILocation(line: 1509, column: 43, scope: !1891)
!1902 = !DILocation(line: 1509, column: 31, scope: !1891)
!1903 = !DILocation(line: 1509, column: 13, scope: !1891)
!1904 = !DILocation(line: 1511, column: 8, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1891, file: !69, line: 1511, column: 7)
!1906 = !DILocation(line: 1511, column: 20, scope: !1905)
!1907 = !DILocation(line: 1511, column: 27, scope: !1905)
!1908 = !DILocation(line: 1511, column: 7, scope: !1891)
!1909 = !DILocation(line: 1513, column: 19, scope: !1910)
!1910 = distinct !DILexicalBlock(scope: !1905, file: !69, line: 1512, column: 4)
!1911 = !DILocation(line: 1513, column: 31, scope: !1910)
!1912 = !DILocation(line: 1513, column: 17, scope: !1910)
!1913 = !DILocation(line: 1514, column: 4, scope: !1910)
!1914 = !DILocation(line: 1517, column: 20, scope: !1915)
!1915 = distinct !DILexicalBlock(scope: !1905, file: !69, line: 1516, column: 4)
!1916 = !DILocation(line: 1517, column: 32, scope: !1915)
!1917 = !DILocation(line: 1517, column: 38, scope: !1915)
!1918 = !DILocation(line: 1517, column: 17, scope: !1915)
!1919 = !DILocation(line: 1520, column: 7, scope: !1920)
!1920 = distinct !DILexicalBlock(scope: !1891, file: !69, line: 1520, column: 7)
!1921 = !DILocation(line: 1520, column: 18, scope: !1920)
!1922 = !DILocation(line: 1520, column: 16, scope: !1920)
!1923 = !DILocation(line: 1520, column: 7, scope: !1891)
!1924 = !DILocation(line: 1522, column: 18, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1920, file: !69, line: 1521, column: 4)
!1926 = !DILocation(line: 1522, column: 16, scope: !1925)
!1927 = !DILocation(line: 1522, column: 28, scope: !1925)
!1928 = !DILocation(line: 1522, column: 14, scope: !1925)
!1929 = !DILocation(line: 1523, column: 4, scope: !1925)
!1930 = !DILocation(line: 1526, column: 18, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1920, file: !69, line: 1525, column: 4)
!1932 = !DILocation(line: 1526, column: 26, scope: !1931)
!1933 = !DILocation(line: 1526, column: 16, scope: !1931)
!1934 = !DILocation(line: 1526, column: 30, scope: !1931)
!1935 = !DILocation(line: 1526, column: 14, scope: !1931)
!1936 = !DILocation(line: 1528, column: 8, scope: !1937)
!1937 = distinct !DILexicalBlock(scope: !1891, file: !69, line: 1528, column: 7)
!1938 = !DILocation(line: 1528, column: 18, scope: !1937)
!1939 = !DILocation(line: 1528, column: 7, scope: !1891)
!1940 = !DILocation(line: 1530, column: 18, scope: !1941)
!1941 = distinct !DILexicalBlock(scope: !1937, file: !69, line: 1529, column: 4)
!1942 = !DILocation(line: 1530, column: 12, scope: !1941)
!1943 = !DILocation(line: 1530, column: 5, scope: !1941)
!1944 = !DILocation(line: 1534, column: 5, scope: !1945)
!1945 = distinct !DILexicalBlock(scope: !1937, file: !69, line: 1533, column: 4)
!1946 = !DILocation(line: 1539, column: 16, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1886, file: !69, line: 1538, column: 3)
!1948 = !DILocation(line: 1539, column: 26, scope: !1947)
!1949 = !DILocation(line: 1539, column: 25, scope: !1947)
!1950 = !DILocation(line: 1539, column: 41, scope: !1947)
!1951 = !DILocation(line: 1539, column: 39, scope: !1947)
!1952 = !DILocation(line: 1539, column: 13, scope: !1947)
!1953 = !DILocation(line: 1540, column: 16, scope: !1947)
!1954 = !DILocation(line: 1540, column: 30, scope: !1947)
!1955 = !DILocation(line: 1540, column: 40, scope: !1947)
!1956 = !DILocation(line: 1540, column: 39, scope: !1947)
!1957 = !DILocation(line: 1540, column: 55, scope: !1947)
!1958 = !DILocation(line: 1540, column: 53, scope: !1947)
!1959 = !DILocation(line: 1540, column: 26, scope: !1947)
!1960 = !DILocation(line: 1540, column: 68, scope: !1947)
!1961 = !DILocation(line: 1540, column: 13, scope: !1947)
!1962 = !DILocation(line: 1541, column: 16, scope: !1947)
!1963 = !DILocation(line: 1541, column: 25, scope: !1947)
!1964 = !DILocation(line: 1541, column: 24, scope: !1947)
!1965 = !DILocation(line: 1541, column: 41, scope: !1947)
!1966 = !DILocation(line: 1541, column: 51, scope: !1947)
!1967 = !DILocation(line: 1541, column: 50, scope: !1947)
!1968 = !DILocation(line: 1541, column: 38, scope: !1947)
!1969 = !DILocation(line: 1541, column: 13, scope: !1947)
!1970 = !DILocation(line: 1542, column: 7, scope: !1971)
!1971 = distinct !DILexicalBlock(scope: !1947, file: !69, line: 1542, column: 7)
!1972 = !DILocation(line: 1542, column: 16, scope: !1971)
!1973 = !DILocation(line: 1542, column: 7, scope: !1947)
!1974 = !DILocation(line: 1544, column: 17, scope: !1975)
!1975 = distinct !DILexicalBlock(scope: !1971, file: !69, line: 1543, column: 4)
!1976 = !DILocation(line: 1544, column: 12, scope: !1975)
!1977 = !DILocation(line: 1544, column: 5, scope: !1975)
!1978 = !DILocation(line: 1548, column: 5, scope: !1979)
!1979 = distinct !DILexicalBlock(scope: !1971, file: !69, line: 1547, column: 4)
!1980 = !DILocation(line: 1552, column: 1, scope: !1851)
!1981 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1982, file: !1982, line: 12, type: !1983, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !1986)
!1982 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1983 = !DISubroutineType(types: !1984)
!1984 = !{null, !1985}
!1985 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1986 = !{!1987}
!1987 = !DILocalVariable(name: "z", arg: 1, scope: !1981, file: !1982, line: 12, type: !1985)
!1988 = !DILocation(line: 0, scope: !1981)
!1989 = !DILocation(line: 13, column: 9, scope: !1990)
!1990 = distinct !DILexicalBlock(scope: !1981, file: !1982, line: 13, column: 7)
!1991 = !DILocation(line: 13, column: 7, scope: !1981)
!1992 = !DILocation(line: 14, column: 5, scope: !1990)
!1993 = !DILocation(line: 15, column: 1, scope: !1981)
!1994 = distinct !DISubprogram(name: "klee_overshift_check", scope: !1995, file: !1995, line: 20, type: !1996, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !1999)
!1995 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!1996 = !DISubroutineType(types: !1997)
!1997 = !{null, !1998, !1998}
!1998 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!1999 = !{!2000, !2001}
!2000 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !1994, file: !1995, line: 20, type: !1998)
!2001 = !DILocalVariable(name: "shift", arg: 2, scope: !1994, file: !1995, line: 20, type: !1998)
!2002 = !DILocation(line: 0, scope: !1994)
!2003 = !DILocation(line: 21, column: 13, scope: !2004)
!2004 = distinct !DILexicalBlock(scope: !1994, file: !1995, line: 21, column: 7)
!2005 = !DILocation(line: 21, column: 7, scope: !1994)
!2006 = !DILocation(line: 27, column: 5, scope: !2007)
!2007 = distinct !DILexicalBlock(scope: !2004, file: !1995, line: 21, column: 26)
!2008 = !DILocation(line: 29, column: 1, scope: !1994)
