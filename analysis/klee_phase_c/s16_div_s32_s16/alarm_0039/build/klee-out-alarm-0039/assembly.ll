; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0039/build/s16_div_s32_s16_alarm_0039.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [65 x i8] c"KLEE-ALARM-0039: division by zero. assert (s32)denominator != 0;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0039.err\00", align 1
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
  br i1 %cmp92, label %if.then94, label %if.else166, !dbg !359

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
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 367, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !459
  unreachable, !dbg !459

if.end162:                                        ; preds = %if.end155
  %65 = load i32, i32* %numerator.addr, align 4, !dbg !461
  %66 = load i16, i16* %denominator.addr, align 2, !dbg !462
  %conv163 = sext i16 %66 to i32, !dbg !462
  %int_cast_to_i6415 = zext i32 %conv163 to i64, !dbg !463
  call void @klee_div_zero_check(i64 %int_cast_to_i6415), !dbg !463
  %div164 = sdiv i32 %65, %conv163, !dbg !463, !klee.check.div !106
  %conv165 = sext i32 %div164 to i64, !dbg !464
  store volatile i64 %conv165, i64* @klee_alarm_sink_s64, align 8, !dbg !465
  store i16 0, i16* %retval, align 2, !dbg !466
  br label %return, !dbg !466

if.else166:                                       ; preds = %if.else90
  store i16 32767, i16* %retval, align 2, !dbg !467
  br label %return, !dbg !467

return:                                           ; preds = %if.else166, %if.end162, %if.then154, %if.then143, %if.then136, %if.then127, %if.then118, %if.then108, %if.then98, %if.else89, %if.else88, %if.then86, %if.then77, %if.then69, %if.then61, %if.then54, %if.then44, %if.then35, %if.then26, %if.then16, %if.then10, %if.else, %if.then4
  %67 = load i16, i16* %retval, align 2, !dbg !469
  ret i16 %67, !dbg !469
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !470 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !473, metadata !DIExpression()), !dbg !474
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !475
  %cmp = icmp ne i64 %0, 0, !dbg !476
  %conv = zext i1 %cmp to i32, !dbg !476
  ret i32 %conv, !dbg !477
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !478 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !479, metadata !DIExpression()), !dbg !480
  %0 = load i64, i64* %left.addr, align 8, !dbg !481
  %cmp = icmp sge i64 %0, 0, !dbg !482
  %conv = zext i1 %cmp to i32, !dbg !482
  ret i32 %conv, !dbg !483
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !484 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !487, metadata !DIExpression()), !dbg !488
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !489, metadata !DIExpression()), !dbg !490
  %0 = load i32, i32* %count.addr, align 4, !dbg !491
  %cmp = icmp uge i32 %0, 63, !dbg !493
  br i1 %cmp, label %if.then, label %if.end, !dbg !494

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !495
  br label %return, !dbg !495

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !497
  %2 = load i32, i32* %count.addr, align 4, !dbg !498
  %sh_prom = zext i32 %2 to i64, !dbg !499
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !499
  %shl = shl i64 1, %sh_prom, !dbg !499, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !500
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !501
  %conv = zext i1 %cmp1 to i32, !dbg !501
  store i32 %conv, i32* %retval, align 4, !dbg !502
  br label %return, !dbg !502

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !503
  ret i32 %3, !dbg !503
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !504 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !507, metadata !DIExpression()), !dbg !508
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !509, metadata !DIExpression()), !dbg !510
  %0 = load i64, i64* %left.addr, align 8, !dbg !511
  %1 = load i64, i64* %right.addr, align 8, !dbg !512
  %mul = mul nsw i64 %0, %1, !dbg !513
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !514
  %conv = zext i1 %cmp to i32, !dbg !514
  ret i32 %conv, !dbg !515
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !516 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !517, metadata !DIExpression()), !dbg !518
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !519, metadata !DIExpression()), !dbg !520
  %0 = load i64, i64* %left.addr, align 8, !dbg !521
  %1 = load i64, i64* %right.addr, align 8, !dbg !522
  %mul = mul nsw i64 %0, %1, !dbg !523
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !524
  %conv = zext i1 %cmp to i32, !dbg !524
  ret i32 %conv, !dbg !525
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_lower(i64 %left, i64 %right) #0 !dbg !526 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !527, metadata !DIExpression()), !dbg !528
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !529, metadata !DIExpression()), !dbg !530
  %0 = load i64, i64* %left.addr, align 8, !dbg !531
  %1 = load i64, i64* %right.addr, align 8, !dbg !532
  %add = add nsw i64 %0, %1, !dbg !533
  %cmp = icmp sge i64 %add, -2147483648, !dbg !534
  %conv = zext i1 %cmp to i32, !dbg !534
  ret i32 %conv, !dbg !535
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !536 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !537, metadata !DIExpression()), !dbg !538
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !539, metadata !DIExpression()), !dbg !540
  %0 = load i64, i64* %left.addr, align 8, !dbg !541
  %1 = load i64, i64* %right.addr, align 8, !dbg !542
  %add = add nsw i64 %0, %1, !dbg !543
  %cmp = icmp sle i64 %add, 2147483647, !dbg !544
  %conv = zext i1 %cmp to i32, !dbg !544
  ret i32 %conv, !dbg !545
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_div_representable(i64 %numerator, i64 %denominator) #0 !dbg !546 {
entry:
  %numerator.addr = alloca i64, align 8
  %denominator.addr = alloca i64, align 8
  store i64 %numerator, i64* %numerator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %numerator.addr, metadata !547, metadata !DIExpression()), !dbg !548
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !549, metadata !DIExpression()), !dbg !550
  %0 = load i64, i64* %numerator.addr, align 8, !dbg !551
  %cmp = icmp eq i64 %0, -2147483648, !dbg !552
  %1 = load i64, i64* %denominator.addr, align 8, !dbg !553
  %cmp1 = icmp eq i64 %1, -1, !dbg !553
  %2 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !553
  %lnot = xor i1 %2, true, !dbg !554
  %lnot.ext = zext i1 %lnot to i32, !dbg !554
  ret i32 %lnot.ext, !dbg !555
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !556 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !559, metadata !DIExpression()), !dbg !560
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !561, metadata !DIExpression()), !dbg !562
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !563, metadata !DIExpression()), !dbg !564
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !565, metadata !DIExpression()), !dbg !566
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !567, metadata !DIExpression()), !dbg !568
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !569
  %conv = zext i16 %0 to i32, !dbg !569
  %and = and i32 %conv, 65535, !dbg !570
  %conv1 = trunc i32 %and to i16, !dbg !569
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !571
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !572
  %conv2 = sext i16 %1 to i32, !dbg !572
  %shl = shl i32 %conv2, 16, !dbg !573
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !574
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !575
  %conv3 = zext i16 %2 to i32, !dbg !575
  %cmp = icmp eq i32 %conv3, 0, !dbg !577
  br i1 %cmp, label %if.then, label %if.else9, !dbg !578

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !579
  %conv5 = sext i16 %3 to i32, !dbg !579
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !582
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !583

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !584
  br label %return, !dbg !584

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !586
  br label %return, !dbg !586

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !588
  %conv10 = sext i16 %4 to i32, !dbg !588
  %shl11 = shl i32 %conv10, 16, !dbg !590
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !591
  %conv12 = sext i16 %5 to i32, !dbg !591
  %shl13 = shl i32 %conv12, 16, !dbg !592
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !593
  %conv14 = zext i16 %6 to i32, !dbg !593
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !594
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !594
  %div = sdiv i32 %shl13, %conv14, !dbg !594, !klee.check.div !106
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !595
  %conv15 = zext i16 %7 to i32, !dbg !595
  %mul = mul nsw i32 %div, %conv15, !dbg !596
  %sub = sub nsw i32 %shl11, %mul, !dbg !597
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !598
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !599
  %shl16 = shl i32 %8, 1, !dbg !600
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !601
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !602
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !603
  %conv17 = zext i16 %10 to i32, !dbg !603
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !604
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !604
  %div18 = sdiv i32 %9, %conv17, !dbg !604, !klee.check.div !106
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !605
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !606
  %conv19 = sext i16 %11 to i32, !dbg !606
  %shl20 = shl i32 %conv19, 16, !dbg !607
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !608
  %conv21 = zext i16 %12 to i32, !dbg !608
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !609
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !609
  %div22 = sdiv i32 %shl20, %conv21, !dbg !609, !klee.check.div !106
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !610
  %add = add nsw i32 %div22, %13, !dbg !611
  store i32 %add, i32* %s32Temp1, align 4, !dbg !612
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !613
  %cmp23 = icmp slt i32 %14, 32767, !dbg !615
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !616

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !617
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !620
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !621

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !622
  %conv29 = trunc i32 %16 to i16, !dbg !624
  store i16 %conv29, i16* %retval, align 2, !dbg !625
  br label %return, !dbg !625

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !626
  br label %return, !dbg !626

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !628
  br label %return, !dbg !628

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !630
  ret i16 %17, !dbg !630
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !631 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !632, metadata !DIExpression()), !dbg !633
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !634, metadata !DIExpression()), !dbg !635
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !636, metadata !DIExpression()), !dbg !637
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !638, metadata !DIExpression()), !dbg !639
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !640
  %conv = zext i16 %0 to i32, !dbg !640
  %and = and i32 %conv, 65535, !dbg !641
  %conv1 = trunc i32 %and to i16, !dbg !640
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !642
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !643
  %conv2 = zext i16 %1 to i32, !dbg !643
  %cmp = icmp eq i32 %conv2, 0, !dbg !645
  br i1 %cmp, label %if.then, label %if.else8, !dbg !646

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !647
  %conv4 = sext i16 %2 to i32, !dbg !647
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !650
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !651

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !652
  br label %return, !dbg !652

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !654
  br label %return, !dbg !654

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !656
  %conv9 = sext i16 %3 to i32, !dbg !656
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !658
  %conv10 = sext i16 %4 to i32, !dbg !658
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !659
  %conv11 = zext i16 %5 to i32, !dbg !659
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !660
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !660
  %div = sdiv i32 %conv10, %conv11, !dbg !660, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !661
  %conv12 = zext i16 %6 to i32, !dbg !661
  %mul = mul nsw i32 %div, %conv12, !dbg !662
  %sub = sub nsw i32 %conv9, %mul, !dbg !663
  %shl = shl i32 %sub, 1, !dbg !664
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !665
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !666
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !667
  %conv13 = zext i16 %8 to i32, !dbg !667
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !668
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !668
  %div14 = sdiv i32 %7, %conv13, !dbg !668, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !669
  %conv15 = sext i16 %9 to i32, !dbg !669
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !670
  %conv16 = zext i16 %10 to i32, !dbg !670
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !671
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !671
  %div17 = sdiv i32 %conv15, %conv16, !dbg !671, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !672
  store i32 %add, i32* %s32Temp1, align 4, !dbg !673
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !674
  %conv18 = trunc i32 %11 to i16, !dbg !674
  store i16 %conv18, i16* %retval, align 2, !dbg !675
  br label %return, !dbg !675

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !676
  ret i16 %12, !dbg !676
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !677 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !680, metadata !DIExpression()), !dbg !681
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !682, metadata !DIExpression()), !dbg !683
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !684, metadata !DIExpression()), !dbg !686
  store i32 0, i32* %u32Temp1, align 4, !dbg !686
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !687, metadata !DIExpression()), !dbg !688
  store i32 0, i32* %u32Temp2, align 4, !dbg !688
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !689, metadata !DIExpression()), !dbg !690
  store i32 0, i32* %u32Temp3, align 4, !dbg !690
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !691
  %conv = zext i16 %0 to i32, !dbg !691
  %cmp = icmp eq i32 %conv, 0, !dbg !693
  br i1 %cmp, label %if.then, label %if.else, !dbg !694

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !695
  br label %return, !dbg !695

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !697
  %conv2 = zext i16 %1 to i32, !dbg !697
  %shl = shl i32 %conv2, 16, !dbg !699
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !700
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !701
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !702
  %conv3 = zext i16 %3 to i32, !dbg !702
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !703
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !703
  %div = udiv i32 %2, %conv3, !dbg !703, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !704
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !705
  %add = add i32 %4, 128, !dbg !706
  %shr = lshr i32 %add, 8, !dbg !707
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !708
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !709
  %cmp4 = icmp ult i32 %5, 255, !dbg !711
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !712

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !713
  %conv7 = trunc i32 %6 to i8, !dbg !715
  store i8 %conv7, i8* %retval, align 1, !dbg !716
  br label %return, !dbg !716

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !717
  br label %return, !dbg !717

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !719
  ret i8 %7, !dbg !719
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !720 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !723, metadata !DIExpression()), !dbg !724
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !725, metadata !DIExpression()), !dbg !726
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !727, metadata !DIExpression()), !dbg !728
  store i32 0, i32* %s32Temp1, align 4, !dbg !728
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !729
  %conv = zext i16 %0 to i32, !dbg !729
  %and = and i32 %conv, 65535, !dbg !730
  %conv1 = trunc i32 %and to i16, !dbg !729
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !731
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !732
  %conv2 = zext i16 %1 to i32, !dbg !732
  %and3 = and i32 %conv2, 65535, !dbg !734
  %cmp = icmp eq i32 %and3, 0, !dbg !735
  br i1 %cmp, label %if.then, label %if.else8, !dbg !736

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !737
  %cmp5 = icmp sge i32 %2, 0, !dbg !740
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !741

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !742
  br label %return, !dbg !742

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !744
  br label %return, !dbg !744

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !746
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !748
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !749
  %conv9 = zext i16 %5 to i32, !dbg !749
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !750
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !750
  %div = sdiv i32 %4, %conv9, !dbg !750, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !751
  %conv10 = zext i16 %6 to i32, !dbg !751
  %mul = mul nsw i32 %div, %conv10, !dbg !752
  %sub = sub nsw i32 %3, %mul, !dbg !753
  %shl = shl i32 %sub, 1, !dbg !754
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !755
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !756
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !757
  %conv11 = zext i16 %8 to i32, !dbg !757
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !758
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !758
  %div12 = sdiv i32 %7, %conv11, !dbg !758, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !759
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !760
  %conv13 = zext i16 %10 to i32, !dbg !760
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !761
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !761
  %div14 = sdiv i32 %9, %conv13, !dbg !761, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !762
  store i32 %add, i32* %s32Temp1, align 4, !dbg !763
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !764
  %cmp15 = icmp slt i32 %11, 65535, !dbg !766
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !767

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !768
  %cmp18 = icmp sgt i32 %12, 0, !dbg !771
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !772

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !773
  %conv21 = trunc i32 %13 to i16, !dbg !775
  store i16 %conv21, i16* %retval, align 2, !dbg !776
  br label %return, !dbg !776

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !777
  br label %return, !dbg !777

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !779
  br label %return, !dbg !779

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !781
  ret i16 %14, !dbg !781
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !782 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !785, metadata !DIExpression()), !dbg !786
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !787, metadata !DIExpression()), !dbg !788
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !789, metadata !DIExpression()), !dbg !790
  store i32 0, i32* %u32Temp, align 4, !dbg !790
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !791
  %conv = zext i16 %0 to i32, !dbg !791
  %cmp = icmp eq i32 %conv, 0, !dbg !793
  br i1 %cmp, label %if.then, label %if.else, !dbg !794

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !795
  br label %return, !dbg !795

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !797
  %conv2 = zext i16 %1 to i32, !dbg !797
  %shl = shl i32 %conv2, 16, !dbg !799
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !800
  %conv3 = zext i16 %2 to i32, !dbg !800
  %shr = ashr i32 %conv3, 1, !dbg !801
  %add = add nsw i32 %shl, %shr, !dbg !802
  store i32 %add, i32* %u32Temp, align 4, !dbg !803
  %3 = load i32, i32* %u32Temp, align 4, !dbg !804
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !805
  %conv4 = zext i16 %4 to i32, !dbg !805
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !806
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !806
  %div = udiv i32 %3, %conv4, !dbg !806, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !807
  %5 = load i32, i32* %u32Temp, align 4, !dbg !808
  %cmp5 = icmp ult i32 %5, 65535, !dbg !810
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !811

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !812
  %and = and i32 %6, 65535, !dbg !814
  %conv8 = trunc i32 %and to i16, !dbg !812
  store i16 %conv8, i16* %retval, align 2, !dbg !815
  br label %return, !dbg !815

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !816
  br label %return, !dbg !816

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !818
  ret i16 %7, !dbg !818
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !819 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !822, metadata !DIExpression()), !dbg !823
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !824, metadata !DIExpression()), !dbg !825
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !826, metadata !DIExpression()), !dbg !827
  store i32 0, i32* %u32Temp1, align 4, !dbg !827
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !828, metadata !DIExpression()), !dbg !829
  store i32 0, i32* %u32Temp2, align 4, !dbg !829
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !830
  %conv = zext i16 %0 to i32, !dbg !830
  %and = and i32 %conv, 65535, !dbg !831
  %conv1 = trunc i32 %and to i16, !dbg !830
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !832
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !833
  %conv2 = zext i16 %1 to i32, !dbg !833
  %cmp = icmp eq i32 %conv2, 0, !dbg !835
  br i1 %cmp, label %if.then, label %if.else, !dbg !836

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !837
  br label %return, !dbg !837

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !839
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !841
  %conv4 = zext i16 %3 to i32, !dbg !841
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !842
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !842
  %div = udiv i32 %2, %conv4, !dbg !842, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !843
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !844
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !845
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !846
  %conv5 = zext i16 %6 to i32, !dbg !846
  %mul = mul i32 %5, %conv5, !dbg !847
  %sub = sub i32 %4, %mul, !dbg !848
  %shl = shl i32 %sub, 1, !dbg !849
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !850
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !851
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !852
  %conv6 = zext i16 %8 to i32, !dbg !852
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !853
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !853
  %div7 = udiv i32 %7, %conv6, !dbg !853, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !854
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !855
  %conv8 = zext i16 %10 to i32, !dbg !855
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !856
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !856
  %div9 = udiv i32 %9, %conv8, !dbg !856, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !857
  store i32 %add, i32* %u32Temp2, align 4, !dbg !858
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !859
  %cmp10 = icmp ult i32 %11, 65535, !dbg !861
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !862

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !863
  %and13 = and i32 %12, 65535, !dbg !865
  %conv14 = trunc i32 %and13 to i16, !dbg !863
  store i16 %conv14, i16* %retval, align 2, !dbg !866
  br label %return, !dbg !866

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !867
  br label %return, !dbg !867

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !869
  ret i16 %13, !dbg !869
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !870 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !873, metadata !DIExpression()), !dbg !874
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !875, metadata !DIExpression()), !dbg !876
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !877, metadata !DIExpression()), !dbg !878
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !879, metadata !DIExpression()), !dbg !880
  store i32 0, i32* %s32Result, align 4, !dbg !880
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !881, metadata !DIExpression()), !dbg !882
  store i32 0, i32* %s32Temp1, align 4, !dbg !882
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !883
  %conv = sext i16 %0 to i32, !dbg !883
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !884
  %conv1 = zext i16 %1 to i32, !dbg !884
  %mul = mul nsw i32 %conv, %conv1, !dbg !885
  store i32 %mul, i32* %s32Result, align 4, !dbg !886
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !887
  %conv2 = sext i16 %2 to i32, !dbg !887
  %cmp = icmp eq i32 %conv2, 0, !dbg !889
  br i1 %cmp, label %if.then, label %if.else7, !dbg !890

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !891
  %cmp4 = icmp slt i32 %3, 0, !dbg !894
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !895

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !896
  br label %return, !dbg !896

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !898
  br label %return, !dbg !898

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !900
  %5 = load i32, i32* %s32Result, align 4, !dbg !902
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !903
  %conv8 = sext i16 %6 to i32, !dbg !903
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !904
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !904
  %div = sdiv i32 %5, %conv8, !dbg !904, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !905
  %conv9 = sext i16 %7 to i32, !dbg !905
  %mul10 = mul nsw i32 %div, %conv9, !dbg !906
  %sub = sub nsw i32 %4, %mul10, !dbg !907
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !908
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !909
  %shl = shl i32 %8, 1, !dbg !910
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !911
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !912
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !913
  %conv11 = sext i16 %10 to i32, !dbg !913
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !914
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !914
  %div12 = sdiv i32 %9, %conv11, !dbg !914, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !915
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !916
  %conv13 = sext i16 %12 to i32, !dbg !916
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !917
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !917
  %div14 = sdiv i32 %11, %conv13, !dbg !917, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !918
  store i32 %add, i32* %s32Result, align 4, !dbg !919
  %13 = load i32, i32* %s32Result, align 4, !dbg !920
  %cmp15 = icmp slt i32 %13, 32767, !dbg !922
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !923

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !924
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !927
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !928

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !929
  %conv21 = trunc i32 %15 to i16, !dbg !931
  store i16 %conv21, i16* %retval, align 2, !dbg !932
  br label %return, !dbg !932

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !933
  br label %return, !dbg !933

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !935
  br label %return, !dbg !935

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !937
  ret i16 %16, !dbg !937
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !938 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !941, metadata !DIExpression()), !dbg !942
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !943, metadata !DIExpression()), !dbg !944
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !945, metadata !DIExpression()), !dbg !946
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !947, metadata !DIExpression()), !dbg !948
  store i32 0, i32* %s32Result, align 4, !dbg !948
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !949, metadata !DIExpression()), !dbg !950
  store i32 0, i32* %s32Temp1, align 4, !dbg !950
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !951
  %conv = zext i16 %0 to i32, !dbg !951
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !952
  %conv1 = sext i16 %1 to i32, !dbg !952
  %mul = mul nsw i32 %conv, %conv1, !dbg !953
  store i32 %mul, i32* %s32Result, align 4, !dbg !954
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !955
  %conv2 = zext i16 %2 to i32, !dbg !955
  %cmp = icmp eq i32 %conv2, 0, !dbg !957
  br i1 %cmp, label %if.then, label %if.else7, !dbg !958

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !959
  %cmp4 = icmp slt i32 %3, 0, !dbg !962
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !963

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !964
  br label %return, !dbg !964

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !966
  br label %return, !dbg !966

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !968
  %5 = load i32, i32* %s32Result, align 4, !dbg !970
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !971
  %conv8 = zext i16 %6 to i32, !dbg !971
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !972
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !972
  %div = sdiv i32 %5, %conv8, !dbg !972, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !973
  %conv9 = zext i16 %7 to i32, !dbg !973
  %mul10 = mul nsw i32 %div, %conv9, !dbg !974
  %sub = sub nsw i32 %4, %mul10, !dbg !975
  %shl = shl i32 %sub, 1, !dbg !976
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !977
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !978
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !979
  %conv11 = zext i16 %9 to i32, !dbg !979
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !980
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !980
  %div12 = sdiv i32 %8, %conv11, !dbg !980, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !981
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !982
  %conv13 = zext i16 %11 to i32, !dbg !982
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !983
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !983
  %div14 = sdiv i32 %10, %conv13, !dbg !983, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !984
  store i32 %add, i32* %s32Result, align 4, !dbg !985
  %12 = load i32, i32* %s32Result, align 4, !dbg !986
  %cmp15 = icmp slt i32 %12, 32767, !dbg !988
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !989

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !990
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !993
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !994

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !995
  %conv21 = trunc i32 %14 to i16, !dbg !997
  store i16 %conv21, i16* %retval, align 2, !dbg !998
  br label %return, !dbg !998

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !999
  br label %return, !dbg !999

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1001
  br label %return, !dbg !1001

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1003
  ret i16 %15, !dbg !1003
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !1004 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1007, metadata !DIExpression()), !dbg !1008
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1009, metadata !DIExpression()), !dbg !1010
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1011, metadata !DIExpression()), !dbg !1012
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !1013, metadata !DIExpression()), !dbg !1014
  store i32 0, i32* %u32Result, align 4, !dbg !1014
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1015, metadata !DIExpression()), !dbg !1016
  store i32 0, i32* %u32Temp1, align 4, !dbg !1016
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1017, metadata !DIExpression()), !dbg !1018
  store i32 0, i32* %s32Result, align 4, !dbg !1018
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1019, metadata !DIExpression()), !dbg !1020
  store i32 0, i32* %s32Temp1, align 4, !dbg !1020
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !1021
  %conv = sext i16 %0 to i32, !dbg !1021
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !1022
  %conv1 = zext i16 %1 to i32, !dbg !1022
  %mul = mul nsw i32 %conv, %conv1, !dbg !1023
  store i32 %mul, i32* %s32Result, align 4, !dbg !1024
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1025
  %conv2 = sext i16 %2 to i32, !dbg !1025
  %cmp = icmp eq i32 %conv2, 0, !dbg !1027
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1028

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1029
  %cmp4 = icmp sge i32 %3, 0, !dbg !1032
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1033

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !1034
  br label %return, !dbg !1034

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1036
  br label %return, !dbg !1036

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1038
  %5 = load i32, i32* %s32Result, align 4, !dbg !1040
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1041
  %conv8 = sext i16 %6 to i32, !dbg !1041
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1042
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1042
  %div = sdiv i32 %5, %conv8, !dbg !1042, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1043
  %conv9 = sext i16 %7 to i32, !dbg !1043
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1044
  %sub = sub nsw i32 %4, %mul10, !dbg !1045
  %shl = shl i32 %sub, 1, !dbg !1046
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1047
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1048
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1049
  %conv11 = sext i16 %9 to i32, !dbg !1049
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1050
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1050
  %div12 = sdiv i32 %8, %conv11, !dbg !1050, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1051
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1052
  %conv13 = sext i16 %11 to i32, !dbg !1052
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1053
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1053
  %div14 = sdiv i32 %10, %conv13, !dbg !1053, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1054
  store i32 %add, i32* %s32Result, align 4, !dbg !1055
  %12 = load i32, i32* %s32Result, align 4, !dbg !1056
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1058
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1059

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1060
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1063
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1064

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1065
  %conv21 = trunc i32 %14 to i16, !dbg !1067
  store i16 %conv21, i16* %retval, align 2, !dbg !1068
  br label %return, !dbg !1068

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1069
  br label %return, !dbg !1069

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1071
  br label %return, !dbg !1071

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1073
  ret i16 %15, !dbg !1073
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1074 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1077, metadata !DIExpression()), !dbg !1078
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1079, metadata !DIExpression()), !dbg !1080
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1081, metadata !DIExpression()), !dbg !1082
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1083, metadata !DIExpression()), !dbg !1084
  store i32 0, i32* %s32Result, align 4, !dbg !1084
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1085, metadata !DIExpression()), !dbg !1086
  store i32 0, i32* %s32Temp1, align 4, !dbg !1086
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !1087
  %conv = sext i16 %0 to i32, !dbg !1087
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !1088
  %conv1 = zext i16 %1 to i32, !dbg !1088
  %mul = mul nsw i32 %conv, %conv1, !dbg !1089
  store i32 %mul, i32* %s32Result, align 4, !dbg !1090
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1091
  %conv2 = zext i16 %2 to i32, !dbg !1091
  %cmp = icmp eq i32 %conv2, 0, !dbg !1093
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1094

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1095
  %cmp4 = icmp sge i32 %3, 0, !dbg !1098
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1099

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !1100
  br label %return, !dbg !1100

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1102
  br label %return, !dbg !1102

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1104
  %5 = load i32, i32* %s32Result, align 4, !dbg !1106
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1107
  %conv8 = zext i16 %6 to i32, !dbg !1107
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1108
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1108
  %div = sdiv i32 %5, %conv8, !dbg !1108, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1109
  %conv9 = zext i16 %7 to i32, !dbg !1109
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1110
  %sub = sub nsw i32 %4, %mul10, !dbg !1111
  %shl = shl i32 %sub, 1, !dbg !1112
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1113
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1114
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1115
  %conv11 = zext i16 %9 to i32, !dbg !1115
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1116
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1116
  %div12 = sdiv i32 %8, %conv11, !dbg !1116, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1117
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1118
  %conv13 = zext i16 %11 to i32, !dbg !1118
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1119
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1119
  %div14 = sdiv i32 %10, %conv13, !dbg !1119, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1120
  store i32 %add, i32* %s32Result, align 4, !dbg !1121
  %12 = load i32, i32* %s32Result, align 4, !dbg !1122
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1124
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1125

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1126
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1129
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1130

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1131
  %conv21 = trunc i32 %14 to i16, !dbg !1133
  store i16 %conv21, i16* %retval, align 2, !dbg !1134
  br label %return, !dbg !1134

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1135
  br label %return, !dbg !1135

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1137
  br label %return, !dbg !1137

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1139
  ret i16 %15, !dbg !1139
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1140 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1143, metadata !DIExpression()), !dbg !1144
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1145, metadata !DIExpression()), !dbg !1146
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1147, metadata !DIExpression()), !dbg !1148
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1149, metadata !DIExpression()), !dbg !1150
  store i32 0, i32* %u32Temp1, align 4, !dbg !1150
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1151, metadata !DIExpression()), !dbg !1152
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1152
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1153
  %conv = zext i16 %0 to i32, !dbg !1153
  %cmp = icmp eq i32 %conv, 0, !dbg !1155
  br i1 %cmp, label %if.then, label %if.else, !dbg !1156

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1157
  br label %return, !dbg !1157

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1159
  %conv2 = zext i16 %1 to i32, !dbg !1159
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1161
  %conv3 = zext i16 %2 to i32, !dbg !1161
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1162
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1163
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1164
  %conv4 = zext i16 %3 to i32, !dbg !1164
  %shr = ashr i32 %conv4, 1, !dbg !1165
  %conv5 = trunc i32 %shr to i16, !dbg !1164
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1166
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1167
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1168
  %conv6 = zext i16 %5 to i32, !dbg !1168
  %add = add i32 %4, %conv6, !dbg !1169
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1170
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1171
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1172
  %conv7 = zext i16 %7 to i32, !dbg !1172
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1173
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1173
  %div = udiv i32 %6, %conv7, !dbg !1173, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1174
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1175
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1177
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1178

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1179
  %and = and i32 %9, 65535, !dbg !1181
  %conv11 = trunc i32 %and to i16, !dbg !1182
  store i16 %conv11, i16* %retval, align 2, !dbg !1183
  br label %return, !dbg !1183

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1184
  br label %return, !dbg !1184

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1186
  ret i16 %10, !dbg !1186
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1187 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1190, metadata !DIExpression()), !dbg !1191
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1192, metadata !DIExpression()), !dbg !1193
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1194, metadata !DIExpression()), !dbg !1195
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1196, metadata !DIExpression()), !dbg !1197
  store i32 0, i32* %u32Temp1, align 4, !dbg !1197
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1198
  %cmp = icmp eq i32 %0, 0, !dbg !1200
  br i1 %cmp, label %if.then, label %if.else, !dbg !1201

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1202
  br label %return, !dbg !1202

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1204
  %conv = zext i16 %1 to i32, !dbg !1204
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1206
  %conv1 = zext i16 %2 to i32, !dbg !1206
  %mul = mul nsw i32 %conv, %conv1, !dbg !1207
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1208
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1209
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1209
  %div = udiv i32 %mul, %3, !dbg !1209, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1210
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1211
  %conv2 = zext i16 %4 to i32, !dbg !1211
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1213
  %conv3 = zext i16 %5 to i32, !dbg !1213
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1214
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1215
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1216
  %mul5 = mul i32 %6, %7, !dbg !1217
  %sub = sub i32 %mul4, %mul5, !dbg !1218
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1219
  %div6 = udiv i32 %8, 2, !dbg !1220
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1221
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1222

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1223
  %inc = add i32 %9, 1, !dbg !1223
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1223
  br label %if.end, !dbg !1225

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1226
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1228
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1229

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1230
  %and = and i32 %11, 65535, !dbg !1232
  %conv13 = trunc i32 %and to i16, !dbg !1233
  store i16 %conv13, i16* %retval, align 2, !dbg !1234
  br label %return, !dbg !1234

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1235
  br label %return, !dbg !1235

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1237
  ret i16 %12, !dbg !1237
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1238 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1241, metadata !DIExpression()), !dbg !1242
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1243, metadata !DIExpression()), !dbg !1244
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1245, metadata !DIExpression()), !dbg !1246
  store i32 0, i32* %u32Temp1, align 4, !dbg !1246
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1247
  %conv = zext i16 %0 to i32, !dbg !1247
  %cmp = icmp eq i32 %conv, 0, !dbg !1249
  br i1 %cmp, label %if.then, label %if.else, !dbg !1250

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1251
  br label %return, !dbg !1251

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1253
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1255
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1256
  %conv2 = zext i16 %3 to i32, !dbg !1256
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1257
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1257
  %div = udiv i32 %2, %conv2, !dbg !1257, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1258
  %conv3 = zext i16 %4 to i32, !dbg !1258
  %mul = mul i32 %div, %conv3, !dbg !1259
  %sub = sub i32 %1, %mul, !dbg !1260
  %shl = shl i32 %sub, 1, !dbg !1261
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1262
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1263
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1264
  %conv4 = zext i16 %6 to i32, !dbg !1264
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1265
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1265
  %div5 = udiv i32 %5, %conv4, !dbg !1265, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1266
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1267
  %conv6 = zext i16 %8 to i32, !dbg !1267
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1268
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1268
  %div7 = udiv i32 %7, %conv6, !dbg !1268, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1269
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1270
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1271
  store i32 %9, i32* %retval, align 4, !dbg !1272
  br label %return, !dbg !1272

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1273
  ret i32 %10, !dbg !1273
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1274 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1277, metadata !DIExpression()), !dbg !1278
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1279, metadata !DIExpression()), !dbg !1280
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1281, metadata !DIExpression()), !dbg !1282
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1283, metadata !DIExpression()), !dbg !1284
  store i32 0, i32* %s32Temp1, align 4, !dbg !1284
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1285, metadata !DIExpression()), !dbg !1286
  store i32 0, i32* %s32Temp2, align 4, !dbg !1286
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1287, metadata !DIExpression()), !dbg !1288
  store i32 0, i32* %s32Temp3, align 4, !dbg !1288
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1289
  %conv = sext i16 %0 to i32, !dbg !1289
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1290
  %conv1 = sext i16 %1 to i32, !dbg !1290
  %mul = mul nsw i32 %conv, %conv1, !dbg !1291
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1292
  %2 = load i16, i16* %div.addr, align 2, !dbg !1293
  %conv2 = sext i16 %2 to i32, !dbg !1293
  %cmp = icmp eq i32 %conv2, 0, !dbg !1295
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1296

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1297
  %cmp4 = icmp slt i32 %3, 0, !dbg !1300
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1301

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1302
  br label %return, !dbg !1302

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1304
  br label %return, !dbg !1304

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1306
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1308
  %6 = load i16, i16* %div.addr, align 2, !dbg !1309
  %conv8 = sext i16 %6 to i32, !dbg !1309
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1310
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1310
  %div9 = sdiv i32 %5, %conv8, !dbg !1310, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1311
  %conv10 = sext i16 %7 to i32, !dbg !1311
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1312
  %sub = sub nsw i32 %4, %mul11, !dbg !1313
  %shl = shl i32 %sub, 1, !dbg !1314
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1315
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1316
  %9 = load i16, i16* %div.addr, align 2, !dbg !1317
  %conv12 = sext i16 %9 to i32, !dbg !1317
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1318
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1318
  %div13 = sdiv i32 %8, %conv12, !dbg !1318, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1319
  %11 = load i16, i16* %div.addr, align 2, !dbg !1320
  %conv14 = sext i16 %11 to i32, !dbg !1320
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1321
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1321
  %div15 = sdiv i32 %10, %conv14, !dbg !1321, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1322
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1323
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1324
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1326
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1327

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1328
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1331
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1332

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1333
  %conv22 = trunc i32 %14 to i16, !dbg !1335
  store i16 %conv22, i16* %retval, align 2, !dbg !1336
  br label %return, !dbg !1336

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1337
  br label %return, !dbg !1337

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1339
  br label %return, !dbg !1339

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1341
  ret i16 %15, !dbg !1341
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1342 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1345, metadata !DIExpression()), !dbg !1346
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1347, metadata !DIExpression()), !dbg !1348
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1349, metadata !DIExpression()), !dbg !1350
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1351, metadata !DIExpression()), !dbg !1352
  store i32 0, i32* %s32Result, align 4, !dbg !1352
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1353, metadata !DIExpression()), !dbg !1354
  store i32 0, i32* %s32Temp1, align 4, !dbg !1354
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1355
  %conv = sext i16 %0 to i32, !dbg !1355
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1356
  %conv1 = sext i16 %1 to i32, !dbg !1356
  %mul = mul nsw i32 %conv, %conv1, !dbg !1357
  store i32 %mul, i32* %s32Result, align 4, !dbg !1358
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1359
  %conv2 = zext i16 %2 to i32, !dbg !1359
  %cmp = icmp eq i32 %conv2, 0, !dbg !1361
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1362

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1363
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1366
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1367

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1368
  br label %return, !dbg !1368

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1370
  %cmp7 = icmp eq i32 %4, 0, !dbg !1372
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1373

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1374
  br label %return, !dbg !1374

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1376
  br label %return, !dbg !1376

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1378
  %6 = load i32, i32* %s32Result, align 4, !dbg !1380
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1381
  %conv12 = zext i16 %7 to i32, !dbg !1381
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1382
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1382
  %div = sdiv i32 %6, %conv12, !dbg !1382, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1383
  %conv13 = zext i16 %8 to i32, !dbg !1383
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1384
  %sub = sub nsw i32 %5, %mul14, !dbg !1385
  %shl = shl i32 %sub, 1, !dbg !1386
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1387
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1388
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1389
  %conv15 = zext i16 %10 to i32, !dbg !1389
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1390
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1390
  %div16 = sdiv i32 %9, %conv15, !dbg !1390, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1391
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1392
  %conv17 = zext i16 %12 to i32, !dbg !1392
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1393
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1393
  %div18 = sdiv i32 %11, %conv17, !dbg !1393, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1394
  store i32 %add, i32* %s32Result, align 4, !dbg !1395
  %13 = load i32, i32* %s32Result, align 4, !dbg !1396
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1398
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1399

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1400
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1403
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1404

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1405
  %conv25 = trunc i32 %15 to i16, !dbg !1407
  store i16 %conv25, i16* %retval, align 2, !dbg !1408
  br label %return, !dbg !1408

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1409
  br label %return, !dbg !1409

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1411
  br label %return, !dbg !1411

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1413
  ret i16 %16, !dbg !1413
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1414 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1417, metadata !DIExpression()), !dbg !1418
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1419, metadata !DIExpression()), !dbg !1420
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1421, metadata !DIExpression()), !dbg !1422
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1423
  %cmp = icmp eq i32 %0, 0, !dbg !1425
  br i1 %cmp, label %if.then, label %if.else, !dbg !1426

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1427
  br label %return, !dbg !1427

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1429
  %cmp1 = icmp sle i32 %1, 0, !dbg !1432
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1433

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1434
  br label %return, !dbg !1434

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1436
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1438
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1439
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1440
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1440
  %div = udiv i32 %3, %4, !dbg !1440, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1441
  %mul = mul i32 %div, %5, !dbg !1442
  %sub = sub i32 %2, %mul, !dbg !1443
  %shl = shl i32 %sub, 1, !dbg !1444
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1445
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1446
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1447
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1448
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1448
  %div4 = udiv i32 %6, %7, !dbg !1448, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1449
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1450
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1451
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1451
  %div5 = udiv i32 %8, %9, !dbg !1451, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1452
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1453
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1454
  store i32 %10, i32* %retval, align 4, !dbg !1455
  br label %return, !dbg !1455

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1456
  ret i32 %11, !dbg !1456
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1457 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1460, metadata !DIExpression()), !dbg !1461
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1462, metadata !DIExpression()), !dbg !1463
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1464, metadata !DIExpression()), !dbg !1465
  store i32 0, i32* %s32Temp1, align 4, !dbg !1465
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1466
  %cmp = icmp eq i32 %0, 0, !dbg !1468
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1469

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1470
  %cmp1 = icmp sge i32 %1, 0, !dbg !1473
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1474

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1475
  br label %return, !dbg !1475

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1477
  br label %return, !dbg !1477

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1479
  %cmp4 = icmp sge i32 %2, 0, !dbg !1482
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1483

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1484
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1486
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1487
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1488
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1488
  %div = udiv i32 %4, %5, !dbg !1488, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1489
  %mul = mul i32 %div, %6, !dbg !1490
  %sub = sub i32 %3, %mul, !dbg !1491
  %shl = shl i32 %sub, 1, !dbg !1492
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1493
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1494
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1495
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1496
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1496
  %div6 = udiv i32 %7, %8, !dbg !1496, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1497
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1498
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1499
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1499
  %div7 = udiv i32 %9, %10, !dbg !1499, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1500
  store i32 %add, i32* %retval, align 4, !dbg !1501
  br label %return, !dbg !1501

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1502
  br label %return, !dbg !1502

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1504
  ret i32 %11, !dbg !1504
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1505 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1508, metadata !DIExpression()), !dbg !1509
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1510, metadata !DIExpression()), !dbg !1511
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1512, metadata !DIExpression()), !dbg !1513
  store i32 0, i32* %u32Temp1, align 4, !dbg !1513
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1514, metadata !DIExpression()), !dbg !1515
  store i32 0, i32* %u32Temp2, align 4, !dbg !1515
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1516
  %cmp = icmp eq i32 %0, 0, !dbg !1518
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1519

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1520
  %cmp1 = icmp slt i32 %1, 0, !dbg !1523
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1524

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1525
  br label %return, !dbg !1525

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1527
  br label %return, !dbg !1527

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1529
  %cmp4 = icmp sge i32 %2, 0, !dbg !1532
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1533

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1534
  %cmp6 = icmp eq i32 %3, 0, !dbg !1537
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1538

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1539
  br label %return, !dbg !1539

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1541
  %cmp9 = icmp sle i32 %4, 0, !dbg !1544
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1545

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1546
  br label %return, !dbg !1546

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1548
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1550
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1551
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1552
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1552
  %div = sdiv i32 %6, %7, !dbg !1552, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1553
  %mul = mul nsw i32 %div, %8, !dbg !1554
  %sub = sub nsw i32 %5, %mul, !dbg !1555
  %shl = shl i32 %sub, 1, !dbg !1556
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1557
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1558
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1559
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1560
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1560
  %div12 = udiv i32 %9, %10, !dbg !1560, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1561
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1562
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1563
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1563
  %div13 = sdiv i32 %11, %12, !dbg !1563, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1564
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1565
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1566
  store i32 %13, i32* %retval, align 4, !dbg !1567
  br label %return, !dbg !1567

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1568
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1571
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1572

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1573
  br label %return, !dbg !1573

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1575
  %sub18 = sub nsw i32 0, %15, !dbg !1577
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1578
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1579
  %sub19 = sub nsw i32 0, %16, !dbg !1580
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1581
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1582
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1583
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1584
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1585
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1585
  %div20 = sdiv i32 %18, %19, !dbg !1585, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1586
  %mul21 = mul nsw i32 %div20, %20, !dbg !1587
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1588
  %shl23 = shl i32 %sub22, 1, !dbg !1589
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1590
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1591
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1592
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1593
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1593
  %div24 = udiv i32 %21, %22, !dbg !1593, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1594
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1595
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1596
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1596
  %div25 = sdiv i32 %23, %24, !dbg !1596, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1597
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1598
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1599
  store i32 %25, i32* %retval, align 4, !dbg !1600
  br label %return, !dbg !1600

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1601
  ret i32 %26, !dbg !1601
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1602 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1605, metadata !DIExpression()), !dbg !1606
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1607, metadata !DIExpression()), !dbg !1608
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1609, metadata !DIExpression()), !dbg !1610
  store i32 0, i32* %u32Temp1, align 4, !dbg !1610
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1611, metadata !DIExpression()), !dbg !1612
  store i32 0, i32* %u32Temp2, align 4, !dbg !1612
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1613, metadata !DIExpression()), !dbg !1614
  store i32 0, i32* %u32Temp3, align 4, !dbg !1614
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1615, metadata !DIExpression()), !dbg !1616
  store i32 0, i32* %numerator_old, align 4, !dbg !1616
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1617
  %cmp = icmp eq i32 %0, 0, !dbg !1619
  br i1 %cmp, label %if.then, label %if.else, !dbg !1620

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1621
  br label %return, !dbg !1621

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1623
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1625
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1626
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1627
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1628
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1628
  %div = udiv i32 %3, %4, !dbg !1628, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1629
  %sub = sub i32 %1, %mul, !dbg !1630
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1631
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1632
  %and = and i32 %5, 1, !dbg !1634
  %cmp1 = icmp eq i32 %and, 0, !dbg !1635
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1636

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1637
  %shr = lshr i32 %6, 1, !dbg !1639
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1640
  br label %if.end, !dbg !1641

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1642
  %shr4 = lshr i32 %7, 1, !dbg !1644
  %add = add i32 %shr4, 1, !dbg !1645
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1646
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1647
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1649
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1650
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1651

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1652
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1654
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1655
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1655
  %div7 = udiv i32 %10, %11, !dbg !1655, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1656
  br label %return, !dbg !1656

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1657
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1659
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1660
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1660
  %div9 = udiv i32 %12, %13, !dbg !1660, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1661
  store i32 %add10, i32* %retval, align 4, !dbg !1662
  br label %return, !dbg !1662

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1663
  ret i32 %14, !dbg !1663
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1664 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1667, metadata !DIExpression()), !dbg !1668
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1669, metadata !DIExpression()), !dbg !1670
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1671, metadata !DIExpression()), !dbg !1672
  store i32 0, i32* %u32Temp1, align 4, !dbg !1672
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1673, metadata !DIExpression()), !dbg !1674
  store i32 0, i32* %u32Temp2, align 4, !dbg !1674
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1675
  %cmp = icmp sle i32 %0, 0, !dbg !1677
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1678

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1679
  %cmp1 = icmp sge i32 %1, 0, !dbg !1682
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1683

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1684
  br label %return, !dbg !1684

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1686
  %sub = sub nsw i32 0, %2, !dbg !1688
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1689
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1690
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1691
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1692
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1693
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1693
  %div = udiv i32 %4, %5, !dbg !1693, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1694
  %mul = mul i32 %div, %6, !dbg !1695
  %sub3 = sub i32 %3, %mul, !dbg !1696
  %shl = shl i32 %sub3, 1, !dbg !1697
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1698
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1699
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1700
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1701
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1701
  %div4 = udiv i32 %7, %8, !dbg !1701, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1702
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1703
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1704
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1704
  %div5 = udiv i32 %9, %10, !dbg !1704, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1705
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1706
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1707
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1709
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1710

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1711
  %sub8 = sub i32 0, %12, !dbg !1713
  store i32 %sub8, i32* %retval, align 4, !dbg !1714
  br label %return, !dbg !1714

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1715
  br label %return, !dbg !1715

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1717
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1719
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1720
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1721
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1721
  %div11 = udiv i32 %14, %15, !dbg !1721, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1722
  %mul12 = mul i32 %div11, %16, !dbg !1723
  %sub13 = sub i32 %13, %mul12, !dbg !1724
  %shl14 = shl i32 %sub13, 1, !dbg !1725
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1726
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1727
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1728
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1729
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1729
  %div15 = udiv i32 %17, %18, !dbg !1729, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1730
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1731
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1732
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1732
  %div16 = udiv i32 %19, %20, !dbg !1732, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1733
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1734
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1735
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1737
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1738

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1739
  store i32 %22, i32* %retval, align 4, !dbg !1741
  br label %return, !dbg !1741

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1742
  br label %return, !dbg !1742

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1744
  ret i32 %23, !dbg !1744
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1745 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1748, metadata !DIExpression()), !dbg !1749
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1750, metadata !DIExpression()), !dbg !1751
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1752, metadata !DIExpression()), !dbg !1753
  store i32 0, i32* %s32Temp1, align 4, !dbg !1753
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1754, metadata !DIExpression()), !dbg !1755
  store i32 0, i32* %s32Temp2, align 4, !dbg !1755
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1756, metadata !DIExpression()), !dbg !1757
  store i32 0, i32* %u32Temp0, align 4, !dbg !1757
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1758, metadata !DIExpression()), !dbg !1759
  store i32 0, i32* %u32Temp1, align 4, !dbg !1759
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1760, metadata !DIExpression()), !dbg !1761
  store i32 0, i32* %u32Temp2, align 4, !dbg !1761
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1762
  %cmp = icmp eq i32 %0, 0, !dbg !1764
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1765

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1766
  %cmp1 = icmp slt i32 %1, 0, !dbg !1769
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1770

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1771
  br label %return, !dbg !1771

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1773
  br label %return, !dbg !1773

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1775
  %cmp4 = icmp sle i32 %2, 0, !dbg !1778
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1779

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1780
  %sub = sub nsw i32 0, %3, !dbg !1782
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1783
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1784
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1785
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1786
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1786
  %div = udiv i32 %4, %5, !dbg !1786, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1787
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1788
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1789
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1790
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1791
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1791
  %div6 = udiv i32 %7, %8, !dbg !1791, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1792
  %mul = mul i32 %div6, %9, !dbg !1793
  %sub7 = sub i32 %6, %mul, !dbg !1794
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1795
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1796
  %and = and i32 %10, 1, !dbg !1798
  %cmp8 = icmp eq i32 %and, 0, !dbg !1799
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1800

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1801
  %shr = lshr i32 %11, 1, !dbg !1803
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1804
  br label %if.end, !dbg !1805

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1806
  %shr11 = lshr i32 %12, 1, !dbg !1808
  %add = add i32 %shr11, 1, !dbg !1809
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1810
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1811
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1813
  %cmp12 = icmp ult i32 %13, %14, !dbg !1814
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1815

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1816
  %neg = xor i32 %15, -1, !dbg !1818
  %add14 = add i32 %neg, 1, !dbg !1819
  store i32 %add14, i32* %retval, align 4, !dbg !1820
  br label %return, !dbg !1820

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1821
  %add16 = add i32 %16, 1, !dbg !1823
  %neg17 = xor i32 %add16, -1, !dbg !1824
  %add18 = add i32 %neg17, 1, !dbg !1825
  store i32 %add18, i32* %retval, align 4, !dbg !1826
  br label %return, !dbg !1826

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1827
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1829
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1830
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1831
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1831
  %div20 = udiv i32 %18, %19, !dbg !1831, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1832
  %mul21 = mul i32 %div20, %20, !dbg !1833
  %sub22 = sub i32 %17, %mul21, !dbg !1834
  %shl = shl i32 %sub22, 1, !dbg !1835
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1836
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1837
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1838
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1839
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1839
  %div23 = udiv i32 %21, %22, !dbg !1839, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1840
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1841
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1842
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1842
  %div24 = udiv i32 %23, %24, !dbg !1842, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1843
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1844
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1845
  store i32 %25, i32* %retval, align 4, !dbg !1846
  br label %return, !dbg !1846

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1847
  ret i32 %26, !dbg !1847
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1848 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1851, metadata !DIExpression()), !dbg !1852
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1853, metadata !DIExpression()), !dbg !1854
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1855, metadata !DIExpression()), !dbg !1856
  store i32 0, i32* %s32Temp1, align 4, !dbg !1856
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1857, metadata !DIExpression()), !dbg !1858
  store i32 0, i32* %s32Temp2, align 4, !dbg !1858
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1859, metadata !DIExpression()), !dbg !1860
  store i32 0, i32* %denominator_prime, align 4, !dbg !1860
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1861, metadata !DIExpression()), !dbg !1862
  store i32 0, i32* %u32Temp1, align 4, !dbg !1862
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1863, metadata !DIExpression()), !dbg !1864
  store i32 0, i32* %u32Temp2, align 4, !dbg !1864
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1865, metadata !DIExpression()), !dbg !1866
  store i32 0, i32* %u32numerator, align 4, !dbg !1866
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1867, metadata !DIExpression()), !dbg !1868
  store i32 0, i32* %u32denominator, align 4, !dbg !1868
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1869
  %cmp = icmp slt i32 %0, 0, !dbg !1871
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1872

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1873
  %cmp1 = icmp sle i32 %1, 0, !dbg !1876
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1877

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1878
  %cmp3 = icmp sge i32 %2, 0, !dbg !1881
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1882

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1883
  br label %return, !dbg !1883

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1885
  %sub = sub nsw i32 0, %3, !dbg !1887
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1888
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1889
  %sub5 = sub nsw i32 0, %4, !dbg !1890
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1891
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1892
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1893
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1894
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1895
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1895
  %div = udiv i32 %6, %7, !dbg !1895, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1896
  %mul = mul i32 %div, %8, !dbg !1897
  %sub6 = sub i32 %5, %mul, !dbg !1898
  %shl = shl i32 %sub6, 1, !dbg !1899
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1900
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1901
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1902
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1903
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1903
  %div7 = udiv i32 %9, %10, !dbg !1903, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1904
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1905
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1906
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1906
  %div8 = udiv i32 %11, %12, !dbg !1906, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1907
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1908
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1909
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1911
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1912

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1913
  store i32 %14, i32* %retval, align 4, !dbg !1915
  br label %return, !dbg !1915

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1916
  br label %return, !dbg !1916

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1918
  %neg = xor i32 %15, -1, !dbg !1920
  %add13 = add nsw i32 %neg, 1, !dbg !1921
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1922
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1923
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1924
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1925
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1926
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1926
  %div14 = udiv i32 %17, %18, !dbg !1926, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1927
  %mul15 = mul i32 %div14, %19, !dbg !1928
  %sub16 = sub i32 %16, %mul15, !dbg !1929
  %shl17 = shl i32 %sub16, 1, !dbg !1930
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1931
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1932
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1933
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1934
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1934
  %div18 = udiv i32 %20, %21, !dbg !1934, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1935
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1936
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1937
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1937
  %div19 = sdiv i32 %22, %23, !dbg !1937, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1938
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1939
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1940
  %neg21 = xor i32 %24, -1, !dbg !1941
  %add22 = add nsw i32 %neg21, 1, !dbg !1942
  store i32 %add22, i32* %retval, align 4, !dbg !1943
  br label %return, !dbg !1943

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1944
  %cmp24 = icmp sle i32 %25, 0, !dbg !1947
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1948

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1949
  %cmp26 = icmp sge i32 %26, 0, !dbg !1952
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1953

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1954
  br label %return, !dbg !1954

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1956
  %neg29 = xor i32 %27, -1, !dbg !1958
  %add30 = add nsw i32 %neg29, 1, !dbg !1959
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1960
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1961
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1962
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1963
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1964
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1964
  %div31 = udiv i32 %29, %30, !dbg !1964, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1965
  %mul32 = mul i32 %div31, %31, !dbg !1966
  %sub33 = sub i32 %28, %mul32, !dbg !1967
  %shl34 = shl i32 %sub33, 1, !dbg !1968
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1969
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1970
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1971
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1972
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1972
  %div35 = udiv i32 %32, %33, !dbg !1972, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1973
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1974
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1975
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1975
  %div36 = udiv i32 %34, %35, !dbg !1975, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1976
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1977
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1978
  %neg38 = xor i32 %36, -1, !dbg !1979
  %add39 = add nsw i32 %neg38, 1, !dbg !1980
  store i32 %add39, i32* %retval, align 4, !dbg !1981
  br label %return, !dbg !1981

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1982
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1984
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1985
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1986
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1986
  %div41 = sdiv i32 %38, %39, !dbg !1986, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1987
  %mul42 = mul nsw i32 %div41, %40, !dbg !1988
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1989
  %shl44 = shl i32 %sub43, 1, !dbg !1990
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1991
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1992
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1993
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1994
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1994
  %div45 = sdiv i32 %41, %42, !dbg !1994, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1995
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1996
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1997
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1997
  %div46 = udiv i32 %43, %44, !dbg !1997, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1998
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1999
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !2000
  store i32 %45, i32* %retval, align 4, !dbg !2001
  br label %return, !dbg !2001

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !2002
  ret i32 %46, !dbg !2002
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !2003 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !2006, metadata !DIExpression()), !dbg !2007
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !2008, metadata !DIExpression()), !dbg !2009
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !2010, metadata !DIExpression()), !dbg !2011
  store i32 0, i32* %numerator_prime, align 4, !dbg !2011
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2012, metadata !DIExpression()), !dbg !2013
  store i32 0, i32* %u32Temp1, align 4, !dbg !2013
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2014, metadata !DIExpression()), !dbg !2015
  store i32 0, i32* %u32Temp2, align 4, !dbg !2015
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2016, metadata !DIExpression()), !dbg !2017
  store i32 0, i32* %u32Temp3, align 4, !dbg !2017
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !2018, metadata !DIExpression()), !dbg !2019
  store i32 0, i32* %s32Temp1, align 4, !dbg !2019
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !2020, metadata !DIExpression()), !dbg !2021
  store i32 0, i32* %s32Temp2, align 4, !dbg !2021
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !2022, metadata !DIExpression()), !dbg !2023
  store i32 0, i32* %s32Temp3, align 4, !dbg !2023
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !2024
  %cmp = icmp eq i32 %0, 0, !dbg !2026
  br i1 %cmp, label %if.then, label %if.else3, !dbg !2027

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !2028
  %cmp1 = icmp slt i32 %1, 0, !dbg !2031
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !2032

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !2033
  br label %return, !dbg !2033

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !2035
  br label %return, !dbg !2035

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !2037
  %cmp4 = icmp slt i32 %2, 0, !dbg !2040
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !2041

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !2042
  %sub = sub nsw i32 0, %3, !dbg !2044
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !2045
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !2046
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !2047
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !2048
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !2048
  %div = udiv i32 %4, %5, !dbg !2048, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !2049
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !2050
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !2051
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !2052
  %mul = mul i32 %7, %8, !dbg !2053
  %sub6 = sub i32 %6, %mul, !dbg !2054
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !2055
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !2056
  %and = and i32 %9, 1, !dbg !2058
  %cmp7 = icmp eq i32 %and, 0, !dbg !2059
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !2060

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !2061
  %shr = lshr i32 %10, 1, !dbg !2063
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !2064
  br label %if.end, !dbg !2065

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !2066
  %shr10 = lshr i32 %11, 1, !dbg !2068
  %add = add i32 %shr10, 1, !dbg !2069
  store i32 %add, i32* %denominator.addr, align 4, !dbg !2070
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2071
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !2073
  %cmp11 = icmp ult i32 %12, %13, !dbg !2074
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !2075

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2076
  %neg = xor i32 %14, -1, !dbg !2078
  %add13 = add i32 %neg, 1, !dbg !2079
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !2080
  br label %if.end18, !dbg !2081

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !2082
  %add15 = add i32 %15, 1, !dbg !2084
  %neg16 = xor i32 %add15, -1, !dbg !2085
  %add17 = add i32 %neg16, 1, !dbg !2086
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !2087
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !2088
  %cmp19 = icmp sge i32 %16, -32768, !dbg !2090
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !2091

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !2092
  %conv = trunc i32 %17 to i16, !dbg !2094
  store i16 %conv, i16* %retval, align 2, !dbg !2095
  br label %return, !dbg !2095

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !2096
  br label %return, !dbg !2096

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !2098
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !2100
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !2101
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !2101
  %div23 = udiv i32 %18, %19, !dbg !2101, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !2102
  %mul24 = mul i32 %div23, %20, !dbg !2103
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !2104
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !2105
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !2106
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !2107
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !2108
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !2108
  %div25 = udiv i32 %22, %23, !dbg !2108, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !2109
  %mul26 = mul i32 %div25, %24, !dbg !2110
  %sub27 = sub i32 %21, %mul26, !dbg !2111
  %shl = shl i32 %sub27, 1, !dbg !2112
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !2113
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !2114
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !2115
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !2116
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !2116
  %div28 = udiv i32 %25, %26, !dbg !2116, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !2117
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !2118
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !2119
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !2119
  %div29 = udiv i32 %27, %28, !dbg !2119, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !2120
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2121
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2122
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2124
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2125

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2126
  %conv34 = trunc i32 %30 to i16, !dbg !2128
  store i16 %conv34, i16* %retval, align 2, !dbg !2129
  br label %return, !dbg !2129

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2130
  br label %return, !dbg !2130

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2132
  ret i16 %31, !dbg !2132
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2133 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2139, metadata !DIExpression()), !dbg !2140
  %2 = icmp eq i64 %0, 0, !dbg !2141
  br i1 %2, label %3, label %4, !dbg !2143

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2144
  unreachable, !dbg !2144

4:                                                ; preds = %1
  ret void, !dbg !2145
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2146 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2152, metadata !DIExpression()), !dbg !2154
  call void @llvm.dbg.value(metadata i64 %1, metadata !2153, metadata !DIExpression()), !dbg !2154
  %3 = icmp ult i64 %1, %0, !dbg !2155
  br i1 %3, label %5, label %4, !dbg !2157

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2158
  unreachable, !dbg !2158

5:                                                ; preds = %2
  ret void, !dbg !2160
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0039/div_Ccode_alarm_0039.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0039")
!4 = !{}
!5 = !{!6, !13, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0039")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0039")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0039/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0039")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0039")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0039")
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
!461 = !DILocation(line: 372, column: 38, scope: !362)
!462 = !DILocation(line: 372, column: 51, scope: !362)
!463 = !DILocation(line: 372, column: 49, scope: !362)
!464 = !DILocation(line: 372, column: 27, scope: !362)
!465 = !DILocation(line: 372, column: 25, scope: !362)
!466 = !DILocation(line: 373, column: 5, scope: !362)
!467 = !DILocation(line: 393, column: 5, scope: !468)
!468 = distinct !DILexicalBlock(scope: !356, file: !69, line: 392, column: 4)
!469 = !DILocation(line: 399, column: 1, scope: !186)
!470 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !471, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!471 = !DISubroutineType(types: !472)
!472 = !{!19, !13}
!473 = !DILocalVariable(name: "denominator", arg: 1, scope: !470, file: !33, line: 24, type: !13)
!474 = !DILocation(line: 24, column: 40, scope: !470)
!475 = !DILocation(line: 26, column: 12, scope: !470)
!476 = !DILocation(line: 26, column: 24, scope: !470)
!477 = !DILocation(line: 26, column: 5, scope: !470)
!478 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !471, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!479 = !DILocalVariable(name: "left", arg: 1, scope: !478, file: !33, line: 84, type: !13)
!480 = !DILocation(line: 84, column: 51, scope: !478)
!481 = !DILocation(line: 86, column: 12, scope: !478)
!482 = !DILocation(line: 86, column: 17, scope: !478)
!483 = !DILocation(line: 86, column: 5, scope: !478)
!484 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !485, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!485 = !DISubroutineType(types: !486)
!486 = !{!19, !13, !20}
!487 = !DILocalVariable(name: "left", arg: 1, scope: !484, file: !33, line: 90, type: !13)
!488 = !DILocation(line: 90, column: 41, scope: !484)
!489 = !DILocalVariable(name: "count", arg: 2, scope: !484, file: !33, line: 90, type: !20)
!490 = !DILocation(line: 90, column: 56, scope: !484)
!491 = !DILocation(line: 92, column: 9, scope: !492)
!492 = distinct !DILexicalBlock(scope: !484, file: !33, line: 92, column: 9)
!493 = !DILocation(line: 92, column: 15, scope: !492)
!494 = !DILocation(line: 92, column: 9, scope: !484)
!495 = !DILocation(line: 93, column: 9, scope: !496)
!496 = distinct !DILexicalBlock(scope: !492, file: !33, line: 92, column: 32)
!497 = !DILocation(line: 95, column: 12, scope: !484)
!498 = !DILocation(line: 95, column: 34, scope: !484)
!499 = !DILocation(line: 95, column: 31, scope: !484)
!500 = !DILocation(line: 95, column: 17, scope: !484)
!501 = !DILocation(line: 95, column: 41, scope: !484)
!502 = !DILocation(line: 95, column: 5, scope: !484)
!503 = !DILocation(line: 96, column: 1, scope: !484)
!504 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !505, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!505 = !DISubroutineType(types: !506)
!506 = !{!19, !13, !13}
!507 = !DILocalVariable(name: "left", arg: 1, scope: !504, file: !33, line: 78, type: !13)
!508 = !DILocation(line: 78, column: 38, scope: !504)
!509 = !DILocalVariable(name: "right", arg: 2, scope: !504, file: !33, line: 78, type: !13)
!510 = !DILocation(line: 78, column: 52, scope: !504)
!511 = !DILocation(line: 80, column: 12, scope: !504)
!512 = !DILocation(line: 80, column: 19, scope: !504)
!513 = !DILocation(line: 80, column: 17, scope: !504)
!514 = !DILocation(line: 80, column: 25, scope: !504)
!515 = !DILocation(line: 80, column: 5, scope: !504)
!516 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !505, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!517 = !DILocalVariable(name: "left", arg: 1, scope: !516, file: !33, line: 72, type: !13)
!518 = !DILocation(line: 72, column: 38, scope: !516)
!519 = !DILocalVariable(name: "right", arg: 2, scope: !516, file: !33, line: 72, type: !13)
!520 = !DILocation(line: 72, column: 52, scope: !516)
!521 = !DILocation(line: 74, column: 12, scope: !516)
!522 = !DILocation(line: 74, column: 19, scope: !516)
!523 = !DILocation(line: 74, column: 17, scope: !516)
!524 = !DILocation(line: 74, column: 25, scope: !516)
!525 = !DILocation(line: 74, column: 5, scope: !516)
!526 = distinct !DISubprogram(name: "klee_alarm_s32_add_lower", scope: !33, file: !33, line: 48, type: !505, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!527 = !DILocalVariable(name: "left", arg: 1, scope: !526, file: !33, line: 48, type: !13)
!528 = !DILocation(line: 48, column: 38, scope: !526)
!529 = !DILocalVariable(name: "right", arg: 2, scope: !526, file: !33, line: 48, type: !13)
!530 = !DILocation(line: 48, column: 52, scope: !526)
!531 = !DILocation(line: 50, column: 12, scope: !526)
!532 = !DILocation(line: 50, column: 19, scope: !526)
!533 = !DILocation(line: 50, column: 17, scope: !526)
!534 = !DILocation(line: 50, column: 25, scope: !526)
!535 = !DILocation(line: 50, column: 5, scope: !526)
!536 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !505, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!537 = !DILocalVariable(name: "left", arg: 1, scope: !536, file: !33, line: 54, type: !13)
!538 = !DILocation(line: 54, column: 38, scope: !536)
!539 = !DILocalVariable(name: "right", arg: 2, scope: !536, file: !33, line: 54, type: !13)
!540 = !DILocation(line: 54, column: 52, scope: !536)
!541 = !DILocation(line: 56, column: 12, scope: !536)
!542 = !DILocation(line: 56, column: 19, scope: !536)
!543 = !DILocation(line: 56, column: 17, scope: !536)
!544 = !DILocation(line: 56, column: 25, scope: !536)
!545 = !DILocation(line: 56, column: 5, scope: !536)
!546 = distinct !DISubprogram(name: "klee_alarm_s32_div_representable", scope: !33, file: !33, line: 30, type: !505, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!547 = !DILocalVariable(name: "numerator", arg: 1, scope: !546, file: !33, line: 30, type: !13)
!548 = !DILocation(line: 30, column: 46, scope: !546)
!549 = !DILocalVariable(name: "denominator", arg: 2, scope: !546, file: !33, line: 30, type: !13)
!550 = !DILocation(line: 30, column: 65, scope: !546)
!551 = !DILocation(line: 32, column: 14, scope: !546)
!552 = !DILocation(line: 32, column: 24, scope: !546)
!553 = !DILocation(line: 32, column: 37, scope: !546)
!554 = !DILocation(line: 32, column: 12, scope: !546)
!555 = !DILocation(line: 32, column: 5, scope: !546)
!556 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 417, type: !557, scopeLine: 418, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!557 = !DISubroutineType(types: !558)
!558 = !{!6, !6, !28}
!559 = !DILocalVariable(name: "numerator", arg: 1, scope: !556, file: !69, line: 417, type: !6)
!560 = !DILocation(line: 417, column: 31, scope: !556)
!561 = !DILocalVariable(name: "denominator", arg: 2, scope: !556, file: !69, line: 417, type: !28)
!562 = !DILocation(line: 417, column: 47, scope: !556)
!563 = !DILocalVariable(name: "u16Temp1", scope: !556, file: !69, line: 419, type: !28)
!564 = !DILocation(line: 419, column: 6, scope: !556)
!565 = !DILocalVariable(name: "s32Temp1", scope: !556, file: !69, line: 420, type: !16)
!566 = !DILocation(line: 420, column: 6, scope: !556)
!567 = !DILocalVariable(name: "s32Temp2", scope: !556, file: !69, line: 420, type: !16)
!568 = !DILocation(line: 420, column: 15, scope: !556)
!569 = !DILocation(line: 421, column: 13, scope: !556)
!570 = !DILocation(line: 421, column: 25, scope: !556)
!571 = !DILocation(line: 421, column: 11, scope: !556)
!572 = !DILocation(line: 422, column: 13, scope: !556)
!573 = !DILocation(line: 422, column: 22, scope: !556)
!574 = !DILocation(line: 422, column: 11, scope: !556)
!575 = !DILocation(line: 423, column: 5, scope: !576)
!576 = distinct !DILexicalBlock(scope: !556, file: !69, line: 423, column: 5)
!577 = !DILocation(line: 423, column: 14, scope: !576)
!578 = !DILocation(line: 423, column: 5, scope: !556)
!579 = !DILocation(line: 425, column: 7, scope: !580)
!580 = distinct !DILexicalBlock(scope: !581, file: !69, line: 425, column: 7)
!581 = distinct !DILexicalBlock(scope: !576, file: !69, line: 424, column: 2)
!582 = !DILocation(line: 425, column: 17, scope: !580)
!583 = !DILocation(line: 425, column: 7, scope: !581)
!584 = !DILocation(line: 427, column: 4, scope: !585)
!585 = distinct !DILexicalBlock(scope: !580, file: !69, line: 426, column: 3)
!586 = !DILocation(line: 431, column: 4, scope: !587)
!587 = distinct !DILexicalBlock(scope: !580, file: !69, line: 430, column: 3)
!588 = !DILocation(line: 436, column: 15, scope: !589)
!589 = distinct !DILexicalBlock(scope: !576, file: !69, line: 435, column: 2)
!590 = !DILocation(line: 436, column: 24, scope: !589)
!591 = !DILocation(line: 436, column: 32, scope: !589)
!592 = !DILocation(line: 436, column: 41, scope: !589)
!593 = !DILocation(line: 436, column: 47, scope: !589)
!594 = !DILocation(line: 436, column: 46, scope: !589)
!595 = !DILocation(line: 436, column: 57, scope: !589)
!596 = !DILocation(line: 436, column: 56, scope: !589)
!597 = !DILocation(line: 436, column: 29, scope: !589)
!598 = !DILocation(line: 436, column: 12, scope: !589)
!599 = !DILocation(line: 437, column: 14, scope: !589)
!600 = !DILocation(line: 437, column: 22, scope: !589)
!601 = !DILocation(line: 437, column: 12, scope: !589)
!602 = !DILocation(line: 438, column: 14, scope: !589)
!603 = !DILocation(line: 438, column: 23, scope: !589)
!604 = !DILocation(line: 438, column: 22, scope: !589)
!605 = !DILocation(line: 438, column: 12, scope: !589)
!606 = !DILocation(line: 439, column: 16, scope: !589)
!607 = !DILocation(line: 439, column: 25, scope: !589)
!608 = !DILocation(line: 439, column: 31, scope: !589)
!609 = !DILocation(line: 439, column: 30, scope: !589)
!610 = !DILocation(line: 439, column: 43, scope: !589)
!611 = !DILocation(line: 439, column: 41, scope: !589)
!612 = !DILocation(line: 439, column: 12, scope: !589)
!613 = !DILocation(line: 440, column: 6, scope: !614)
!614 = distinct !DILexicalBlock(scope: !589, file: !69, line: 440, column: 6)
!615 = !DILocation(line: 440, column: 15, scope: !614)
!616 = !DILocation(line: 440, column: 6, scope: !589)
!617 = !DILocation(line: 442, column: 7, scope: !618)
!618 = distinct !DILexicalBlock(scope: !619, file: !69, line: 442, column: 7)
!619 = distinct !DILexicalBlock(scope: !614, file: !69, line: 441, column: 3)
!620 = !DILocation(line: 442, column: 16, scope: !618)
!621 = !DILocation(line: 442, column: 7, scope: !619)
!622 = !DILocation(line: 444, column: 17, scope: !623)
!623 = distinct !DILexicalBlock(scope: !618, file: !69, line: 443, column: 4)
!624 = !DILocation(line: 444, column: 12, scope: !623)
!625 = !DILocation(line: 444, column: 5, scope: !623)
!626 = !DILocation(line: 448, column: 5, scope: !627)
!627 = distinct !DILexicalBlock(scope: !618, file: !69, line: 447, column: 4)
!628 = !DILocation(line: 453, column: 4, scope: !629)
!629 = distinct !DILexicalBlock(scope: !614, file: !69, line: 452, column: 3)
!630 = !DILocation(line: 456, column: 1, scope: !556)
!631 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 473, type: !557, scopeLine: 474, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!632 = !DILocalVariable(name: "numerator", arg: 1, scope: !631, file: !69, line: 473, type: !6)
!633 = !DILocation(line: 473, column: 30, scope: !631)
!634 = !DILocalVariable(name: "denominator", arg: 2, scope: !631, file: !69, line: 473, type: !28)
!635 = !DILocation(line: 473, column: 45, scope: !631)
!636 = !DILocalVariable(name: "u16Temp1", scope: !631, file: !69, line: 475, type: !28)
!637 = !DILocation(line: 475, column: 6, scope: !631)
!638 = !DILocalVariable(name: "s32Temp1", scope: !631, file: !69, line: 476, type: !16)
!639 = !DILocation(line: 476, column: 6, scope: !631)
!640 = !DILocation(line: 477, column: 13, scope: !631)
!641 = !DILocation(line: 477, column: 25, scope: !631)
!642 = !DILocation(line: 477, column: 11, scope: !631)
!643 = !DILocation(line: 478, column: 5, scope: !644)
!644 = distinct !DILexicalBlock(scope: !631, file: !69, line: 478, column: 5)
!645 = !DILocation(line: 478, column: 13, scope: !644)
!646 = !DILocation(line: 478, column: 5, scope: !631)
!647 = !DILocation(line: 480, column: 6, scope: !648)
!648 = distinct !DILexicalBlock(scope: !649, file: !69, line: 480, column: 6)
!649 = distinct !DILexicalBlock(scope: !644, file: !69, line: 479, column: 2)
!650 = !DILocation(line: 480, column: 15, scope: !648)
!651 = !DILocation(line: 480, column: 6, scope: !649)
!652 = !DILocation(line: 482, column: 4, scope: !653)
!653 = distinct !DILexicalBlock(scope: !648, file: !69, line: 481, column: 3)
!654 = !DILocation(line: 486, column: 4, scope: !655)
!655 = distinct !DILexicalBlock(scope: !648, file: !69, line: 485, column: 3)
!656 = !DILocation(line: 492, column: 15, scope: !657)
!657 = distinct !DILexicalBlock(scope: !644, file: !69, line: 491, column: 2)
!658 = !DILocation(line: 492, column: 27, scope: !657)
!659 = !DILocation(line: 492, column: 37, scope: !657)
!660 = !DILocation(line: 492, column: 36, scope: !657)
!661 = !DILocation(line: 492, column: 49, scope: !657)
!662 = !DILocation(line: 492, column: 47, scope: !657)
!663 = !DILocation(line: 492, column: 25, scope: !657)
!664 = !DILocation(line: 492, column: 59, scope: !657)
!665 = !DILocation(line: 492, column: 12, scope: !657)
!666 = !DILocation(line: 493, column: 15, scope: !657)
!667 = !DILocation(line: 493, column: 24, scope: !657)
!668 = !DILocation(line: 493, column: 23, scope: !657)
!669 = !DILocation(line: 493, column: 37, scope: !657)
!670 = !DILocation(line: 493, column: 47, scope: !657)
!671 = !DILocation(line: 493, column: 46, scope: !657)
!672 = !DILocation(line: 493, column: 34, scope: !657)
!673 = !DILocation(line: 493, column: 12, scope: !657)
!674 = !DILocation(line: 494, column: 10, scope: !657)
!675 = !DILocation(line: 494, column: 3, scope: !657)
!676 = !DILocation(line: 496, column: 1, scope: !631)
!677 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 514, type: !678, scopeLine: 515, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!678 = !DISubroutineType(types: !679)
!679 = !{!24, !28, !28}
!680 = !DILocalVariable(name: "numerator", arg: 1, scope: !677, file: !69, line: 514, type: !28)
!681 = !DILocation(line: 514, column: 28, scope: !677)
!682 = !DILocalVariable(name: "denominator", arg: 2, scope: !677, file: !69, line: 514, type: !28)
!683 = !DILocation(line: 514, column: 43, scope: !677)
!684 = !DILocalVariable(name: "u32Temp1", scope: !677, file: !69, line: 516, type: !685)
!685 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !20)
!686 = !DILocation(line: 516, column: 6, scope: !677)
!687 = !DILocalVariable(name: "u32Temp2", scope: !677, file: !69, line: 516, type: !685)
!688 = !DILocation(line: 516, column: 20, scope: !677)
!689 = !DILocalVariable(name: "u32Temp3", scope: !677, file: !69, line: 516, type: !685)
!690 = !DILocation(line: 516, column: 33, scope: !677)
!691 = !DILocation(line: 517, column: 5, scope: !692)
!692 = distinct !DILexicalBlock(scope: !677, file: !69, line: 517, column: 5)
!693 = !DILocation(line: 517, column: 16, scope: !692)
!694 = !DILocation(line: 517, column: 5, scope: !677)
!695 = !DILocation(line: 519, column: 3, scope: !696)
!696 = distinct !DILexicalBlock(scope: !692, file: !69, line: 518, column: 2)
!697 = !DILocation(line: 523, column: 15, scope: !698)
!698 = distinct !DILexicalBlock(scope: !692, file: !69, line: 522, column: 2)
!699 = !DILocation(line: 523, column: 24, scope: !698)
!700 = !DILocation(line: 523, column: 12, scope: !698)
!701 = !DILocation(line: 524, column: 14, scope: !698)
!702 = !DILocation(line: 524, column: 25, scope: !698)
!703 = !DILocation(line: 524, column: 23, scope: !698)
!704 = !DILocation(line: 524, column: 12, scope: !698)
!705 = !DILocation(line: 525, column: 15, scope: !698)
!706 = !DILocation(line: 525, column: 24, scope: !698)
!707 = !DILocation(line: 525, column: 32, scope: !698)
!708 = !DILocation(line: 525, column: 12, scope: !698)
!709 = !DILocation(line: 526, column: 6, scope: !710)
!710 = distinct !DILexicalBlock(scope: !698, file: !69, line: 526, column: 6)
!711 = !DILocation(line: 526, column: 15, scope: !710)
!712 = !DILocation(line: 526, column: 6, scope: !698)
!713 = !DILocation(line: 528, column: 15, scope: !714)
!714 = distinct !DILexicalBlock(scope: !710, file: !69, line: 527, column: 3)
!715 = !DILocation(line: 528, column: 11, scope: !714)
!716 = !DILocation(line: 528, column: 4, scope: !714)
!717 = !DILocation(line: 532, column: 4, scope: !718)
!718 = distinct !DILexicalBlock(scope: !710, file: !69, line: 531, column: 3)
!719 = !DILocation(line: 535, column: 1, scope: !677)
!720 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 552, type: !721, scopeLine: 553, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!721 = !DISubroutineType(types: !722)
!722 = !{!28, !16, !28}
!723 = !DILocalVariable(name: "x_value", arg: 1, scope: !720, file: !69, line: 552, type: !16)
!724 = !DILocation(line: 552, column: 25, scope: !720)
!725 = !DILocalVariable(name: "y_value", arg: 2, scope: !720, file: !69, line: 552, type: !28)
!726 = !DILocation(line: 552, column: 38, scope: !720)
!727 = !DILocalVariable(name: "s32Temp1", scope: !720, file: !69, line: 554, type: !16)
!728 = !DILocation(line: 554, column: 6, scope: !720)
!729 = !DILocation(line: 555, column: 12, scope: !720)
!730 = !DILocation(line: 555, column: 20, scope: !720)
!731 = !DILocation(line: 555, column: 10, scope: !720)
!732 = !DILocation(line: 556, column: 6, scope: !733)
!733 = distinct !DILexicalBlock(scope: !720, file: !69, line: 556, column: 5)
!734 = !DILocation(line: 556, column: 14, scope: !733)
!735 = !DILocation(line: 556, column: 24, scope: !733)
!736 = !DILocation(line: 556, column: 5, scope: !720)
!737 = !DILocation(line: 558, column: 6, scope: !738)
!738 = distinct !DILexicalBlock(scope: !739, file: !69, line: 558, column: 6)
!739 = distinct !DILexicalBlock(scope: !733, file: !69, line: 557, column: 2)
!740 = !DILocation(line: 558, column: 14, scope: !738)
!741 = !DILocation(line: 558, column: 6, scope: !739)
!742 = !DILocation(line: 560, column: 4, scope: !743)
!743 = distinct !DILexicalBlock(scope: !738, file: !69, line: 559, column: 3)
!744 = !DILocation(line: 564, column: 4, scope: !745)
!745 = distinct !DILexicalBlock(scope: !738, file: !69, line: 563, column: 3)
!746 = !DILocation(line: 569, column: 15, scope: !747)
!747 = distinct !DILexicalBlock(scope: !733, file: !69, line: 568, column: 2)
!748 = !DILocation(line: 569, column: 27, scope: !747)
!749 = !DILocation(line: 569, column: 35, scope: !747)
!750 = !DILocation(line: 569, column: 34, scope: !747)
!751 = !DILocation(line: 569, column: 46, scope: !747)
!752 = !DILocation(line: 569, column: 44, scope: !747)
!753 = !DILocation(line: 569, column: 23, scope: !747)
!754 = !DILocation(line: 569, column: 56, scope: !747)
!755 = !DILocation(line: 569, column: 12, scope: !747)
!756 = !DILocation(line: 570, column: 15, scope: !747)
!757 = !DILocation(line: 570, column: 24, scope: !747)
!758 = !DILocation(line: 570, column: 23, scope: !747)
!759 = !DILocation(line: 570, column: 36, scope: !747)
!760 = !DILocation(line: 570, column: 44, scope: !747)
!761 = !DILocation(line: 570, column: 43, scope: !747)
!762 = !DILocation(line: 570, column: 33, scope: !747)
!763 = !DILocation(line: 570, column: 12, scope: !747)
!764 = !DILocation(line: 571, column: 6, scope: !765)
!765 = distinct !DILexicalBlock(scope: !747, file: !69, line: 571, column: 6)
!766 = !DILocation(line: 571, column: 15, scope: !765)
!767 = !DILocation(line: 571, column: 6, scope: !747)
!768 = !DILocation(line: 573, column: 7, scope: !769)
!769 = distinct !DILexicalBlock(scope: !770, file: !69, line: 573, column: 7)
!770 = distinct !DILexicalBlock(scope: !765, file: !69, line: 572, column: 3)
!771 = !DILocation(line: 573, column: 16, scope: !769)
!772 = !DILocation(line: 573, column: 7, scope: !770)
!773 = !DILocation(line: 575, column: 17, scope: !774)
!774 = distinct !DILexicalBlock(scope: !769, file: !69, line: 574, column: 4)
!775 = !DILocation(line: 575, column: 12, scope: !774)
!776 = !DILocation(line: 575, column: 5, scope: !774)
!777 = !DILocation(line: 579, column: 5, scope: !778)
!778 = distinct !DILexicalBlock(scope: !769, file: !69, line: 578, column: 4)
!779 = !DILocation(line: 584, column: 4, scope: !780)
!780 = distinct !DILexicalBlock(scope: !765, file: !69, line: 583, column: 3)
!781 = !DILocation(line: 587, column: 1, scope: !720)
!782 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 605, type: !783, scopeLine: 606, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!783 = !DISubroutineType(types: !784)
!784 = !{!28, !28, !28}
!785 = !DILocalVariable(name: "numerator", arg: 1, scope: !782, file: !69, line: 605, type: !28)
!786 = !DILocation(line: 605, column: 31, scope: !782)
!787 = !DILocalVariable(name: "denominator", arg: 2, scope: !782, file: !69, line: 605, type: !28)
!788 = !DILocation(line: 605, column: 46, scope: !782)
!789 = !DILocalVariable(name: "u32Temp", scope: !782, file: !69, line: 607, type: !685)
!790 = !DILocation(line: 607, column: 6, scope: !782)
!791 = !DILocation(line: 608, column: 5, scope: !792)
!792 = distinct !DILexicalBlock(scope: !782, file: !69, line: 608, column: 5)
!793 = !DILocation(line: 608, column: 17, scope: !792)
!794 = !DILocation(line: 608, column: 5, scope: !782)
!795 = !DILocation(line: 610, column: 3, scope: !796)
!796 = distinct !DILexicalBlock(scope: !792, file: !69, line: 609, column: 2)
!797 = !DILocation(line: 614, column: 14, scope: !798)
!798 = distinct !DILexicalBlock(scope: !792, file: !69, line: 613, column: 2)
!799 = !DILocation(line: 614, column: 23, scope: !798)
!800 = !DILocation(line: 614, column: 32, scope: !798)
!801 = !DILocation(line: 614, column: 44, scope: !798)
!802 = !DILocation(line: 614, column: 29, scope: !798)
!803 = !DILocation(line: 614, column: 11, scope: !798)
!804 = !DILocation(line: 615, column: 13, scope: !798)
!805 = !DILocation(line: 615, column: 21, scope: !798)
!806 = !DILocation(line: 615, column: 20, scope: !798)
!807 = !DILocation(line: 615, column: 11, scope: !798)
!808 = !DILocation(line: 616, column: 6, scope: !809)
!809 = distinct !DILexicalBlock(scope: !798, file: !69, line: 616, column: 6)
!810 = !DILocation(line: 616, column: 14, scope: !809)
!811 = !DILocation(line: 616, column: 6, scope: !798)
!812 = !DILocation(line: 618, column: 11, scope: !813)
!813 = distinct !DILexicalBlock(scope: !809, file: !69, line: 617, column: 3)
!814 = !DILocation(line: 618, column: 19, scope: !813)
!815 = !DILocation(line: 618, column: 4, scope: !813)
!816 = !DILocation(line: 622, column: 4, scope: !817)
!817 = distinct !DILexicalBlock(scope: !809, file: !69, line: 621, column: 3)
!818 = !DILocation(line: 626, column: 1, scope: !782)
!819 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 643, type: !820, scopeLine: 644, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!820 = !DISubroutineType(types: !821)
!821 = !{!28, !685, !28}
!822 = !DILocalVariable(name: "x_value", arg: 1, scope: !819, file: !69, line: 643, type: !685)
!823 = !DILocation(line: 643, column: 25, scope: !819)
!824 = !DILocalVariable(name: "y_value", arg: 2, scope: !819, file: !69, line: 643, type: !28)
!825 = !DILocation(line: 643, column: 38, scope: !819)
!826 = !DILocalVariable(name: "u32Temp1", scope: !819, file: !69, line: 645, type: !685)
!827 = !DILocation(line: 645, column: 6, scope: !819)
!828 = !DILocalVariable(name: "u32Temp2", scope: !819, file: !69, line: 645, type: !685)
!829 = !DILocation(line: 645, column: 17, scope: !819)
!830 = !DILocation(line: 646, column: 12, scope: !819)
!831 = !DILocation(line: 646, column: 20, scope: !819)
!832 = !DILocation(line: 646, column: 10, scope: !819)
!833 = !DILocation(line: 647, column: 5, scope: !834)
!834 = distinct !DILexicalBlock(scope: !819, file: !69, line: 647, column: 5)
!835 = !DILocation(line: 647, column: 13, scope: !834)
!836 = !DILocation(line: 647, column: 5, scope: !819)
!837 = !DILocation(line: 649, column: 3, scope: !838)
!838 = distinct !DILexicalBlock(scope: !834, file: !69, line: 648, column: 2)
!839 = !DILocation(line: 653, column: 14, scope: !840)
!840 = distinct !DILexicalBlock(scope: !834, file: !69, line: 652, column: 2)
!841 = !DILocation(line: 653, column: 22, scope: !840)
!842 = !DILocation(line: 653, column: 21, scope: !840)
!843 = !DILocation(line: 653, column: 12, scope: !840)
!844 = !DILocation(line: 654, column: 14, scope: !840)
!845 = !DILocation(line: 654, column: 25, scope: !840)
!846 = !DILocation(line: 654, column: 36, scope: !840)
!847 = !DILocation(line: 654, column: 34, scope: !840)
!848 = !DILocation(line: 654, column: 22, scope: !840)
!849 = !DILocation(line: 654, column: 45, scope: !840)
!850 = !DILocation(line: 654, column: 12, scope: !840)
!851 = !DILocation(line: 655, column: 15, scope: !840)
!852 = !DILocation(line: 655, column: 24, scope: !840)
!853 = !DILocation(line: 655, column: 23, scope: !840)
!854 = !DILocation(line: 655, column: 36, scope: !840)
!855 = !DILocation(line: 655, column: 44, scope: !840)
!856 = !DILocation(line: 655, column: 43, scope: !840)
!857 = !DILocation(line: 655, column: 33, scope: !840)
!858 = !DILocation(line: 655, column: 12, scope: !840)
!859 = !DILocation(line: 656, column: 6, scope: !860)
!860 = distinct !DILexicalBlock(scope: !840, file: !69, line: 656, column: 6)
!861 = !DILocation(line: 656, column: 15, scope: !860)
!862 = !DILocation(line: 656, column: 6, scope: !840)
!863 = !DILocation(line: 658, column: 11, scope: !864)
!864 = distinct !DILexicalBlock(scope: !860, file: !69, line: 657, column: 3)
!865 = !DILocation(line: 658, column: 20, scope: !864)
!866 = !DILocation(line: 658, column: 4, scope: !864)
!867 = !DILocation(line: 662, column: 4, scope: !868)
!868 = distinct !DILexicalBlock(scope: !860, file: !69, line: 661, column: 3)
!869 = !DILocation(line: 666, column: 1, scope: !819)
!870 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 685, type: !871, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!871 = !DISubroutineType(types: !872)
!872 = !{!6, !6, !28, !6}
!873 = !DILocalVariable(name: "factor1", arg: 1, scope: !870, file: !69, line: 685, type: !6)
!874 = !DILocation(line: 685, column: 33, scope: !870)
!875 = !DILocalVariable(name: "factor2", arg: 2, scope: !870, file: !69, line: 685, type: !28)
!876 = !DILocation(line: 685, column: 46, scope: !870)
!877 = !DILocalVariable(name: "denominator", arg: 3, scope: !870, file: !69, line: 685, type: !6)
!878 = !DILocation(line: 685, column: 59, scope: !870)
!879 = !DILocalVariable(name: "s32Result", scope: !870, file: !69, line: 687, type: !16)
!880 = !DILocation(line: 687, column: 6, scope: !870)
!881 = !DILocalVariable(name: "s32Temp1", scope: !870, file: !69, line: 687, type: !16)
!882 = !DILocation(line: 687, column: 21, scope: !870)
!883 = !DILocation(line: 688, column: 14, scope: !870)
!884 = !DILocation(line: 688, column: 24, scope: !870)
!885 = !DILocation(line: 688, column: 22, scope: !870)
!886 = !DILocation(line: 688, column: 12, scope: !870)
!887 = !DILocation(line: 689, column: 5, scope: !888)
!888 = distinct !DILexicalBlock(scope: !870, file: !69, line: 689, column: 5)
!889 = !DILocation(line: 689, column: 17, scope: !888)
!890 = !DILocation(line: 689, column: 5, scope: !870)
!891 = !DILocation(line: 691, column: 6, scope: !892)
!892 = distinct !DILexicalBlock(scope: !893, file: !69, line: 691, column: 6)
!893 = distinct !DILexicalBlock(scope: !888, file: !69, line: 690, column: 2)
!894 = !DILocation(line: 691, column: 16, scope: !892)
!895 = !DILocation(line: 691, column: 6, scope: !893)
!896 = !DILocation(line: 693, column: 4, scope: !897)
!897 = distinct !DILexicalBlock(scope: !892, file: !69, line: 692, column: 3)
!898 = !DILocation(line: 697, column: 4, scope: !899)
!899 = distinct !DILexicalBlock(scope: !892, file: !69, line: 696, column: 3)
!900 = !DILocation(line: 702, column: 14, scope: !901)
!901 = distinct !DILexicalBlock(scope: !888, file: !69, line: 701, column: 2)
!902 = !DILocation(line: 702, column: 27, scope: !901)
!903 = !DILocation(line: 702, column: 37, scope: !901)
!904 = !DILocation(line: 702, column: 36, scope: !901)
!905 = !DILocation(line: 702, column: 50, scope: !901)
!906 = !DILocation(line: 702, column: 49, scope: !901)
!907 = !DILocation(line: 702, column: 24, scope: !901)
!908 = !DILocation(line: 702, column: 12, scope: !901)
!909 = !DILocation(line: 703, column: 14, scope: !901)
!910 = !DILocation(line: 703, column: 23, scope: !901)
!911 = !DILocation(line: 703, column: 12, scope: !901)
!912 = !DILocation(line: 704, column: 16, scope: !901)
!913 = !DILocation(line: 704, column: 25, scope: !901)
!914 = !DILocation(line: 704, column: 24, scope: !901)
!915 = !DILocation(line: 704, column: 41, scope: !901)
!916 = !DILocation(line: 704, column: 51, scope: !901)
!917 = !DILocation(line: 704, column: 50, scope: !901)
!918 = !DILocation(line: 704, column: 38, scope: !901)
!919 = !DILocation(line: 704, column: 13, scope: !901)
!920 = !DILocation(line: 705, column: 6, scope: !921)
!921 = distinct !DILexicalBlock(scope: !901, file: !69, line: 705, column: 6)
!922 = !DILocation(line: 705, column: 16, scope: !921)
!923 = !DILocation(line: 705, column: 6, scope: !901)
!924 = !DILocation(line: 707, column: 7, scope: !925)
!925 = distinct !DILexicalBlock(scope: !926, file: !69, line: 707, column: 7)
!926 = distinct !DILexicalBlock(scope: !921, file: !69, line: 706, column: 3)
!927 = !DILocation(line: 707, column: 17, scope: !925)
!928 = !DILocation(line: 707, column: 7, scope: !926)
!929 = !DILocation(line: 709, column: 17, scope: !930)
!930 = distinct !DILexicalBlock(scope: !925, file: !69, line: 708, column: 4)
!931 = !DILocation(line: 709, column: 12, scope: !930)
!932 = !DILocation(line: 709, column: 5, scope: !930)
!933 = !DILocation(line: 714, column: 5, scope: !934)
!934 = distinct !DILexicalBlock(scope: !925, file: !69, line: 713, column: 4)
!935 = !DILocation(line: 719, column: 4, scope: !936)
!936 = distinct !DILexicalBlock(scope: !921, file: !69, line: 718, column: 3)
!937 = !DILocation(line: 723, column: 1, scope: !870)
!938 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 741, type: !939, scopeLine: 742, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!939 = !DISubroutineType(types: !940)
!940 = !{!6, !28, !6, !28}
!941 = !DILocalVariable(name: "factor1", arg: 1, scope: !938, file: !69, line: 741, type: !28)
!942 = !DILocation(line: 741, column: 33, scope: !938)
!943 = !DILocalVariable(name: "factor2", arg: 2, scope: !938, file: !69, line: 741, type: !6)
!944 = !DILocation(line: 741, column: 46, scope: !938)
!945 = !DILocalVariable(name: "denominator", arg: 3, scope: !938, file: !69, line: 741, type: !28)
!946 = !DILocation(line: 741, column: 59, scope: !938)
!947 = !DILocalVariable(name: "s32Result", scope: !938, file: !69, line: 743, type: !16)
!948 = !DILocation(line: 743, column: 6, scope: !938)
!949 = !DILocalVariable(name: "s32Temp1", scope: !938, file: !69, line: 743, type: !16)
!950 = !DILocation(line: 743, column: 21, scope: !938)
!951 = !DILocation(line: 744, column: 14, scope: !938)
!952 = !DILocation(line: 744, column: 24, scope: !938)
!953 = !DILocation(line: 744, column: 22, scope: !938)
!954 = !DILocation(line: 744, column: 12, scope: !938)
!955 = !DILocation(line: 745, column: 5, scope: !956)
!956 = distinct !DILexicalBlock(scope: !938, file: !69, line: 745, column: 5)
!957 = !DILocation(line: 745, column: 16, scope: !956)
!958 = !DILocation(line: 745, column: 5, scope: !938)
!959 = !DILocation(line: 747, column: 6, scope: !960)
!960 = distinct !DILexicalBlock(scope: !961, file: !69, line: 747, column: 6)
!961 = distinct !DILexicalBlock(scope: !956, file: !69, line: 746, column: 2)
!962 = !DILocation(line: 747, column: 16, scope: !960)
!963 = !DILocation(line: 747, column: 6, scope: !961)
!964 = !DILocation(line: 749, column: 4, scope: !965)
!965 = distinct !DILexicalBlock(scope: !960, file: !69, line: 748, column: 3)
!966 = !DILocation(line: 753, column: 4, scope: !967)
!967 = distinct !DILexicalBlock(scope: !960, file: !69, line: 752, column: 3)
!968 = !DILocation(line: 758, column: 14, scope: !969)
!969 = distinct !DILexicalBlock(scope: !956, file: !69, line: 757, column: 2)
!970 = !DILocation(line: 758, column: 28, scope: !969)
!971 = !DILocation(line: 758, column: 38, scope: !969)
!972 = !DILocation(line: 758, column: 37, scope: !969)
!973 = !DILocation(line: 758, column: 53, scope: !969)
!974 = !DILocation(line: 758, column: 51, scope: !969)
!975 = !DILocation(line: 758, column: 24, scope: !969)
!976 = !DILocation(line: 758, column: 66, scope: !969)
!977 = !DILocation(line: 758, column: 12, scope: !969)
!978 = !DILocation(line: 759, column: 16, scope: !969)
!979 = !DILocation(line: 759, column: 25, scope: !969)
!980 = !DILocation(line: 759, column: 24, scope: !969)
!981 = !DILocation(line: 759, column: 41, scope: !969)
!982 = !DILocation(line: 759, column: 51, scope: !969)
!983 = !DILocation(line: 759, column: 50, scope: !969)
!984 = !DILocation(line: 759, column: 38, scope: !969)
!985 = !DILocation(line: 759, column: 13, scope: !969)
!986 = !DILocation(line: 760, column: 6, scope: !987)
!987 = distinct !DILexicalBlock(scope: !969, file: !69, line: 760, column: 6)
!988 = !DILocation(line: 760, column: 16, scope: !987)
!989 = !DILocation(line: 760, column: 6, scope: !969)
!990 = !DILocation(line: 762, column: 7, scope: !991)
!991 = distinct !DILexicalBlock(scope: !992, file: !69, line: 762, column: 7)
!992 = distinct !DILexicalBlock(scope: !987, file: !69, line: 761, column: 3)
!993 = !DILocation(line: 762, column: 17, scope: !991)
!994 = !DILocation(line: 762, column: 7, scope: !992)
!995 = !DILocation(line: 764, column: 17, scope: !996)
!996 = distinct !DILexicalBlock(scope: !991, file: !69, line: 763, column: 4)
!997 = !DILocation(line: 764, column: 12, scope: !996)
!998 = !DILocation(line: 764, column: 5, scope: !996)
!999 = !DILocation(line: 768, column: 5, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !991, file: !69, line: 767, column: 4)
!1001 = !DILocation(line: 773, column: 4, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !987, file: !69, line: 772, column: 3)
!1003 = !DILocation(line: 776, column: 1, scope: !938)
!1004 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 795, type: !1005, scopeLine: 796, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1005 = !DISubroutineType(types: !1006)
!1006 = !{!28, !6, !28, !6}
!1007 = !DILocalVariable(name: "factor1", arg: 1, scope: !1004, file: !69, line: 795, type: !6)
!1008 = !DILocation(line: 795, column: 33, scope: !1004)
!1009 = !DILocalVariable(name: "factor2", arg: 2, scope: !1004, file: !69, line: 795, type: !28)
!1010 = !DILocation(line: 795, column: 46, scope: !1004)
!1011 = !DILocalVariable(name: "denominator", arg: 3, scope: !1004, file: !69, line: 795, type: !6)
!1012 = !DILocation(line: 795, column: 59, scope: !1004)
!1013 = !DILocalVariable(name: "u32Result", scope: !1004, file: !69, line: 797, type: !685)
!1014 = !DILocation(line: 797, column: 6, scope: !1004)
!1015 = !DILocalVariable(name: "u32Temp1", scope: !1004, file: !69, line: 797, type: !685)
!1016 = !DILocation(line: 797, column: 21, scope: !1004)
!1017 = !DILocalVariable(name: "s32Result", scope: !1004, file: !69, line: 798, type: !16)
!1018 = !DILocation(line: 798, column: 6, scope: !1004)
!1019 = !DILocalVariable(name: "s32Temp1", scope: !1004, file: !69, line: 798, type: !16)
!1020 = !DILocation(line: 798, column: 21, scope: !1004)
!1021 = !DILocation(line: 799, column: 14, scope: !1004)
!1022 = !DILocation(line: 799, column: 24, scope: !1004)
!1023 = !DILocation(line: 799, column: 22, scope: !1004)
!1024 = !DILocation(line: 799, column: 12, scope: !1004)
!1025 = !DILocation(line: 801, column: 5, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1004, file: !69, line: 801, column: 5)
!1027 = !DILocation(line: 801, column: 17, scope: !1026)
!1028 = !DILocation(line: 801, column: 5, scope: !1004)
!1029 = !DILocation(line: 803, column: 6, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1031, file: !69, line: 803, column: 6)
!1031 = distinct !DILexicalBlock(scope: !1026, file: !69, line: 802, column: 2)
!1032 = !DILocation(line: 803, column: 16, scope: !1030)
!1033 = !DILocation(line: 803, column: 6, scope: !1031)
!1034 = !DILocation(line: 805, column: 4, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1030, file: !69, line: 804, column: 3)
!1036 = !DILocation(line: 809, column: 4, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1030, file: !69, line: 808, column: 3)
!1038 = !DILocation(line: 814, column: 15, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1026, file: !69, line: 813, column: 2)
!1040 = !DILocation(line: 814, column: 29, scope: !1039)
!1041 = !DILocation(line: 814, column: 39, scope: !1039)
!1042 = !DILocation(line: 814, column: 38, scope: !1039)
!1043 = !DILocation(line: 814, column: 54, scope: !1039)
!1044 = !DILocation(line: 814, column: 52, scope: !1039)
!1045 = !DILocation(line: 814, column: 25, scope: !1039)
!1046 = !DILocation(line: 814, column: 68, scope: !1039)
!1047 = !DILocation(line: 814, column: 12, scope: !1039)
!1048 = !DILocation(line: 815, column: 16, scope: !1039)
!1049 = !DILocation(line: 815, column: 25, scope: !1039)
!1050 = !DILocation(line: 815, column: 24, scope: !1039)
!1051 = !DILocation(line: 815, column: 41, scope: !1039)
!1052 = !DILocation(line: 815, column: 51, scope: !1039)
!1053 = !DILocation(line: 815, column: 50, scope: !1039)
!1054 = !DILocation(line: 815, column: 38, scope: !1039)
!1055 = !DILocation(line: 815, column: 13, scope: !1039)
!1056 = !DILocation(line: 816, column: 6, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1039, file: !69, line: 816, column: 6)
!1058 = !DILocation(line: 816, column: 16, scope: !1057)
!1059 = !DILocation(line: 816, column: 6, scope: !1039)
!1060 = !DILocation(line: 818, column: 7, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1062, file: !69, line: 818, column: 7)
!1062 = distinct !DILexicalBlock(scope: !1057, file: !69, line: 817, column: 3)
!1063 = !DILocation(line: 818, column: 17, scope: !1061)
!1064 = !DILocation(line: 818, column: 7, scope: !1062)
!1065 = !DILocation(line: 820, column: 17, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1061, file: !69, line: 819, column: 4)
!1067 = !DILocation(line: 820, column: 12, scope: !1066)
!1068 = !DILocation(line: 820, column: 5, scope: !1066)
!1069 = !DILocation(line: 824, column: 5, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1061, file: !69, line: 823, column: 4)
!1071 = !DILocation(line: 829, column: 4, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1057, file: !69, line: 828, column: 3)
!1073 = !DILocation(line: 832, column: 1, scope: !1004)
!1074 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 851, type: !1075, scopeLine: 852, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1075 = !DISubroutineType(types: !1076)
!1076 = !{!28, !6, !28, !28}
!1077 = !DILocalVariable(name: "factor1", arg: 1, scope: !1074, file: !69, line: 851, type: !6)
!1078 = !DILocation(line: 851, column: 33, scope: !1074)
!1079 = !DILocalVariable(name: "factor2", arg: 2, scope: !1074, file: !69, line: 851, type: !28)
!1080 = !DILocation(line: 851, column: 46, scope: !1074)
!1081 = !DILocalVariable(name: "denominator", arg: 3, scope: !1074, file: !69, line: 851, type: !28)
!1082 = !DILocation(line: 851, column: 59, scope: !1074)
!1083 = !DILocalVariable(name: "s32Result", scope: !1074, file: !69, line: 853, type: !16)
!1084 = !DILocation(line: 853, column: 6, scope: !1074)
!1085 = !DILocalVariable(name: "s32Temp1", scope: !1074, file: !69, line: 853, type: !16)
!1086 = !DILocation(line: 853, column: 21, scope: !1074)
!1087 = !DILocation(line: 854, column: 14, scope: !1074)
!1088 = !DILocation(line: 854, column: 24, scope: !1074)
!1089 = !DILocation(line: 854, column: 22, scope: !1074)
!1090 = !DILocation(line: 854, column: 12, scope: !1074)
!1091 = !DILocation(line: 856, column: 5, scope: !1092)
!1092 = distinct !DILexicalBlock(scope: !1074, file: !69, line: 856, column: 5)
!1093 = !DILocation(line: 856, column: 17, scope: !1092)
!1094 = !DILocation(line: 856, column: 5, scope: !1074)
!1095 = !DILocation(line: 858, column: 6, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1097, file: !69, line: 858, column: 6)
!1097 = distinct !DILexicalBlock(scope: !1092, file: !69, line: 857, column: 2)
!1098 = !DILocation(line: 858, column: 16, scope: !1096)
!1099 = !DILocation(line: 858, column: 6, scope: !1097)
!1100 = !DILocation(line: 860, column: 4, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1096, file: !69, line: 859, column: 3)
!1102 = !DILocation(line: 864, column: 4, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1096, file: !69, line: 863, column: 3)
!1104 = !DILocation(line: 869, column: 15, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1092, file: !69, line: 868, column: 2)
!1106 = !DILocation(line: 869, column: 29, scope: !1105)
!1107 = !DILocation(line: 869, column: 39, scope: !1105)
!1108 = !DILocation(line: 869, column: 38, scope: !1105)
!1109 = !DILocation(line: 869, column: 54, scope: !1105)
!1110 = !DILocation(line: 869, column: 52, scope: !1105)
!1111 = !DILocation(line: 869, column: 25, scope: !1105)
!1112 = !DILocation(line: 869, column: 68, scope: !1105)
!1113 = !DILocation(line: 869, column: 12, scope: !1105)
!1114 = !DILocation(line: 870, column: 16, scope: !1105)
!1115 = !DILocation(line: 870, column: 25, scope: !1105)
!1116 = !DILocation(line: 870, column: 24, scope: !1105)
!1117 = !DILocation(line: 870, column: 41, scope: !1105)
!1118 = !DILocation(line: 870, column: 51, scope: !1105)
!1119 = !DILocation(line: 870, column: 50, scope: !1105)
!1120 = !DILocation(line: 870, column: 38, scope: !1105)
!1121 = !DILocation(line: 870, column: 13, scope: !1105)
!1122 = !DILocation(line: 871, column: 6, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1105, file: !69, line: 871, column: 6)
!1124 = !DILocation(line: 871, column: 16, scope: !1123)
!1125 = !DILocation(line: 871, column: 6, scope: !1105)
!1126 = !DILocation(line: 873, column: 7, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1128, file: !69, line: 873, column: 7)
!1128 = distinct !DILexicalBlock(scope: !1123, file: !69, line: 872, column: 3)
!1129 = !DILocation(line: 873, column: 17, scope: !1127)
!1130 = !DILocation(line: 873, column: 7, scope: !1128)
!1131 = !DILocation(line: 875, column: 17, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1127, file: !69, line: 874, column: 4)
!1133 = !DILocation(line: 875, column: 12, scope: !1132)
!1134 = !DILocation(line: 875, column: 5, scope: !1132)
!1135 = !DILocation(line: 879, column: 5, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1127, file: !69, line: 878, column: 4)
!1137 = !DILocation(line: 884, column: 4, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1123, file: !69, line: 883, column: 3)
!1139 = !DILocation(line: 888, column: 1, scope: !1074)
!1140 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 906, type: !1141, scopeLine: 907, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1141 = !DISubroutineType(types: !1142)
!1142 = !{!28, !28, !28, !28}
!1143 = !DILocalVariable(name: "factor1", arg: 1, scope: !1140, file: !69, line: 906, type: !28)
!1144 = !DILocation(line: 906, column: 33, scope: !1140)
!1145 = !DILocalVariable(name: "factor2", arg: 2, scope: !1140, file: !69, line: 906, type: !28)
!1146 = !DILocation(line: 906, column: 46, scope: !1140)
!1147 = !DILocalVariable(name: "denominator", arg: 3, scope: !1140, file: !69, line: 906, type: !28)
!1148 = !DILocation(line: 906, column: 59, scope: !1140)
!1149 = !DILocalVariable(name: "u32Temp1", scope: !1140, file: !69, line: 908, type: !685)
!1150 = !DILocation(line: 908, column: 6, scope: !1140)
!1151 = !DILocalVariable(name: "u16TempDenom", scope: !1140, file: !69, line: 909, type: !28)
!1152 = !DILocation(line: 909, column: 6, scope: !1140)
!1153 = !DILocation(line: 911, column: 5, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1140, file: !69, line: 911, column: 5)
!1155 = !DILocation(line: 911, column: 17, scope: !1154)
!1156 = !DILocation(line: 911, column: 5, scope: !1140)
!1157 = !DILocation(line: 913, column: 3, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1154, file: !69, line: 912, column: 2)
!1159 = !DILocation(line: 917, column: 14, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1154, file: !69, line: 916, column: 2)
!1161 = !DILocation(line: 917, column: 24, scope: !1160)
!1162 = !DILocation(line: 917, column: 22, scope: !1160)
!1163 = !DILocation(line: 917, column: 12, scope: !1160)
!1164 = !DILocation(line: 918, column: 18, scope: !1160)
!1165 = !DILocation(line: 918, column: 30, scope: !1160)
!1166 = !DILocation(line: 918, column: 16, scope: !1160)
!1167 = !DILocation(line: 919, column: 14, scope: !1160)
!1168 = !DILocation(line: 919, column: 25, scope: !1160)
!1169 = !DILocation(line: 919, column: 23, scope: !1160)
!1170 = !DILocation(line: 919, column: 12, scope: !1160)
!1171 = !DILocation(line: 920, column: 14, scope: !1160)
!1172 = !DILocation(line: 920, column: 25, scope: !1160)
!1173 = !DILocation(line: 920, column: 23, scope: !1160)
!1174 = !DILocation(line: 920, column: 12, scope: !1160)
!1175 = !DILocation(line: 921, column: 6, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1160, file: !69, line: 921, column: 6)
!1177 = !DILocation(line: 921, column: 15, scope: !1176)
!1178 = !DILocation(line: 921, column: 6, scope: !1160)
!1179 = !DILocation(line: 923, column: 12, scope: !1180)
!1180 = distinct !DILexicalBlock(scope: !1176, file: !69, line: 922, column: 3)
!1181 = !DILocation(line: 923, column: 21, scope: !1180)
!1182 = !DILocation(line: 923, column: 11, scope: !1180)
!1183 = !DILocation(line: 923, column: 4, scope: !1180)
!1184 = !DILocation(line: 928, column: 4, scope: !1185)
!1185 = distinct !DILexicalBlock(scope: !1176, file: !69, line: 927, column: 3)
!1186 = !DILocation(line: 933, column: 1, scope: !1140)
!1187 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 950, type: !1188, scopeLine: 951, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1188 = !DISubroutineType(types: !1189)
!1189 = !{!28, !28, !28, !685}
!1190 = !DILocalVariable(name: "factor1", arg: 1, scope: !1187, file: !69, line: 950, type: !28)
!1191 = !DILocation(line: 950, column: 33, scope: !1187)
!1192 = !DILocalVariable(name: "factor2", arg: 2, scope: !1187, file: !69, line: 950, type: !28)
!1193 = !DILocation(line: 950, column: 46, scope: !1187)
!1194 = !DILocalVariable(name: "denominator", arg: 3, scope: !1187, file: !69, line: 950, type: !685)
!1195 = !DILocation(line: 950, column: 59, scope: !1187)
!1196 = !DILocalVariable(name: "u32Temp1", scope: !1187, file: !69, line: 952, type: !685)
!1197 = !DILocation(line: 952, column: 6, scope: !1187)
!1198 = !DILocation(line: 953, column: 5, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1187, file: !69, line: 953, column: 5)
!1200 = !DILocation(line: 953, column: 17, scope: !1199)
!1201 = !DILocation(line: 953, column: 5, scope: !1187)
!1202 = !DILocation(line: 955, column: 3, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1199, file: !69, line: 954, column: 2)
!1204 = !DILocation(line: 959, column: 15, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1199, file: !69, line: 958, column: 2)
!1206 = !DILocation(line: 959, column: 25, scope: !1205)
!1207 = !DILocation(line: 959, column: 23, scope: !1205)
!1208 = !DILocation(line: 959, column: 36, scope: !1205)
!1209 = !DILocation(line: 959, column: 34, scope: !1205)
!1210 = !DILocation(line: 959, column: 12, scope: !1205)
!1211 = !DILocation(line: 960, column: 8, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1205, file: !69, line: 960, column: 6)
!1213 = !DILocation(line: 960, column: 18, scope: !1212)
!1214 = !DILocation(line: 960, column: 16, scope: !1212)
!1215 = !DILocation(line: 960, column: 28, scope: !1212)
!1216 = !DILocation(line: 960, column: 40, scope: !1212)
!1217 = !DILocation(line: 960, column: 39, scope: !1212)
!1218 = !DILocation(line: 960, column: 26, scope: !1212)
!1219 = !DILocation(line: 960, column: 53, scope: !1212)
!1220 = !DILocation(line: 960, column: 64, scope: !1212)
!1221 = !DILocation(line: 960, column: 50, scope: !1212)
!1222 = !DILocation(line: 960, column: 6, scope: !1205)
!1223 = !DILocation(line: 962, column: 12, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1212, file: !69, line: 961, column: 3)
!1225 = !DILocation(line: 963, column: 3, scope: !1224)
!1226 = !DILocation(line: 964, column: 6, scope: !1227)
!1227 = distinct !DILexicalBlock(scope: !1205, file: !69, line: 964, column: 6)
!1228 = !DILocation(line: 964, column: 15, scope: !1227)
!1229 = !DILocation(line: 964, column: 6, scope: !1205)
!1230 = !DILocation(line: 966, column: 12, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1227, file: !69, line: 965, column: 3)
!1232 = !DILocation(line: 966, column: 21, scope: !1231)
!1233 = !DILocation(line: 966, column: 11, scope: !1231)
!1234 = !DILocation(line: 966, column: 4, scope: !1231)
!1235 = !DILocation(line: 970, column: 4, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1227, file: !69, line: 969, column: 3)
!1237 = !DILocation(line: 973, column: 1, scope: !1187)
!1238 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 990, type: !1239, scopeLine: 991, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1239 = !DISubroutineType(types: !1240)
!1240 = !{!685, !685, !28}
!1241 = !DILocalVariable(name: "x_value", arg: 1, scope: !1238, file: !69, line: 990, type: !685)
!1242 = !DILocation(line: 990, column: 25, scope: !1238)
!1243 = !DILocalVariable(name: "y_value", arg: 2, scope: !1238, file: !69, line: 990, type: !28)
!1244 = !DILocation(line: 990, column: 38, scope: !1238)
!1245 = !DILocalVariable(name: "u32Temp1", scope: !1238, file: !69, line: 992, type: !685)
!1246 = !DILocation(line: 992, column: 6, scope: !1238)
!1247 = !DILocation(line: 993, column: 5, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1238, file: !69, line: 993, column: 5)
!1249 = !DILocation(line: 993, column: 13, scope: !1248)
!1250 = !DILocation(line: 993, column: 5, scope: !1238)
!1251 = !DILocation(line: 995, column: 3, scope: !1252)
!1252 = distinct !DILexicalBlock(scope: !1248, file: !69, line: 994, column: 2)
!1253 = !DILocation(line: 999, column: 15, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1248, file: !69, line: 998, column: 2)
!1255 = !DILocation(line: 999, column: 26, scope: !1254)
!1256 = !DILocation(line: 999, column: 34, scope: !1254)
!1257 = !DILocation(line: 999, column: 33, scope: !1254)
!1258 = !DILocation(line: 999, column: 45, scope: !1254)
!1259 = !DILocation(line: 999, column: 43, scope: !1254)
!1260 = !DILocation(line: 999, column: 23, scope: !1254)
!1261 = !DILocation(line: 999, column: 54, scope: !1254)
!1262 = !DILocation(line: 999, column: 12, scope: !1254)
!1263 = !DILocation(line: 1000, column: 15, scope: !1254)
!1264 = !DILocation(line: 1000, column: 23, scope: !1254)
!1265 = !DILocation(line: 1000, column: 22, scope: !1254)
!1266 = !DILocation(line: 1000, column: 35, scope: !1254)
!1267 = !DILocation(line: 1000, column: 44, scope: !1254)
!1268 = !DILocation(line: 1000, column: 43, scope: !1254)
!1269 = !DILocation(line: 1000, column: 32, scope: !1254)
!1270 = !DILocation(line: 1000, column: 12, scope: !1254)
!1271 = !DILocation(line: 1001, column: 10, scope: !1254)
!1272 = !DILocation(line: 1001, column: 3, scope: !1254)
!1273 = !DILocation(line: 1003, column: 1, scope: !1238)
!1274 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 1021, type: !1275, scopeLine: 1022, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1275 = !DISubroutineType(types: !1276)
!1276 = !{!6, !6, !6, !6}
!1277 = !DILocalVariable(name: "fak1", arg: 1, scope: !1274, file: !69, line: 1021, type: !6)
!1278 = !DILocation(line: 1021, column: 33, scope: !1274)
!1279 = !DILocalVariable(name: "fak2", arg: 2, scope: !1274, file: !69, line: 1021, type: !6)
!1280 = !DILocation(line: 1021, column: 43, scope: !1274)
!1281 = !DILocalVariable(name: "div", arg: 3, scope: !1274, file: !69, line: 1021, type: !6)
!1282 = !DILocation(line: 1021, column: 53, scope: !1274)
!1283 = !DILocalVariable(name: "s32Temp1", scope: !1274, file: !69, line: 1023, type: !16)
!1284 = !DILocation(line: 1023, column: 6, scope: !1274)
!1285 = !DILocalVariable(name: "s32Temp2", scope: !1274, file: !69, line: 1023, type: !16)
!1286 = !DILocation(line: 1023, column: 20, scope: !1274)
!1287 = !DILocalVariable(name: "s32Temp3", scope: !1274, file: !69, line: 1023, type: !16)
!1288 = !DILocation(line: 1023, column: 34, scope: !1274)
!1289 = !DILocation(line: 1024, column: 13, scope: !1274)
!1290 = !DILocation(line: 1024, column: 20, scope: !1274)
!1291 = !DILocation(line: 1024, column: 18, scope: !1274)
!1292 = !DILocation(line: 1024, column: 11, scope: !1274)
!1293 = !DILocation(line: 1025, column: 5, scope: !1294)
!1294 = distinct !DILexicalBlock(scope: !1274, file: !69, line: 1025, column: 5)
!1295 = !DILocation(line: 1025, column: 9, scope: !1294)
!1296 = !DILocation(line: 1025, column: 5, scope: !1274)
!1297 = !DILocation(line: 1027, column: 6, scope: !1298)
!1298 = distinct !DILexicalBlock(scope: !1299, file: !69, line: 1027, column: 6)
!1299 = distinct !DILexicalBlock(scope: !1294, file: !69, line: 1026, column: 2)
!1300 = !DILocation(line: 1027, column: 15, scope: !1298)
!1301 = !DILocation(line: 1027, column: 6, scope: !1299)
!1302 = !DILocation(line: 1029, column: 4, scope: !1303)
!1303 = distinct !DILexicalBlock(scope: !1298, file: !69, line: 1028, column: 3)
!1304 = !DILocation(line: 1033, column: 4, scope: !1305)
!1305 = distinct !DILexicalBlock(scope: !1298, file: !69, line: 1032, column: 3)
!1306 = !DILocation(line: 1038, column: 15, scope: !1307)
!1307 = distinct !DILexicalBlock(scope: !1294, file: !69, line: 1037, column: 2)
!1308 = !DILocation(line: 1038, column: 28, scope: !1307)
!1309 = !DILocation(line: 1038, column: 39, scope: !1307)
!1310 = !DILocation(line: 1038, column: 37, scope: !1307)
!1311 = !DILocation(line: 1038, column: 46, scope: !1307)
!1312 = !DILocation(line: 1038, column: 44, scope: !1307)
!1313 = !DILocation(line: 1038, column: 24, scope: !1307)
!1314 = !DILocation(line: 1038, column: 52, scope: !1307)
!1315 = !DILocation(line: 1038, column: 12, scope: !1307)
!1316 = !DILocation(line: 1039, column: 15, scope: !1307)
!1317 = !DILocation(line: 1039, column: 24, scope: !1307)
!1318 = !DILocation(line: 1039, column: 23, scope: !1307)
!1319 = !DILocation(line: 1039, column: 32, scope: !1307)
!1320 = !DILocation(line: 1039, column: 41, scope: !1307)
!1321 = !DILocation(line: 1039, column: 40, scope: !1307)
!1322 = !DILocation(line: 1039, column: 29, scope: !1307)
!1323 = !DILocation(line: 1039, column: 12, scope: !1307)
!1324 = !DILocation(line: 1040, column: 6, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1307, file: !69, line: 1040, column: 6)
!1326 = !DILocation(line: 1040, column: 15, scope: !1325)
!1327 = !DILocation(line: 1040, column: 6, scope: !1307)
!1328 = !DILocation(line: 1042, column: 7, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1330, file: !69, line: 1042, column: 7)
!1330 = distinct !DILexicalBlock(scope: !1325, file: !69, line: 1041, column: 3)
!1331 = !DILocation(line: 1042, column: 16, scope: !1329)
!1332 = !DILocation(line: 1042, column: 7, scope: !1330)
!1333 = !DILocation(line: 1044, column: 17, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1329, file: !69, line: 1043, column: 4)
!1335 = !DILocation(line: 1044, column: 12, scope: !1334)
!1336 = !DILocation(line: 1044, column: 5, scope: !1334)
!1337 = !DILocation(line: 1048, column: 5, scope: !1338)
!1338 = distinct !DILexicalBlock(scope: !1329, file: !69, line: 1047, column: 4)
!1339 = !DILocation(line: 1053, column: 4, scope: !1340)
!1340 = distinct !DILexicalBlock(scope: !1325, file: !69, line: 1052, column: 3)
!1341 = !DILocation(line: 1056, column: 1, scope: !1274)
!1342 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1074, type: !1343, scopeLine: 1075, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1343 = !DISubroutineType(types: !1344)
!1344 = !{!6, !6, !6, !28}
!1345 = !DILocalVariable(name: "data1", arg: 1, scope: !1342, file: !69, line: 1074, type: !6)
!1346 = !DILocation(line: 1074, column: 33, scope: !1342)
!1347 = !DILocalVariable(name: "data2", arg: 2, scope: !1342, file: !69, line: 1074, type: !6)
!1348 = !DILocation(line: 1074, column: 43, scope: !1342)
!1349 = !DILocalVariable(name: "denominator", arg: 3, scope: !1342, file: !69, line: 1074, type: !28)
!1350 = !DILocation(line: 1074, column: 53, scope: !1342)
!1351 = !DILocalVariable(name: "s32Result", scope: !1342, file: !69, line: 1076, type: !16)
!1352 = !DILocation(line: 1076, column: 6, scope: !1342)
!1353 = !DILocalVariable(name: "s32Temp1", scope: !1342, file: !69, line: 1076, type: !16)
!1354 = !DILocation(line: 1076, column: 21, scope: !1342)
!1355 = !DILocation(line: 1077, column: 14, scope: !1342)
!1356 = !DILocation(line: 1077, column: 22, scope: !1342)
!1357 = !DILocation(line: 1077, column: 20, scope: !1342)
!1358 = !DILocation(line: 1077, column: 12, scope: !1342)
!1359 = !DILocation(line: 1079, column: 5, scope: !1360)
!1360 = distinct !DILexicalBlock(scope: !1342, file: !69, line: 1079, column: 5)
!1361 = !DILocation(line: 1079, column: 17, scope: !1360)
!1362 = !DILocation(line: 1079, column: 5, scope: !1342)
!1363 = !DILocation(line: 1081, column: 6, scope: !1364)
!1364 = distinct !DILexicalBlock(scope: !1365, file: !69, line: 1081, column: 6)
!1365 = distinct !DILexicalBlock(scope: !1360, file: !69, line: 1080, column: 2)
!1366 = !DILocation(line: 1081, column: 16, scope: !1364)
!1367 = !DILocation(line: 1081, column: 6, scope: !1365)
!1368 = !DILocation(line: 1083, column: 4, scope: !1369)
!1369 = distinct !DILexicalBlock(scope: !1364, file: !69, line: 1082, column: 3)
!1370 = !DILocation(line: 1085, column: 11, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1364, file: !69, line: 1085, column: 11)
!1372 = !DILocation(line: 1085, column: 21, scope: !1371)
!1373 = !DILocation(line: 1085, column: 11, scope: !1364)
!1374 = !DILocation(line: 1087, column: 4, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1371, file: !69, line: 1086, column: 3)
!1376 = !DILocation(line: 1091, column: 4, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1371, file: !69, line: 1090, column: 3)
!1378 = !DILocation(line: 1096, column: 15, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1360, file: !69, line: 1095, column: 2)
!1380 = !DILocation(line: 1096, column: 28, scope: !1379)
!1381 = !DILocation(line: 1096, column: 38, scope: !1379)
!1382 = !DILocation(line: 1096, column: 37, scope: !1379)
!1383 = !DILocation(line: 1096, column: 51, scope: !1379)
!1384 = !DILocation(line: 1096, column: 50, scope: !1379)
!1385 = !DILocation(line: 1096, column: 25, scope: !1379)
!1386 = !DILocation(line: 1096, column: 64, scope: !1379)
!1387 = !DILocation(line: 1096, column: 12, scope: !1379)
!1388 = !DILocation(line: 1097, column: 16, scope: !1379)
!1389 = !DILocation(line: 1097, column: 25, scope: !1379)
!1390 = !DILocation(line: 1097, column: 24, scope: !1379)
!1391 = !DILocation(line: 1097, column: 41, scope: !1379)
!1392 = !DILocation(line: 1097, column: 51, scope: !1379)
!1393 = !DILocation(line: 1097, column: 50, scope: !1379)
!1394 = !DILocation(line: 1097, column: 38, scope: !1379)
!1395 = !DILocation(line: 1097, column: 13, scope: !1379)
!1396 = !DILocation(line: 1098, column: 6, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1379, file: !69, line: 1098, column: 6)
!1398 = !DILocation(line: 1098, column: 16, scope: !1397)
!1399 = !DILocation(line: 1098, column: 6, scope: !1379)
!1400 = !DILocation(line: 1100, column: 7, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1402, file: !69, line: 1100, column: 7)
!1402 = distinct !DILexicalBlock(scope: !1397, file: !69, line: 1099, column: 3)
!1403 = !DILocation(line: 1100, column: 17, scope: !1401)
!1404 = !DILocation(line: 1100, column: 7, scope: !1402)
!1405 = !DILocation(line: 1102, column: 17, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1101, column: 4)
!1407 = !DILocation(line: 1102, column: 12, scope: !1406)
!1408 = !DILocation(line: 1102, column: 5, scope: !1406)
!1409 = !DILocation(line: 1106, column: 5, scope: !1410)
!1410 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1105, column: 4)
!1411 = !DILocation(line: 1111, column: 4, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1397, file: !69, line: 1110, column: 3)
!1413 = !DILocation(line: 1115, column: 1, scope: !1342)
!1414 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1132, type: !1415, scopeLine: 1133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1415 = !DISubroutineType(types: !1416)
!1416 = !{!685, !685, !16}
!1417 = !DILocalVariable(name: "numerator", arg: 1, scope: !1414, file: !69, line: 1132, type: !685)
!1418 = !DILocation(line: 1132, column: 25, scope: !1414)
!1419 = !DILocalVariable(name: "denominator", arg: 2, scope: !1414, file: !69, line: 1132, type: !16)
!1420 = !DILocation(line: 1132, column: 40, scope: !1414)
!1421 = !DILocalVariable(name: "u32Temp1", scope: !1414, file: !69, line: 1134, type: !685)
!1422 = !DILocation(line: 1134, column: 6, scope: !1414)
!1423 = !DILocation(line: 1135, column: 5, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !1414, file: !69, line: 1135, column: 5)
!1425 = !DILocation(line: 1135, column: 17, scope: !1424)
!1426 = !DILocation(line: 1135, column: 5, scope: !1414)
!1427 = !DILocation(line: 1137, column: 3, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1424, file: !69, line: 1136, column: 2)
!1429 = !DILocation(line: 1141, column: 6, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1431, file: !69, line: 1141, column: 6)
!1431 = distinct !DILexicalBlock(scope: !1424, file: !69, line: 1140, column: 2)
!1432 = !DILocation(line: 1141, column: 18, scope: !1430)
!1433 = !DILocation(line: 1141, column: 6, scope: !1431)
!1434 = !DILocation(line: 1143, column: 4, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1430, file: !69, line: 1142, column: 3)
!1436 = !DILocation(line: 1147, column: 16, scope: !1437)
!1437 = distinct !DILexicalBlock(scope: !1430, file: !69, line: 1146, column: 3)
!1438 = !DILocation(line: 1147, column: 30, scope: !1437)
!1439 = !DILocation(line: 1147, column: 40, scope: !1437)
!1440 = !DILocation(line: 1147, column: 39, scope: !1437)
!1441 = !DILocation(line: 1147, column: 55, scope: !1437)
!1442 = !DILocation(line: 1147, column: 53, scope: !1437)
!1443 = !DILocation(line: 1147, column: 26, scope: !1437)
!1444 = !DILocation(line: 1147, column: 68, scope: !1437)
!1445 = !DILocation(line: 1147, column: 13, scope: !1437)
!1446 = !DILocation(line: 1148, column: 16, scope: !1437)
!1447 = !DILocation(line: 1148, column: 25, scope: !1437)
!1448 = !DILocation(line: 1148, column: 24, scope: !1437)
!1449 = !DILocation(line: 1148, column: 41, scope: !1437)
!1450 = !DILocation(line: 1148, column: 51, scope: !1437)
!1451 = !DILocation(line: 1148, column: 50, scope: !1437)
!1452 = !DILocation(line: 1148, column: 38, scope: !1437)
!1453 = !DILocation(line: 1148, column: 13, scope: !1437)
!1454 = !DILocation(line: 1149, column: 11, scope: !1437)
!1455 = !DILocation(line: 1149, column: 4, scope: !1437)
!1456 = !DILocation(line: 1152, column: 1, scope: !1414)
!1457 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1169, type: !1458, scopeLine: 1170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1458 = !DISubroutineType(types: !1459)
!1459 = !{!685, !16, !685}
!1460 = !DILocalVariable(name: "numerator", arg: 1, scope: !1457, file: !69, line: 1169, type: !16)
!1461 = !DILocation(line: 1169, column: 25, scope: !1457)
!1462 = !DILocalVariable(name: "denominator", arg: 2, scope: !1457, file: !69, line: 1169, type: !685)
!1463 = !DILocation(line: 1169, column: 40, scope: !1457)
!1464 = !DILocalVariable(name: "s32Temp1", scope: !1457, file: !69, line: 1171, type: !16)
!1465 = !DILocation(line: 1171, column: 6, scope: !1457)
!1466 = !DILocation(line: 1172, column: 5, scope: !1467)
!1467 = distinct !DILexicalBlock(scope: !1457, file: !69, line: 1172, column: 5)
!1468 = !DILocation(line: 1172, column: 17, scope: !1467)
!1469 = !DILocation(line: 1172, column: 5, scope: !1457)
!1470 = !DILocation(line: 1174, column: 6, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1472, file: !69, line: 1174, column: 6)
!1472 = distinct !DILexicalBlock(scope: !1467, file: !69, line: 1173, column: 2)
!1473 = !DILocation(line: 1174, column: 16, scope: !1471)
!1474 = !DILocation(line: 1174, column: 6, scope: !1472)
!1475 = !DILocation(line: 1176, column: 4, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1471, file: !69, line: 1175, column: 3)
!1477 = !DILocation(line: 1180, column: 4, scope: !1478)
!1478 = distinct !DILexicalBlock(scope: !1471, file: !69, line: 1179, column: 3)
!1479 = !DILocation(line: 1185, column: 6, scope: !1480)
!1480 = distinct !DILexicalBlock(scope: !1481, file: !69, line: 1185, column: 6)
!1481 = distinct !DILexicalBlock(scope: !1467, file: !69, line: 1184, column: 2)
!1482 = !DILocation(line: 1185, column: 16, scope: !1480)
!1483 = !DILocation(line: 1185, column: 6, scope: !1481)
!1484 = !DILocation(line: 1187, column: 17, scope: !1485)
!1485 = distinct !DILexicalBlock(scope: !1480, file: !69, line: 1186, column: 3)
!1486 = !DILocation(line: 1187, column: 31, scope: !1485)
!1487 = !DILocation(line: 1187, column: 41, scope: !1485)
!1488 = !DILocation(line: 1187, column: 40, scope: !1485)
!1489 = !DILocation(line: 1187, column: 56, scope: !1485)
!1490 = !DILocation(line: 1187, column: 54, scope: !1485)
!1491 = !DILocation(line: 1187, column: 27, scope: !1485)
!1492 = !DILocation(line: 1187, column: 69, scope: !1485)
!1493 = !DILocation(line: 1187, column: 13, scope: !1485)
!1494 = !DILocation(line: 1188, column: 13, scope: !1485)
!1495 = !DILocation(line: 1188, column: 23, scope: !1485)
!1496 = !DILocation(line: 1188, column: 22, scope: !1485)
!1497 = !DILocation(line: 1188, column: 39, scope: !1485)
!1498 = !DILocation(line: 1188, column: 48, scope: !1485)
!1499 = !DILocation(line: 1188, column: 47, scope: !1485)
!1500 = !DILocation(line: 1188, column: 36, scope: !1485)
!1501 = !DILocation(line: 1188, column: 4, scope: !1485)
!1502 = !DILocation(line: 1192, column: 4, scope: !1503)
!1503 = distinct !DILexicalBlock(scope: !1480, file: !69, line: 1191, column: 3)
!1504 = !DILocation(line: 1195, column: 1, scope: !1457)
!1505 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1212, type: !1506, scopeLine: 1213, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1506 = !DISubroutineType(types: !1507)
!1507 = !{!685, !16, !16}
!1508 = !DILocalVariable(name: "numerator", arg: 1, scope: !1505, file: !69, line: 1212, type: !16)
!1509 = !DILocation(line: 1212, column: 25, scope: !1505)
!1510 = !DILocalVariable(name: "denominator", arg: 2, scope: !1505, file: !69, line: 1212, type: !16)
!1511 = !DILocation(line: 1212, column: 40, scope: !1505)
!1512 = !DILocalVariable(name: "u32Temp1", scope: !1505, file: !69, line: 1214, type: !685)
!1513 = !DILocation(line: 1214, column: 6, scope: !1505)
!1514 = !DILocalVariable(name: "u32Temp2", scope: !1505, file: !69, line: 1214, type: !685)
!1515 = !DILocation(line: 1214, column: 20, scope: !1505)
!1516 = !DILocation(line: 1215, column: 5, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1505, file: !69, line: 1215, column: 5)
!1518 = !DILocation(line: 1215, column: 17, scope: !1517)
!1519 = !DILocation(line: 1215, column: 5, scope: !1505)
!1520 = !DILocation(line: 1217, column: 6, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1522, file: !69, line: 1217, column: 6)
!1522 = distinct !DILexicalBlock(scope: !1517, file: !69, line: 1216, column: 2)
!1523 = !DILocation(line: 1217, column: 16, scope: !1521)
!1524 = !DILocation(line: 1217, column: 6, scope: !1522)
!1525 = !DILocation(line: 1219, column: 4, scope: !1526)
!1526 = distinct !DILexicalBlock(scope: !1521, file: !69, line: 1218, column: 3)
!1527 = !DILocation(line: 1223, column: 4, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1521, file: !69, line: 1222, column: 3)
!1529 = !DILocation(line: 1228, column: 6, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1531, file: !69, line: 1228, column: 6)
!1531 = distinct !DILexicalBlock(scope: !1517, file: !69, line: 1227, column: 2)
!1532 = !DILocation(line: 1228, column: 16, scope: !1530)
!1533 = !DILocation(line: 1228, column: 6, scope: !1531)
!1534 = !DILocation(line: 1230, column: 7, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1536, file: !69, line: 1230, column: 7)
!1536 = distinct !DILexicalBlock(scope: !1530, file: !69, line: 1229, column: 3)
!1537 = !DILocation(line: 1230, column: 17, scope: !1535)
!1538 = !DILocation(line: 1230, column: 7, scope: !1536)
!1539 = !DILocation(line: 1232, column: 5, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1535, file: !69, line: 1231, column: 4)
!1541 = !DILocation(line: 1236, column: 8, scope: !1542)
!1542 = distinct !DILexicalBlock(scope: !1543, file: !69, line: 1236, column: 8)
!1543 = distinct !DILexicalBlock(scope: !1535, file: !69, line: 1235, column: 4)
!1544 = !DILocation(line: 1236, column: 20, scope: !1542)
!1545 = !DILocation(line: 1236, column: 8, scope: !1543)
!1546 = !DILocation(line: 1238, column: 6, scope: !1547)
!1547 = distinct !DILexicalBlock(scope: !1542, file: !69, line: 1237, column: 5)
!1548 = !DILocation(line: 1242, column: 18, scope: !1549)
!1549 = distinct !DILexicalBlock(scope: !1542, file: !69, line: 1241, column: 5)
!1550 = !DILocation(line: 1242, column: 32, scope: !1549)
!1551 = !DILocation(line: 1242, column: 42, scope: !1549)
!1552 = !DILocation(line: 1242, column: 41, scope: !1549)
!1553 = !DILocation(line: 1242, column: 57, scope: !1549)
!1554 = !DILocation(line: 1242, column: 55, scope: !1549)
!1555 = !DILocation(line: 1242, column: 28, scope: !1549)
!1556 = !DILocation(line: 1242, column: 71, scope: !1549)
!1557 = !DILocation(line: 1242, column: 15, scope: !1549)
!1558 = !DILocation(line: 1243, column: 18, scope: !1549)
!1559 = !DILocation(line: 1243, column: 29, scope: !1549)
!1560 = !DILocation(line: 1243, column: 27, scope: !1549)
!1561 = !DILocation(line: 1243, column: 45, scope: !1549)
!1562 = !DILocation(line: 1243, column: 57, scope: !1549)
!1563 = !DILocation(line: 1243, column: 55, scope: !1549)
!1564 = !DILocation(line: 1243, column: 42, scope: !1549)
!1565 = !DILocation(line: 1243, column: 15, scope: !1549)
!1566 = !DILocation(line: 1244, column: 13, scope: !1549)
!1567 = !DILocation(line: 1244, column: 6, scope: !1549)
!1568 = !DILocation(line: 1250, column: 7, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1570, file: !69, line: 1250, column: 7)
!1570 = distinct !DILexicalBlock(scope: !1530, file: !69, line: 1249, column: 3)
!1571 = !DILocation(line: 1250, column: 19, scope: !1569)
!1572 = !DILocation(line: 1250, column: 7, scope: !1570)
!1573 = !DILocation(line: 1252, column: 5, scope: !1574)
!1574 = distinct !DILexicalBlock(scope: !1569, file: !69, line: 1251, column: 4)
!1575 = !DILocation(line: 1256, column: 18, scope: !1576)
!1576 = distinct !DILexicalBlock(scope: !1569, file: !69, line: 1255, column: 4)
!1577 = !DILocation(line: 1256, column: 17, scope: !1576)
!1578 = !DILocation(line: 1256, column: 15, scope: !1576)
!1579 = !DILocation(line: 1257, column: 20, scope: !1576)
!1580 = !DILocation(line: 1257, column: 19, scope: !1576)
!1581 = !DILocation(line: 1257, column: 17, scope: !1576)
!1582 = !DILocation(line: 1258, column: 17, scope: !1576)
!1583 = !DILocation(line: 1258, column: 31, scope: !1576)
!1584 = !DILocation(line: 1258, column: 41, scope: !1576)
!1585 = !DILocation(line: 1258, column: 40, scope: !1576)
!1586 = !DILocation(line: 1258, column: 56, scope: !1576)
!1587 = !DILocation(line: 1258, column: 54, scope: !1576)
!1588 = !DILocation(line: 1258, column: 27, scope: !1576)
!1589 = !DILocation(line: 1258, column: 70, scope: !1576)
!1590 = !DILocation(line: 1258, column: 14, scope: !1576)
!1591 = !DILocation(line: 1259, column: 17, scope: !1576)
!1592 = !DILocation(line: 1259, column: 28, scope: !1576)
!1593 = !DILocation(line: 1259, column: 26, scope: !1576)
!1594 = !DILocation(line: 1259, column: 44, scope: !1576)
!1595 = !DILocation(line: 1259, column: 56, scope: !1576)
!1596 = !DILocation(line: 1259, column: 54, scope: !1576)
!1597 = !DILocation(line: 1259, column: 41, scope: !1576)
!1598 = !DILocation(line: 1259, column: 14, scope: !1576)
!1599 = !DILocation(line: 1260, column: 12, scope: !1576)
!1600 = !DILocation(line: 1260, column: 5, scope: !1576)
!1601 = !DILocation(line: 1265, column: 1, scope: !1505)
!1602 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1282, type: !1603, scopeLine: 1283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1603 = !DISubroutineType(types: !1604)
!1604 = !{!685, !685, !685}
!1605 = !DILocalVariable(name: "numerator", arg: 1, scope: !1602, file: !69, line: 1282, type: !685)
!1606 = !DILocation(line: 1282, column: 25, scope: !1602)
!1607 = !DILocalVariable(name: "denominator", arg: 2, scope: !1602, file: !69, line: 1282, type: !685)
!1608 = !DILocation(line: 1282, column: 40, scope: !1602)
!1609 = !DILocalVariable(name: "u32Temp1", scope: !1602, file: !69, line: 1285, type: !685)
!1610 = !DILocation(line: 1285, column: 6, scope: !1602)
!1611 = !DILocalVariable(name: "u32Temp2", scope: !1602, file: !69, line: 1285, type: !685)
!1612 = !DILocation(line: 1285, column: 20, scope: !1602)
!1613 = !DILocalVariable(name: "u32Temp3", scope: !1602, file: !69, line: 1285, type: !685)
!1614 = !DILocation(line: 1285, column: 34, scope: !1602)
!1615 = !DILocalVariable(name: "numerator_old", scope: !1602, file: !69, line: 1285, type: !685)
!1616 = !DILocation(line: 1285, column: 48, scope: !1602)
!1617 = !DILocation(line: 1286, column: 5, scope: !1618)
!1618 = distinct !DILexicalBlock(scope: !1602, file: !69, line: 1286, column: 5)
!1619 = !DILocation(line: 1286, column: 16, scope: !1618)
!1620 = !DILocation(line: 1286, column: 5, scope: !1602)
!1621 = !DILocation(line: 1288, column: 3, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1618, file: !69, line: 1287, column: 2)
!1623 = !DILocation(line: 1292, column: 14, scope: !1624)
!1624 = distinct !DILexicalBlock(scope: !1618, file: !69, line: 1291, column: 2)
!1625 = !DILocation(line: 1292, column: 26, scope: !1624)
!1626 = !DILocation(line: 1292, column: 41, scope: !1624)
!1627 = !DILocation(line: 1292, column: 51, scope: !1624)
!1628 = !DILocation(line: 1292, column: 50, scope: !1624)
!1629 = !DILocation(line: 1292, column: 38, scope: !1624)
!1630 = !DILocation(line: 1292, column: 24, scope: !1624)
!1631 = !DILocation(line: 1292, column: 12, scope: !1624)
!1632 = !DILocation(line: 1293, column: 7, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1624, file: !69, line: 1293, column: 6)
!1634 = !DILocation(line: 1293, column: 16, scope: !1633)
!1635 = !DILocation(line: 1293, column: 24, scope: !1633)
!1636 = !DILocation(line: 1293, column: 6, scope: !1624)
!1637 = !DILocation(line: 1295, column: 16, scope: !1638)
!1638 = distinct !DILexicalBlock(scope: !1633, file: !69, line: 1294, column: 3)
!1639 = !DILocation(line: 1295, column: 27, scope: !1638)
!1640 = !DILocation(line: 1295, column: 13, scope: !1638)
!1641 = !DILocation(line: 1296, column: 3, scope: !1638)
!1642 = !DILocation(line: 1299, column: 16, scope: !1643)
!1643 = distinct !DILexicalBlock(scope: !1633, file: !69, line: 1298, column: 3)
!1644 = !DILocation(line: 1299, column: 27, scope: !1643)
!1645 = !DILocation(line: 1299, column: 32, scope: !1643)
!1646 = !DILocation(line: 1299, column: 13, scope: !1643)
!1647 = !DILocation(line: 1302, column: 6, scope: !1648)
!1648 = distinct !DILexicalBlock(scope: !1624, file: !69, line: 1302, column: 6)
!1649 = !DILocation(line: 1302, column: 17, scope: !1648)
!1650 = !DILocation(line: 1302, column: 15, scope: !1648)
!1651 = !DILocation(line: 1302, column: 6, scope: !1624)
!1652 = !DILocation(line: 1304, column: 12, scope: !1653)
!1653 = distinct !DILexicalBlock(scope: !1648, file: !69, line: 1303, column: 3)
!1654 = !DILocation(line: 1304, column: 22, scope: !1653)
!1655 = !DILocation(line: 1304, column: 21, scope: !1653)
!1656 = !DILocation(line: 1304, column: 4, scope: !1653)
!1657 = !DILocation(line: 1308, column: 13, scope: !1658)
!1658 = distinct !DILexicalBlock(scope: !1648, file: !69, line: 1307, column: 3)
!1659 = !DILocation(line: 1308, column: 23, scope: !1658)
!1660 = !DILocation(line: 1308, column: 22, scope: !1658)
!1661 = !DILocation(line: 1308, column: 36, scope: !1658)
!1662 = !DILocation(line: 1308, column: 4, scope: !1658)
!1663 = !DILocation(line: 1313, column: 1, scope: !1602)
!1664 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1330, type: !1665, scopeLine: 1331, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1665 = !DISubroutineType(types: !1666)
!1666 = !{!16, !685, !16}
!1667 = !DILocalVariable(name: "numerator", arg: 1, scope: !1664, file: !69, line: 1330, type: !685)
!1668 = !DILocation(line: 1330, column: 25, scope: !1664)
!1669 = !DILocalVariable(name: "denominator", arg: 2, scope: !1664, file: !69, line: 1330, type: !16)
!1670 = !DILocation(line: 1330, column: 40, scope: !1664)
!1671 = !DILocalVariable(name: "u32Temp1", scope: !1664, file: !69, line: 1332, type: !685)
!1672 = !DILocation(line: 1332, column: 6, scope: !1664)
!1673 = !DILocalVariable(name: "u32Temp2", scope: !1664, file: !69, line: 1332, type: !685)
!1674 = !DILocation(line: 1332, column: 20, scope: !1664)
!1675 = !DILocation(line: 1333, column: 5, scope: !1676)
!1676 = distinct !DILexicalBlock(scope: !1664, file: !69, line: 1333, column: 5)
!1677 = !DILocation(line: 1333, column: 17, scope: !1676)
!1678 = !DILocation(line: 1333, column: 5, scope: !1664)
!1679 = !DILocation(line: 1335, column: 6, scope: !1680)
!1680 = distinct !DILexicalBlock(scope: !1681, file: !69, line: 1335, column: 6)
!1681 = distinct !DILexicalBlock(scope: !1676, file: !69, line: 1334, column: 2)
!1682 = !DILocation(line: 1335, column: 18, scope: !1680)
!1683 = !DILocation(line: 1335, column: 6, scope: !1681)
!1684 = !DILocation(line: 1337, column: 4, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1680, file: !69, line: 1336, column: 3)
!1686 = !DILocation(line: 1341, column: 19, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1680, file: !69, line: 1340, column: 3)
!1688 = !DILocation(line: 1341, column: 18, scope: !1687)
!1689 = !DILocation(line: 1341, column: 16, scope: !1687)
!1690 = !DILocation(line: 1342, column: 16, scope: !1687)
!1691 = !DILocation(line: 1342, column: 30, scope: !1687)
!1692 = !DILocation(line: 1342, column: 40, scope: !1687)
!1693 = !DILocation(line: 1342, column: 39, scope: !1687)
!1694 = !DILocation(line: 1342, column: 55, scope: !1687)
!1695 = !DILocation(line: 1342, column: 53, scope: !1687)
!1696 = !DILocation(line: 1342, column: 26, scope: !1687)
!1697 = !DILocation(line: 1342, column: 69, scope: !1687)
!1698 = !DILocation(line: 1342, column: 13, scope: !1687)
!1699 = !DILocation(line: 1343, column: 16, scope: !1687)
!1700 = !DILocation(line: 1343, column: 25, scope: !1687)
!1701 = !DILocation(line: 1343, column: 24, scope: !1687)
!1702 = !DILocation(line: 1343, column: 41, scope: !1687)
!1703 = !DILocation(line: 1343, column: 51, scope: !1687)
!1704 = !DILocation(line: 1343, column: 50, scope: !1687)
!1705 = !DILocation(line: 1343, column: 38, scope: !1687)
!1706 = !DILocation(line: 1343, column: 13, scope: !1687)
!1707 = !DILocation(line: 1344, column: 7, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1687, file: !69, line: 1344, column: 7)
!1709 = !DILocation(line: 1344, column: 16, scope: !1708)
!1710 = !DILocation(line: 1344, column: 7, scope: !1687)
!1711 = !DILocation(line: 1346, column: 13, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1708, file: !69, line: 1345, column: 4)
!1713 = !DILocation(line: 1346, column: 12, scope: !1712)
!1714 = !DILocation(line: 1346, column: 5, scope: !1712)
!1715 = !DILocation(line: 1350, column: 5, scope: !1716)
!1716 = distinct !DILexicalBlock(scope: !1708, file: !69, line: 1349, column: 4)
!1717 = !DILocation(line: 1356, column: 15, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1676, file: !69, line: 1355, column: 2)
!1719 = !DILocation(line: 1356, column: 29, scope: !1718)
!1720 = !DILocation(line: 1356, column: 39, scope: !1718)
!1721 = !DILocation(line: 1356, column: 38, scope: !1718)
!1722 = !DILocation(line: 1356, column: 54, scope: !1718)
!1723 = !DILocation(line: 1356, column: 52, scope: !1718)
!1724 = !DILocation(line: 1356, column: 25, scope: !1718)
!1725 = !DILocation(line: 1356, column: 68, scope: !1718)
!1726 = !DILocation(line: 1356, column: 12, scope: !1718)
!1727 = !DILocation(line: 1357, column: 15, scope: !1718)
!1728 = !DILocation(line: 1357, column: 24, scope: !1718)
!1729 = !DILocation(line: 1357, column: 23, scope: !1718)
!1730 = !DILocation(line: 1357, column: 40, scope: !1718)
!1731 = !DILocation(line: 1357, column: 50, scope: !1718)
!1732 = !DILocation(line: 1357, column: 49, scope: !1718)
!1733 = !DILocation(line: 1357, column: 37, scope: !1718)
!1734 = !DILocation(line: 1357, column: 12, scope: !1718)
!1735 = !DILocation(line: 1358, column: 6, scope: !1736)
!1736 = distinct !DILexicalBlock(scope: !1718, file: !69, line: 1358, column: 6)
!1737 = !DILocation(line: 1358, column: 15, scope: !1736)
!1738 = !DILocation(line: 1358, column: 6, scope: !1718)
!1739 = !DILocation(line: 1360, column: 11, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1736, file: !69, line: 1359, column: 3)
!1741 = !DILocation(line: 1360, column: 4, scope: !1740)
!1742 = !DILocation(line: 1364, column: 4, scope: !1743)
!1743 = distinct !DILexicalBlock(scope: !1736, file: !69, line: 1363, column: 3)
!1744 = !DILocation(line: 1367, column: 1, scope: !1664)
!1745 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1385, type: !1746, scopeLine: 1386, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1746 = !DISubroutineType(types: !1747)
!1747 = !{!16, !16, !685}
!1748 = !DILocalVariable(name: "numerator", arg: 1, scope: !1745, file: !69, line: 1385, type: !16)
!1749 = !DILocation(line: 1385, column: 25, scope: !1745)
!1750 = !DILocalVariable(name: "denominator", arg: 2, scope: !1745, file: !69, line: 1385, type: !685)
!1751 = !DILocation(line: 1385, column: 40, scope: !1745)
!1752 = !DILocalVariable(name: "s32Temp1", scope: !1745, file: !69, line: 1387, type: !16)
!1753 = !DILocation(line: 1387, column: 6, scope: !1745)
!1754 = !DILocalVariable(name: "s32Temp2", scope: !1745, file: !69, line: 1387, type: !16)
!1755 = !DILocation(line: 1387, column: 20, scope: !1745)
!1756 = !DILocalVariable(name: "u32Temp0", scope: !1745, file: !69, line: 1388, type: !685)
!1757 = !DILocation(line: 1388, column: 6, scope: !1745)
!1758 = !DILocalVariable(name: "u32Temp1", scope: !1745, file: !69, line: 1388, type: !685)
!1759 = !DILocation(line: 1388, column: 20, scope: !1745)
!1760 = !DILocalVariable(name: "u32Temp2", scope: !1745, file: !69, line: 1388, type: !685)
!1761 = !DILocation(line: 1388, column: 34, scope: !1745)
!1762 = !DILocation(line: 1389, column: 5, scope: !1763)
!1763 = distinct !DILexicalBlock(scope: !1745, file: !69, line: 1389, column: 5)
!1764 = !DILocation(line: 1389, column: 17, scope: !1763)
!1765 = !DILocation(line: 1389, column: 5, scope: !1745)
!1766 = !DILocation(line: 1391, column: 6, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1768, file: !69, line: 1391, column: 6)
!1768 = distinct !DILexicalBlock(scope: !1763, file: !69, line: 1390, column: 2)
!1769 = !DILocation(line: 1391, column: 16, scope: !1767)
!1770 = !DILocation(line: 1391, column: 6, scope: !1768)
!1771 = !DILocation(line: 1393, column: 4, scope: !1772)
!1772 = distinct !DILexicalBlock(scope: !1767, file: !69, line: 1392, column: 3)
!1773 = !DILocation(line: 1397, column: 4, scope: !1774)
!1774 = distinct !DILexicalBlock(scope: !1767, file: !69, line: 1396, column: 3)
!1775 = !DILocation(line: 1402, column: 6, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1777, file: !69, line: 1402, column: 6)
!1777 = distinct !DILexicalBlock(scope: !1763, file: !69, line: 1401, column: 2)
!1778 = !DILocation(line: 1402, column: 16, scope: !1776)
!1779 = !DILocation(line: 1402, column: 6, scope: !1777)
!1780 = !DILocation(line: 1404, column: 16, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1776, file: !69, line: 1403, column: 3)
!1782 = !DILocation(line: 1404, column: 15, scope: !1781)
!1783 = !DILocation(line: 1404, column: 13, scope: !1781)
!1784 = !DILocation(line: 1405, column: 16, scope: !1781)
!1785 = !DILocation(line: 1405, column: 25, scope: !1781)
!1786 = !DILocation(line: 1405, column: 24, scope: !1781)
!1787 = !DILocation(line: 1405, column: 13, scope: !1781)
!1788 = !DILocation(line: 1406, column: 15, scope: !1781)
!1789 = !DILocation(line: 1406, column: 28, scope: !1781)
!1790 = !DILocation(line: 1406, column: 37, scope: !1781)
!1791 = !DILocation(line: 1406, column: 36, scope: !1781)
!1792 = !DILocation(line: 1406, column: 52, scope: !1781)
!1793 = !DILocation(line: 1406, column: 50, scope: !1781)
!1794 = !DILocation(line: 1406, column: 24, scope: !1781)
!1795 = !DILocation(line: 1406, column: 13, scope: !1781)
!1796 = !DILocation(line: 1408, column: 8, scope: !1797)
!1797 = distinct !DILexicalBlock(scope: !1781, file: !69, line: 1408, column: 7)
!1798 = !DILocation(line: 1408, column: 20, scope: !1797)
!1799 = !DILocation(line: 1408, column: 27, scope: !1797)
!1800 = !DILocation(line: 1408, column: 7, scope: !1781)
!1801 = !DILocation(line: 1410, column: 20, scope: !1802)
!1802 = distinct !DILexicalBlock(scope: !1797, file: !69, line: 1409, column: 4)
!1803 = !DILocation(line: 1410, column: 32, scope: !1802)
!1804 = !DILocation(line: 1410, column: 17, scope: !1802)
!1805 = !DILocation(line: 1411, column: 4, scope: !1802)
!1806 = !DILocation(line: 1414, column: 20, scope: !1807)
!1807 = distinct !DILexicalBlock(scope: !1797, file: !69, line: 1413, column: 4)
!1808 = !DILocation(line: 1414, column: 32, scope: !1807)
!1809 = !DILocation(line: 1414, column: 38, scope: !1807)
!1810 = !DILocation(line: 1414, column: 17, scope: !1807)
!1811 = !DILocation(line: 1418, column: 7, scope: !1812)
!1812 = distinct !DILexicalBlock(scope: !1781, file: !69, line: 1418, column: 7)
!1813 = !DILocation(line: 1418, column: 18, scope: !1812)
!1814 = !DILocation(line: 1418, column: 16, scope: !1812)
!1815 = !DILocation(line: 1418, column: 7, scope: !1781)
!1816 = !DILocation(line: 1420, column: 14, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1812, file: !69, line: 1419, column: 4)
!1818 = !DILocation(line: 1420, column: 13, scope: !1817)
!1819 = !DILocation(line: 1420, column: 23, scope: !1817)
!1820 = !DILocation(line: 1420, column: 5, scope: !1817)
!1821 = !DILocation(line: 1424, column: 14, scope: !1822)
!1822 = distinct !DILexicalBlock(scope: !1812, file: !69, line: 1423, column: 4)
!1823 = !DILocation(line: 1424, column: 23, scope: !1822)
!1824 = !DILocation(line: 1424, column: 12, scope: !1822)
!1825 = !DILocation(line: 1424, column: 27, scope: !1822)
!1826 = !DILocation(line: 1424, column: 5, scope: !1822)
!1827 = !DILocation(line: 1431, column: 16, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1776, file: !69, line: 1430, column: 3)
!1829 = !DILocation(line: 1431, column: 30, scope: !1828)
!1830 = !DILocation(line: 1431, column: 40, scope: !1828)
!1831 = !DILocation(line: 1431, column: 39, scope: !1828)
!1832 = !DILocation(line: 1431, column: 55, scope: !1828)
!1833 = !DILocation(line: 1431, column: 53, scope: !1828)
!1834 = !DILocation(line: 1431, column: 26, scope: !1828)
!1835 = !DILocation(line: 1431, column: 69, scope: !1828)
!1836 = !DILocation(line: 1431, column: 13, scope: !1828)
!1837 = !DILocation(line: 1432, column: 16, scope: !1828)
!1838 = !DILocation(line: 1432, column: 26, scope: !1828)
!1839 = !DILocation(line: 1432, column: 25, scope: !1828)
!1840 = !DILocation(line: 1432, column: 42, scope: !1828)
!1841 = !DILocation(line: 1432, column: 51, scope: !1828)
!1842 = !DILocation(line: 1432, column: 50, scope: !1828)
!1843 = !DILocation(line: 1432, column: 39, scope: !1828)
!1844 = !DILocation(line: 1432, column: 13, scope: !1828)
!1845 = !DILocation(line: 1433, column: 11, scope: !1828)
!1846 = !DILocation(line: 1433, column: 4, scope: !1828)
!1847 = !DILocation(line: 1436, column: 1, scope: !1745)
!1848 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1453, type: !1849, scopeLine: 1454, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1849 = !DISubroutineType(types: !1850)
!1850 = !{!16, !16, !16}
!1851 = !DILocalVariable(name: "numerator", arg: 1, scope: !1848, file: !69, line: 1453, type: !16)
!1852 = !DILocation(line: 1453, column: 25, scope: !1848)
!1853 = !DILocalVariable(name: "denominator", arg: 2, scope: !1848, file: !69, line: 1453, type: !16)
!1854 = !DILocation(line: 1453, column: 40, scope: !1848)
!1855 = !DILocalVariable(name: "s32Temp1", scope: !1848, file: !69, line: 1455, type: !16)
!1856 = !DILocation(line: 1455, column: 6, scope: !1848)
!1857 = !DILocalVariable(name: "s32Temp2", scope: !1848, file: !69, line: 1455, type: !16)
!1858 = !DILocation(line: 1455, column: 20, scope: !1848)
!1859 = !DILocalVariable(name: "denominator_prime", scope: !1848, file: !69, line: 1456, type: !685)
!1860 = !DILocation(line: 1456, column: 6, scope: !1848)
!1861 = !DILocalVariable(name: "u32Temp1", scope: !1848, file: !69, line: 1456, type: !685)
!1862 = !DILocation(line: 1456, column: 29, scope: !1848)
!1863 = !DILocalVariable(name: "u32Temp2", scope: !1848, file: !69, line: 1456, type: !685)
!1864 = !DILocation(line: 1456, column: 43, scope: !1848)
!1865 = !DILocalVariable(name: "u32numerator", scope: !1848, file: !69, line: 1457, type: !685)
!1866 = !DILocation(line: 1457, column: 6, scope: !1848)
!1867 = !DILocalVariable(name: "u32denominator", scope: !1848, file: !69, line: 1457, type: !685)
!1868 = !DILocation(line: 1457, column: 23, scope: !1848)
!1869 = !DILocation(line: 1458, column: 5, scope: !1870)
!1870 = distinct !DILexicalBlock(scope: !1848, file: !69, line: 1458, column: 5)
!1871 = !DILocation(line: 1458, column: 15, scope: !1870)
!1872 = !DILocation(line: 1458, column: 5, scope: !1848)
!1873 = !DILocation(line: 1460, column: 6, scope: !1874)
!1874 = distinct !DILexicalBlock(scope: !1875, file: !69, line: 1460, column: 6)
!1875 = distinct !DILexicalBlock(scope: !1870, file: !69, line: 1459, column: 2)
!1876 = !DILocation(line: 1460, column: 18, scope: !1874)
!1877 = !DILocation(line: 1460, column: 6, scope: !1875)
!1878 = !DILocation(line: 1462, column: 7, scope: !1879)
!1879 = distinct !DILexicalBlock(scope: !1880, file: !69, line: 1462, column: 7)
!1880 = distinct !DILexicalBlock(scope: !1874, file: !69, line: 1461, column: 3)
!1881 = !DILocation(line: 1462, column: 19, scope: !1879)
!1882 = !DILocation(line: 1462, column: 7, scope: !1880)
!1883 = !DILocation(line: 1464, column: 5, scope: !1884)
!1884 = distinct !DILexicalBlock(scope: !1879, file: !69, line: 1463, column: 4)
!1885 = !DILocation(line: 1468, column: 21, scope: !1886)
!1886 = distinct !DILexicalBlock(scope: !1879, file: !69, line: 1467, column: 4)
!1887 = !DILocation(line: 1468, column: 20, scope: !1886)
!1888 = !DILocation(line: 1468, column: 18, scope: !1886)
!1889 = !DILocation(line: 1469, column: 23, scope: !1886)
!1890 = !DILocation(line: 1469, column: 22, scope: !1886)
!1891 = !DILocation(line: 1469, column: 20, scope: !1886)
!1892 = !DILocation(line: 1470, column: 16, scope: !1886)
!1893 = !DILocation(line: 1470, column: 33, scope: !1886)
!1894 = !DILocation(line: 1470, column: 46, scope: !1886)
!1895 = !DILocation(line: 1470, column: 45, scope: !1886)
!1896 = !DILocation(line: 1470, column: 64, scope: !1886)
!1897 = !DILocation(line: 1470, column: 62, scope: !1886)
!1898 = !DILocation(line: 1470, column: 29, scope: !1886)
!1899 = !DILocation(line: 1470, column: 81, scope: !1886)
!1900 = !DILocation(line: 1470, column: 14, scope: !1886)
!1901 = !DILocation(line: 1471, column: 17, scope: !1886)
!1902 = !DILocation(line: 1471, column: 30, scope: !1886)
!1903 = !DILocation(line: 1471, column: 29, scope: !1886)
!1904 = !DILocation(line: 1471, column: 49, scope: !1886)
!1905 = !DILocation(line: 1471, column: 58, scope: !1886)
!1906 = !DILocation(line: 1471, column: 57, scope: !1886)
!1907 = !DILocation(line: 1471, column: 46, scope: !1886)
!1908 = !DILocation(line: 1471, column: 14, scope: !1886)
!1909 = !DILocation(line: 1472, column: 8, scope: !1910)
!1910 = distinct !DILexicalBlock(scope: !1886, file: !69, line: 1472, column: 8)
!1911 = !DILocation(line: 1472, column: 17, scope: !1910)
!1912 = !DILocation(line: 1472, column: 8, scope: !1886)
!1913 = !DILocation(line: 1474, column: 13, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1910, file: !69, line: 1473, column: 5)
!1915 = !DILocation(line: 1474, column: 6, scope: !1914)
!1916 = !DILocation(line: 1478, column: 6, scope: !1917)
!1917 = distinct !DILexicalBlock(scope: !1910, file: !69, line: 1477, column: 5)
!1918 = !DILocation(line: 1484, column: 20, scope: !1919)
!1919 = distinct !DILexicalBlock(scope: !1874, file: !69, line: 1483, column: 3)
!1920 = !DILocation(line: 1484, column: 19, scope: !1919)
!1921 = !DILocation(line: 1484, column: 29, scope: !1919)
!1922 = !DILocation(line: 1484, column: 17, scope: !1919)
!1923 = !DILocation(line: 1485, column: 16, scope: !1919)
!1924 = !DILocation(line: 1485, column: 33, scope: !1919)
!1925 = !DILocation(line: 1485, column: 46, scope: !1919)
!1926 = !DILocation(line: 1485, column: 45, scope: !1919)
!1927 = !DILocation(line: 1485, column: 61, scope: !1919)
!1928 = !DILocation(line: 1485, column: 59, scope: !1919)
!1929 = !DILocation(line: 1485, column: 29, scope: !1919)
!1930 = !DILocation(line: 1485, column: 75, scope: !1919)
!1931 = !DILocation(line: 1485, column: 13, scope: !1919)
!1932 = !DILocation(line: 1486, column: 16, scope: !1919)
!1933 = !DILocation(line: 1486, column: 29, scope: !1919)
!1934 = !DILocation(line: 1486, column: 28, scope: !1919)
!1935 = !DILocation(line: 1486, column: 45, scope: !1919)
!1936 = !DILocation(line: 1486, column: 54, scope: !1919)
!1937 = !DILocation(line: 1486, column: 53, scope: !1919)
!1938 = !DILocation(line: 1486, column: 42, scope: !1919)
!1939 = !DILocation(line: 1486, column: 13, scope: !1919)
!1940 = !DILocation(line: 1487, column: 13, scope: !1919)
!1941 = !DILocation(line: 1487, column: 12, scope: !1919)
!1942 = !DILocation(line: 1487, column: 22, scope: !1919)
!1943 = !DILocation(line: 1487, column: 4, scope: !1919)
!1944 = !DILocation(line: 1492, column: 6, scope: !1945)
!1945 = distinct !DILexicalBlock(scope: !1946, file: !69, line: 1492, column: 6)
!1946 = distinct !DILexicalBlock(scope: !1870, file: !69, line: 1491, column: 2)
!1947 = !DILocation(line: 1492, column: 18, scope: !1945)
!1948 = !DILocation(line: 1492, column: 6, scope: !1946)
!1949 = !DILocation(line: 1494, column: 7, scope: !1950)
!1950 = distinct !DILexicalBlock(scope: !1951, file: !69, line: 1494, column: 7)
!1951 = distinct !DILexicalBlock(scope: !1945, file: !69, line: 1493, column: 3)
!1952 = !DILocation(line: 1494, column: 19, scope: !1950)
!1953 = !DILocation(line: 1494, column: 7, scope: !1951)
!1954 = !DILocation(line: 1496, column: 5, scope: !1955)
!1955 = distinct !DILexicalBlock(scope: !1950, file: !69, line: 1495, column: 4)
!1956 = !DILocation(line: 1500, column: 23, scope: !1957)
!1957 = distinct !DILexicalBlock(scope: !1950, file: !69, line: 1499, column: 4)
!1958 = !DILocation(line: 1500, column: 22, scope: !1957)
!1959 = !DILocation(line: 1500, column: 35, scope: !1957)
!1960 = !DILocation(line: 1500, column: 20, scope: !1957)
!1961 = !DILocation(line: 1501, column: 17, scope: !1957)
!1962 = !DILocation(line: 1501, column: 31, scope: !1957)
!1963 = !DILocation(line: 1501, column: 41, scope: !1957)
!1964 = !DILocation(line: 1501, column: 40, scope: !1957)
!1965 = !DILocation(line: 1501, column: 59, scope: !1957)
!1966 = !DILocation(line: 1501, column: 57, scope: !1957)
!1967 = !DILocation(line: 1501, column: 27, scope: !1957)
!1968 = !DILocation(line: 1501, column: 76, scope: !1957)
!1969 = !DILocation(line: 1501, column: 14, scope: !1957)
!1970 = !DILocation(line: 1502, column: 17, scope: !1957)
!1971 = !DILocation(line: 1502, column: 27, scope: !1957)
!1972 = !DILocation(line: 1502, column: 26, scope: !1957)
!1973 = !DILocation(line: 1502, column: 46, scope: !1957)
!1974 = !DILocation(line: 1502, column: 55, scope: !1957)
!1975 = !DILocation(line: 1502, column: 54, scope: !1957)
!1976 = !DILocation(line: 1502, column: 43, scope: !1957)
!1977 = !DILocation(line: 1502, column: 14, scope: !1957)
!1978 = !DILocation(line: 1503, column: 14, scope: !1957)
!1979 = !DILocation(line: 1503, column: 13, scope: !1957)
!1980 = !DILocation(line: 1503, column: 23, scope: !1957)
!1981 = !DILocation(line: 1503, column: 5, scope: !1957)
!1982 = !DILocation(line: 1508, column: 16, scope: !1983)
!1983 = distinct !DILexicalBlock(scope: !1945, file: !69, line: 1507, column: 3)
!1984 = !DILocation(line: 1508, column: 30, scope: !1983)
!1985 = !DILocation(line: 1508, column: 40, scope: !1983)
!1986 = !DILocation(line: 1508, column: 39, scope: !1983)
!1987 = !DILocation(line: 1508, column: 55, scope: !1983)
!1988 = !DILocation(line: 1508, column: 53, scope: !1983)
!1989 = !DILocation(line: 1508, column: 26, scope: !1983)
!1990 = !DILocation(line: 1508, column: 69, scope: !1983)
!1991 = !DILocation(line: 1508, column: 13, scope: !1983)
!1992 = !DILocation(line: 1509, column: 16, scope: !1983)
!1993 = !DILocation(line: 1509, column: 26, scope: !1983)
!1994 = !DILocation(line: 1509, column: 25, scope: !1983)
!1995 = !DILocation(line: 1509, column: 42, scope: !1983)
!1996 = !DILocation(line: 1509, column: 51, scope: !1983)
!1997 = !DILocation(line: 1509, column: 50, scope: !1983)
!1998 = !DILocation(line: 1509, column: 39, scope: !1983)
!1999 = !DILocation(line: 1509, column: 13, scope: !1983)
!2000 = !DILocation(line: 1510, column: 11, scope: !1983)
!2001 = !DILocation(line: 1510, column: 4, scope: !1983)
!2002 = !DILocation(line: 1513, column: 1, scope: !1848)
!2003 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1531, type: !2004, scopeLine: 1532, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2004 = !DISubroutineType(types: !2005)
!2005 = !{!6, !16, !685}
!2006 = !DILocalVariable(name: "numerator", arg: 1, scope: !2003, file: !69, line: 1531, type: !16)
!2007 = !DILocation(line: 1531, column: 25, scope: !2003)
!2008 = !DILocalVariable(name: "denominator", arg: 2, scope: !2003, file: !69, line: 1531, type: !685)
!2009 = !DILocation(line: 1531, column: 40, scope: !2003)
!2010 = !DILocalVariable(name: "numerator_prime", scope: !2003, file: !69, line: 1534, type: !685)
!2011 = !DILocation(line: 1534, column: 6, scope: !2003)
!2012 = !DILocalVariable(name: "u32Temp1", scope: !2003, file: !69, line: 1534, type: !685)
!2013 = !DILocation(line: 1534, column: 27, scope: !2003)
!2014 = !DILocalVariable(name: "u32Temp2", scope: !2003, file: !69, line: 1534, type: !685)
!2015 = !DILocation(line: 1534, column: 41, scope: !2003)
!2016 = !DILocalVariable(name: "u32Temp3", scope: !2003, file: !69, line: 1534, type: !685)
!2017 = !DILocation(line: 1534, column: 55, scope: !2003)
!2018 = !DILocalVariable(name: "s32Temp1", scope: !2003, file: !69, line: 1535, type: !16)
!2019 = !DILocation(line: 1535, column: 6, scope: !2003)
!2020 = !DILocalVariable(name: "s32Temp2", scope: !2003, file: !69, line: 1535, type: !16)
!2021 = !DILocation(line: 1535, column: 20, scope: !2003)
!2022 = !DILocalVariable(name: "s32Temp3", scope: !2003, file: !69, line: 1535, type: !16)
!2023 = !DILocation(line: 1535, column: 34, scope: !2003)
!2024 = !DILocation(line: 1536, column: 5, scope: !2025)
!2025 = distinct !DILexicalBlock(scope: !2003, file: !69, line: 1536, column: 5)
!2026 = !DILocation(line: 1536, column: 17, scope: !2025)
!2027 = !DILocation(line: 1536, column: 5, scope: !2003)
!2028 = !DILocation(line: 1538, column: 6, scope: !2029)
!2029 = distinct !DILexicalBlock(scope: !2030, file: !69, line: 1538, column: 6)
!2030 = distinct !DILexicalBlock(scope: !2025, file: !69, line: 1537, column: 2)
!2031 = !DILocation(line: 1538, column: 15, scope: !2029)
!2032 = !DILocation(line: 1538, column: 6, scope: !2030)
!2033 = !DILocation(line: 1540, column: 4, scope: !2034)
!2034 = distinct !DILexicalBlock(scope: !2029, file: !69, line: 1539, column: 3)
!2035 = !DILocation(line: 1544, column: 4, scope: !2036)
!2036 = distinct !DILexicalBlock(scope: !2029, file: !69, line: 1543, column: 3)
!2037 = !DILocation(line: 1549, column: 6, scope: !2038)
!2038 = distinct !DILexicalBlock(scope: !2039, file: !69, line: 1549, column: 6)
!2039 = distinct !DILexicalBlock(scope: !2025, file: !69, line: 1548, column: 2)
!2040 = !DILocation(line: 1549, column: 16, scope: !2038)
!2041 = !DILocation(line: 1549, column: 6, scope: !2039)
!2042 = !DILocation(line: 1551, column: 23, scope: !2043)
!2043 = distinct !DILexicalBlock(scope: !2038, file: !69, line: 1550, column: 3)
!2044 = !DILocation(line: 1551, column: 22, scope: !2043)
!2045 = !DILocation(line: 1551, column: 20, scope: !2043)
!2046 = !DILocation(line: 1552, column: 16, scope: !2043)
!2047 = !DILocation(line: 1552, column: 32, scope: !2043)
!2048 = !DILocation(line: 1552, column: 31, scope: !2043)
!2049 = !DILocation(line: 1552, column: 13, scope: !2043)
!2050 = !DILocation(line: 1553, column: 15, scope: !2043)
!2051 = !DILocation(line: 1553, column: 34, scope: !2043)
!2052 = !DILocation(line: 1553, column: 45, scope: !2043)
!2053 = !DILocation(line: 1553, column: 43, scope: !2043)
!2054 = !DILocation(line: 1553, column: 31, scope: !2043)
!2055 = !DILocation(line: 1553, column: 13, scope: !2043)
!2056 = !DILocation(line: 1555, column: 8, scope: !2057)
!2057 = distinct !DILexicalBlock(scope: !2043, file: !69, line: 1555, column: 7)
!2058 = !DILocation(line: 1555, column: 20, scope: !2057)
!2059 = !DILocation(line: 1555, column: 27, scope: !2057)
!2060 = !DILocation(line: 1555, column: 7, scope: !2043)
!2061 = !DILocation(line: 1557, column: 19, scope: !2062)
!2062 = distinct !DILexicalBlock(scope: !2057, file: !69, line: 1556, column: 4)
!2063 = !DILocation(line: 1557, column: 31, scope: !2062)
!2064 = !DILocation(line: 1557, column: 17, scope: !2062)
!2065 = !DILocation(line: 1558, column: 4, scope: !2062)
!2066 = !DILocation(line: 1561, column: 20, scope: !2067)
!2067 = distinct !DILexicalBlock(scope: !2057, file: !69, line: 1560, column: 4)
!2068 = !DILocation(line: 1561, column: 32, scope: !2067)
!2069 = !DILocation(line: 1561, column: 38, scope: !2067)
!2070 = !DILocation(line: 1561, column: 17, scope: !2067)
!2071 = !DILocation(line: 1564, column: 7, scope: !2072)
!2072 = distinct !DILexicalBlock(scope: !2043, file: !69, line: 1564, column: 7)
!2073 = !DILocation(line: 1564, column: 18, scope: !2072)
!2074 = !DILocation(line: 1564, column: 16, scope: !2072)
!2075 = !DILocation(line: 1564, column: 7, scope: !2043)
!2076 = !DILocation(line: 1566, column: 18, scope: !2077)
!2077 = distinct !DILexicalBlock(scope: !2072, file: !69, line: 1565, column: 4)
!2078 = !DILocation(line: 1566, column: 16, scope: !2077)
!2079 = !DILocation(line: 1566, column: 28, scope: !2077)
!2080 = !DILocation(line: 1566, column: 14, scope: !2077)
!2081 = !DILocation(line: 1567, column: 4, scope: !2077)
!2082 = !DILocation(line: 1570, column: 18, scope: !2083)
!2083 = distinct !DILexicalBlock(scope: !2072, file: !69, line: 1569, column: 4)
!2084 = !DILocation(line: 1570, column: 26, scope: !2083)
!2085 = !DILocation(line: 1570, column: 16, scope: !2083)
!2086 = !DILocation(line: 1570, column: 30, scope: !2083)
!2087 = !DILocation(line: 1570, column: 14, scope: !2083)
!2088 = !DILocation(line: 1572, column: 8, scope: !2089)
!2089 = distinct !DILexicalBlock(scope: !2043, file: !69, line: 1572, column: 7)
!2090 = !DILocation(line: 1572, column: 18, scope: !2089)
!2091 = !DILocation(line: 1572, column: 7, scope: !2043)
!2092 = !DILocation(line: 1574, column: 18, scope: !2093)
!2093 = distinct !DILexicalBlock(scope: !2089, file: !69, line: 1573, column: 4)
!2094 = !DILocation(line: 1574, column: 12, scope: !2093)
!2095 = !DILocation(line: 1574, column: 5, scope: !2093)
!2096 = !DILocation(line: 1578, column: 5, scope: !2097)
!2097 = distinct !DILexicalBlock(scope: !2089, file: !69, line: 1577, column: 4)
!2098 = !DILocation(line: 1583, column: 16, scope: !2099)
!2099 = distinct !DILexicalBlock(scope: !2038, file: !69, line: 1582, column: 3)
!2100 = !DILocation(line: 1583, column: 26, scope: !2099)
!2101 = !DILocation(line: 1583, column: 25, scope: !2099)
!2102 = !DILocation(line: 1583, column: 41, scope: !2099)
!2103 = !DILocation(line: 1583, column: 39, scope: !2099)
!2104 = !DILocation(line: 1583, column: 13, scope: !2099)
!2105 = !DILocation(line: 1584, column: 16, scope: !2099)
!2106 = !DILocation(line: 1584, column: 30, scope: !2099)
!2107 = !DILocation(line: 1584, column: 40, scope: !2099)
!2108 = !DILocation(line: 1584, column: 39, scope: !2099)
!2109 = !DILocation(line: 1584, column: 55, scope: !2099)
!2110 = !DILocation(line: 1584, column: 53, scope: !2099)
!2111 = !DILocation(line: 1584, column: 26, scope: !2099)
!2112 = !DILocation(line: 1584, column: 68, scope: !2099)
!2113 = !DILocation(line: 1584, column: 13, scope: !2099)
!2114 = !DILocation(line: 1585, column: 16, scope: !2099)
!2115 = !DILocation(line: 1585, column: 25, scope: !2099)
!2116 = !DILocation(line: 1585, column: 24, scope: !2099)
!2117 = !DILocation(line: 1585, column: 41, scope: !2099)
!2118 = !DILocation(line: 1585, column: 51, scope: !2099)
!2119 = !DILocation(line: 1585, column: 50, scope: !2099)
!2120 = !DILocation(line: 1585, column: 38, scope: !2099)
!2121 = !DILocation(line: 1585, column: 13, scope: !2099)
!2122 = !DILocation(line: 1586, column: 7, scope: !2123)
!2123 = distinct !DILexicalBlock(scope: !2099, file: !69, line: 1586, column: 7)
!2124 = !DILocation(line: 1586, column: 16, scope: !2123)
!2125 = !DILocation(line: 1586, column: 7, scope: !2099)
!2126 = !DILocation(line: 1588, column: 17, scope: !2127)
!2127 = distinct !DILexicalBlock(scope: !2123, file: !69, line: 1587, column: 4)
!2128 = !DILocation(line: 1588, column: 12, scope: !2127)
!2129 = !DILocation(line: 1588, column: 5, scope: !2127)
!2130 = !DILocation(line: 1592, column: 5, scope: !2131)
!2131 = distinct !DILexicalBlock(scope: !2123, file: !69, line: 1591, column: 4)
!2132 = !DILocation(line: 1596, column: 1, scope: !2003)
!2133 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2134, file: !2134, line: 12, type: !2135, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2138)
!2134 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2135 = !DISubroutineType(types: !2136)
!2136 = !{null, !2137}
!2137 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2138 = !{!2139}
!2139 = !DILocalVariable(name: "z", arg: 1, scope: !2133, file: !2134, line: 12, type: !2137)
!2140 = !DILocation(line: 0, scope: !2133)
!2141 = !DILocation(line: 13, column: 9, scope: !2142)
!2142 = distinct !DILexicalBlock(scope: !2133, file: !2134, line: 13, column: 7)
!2143 = !DILocation(line: 13, column: 7, scope: !2133)
!2144 = !DILocation(line: 14, column: 5, scope: !2142)
!2145 = !DILocation(line: 15, column: 1, scope: !2133)
!2146 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2147, file: !2147, line: 20, type: !2148, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2151)
!2147 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2148 = !DISubroutineType(types: !2149)
!2149 = !{null, !2150, !2150}
!2150 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2151 = !{!2152, !2153}
!2152 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2146, file: !2147, line: 20, type: !2150)
!2153 = !DILocalVariable(name: "shift", arg: 2, scope: !2146, file: !2147, line: 20, type: !2150)
!2154 = !DILocation(line: 0, scope: !2146)
!2155 = !DILocation(line: 21, column: 13, scope: !2156)
!2156 = distinct !DILexicalBlock(scope: !2146, file: !2147, line: 21, column: 7)
!2157 = !DILocation(line: 21, column: 7, scope: !2146)
!2158 = !DILocation(line: 27, column: 5, scope: !2159)
!2159 = distinct !DILexicalBlock(scope: !2156, file: !2147, line: 21, column: 26)
!2160 = !DILocation(line: 29, column: 1, scope: !2146)
