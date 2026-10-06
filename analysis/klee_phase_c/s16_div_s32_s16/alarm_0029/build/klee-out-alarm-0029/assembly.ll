; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0029/build/s16_div_s32_s16_alarm_0029.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [65 x i8] c"KLEE-ALARM-0029: division by zero. assert (s32)denominator != 0;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0029.err\00", align 1
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
  br i1 %cmp6, label %if.then8, label %if.else66, !dbg !216

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
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 304, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !306
  unreachable, !dbg !306

if.end62:                                         ; preds = %if.end55
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !308
  %28 = load i16, i16* %denominator.addr, align 2, !dbg !309
  %conv63 = sext i16 %28 to i32, !dbg !309
  %int_cast_to_i646 = zext i32 %conv63 to i64, !dbg !310
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !310
  %div64 = sdiv i32 %27, %conv63, !dbg !310, !klee.check.div !106
  %conv65 = sext i32 %div64 to i64, !dbg !311
  store volatile i64 %conv65, i64* @klee_alarm_sink_s64, align 8, !dbg !312
  store i16 0, i16* %retval, align 2, !dbg !313
  br label %return, !dbg !313

if.else66:                                        ; preds = %if.else5
  %29 = load i16, i16* %denominator.addr, align 2, !dbg !314
  %conv67 = sext i16 %29 to i32, !dbg !314
  %cmp68 = icmp ne i32 %conv67, -1, !dbg !317
  br i1 %cmp68, label %if.then70, label %if.else90, !dbg !318

if.then70:                                        ; preds = %if.else66
  %30 = load i32, i32* %s32Temp1, align 4, !dbg !319
  %31 = load i32, i32* %s32Temp1, align 4, !dbg !321
  %32 = load i16, i16* %denominator.addr, align 2, !dbg !322
  %conv71 = sext i16 %32 to i32, !dbg !322
  %int_cast_to_i647 = zext i32 %conv71 to i64, !dbg !323
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !323
  %div72 = sdiv i32 %31, %conv71, !dbg !323, !klee.check.div !106
  %33 = load i16, i16* %denominator.addr, align 2, !dbg !324
  %conv73 = sext i16 %33 to i32, !dbg !324
  %mul74 = mul nsw i32 %div72, %conv73, !dbg !325
  %sub75 = sub nsw i32 %30, %mul74, !dbg !326
  %shl76 = shl i32 %sub75, 1, !dbg !327
  store i32 %shl76, i32* %s32Temp2, align 4, !dbg !328
  %34 = load i32, i32* %s32Temp2, align 4, !dbg !329
  %35 = load i16, i16* %denominator.addr, align 2, !dbg !330
  %conv77 = sext i16 %35 to i32, !dbg !330
  %int_cast_to_i648 = zext i32 %conv77 to i64, !dbg !331
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !331
  %div78 = sdiv i32 %34, %conv77, !dbg !331, !klee.check.div !106
  store i32 %div78, i32* %s32Temp1, align 4, !dbg !332
  %36 = load i32, i32* %s32Temp1, align 4, !dbg !333
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !334
  %38 = load i16, i16* %denominator.addr, align 2, !dbg !335
  %conv79 = sext i16 %38 to i32, !dbg !335
  %int_cast_to_i649 = zext i32 %conv79 to i64, !dbg !336
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !336
  %div80 = sdiv i32 %37, %conv79, !dbg !336, !klee.check.div !106
  %add = add nsw i32 %36, %div80, !dbg !337
  store i32 %add, i32* %s32Temp1, align 4, !dbg !338
  %39 = load i32, i32* %s32Temp1, align 4, !dbg !339
  %cmp81 = icmp slt i32 %39, 32767, !dbg !341
  br i1 %cmp81, label %if.then83, label %if.else89, !dbg !342

if.then83:                                        ; preds = %if.then70
  %40 = load i32, i32* %s32Temp1, align 4, !dbg !343
  %cmp84 = icmp sgt i32 %40, -32768, !dbg !346
  br i1 %cmp84, label %if.then86, label %if.else88, !dbg !347

if.then86:                                        ; preds = %if.then83
  %41 = load i32, i32* %s32Temp1, align 4, !dbg !348
  %conv87 = trunc i32 %41 to i16, !dbg !350
  store i16 %conv87, i16* %retval, align 2, !dbg !351
  br label %return, !dbg !351

if.else88:                                        ; preds = %if.then83
  store i16 -32768, i16* %retval, align 2, !dbg !352
  br label %return, !dbg !352

if.else89:                                        ; preds = %if.then70
  store i16 32767, i16* %retval, align 2, !dbg !354
  br label %return, !dbg !354

if.else90:                                        ; preds = %if.else66
  store i16 32767, i16* %retval, align 2, !dbg !356
  br label %return, !dbg !356

return:                                           ; preds = %if.else90, %if.else89, %if.else88, %if.then86, %if.end62, %if.then54, %if.then44, %if.then35, %if.then26, %if.then16, %if.then10, %if.else, %if.then4
  %42 = load i16, i16* %retval, align 2, !dbg !358
  ret i16 %42, !dbg !358
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !359 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !362, metadata !DIExpression()), !dbg !363
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !364
  %cmp = icmp ne i64 %0, 0, !dbg !365
  %conv = zext i1 %cmp to i32, !dbg !365
  ret i32 %conv, !dbg !366
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !367 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !368, metadata !DIExpression()), !dbg !369
  %0 = load i64, i64* %left.addr, align 8, !dbg !370
  %cmp = icmp sge i64 %0, 0, !dbg !371
  %conv = zext i1 %cmp to i32, !dbg !371
  ret i32 %conv, !dbg !372
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !373 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !376, metadata !DIExpression()), !dbg !377
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !378, metadata !DIExpression()), !dbg !379
  %0 = load i32, i32* %count.addr, align 4, !dbg !380
  %cmp = icmp uge i32 %0, 63, !dbg !382
  br i1 %cmp, label %if.then, label %if.end, !dbg !383

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !384
  br label %return, !dbg !384

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !386
  %2 = load i32, i32* %count.addr, align 4, !dbg !387
  %sh_prom = zext i32 %2 to i64, !dbg !388
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !388
  %shl = shl i64 1, %sh_prom, !dbg !388, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !389
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !390
  %conv = zext i1 %cmp1 to i32, !dbg !390
  store i32 %conv, i32* %retval, align 4, !dbg !391
  br label %return, !dbg !391

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !392
  ret i32 %3, !dbg !392
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !393 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !396, metadata !DIExpression()), !dbg !397
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !398, metadata !DIExpression()), !dbg !399
  %0 = load i64, i64* %left.addr, align 8, !dbg !400
  %1 = load i64, i64* %right.addr, align 8, !dbg !401
  %mul = mul nsw i64 %0, %1, !dbg !402
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !403
  %conv = zext i1 %cmp to i32, !dbg !403
  ret i32 %conv, !dbg !404
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !405 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !406, metadata !DIExpression()), !dbg !407
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !408, metadata !DIExpression()), !dbg !409
  %0 = load i64, i64* %left.addr, align 8, !dbg !410
  %1 = load i64, i64* %right.addr, align 8, !dbg !411
  %mul = mul nsw i64 %0, %1, !dbg !412
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !413
  %conv = zext i1 %cmp to i32, !dbg !413
  ret i32 %conv, !dbg !414
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !415 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !418, metadata !DIExpression()), !dbg !419
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !420, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !422, metadata !DIExpression()), !dbg !423
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !424, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !426, metadata !DIExpression()), !dbg !427
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !428
  %conv = zext i16 %0 to i32, !dbg !428
  %and = and i32 %conv, 65535, !dbg !429
  %conv1 = trunc i32 %and to i16, !dbg !428
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !430
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !431
  %conv2 = sext i16 %1 to i32, !dbg !431
  %shl = shl i32 %conv2, 16, !dbg !432
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !433
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !434
  %conv3 = zext i16 %2 to i32, !dbg !434
  %cmp = icmp eq i32 %conv3, 0, !dbg !436
  br i1 %cmp, label %if.then, label %if.else9, !dbg !437

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !438
  %conv5 = sext i16 %3 to i32, !dbg !438
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !441
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !442

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !443
  br label %return, !dbg !443

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !445
  br label %return, !dbg !445

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !447
  %conv10 = sext i16 %4 to i32, !dbg !447
  %shl11 = shl i32 %conv10, 16, !dbg !449
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !450
  %conv12 = sext i16 %5 to i32, !dbg !450
  %shl13 = shl i32 %conv12, 16, !dbg !451
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !452
  %conv14 = zext i16 %6 to i32, !dbg !452
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !453
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !453
  %div = sdiv i32 %shl13, %conv14, !dbg !453, !klee.check.div !106
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !454
  %conv15 = zext i16 %7 to i32, !dbg !454
  %mul = mul nsw i32 %div, %conv15, !dbg !455
  %sub = sub nsw i32 %shl11, %mul, !dbg !456
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !457
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !458
  %shl16 = shl i32 %8, 1, !dbg !459
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !460
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !461
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !462
  %conv17 = zext i16 %10 to i32, !dbg !462
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !463
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !463
  %div18 = sdiv i32 %9, %conv17, !dbg !463, !klee.check.div !106
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !464
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !465
  %conv19 = sext i16 %11 to i32, !dbg !465
  %shl20 = shl i32 %conv19, 16, !dbg !466
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !467
  %conv21 = zext i16 %12 to i32, !dbg !467
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !468
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !468
  %div22 = sdiv i32 %shl20, %conv21, !dbg !468, !klee.check.div !106
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !469
  %add = add nsw i32 %div22, %13, !dbg !470
  store i32 %add, i32* %s32Temp1, align 4, !dbg !471
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !472
  %cmp23 = icmp slt i32 %14, 32767, !dbg !474
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !475

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !476
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !479
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !480

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !481
  %conv29 = trunc i32 %16 to i16, !dbg !483
  store i16 %conv29, i16* %retval, align 2, !dbg !484
  br label %return, !dbg !484

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !485
  br label %return, !dbg !485

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !487
  br label %return, !dbg !487

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !489
  ret i16 %17, !dbg !489
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !490 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !491, metadata !DIExpression()), !dbg !492
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !493, metadata !DIExpression()), !dbg !494
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !495, metadata !DIExpression()), !dbg !496
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !497, metadata !DIExpression()), !dbg !498
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !499
  %conv = zext i16 %0 to i32, !dbg !499
  %and = and i32 %conv, 65535, !dbg !500
  %conv1 = trunc i32 %and to i16, !dbg !499
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !501
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !502
  %conv2 = zext i16 %1 to i32, !dbg !502
  %cmp = icmp eq i32 %conv2, 0, !dbg !504
  br i1 %cmp, label %if.then, label %if.else8, !dbg !505

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !506
  %conv4 = sext i16 %2 to i32, !dbg !506
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !509
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !510

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !511
  br label %return, !dbg !511

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !513
  br label %return, !dbg !513

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !515
  %conv9 = sext i16 %3 to i32, !dbg !515
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !517
  %conv10 = sext i16 %4 to i32, !dbg !517
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !518
  %conv11 = zext i16 %5 to i32, !dbg !518
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !519
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !519
  %div = sdiv i32 %conv10, %conv11, !dbg !519, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !520
  %conv12 = zext i16 %6 to i32, !dbg !520
  %mul = mul nsw i32 %div, %conv12, !dbg !521
  %sub = sub nsw i32 %conv9, %mul, !dbg !522
  %shl = shl i32 %sub, 1, !dbg !523
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !524
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !525
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !526
  %conv13 = zext i16 %8 to i32, !dbg !526
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !527
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !527
  %div14 = sdiv i32 %7, %conv13, !dbg !527, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !528
  %conv15 = sext i16 %9 to i32, !dbg !528
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !529
  %conv16 = zext i16 %10 to i32, !dbg !529
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !530
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !530
  %div17 = sdiv i32 %conv15, %conv16, !dbg !530, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !531
  store i32 %add, i32* %s32Temp1, align 4, !dbg !532
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !533
  %conv18 = trunc i32 %11 to i16, !dbg !533
  store i16 %conv18, i16* %retval, align 2, !dbg !534
  br label %return, !dbg !534

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !535
  ret i16 %12, !dbg !535
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !536 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !539, metadata !DIExpression()), !dbg !540
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !541, metadata !DIExpression()), !dbg !542
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !543, metadata !DIExpression()), !dbg !545
  store i32 0, i32* %u32Temp1, align 4, !dbg !545
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !546, metadata !DIExpression()), !dbg !547
  store i32 0, i32* %u32Temp2, align 4, !dbg !547
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !548, metadata !DIExpression()), !dbg !549
  store i32 0, i32* %u32Temp3, align 4, !dbg !549
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !550
  %conv = zext i16 %0 to i32, !dbg !550
  %cmp = icmp eq i32 %conv, 0, !dbg !552
  br i1 %cmp, label %if.then, label %if.else, !dbg !553

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !554
  br label %return, !dbg !554

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !556
  %conv2 = zext i16 %1 to i32, !dbg !556
  %shl = shl i32 %conv2, 16, !dbg !558
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !559
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !560
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !561
  %conv3 = zext i16 %3 to i32, !dbg !561
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !562
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !562
  %div = udiv i32 %2, %conv3, !dbg !562, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !563
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !564
  %add = add i32 %4, 128, !dbg !565
  %shr = lshr i32 %add, 8, !dbg !566
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !567
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !568
  %cmp4 = icmp ult i32 %5, 255, !dbg !570
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !571

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !572
  %conv7 = trunc i32 %6 to i8, !dbg !574
  store i8 %conv7, i8* %retval, align 1, !dbg !575
  br label %return, !dbg !575

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !576
  br label %return, !dbg !576

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !578
  ret i8 %7, !dbg !578
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !579 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !582, metadata !DIExpression()), !dbg !583
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !584, metadata !DIExpression()), !dbg !585
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !586, metadata !DIExpression()), !dbg !587
  store i32 0, i32* %s32Temp1, align 4, !dbg !587
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !588
  %conv = zext i16 %0 to i32, !dbg !588
  %and = and i32 %conv, 65535, !dbg !589
  %conv1 = trunc i32 %and to i16, !dbg !588
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !590
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !591
  %conv2 = zext i16 %1 to i32, !dbg !591
  %and3 = and i32 %conv2, 65535, !dbg !593
  %cmp = icmp eq i32 %and3, 0, !dbg !594
  br i1 %cmp, label %if.then, label %if.else8, !dbg !595

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !596
  %cmp5 = icmp sge i32 %2, 0, !dbg !599
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !600

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !601
  br label %return, !dbg !601

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !603
  br label %return, !dbg !603

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !605
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !607
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !608
  %conv9 = zext i16 %5 to i32, !dbg !608
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !609
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !609
  %div = sdiv i32 %4, %conv9, !dbg !609, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !610
  %conv10 = zext i16 %6 to i32, !dbg !610
  %mul = mul nsw i32 %div, %conv10, !dbg !611
  %sub = sub nsw i32 %3, %mul, !dbg !612
  %shl = shl i32 %sub, 1, !dbg !613
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !614
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !615
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !616
  %conv11 = zext i16 %8 to i32, !dbg !616
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !617
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !617
  %div12 = sdiv i32 %7, %conv11, !dbg !617, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !618
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !619
  %conv13 = zext i16 %10 to i32, !dbg !619
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !620
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !620
  %div14 = sdiv i32 %9, %conv13, !dbg !620, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !621
  store i32 %add, i32* %s32Temp1, align 4, !dbg !622
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !623
  %cmp15 = icmp slt i32 %11, 65535, !dbg !625
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !626

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !627
  %cmp18 = icmp sgt i32 %12, 0, !dbg !630
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !631

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !632
  %conv21 = trunc i32 %13 to i16, !dbg !634
  store i16 %conv21, i16* %retval, align 2, !dbg !635
  br label %return, !dbg !635

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !636
  br label %return, !dbg !636

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !638
  br label %return, !dbg !638

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !640
  ret i16 %14, !dbg !640
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !641 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !644, metadata !DIExpression()), !dbg !645
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !646, metadata !DIExpression()), !dbg !647
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !648, metadata !DIExpression()), !dbg !649
  store i32 0, i32* %u32Temp, align 4, !dbg !649
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !650
  %conv = zext i16 %0 to i32, !dbg !650
  %cmp = icmp eq i32 %conv, 0, !dbg !652
  br i1 %cmp, label %if.then, label %if.else, !dbg !653

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !654
  br label %return, !dbg !654

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !656
  %conv2 = zext i16 %1 to i32, !dbg !656
  %shl = shl i32 %conv2, 16, !dbg !658
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !659
  %conv3 = zext i16 %2 to i32, !dbg !659
  %shr = ashr i32 %conv3, 1, !dbg !660
  %add = add nsw i32 %shl, %shr, !dbg !661
  store i32 %add, i32* %u32Temp, align 4, !dbg !662
  %3 = load i32, i32* %u32Temp, align 4, !dbg !663
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !664
  %conv4 = zext i16 %4 to i32, !dbg !664
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !665
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !665
  %div = udiv i32 %3, %conv4, !dbg !665, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !666
  %5 = load i32, i32* %u32Temp, align 4, !dbg !667
  %cmp5 = icmp ult i32 %5, 65535, !dbg !669
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !670

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !671
  %and = and i32 %6, 65535, !dbg !673
  %conv8 = trunc i32 %and to i16, !dbg !671
  store i16 %conv8, i16* %retval, align 2, !dbg !674
  br label %return, !dbg !674

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !675
  br label %return, !dbg !675

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !677
  ret i16 %7, !dbg !677
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !678 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !681, metadata !DIExpression()), !dbg !682
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !683, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !685, metadata !DIExpression()), !dbg !686
  store i32 0, i32* %u32Temp1, align 4, !dbg !686
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !687, metadata !DIExpression()), !dbg !688
  store i32 0, i32* %u32Temp2, align 4, !dbg !688
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !689
  %conv = zext i16 %0 to i32, !dbg !689
  %and = and i32 %conv, 65535, !dbg !690
  %conv1 = trunc i32 %and to i16, !dbg !689
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !691
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !692
  %conv2 = zext i16 %1 to i32, !dbg !692
  %cmp = icmp eq i32 %conv2, 0, !dbg !694
  br i1 %cmp, label %if.then, label %if.else, !dbg !695

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !696
  br label %return, !dbg !696

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !698
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !700
  %conv4 = zext i16 %3 to i32, !dbg !700
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !701
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !701
  %div = udiv i32 %2, %conv4, !dbg !701, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !702
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !703
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !704
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !705
  %conv5 = zext i16 %6 to i32, !dbg !705
  %mul = mul i32 %5, %conv5, !dbg !706
  %sub = sub i32 %4, %mul, !dbg !707
  %shl = shl i32 %sub, 1, !dbg !708
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !709
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !710
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !711
  %conv6 = zext i16 %8 to i32, !dbg !711
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !712
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !712
  %div7 = udiv i32 %7, %conv6, !dbg !712, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !713
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !714
  %conv8 = zext i16 %10 to i32, !dbg !714
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !715
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !715
  %div9 = udiv i32 %9, %conv8, !dbg !715, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !716
  store i32 %add, i32* %u32Temp2, align 4, !dbg !717
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !718
  %cmp10 = icmp ult i32 %11, 65535, !dbg !720
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !721

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !722
  %and13 = and i32 %12, 65535, !dbg !724
  %conv14 = trunc i32 %and13 to i16, !dbg !722
  store i16 %conv14, i16* %retval, align 2, !dbg !725
  br label %return, !dbg !725

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !726
  br label %return, !dbg !726

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !728
  ret i16 %13, !dbg !728
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !729 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !732, metadata !DIExpression()), !dbg !733
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !734, metadata !DIExpression()), !dbg !735
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !736, metadata !DIExpression()), !dbg !737
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !738, metadata !DIExpression()), !dbg !739
  store i32 0, i32* %s32Result, align 4, !dbg !739
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !740, metadata !DIExpression()), !dbg !741
  store i32 0, i32* %s32Temp1, align 4, !dbg !741
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !742
  %conv = sext i16 %0 to i32, !dbg !742
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !743
  %conv1 = zext i16 %1 to i32, !dbg !743
  %mul = mul nsw i32 %conv, %conv1, !dbg !744
  store i32 %mul, i32* %s32Result, align 4, !dbg !745
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !746
  %conv2 = sext i16 %2 to i32, !dbg !746
  %cmp = icmp eq i32 %conv2, 0, !dbg !748
  br i1 %cmp, label %if.then, label %if.else7, !dbg !749

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !750
  %cmp4 = icmp slt i32 %3, 0, !dbg !753
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !754

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !755
  br label %return, !dbg !755

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !757
  br label %return, !dbg !757

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !759
  %5 = load i32, i32* %s32Result, align 4, !dbg !761
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !762
  %conv8 = sext i16 %6 to i32, !dbg !762
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !763
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !763
  %div = sdiv i32 %5, %conv8, !dbg !763, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !764
  %conv9 = sext i16 %7 to i32, !dbg !764
  %mul10 = mul nsw i32 %div, %conv9, !dbg !765
  %sub = sub nsw i32 %4, %mul10, !dbg !766
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !767
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !768
  %shl = shl i32 %8, 1, !dbg !769
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !770
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !771
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !772
  %conv11 = sext i16 %10 to i32, !dbg !772
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !773
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !773
  %div12 = sdiv i32 %9, %conv11, !dbg !773, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !774
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !775
  %conv13 = sext i16 %12 to i32, !dbg !775
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !776
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !776
  %div14 = sdiv i32 %11, %conv13, !dbg !776, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !777
  store i32 %add, i32* %s32Result, align 4, !dbg !778
  %13 = load i32, i32* %s32Result, align 4, !dbg !779
  %cmp15 = icmp slt i32 %13, 32767, !dbg !781
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !782

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !783
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !786
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !787

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !788
  %conv21 = trunc i32 %15 to i16, !dbg !790
  store i16 %conv21, i16* %retval, align 2, !dbg !791
  br label %return, !dbg !791

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !792
  br label %return, !dbg !792

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !794
  br label %return, !dbg !794

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !796
  ret i16 %16, !dbg !796
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !797 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !800, metadata !DIExpression()), !dbg !801
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !802, metadata !DIExpression()), !dbg !803
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !804, metadata !DIExpression()), !dbg !805
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !806, metadata !DIExpression()), !dbg !807
  store i32 0, i32* %s32Result, align 4, !dbg !807
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !808, metadata !DIExpression()), !dbg !809
  store i32 0, i32* %s32Temp1, align 4, !dbg !809
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !810
  %conv = zext i16 %0 to i32, !dbg !810
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !811
  %conv1 = sext i16 %1 to i32, !dbg !811
  %mul = mul nsw i32 %conv, %conv1, !dbg !812
  store i32 %mul, i32* %s32Result, align 4, !dbg !813
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !814
  %conv2 = zext i16 %2 to i32, !dbg !814
  %cmp = icmp eq i32 %conv2, 0, !dbg !816
  br i1 %cmp, label %if.then, label %if.else7, !dbg !817

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !818
  %cmp4 = icmp slt i32 %3, 0, !dbg !821
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !822

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !823
  br label %return, !dbg !823

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !825
  br label %return, !dbg !825

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !827
  %5 = load i32, i32* %s32Result, align 4, !dbg !829
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !830
  %conv8 = zext i16 %6 to i32, !dbg !830
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !831
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !831
  %div = sdiv i32 %5, %conv8, !dbg !831, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !832
  %conv9 = zext i16 %7 to i32, !dbg !832
  %mul10 = mul nsw i32 %div, %conv9, !dbg !833
  %sub = sub nsw i32 %4, %mul10, !dbg !834
  %shl = shl i32 %sub, 1, !dbg !835
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !836
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !837
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !838
  %conv11 = zext i16 %9 to i32, !dbg !838
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !839
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !839
  %div12 = sdiv i32 %8, %conv11, !dbg !839, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !840
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !841
  %conv13 = zext i16 %11 to i32, !dbg !841
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !842
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !842
  %div14 = sdiv i32 %10, %conv13, !dbg !842, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !843
  store i32 %add, i32* %s32Result, align 4, !dbg !844
  %12 = load i32, i32* %s32Result, align 4, !dbg !845
  %cmp15 = icmp slt i32 %12, 32767, !dbg !847
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !848

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !849
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !852
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !853

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !854
  %conv21 = trunc i32 %14 to i16, !dbg !856
  store i16 %conv21, i16* %retval, align 2, !dbg !857
  br label %return, !dbg !857

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !858
  br label %return, !dbg !858

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !860
  br label %return, !dbg !860

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !862
  ret i16 %15, !dbg !862
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !863 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !866, metadata !DIExpression()), !dbg !867
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !868, metadata !DIExpression()), !dbg !869
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !870, metadata !DIExpression()), !dbg !871
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !872, metadata !DIExpression()), !dbg !873
  store i32 0, i32* %u32Result, align 4, !dbg !873
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !874, metadata !DIExpression()), !dbg !875
  store i32 0, i32* %u32Temp1, align 4, !dbg !875
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !876, metadata !DIExpression()), !dbg !877
  store i32 0, i32* %s32Result, align 4, !dbg !877
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !878, metadata !DIExpression()), !dbg !879
  store i32 0, i32* %s32Temp1, align 4, !dbg !879
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !880
  %conv = sext i16 %0 to i32, !dbg !880
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !881
  %conv1 = zext i16 %1 to i32, !dbg !881
  %mul = mul nsw i32 %conv, %conv1, !dbg !882
  store i32 %mul, i32* %s32Result, align 4, !dbg !883
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !884
  %conv2 = sext i16 %2 to i32, !dbg !884
  %cmp = icmp eq i32 %conv2, 0, !dbg !886
  br i1 %cmp, label %if.then, label %if.else7, !dbg !887

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !888
  %cmp4 = icmp sge i32 %3, 0, !dbg !891
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !892

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !893
  br label %return, !dbg !893

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !895
  br label %return, !dbg !895

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !897
  %5 = load i32, i32* %s32Result, align 4, !dbg !899
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !900
  %conv8 = sext i16 %6 to i32, !dbg !900
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !901
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !901
  %div = sdiv i32 %5, %conv8, !dbg !901, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !902
  %conv9 = sext i16 %7 to i32, !dbg !902
  %mul10 = mul nsw i32 %div, %conv9, !dbg !903
  %sub = sub nsw i32 %4, %mul10, !dbg !904
  %shl = shl i32 %sub, 1, !dbg !905
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !906
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !907
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !908
  %conv11 = sext i16 %9 to i32, !dbg !908
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !909
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !909
  %div12 = sdiv i32 %8, %conv11, !dbg !909, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !910
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !911
  %conv13 = sext i16 %11 to i32, !dbg !911
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !912
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !912
  %div14 = sdiv i32 %10, %conv13, !dbg !912, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !913
  store i32 %add, i32* %s32Result, align 4, !dbg !914
  %12 = load i32, i32* %s32Result, align 4, !dbg !915
  %cmp15 = icmp slt i32 %12, 65535, !dbg !917
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !918

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !919
  %cmp18 = icmp sgt i32 %13, 0, !dbg !922
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !923

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !924
  %conv21 = trunc i32 %14 to i16, !dbg !926
  store i16 %conv21, i16* %retval, align 2, !dbg !927
  br label %return, !dbg !927

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !928
  br label %return, !dbg !928

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !930
  br label %return, !dbg !930

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !932
  ret i16 %15, !dbg !932
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !933 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !936, metadata !DIExpression()), !dbg !937
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !938, metadata !DIExpression()), !dbg !939
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !940, metadata !DIExpression()), !dbg !941
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !942, metadata !DIExpression()), !dbg !943
  store i32 0, i32* %s32Result, align 4, !dbg !943
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !944, metadata !DIExpression()), !dbg !945
  store i32 0, i32* %s32Temp1, align 4, !dbg !945
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !946
  %conv = sext i16 %0 to i32, !dbg !946
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !947
  %conv1 = zext i16 %1 to i32, !dbg !947
  %mul = mul nsw i32 %conv, %conv1, !dbg !948
  store i32 %mul, i32* %s32Result, align 4, !dbg !949
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !950
  %conv2 = zext i16 %2 to i32, !dbg !950
  %cmp = icmp eq i32 %conv2, 0, !dbg !952
  br i1 %cmp, label %if.then, label %if.else7, !dbg !953

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !954
  %cmp4 = icmp sge i32 %3, 0, !dbg !957
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !958

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !959
  br label %return, !dbg !959

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !961
  br label %return, !dbg !961

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !963
  %5 = load i32, i32* %s32Result, align 4, !dbg !965
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !966
  %conv8 = zext i16 %6 to i32, !dbg !966
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !967
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !967
  %div = sdiv i32 %5, %conv8, !dbg !967, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !968
  %conv9 = zext i16 %7 to i32, !dbg !968
  %mul10 = mul nsw i32 %div, %conv9, !dbg !969
  %sub = sub nsw i32 %4, %mul10, !dbg !970
  %shl = shl i32 %sub, 1, !dbg !971
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !972
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !973
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !974
  %conv11 = zext i16 %9 to i32, !dbg !974
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !975
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !975
  %div12 = sdiv i32 %8, %conv11, !dbg !975, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !976
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !977
  %conv13 = zext i16 %11 to i32, !dbg !977
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !978
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !978
  %div14 = sdiv i32 %10, %conv13, !dbg !978, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !979
  store i32 %add, i32* %s32Result, align 4, !dbg !980
  %12 = load i32, i32* %s32Result, align 4, !dbg !981
  %cmp15 = icmp slt i32 %12, 65535, !dbg !983
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !984

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !985
  %cmp18 = icmp sgt i32 %13, 0, !dbg !988
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !989

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !990
  %conv21 = trunc i32 %14 to i16, !dbg !992
  store i16 %conv21, i16* %retval, align 2, !dbg !993
  br label %return, !dbg !993

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !994
  br label %return, !dbg !994

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !996
  br label %return, !dbg !996

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !998
  ret i16 %15, !dbg !998
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !999 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1002, metadata !DIExpression()), !dbg !1003
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1004, metadata !DIExpression()), !dbg !1005
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1006, metadata !DIExpression()), !dbg !1007
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1008, metadata !DIExpression()), !dbg !1009
  store i32 0, i32* %u32Temp1, align 4, !dbg !1009
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1010, metadata !DIExpression()), !dbg !1011
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1011
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1012
  %conv = zext i16 %0 to i32, !dbg !1012
  %cmp = icmp eq i32 %conv, 0, !dbg !1014
  br i1 %cmp, label %if.then, label %if.else, !dbg !1015

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1016
  br label %return, !dbg !1016

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1018
  %conv2 = zext i16 %1 to i32, !dbg !1018
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1020
  %conv3 = zext i16 %2 to i32, !dbg !1020
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1021
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1022
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1023
  %conv4 = zext i16 %3 to i32, !dbg !1023
  %shr = ashr i32 %conv4, 1, !dbg !1024
  %conv5 = trunc i32 %shr to i16, !dbg !1023
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1025
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1026
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1027
  %conv6 = zext i16 %5 to i32, !dbg !1027
  %add = add i32 %4, %conv6, !dbg !1028
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1029
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1030
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1031
  %conv7 = zext i16 %7 to i32, !dbg !1031
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1032
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1032
  %div = udiv i32 %6, %conv7, !dbg !1032, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1033
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1034
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1036
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1037

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1038
  %and = and i32 %9, 65535, !dbg !1040
  %conv11 = trunc i32 %and to i16, !dbg !1041
  store i16 %conv11, i16* %retval, align 2, !dbg !1042
  br label %return, !dbg !1042

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1043
  br label %return, !dbg !1043

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1045
  ret i16 %10, !dbg !1045
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1046 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1049, metadata !DIExpression()), !dbg !1050
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1051, metadata !DIExpression()), !dbg !1052
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1053, metadata !DIExpression()), !dbg !1054
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1055, metadata !DIExpression()), !dbg !1056
  store i32 0, i32* %u32Temp1, align 4, !dbg !1056
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1057
  %cmp = icmp eq i32 %0, 0, !dbg !1059
  br i1 %cmp, label %if.then, label %if.else, !dbg !1060

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1061
  br label %return, !dbg !1061

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1063
  %conv = zext i16 %1 to i32, !dbg !1063
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1065
  %conv1 = zext i16 %2 to i32, !dbg !1065
  %mul = mul nsw i32 %conv, %conv1, !dbg !1066
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1067
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1068
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1068
  %div = udiv i32 %mul, %3, !dbg !1068, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1069
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1070
  %conv2 = zext i16 %4 to i32, !dbg !1070
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1072
  %conv3 = zext i16 %5 to i32, !dbg !1072
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1073
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1074
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1075
  %mul5 = mul i32 %6, %7, !dbg !1076
  %sub = sub i32 %mul4, %mul5, !dbg !1077
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1078
  %div6 = udiv i32 %8, 2, !dbg !1079
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1080
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1081

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1082
  %inc = add i32 %9, 1, !dbg !1082
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1082
  br label %if.end, !dbg !1084

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1085
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1087
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1088

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1089
  %and = and i32 %11, 65535, !dbg !1091
  %conv13 = trunc i32 %and to i16, !dbg !1092
  store i16 %conv13, i16* %retval, align 2, !dbg !1093
  br label %return, !dbg !1093

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1094
  br label %return, !dbg !1094

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1096
  ret i16 %12, !dbg !1096
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1097 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1100, metadata !DIExpression()), !dbg !1101
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1102, metadata !DIExpression()), !dbg !1103
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1104, metadata !DIExpression()), !dbg !1105
  store i32 0, i32* %u32Temp1, align 4, !dbg !1105
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1106
  %conv = zext i16 %0 to i32, !dbg !1106
  %cmp = icmp eq i32 %conv, 0, !dbg !1108
  br i1 %cmp, label %if.then, label %if.else, !dbg !1109

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1110
  br label %return, !dbg !1110

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1112
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1114
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1115
  %conv2 = zext i16 %3 to i32, !dbg !1115
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1116
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1116
  %div = udiv i32 %2, %conv2, !dbg !1116, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1117
  %conv3 = zext i16 %4 to i32, !dbg !1117
  %mul = mul i32 %div, %conv3, !dbg !1118
  %sub = sub i32 %1, %mul, !dbg !1119
  %shl = shl i32 %sub, 1, !dbg !1120
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1121
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1122
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1123
  %conv4 = zext i16 %6 to i32, !dbg !1123
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1124
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1124
  %div5 = udiv i32 %5, %conv4, !dbg !1124, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1125
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1126
  %conv6 = zext i16 %8 to i32, !dbg !1126
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1127
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1127
  %div7 = udiv i32 %7, %conv6, !dbg !1127, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1128
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1129
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1130
  store i32 %9, i32* %retval, align 4, !dbg !1131
  br label %return, !dbg !1131

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1132
  ret i32 %10, !dbg !1132
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1133 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1136, metadata !DIExpression()), !dbg !1137
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1138, metadata !DIExpression()), !dbg !1139
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1140, metadata !DIExpression()), !dbg !1141
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1142, metadata !DIExpression()), !dbg !1143
  store i32 0, i32* %s32Temp1, align 4, !dbg !1143
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1144, metadata !DIExpression()), !dbg !1145
  store i32 0, i32* %s32Temp2, align 4, !dbg !1145
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1146, metadata !DIExpression()), !dbg !1147
  store i32 0, i32* %s32Temp3, align 4, !dbg !1147
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1148
  %conv = sext i16 %0 to i32, !dbg !1148
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1149
  %conv1 = sext i16 %1 to i32, !dbg !1149
  %mul = mul nsw i32 %conv, %conv1, !dbg !1150
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1151
  %2 = load i16, i16* %div.addr, align 2, !dbg !1152
  %conv2 = sext i16 %2 to i32, !dbg !1152
  %cmp = icmp eq i32 %conv2, 0, !dbg !1154
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1155

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1156
  %cmp4 = icmp slt i32 %3, 0, !dbg !1159
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1160

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1161
  br label %return, !dbg !1161

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1163
  br label %return, !dbg !1163

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1165
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1167
  %6 = load i16, i16* %div.addr, align 2, !dbg !1168
  %conv8 = sext i16 %6 to i32, !dbg !1168
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1169
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1169
  %div9 = sdiv i32 %5, %conv8, !dbg !1169, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1170
  %conv10 = sext i16 %7 to i32, !dbg !1170
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1171
  %sub = sub nsw i32 %4, %mul11, !dbg !1172
  %shl = shl i32 %sub, 1, !dbg !1173
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1174
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1175
  %9 = load i16, i16* %div.addr, align 2, !dbg !1176
  %conv12 = sext i16 %9 to i32, !dbg !1176
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1177
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1177
  %div13 = sdiv i32 %8, %conv12, !dbg !1177, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1178
  %11 = load i16, i16* %div.addr, align 2, !dbg !1179
  %conv14 = sext i16 %11 to i32, !dbg !1179
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1180
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1180
  %div15 = sdiv i32 %10, %conv14, !dbg !1180, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1181
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1182
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1183
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1185
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1186

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1187
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1190
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1191

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1192
  %conv22 = trunc i32 %14 to i16, !dbg !1194
  store i16 %conv22, i16* %retval, align 2, !dbg !1195
  br label %return, !dbg !1195

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1196
  br label %return, !dbg !1196

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1198
  br label %return, !dbg !1198

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1200
  ret i16 %15, !dbg !1200
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1201 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1204, metadata !DIExpression()), !dbg !1205
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1206, metadata !DIExpression()), !dbg !1207
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1208, metadata !DIExpression()), !dbg !1209
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1210, metadata !DIExpression()), !dbg !1211
  store i32 0, i32* %s32Result, align 4, !dbg !1211
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1212, metadata !DIExpression()), !dbg !1213
  store i32 0, i32* %s32Temp1, align 4, !dbg !1213
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1214
  %conv = sext i16 %0 to i32, !dbg !1214
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1215
  %conv1 = sext i16 %1 to i32, !dbg !1215
  %mul = mul nsw i32 %conv, %conv1, !dbg !1216
  store i32 %mul, i32* %s32Result, align 4, !dbg !1217
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1218
  %conv2 = zext i16 %2 to i32, !dbg !1218
  %cmp = icmp eq i32 %conv2, 0, !dbg !1220
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1221

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1222
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1225
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1226

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1227
  br label %return, !dbg !1227

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1229
  %cmp7 = icmp eq i32 %4, 0, !dbg !1231
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1232

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1233
  br label %return, !dbg !1233

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1235
  br label %return, !dbg !1235

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1237
  %6 = load i32, i32* %s32Result, align 4, !dbg !1239
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1240
  %conv12 = zext i16 %7 to i32, !dbg !1240
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1241
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1241
  %div = sdiv i32 %6, %conv12, !dbg !1241, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1242
  %conv13 = zext i16 %8 to i32, !dbg !1242
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1243
  %sub = sub nsw i32 %5, %mul14, !dbg !1244
  %shl = shl i32 %sub, 1, !dbg !1245
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1246
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1247
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1248
  %conv15 = zext i16 %10 to i32, !dbg !1248
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1249
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1249
  %div16 = sdiv i32 %9, %conv15, !dbg !1249, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1250
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1251
  %conv17 = zext i16 %12 to i32, !dbg !1251
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1252
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1252
  %div18 = sdiv i32 %11, %conv17, !dbg !1252, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1253
  store i32 %add, i32* %s32Result, align 4, !dbg !1254
  %13 = load i32, i32* %s32Result, align 4, !dbg !1255
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1257
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1258

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1259
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1262
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1263

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1264
  %conv25 = trunc i32 %15 to i16, !dbg !1266
  store i16 %conv25, i16* %retval, align 2, !dbg !1267
  br label %return, !dbg !1267

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1268
  br label %return, !dbg !1268

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1270
  br label %return, !dbg !1270

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1272
  ret i16 %16, !dbg !1272
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1273 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1276, metadata !DIExpression()), !dbg !1277
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1278, metadata !DIExpression()), !dbg !1279
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1280, metadata !DIExpression()), !dbg !1281
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1282
  %cmp = icmp eq i32 %0, 0, !dbg !1284
  br i1 %cmp, label %if.then, label %if.else, !dbg !1285

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1286
  br label %return, !dbg !1286

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1288
  %cmp1 = icmp sle i32 %1, 0, !dbg !1291
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1292

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1293
  br label %return, !dbg !1293

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1295
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1297
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1298
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1299
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1299
  %div = udiv i32 %3, %4, !dbg !1299, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1300
  %mul = mul i32 %div, %5, !dbg !1301
  %sub = sub i32 %2, %mul, !dbg !1302
  %shl = shl i32 %sub, 1, !dbg !1303
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1304
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1305
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1306
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1307
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1307
  %div4 = udiv i32 %6, %7, !dbg !1307, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1308
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1309
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1310
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1310
  %div5 = udiv i32 %8, %9, !dbg !1310, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1311
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1312
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1313
  store i32 %10, i32* %retval, align 4, !dbg !1314
  br label %return, !dbg !1314

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1315
  ret i32 %11, !dbg !1315
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1316 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1319, metadata !DIExpression()), !dbg !1320
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1321, metadata !DIExpression()), !dbg !1322
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1323, metadata !DIExpression()), !dbg !1324
  store i32 0, i32* %s32Temp1, align 4, !dbg !1324
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1325
  %cmp = icmp eq i32 %0, 0, !dbg !1327
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1328

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1329
  %cmp1 = icmp sge i32 %1, 0, !dbg !1332
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1333

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1334
  br label %return, !dbg !1334

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1336
  br label %return, !dbg !1336

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1338
  %cmp4 = icmp sge i32 %2, 0, !dbg !1341
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1342

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1343
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1345
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1346
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1347
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1347
  %div = udiv i32 %4, %5, !dbg !1347, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1348
  %mul = mul i32 %div, %6, !dbg !1349
  %sub = sub i32 %3, %mul, !dbg !1350
  %shl = shl i32 %sub, 1, !dbg !1351
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1352
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1353
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1354
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1355
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1355
  %div6 = udiv i32 %7, %8, !dbg !1355, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1356
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1357
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1358
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1358
  %div7 = udiv i32 %9, %10, !dbg !1358, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1359
  store i32 %add, i32* %retval, align 4, !dbg !1360
  br label %return, !dbg !1360

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1361
  br label %return, !dbg !1361

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1363
  ret i32 %11, !dbg !1363
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1364 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1367, metadata !DIExpression()), !dbg !1368
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1369, metadata !DIExpression()), !dbg !1370
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1371, metadata !DIExpression()), !dbg !1372
  store i32 0, i32* %u32Temp1, align 4, !dbg !1372
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1373, metadata !DIExpression()), !dbg !1374
  store i32 0, i32* %u32Temp2, align 4, !dbg !1374
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1375
  %cmp = icmp eq i32 %0, 0, !dbg !1377
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1378

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1379
  %cmp1 = icmp slt i32 %1, 0, !dbg !1382
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1383

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1384
  br label %return, !dbg !1384

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1386
  br label %return, !dbg !1386

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1388
  %cmp4 = icmp sge i32 %2, 0, !dbg !1391
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1392

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1393
  %cmp6 = icmp eq i32 %3, 0, !dbg !1396
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1397

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1398
  br label %return, !dbg !1398

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1400
  %cmp9 = icmp sle i32 %4, 0, !dbg !1403
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1404

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1405
  br label %return, !dbg !1405

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1407
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1409
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1410
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1411
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1411
  %div = sdiv i32 %6, %7, !dbg !1411, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1412
  %mul = mul nsw i32 %div, %8, !dbg !1413
  %sub = sub nsw i32 %5, %mul, !dbg !1414
  %shl = shl i32 %sub, 1, !dbg !1415
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1416
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1417
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1418
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1419
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1419
  %div12 = udiv i32 %9, %10, !dbg !1419, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1420
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1421
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1422
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1422
  %div13 = sdiv i32 %11, %12, !dbg !1422, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1423
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1424
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1425
  store i32 %13, i32* %retval, align 4, !dbg !1426
  br label %return, !dbg !1426

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1427
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1430
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1431

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1432
  br label %return, !dbg !1432

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1434
  %sub18 = sub nsw i32 0, %15, !dbg !1436
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1437
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1438
  %sub19 = sub nsw i32 0, %16, !dbg !1439
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1440
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1441
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1442
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1443
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1444
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1444
  %div20 = sdiv i32 %18, %19, !dbg !1444, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1445
  %mul21 = mul nsw i32 %div20, %20, !dbg !1446
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1447
  %shl23 = shl i32 %sub22, 1, !dbg !1448
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1449
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1450
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1451
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1452
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1452
  %div24 = udiv i32 %21, %22, !dbg !1452, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1453
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1454
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1455
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1455
  %div25 = sdiv i32 %23, %24, !dbg !1455, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1456
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1457
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1458
  store i32 %25, i32* %retval, align 4, !dbg !1459
  br label %return, !dbg !1459

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1460
  ret i32 %26, !dbg !1460
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1461 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1464, metadata !DIExpression()), !dbg !1465
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1466, metadata !DIExpression()), !dbg !1467
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1468, metadata !DIExpression()), !dbg !1469
  store i32 0, i32* %u32Temp1, align 4, !dbg !1469
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1470, metadata !DIExpression()), !dbg !1471
  store i32 0, i32* %u32Temp2, align 4, !dbg !1471
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1472, metadata !DIExpression()), !dbg !1473
  store i32 0, i32* %u32Temp3, align 4, !dbg !1473
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1474, metadata !DIExpression()), !dbg !1475
  store i32 0, i32* %numerator_old, align 4, !dbg !1475
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1476
  %cmp = icmp eq i32 %0, 0, !dbg !1478
  br i1 %cmp, label %if.then, label %if.else, !dbg !1479

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1480
  br label %return, !dbg !1480

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1482
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1484
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1485
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1486
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1487
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1487
  %div = udiv i32 %3, %4, !dbg !1487, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1488
  %sub = sub i32 %1, %mul, !dbg !1489
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1490
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1491
  %and = and i32 %5, 1, !dbg !1493
  %cmp1 = icmp eq i32 %and, 0, !dbg !1494
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1495

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1496
  %shr = lshr i32 %6, 1, !dbg !1498
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1499
  br label %if.end, !dbg !1500

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1501
  %shr4 = lshr i32 %7, 1, !dbg !1503
  %add = add i32 %shr4, 1, !dbg !1504
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1505
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1506
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1508
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1509
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1510

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1511
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1513
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1514
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1514
  %div7 = udiv i32 %10, %11, !dbg !1514, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1515
  br label %return, !dbg !1515

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1516
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1518
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1519
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1519
  %div9 = udiv i32 %12, %13, !dbg !1519, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1520
  store i32 %add10, i32* %retval, align 4, !dbg !1521
  br label %return, !dbg !1521

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1522
  ret i32 %14, !dbg !1522
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1523 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1526, metadata !DIExpression()), !dbg !1527
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1528, metadata !DIExpression()), !dbg !1529
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1530, metadata !DIExpression()), !dbg !1531
  store i32 0, i32* %u32Temp1, align 4, !dbg !1531
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1532, metadata !DIExpression()), !dbg !1533
  store i32 0, i32* %u32Temp2, align 4, !dbg !1533
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1534
  %cmp = icmp sle i32 %0, 0, !dbg !1536
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1537

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1538
  %cmp1 = icmp sge i32 %1, 0, !dbg !1541
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1542

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1543
  br label %return, !dbg !1543

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1545
  %sub = sub nsw i32 0, %2, !dbg !1547
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1548
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1549
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1550
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1551
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1552
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1552
  %div = udiv i32 %4, %5, !dbg !1552, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1553
  %mul = mul i32 %div, %6, !dbg !1554
  %sub3 = sub i32 %3, %mul, !dbg !1555
  %shl = shl i32 %sub3, 1, !dbg !1556
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1557
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1558
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1559
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1560
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1560
  %div4 = udiv i32 %7, %8, !dbg !1560, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1561
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1562
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1563
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1563
  %div5 = udiv i32 %9, %10, !dbg !1563, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1564
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1565
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1566
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1568
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1569

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1570
  %sub8 = sub i32 0, %12, !dbg !1572
  store i32 %sub8, i32* %retval, align 4, !dbg !1573
  br label %return, !dbg !1573

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1574
  br label %return, !dbg !1574

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1576
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1578
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1579
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1580
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1580
  %div11 = udiv i32 %14, %15, !dbg !1580, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1581
  %mul12 = mul i32 %div11, %16, !dbg !1582
  %sub13 = sub i32 %13, %mul12, !dbg !1583
  %shl14 = shl i32 %sub13, 1, !dbg !1584
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1585
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1586
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1587
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1588
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1588
  %div15 = udiv i32 %17, %18, !dbg !1588, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1589
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1590
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1591
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1591
  %div16 = udiv i32 %19, %20, !dbg !1591, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1592
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1593
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1594
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1596
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1597

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1598
  store i32 %22, i32* %retval, align 4, !dbg !1600
  br label %return, !dbg !1600

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1601
  br label %return, !dbg !1601

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1603
  ret i32 %23, !dbg !1603
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1604 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1607, metadata !DIExpression()), !dbg !1608
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1609, metadata !DIExpression()), !dbg !1610
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1611, metadata !DIExpression()), !dbg !1612
  store i32 0, i32* %s32Temp1, align 4, !dbg !1612
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1613, metadata !DIExpression()), !dbg !1614
  store i32 0, i32* %s32Temp2, align 4, !dbg !1614
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1615, metadata !DIExpression()), !dbg !1616
  store i32 0, i32* %u32Temp0, align 4, !dbg !1616
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1617, metadata !DIExpression()), !dbg !1618
  store i32 0, i32* %u32Temp1, align 4, !dbg !1618
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1619, metadata !DIExpression()), !dbg !1620
  store i32 0, i32* %u32Temp2, align 4, !dbg !1620
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1621
  %cmp = icmp eq i32 %0, 0, !dbg !1623
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1624

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1625
  %cmp1 = icmp slt i32 %1, 0, !dbg !1628
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1629

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1630
  br label %return, !dbg !1630

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1632
  br label %return, !dbg !1632

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1634
  %cmp4 = icmp sle i32 %2, 0, !dbg !1637
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1638

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1639
  %sub = sub nsw i32 0, %3, !dbg !1641
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1642
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1643
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1644
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1645
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1645
  %div = udiv i32 %4, %5, !dbg !1645, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1646
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1647
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1648
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1649
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1650
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1650
  %div6 = udiv i32 %7, %8, !dbg !1650, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1651
  %mul = mul i32 %div6, %9, !dbg !1652
  %sub7 = sub i32 %6, %mul, !dbg !1653
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1654
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1655
  %and = and i32 %10, 1, !dbg !1657
  %cmp8 = icmp eq i32 %and, 0, !dbg !1658
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1659

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1660
  %shr = lshr i32 %11, 1, !dbg !1662
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1663
  br label %if.end, !dbg !1664

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1665
  %shr11 = lshr i32 %12, 1, !dbg !1667
  %add = add i32 %shr11, 1, !dbg !1668
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1669
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1670
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1672
  %cmp12 = icmp ult i32 %13, %14, !dbg !1673
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1674

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1675
  %neg = xor i32 %15, -1, !dbg !1677
  %add14 = add i32 %neg, 1, !dbg !1678
  store i32 %add14, i32* %retval, align 4, !dbg !1679
  br label %return, !dbg !1679

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1680
  %add16 = add i32 %16, 1, !dbg !1682
  %neg17 = xor i32 %add16, -1, !dbg !1683
  %add18 = add i32 %neg17, 1, !dbg !1684
  store i32 %add18, i32* %retval, align 4, !dbg !1685
  br label %return, !dbg !1685

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1686
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1688
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1689
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1690
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1690
  %div20 = udiv i32 %18, %19, !dbg !1690, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1691
  %mul21 = mul i32 %div20, %20, !dbg !1692
  %sub22 = sub i32 %17, %mul21, !dbg !1693
  %shl = shl i32 %sub22, 1, !dbg !1694
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1695
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1696
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1697
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1698
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1698
  %div23 = udiv i32 %21, %22, !dbg !1698, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1699
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1700
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1701
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1701
  %div24 = udiv i32 %23, %24, !dbg !1701, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1702
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1703
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1704
  store i32 %25, i32* %retval, align 4, !dbg !1705
  br label %return, !dbg !1705

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1706
  ret i32 %26, !dbg !1706
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1707 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1710, metadata !DIExpression()), !dbg !1711
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1712, metadata !DIExpression()), !dbg !1713
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1714, metadata !DIExpression()), !dbg !1715
  store i32 0, i32* %s32Temp1, align 4, !dbg !1715
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1716, metadata !DIExpression()), !dbg !1717
  store i32 0, i32* %s32Temp2, align 4, !dbg !1717
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1718, metadata !DIExpression()), !dbg !1719
  store i32 0, i32* %denominator_prime, align 4, !dbg !1719
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1720, metadata !DIExpression()), !dbg !1721
  store i32 0, i32* %u32Temp1, align 4, !dbg !1721
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1722, metadata !DIExpression()), !dbg !1723
  store i32 0, i32* %u32Temp2, align 4, !dbg !1723
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1724, metadata !DIExpression()), !dbg !1725
  store i32 0, i32* %u32numerator, align 4, !dbg !1725
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1726, metadata !DIExpression()), !dbg !1727
  store i32 0, i32* %u32denominator, align 4, !dbg !1727
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1728
  %cmp = icmp slt i32 %0, 0, !dbg !1730
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1731

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1732
  %cmp1 = icmp sle i32 %1, 0, !dbg !1735
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1736

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1737
  %cmp3 = icmp sge i32 %2, 0, !dbg !1740
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1741

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1742
  br label %return, !dbg !1742

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1744
  %sub = sub nsw i32 0, %3, !dbg !1746
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1747
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1748
  %sub5 = sub nsw i32 0, %4, !dbg !1749
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1750
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1751
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1752
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1753
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1754
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1754
  %div = udiv i32 %6, %7, !dbg !1754, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1755
  %mul = mul i32 %div, %8, !dbg !1756
  %sub6 = sub i32 %5, %mul, !dbg !1757
  %shl = shl i32 %sub6, 1, !dbg !1758
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1759
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1760
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1761
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1762
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1762
  %div7 = udiv i32 %9, %10, !dbg !1762, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1763
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1764
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1765
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1765
  %div8 = udiv i32 %11, %12, !dbg !1765, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1766
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1767
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1768
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1770
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1771

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1772
  store i32 %14, i32* %retval, align 4, !dbg !1774
  br label %return, !dbg !1774

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1775
  br label %return, !dbg !1775

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1777
  %neg = xor i32 %15, -1, !dbg !1779
  %add13 = add nsw i32 %neg, 1, !dbg !1780
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1781
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1782
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1783
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1784
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1785
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1785
  %div14 = udiv i32 %17, %18, !dbg !1785, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1786
  %mul15 = mul i32 %div14, %19, !dbg !1787
  %sub16 = sub i32 %16, %mul15, !dbg !1788
  %shl17 = shl i32 %sub16, 1, !dbg !1789
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1790
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1791
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1792
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1793
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1793
  %div18 = udiv i32 %20, %21, !dbg !1793, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1794
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1795
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1796
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1796
  %div19 = sdiv i32 %22, %23, !dbg !1796, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1797
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1798
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1799
  %neg21 = xor i32 %24, -1, !dbg !1800
  %add22 = add nsw i32 %neg21, 1, !dbg !1801
  store i32 %add22, i32* %retval, align 4, !dbg !1802
  br label %return, !dbg !1802

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1803
  %cmp24 = icmp sle i32 %25, 0, !dbg !1806
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1807

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1808
  %cmp26 = icmp sge i32 %26, 0, !dbg !1811
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1812

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1813
  br label %return, !dbg !1813

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1815
  %neg29 = xor i32 %27, -1, !dbg !1817
  %add30 = add nsw i32 %neg29, 1, !dbg !1818
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1819
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1820
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1821
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1822
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1823
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1823
  %div31 = udiv i32 %29, %30, !dbg !1823, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1824
  %mul32 = mul i32 %div31, %31, !dbg !1825
  %sub33 = sub i32 %28, %mul32, !dbg !1826
  %shl34 = shl i32 %sub33, 1, !dbg !1827
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1828
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1829
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1830
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1831
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1831
  %div35 = udiv i32 %32, %33, !dbg !1831, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1832
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1833
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1834
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1834
  %div36 = udiv i32 %34, %35, !dbg !1834, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1835
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1836
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1837
  %neg38 = xor i32 %36, -1, !dbg !1838
  %add39 = add nsw i32 %neg38, 1, !dbg !1839
  store i32 %add39, i32* %retval, align 4, !dbg !1840
  br label %return, !dbg !1840

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1841
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1843
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1844
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1845
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1845
  %div41 = sdiv i32 %38, %39, !dbg !1845, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1846
  %mul42 = mul nsw i32 %div41, %40, !dbg !1847
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1848
  %shl44 = shl i32 %sub43, 1, !dbg !1849
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1850
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1851
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1852
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1853
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1853
  %div45 = sdiv i32 %41, %42, !dbg !1853, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1854
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1855
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1856
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1856
  %div46 = udiv i32 %43, %44, !dbg !1856, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1857
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1858
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1859
  store i32 %45, i32* %retval, align 4, !dbg !1860
  br label %return, !dbg !1860

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1861
  ret i32 %46, !dbg !1861
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1862 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1865, metadata !DIExpression()), !dbg !1866
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1867, metadata !DIExpression()), !dbg !1868
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1869, metadata !DIExpression()), !dbg !1870
  store i32 0, i32* %numerator_prime, align 4, !dbg !1870
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1871, metadata !DIExpression()), !dbg !1872
  store i32 0, i32* %u32Temp1, align 4, !dbg !1872
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1873, metadata !DIExpression()), !dbg !1874
  store i32 0, i32* %u32Temp2, align 4, !dbg !1874
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1875, metadata !DIExpression()), !dbg !1876
  store i32 0, i32* %u32Temp3, align 4, !dbg !1876
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1877, metadata !DIExpression()), !dbg !1878
  store i32 0, i32* %s32Temp1, align 4, !dbg !1878
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1879, metadata !DIExpression()), !dbg !1880
  store i32 0, i32* %s32Temp2, align 4, !dbg !1880
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1881, metadata !DIExpression()), !dbg !1882
  store i32 0, i32* %s32Temp3, align 4, !dbg !1882
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1883
  %cmp = icmp eq i32 %0, 0, !dbg !1885
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1886

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1887
  %cmp1 = icmp slt i32 %1, 0, !dbg !1890
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1891

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1892
  br label %return, !dbg !1892

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1894
  br label %return, !dbg !1894

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1896
  %cmp4 = icmp slt i32 %2, 0, !dbg !1899
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1900

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1901
  %sub = sub nsw i32 0, %3, !dbg !1903
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1904
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1905
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1906
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1907
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1907
  %div = udiv i32 %4, %5, !dbg !1907, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1908
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1909
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1910
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1911
  %mul = mul i32 %7, %8, !dbg !1912
  %sub6 = sub i32 %6, %mul, !dbg !1913
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1914
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1915
  %and = and i32 %9, 1, !dbg !1917
  %cmp7 = icmp eq i32 %and, 0, !dbg !1918
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1919

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1920
  %shr = lshr i32 %10, 1, !dbg !1922
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1923
  br label %if.end, !dbg !1924

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1925
  %shr10 = lshr i32 %11, 1, !dbg !1927
  %add = add i32 %shr10, 1, !dbg !1928
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1929
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1930
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1932
  %cmp11 = icmp ult i32 %12, %13, !dbg !1933
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1934

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1935
  %neg = xor i32 %14, -1, !dbg !1937
  %add13 = add i32 %neg, 1, !dbg !1938
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1939
  br label %if.end18, !dbg !1940

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1941
  %add15 = add i32 %15, 1, !dbg !1943
  %neg16 = xor i32 %add15, -1, !dbg !1944
  %add17 = add i32 %neg16, 1, !dbg !1945
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1946
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1947
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1949
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1950

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1951
  %conv = trunc i32 %17 to i16, !dbg !1953
  store i16 %conv, i16* %retval, align 2, !dbg !1954
  br label %return, !dbg !1954

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1955
  br label %return, !dbg !1955

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1957
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1959
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1960
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1960
  %div23 = udiv i32 %18, %19, !dbg !1960, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1961
  %mul24 = mul i32 %div23, %20, !dbg !1962
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1963
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1964
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1965
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1966
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1967
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1967
  %div25 = udiv i32 %22, %23, !dbg !1967, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1968
  %mul26 = mul i32 %div25, %24, !dbg !1969
  %sub27 = sub i32 %21, %mul26, !dbg !1970
  %shl = shl i32 %sub27, 1, !dbg !1971
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1972
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1973
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1974
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1975
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1975
  %div28 = udiv i32 %25, %26, !dbg !1975, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1976
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1977
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1978
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1978
  %div29 = udiv i32 %27, %28, !dbg !1978, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !1979
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1980
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1981
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1983
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1984

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1985
  %conv34 = trunc i32 %30 to i16, !dbg !1987
  store i16 %conv34, i16* %retval, align 2, !dbg !1988
  br label %return, !dbg !1988

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1989
  br label %return, !dbg !1989

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1991
  ret i16 %31, !dbg !1991
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1992 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1998, metadata !DIExpression()), !dbg !1999
  %2 = icmp eq i64 %0, 0, !dbg !2000
  br i1 %2, label %3, label %4, !dbg !2002

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2003
  unreachable, !dbg !2003

4:                                                ; preds = %1
  ret void, !dbg !2004
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2005 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2011, metadata !DIExpression()), !dbg !2013
  call void @llvm.dbg.value(metadata i64 %1, metadata !2012, metadata !DIExpression()), !dbg !2013
  %3 = icmp ult i64 %1, %0, !dbg !2014
  br i1 %3, label %5, label %4, !dbg !2016

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2017
  unreachable, !dbg !2017

5:                                                ; preds = %2
  ret void, !dbg !2019
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0029/div_Ccode_alarm_0029.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0029")
!4 = !{}
!5 = !{!6, !13, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0029")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0029")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0029/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0029")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0029")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0029")
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
!308 = !DILocation(line: 309, column: 37, scope: !219)
!309 = !DILocation(line: 309, column: 50, scope: !219)
!310 = !DILocation(line: 309, column: 48, scope: !219)
!311 = !DILocation(line: 309, column: 26, scope: !219)
!312 = !DILocation(line: 309, column: 24, scope: !219)
!313 = !DILocation(line: 310, column: 4, scope: !219)
!314 = !DILocation(line: 329, column: 7, scope: !315)
!315 = distinct !DILexicalBlock(scope: !316, file: !69, line: 329, column: 7)
!316 = distinct !DILexicalBlock(scope: !213, file: !69, line: 328, column: 3)
!317 = !DILocation(line: 329, column: 19, scope: !315)
!318 = !DILocation(line: 329, column: 7, scope: !316)
!319 = !DILocation(line: 331, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !315, file: !69, line: 330, column: 4)
!321 = !DILocation(line: 331, column: 29, scope: !320)
!322 = !DILocation(line: 331, column: 38, scope: !320)
!323 = !DILocation(line: 331, column: 37, scope: !320)
!324 = !DILocation(line: 331, column: 53, scope: !320)
!325 = !DILocation(line: 331, column: 51, scope: !320)
!326 = !DILocation(line: 331, column: 26, scope: !320)
!327 = !DILocation(line: 331, column: 66, scope: !320)
!328 = !DILocation(line: 331, column: 14, scope: !320)
!329 = !DILocation(line: 332, column: 16, scope: !320)
!330 = !DILocation(line: 332, column: 25, scope: !320)
!331 = !DILocation(line: 332, column: 24, scope: !320)
!332 = !DILocation(line: 332, column: 14, scope: !320)
!333 = !DILocation(line: 333, column: 16, scope: !320)
!334 = !DILocation(line: 333, column: 28, scope: !320)
!335 = !DILocation(line: 333, column: 39, scope: !320)
!336 = !DILocation(line: 333, column: 38, scope: !320)
!337 = !DILocation(line: 333, column: 25, scope: !320)
!338 = !DILocation(line: 333, column: 14, scope: !320)
!339 = !DILocation(line: 334, column: 8, scope: !340)
!340 = distinct !DILexicalBlock(scope: !320, file: !69, line: 334, column: 8)
!341 = !DILocation(line: 334, column: 17, scope: !340)
!342 = !DILocation(line: 334, column: 8, scope: !320)
!343 = !DILocation(line: 336, column: 9, scope: !344)
!344 = distinct !DILexicalBlock(scope: !345, file: !69, line: 336, column: 9)
!345 = distinct !DILexicalBlock(scope: !340, file: !69, line: 335, column: 5)
!346 = !DILocation(line: 336, column: 18, scope: !344)
!347 = !DILocation(line: 336, column: 9, scope: !345)
!348 = !DILocation(line: 338, column: 19, scope: !349)
!349 = distinct !DILexicalBlock(scope: !344, file: !69, line: 337, column: 6)
!350 = !DILocation(line: 338, column: 14, scope: !349)
!351 = !DILocation(line: 338, column: 7, scope: !349)
!352 = !DILocation(line: 342, column: 7, scope: !353)
!353 = distinct !DILexicalBlock(scope: !344, file: !69, line: 341, column: 6)
!354 = !DILocation(line: 347, column: 6, scope: !355)
!355 = distinct !DILexicalBlock(scope: !340, file: !69, line: 346, column: 5)
!356 = !DILocation(line: 353, column: 5, scope: !357)
!357 = distinct !DILexicalBlock(scope: !315, file: !69, line: 352, column: 4)
!358 = !DILocation(line: 359, column: 1, scope: !186)
!359 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !360, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!360 = !DISubroutineType(types: !361)
!361 = !{!19, !13}
!362 = !DILocalVariable(name: "denominator", arg: 1, scope: !359, file: !33, line: 24, type: !13)
!363 = !DILocation(line: 24, column: 40, scope: !359)
!364 = !DILocation(line: 26, column: 12, scope: !359)
!365 = !DILocation(line: 26, column: 24, scope: !359)
!366 = !DILocation(line: 26, column: 5, scope: !359)
!367 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !360, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!368 = !DILocalVariable(name: "left", arg: 1, scope: !367, file: !33, line: 84, type: !13)
!369 = !DILocation(line: 84, column: 51, scope: !367)
!370 = !DILocation(line: 86, column: 12, scope: !367)
!371 = !DILocation(line: 86, column: 17, scope: !367)
!372 = !DILocation(line: 86, column: 5, scope: !367)
!373 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !374, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!374 = !DISubroutineType(types: !375)
!375 = !{!19, !13, !20}
!376 = !DILocalVariable(name: "left", arg: 1, scope: !373, file: !33, line: 90, type: !13)
!377 = !DILocation(line: 90, column: 41, scope: !373)
!378 = !DILocalVariable(name: "count", arg: 2, scope: !373, file: !33, line: 90, type: !20)
!379 = !DILocation(line: 90, column: 56, scope: !373)
!380 = !DILocation(line: 92, column: 9, scope: !381)
!381 = distinct !DILexicalBlock(scope: !373, file: !33, line: 92, column: 9)
!382 = !DILocation(line: 92, column: 15, scope: !381)
!383 = !DILocation(line: 92, column: 9, scope: !373)
!384 = !DILocation(line: 93, column: 9, scope: !385)
!385 = distinct !DILexicalBlock(scope: !381, file: !33, line: 92, column: 32)
!386 = !DILocation(line: 95, column: 12, scope: !373)
!387 = !DILocation(line: 95, column: 34, scope: !373)
!388 = !DILocation(line: 95, column: 31, scope: !373)
!389 = !DILocation(line: 95, column: 17, scope: !373)
!390 = !DILocation(line: 95, column: 41, scope: !373)
!391 = !DILocation(line: 95, column: 5, scope: !373)
!392 = !DILocation(line: 96, column: 1, scope: !373)
!393 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !394, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!394 = !DISubroutineType(types: !395)
!395 = !{!19, !13, !13}
!396 = !DILocalVariable(name: "left", arg: 1, scope: !393, file: !33, line: 78, type: !13)
!397 = !DILocation(line: 78, column: 38, scope: !393)
!398 = !DILocalVariable(name: "right", arg: 2, scope: !393, file: !33, line: 78, type: !13)
!399 = !DILocation(line: 78, column: 52, scope: !393)
!400 = !DILocation(line: 80, column: 12, scope: !393)
!401 = !DILocation(line: 80, column: 19, scope: !393)
!402 = !DILocation(line: 80, column: 17, scope: !393)
!403 = !DILocation(line: 80, column: 25, scope: !393)
!404 = !DILocation(line: 80, column: 5, scope: !393)
!405 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !394, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!406 = !DILocalVariable(name: "left", arg: 1, scope: !405, file: !33, line: 72, type: !13)
!407 = !DILocation(line: 72, column: 38, scope: !405)
!408 = !DILocalVariable(name: "right", arg: 2, scope: !405, file: !33, line: 72, type: !13)
!409 = !DILocation(line: 72, column: 52, scope: !405)
!410 = !DILocation(line: 74, column: 12, scope: !405)
!411 = !DILocation(line: 74, column: 19, scope: !405)
!412 = !DILocation(line: 74, column: 17, scope: !405)
!413 = !DILocation(line: 74, column: 25, scope: !405)
!414 = !DILocation(line: 74, column: 5, scope: !405)
!415 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 377, type: !416, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!416 = !DISubroutineType(types: !417)
!417 = !{!6, !6, !28}
!418 = !DILocalVariable(name: "numerator", arg: 1, scope: !415, file: !69, line: 377, type: !6)
!419 = !DILocation(line: 377, column: 31, scope: !415)
!420 = !DILocalVariable(name: "denominator", arg: 2, scope: !415, file: !69, line: 377, type: !28)
!421 = !DILocation(line: 377, column: 47, scope: !415)
!422 = !DILocalVariable(name: "u16Temp1", scope: !415, file: !69, line: 379, type: !28)
!423 = !DILocation(line: 379, column: 6, scope: !415)
!424 = !DILocalVariable(name: "s32Temp1", scope: !415, file: !69, line: 380, type: !16)
!425 = !DILocation(line: 380, column: 6, scope: !415)
!426 = !DILocalVariable(name: "s32Temp2", scope: !415, file: !69, line: 380, type: !16)
!427 = !DILocation(line: 380, column: 15, scope: !415)
!428 = !DILocation(line: 381, column: 13, scope: !415)
!429 = !DILocation(line: 381, column: 25, scope: !415)
!430 = !DILocation(line: 381, column: 11, scope: !415)
!431 = !DILocation(line: 382, column: 13, scope: !415)
!432 = !DILocation(line: 382, column: 22, scope: !415)
!433 = !DILocation(line: 382, column: 11, scope: !415)
!434 = !DILocation(line: 383, column: 5, scope: !435)
!435 = distinct !DILexicalBlock(scope: !415, file: !69, line: 383, column: 5)
!436 = !DILocation(line: 383, column: 14, scope: !435)
!437 = !DILocation(line: 383, column: 5, scope: !415)
!438 = !DILocation(line: 385, column: 7, scope: !439)
!439 = distinct !DILexicalBlock(scope: !440, file: !69, line: 385, column: 7)
!440 = distinct !DILexicalBlock(scope: !435, file: !69, line: 384, column: 2)
!441 = !DILocation(line: 385, column: 17, scope: !439)
!442 = !DILocation(line: 385, column: 7, scope: !440)
!443 = !DILocation(line: 387, column: 4, scope: !444)
!444 = distinct !DILexicalBlock(scope: !439, file: !69, line: 386, column: 3)
!445 = !DILocation(line: 391, column: 4, scope: !446)
!446 = distinct !DILexicalBlock(scope: !439, file: !69, line: 390, column: 3)
!447 = !DILocation(line: 396, column: 15, scope: !448)
!448 = distinct !DILexicalBlock(scope: !435, file: !69, line: 395, column: 2)
!449 = !DILocation(line: 396, column: 24, scope: !448)
!450 = !DILocation(line: 396, column: 32, scope: !448)
!451 = !DILocation(line: 396, column: 41, scope: !448)
!452 = !DILocation(line: 396, column: 47, scope: !448)
!453 = !DILocation(line: 396, column: 46, scope: !448)
!454 = !DILocation(line: 396, column: 57, scope: !448)
!455 = !DILocation(line: 396, column: 56, scope: !448)
!456 = !DILocation(line: 396, column: 29, scope: !448)
!457 = !DILocation(line: 396, column: 12, scope: !448)
!458 = !DILocation(line: 397, column: 14, scope: !448)
!459 = !DILocation(line: 397, column: 22, scope: !448)
!460 = !DILocation(line: 397, column: 12, scope: !448)
!461 = !DILocation(line: 398, column: 14, scope: !448)
!462 = !DILocation(line: 398, column: 23, scope: !448)
!463 = !DILocation(line: 398, column: 22, scope: !448)
!464 = !DILocation(line: 398, column: 12, scope: !448)
!465 = !DILocation(line: 399, column: 16, scope: !448)
!466 = !DILocation(line: 399, column: 25, scope: !448)
!467 = !DILocation(line: 399, column: 31, scope: !448)
!468 = !DILocation(line: 399, column: 30, scope: !448)
!469 = !DILocation(line: 399, column: 43, scope: !448)
!470 = !DILocation(line: 399, column: 41, scope: !448)
!471 = !DILocation(line: 399, column: 12, scope: !448)
!472 = !DILocation(line: 400, column: 6, scope: !473)
!473 = distinct !DILexicalBlock(scope: !448, file: !69, line: 400, column: 6)
!474 = !DILocation(line: 400, column: 15, scope: !473)
!475 = !DILocation(line: 400, column: 6, scope: !448)
!476 = !DILocation(line: 402, column: 7, scope: !477)
!477 = distinct !DILexicalBlock(scope: !478, file: !69, line: 402, column: 7)
!478 = distinct !DILexicalBlock(scope: !473, file: !69, line: 401, column: 3)
!479 = !DILocation(line: 402, column: 16, scope: !477)
!480 = !DILocation(line: 402, column: 7, scope: !478)
!481 = !DILocation(line: 404, column: 17, scope: !482)
!482 = distinct !DILexicalBlock(scope: !477, file: !69, line: 403, column: 4)
!483 = !DILocation(line: 404, column: 12, scope: !482)
!484 = !DILocation(line: 404, column: 5, scope: !482)
!485 = !DILocation(line: 408, column: 5, scope: !486)
!486 = distinct !DILexicalBlock(scope: !477, file: !69, line: 407, column: 4)
!487 = !DILocation(line: 413, column: 4, scope: !488)
!488 = distinct !DILexicalBlock(scope: !473, file: !69, line: 412, column: 3)
!489 = !DILocation(line: 416, column: 1, scope: !415)
!490 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 433, type: !416, scopeLine: 434, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!491 = !DILocalVariable(name: "numerator", arg: 1, scope: !490, file: !69, line: 433, type: !6)
!492 = !DILocation(line: 433, column: 30, scope: !490)
!493 = !DILocalVariable(name: "denominator", arg: 2, scope: !490, file: !69, line: 433, type: !28)
!494 = !DILocation(line: 433, column: 45, scope: !490)
!495 = !DILocalVariable(name: "u16Temp1", scope: !490, file: !69, line: 435, type: !28)
!496 = !DILocation(line: 435, column: 6, scope: !490)
!497 = !DILocalVariable(name: "s32Temp1", scope: !490, file: !69, line: 436, type: !16)
!498 = !DILocation(line: 436, column: 6, scope: !490)
!499 = !DILocation(line: 437, column: 13, scope: !490)
!500 = !DILocation(line: 437, column: 25, scope: !490)
!501 = !DILocation(line: 437, column: 11, scope: !490)
!502 = !DILocation(line: 438, column: 5, scope: !503)
!503 = distinct !DILexicalBlock(scope: !490, file: !69, line: 438, column: 5)
!504 = !DILocation(line: 438, column: 13, scope: !503)
!505 = !DILocation(line: 438, column: 5, scope: !490)
!506 = !DILocation(line: 440, column: 6, scope: !507)
!507 = distinct !DILexicalBlock(scope: !508, file: !69, line: 440, column: 6)
!508 = distinct !DILexicalBlock(scope: !503, file: !69, line: 439, column: 2)
!509 = !DILocation(line: 440, column: 15, scope: !507)
!510 = !DILocation(line: 440, column: 6, scope: !508)
!511 = !DILocation(line: 442, column: 4, scope: !512)
!512 = distinct !DILexicalBlock(scope: !507, file: !69, line: 441, column: 3)
!513 = !DILocation(line: 446, column: 4, scope: !514)
!514 = distinct !DILexicalBlock(scope: !507, file: !69, line: 445, column: 3)
!515 = !DILocation(line: 452, column: 15, scope: !516)
!516 = distinct !DILexicalBlock(scope: !503, file: !69, line: 451, column: 2)
!517 = !DILocation(line: 452, column: 27, scope: !516)
!518 = !DILocation(line: 452, column: 37, scope: !516)
!519 = !DILocation(line: 452, column: 36, scope: !516)
!520 = !DILocation(line: 452, column: 49, scope: !516)
!521 = !DILocation(line: 452, column: 47, scope: !516)
!522 = !DILocation(line: 452, column: 25, scope: !516)
!523 = !DILocation(line: 452, column: 59, scope: !516)
!524 = !DILocation(line: 452, column: 12, scope: !516)
!525 = !DILocation(line: 453, column: 15, scope: !516)
!526 = !DILocation(line: 453, column: 24, scope: !516)
!527 = !DILocation(line: 453, column: 23, scope: !516)
!528 = !DILocation(line: 453, column: 37, scope: !516)
!529 = !DILocation(line: 453, column: 47, scope: !516)
!530 = !DILocation(line: 453, column: 46, scope: !516)
!531 = !DILocation(line: 453, column: 34, scope: !516)
!532 = !DILocation(line: 453, column: 12, scope: !516)
!533 = !DILocation(line: 454, column: 10, scope: !516)
!534 = !DILocation(line: 454, column: 3, scope: !516)
!535 = !DILocation(line: 456, column: 1, scope: !490)
!536 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 474, type: !537, scopeLine: 475, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!537 = !DISubroutineType(types: !538)
!538 = !{!24, !28, !28}
!539 = !DILocalVariable(name: "numerator", arg: 1, scope: !536, file: !69, line: 474, type: !28)
!540 = !DILocation(line: 474, column: 28, scope: !536)
!541 = !DILocalVariable(name: "denominator", arg: 2, scope: !536, file: !69, line: 474, type: !28)
!542 = !DILocation(line: 474, column: 43, scope: !536)
!543 = !DILocalVariable(name: "u32Temp1", scope: !536, file: !69, line: 476, type: !544)
!544 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !20)
!545 = !DILocation(line: 476, column: 6, scope: !536)
!546 = !DILocalVariable(name: "u32Temp2", scope: !536, file: !69, line: 476, type: !544)
!547 = !DILocation(line: 476, column: 20, scope: !536)
!548 = !DILocalVariable(name: "u32Temp3", scope: !536, file: !69, line: 476, type: !544)
!549 = !DILocation(line: 476, column: 33, scope: !536)
!550 = !DILocation(line: 477, column: 5, scope: !551)
!551 = distinct !DILexicalBlock(scope: !536, file: !69, line: 477, column: 5)
!552 = !DILocation(line: 477, column: 16, scope: !551)
!553 = !DILocation(line: 477, column: 5, scope: !536)
!554 = !DILocation(line: 479, column: 3, scope: !555)
!555 = distinct !DILexicalBlock(scope: !551, file: !69, line: 478, column: 2)
!556 = !DILocation(line: 483, column: 15, scope: !557)
!557 = distinct !DILexicalBlock(scope: !551, file: !69, line: 482, column: 2)
!558 = !DILocation(line: 483, column: 24, scope: !557)
!559 = !DILocation(line: 483, column: 12, scope: !557)
!560 = !DILocation(line: 484, column: 14, scope: !557)
!561 = !DILocation(line: 484, column: 25, scope: !557)
!562 = !DILocation(line: 484, column: 23, scope: !557)
!563 = !DILocation(line: 484, column: 12, scope: !557)
!564 = !DILocation(line: 485, column: 15, scope: !557)
!565 = !DILocation(line: 485, column: 24, scope: !557)
!566 = !DILocation(line: 485, column: 32, scope: !557)
!567 = !DILocation(line: 485, column: 12, scope: !557)
!568 = !DILocation(line: 486, column: 6, scope: !569)
!569 = distinct !DILexicalBlock(scope: !557, file: !69, line: 486, column: 6)
!570 = !DILocation(line: 486, column: 15, scope: !569)
!571 = !DILocation(line: 486, column: 6, scope: !557)
!572 = !DILocation(line: 488, column: 15, scope: !573)
!573 = distinct !DILexicalBlock(scope: !569, file: !69, line: 487, column: 3)
!574 = !DILocation(line: 488, column: 11, scope: !573)
!575 = !DILocation(line: 488, column: 4, scope: !573)
!576 = !DILocation(line: 492, column: 4, scope: !577)
!577 = distinct !DILexicalBlock(scope: !569, file: !69, line: 491, column: 3)
!578 = !DILocation(line: 495, column: 1, scope: !536)
!579 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 512, type: !580, scopeLine: 513, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!580 = !DISubroutineType(types: !581)
!581 = !{!28, !16, !28}
!582 = !DILocalVariable(name: "x_value", arg: 1, scope: !579, file: !69, line: 512, type: !16)
!583 = !DILocation(line: 512, column: 25, scope: !579)
!584 = !DILocalVariable(name: "y_value", arg: 2, scope: !579, file: !69, line: 512, type: !28)
!585 = !DILocation(line: 512, column: 38, scope: !579)
!586 = !DILocalVariable(name: "s32Temp1", scope: !579, file: !69, line: 514, type: !16)
!587 = !DILocation(line: 514, column: 6, scope: !579)
!588 = !DILocation(line: 515, column: 12, scope: !579)
!589 = !DILocation(line: 515, column: 20, scope: !579)
!590 = !DILocation(line: 515, column: 10, scope: !579)
!591 = !DILocation(line: 516, column: 6, scope: !592)
!592 = distinct !DILexicalBlock(scope: !579, file: !69, line: 516, column: 5)
!593 = !DILocation(line: 516, column: 14, scope: !592)
!594 = !DILocation(line: 516, column: 24, scope: !592)
!595 = !DILocation(line: 516, column: 5, scope: !579)
!596 = !DILocation(line: 518, column: 6, scope: !597)
!597 = distinct !DILexicalBlock(scope: !598, file: !69, line: 518, column: 6)
!598 = distinct !DILexicalBlock(scope: !592, file: !69, line: 517, column: 2)
!599 = !DILocation(line: 518, column: 14, scope: !597)
!600 = !DILocation(line: 518, column: 6, scope: !598)
!601 = !DILocation(line: 520, column: 4, scope: !602)
!602 = distinct !DILexicalBlock(scope: !597, file: !69, line: 519, column: 3)
!603 = !DILocation(line: 524, column: 4, scope: !604)
!604 = distinct !DILexicalBlock(scope: !597, file: !69, line: 523, column: 3)
!605 = !DILocation(line: 529, column: 15, scope: !606)
!606 = distinct !DILexicalBlock(scope: !592, file: !69, line: 528, column: 2)
!607 = !DILocation(line: 529, column: 27, scope: !606)
!608 = !DILocation(line: 529, column: 35, scope: !606)
!609 = !DILocation(line: 529, column: 34, scope: !606)
!610 = !DILocation(line: 529, column: 46, scope: !606)
!611 = !DILocation(line: 529, column: 44, scope: !606)
!612 = !DILocation(line: 529, column: 23, scope: !606)
!613 = !DILocation(line: 529, column: 56, scope: !606)
!614 = !DILocation(line: 529, column: 12, scope: !606)
!615 = !DILocation(line: 530, column: 15, scope: !606)
!616 = !DILocation(line: 530, column: 24, scope: !606)
!617 = !DILocation(line: 530, column: 23, scope: !606)
!618 = !DILocation(line: 530, column: 36, scope: !606)
!619 = !DILocation(line: 530, column: 44, scope: !606)
!620 = !DILocation(line: 530, column: 43, scope: !606)
!621 = !DILocation(line: 530, column: 33, scope: !606)
!622 = !DILocation(line: 530, column: 12, scope: !606)
!623 = !DILocation(line: 531, column: 6, scope: !624)
!624 = distinct !DILexicalBlock(scope: !606, file: !69, line: 531, column: 6)
!625 = !DILocation(line: 531, column: 15, scope: !624)
!626 = !DILocation(line: 531, column: 6, scope: !606)
!627 = !DILocation(line: 533, column: 7, scope: !628)
!628 = distinct !DILexicalBlock(scope: !629, file: !69, line: 533, column: 7)
!629 = distinct !DILexicalBlock(scope: !624, file: !69, line: 532, column: 3)
!630 = !DILocation(line: 533, column: 16, scope: !628)
!631 = !DILocation(line: 533, column: 7, scope: !629)
!632 = !DILocation(line: 535, column: 17, scope: !633)
!633 = distinct !DILexicalBlock(scope: !628, file: !69, line: 534, column: 4)
!634 = !DILocation(line: 535, column: 12, scope: !633)
!635 = !DILocation(line: 535, column: 5, scope: !633)
!636 = !DILocation(line: 539, column: 5, scope: !637)
!637 = distinct !DILexicalBlock(scope: !628, file: !69, line: 538, column: 4)
!638 = !DILocation(line: 544, column: 4, scope: !639)
!639 = distinct !DILexicalBlock(scope: !624, file: !69, line: 543, column: 3)
!640 = !DILocation(line: 547, column: 1, scope: !579)
!641 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 565, type: !642, scopeLine: 566, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!642 = !DISubroutineType(types: !643)
!643 = !{!28, !28, !28}
!644 = !DILocalVariable(name: "numerator", arg: 1, scope: !641, file: !69, line: 565, type: !28)
!645 = !DILocation(line: 565, column: 31, scope: !641)
!646 = !DILocalVariable(name: "denominator", arg: 2, scope: !641, file: !69, line: 565, type: !28)
!647 = !DILocation(line: 565, column: 46, scope: !641)
!648 = !DILocalVariable(name: "u32Temp", scope: !641, file: !69, line: 567, type: !544)
!649 = !DILocation(line: 567, column: 6, scope: !641)
!650 = !DILocation(line: 568, column: 5, scope: !651)
!651 = distinct !DILexicalBlock(scope: !641, file: !69, line: 568, column: 5)
!652 = !DILocation(line: 568, column: 17, scope: !651)
!653 = !DILocation(line: 568, column: 5, scope: !641)
!654 = !DILocation(line: 570, column: 3, scope: !655)
!655 = distinct !DILexicalBlock(scope: !651, file: !69, line: 569, column: 2)
!656 = !DILocation(line: 574, column: 14, scope: !657)
!657 = distinct !DILexicalBlock(scope: !651, file: !69, line: 573, column: 2)
!658 = !DILocation(line: 574, column: 23, scope: !657)
!659 = !DILocation(line: 574, column: 32, scope: !657)
!660 = !DILocation(line: 574, column: 44, scope: !657)
!661 = !DILocation(line: 574, column: 29, scope: !657)
!662 = !DILocation(line: 574, column: 11, scope: !657)
!663 = !DILocation(line: 575, column: 13, scope: !657)
!664 = !DILocation(line: 575, column: 21, scope: !657)
!665 = !DILocation(line: 575, column: 20, scope: !657)
!666 = !DILocation(line: 575, column: 11, scope: !657)
!667 = !DILocation(line: 576, column: 6, scope: !668)
!668 = distinct !DILexicalBlock(scope: !657, file: !69, line: 576, column: 6)
!669 = !DILocation(line: 576, column: 14, scope: !668)
!670 = !DILocation(line: 576, column: 6, scope: !657)
!671 = !DILocation(line: 578, column: 11, scope: !672)
!672 = distinct !DILexicalBlock(scope: !668, file: !69, line: 577, column: 3)
!673 = !DILocation(line: 578, column: 19, scope: !672)
!674 = !DILocation(line: 578, column: 4, scope: !672)
!675 = !DILocation(line: 582, column: 4, scope: !676)
!676 = distinct !DILexicalBlock(scope: !668, file: !69, line: 581, column: 3)
!677 = !DILocation(line: 586, column: 1, scope: !641)
!678 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 603, type: !679, scopeLine: 604, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!679 = !DISubroutineType(types: !680)
!680 = !{!28, !544, !28}
!681 = !DILocalVariable(name: "x_value", arg: 1, scope: !678, file: !69, line: 603, type: !544)
!682 = !DILocation(line: 603, column: 25, scope: !678)
!683 = !DILocalVariable(name: "y_value", arg: 2, scope: !678, file: !69, line: 603, type: !28)
!684 = !DILocation(line: 603, column: 38, scope: !678)
!685 = !DILocalVariable(name: "u32Temp1", scope: !678, file: !69, line: 605, type: !544)
!686 = !DILocation(line: 605, column: 6, scope: !678)
!687 = !DILocalVariable(name: "u32Temp2", scope: !678, file: !69, line: 605, type: !544)
!688 = !DILocation(line: 605, column: 17, scope: !678)
!689 = !DILocation(line: 606, column: 12, scope: !678)
!690 = !DILocation(line: 606, column: 20, scope: !678)
!691 = !DILocation(line: 606, column: 10, scope: !678)
!692 = !DILocation(line: 607, column: 5, scope: !693)
!693 = distinct !DILexicalBlock(scope: !678, file: !69, line: 607, column: 5)
!694 = !DILocation(line: 607, column: 13, scope: !693)
!695 = !DILocation(line: 607, column: 5, scope: !678)
!696 = !DILocation(line: 609, column: 3, scope: !697)
!697 = distinct !DILexicalBlock(scope: !693, file: !69, line: 608, column: 2)
!698 = !DILocation(line: 613, column: 14, scope: !699)
!699 = distinct !DILexicalBlock(scope: !693, file: !69, line: 612, column: 2)
!700 = !DILocation(line: 613, column: 22, scope: !699)
!701 = !DILocation(line: 613, column: 21, scope: !699)
!702 = !DILocation(line: 613, column: 12, scope: !699)
!703 = !DILocation(line: 614, column: 14, scope: !699)
!704 = !DILocation(line: 614, column: 25, scope: !699)
!705 = !DILocation(line: 614, column: 36, scope: !699)
!706 = !DILocation(line: 614, column: 34, scope: !699)
!707 = !DILocation(line: 614, column: 22, scope: !699)
!708 = !DILocation(line: 614, column: 45, scope: !699)
!709 = !DILocation(line: 614, column: 12, scope: !699)
!710 = !DILocation(line: 615, column: 15, scope: !699)
!711 = !DILocation(line: 615, column: 24, scope: !699)
!712 = !DILocation(line: 615, column: 23, scope: !699)
!713 = !DILocation(line: 615, column: 36, scope: !699)
!714 = !DILocation(line: 615, column: 44, scope: !699)
!715 = !DILocation(line: 615, column: 43, scope: !699)
!716 = !DILocation(line: 615, column: 33, scope: !699)
!717 = !DILocation(line: 615, column: 12, scope: !699)
!718 = !DILocation(line: 616, column: 6, scope: !719)
!719 = distinct !DILexicalBlock(scope: !699, file: !69, line: 616, column: 6)
!720 = !DILocation(line: 616, column: 15, scope: !719)
!721 = !DILocation(line: 616, column: 6, scope: !699)
!722 = !DILocation(line: 618, column: 11, scope: !723)
!723 = distinct !DILexicalBlock(scope: !719, file: !69, line: 617, column: 3)
!724 = !DILocation(line: 618, column: 20, scope: !723)
!725 = !DILocation(line: 618, column: 4, scope: !723)
!726 = !DILocation(line: 622, column: 4, scope: !727)
!727 = distinct !DILexicalBlock(scope: !719, file: !69, line: 621, column: 3)
!728 = !DILocation(line: 626, column: 1, scope: !678)
!729 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 645, type: !730, scopeLine: 646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!730 = !DISubroutineType(types: !731)
!731 = !{!6, !6, !28, !6}
!732 = !DILocalVariable(name: "factor1", arg: 1, scope: !729, file: !69, line: 645, type: !6)
!733 = !DILocation(line: 645, column: 33, scope: !729)
!734 = !DILocalVariable(name: "factor2", arg: 2, scope: !729, file: !69, line: 645, type: !28)
!735 = !DILocation(line: 645, column: 46, scope: !729)
!736 = !DILocalVariable(name: "denominator", arg: 3, scope: !729, file: !69, line: 645, type: !6)
!737 = !DILocation(line: 645, column: 59, scope: !729)
!738 = !DILocalVariable(name: "s32Result", scope: !729, file: !69, line: 647, type: !16)
!739 = !DILocation(line: 647, column: 6, scope: !729)
!740 = !DILocalVariable(name: "s32Temp1", scope: !729, file: !69, line: 647, type: !16)
!741 = !DILocation(line: 647, column: 21, scope: !729)
!742 = !DILocation(line: 648, column: 14, scope: !729)
!743 = !DILocation(line: 648, column: 24, scope: !729)
!744 = !DILocation(line: 648, column: 22, scope: !729)
!745 = !DILocation(line: 648, column: 12, scope: !729)
!746 = !DILocation(line: 649, column: 5, scope: !747)
!747 = distinct !DILexicalBlock(scope: !729, file: !69, line: 649, column: 5)
!748 = !DILocation(line: 649, column: 17, scope: !747)
!749 = !DILocation(line: 649, column: 5, scope: !729)
!750 = !DILocation(line: 651, column: 6, scope: !751)
!751 = distinct !DILexicalBlock(scope: !752, file: !69, line: 651, column: 6)
!752 = distinct !DILexicalBlock(scope: !747, file: !69, line: 650, column: 2)
!753 = !DILocation(line: 651, column: 16, scope: !751)
!754 = !DILocation(line: 651, column: 6, scope: !752)
!755 = !DILocation(line: 653, column: 4, scope: !756)
!756 = distinct !DILexicalBlock(scope: !751, file: !69, line: 652, column: 3)
!757 = !DILocation(line: 657, column: 4, scope: !758)
!758 = distinct !DILexicalBlock(scope: !751, file: !69, line: 656, column: 3)
!759 = !DILocation(line: 662, column: 14, scope: !760)
!760 = distinct !DILexicalBlock(scope: !747, file: !69, line: 661, column: 2)
!761 = !DILocation(line: 662, column: 27, scope: !760)
!762 = !DILocation(line: 662, column: 37, scope: !760)
!763 = !DILocation(line: 662, column: 36, scope: !760)
!764 = !DILocation(line: 662, column: 50, scope: !760)
!765 = !DILocation(line: 662, column: 49, scope: !760)
!766 = !DILocation(line: 662, column: 24, scope: !760)
!767 = !DILocation(line: 662, column: 12, scope: !760)
!768 = !DILocation(line: 663, column: 14, scope: !760)
!769 = !DILocation(line: 663, column: 23, scope: !760)
!770 = !DILocation(line: 663, column: 12, scope: !760)
!771 = !DILocation(line: 664, column: 16, scope: !760)
!772 = !DILocation(line: 664, column: 25, scope: !760)
!773 = !DILocation(line: 664, column: 24, scope: !760)
!774 = !DILocation(line: 664, column: 41, scope: !760)
!775 = !DILocation(line: 664, column: 51, scope: !760)
!776 = !DILocation(line: 664, column: 50, scope: !760)
!777 = !DILocation(line: 664, column: 38, scope: !760)
!778 = !DILocation(line: 664, column: 13, scope: !760)
!779 = !DILocation(line: 665, column: 6, scope: !780)
!780 = distinct !DILexicalBlock(scope: !760, file: !69, line: 665, column: 6)
!781 = !DILocation(line: 665, column: 16, scope: !780)
!782 = !DILocation(line: 665, column: 6, scope: !760)
!783 = !DILocation(line: 667, column: 7, scope: !784)
!784 = distinct !DILexicalBlock(scope: !785, file: !69, line: 667, column: 7)
!785 = distinct !DILexicalBlock(scope: !780, file: !69, line: 666, column: 3)
!786 = !DILocation(line: 667, column: 17, scope: !784)
!787 = !DILocation(line: 667, column: 7, scope: !785)
!788 = !DILocation(line: 669, column: 17, scope: !789)
!789 = distinct !DILexicalBlock(scope: !784, file: !69, line: 668, column: 4)
!790 = !DILocation(line: 669, column: 12, scope: !789)
!791 = !DILocation(line: 669, column: 5, scope: !789)
!792 = !DILocation(line: 674, column: 5, scope: !793)
!793 = distinct !DILexicalBlock(scope: !784, file: !69, line: 673, column: 4)
!794 = !DILocation(line: 679, column: 4, scope: !795)
!795 = distinct !DILexicalBlock(scope: !780, file: !69, line: 678, column: 3)
!796 = !DILocation(line: 683, column: 1, scope: !729)
!797 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 701, type: !798, scopeLine: 702, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!798 = !DISubroutineType(types: !799)
!799 = !{!6, !28, !6, !28}
!800 = !DILocalVariable(name: "factor1", arg: 1, scope: !797, file: !69, line: 701, type: !28)
!801 = !DILocation(line: 701, column: 33, scope: !797)
!802 = !DILocalVariable(name: "factor2", arg: 2, scope: !797, file: !69, line: 701, type: !6)
!803 = !DILocation(line: 701, column: 46, scope: !797)
!804 = !DILocalVariable(name: "denominator", arg: 3, scope: !797, file: !69, line: 701, type: !28)
!805 = !DILocation(line: 701, column: 59, scope: !797)
!806 = !DILocalVariable(name: "s32Result", scope: !797, file: !69, line: 703, type: !16)
!807 = !DILocation(line: 703, column: 6, scope: !797)
!808 = !DILocalVariable(name: "s32Temp1", scope: !797, file: !69, line: 703, type: !16)
!809 = !DILocation(line: 703, column: 21, scope: !797)
!810 = !DILocation(line: 704, column: 14, scope: !797)
!811 = !DILocation(line: 704, column: 24, scope: !797)
!812 = !DILocation(line: 704, column: 22, scope: !797)
!813 = !DILocation(line: 704, column: 12, scope: !797)
!814 = !DILocation(line: 705, column: 5, scope: !815)
!815 = distinct !DILexicalBlock(scope: !797, file: !69, line: 705, column: 5)
!816 = !DILocation(line: 705, column: 16, scope: !815)
!817 = !DILocation(line: 705, column: 5, scope: !797)
!818 = !DILocation(line: 707, column: 6, scope: !819)
!819 = distinct !DILexicalBlock(scope: !820, file: !69, line: 707, column: 6)
!820 = distinct !DILexicalBlock(scope: !815, file: !69, line: 706, column: 2)
!821 = !DILocation(line: 707, column: 16, scope: !819)
!822 = !DILocation(line: 707, column: 6, scope: !820)
!823 = !DILocation(line: 709, column: 4, scope: !824)
!824 = distinct !DILexicalBlock(scope: !819, file: !69, line: 708, column: 3)
!825 = !DILocation(line: 713, column: 4, scope: !826)
!826 = distinct !DILexicalBlock(scope: !819, file: !69, line: 712, column: 3)
!827 = !DILocation(line: 718, column: 14, scope: !828)
!828 = distinct !DILexicalBlock(scope: !815, file: !69, line: 717, column: 2)
!829 = !DILocation(line: 718, column: 28, scope: !828)
!830 = !DILocation(line: 718, column: 38, scope: !828)
!831 = !DILocation(line: 718, column: 37, scope: !828)
!832 = !DILocation(line: 718, column: 53, scope: !828)
!833 = !DILocation(line: 718, column: 51, scope: !828)
!834 = !DILocation(line: 718, column: 24, scope: !828)
!835 = !DILocation(line: 718, column: 66, scope: !828)
!836 = !DILocation(line: 718, column: 12, scope: !828)
!837 = !DILocation(line: 719, column: 16, scope: !828)
!838 = !DILocation(line: 719, column: 25, scope: !828)
!839 = !DILocation(line: 719, column: 24, scope: !828)
!840 = !DILocation(line: 719, column: 41, scope: !828)
!841 = !DILocation(line: 719, column: 51, scope: !828)
!842 = !DILocation(line: 719, column: 50, scope: !828)
!843 = !DILocation(line: 719, column: 38, scope: !828)
!844 = !DILocation(line: 719, column: 13, scope: !828)
!845 = !DILocation(line: 720, column: 6, scope: !846)
!846 = distinct !DILexicalBlock(scope: !828, file: !69, line: 720, column: 6)
!847 = !DILocation(line: 720, column: 16, scope: !846)
!848 = !DILocation(line: 720, column: 6, scope: !828)
!849 = !DILocation(line: 722, column: 7, scope: !850)
!850 = distinct !DILexicalBlock(scope: !851, file: !69, line: 722, column: 7)
!851 = distinct !DILexicalBlock(scope: !846, file: !69, line: 721, column: 3)
!852 = !DILocation(line: 722, column: 17, scope: !850)
!853 = !DILocation(line: 722, column: 7, scope: !851)
!854 = !DILocation(line: 724, column: 17, scope: !855)
!855 = distinct !DILexicalBlock(scope: !850, file: !69, line: 723, column: 4)
!856 = !DILocation(line: 724, column: 12, scope: !855)
!857 = !DILocation(line: 724, column: 5, scope: !855)
!858 = !DILocation(line: 728, column: 5, scope: !859)
!859 = distinct !DILexicalBlock(scope: !850, file: !69, line: 727, column: 4)
!860 = !DILocation(line: 733, column: 4, scope: !861)
!861 = distinct !DILexicalBlock(scope: !846, file: !69, line: 732, column: 3)
!862 = !DILocation(line: 736, column: 1, scope: !797)
!863 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 755, type: !864, scopeLine: 756, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!864 = !DISubroutineType(types: !865)
!865 = !{!28, !6, !28, !6}
!866 = !DILocalVariable(name: "factor1", arg: 1, scope: !863, file: !69, line: 755, type: !6)
!867 = !DILocation(line: 755, column: 33, scope: !863)
!868 = !DILocalVariable(name: "factor2", arg: 2, scope: !863, file: !69, line: 755, type: !28)
!869 = !DILocation(line: 755, column: 46, scope: !863)
!870 = !DILocalVariable(name: "denominator", arg: 3, scope: !863, file: !69, line: 755, type: !6)
!871 = !DILocation(line: 755, column: 59, scope: !863)
!872 = !DILocalVariable(name: "u32Result", scope: !863, file: !69, line: 757, type: !544)
!873 = !DILocation(line: 757, column: 6, scope: !863)
!874 = !DILocalVariable(name: "u32Temp1", scope: !863, file: !69, line: 757, type: !544)
!875 = !DILocation(line: 757, column: 21, scope: !863)
!876 = !DILocalVariable(name: "s32Result", scope: !863, file: !69, line: 758, type: !16)
!877 = !DILocation(line: 758, column: 6, scope: !863)
!878 = !DILocalVariable(name: "s32Temp1", scope: !863, file: !69, line: 758, type: !16)
!879 = !DILocation(line: 758, column: 21, scope: !863)
!880 = !DILocation(line: 759, column: 14, scope: !863)
!881 = !DILocation(line: 759, column: 24, scope: !863)
!882 = !DILocation(line: 759, column: 22, scope: !863)
!883 = !DILocation(line: 759, column: 12, scope: !863)
!884 = !DILocation(line: 761, column: 5, scope: !885)
!885 = distinct !DILexicalBlock(scope: !863, file: !69, line: 761, column: 5)
!886 = !DILocation(line: 761, column: 17, scope: !885)
!887 = !DILocation(line: 761, column: 5, scope: !863)
!888 = !DILocation(line: 763, column: 6, scope: !889)
!889 = distinct !DILexicalBlock(scope: !890, file: !69, line: 763, column: 6)
!890 = distinct !DILexicalBlock(scope: !885, file: !69, line: 762, column: 2)
!891 = !DILocation(line: 763, column: 16, scope: !889)
!892 = !DILocation(line: 763, column: 6, scope: !890)
!893 = !DILocation(line: 765, column: 4, scope: !894)
!894 = distinct !DILexicalBlock(scope: !889, file: !69, line: 764, column: 3)
!895 = !DILocation(line: 769, column: 4, scope: !896)
!896 = distinct !DILexicalBlock(scope: !889, file: !69, line: 768, column: 3)
!897 = !DILocation(line: 774, column: 15, scope: !898)
!898 = distinct !DILexicalBlock(scope: !885, file: !69, line: 773, column: 2)
!899 = !DILocation(line: 774, column: 29, scope: !898)
!900 = !DILocation(line: 774, column: 39, scope: !898)
!901 = !DILocation(line: 774, column: 38, scope: !898)
!902 = !DILocation(line: 774, column: 54, scope: !898)
!903 = !DILocation(line: 774, column: 52, scope: !898)
!904 = !DILocation(line: 774, column: 25, scope: !898)
!905 = !DILocation(line: 774, column: 68, scope: !898)
!906 = !DILocation(line: 774, column: 12, scope: !898)
!907 = !DILocation(line: 775, column: 16, scope: !898)
!908 = !DILocation(line: 775, column: 25, scope: !898)
!909 = !DILocation(line: 775, column: 24, scope: !898)
!910 = !DILocation(line: 775, column: 41, scope: !898)
!911 = !DILocation(line: 775, column: 51, scope: !898)
!912 = !DILocation(line: 775, column: 50, scope: !898)
!913 = !DILocation(line: 775, column: 38, scope: !898)
!914 = !DILocation(line: 775, column: 13, scope: !898)
!915 = !DILocation(line: 776, column: 6, scope: !916)
!916 = distinct !DILexicalBlock(scope: !898, file: !69, line: 776, column: 6)
!917 = !DILocation(line: 776, column: 16, scope: !916)
!918 = !DILocation(line: 776, column: 6, scope: !898)
!919 = !DILocation(line: 778, column: 7, scope: !920)
!920 = distinct !DILexicalBlock(scope: !921, file: !69, line: 778, column: 7)
!921 = distinct !DILexicalBlock(scope: !916, file: !69, line: 777, column: 3)
!922 = !DILocation(line: 778, column: 17, scope: !920)
!923 = !DILocation(line: 778, column: 7, scope: !921)
!924 = !DILocation(line: 780, column: 17, scope: !925)
!925 = distinct !DILexicalBlock(scope: !920, file: !69, line: 779, column: 4)
!926 = !DILocation(line: 780, column: 12, scope: !925)
!927 = !DILocation(line: 780, column: 5, scope: !925)
!928 = !DILocation(line: 784, column: 5, scope: !929)
!929 = distinct !DILexicalBlock(scope: !920, file: !69, line: 783, column: 4)
!930 = !DILocation(line: 789, column: 4, scope: !931)
!931 = distinct !DILexicalBlock(scope: !916, file: !69, line: 788, column: 3)
!932 = !DILocation(line: 792, column: 1, scope: !863)
!933 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 811, type: !934, scopeLine: 812, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!934 = !DISubroutineType(types: !935)
!935 = !{!28, !6, !28, !28}
!936 = !DILocalVariable(name: "factor1", arg: 1, scope: !933, file: !69, line: 811, type: !6)
!937 = !DILocation(line: 811, column: 33, scope: !933)
!938 = !DILocalVariable(name: "factor2", arg: 2, scope: !933, file: !69, line: 811, type: !28)
!939 = !DILocation(line: 811, column: 46, scope: !933)
!940 = !DILocalVariable(name: "denominator", arg: 3, scope: !933, file: !69, line: 811, type: !28)
!941 = !DILocation(line: 811, column: 59, scope: !933)
!942 = !DILocalVariable(name: "s32Result", scope: !933, file: !69, line: 813, type: !16)
!943 = !DILocation(line: 813, column: 6, scope: !933)
!944 = !DILocalVariable(name: "s32Temp1", scope: !933, file: !69, line: 813, type: !16)
!945 = !DILocation(line: 813, column: 21, scope: !933)
!946 = !DILocation(line: 814, column: 14, scope: !933)
!947 = !DILocation(line: 814, column: 24, scope: !933)
!948 = !DILocation(line: 814, column: 22, scope: !933)
!949 = !DILocation(line: 814, column: 12, scope: !933)
!950 = !DILocation(line: 816, column: 5, scope: !951)
!951 = distinct !DILexicalBlock(scope: !933, file: !69, line: 816, column: 5)
!952 = !DILocation(line: 816, column: 17, scope: !951)
!953 = !DILocation(line: 816, column: 5, scope: !933)
!954 = !DILocation(line: 818, column: 6, scope: !955)
!955 = distinct !DILexicalBlock(scope: !956, file: !69, line: 818, column: 6)
!956 = distinct !DILexicalBlock(scope: !951, file: !69, line: 817, column: 2)
!957 = !DILocation(line: 818, column: 16, scope: !955)
!958 = !DILocation(line: 818, column: 6, scope: !956)
!959 = !DILocation(line: 820, column: 4, scope: !960)
!960 = distinct !DILexicalBlock(scope: !955, file: !69, line: 819, column: 3)
!961 = !DILocation(line: 824, column: 4, scope: !962)
!962 = distinct !DILexicalBlock(scope: !955, file: !69, line: 823, column: 3)
!963 = !DILocation(line: 829, column: 15, scope: !964)
!964 = distinct !DILexicalBlock(scope: !951, file: !69, line: 828, column: 2)
!965 = !DILocation(line: 829, column: 29, scope: !964)
!966 = !DILocation(line: 829, column: 39, scope: !964)
!967 = !DILocation(line: 829, column: 38, scope: !964)
!968 = !DILocation(line: 829, column: 54, scope: !964)
!969 = !DILocation(line: 829, column: 52, scope: !964)
!970 = !DILocation(line: 829, column: 25, scope: !964)
!971 = !DILocation(line: 829, column: 68, scope: !964)
!972 = !DILocation(line: 829, column: 12, scope: !964)
!973 = !DILocation(line: 830, column: 16, scope: !964)
!974 = !DILocation(line: 830, column: 25, scope: !964)
!975 = !DILocation(line: 830, column: 24, scope: !964)
!976 = !DILocation(line: 830, column: 41, scope: !964)
!977 = !DILocation(line: 830, column: 51, scope: !964)
!978 = !DILocation(line: 830, column: 50, scope: !964)
!979 = !DILocation(line: 830, column: 38, scope: !964)
!980 = !DILocation(line: 830, column: 13, scope: !964)
!981 = !DILocation(line: 831, column: 6, scope: !982)
!982 = distinct !DILexicalBlock(scope: !964, file: !69, line: 831, column: 6)
!983 = !DILocation(line: 831, column: 16, scope: !982)
!984 = !DILocation(line: 831, column: 6, scope: !964)
!985 = !DILocation(line: 833, column: 7, scope: !986)
!986 = distinct !DILexicalBlock(scope: !987, file: !69, line: 833, column: 7)
!987 = distinct !DILexicalBlock(scope: !982, file: !69, line: 832, column: 3)
!988 = !DILocation(line: 833, column: 17, scope: !986)
!989 = !DILocation(line: 833, column: 7, scope: !987)
!990 = !DILocation(line: 835, column: 17, scope: !991)
!991 = distinct !DILexicalBlock(scope: !986, file: !69, line: 834, column: 4)
!992 = !DILocation(line: 835, column: 12, scope: !991)
!993 = !DILocation(line: 835, column: 5, scope: !991)
!994 = !DILocation(line: 839, column: 5, scope: !995)
!995 = distinct !DILexicalBlock(scope: !986, file: !69, line: 838, column: 4)
!996 = !DILocation(line: 844, column: 4, scope: !997)
!997 = distinct !DILexicalBlock(scope: !982, file: !69, line: 843, column: 3)
!998 = !DILocation(line: 848, column: 1, scope: !933)
!999 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 866, type: !1000, scopeLine: 867, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1000 = !DISubroutineType(types: !1001)
!1001 = !{!28, !28, !28, !28}
!1002 = !DILocalVariable(name: "factor1", arg: 1, scope: !999, file: !69, line: 866, type: !28)
!1003 = !DILocation(line: 866, column: 33, scope: !999)
!1004 = !DILocalVariable(name: "factor2", arg: 2, scope: !999, file: !69, line: 866, type: !28)
!1005 = !DILocation(line: 866, column: 46, scope: !999)
!1006 = !DILocalVariable(name: "denominator", arg: 3, scope: !999, file: !69, line: 866, type: !28)
!1007 = !DILocation(line: 866, column: 59, scope: !999)
!1008 = !DILocalVariable(name: "u32Temp1", scope: !999, file: !69, line: 868, type: !544)
!1009 = !DILocation(line: 868, column: 6, scope: !999)
!1010 = !DILocalVariable(name: "u16TempDenom", scope: !999, file: !69, line: 869, type: !28)
!1011 = !DILocation(line: 869, column: 6, scope: !999)
!1012 = !DILocation(line: 871, column: 5, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !999, file: !69, line: 871, column: 5)
!1014 = !DILocation(line: 871, column: 17, scope: !1013)
!1015 = !DILocation(line: 871, column: 5, scope: !999)
!1016 = !DILocation(line: 873, column: 3, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !1013, file: !69, line: 872, column: 2)
!1018 = !DILocation(line: 877, column: 14, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1013, file: !69, line: 876, column: 2)
!1020 = !DILocation(line: 877, column: 24, scope: !1019)
!1021 = !DILocation(line: 877, column: 22, scope: !1019)
!1022 = !DILocation(line: 877, column: 12, scope: !1019)
!1023 = !DILocation(line: 878, column: 18, scope: !1019)
!1024 = !DILocation(line: 878, column: 30, scope: !1019)
!1025 = !DILocation(line: 878, column: 16, scope: !1019)
!1026 = !DILocation(line: 879, column: 14, scope: !1019)
!1027 = !DILocation(line: 879, column: 25, scope: !1019)
!1028 = !DILocation(line: 879, column: 23, scope: !1019)
!1029 = !DILocation(line: 879, column: 12, scope: !1019)
!1030 = !DILocation(line: 880, column: 14, scope: !1019)
!1031 = !DILocation(line: 880, column: 25, scope: !1019)
!1032 = !DILocation(line: 880, column: 23, scope: !1019)
!1033 = !DILocation(line: 880, column: 12, scope: !1019)
!1034 = !DILocation(line: 881, column: 6, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1019, file: !69, line: 881, column: 6)
!1036 = !DILocation(line: 881, column: 15, scope: !1035)
!1037 = !DILocation(line: 881, column: 6, scope: !1019)
!1038 = !DILocation(line: 883, column: 12, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1035, file: !69, line: 882, column: 3)
!1040 = !DILocation(line: 883, column: 21, scope: !1039)
!1041 = !DILocation(line: 883, column: 11, scope: !1039)
!1042 = !DILocation(line: 883, column: 4, scope: !1039)
!1043 = !DILocation(line: 888, column: 4, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1035, file: !69, line: 887, column: 3)
!1045 = !DILocation(line: 893, column: 1, scope: !999)
!1046 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 910, type: !1047, scopeLine: 911, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1047 = !DISubroutineType(types: !1048)
!1048 = !{!28, !28, !28, !544}
!1049 = !DILocalVariable(name: "factor1", arg: 1, scope: !1046, file: !69, line: 910, type: !28)
!1050 = !DILocation(line: 910, column: 33, scope: !1046)
!1051 = !DILocalVariable(name: "factor2", arg: 2, scope: !1046, file: !69, line: 910, type: !28)
!1052 = !DILocation(line: 910, column: 46, scope: !1046)
!1053 = !DILocalVariable(name: "denominator", arg: 3, scope: !1046, file: !69, line: 910, type: !544)
!1054 = !DILocation(line: 910, column: 59, scope: !1046)
!1055 = !DILocalVariable(name: "u32Temp1", scope: !1046, file: !69, line: 912, type: !544)
!1056 = !DILocation(line: 912, column: 6, scope: !1046)
!1057 = !DILocation(line: 913, column: 5, scope: !1058)
!1058 = distinct !DILexicalBlock(scope: !1046, file: !69, line: 913, column: 5)
!1059 = !DILocation(line: 913, column: 17, scope: !1058)
!1060 = !DILocation(line: 913, column: 5, scope: !1046)
!1061 = !DILocation(line: 915, column: 3, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1058, file: !69, line: 914, column: 2)
!1063 = !DILocation(line: 919, column: 15, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1058, file: !69, line: 918, column: 2)
!1065 = !DILocation(line: 919, column: 25, scope: !1064)
!1066 = !DILocation(line: 919, column: 23, scope: !1064)
!1067 = !DILocation(line: 919, column: 36, scope: !1064)
!1068 = !DILocation(line: 919, column: 34, scope: !1064)
!1069 = !DILocation(line: 919, column: 12, scope: !1064)
!1070 = !DILocation(line: 920, column: 8, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1064, file: !69, line: 920, column: 6)
!1072 = !DILocation(line: 920, column: 18, scope: !1071)
!1073 = !DILocation(line: 920, column: 16, scope: !1071)
!1074 = !DILocation(line: 920, column: 28, scope: !1071)
!1075 = !DILocation(line: 920, column: 40, scope: !1071)
!1076 = !DILocation(line: 920, column: 39, scope: !1071)
!1077 = !DILocation(line: 920, column: 26, scope: !1071)
!1078 = !DILocation(line: 920, column: 53, scope: !1071)
!1079 = !DILocation(line: 920, column: 64, scope: !1071)
!1080 = !DILocation(line: 920, column: 50, scope: !1071)
!1081 = !DILocation(line: 920, column: 6, scope: !1064)
!1082 = !DILocation(line: 922, column: 12, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1071, file: !69, line: 921, column: 3)
!1084 = !DILocation(line: 923, column: 3, scope: !1083)
!1085 = !DILocation(line: 924, column: 6, scope: !1086)
!1086 = distinct !DILexicalBlock(scope: !1064, file: !69, line: 924, column: 6)
!1087 = !DILocation(line: 924, column: 15, scope: !1086)
!1088 = !DILocation(line: 924, column: 6, scope: !1064)
!1089 = !DILocation(line: 926, column: 12, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1086, file: !69, line: 925, column: 3)
!1091 = !DILocation(line: 926, column: 21, scope: !1090)
!1092 = !DILocation(line: 926, column: 11, scope: !1090)
!1093 = !DILocation(line: 926, column: 4, scope: !1090)
!1094 = !DILocation(line: 930, column: 4, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1086, file: !69, line: 929, column: 3)
!1096 = !DILocation(line: 933, column: 1, scope: !1046)
!1097 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 950, type: !1098, scopeLine: 951, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1098 = !DISubroutineType(types: !1099)
!1099 = !{!544, !544, !28}
!1100 = !DILocalVariable(name: "x_value", arg: 1, scope: !1097, file: !69, line: 950, type: !544)
!1101 = !DILocation(line: 950, column: 25, scope: !1097)
!1102 = !DILocalVariable(name: "y_value", arg: 2, scope: !1097, file: !69, line: 950, type: !28)
!1103 = !DILocation(line: 950, column: 38, scope: !1097)
!1104 = !DILocalVariable(name: "u32Temp1", scope: !1097, file: !69, line: 952, type: !544)
!1105 = !DILocation(line: 952, column: 6, scope: !1097)
!1106 = !DILocation(line: 953, column: 5, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1097, file: !69, line: 953, column: 5)
!1108 = !DILocation(line: 953, column: 13, scope: !1107)
!1109 = !DILocation(line: 953, column: 5, scope: !1097)
!1110 = !DILocation(line: 955, column: 3, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !1107, file: !69, line: 954, column: 2)
!1112 = !DILocation(line: 959, column: 15, scope: !1113)
!1113 = distinct !DILexicalBlock(scope: !1107, file: !69, line: 958, column: 2)
!1114 = !DILocation(line: 959, column: 26, scope: !1113)
!1115 = !DILocation(line: 959, column: 34, scope: !1113)
!1116 = !DILocation(line: 959, column: 33, scope: !1113)
!1117 = !DILocation(line: 959, column: 45, scope: !1113)
!1118 = !DILocation(line: 959, column: 43, scope: !1113)
!1119 = !DILocation(line: 959, column: 23, scope: !1113)
!1120 = !DILocation(line: 959, column: 54, scope: !1113)
!1121 = !DILocation(line: 959, column: 12, scope: !1113)
!1122 = !DILocation(line: 960, column: 15, scope: !1113)
!1123 = !DILocation(line: 960, column: 23, scope: !1113)
!1124 = !DILocation(line: 960, column: 22, scope: !1113)
!1125 = !DILocation(line: 960, column: 35, scope: !1113)
!1126 = !DILocation(line: 960, column: 44, scope: !1113)
!1127 = !DILocation(line: 960, column: 43, scope: !1113)
!1128 = !DILocation(line: 960, column: 32, scope: !1113)
!1129 = !DILocation(line: 960, column: 12, scope: !1113)
!1130 = !DILocation(line: 961, column: 10, scope: !1113)
!1131 = !DILocation(line: 961, column: 3, scope: !1113)
!1132 = !DILocation(line: 963, column: 1, scope: !1097)
!1133 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 981, type: !1134, scopeLine: 982, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1134 = !DISubroutineType(types: !1135)
!1135 = !{!6, !6, !6, !6}
!1136 = !DILocalVariable(name: "fak1", arg: 1, scope: !1133, file: !69, line: 981, type: !6)
!1137 = !DILocation(line: 981, column: 33, scope: !1133)
!1138 = !DILocalVariable(name: "fak2", arg: 2, scope: !1133, file: !69, line: 981, type: !6)
!1139 = !DILocation(line: 981, column: 43, scope: !1133)
!1140 = !DILocalVariable(name: "div", arg: 3, scope: !1133, file: !69, line: 981, type: !6)
!1141 = !DILocation(line: 981, column: 53, scope: !1133)
!1142 = !DILocalVariable(name: "s32Temp1", scope: !1133, file: !69, line: 983, type: !16)
!1143 = !DILocation(line: 983, column: 6, scope: !1133)
!1144 = !DILocalVariable(name: "s32Temp2", scope: !1133, file: !69, line: 983, type: !16)
!1145 = !DILocation(line: 983, column: 20, scope: !1133)
!1146 = !DILocalVariable(name: "s32Temp3", scope: !1133, file: !69, line: 983, type: !16)
!1147 = !DILocation(line: 983, column: 34, scope: !1133)
!1148 = !DILocation(line: 984, column: 13, scope: !1133)
!1149 = !DILocation(line: 984, column: 20, scope: !1133)
!1150 = !DILocation(line: 984, column: 18, scope: !1133)
!1151 = !DILocation(line: 984, column: 11, scope: !1133)
!1152 = !DILocation(line: 985, column: 5, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1133, file: !69, line: 985, column: 5)
!1154 = !DILocation(line: 985, column: 9, scope: !1153)
!1155 = !DILocation(line: 985, column: 5, scope: !1133)
!1156 = !DILocation(line: 987, column: 6, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1158, file: !69, line: 987, column: 6)
!1158 = distinct !DILexicalBlock(scope: !1153, file: !69, line: 986, column: 2)
!1159 = !DILocation(line: 987, column: 15, scope: !1157)
!1160 = !DILocation(line: 987, column: 6, scope: !1158)
!1161 = !DILocation(line: 989, column: 4, scope: !1162)
!1162 = distinct !DILexicalBlock(scope: !1157, file: !69, line: 988, column: 3)
!1163 = !DILocation(line: 993, column: 4, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1157, file: !69, line: 992, column: 3)
!1165 = !DILocation(line: 998, column: 15, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1153, file: !69, line: 997, column: 2)
!1167 = !DILocation(line: 998, column: 28, scope: !1166)
!1168 = !DILocation(line: 998, column: 39, scope: !1166)
!1169 = !DILocation(line: 998, column: 37, scope: !1166)
!1170 = !DILocation(line: 998, column: 46, scope: !1166)
!1171 = !DILocation(line: 998, column: 44, scope: !1166)
!1172 = !DILocation(line: 998, column: 24, scope: !1166)
!1173 = !DILocation(line: 998, column: 52, scope: !1166)
!1174 = !DILocation(line: 998, column: 12, scope: !1166)
!1175 = !DILocation(line: 999, column: 15, scope: !1166)
!1176 = !DILocation(line: 999, column: 24, scope: !1166)
!1177 = !DILocation(line: 999, column: 23, scope: !1166)
!1178 = !DILocation(line: 999, column: 32, scope: !1166)
!1179 = !DILocation(line: 999, column: 41, scope: !1166)
!1180 = !DILocation(line: 999, column: 40, scope: !1166)
!1181 = !DILocation(line: 999, column: 29, scope: !1166)
!1182 = !DILocation(line: 999, column: 12, scope: !1166)
!1183 = !DILocation(line: 1000, column: 6, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1166, file: !69, line: 1000, column: 6)
!1185 = !DILocation(line: 1000, column: 15, scope: !1184)
!1186 = !DILocation(line: 1000, column: 6, scope: !1166)
!1187 = !DILocation(line: 1002, column: 7, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1189, file: !69, line: 1002, column: 7)
!1189 = distinct !DILexicalBlock(scope: !1184, file: !69, line: 1001, column: 3)
!1190 = !DILocation(line: 1002, column: 16, scope: !1188)
!1191 = !DILocation(line: 1002, column: 7, scope: !1189)
!1192 = !DILocation(line: 1004, column: 17, scope: !1193)
!1193 = distinct !DILexicalBlock(scope: !1188, file: !69, line: 1003, column: 4)
!1194 = !DILocation(line: 1004, column: 12, scope: !1193)
!1195 = !DILocation(line: 1004, column: 5, scope: !1193)
!1196 = !DILocation(line: 1008, column: 5, scope: !1197)
!1197 = distinct !DILexicalBlock(scope: !1188, file: !69, line: 1007, column: 4)
!1198 = !DILocation(line: 1013, column: 4, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1184, file: !69, line: 1012, column: 3)
!1200 = !DILocation(line: 1016, column: 1, scope: !1133)
!1201 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1034, type: !1202, scopeLine: 1035, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1202 = !DISubroutineType(types: !1203)
!1203 = !{!6, !6, !6, !28}
!1204 = !DILocalVariable(name: "data1", arg: 1, scope: !1201, file: !69, line: 1034, type: !6)
!1205 = !DILocation(line: 1034, column: 33, scope: !1201)
!1206 = !DILocalVariable(name: "data2", arg: 2, scope: !1201, file: !69, line: 1034, type: !6)
!1207 = !DILocation(line: 1034, column: 43, scope: !1201)
!1208 = !DILocalVariable(name: "denominator", arg: 3, scope: !1201, file: !69, line: 1034, type: !28)
!1209 = !DILocation(line: 1034, column: 53, scope: !1201)
!1210 = !DILocalVariable(name: "s32Result", scope: !1201, file: !69, line: 1036, type: !16)
!1211 = !DILocation(line: 1036, column: 6, scope: !1201)
!1212 = !DILocalVariable(name: "s32Temp1", scope: !1201, file: !69, line: 1036, type: !16)
!1213 = !DILocation(line: 1036, column: 21, scope: !1201)
!1214 = !DILocation(line: 1037, column: 14, scope: !1201)
!1215 = !DILocation(line: 1037, column: 22, scope: !1201)
!1216 = !DILocation(line: 1037, column: 20, scope: !1201)
!1217 = !DILocation(line: 1037, column: 12, scope: !1201)
!1218 = !DILocation(line: 1039, column: 5, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1201, file: !69, line: 1039, column: 5)
!1220 = !DILocation(line: 1039, column: 17, scope: !1219)
!1221 = !DILocation(line: 1039, column: 5, scope: !1201)
!1222 = !DILocation(line: 1041, column: 6, scope: !1223)
!1223 = distinct !DILexicalBlock(scope: !1224, file: !69, line: 1041, column: 6)
!1224 = distinct !DILexicalBlock(scope: !1219, file: !69, line: 1040, column: 2)
!1225 = !DILocation(line: 1041, column: 16, scope: !1223)
!1226 = !DILocation(line: 1041, column: 6, scope: !1224)
!1227 = !DILocation(line: 1043, column: 4, scope: !1228)
!1228 = distinct !DILexicalBlock(scope: !1223, file: !69, line: 1042, column: 3)
!1229 = !DILocation(line: 1045, column: 11, scope: !1230)
!1230 = distinct !DILexicalBlock(scope: !1223, file: !69, line: 1045, column: 11)
!1231 = !DILocation(line: 1045, column: 21, scope: !1230)
!1232 = !DILocation(line: 1045, column: 11, scope: !1223)
!1233 = !DILocation(line: 1047, column: 4, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1230, file: !69, line: 1046, column: 3)
!1235 = !DILocation(line: 1051, column: 4, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1230, file: !69, line: 1050, column: 3)
!1237 = !DILocation(line: 1056, column: 15, scope: !1238)
!1238 = distinct !DILexicalBlock(scope: !1219, file: !69, line: 1055, column: 2)
!1239 = !DILocation(line: 1056, column: 28, scope: !1238)
!1240 = !DILocation(line: 1056, column: 38, scope: !1238)
!1241 = !DILocation(line: 1056, column: 37, scope: !1238)
!1242 = !DILocation(line: 1056, column: 51, scope: !1238)
!1243 = !DILocation(line: 1056, column: 50, scope: !1238)
!1244 = !DILocation(line: 1056, column: 25, scope: !1238)
!1245 = !DILocation(line: 1056, column: 64, scope: !1238)
!1246 = !DILocation(line: 1056, column: 12, scope: !1238)
!1247 = !DILocation(line: 1057, column: 16, scope: !1238)
!1248 = !DILocation(line: 1057, column: 25, scope: !1238)
!1249 = !DILocation(line: 1057, column: 24, scope: !1238)
!1250 = !DILocation(line: 1057, column: 41, scope: !1238)
!1251 = !DILocation(line: 1057, column: 51, scope: !1238)
!1252 = !DILocation(line: 1057, column: 50, scope: !1238)
!1253 = !DILocation(line: 1057, column: 38, scope: !1238)
!1254 = !DILocation(line: 1057, column: 13, scope: !1238)
!1255 = !DILocation(line: 1058, column: 6, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1238, file: !69, line: 1058, column: 6)
!1257 = !DILocation(line: 1058, column: 16, scope: !1256)
!1258 = !DILocation(line: 1058, column: 6, scope: !1238)
!1259 = !DILocation(line: 1060, column: 7, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1261, file: !69, line: 1060, column: 7)
!1261 = distinct !DILexicalBlock(scope: !1256, file: !69, line: 1059, column: 3)
!1262 = !DILocation(line: 1060, column: 17, scope: !1260)
!1263 = !DILocation(line: 1060, column: 7, scope: !1261)
!1264 = !DILocation(line: 1062, column: 17, scope: !1265)
!1265 = distinct !DILexicalBlock(scope: !1260, file: !69, line: 1061, column: 4)
!1266 = !DILocation(line: 1062, column: 12, scope: !1265)
!1267 = !DILocation(line: 1062, column: 5, scope: !1265)
!1268 = !DILocation(line: 1066, column: 5, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1260, file: !69, line: 1065, column: 4)
!1270 = !DILocation(line: 1071, column: 4, scope: !1271)
!1271 = distinct !DILexicalBlock(scope: !1256, file: !69, line: 1070, column: 3)
!1272 = !DILocation(line: 1075, column: 1, scope: !1201)
!1273 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1092, type: !1274, scopeLine: 1093, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1274 = !DISubroutineType(types: !1275)
!1275 = !{!544, !544, !16}
!1276 = !DILocalVariable(name: "numerator", arg: 1, scope: !1273, file: !69, line: 1092, type: !544)
!1277 = !DILocation(line: 1092, column: 25, scope: !1273)
!1278 = !DILocalVariable(name: "denominator", arg: 2, scope: !1273, file: !69, line: 1092, type: !16)
!1279 = !DILocation(line: 1092, column: 40, scope: !1273)
!1280 = !DILocalVariable(name: "u32Temp1", scope: !1273, file: !69, line: 1094, type: !544)
!1281 = !DILocation(line: 1094, column: 6, scope: !1273)
!1282 = !DILocation(line: 1095, column: 5, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1273, file: !69, line: 1095, column: 5)
!1284 = !DILocation(line: 1095, column: 17, scope: !1283)
!1285 = !DILocation(line: 1095, column: 5, scope: !1273)
!1286 = !DILocation(line: 1097, column: 3, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1283, file: !69, line: 1096, column: 2)
!1288 = !DILocation(line: 1101, column: 6, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1290, file: !69, line: 1101, column: 6)
!1290 = distinct !DILexicalBlock(scope: !1283, file: !69, line: 1100, column: 2)
!1291 = !DILocation(line: 1101, column: 18, scope: !1289)
!1292 = !DILocation(line: 1101, column: 6, scope: !1290)
!1293 = !DILocation(line: 1103, column: 4, scope: !1294)
!1294 = distinct !DILexicalBlock(scope: !1289, file: !69, line: 1102, column: 3)
!1295 = !DILocation(line: 1107, column: 16, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1289, file: !69, line: 1106, column: 3)
!1297 = !DILocation(line: 1107, column: 30, scope: !1296)
!1298 = !DILocation(line: 1107, column: 40, scope: !1296)
!1299 = !DILocation(line: 1107, column: 39, scope: !1296)
!1300 = !DILocation(line: 1107, column: 55, scope: !1296)
!1301 = !DILocation(line: 1107, column: 53, scope: !1296)
!1302 = !DILocation(line: 1107, column: 26, scope: !1296)
!1303 = !DILocation(line: 1107, column: 68, scope: !1296)
!1304 = !DILocation(line: 1107, column: 13, scope: !1296)
!1305 = !DILocation(line: 1108, column: 16, scope: !1296)
!1306 = !DILocation(line: 1108, column: 25, scope: !1296)
!1307 = !DILocation(line: 1108, column: 24, scope: !1296)
!1308 = !DILocation(line: 1108, column: 41, scope: !1296)
!1309 = !DILocation(line: 1108, column: 51, scope: !1296)
!1310 = !DILocation(line: 1108, column: 50, scope: !1296)
!1311 = !DILocation(line: 1108, column: 38, scope: !1296)
!1312 = !DILocation(line: 1108, column: 13, scope: !1296)
!1313 = !DILocation(line: 1109, column: 11, scope: !1296)
!1314 = !DILocation(line: 1109, column: 4, scope: !1296)
!1315 = !DILocation(line: 1112, column: 1, scope: !1273)
!1316 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1129, type: !1317, scopeLine: 1130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1317 = !DISubroutineType(types: !1318)
!1318 = !{!544, !16, !544}
!1319 = !DILocalVariable(name: "numerator", arg: 1, scope: !1316, file: !69, line: 1129, type: !16)
!1320 = !DILocation(line: 1129, column: 25, scope: !1316)
!1321 = !DILocalVariable(name: "denominator", arg: 2, scope: !1316, file: !69, line: 1129, type: !544)
!1322 = !DILocation(line: 1129, column: 40, scope: !1316)
!1323 = !DILocalVariable(name: "s32Temp1", scope: !1316, file: !69, line: 1131, type: !16)
!1324 = !DILocation(line: 1131, column: 6, scope: !1316)
!1325 = !DILocation(line: 1132, column: 5, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1316, file: !69, line: 1132, column: 5)
!1327 = !DILocation(line: 1132, column: 17, scope: !1326)
!1328 = !DILocation(line: 1132, column: 5, scope: !1316)
!1329 = !DILocation(line: 1134, column: 6, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1331, file: !69, line: 1134, column: 6)
!1331 = distinct !DILexicalBlock(scope: !1326, file: !69, line: 1133, column: 2)
!1332 = !DILocation(line: 1134, column: 16, scope: !1330)
!1333 = !DILocation(line: 1134, column: 6, scope: !1331)
!1334 = !DILocation(line: 1136, column: 4, scope: !1335)
!1335 = distinct !DILexicalBlock(scope: !1330, file: !69, line: 1135, column: 3)
!1336 = !DILocation(line: 1140, column: 4, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1330, file: !69, line: 1139, column: 3)
!1338 = !DILocation(line: 1145, column: 6, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1340, file: !69, line: 1145, column: 6)
!1340 = distinct !DILexicalBlock(scope: !1326, file: !69, line: 1144, column: 2)
!1341 = !DILocation(line: 1145, column: 16, scope: !1339)
!1342 = !DILocation(line: 1145, column: 6, scope: !1340)
!1343 = !DILocation(line: 1147, column: 17, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1339, file: !69, line: 1146, column: 3)
!1345 = !DILocation(line: 1147, column: 31, scope: !1344)
!1346 = !DILocation(line: 1147, column: 41, scope: !1344)
!1347 = !DILocation(line: 1147, column: 40, scope: !1344)
!1348 = !DILocation(line: 1147, column: 56, scope: !1344)
!1349 = !DILocation(line: 1147, column: 54, scope: !1344)
!1350 = !DILocation(line: 1147, column: 27, scope: !1344)
!1351 = !DILocation(line: 1147, column: 69, scope: !1344)
!1352 = !DILocation(line: 1147, column: 13, scope: !1344)
!1353 = !DILocation(line: 1148, column: 13, scope: !1344)
!1354 = !DILocation(line: 1148, column: 23, scope: !1344)
!1355 = !DILocation(line: 1148, column: 22, scope: !1344)
!1356 = !DILocation(line: 1148, column: 39, scope: !1344)
!1357 = !DILocation(line: 1148, column: 48, scope: !1344)
!1358 = !DILocation(line: 1148, column: 47, scope: !1344)
!1359 = !DILocation(line: 1148, column: 36, scope: !1344)
!1360 = !DILocation(line: 1148, column: 4, scope: !1344)
!1361 = !DILocation(line: 1152, column: 4, scope: !1362)
!1362 = distinct !DILexicalBlock(scope: !1339, file: !69, line: 1151, column: 3)
!1363 = !DILocation(line: 1155, column: 1, scope: !1316)
!1364 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1172, type: !1365, scopeLine: 1173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1365 = !DISubroutineType(types: !1366)
!1366 = !{!544, !16, !16}
!1367 = !DILocalVariable(name: "numerator", arg: 1, scope: !1364, file: !69, line: 1172, type: !16)
!1368 = !DILocation(line: 1172, column: 25, scope: !1364)
!1369 = !DILocalVariable(name: "denominator", arg: 2, scope: !1364, file: !69, line: 1172, type: !16)
!1370 = !DILocation(line: 1172, column: 40, scope: !1364)
!1371 = !DILocalVariable(name: "u32Temp1", scope: !1364, file: !69, line: 1174, type: !544)
!1372 = !DILocation(line: 1174, column: 6, scope: !1364)
!1373 = !DILocalVariable(name: "u32Temp2", scope: !1364, file: !69, line: 1174, type: !544)
!1374 = !DILocation(line: 1174, column: 20, scope: !1364)
!1375 = !DILocation(line: 1175, column: 5, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1364, file: !69, line: 1175, column: 5)
!1377 = !DILocation(line: 1175, column: 17, scope: !1376)
!1378 = !DILocation(line: 1175, column: 5, scope: !1364)
!1379 = !DILocation(line: 1177, column: 6, scope: !1380)
!1380 = distinct !DILexicalBlock(scope: !1381, file: !69, line: 1177, column: 6)
!1381 = distinct !DILexicalBlock(scope: !1376, file: !69, line: 1176, column: 2)
!1382 = !DILocation(line: 1177, column: 16, scope: !1380)
!1383 = !DILocation(line: 1177, column: 6, scope: !1381)
!1384 = !DILocation(line: 1179, column: 4, scope: !1385)
!1385 = distinct !DILexicalBlock(scope: !1380, file: !69, line: 1178, column: 3)
!1386 = !DILocation(line: 1183, column: 4, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1380, file: !69, line: 1182, column: 3)
!1388 = !DILocation(line: 1188, column: 6, scope: !1389)
!1389 = distinct !DILexicalBlock(scope: !1390, file: !69, line: 1188, column: 6)
!1390 = distinct !DILexicalBlock(scope: !1376, file: !69, line: 1187, column: 2)
!1391 = !DILocation(line: 1188, column: 16, scope: !1389)
!1392 = !DILocation(line: 1188, column: 6, scope: !1390)
!1393 = !DILocation(line: 1190, column: 7, scope: !1394)
!1394 = distinct !DILexicalBlock(scope: !1395, file: !69, line: 1190, column: 7)
!1395 = distinct !DILexicalBlock(scope: !1389, file: !69, line: 1189, column: 3)
!1396 = !DILocation(line: 1190, column: 17, scope: !1394)
!1397 = !DILocation(line: 1190, column: 7, scope: !1395)
!1398 = !DILocation(line: 1192, column: 5, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1394, file: !69, line: 1191, column: 4)
!1400 = !DILocation(line: 1196, column: 8, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1402, file: !69, line: 1196, column: 8)
!1402 = distinct !DILexicalBlock(scope: !1394, file: !69, line: 1195, column: 4)
!1403 = !DILocation(line: 1196, column: 20, scope: !1401)
!1404 = !DILocation(line: 1196, column: 8, scope: !1402)
!1405 = !DILocation(line: 1198, column: 6, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1197, column: 5)
!1407 = !DILocation(line: 1202, column: 18, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1201, column: 5)
!1409 = !DILocation(line: 1202, column: 32, scope: !1408)
!1410 = !DILocation(line: 1202, column: 42, scope: !1408)
!1411 = !DILocation(line: 1202, column: 41, scope: !1408)
!1412 = !DILocation(line: 1202, column: 57, scope: !1408)
!1413 = !DILocation(line: 1202, column: 55, scope: !1408)
!1414 = !DILocation(line: 1202, column: 28, scope: !1408)
!1415 = !DILocation(line: 1202, column: 71, scope: !1408)
!1416 = !DILocation(line: 1202, column: 15, scope: !1408)
!1417 = !DILocation(line: 1203, column: 18, scope: !1408)
!1418 = !DILocation(line: 1203, column: 29, scope: !1408)
!1419 = !DILocation(line: 1203, column: 27, scope: !1408)
!1420 = !DILocation(line: 1203, column: 45, scope: !1408)
!1421 = !DILocation(line: 1203, column: 57, scope: !1408)
!1422 = !DILocation(line: 1203, column: 55, scope: !1408)
!1423 = !DILocation(line: 1203, column: 42, scope: !1408)
!1424 = !DILocation(line: 1203, column: 15, scope: !1408)
!1425 = !DILocation(line: 1204, column: 13, scope: !1408)
!1426 = !DILocation(line: 1204, column: 6, scope: !1408)
!1427 = !DILocation(line: 1210, column: 7, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1429, file: !69, line: 1210, column: 7)
!1429 = distinct !DILexicalBlock(scope: !1389, file: !69, line: 1209, column: 3)
!1430 = !DILocation(line: 1210, column: 19, scope: !1428)
!1431 = !DILocation(line: 1210, column: 7, scope: !1429)
!1432 = !DILocation(line: 1212, column: 5, scope: !1433)
!1433 = distinct !DILexicalBlock(scope: !1428, file: !69, line: 1211, column: 4)
!1434 = !DILocation(line: 1216, column: 18, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1428, file: !69, line: 1215, column: 4)
!1436 = !DILocation(line: 1216, column: 17, scope: !1435)
!1437 = !DILocation(line: 1216, column: 15, scope: !1435)
!1438 = !DILocation(line: 1217, column: 20, scope: !1435)
!1439 = !DILocation(line: 1217, column: 19, scope: !1435)
!1440 = !DILocation(line: 1217, column: 17, scope: !1435)
!1441 = !DILocation(line: 1218, column: 17, scope: !1435)
!1442 = !DILocation(line: 1218, column: 31, scope: !1435)
!1443 = !DILocation(line: 1218, column: 41, scope: !1435)
!1444 = !DILocation(line: 1218, column: 40, scope: !1435)
!1445 = !DILocation(line: 1218, column: 56, scope: !1435)
!1446 = !DILocation(line: 1218, column: 54, scope: !1435)
!1447 = !DILocation(line: 1218, column: 27, scope: !1435)
!1448 = !DILocation(line: 1218, column: 70, scope: !1435)
!1449 = !DILocation(line: 1218, column: 14, scope: !1435)
!1450 = !DILocation(line: 1219, column: 17, scope: !1435)
!1451 = !DILocation(line: 1219, column: 28, scope: !1435)
!1452 = !DILocation(line: 1219, column: 26, scope: !1435)
!1453 = !DILocation(line: 1219, column: 44, scope: !1435)
!1454 = !DILocation(line: 1219, column: 56, scope: !1435)
!1455 = !DILocation(line: 1219, column: 54, scope: !1435)
!1456 = !DILocation(line: 1219, column: 41, scope: !1435)
!1457 = !DILocation(line: 1219, column: 14, scope: !1435)
!1458 = !DILocation(line: 1220, column: 12, scope: !1435)
!1459 = !DILocation(line: 1220, column: 5, scope: !1435)
!1460 = !DILocation(line: 1225, column: 1, scope: !1364)
!1461 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1242, type: !1462, scopeLine: 1243, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1462 = !DISubroutineType(types: !1463)
!1463 = !{!544, !544, !544}
!1464 = !DILocalVariable(name: "numerator", arg: 1, scope: !1461, file: !69, line: 1242, type: !544)
!1465 = !DILocation(line: 1242, column: 25, scope: !1461)
!1466 = !DILocalVariable(name: "denominator", arg: 2, scope: !1461, file: !69, line: 1242, type: !544)
!1467 = !DILocation(line: 1242, column: 40, scope: !1461)
!1468 = !DILocalVariable(name: "u32Temp1", scope: !1461, file: !69, line: 1245, type: !544)
!1469 = !DILocation(line: 1245, column: 6, scope: !1461)
!1470 = !DILocalVariable(name: "u32Temp2", scope: !1461, file: !69, line: 1245, type: !544)
!1471 = !DILocation(line: 1245, column: 20, scope: !1461)
!1472 = !DILocalVariable(name: "u32Temp3", scope: !1461, file: !69, line: 1245, type: !544)
!1473 = !DILocation(line: 1245, column: 34, scope: !1461)
!1474 = !DILocalVariable(name: "numerator_old", scope: !1461, file: !69, line: 1245, type: !544)
!1475 = !DILocation(line: 1245, column: 48, scope: !1461)
!1476 = !DILocation(line: 1246, column: 5, scope: !1477)
!1477 = distinct !DILexicalBlock(scope: !1461, file: !69, line: 1246, column: 5)
!1478 = !DILocation(line: 1246, column: 16, scope: !1477)
!1479 = !DILocation(line: 1246, column: 5, scope: !1461)
!1480 = !DILocation(line: 1248, column: 3, scope: !1481)
!1481 = distinct !DILexicalBlock(scope: !1477, file: !69, line: 1247, column: 2)
!1482 = !DILocation(line: 1252, column: 14, scope: !1483)
!1483 = distinct !DILexicalBlock(scope: !1477, file: !69, line: 1251, column: 2)
!1484 = !DILocation(line: 1252, column: 26, scope: !1483)
!1485 = !DILocation(line: 1252, column: 41, scope: !1483)
!1486 = !DILocation(line: 1252, column: 51, scope: !1483)
!1487 = !DILocation(line: 1252, column: 50, scope: !1483)
!1488 = !DILocation(line: 1252, column: 38, scope: !1483)
!1489 = !DILocation(line: 1252, column: 24, scope: !1483)
!1490 = !DILocation(line: 1252, column: 12, scope: !1483)
!1491 = !DILocation(line: 1253, column: 7, scope: !1492)
!1492 = distinct !DILexicalBlock(scope: !1483, file: !69, line: 1253, column: 6)
!1493 = !DILocation(line: 1253, column: 16, scope: !1492)
!1494 = !DILocation(line: 1253, column: 24, scope: !1492)
!1495 = !DILocation(line: 1253, column: 6, scope: !1483)
!1496 = !DILocation(line: 1255, column: 16, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1492, file: !69, line: 1254, column: 3)
!1498 = !DILocation(line: 1255, column: 27, scope: !1497)
!1499 = !DILocation(line: 1255, column: 13, scope: !1497)
!1500 = !DILocation(line: 1256, column: 3, scope: !1497)
!1501 = !DILocation(line: 1259, column: 16, scope: !1502)
!1502 = distinct !DILexicalBlock(scope: !1492, file: !69, line: 1258, column: 3)
!1503 = !DILocation(line: 1259, column: 27, scope: !1502)
!1504 = !DILocation(line: 1259, column: 32, scope: !1502)
!1505 = !DILocation(line: 1259, column: 13, scope: !1502)
!1506 = !DILocation(line: 1262, column: 6, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1483, file: !69, line: 1262, column: 6)
!1508 = !DILocation(line: 1262, column: 17, scope: !1507)
!1509 = !DILocation(line: 1262, column: 15, scope: !1507)
!1510 = !DILocation(line: 1262, column: 6, scope: !1483)
!1511 = !DILocation(line: 1264, column: 12, scope: !1512)
!1512 = distinct !DILexicalBlock(scope: !1507, file: !69, line: 1263, column: 3)
!1513 = !DILocation(line: 1264, column: 22, scope: !1512)
!1514 = !DILocation(line: 1264, column: 21, scope: !1512)
!1515 = !DILocation(line: 1264, column: 4, scope: !1512)
!1516 = !DILocation(line: 1268, column: 13, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1507, file: !69, line: 1267, column: 3)
!1518 = !DILocation(line: 1268, column: 23, scope: !1517)
!1519 = !DILocation(line: 1268, column: 22, scope: !1517)
!1520 = !DILocation(line: 1268, column: 36, scope: !1517)
!1521 = !DILocation(line: 1268, column: 4, scope: !1517)
!1522 = !DILocation(line: 1273, column: 1, scope: !1461)
!1523 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1290, type: !1524, scopeLine: 1291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1524 = !DISubroutineType(types: !1525)
!1525 = !{!16, !544, !16}
!1526 = !DILocalVariable(name: "numerator", arg: 1, scope: !1523, file: !69, line: 1290, type: !544)
!1527 = !DILocation(line: 1290, column: 25, scope: !1523)
!1528 = !DILocalVariable(name: "denominator", arg: 2, scope: !1523, file: !69, line: 1290, type: !16)
!1529 = !DILocation(line: 1290, column: 40, scope: !1523)
!1530 = !DILocalVariable(name: "u32Temp1", scope: !1523, file: !69, line: 1292, type: !544)
!1531 = !DILocation(line: 1292, column: 6, scope: !1523)
!1532 = !DILocalVariable(name: "u32Temp2", scope: !1523, file: !69, line: 1292, type: !544)
!1533 = !DILocation(line: 1292, column: 20, scope: !1523)
!1534 = !DILocation(line: 1293, column: 5, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1523, file: !69, line: 1293, column: 5)
!1536 = !DILocation(line: 1293, column: 17, scope: !1535)
!1537 = !DILocation(line: 1293, column: 5, scope: !1523)
!1538 = !DILocation(line: 1295, column: 6, scope: !1539)
!1539 = distinct !DILexicalBlock(scope: !1540, file: !69, line: 1295, column: 6)
!1540 = distinct !DILexicalBlock(scope: !1535, file: !69, line: 1294, column: 2)
!1541 = !DILocation(line: 1295, column: 18, scope: !1539)
!1542 = !DILocation(line: 1295, column: 6, scope: !1540)
!1543 = !DILocation(line: 1297, column: 4, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1539, file: !69, line: 1296, column: 3)
!1545 = !DILocation(line: 1301, column: 19, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1539, file: !69, line: 1300, column: 3)
!1547 = !DILocation(line: 1301, column: 18, scope: !1546)
!1548 = !DILocation(line: 1301, column: 16, scope: !1546)
!1549 = !DILocation(line: 1302, column: 16, scope: !1546)
!1550 = !DILocation(line: 1302, column: 30, scope: !1546)
!1551 = !DILocation(line: 1302, column: 40, scope: !1546)
!1552 = !DILocation(line: 1302, column: 39, scope: !1546)
!1553 = !DILocation(line: 1302, column: 55, scope: !1546)
!1554 = !DILocation(line: 1302, column: 53, scope: !1546)
!1555 = !DILocation(line: 1302, column: 26, scope: !1546)
!1556 = !DILocation(line: 1302, column: 69, scope: !1546)
!1557 = !DILocation(line: 1302, column: 13, scope: !1546)
!1558 = !DILocation(line: 1303, column: 16, scope: !1546)
!1559 = !DILocation(line: 1303, column: 25, scope: !1546)
!1560 = !DILocation(line: 1303, column: 24, scope: !1546)
!1561 = !DILocation(line: 1303, column: 41, scope: !1546)
!1562 = !DILocation(line: 1303, column: 51, scope: !1546)
!1563 = !DILocation(line: 1303, column: 50, scope: !1546)
!1564 = !DILocation(line: 1303, column: 38, scope: !1546)
!1565 = !DILocation(line: 1303, column: 13, scope: !1546)
!1566 = !DILocation(line: 1304, column: 7, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1546, file: !69, line: 1304, column: 7)
!1568 = !DILocation(line: 1304, column: 16, scope: !1567)
!1569 = !DILocation(line: 1304, column: 7, scope: !1546)
!1570 = !DILocation(line: 1306, column: 13, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1567, file: !69, line: 1305, column: 4)
!1572 = !DILocation(line: 1306, column: 12, scope: !1571)
!1573 = !DILocation(line: 1306, column: 5, scope: !1571)
!1574 = !DILocation(line: 1310, column: 5, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1567, file: !69, line: 1309, column: 4)
!1576 = !DILocation(line: 1316, column: 15, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1535, file: !69, line: 1315, column: 2)
!1578 = !DILocation(line: 1316, column: 29, scope: !1577)
!1579 = !DILocation(line: 1316, column: 39, scope: !1577)
!1580 = !DILocation(line: 1316, column: 38, scope: !1577)
!1581 = !DILocation(line: 1316, column: 54, scope: !1577)
!1582 = !DILocation(line: 1316, column: 52, scope: !1577)
!1583 = !DILocation(line: 1316, column: 25, scope: !1577)
!1584 = !DILocation(line: 1316, column: 68, scope: !1577)
!1585 = !DILocation(line: 1316, column: 12, scope: !1577)
!1586 = !DILocation(line: 1317, column: 15, scope: !1577)
!1587 = !DILocation(line: 1317, column: 24, scope: !1577)
!1588 = !DILocation(line: 1317, column: 23, scope: !1577)
!1589 = !DILocation(line: 1317, column: 40, scope: !1577)
!1590 = !DILocation(line: 1317, column: 50, scope: !1577)
!1591 = !DILocation(line: 1317, column: 49, scope: !1577)
!1592 = !DILocation(line: 1317, column: 37, scope: !1577)
!1593 = !DILocation(line: 1317, column: 12, scope: !1577)
!1594 = !DILocation(line: 1318, column: 6, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1577, file: !69, line: 1318, column: 6)
!1596 = !DILocation(line: 1318, column: 15, scope: !1595)
!1597 = !DILocation(line: 1318, column: 6, scope: !1577)
!1598 = !DILocation(line: 1320, column: 11, scope: !1599)
!1599 = distinct !DILexicalBlock(scope: !1595, file: !69, line: 1319, column: 3)
!1600 = !DILocation(line: 1320, column: 4, scope: !1599)
!1601 = !DILocation(line: 1324, column: 4, scope: !1602)
!1602 = distinct !DILexicalBlock(scope: !1595, file: !69, line: 1323, column: 3)
!1603 = !DILocation(line: 1327, column: 1, scope: !1523)
!1604 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1345, type: !1605, scopeLine: 1346, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1605 = !DISubroutineType(types: !1606)
!1606 = !{!16, !16, !544}
!1607 = !DILocalVariable(name: "numerator", arg: 1, scope: !1604, file: !69, line: 1345, type: !16)
!1608 = !DILocation(line: 1345, column: 25, scope: !1604)
!1609 = !DILocalVariable(name: "denominator", arg: 2, scope: !1604, file: !69, line: 1345, type: !544)
!1610 = !DILocation(line: 1345, column: 40, scope: !1604)
!1611 = !DILocalVariable(name: "s32Temp1", scope: !1604, file: !69, line: 1347, type: !16)
!1612 = !DILocation(line: 1347, column: 6, scope: !1604)
!1613 = !DILocalVariable(name: "s32Temp2", scope: !1604, file: !69, line: 1347, type: !16)
!1614 = !DILocation(line: 1347, column: 20, scope: !1604)
!1615 = !DILocalVariable(name: "u32Temp0", scope: !1604, file: !69, line: 1348, type: !544)
!1616 = !DILocation(line: 1348, column: 6, scope: !1604)
!1617 = !DILocalVariable(name: "u32Temp1", scope: !1604, file: !69, line: 1348, type: !544)
!1618 = !DILocation(line: 1348, column: 20, scope: !1604)
!1619 = !DILocalVariable(name: "u32Temp2", scope: !1604, file: !69, line: 1348, type: !544)
!1620 = !DILocation(line: 1348, column: 34, scope: !1604)
!1621 = !DILocation(line: 1349, column: 5, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1604, file: !69, line: 1349, column: 5)
!1623 = !DILocation(line: 1349, column: 17, scope: !1622)
!1624 = !DILocation(line: 1349, column: 5, scope: !1604)
!1625 = !DILocation(line: 1351, column: 6, scope: !1626)
!1626 = distinct !DILexicalBlock(scope: !1627, file: !69, line: 1351, column: 6)
!1627 = distinct !DILexicalBlock(scope: !1622, file: !69, line: 1350, column: 2)
!1628 = !DILocation(line: 1351, column: 16, scope: !1626)
!1629 = !DILocation(line: 1351, column: 6, scope: !1627)
!1630 = !DILocation(line: 1353, column: 4, scope: !1631)
!1631 = distinct !DILexicalBlock(scope: !1626, file: !69, line: 1352, column: 3)
!1632 = !DILocation(line: 1357, column: 4, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1626, file: !69, line: 1356, column: 3)
!1634 = !DILocation(line: 1362, column: 6, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1636, file: !69, line: 1362, column: 6)
!1636 = distinct !DILexicalBlock(scope: !1622, file: !69, line: 1361, column: 2)
!1637 = !DILocation(line: 1362, column: 16, scope: !1635)
!1638 = !DILocation(line: 1362, column: 6, scope: !1636)
!1639 = !DILocation(line: 1364, column: 16, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1635, file: !69, line: 1363, column: 3)
!1641 = !DILocation(line: 1364, column: 15, scope: !1640)
!1642 = !DILocation(line: 1364, column: 13, scope: !1640)
!1643 = !DILocation(line: 1365, column: 16, scope: !1640)
!1644 = !DILocation(line: 1365, column: 25, scope: !1640)
!1645 = !DILocation(line: 1365, column: 24, scope: !1640)
!1646 = !DILocation(line: 1365, column: 13, scope: !1640)
!1647 = !DILocation(line: 1366, column: 15, scope: !1640)
!1648 = !DILocation(line: 1366, column: 28, scope: !1640)
!1649 = !DILocation(line: 1366, column: 37, scope: !1640)
!1650 = !DILocation(line: 1366, column: 36, scope: !1640)
!1651 = !DILocation(line: 1366, column: 52, scope: !1640)
!1652 = !DILocation(line: 1366, column: 50, scope: !1640)
!1653 = !DILocation(line: 1366, column: 24, scope: !1640)
!1654 = !DILocation(line: 1366, column: 13, scope: !1640)
!1655 = !DILocation(line: 1368, column: 8, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1640, file: !69, line: 1368, column: 7)
!1657 = !DILocation(line: 1368, column: 20, scope: !1656)
!1658 = !DILocation(line: 1368, column: 27, scope: !1656)
!1659 = !DILocation(line: 1368, column: 7, scope: !1640)
!1660 = !DILocation(line: 1370, column: 20, scope: !1661)
!1661 = distinct !DILexicalBlock(scope: !1656, file: !69, line: 1369, column: 4)
!1662 = !DILocation(line: 1370, column: 32, scope: !1661)
!1663 = !DILocation(line: 1370, column: 17, scope: !1661)
!1664 = !DILocation(line: 1371, column: 4, scope: !1661)
!1665 = !DILocation(line: 1374, column: 20, scope: !1666)
!1666 = distinct !DILexicalBlock(scope: !1656, file: !69, line: 1373, column: 4)
!1667 = !DILocation(line: 1374, column: 32, scope: !1666)
!1668 = !DILocation(line: 1374, column: 38, scope: !1666)
!1669 = !DILocation(line: 1374, column: 17, scope: !1666)
!1670 = !DILocation(line: 1378, column: 7, scope: !1671)
!1671 = distinct !DILexicalBlock(scope: !1640, file: !69, line: 1378, column: 7)
!1672 = !DILocation(line: 1378, column: 18, scope: !1671)
!1673 = !DILocation(line: 1378, column: 16, scope: !1671)
!1674 = !DILocation(line: 1378, column: 7, scope: !1640)
!1675 = !DILocation(line: 1380, column: 14, scope: !1676)
!1676 = distinct !DILexicalBlock(scope: !1671, file: !69, line: 1379, column: 4)
!1677 = !DILocation(line: 1380, column: 13, scope: !1676)
!1678 = !DILocation(line: 1380, column: 23, scope: !1676)
!1679 = !DILocation(line: 1380, column: 5, scope: !1676)
!1680 = !DILocation(line: 1384, column: 14, scope: !1681)
!1681 = distinct !DILexicalBlock(scope: !1671, file: !69, line: 1383, column: 4)
!1682 = !DILocation(line: 1384, column: 23, scope: !1681)
!1683 = !DILocation(line: 1384, column: 12, scope: !1681)
!1684 = !DILocation(line: 1384, column: 27, scope: !1681)
!1685 = !DILocation(line: 1384, column: 5, scope: !1681)
!1686 = !DILocation(line: 1391, column: 16, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1635, file: !69, line: 1390, column: 3)
!1688 = !DILocation(line: 1391, column: 30, scope: !1687)
!1689 = !DILocation(line: 1391, column: 40, scope: !1687)
!1690 = !DILocation(line: 1391, column: 39, scope: !1687)
!1691 = !DILocation(line: 1391, column: 55, scope: !1687)
!1692 = !DILocation(line: 1391, column: 53, scope: !1687)
!1693 = !DILocation(line: 1391, column: 26, scope: !1687)
!1694 = !DILocation(line: 1391, column: 69, scope: !1687)
!1695 = !DILocation(line: 1391, column: 13, scope: !1687)
!1696 = !DILocation(line: 1392, column: 16, scope: !1687)
!1697 = !DILocation(line: 1392, column: 26, scope: !1687)
!1698 = !DILocation(line: 1392, column: 25, scope: !1687)
!1699 = !DILocation(line: 1392, column: 42, scope: !1687)
!1700 = !DILocation(line: 1392, column: 51, scope: !1687)
!1701 = !DILocation(line: 1392, column: 50, scope: !1687)
!1702 = !DILocation(line: 1392, column: 39, scope: !1687)
!1703 = !DILocation(line: 1392, column: 13, scope: !1687)
!1704 = !DILocation(line: 1393, column: 11, scope: !1687)
!1705 = !DILocation(line: 1393, column: 4, scope: !1687)
!1706 = !DILocation(line: 1396, column: 1, scope: !1604)
!1707 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1413, type: !1708, scopeLine: 1414, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1708 = !DISubroutineType(types: !1709)
!1709 = !{!16, !16, !16}
!1710 = !DILocalVariable(name: "numerator", arg: 1, scope: !1707, file: !69, line: 1413, type: !16)
!1711 = !DILocation(line: 1413, column: 25, scope: !1707)
!1712 = !DILocalVariable(name: "denominator", arg: 2, scope: !1707, file: !69, line: 1413, type: !16)
!1713 = !DILocation(line: 1413, column: 40, scope: !1707)
!1714 = !DILocalVariable(name: "s32Temp1", scope: !1707, file: !69, line: 1415, type: !16)
!1715 = !DILocation(line: 1415, column: 6, scope: !1707)
!1716 = !DILocalVariable(name: "s32Temp2", scope: !1707, file: !69, line: 1415, type: !16)
!1717 = !DILocation(line: 1415, column: 20, scope: !1707)
!1718 = !DILocalVariable(name: "denominator_prime", scope: !1707, file: !69, line: 1416, type: !544)
!1719 = !DILocation(line: 1416, column: 6, scope: !1707)
!1720 = !DILocalVariable(name: "u32Temp1", scope: !1707, file: !69, line: 1416, type: !544)
!1721 = !DILocation(line: 1416, column: 29, scope: !1707)
!1722 = !DILocalVariable(name: "u32Temp2", scope: !1707, file: !69, line: 1416, type: !544)
!1723 = !DILocation(line: 1416, column: 43, scope: !1707)
!1724 = !DILocalVariable(name: "u32numerator", scope: !1707, file: !69, line: 1417, type: !544)
!1725 = !DILocation(line: 1417, column: 6, scope: !1707)
!1726 = !DILocalVariable(name: "u32denominator", scope: !1707, file: !69, line: 1417, type: !544)
!1727 = !DILocation(line: 1417, column: 23, scope: !1707)
!1728 = !DILocation(line: 1418, column: 5, scope: !1729)
!1729 = distinct !DILexicalBlock(scope: !1707, file: !69, line: 1418, column: 5)
!1730 = !DILocation(line: 1418, column: 15, scope: !1729)
!1731 = !DILocation(line: 1418, column: 5, scope: !1707)
!1732 = !DILocation(line: 1420, column: 6, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1734, file: !69, line: 1420, column: 6)
!1734 = distinct !DILexicalBlock(scope: !1729, file: !69, line: 1419, column: 2)
!1735 = !DILocation(line: 1420, column: 18, scope: !1733)
!1736 = !DILocation(line: 1420, column: 6, scope: !1734)
!1737 = !DILocation(line: 1422, column: 7, scope: !1738)
!1738 = distinct !DILexicalBlock(scope: !1739, file: !69, line: 1422, column: 7)
!1739 = distinct !DILexicalBlock(scope: !1733, file: !69, line: 1421, column: 3)
!1740 = !DILocation(line: 1422, column: 19, scope: !1738)
!1741 = !DILocation(line: 1422, column: 7, scope: !1739)
!1742 = !DILocation(line: 1424, column: 5, scope: !1743)
!1743 = distinct !DILexicalBlock(scope: !1738, file: !69, line: 1423, column: 4)
!1744 = !DILocation(line: 1428, column: 21, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1738, file: !69, line: 1427, column: 4)
!1746 = !DILocation(line: 1428, column: 20, scope: !1745)
!1747 = !DILocation(line: 1428, column: 18, scope: !1745)
!1748 = !DILocation(line: 1429, column: 23, scope: !1745)
!1749 = !DILocation(line: 1429, column: 22, scope: !1745)
!1750 = !DILocation(line: 1429, column: 20, scope: !1745)
!1751 = !DILocation(line: 1430, column: 16, scope: !1745)
!1752 = !DILocation(line: 1430, column: 33, scope: !1745)
!1753 = !DILocation(line: 1430, column: 46, scope: !1745)
!1754 = !DILocation(line: 1430, column: 45, scope: !1745)
!1755 = !DILocation(line: 1430, column: 64, scope: !1745)
!1756 = !DILocation(line: 1430, column: 62, scope: !1745)
!1757 = !DILocation(line: 1430, column: 29, scope: !1745)
!1758 = !DILocation(line: 1430, column: 81, scope: !1745)
!1759 = !DILocation(line: 1430, column: 14, scope: !1745)
!1760 = !DILocation(line: 1431, column: 17, scope: !1745)
!1761 = !DILocation(line: 1431, column: 30, scope: !1745)
!1762 = !DILocation(line: 1431, column: 29, scope: !1745)
!1763 = !DILocation(line: 1431, column: 49, scope: !1745)
!1764 = !DILocation(line: 1431, column: 58, scope: !1745)
!1765 = !DILocation(line: 1431, column: 57, scope: !1745)
!1766 = !DILocation(line: 1431, column: 46, scope: !1745)
!1767 = !DILocation(line: 1431, column: 14, scope: !1745)
!1768 = !DILocation(line: 1432, column: 8, scope: !1769)
!1769 = distinct !DILexicalBlock(scope: !1745, file: !69, line: 1432, column: 8)
!1770 = !DILocation(line: 1432, column: 17, scope: !1769)
!1771 = !DILocation(line: 1432, column: 8, scope: !1745)
!1772 = !DILocation(line: 1434, column: 13, scope: !1773)
!1773 = distinct !DILexicalBlock(scope: !1769, file: !69, line: 1433, column: 5)
!1774 = !DILocation(line: 1434, column: 6, scope: !1773)
!1775 = !DILocation(line: 1438, column: 6, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1769, file: !69, line: 1437, column: 5)
!1777 = !DILocation(line: 1444, column: 20, scope: !1778)
!1778 = distinct !DILexicalBlock(scope: !1733, file: !69, line: 1443, column: 3)
!1779 = !DILocation(line: 1444, column: 19, scope: !1778)
!1780 = !DILocation(line: 1444, column: 29, scope: !1778)
!1781 = !DILocation(line: 1444, column: 17, scope: !1778)
!1782 = !DILocation(line: 1445, column: 16, scope: !1778)
!1783 = !DILocation(line: 1445, column: 33, scope: !1778)
!1784 = !DILocation(line: 1445, column: 46, scope: !1778)
!1785 = !DILocation(line: 1445, column: 45, scope: !1778)
!1786 = !DILocation(line: 1445, column: 61, scope: !1778)
!1787 = !DILocation(line: 1445, column: 59, scope: !1778)
!1788 = !DILocation(line: 1445, column: 29, scope: !1778)
!1789 = !DILocation(line: 1445, column: 75, scope: !1778)
!1790 = !DILocation(line: 1445, column: 13, scope: !1778)
!1791 = !DILocation(line: 1446, column: 16, scope: !1778)
!1792 = !DILocation(line: 1446, column: 29, scope: !1778)
!1793 = !DILocation(line: 1446, column: 28, scope: !1778)
!1794 = !DILocation(line: 1446, column: 45, scope: !1778)
!1795 = !DILocation(line: 1446, column: 54, scope: !1778)
!1796 = !DILocation(line: 1446, column: 53, scope: !1778)
!1797 = !DILocation(line: 1446, column: 42, scope: !1778)
!1798 = !DILocation(line: 1446, column: 13, scope: !1778)
!1799 = !DILocation(line: 1447, column: 13, scope: !1778)
!1800 = !DILocation(line: 1447, column: 12, scope: !1778)
!1801 = !DILocation(line: 1447, column: 22, scope: !1778)
!1802 = !DILocation(line: 1447, column: 4, scope: !1778)
!1803 = !DILocation(line: 1452, column: 6, scope: !1804)
!1804 = distinct !DILexicalBlock(scope: !1805, file: !69, line: 1452, column: 6)
!1805 = distinct !DILexicalBlock(scope: !1729, file: !69, line: 1451, column: 2)
!1806 = !DILocation(line: 1452, column: 18, scope: !1804)
!1807 = !DILocation(line: 1452, column: 6, scope: !1805)
!1808 = !DILocation(line: 1454, column: 7, scope: !1809)
!1809 = distinct !DILexicalBlock(scope: !1810, file: !69, line: 1454, column: 7)
!1810 = distinct !DILexicalBlock(scope: !1804, file: !69, line: 1453, column: 3)
!1811 = !DILocation(line: 1454, column: 19, scope: !1809)
!1812 = !DILocation(line: 1454, column: 7, scope: !1810)
!1813 = !DILocation(line: 1456, column: 5, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1809, file: !69, line: 1455, column: 4)
!1815 = !DILocation(line: 1460, column: 23, scope: !1816)
!1816 = distinct !DILexicalBlock(scope: !1809, file: !69, line: 1459, column: 4)
!1817 = !DILocation(line: 1460, column: 22, scope: !1816)
!1818 = !DILocation(line: 1460, column: 35, scope: !1816)
!1819 = !DILocation(line: 1460, column: 20, scope: !1816)
!1820 = !DILocation(line: 1461, column: 17, scope: !1816)
!1821 = !DILocation(line: 1461, column: 31, scope: !1816)
!1822 = !DILocation(line: 1461, column: 41, scope: !1816)
!1823 = !DILocation(line: 1461, column: 40, scope: !1816)
!1824 = !DILocation(line: 1461, column: 59, scope: !1816)
!1825 = !DILocation(line: 1461, column: 57, scope: !1816)
!1826 = !DILocation(line: 1461, column: 27, scope: !1816)
!1827 = !DILocation(line: 1461, column: 76, scope: !1816)
!1828 = !DILocation(line: 1461, column: 14, scope: !1816)
!1829 = !DILocation(line: 1462, column: 17, scope: !1816)
!1830 = !DILocation(line: 1462, column: 27, scope: !1816)
!1831 = !DILocation(line: 1462, column: 26, scope: !1816)
!1832 = !DILocation(line: 1462, column: 46, scope: !1816)
!1833 = !DILocation(line: 1462, column: 55, scope: !1816)
!1834 = !DILocation(line: 1462, column: 54, scope: !1816)
!1835 = !DILocation(line: 1462, column: 43, scope: !1816)
!1836 = !DILocation(line: 1462, column: 14, scope: !1816)
!1837 = !DILocation(line: 1463, column: 14, scope: !1816)
!1838 = !DILocation(line: 1463, column: 13, scope: !1816)
!1839 = !DILocation(line: 1463, column: 23, scope: !1816)
!1840 = !DILocation(line: 1463, column: 5, scope: !1816)
!1841 = !DILocation(line: 1468, column: 16, scope: !1842)
!1842 = distinct !DILexicalBlock(scope: !1804, file: !69, line: 1467, column: 3)
!1843 = !DILocation(line: 1468, column: 30, scope: !1842)
!1844 = !DILocation(line: 1468, column: 40, scope: !1842)
!1845 = !DILocation(line: 1468, column: 39, scope: !1842)
!1846 = !DILocation(line: 1468, column: 55, scope: !1842)
!1847 = !DILocation(line: 1468, column: 53, scope: !1842)
!1848 = !DILocation(line: 1468, column: 26, scope: !1842)
!1849 = !DILocation(line: 1468, column: 69, scope: !1842)
!1850 = !DILocation(line: 1468, column: 13, scope: !1842)
!1851 = !DILocation(line: 1469, column: 16, scope: !1842)
!1852 = !DILocation(line: 1469, column: 26, scope: !1842)
!1853 = !DILocation(line: 1469, column: 25, scope: !1842)
!1854 = !DILocation(line: 1469, column: 42, scope: !1842)
!1855 = !DILocation(line: 1469, column: 51, scope: !1842)
!1856 = !DILocation(line: 1469, column: 50, scope: !1842)
!1857 = !DILocation(line: 1469, column: 39, scope: !1842)
!1858 = !DILocation(line: 1469, column: 13, scope: !1842)
!1859 = !DILocation(line: 1470, column: 11, scope: !1842)
!1860 = !DILocation(line: 1470, column: 4, scope: !1842)
!1861 = !DILocation(line: 1473, column: 1, scope: !1707)
!1862 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1491, type: !1863, scopeLine: 1492, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1863 = !DISubroutineType(types: !1864)
!1864 = !{!6, !16, !544}
!1865 = !DILocalVariable(name: "numerator", arg: 1, scope: !1862, file: !69, line: 1491, type: !16)
!1866 = !DILocation(line: 1491, column: 25, scope: !1862)
!1867 = !DILocalVariable(name: "denominator", arg: 2, scope: !1862, file: !69, line: 1491, type: !544)
!1868 = !DILocation(line: 1491, column: 40, scope: !1862)
!1869 = !DILocalVariable(name: "numerator_prime", scope: !1862, file: !69, line: 1494, type: !544)
!1870 = !DILocation(line: 1494, column: 6, scope: !1862)
!1871 = !DILocalVariable(name: "u32Temp1", scope: !1862, file: !69, line: 1494, type: !544)
!1872 = !DILocation(line: 1494, column: 27, scope: !1862)
!1873 = !DILocalVariable(name: "u32Temp2", scope: !1862, file: !69, line: 1494, type: !544)
!1874 = !DILocation(line: 1494, column: 41, scope: !1862)
!1875 = !DILocalVariable(name: "u32Temp3", scope: !1862, file: !69, line: 1494, type: !544)
!1876 = !DILocation(line: 1494, column: 55, scope: !1862)
!1877 = !DILocalVariable(name: "s32Temp1", scope: !1862, file: !69, line: 1495, type: !16)
!1878 = !DILocation(line: 1495, column: 6, scope: !1862)
!1879 = !DILocalVariable(name: "s32Temp2", scope: !1862, file: !69, line: 1495, type: !16)
!1880 = !DILocation(line: 1495, column: 20, scope: !1862)
!1881 = !DILocalVariable(name: "s32Temp3", scope: !1862, file: !69, line: 1495, type: !16)
!1882 = !DILocation(line: 1495, column: 34, scope: !1862)
!1883 = !DILocation(line: 1496, column: 5, scope: !1884)
!1884 = distinct !DILexicalBlock(scope: !1862, file: !69, line: 1496, column: 5)
!1885 = !DILocation(line: 1496, column: 17, scope: !1884)
!1886 = !DILocation(line: 1496, column: 5, scope: !1862)
!1887 = !DILocation(line: 1498, column: 6, scope: !1888)
!1888 = distinct !DILexicalBlock(scope: !1889, file: !69, line: 1498, column: 6)
!1889 = distinct !DILexicalBlock(scope: !1884, file: !69, line: 1497, column: 2)
!1890 = !DILocation(line: 1498, column: 15, scope: !1888)
!1891 = !DILocation(line: 1498, column: 6, scope: !1889)
!1892 = !DILocation(line: 1500, column: 4, scope: !1893)
!1893 = distinct !DILexicalBlock(scope: !1888, file: !69, line: 1499, column: 3)
!1894 = !DILocation(line: 1504, column: 4, scope: !1895)
!1895 = distinct !DILexicalBlock(scope: !1888, file: !69, line: 1503, column: 3)
!1896 = !DILocation(line: 1509, column: 6, scope: !1897)
!1897 = distinct !DILexicalBlock(scope: !1898, file: !69, line: 1509, column: 6)
!1898 = distinct !DILexicalBlock(scope: !1884, file: !69, line: 1508, column: 2)
!1899 = !DILocation(line: 1509, column: 16, scope: !1897)
!1900 = !DILocation(line: 1509, column: 6, scope: !1898)
!1901 = !DILocation(line: 1511, column: 23, scope: !1902)
!1902 = distinct !DILexicalBlock(scope: !1897, file: !69, line: 1510, column: 3)
!1903 = !DILocation(line: 1511, column: 22, scope: !1902)
!1904 = !DILocation(line: 1511, column: 20, scope: !1902)
!1905 = !DILocation(line: 1512, column: 16, scope: !1902)
!1906 = !DILocation(line: 1512, column: 32, scope: !1902)
!1907 = !DILocation(line: 1512, column: 31, scope: !1902)
!1908 = !DILocation(line: 1512, column: 13, scope: !1902)
!1909 = !DILocation(line: 1513, column: 15, scope: !1902)
!1910 = !DILocation(line: 1513, column: 34, scope: !1902)
!1911 = !DILocation(line: 1513, column: 45, scope: !1902)
!1912 = !DILocation(line: 1513, column: 43, scope: !1902)
!1913 = !DILocation(line: 1513, column: 31, scope: !1902)
!1914 = !DILocation(line: 1513, column: 13, scope: !1902)
!1915 = !DILocation(line: 1515, column: 8, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1902, file: !69, line: 1515, column: 7)
!1917 = !DILocation(line: 1515, column: 20, scope: !1916)
!1918 = !DILocation(line: 1515, column: 27, scope: !1916)
!1919 = !DILocation(line: 1515, column: 7, scope: !1902)
!1920 = !DILocation(line: 1517, column: 19, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1916, file: !69, line: 1516, column: 4)
!1922 = !DILocation(line: 1517, column: 31, scope: !1921)
!1923 = !DILocation(line: 1517, column: 17, scope: !1921)
!1924 = !DILocation(line: 1518, column: 4, scope: !1921)
!1925 = !DILocation(line: 1521, column: 20, scope: !1926)
!1926 = distinct !DILexicalBlock(scope: !1916, file: !69, line: 1520, column: 4)
!1927 = !DILocation(line: 1521, column: 32, scope: !1926)
!1928 = !DILocation(line: 1521, column: 38, scope: !1926)
!1929 = !DILocation(line: 1521, column: 17, scope: !1926)
!1930 = !DILocation(line: 1524, column: 7, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1902, file: !69, line: 1524, column: 7)
!1932 = !DILocation(line: 1524, column: 18, scope: !1931)
!1933 = !DILocation(line: 1524, column: 16, scope: !1931)
!1934 = !DILocation(line: 1524, column: 7, scope: !1902)
!1935 = !DILocation(line: 1526, column: 18, scope: !1936)
!1936 = distinct !DILexicalBlock(scope: !1931, file: !69, line: 1525, column: 4)
!1937 = !DILocation(line: 1526, column: 16, scope: !1936)
!1938 = !DILocation(line: 1526, column: 28, scope: !1936)
!1939 = !DILocation(line: 1526, column: 14, scope: !1936)
!1940 = !DILocation(line: 1527, column: 4, scope: !1936)
!1941 = !DILocation(line: 1530, column: 18, scope: !1942)
!1942 = distinct !DILexicalBlock(scope: !1931, file: !69, line: 1529, column: 4)
!1943 = !DILocation(line: 1530, column: 26, scope: !1942)
!1944 = !DILocation(line: 1530, column: 16, scope: !1942)
!1945 = !DILocation(line: 1530, column: 30, scope: !1942)
!1946 = !DILocation(line: 1530, column: 14, scope: !1942)
!1947 = !DILocation(line: 1532, column: 8, scope: !1948)
!1948 = distinct !DILexicalBlock(scope: !1902, file: !69, line: 1532, column: 7)
!1949 = !DILocation(line: 1532, column: 18, scope: !1948)
!1950 = !DILocation(line: 1532, column: 7, scope: !1902)
!1951 = !DILocation(line: 1534, column: 18, scope: !1952)
!1952 = distinct !DILexicalBlock(scope: !1948, file: !69, line: 1533, column: 4)
!1953 = !DILocation(line: 1534, column: 12, scope: !1952)
!1954 = !DILocation(line: 1534, column: 5, scope: !1952)
!1955 = !DILocation(line: 1538, column: 5, scope: !1956)
!1956 = distinct !DILexicalBlock(scope: !1948, file: !69, line: 1537, column: 4)
!1957 = !DILocation(line: 1543, column: 16, scope: !1958)
!1958 = distinct !DILexicalBlock(scope: !1897, file: !69, line: 1542, column: 3)
!1959 = !DILocation(line: 1543, column: 26, scope: !1958)
!1960 = !DILocation(line: 1543, column: 25, scope: !1958)
!1961 = !DILocation(line: 1543, column: 41, scope: !1958)
!1962 = !DILocation(line: 1543, column: 39, scope: !1958)
!1963 = !DILocation(line: 1543, column: 13, scope: !1958)
!1964 = !DILocation(line: 1544, column: 16, scope: !1958)
!1965 = !DILocation(line: 1544, column: 30, scope: !1958)
!1966 = !DILocation(line: 1544, column: 40, scope: !1958)
!1967 = !DILocation(line: 1544, column: 39, scope: !1958)
!1968 = !DILocation(line: 1544, column: 55, scope: !1958)
!1969 = !DILocation(line: 1544, column: 53, scope: !1958)
!1970 = !DILocation(line: 1544, column: 26, scope: !1958)
!1971 = !DILocation(line: 1544, column: 68, scope: !1958)
!1972 = !DILocation(line: 1544, column: 13, scope: !1958)
!1973 = !DILocation(line: 1545, column: 16, scope: !1958)
!1974 = !DILocation(line: 1545, column: 25, scope: !1958)
!1975 = !DILocation(line: 1545, column: 24, scope: !1958)
!1976 = !DILocation(line: 1545, column: 41, scope: !1958)
!1977 = !DILocation(line: 1545, column: 51, scope: !1958)
!1978 = !DILocation(line: 1545, column: 50, scope: !1958)
!1979 = !DILocation(line: 1545, column: 38, scope: !1958)
!1980 = !DILocation(line: 1545, column: 13, scope: !1958)
!1981 = !DILocation(line: 1546, column: 7, scope: !1982)
!1982 = distinct !DILexicalBlock(scope: !1958, file: !69, line: 1546, column: 7)
!1983 = !DILocation(line: 1546, column: 16, scope: !1982)
!1984 = !DILocation(line: 1546, column: 7, scope: !1958)
!1985 = !DILocation(line: 1548, column: 17, scope: !1986)
!1986 = distinct !DILexicalBlock(scope: !1982, file: !69, line: 1547, column: 4)
!1987 = !DILocation(line: 1548, column: 12, scope: !1986)
!1988 = !DILocation(line: 1548, column: 5, scope: !1986)
!1989 = !DILocation(line: 1552, column: 5, scope: !1990)
!1990 = distinct !DILexicalBlock(scope: !1982, file: !69, line: 1551, column: 4)
!1991 = !DILocation(line: 1556, column: 1, scope: !1862)
!1992 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1993, file: !1993, line: 12, type: !1994, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !1997)
!1993 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1994 = !DISubroutineType(types: !1995)
!1995 = !{null, !1996}
!1996 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1997 = !{!1998}
!1998 = !DILocalVariable(name: "z", arg: 1, scope: !1992, file: !1993, line: 12, type: !1996)
!1999 = !DILocation(line: 0, scope: !1992)
!2000 = !DILocation(line: 13, column: 9, scope: !2001)
!2001 = distinct !DILexicalBlock(scope: !1992, file: !1993, line: 13, column: 7)
!2002 = !DILocation(line: 13, column: 7, scope: !1992)
!2003 = !DILocation(line: 14, column: 5, scope: !2001)
!2004 = !DILocation(line: 15, column: 1, scope: !1992)
!2005 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2006, file: !2006, line: 20, type: !2007, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2010)
!2006 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2007 = !DISubroutineType(types: !2008)
!2008 = !{null, !2009, !2009}
!2009 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2010 = !{!2011, !2012}
!2011 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2005, file: !2006, line: 20, type: !2009)
!2012 = !DILocalVariable(name: "shift", arg: 2, scope: !2005, file: !2006, line: 20, type: !2009)
!2013 = !DILocation(line: 0, scope: !2005)
!2014 = !DILocation(line: 21, column: 13, scope: !2015)
!2015 = distinct !DILexicalBlock(scope: !2005, file: !2006, line: 21, column: 7)
!2016 = !DILocation(line: 21, column: 7, scope: !2005)
!2017 = !DILocation(line: 27, column: 5, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !2015, file: !2006, line: 21, column: 26)
!2019 = !DILocation(line: 29, column: 1, scope: !2005)
