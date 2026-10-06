; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0030/build/s16_div_s32_s16_alarm_0030.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [104 x i8] c"KLEE-ALARM-0030: signed overflow. assert -2147483648 <= s32Temp1 + (s32)(numerator / (s32)denominator);\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0030.err\00", align 1
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
  br i1 %cmp6, label %if.then8, label %if.else82, !dbg !216

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
  %call67 = call i32 @klee_alarm_s32_add_upper(i64 %conv63, i64 %conv66), !dbg !316
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
  %call75 = call i32 @klee_alarm_s32_add_lower(i64 %conv71, i64 %conv74), !dbg !328
  %tobool76 = icmp ne i32 %call75, 0, !dbg !328
  br i1 %tobool76, label %if.end78, label %if.then77, !dbg !329

if.then77:                                        ; preds = %if.end70
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 312, i8* getelementptr inbounds ([104 x i8], [104 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !330
  unreachable, !dbg !330

if.end78:                                         ; preds = %if.end70
  %33 = load i32, i32* %s32Temp1, align 4, !dbg !332
  %34 = load i32, i32* %numerator.addr, align 4, !dbg !333
  %35 = load i16, i16* %denominator.addr, align 2, !dbg !334
  %conv79 = sext i16 %35 to i32, !dbg !335
  %int_cast_to_i648 = zext i32 %conv79 to i64, !dbg !336
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !336
  %div80 = sdiv i32 %34, %conv79, !dbg !336, !klee.check.div !106
  %add = add nsw i32 %33, %div80, !dbg !337
  %conv81 = sext i32 %add to i64, !dbg !338
  store volatile i64 %conv81, i64* @klee_alarm_sink_s64, align 8, !dbg !339
  store i16 0, i16* %retval, align 2, !dbg !340
  br label %return, !dbg !340

if.else82:                                        ; preds = %if.else5
  %36 = load i16, i16* %denominator.addr, align 2, !dbg !341
  %conv83 = sext i16 %36 to i32, !dbg !341
  %cmp84 = icmp ne i32 %conv83, -1, !dbg !344
  br i1 %cmp84, label %if.then86, label %if.else107, !dbg !345

if.then86:                                        ; preds = %if.else82
  %37 = load i32, i32* %s32Temp1, align 4, !dbg !346
  %38 = load i32, i32* %s32Temp1, align 4, !dbg !348
  %39 = load i16, i16* %denominator.addr, align 2, !dbg !349
  %conv87 = sext i16 %39 to i32, !dbg !349
  %int_cast_to_i649 = zext i32 %conv87 to i64, !dbg !350
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !350
  %div88 = sdiv i32 %38, %conv87, !dbg !350, !klee.check.div !106
  %40 = load i16, i16* %denominator.addr, align 2, !dbg !351
  %conv89 = sext i16 %40 to i32, !dbg !351
  %mul90 = mul nsw i32 %div88, %conv89, !dbg !352
  %sub91 = sub nsw i32 %37, %mul90, !dbg !353
  %shl92 = shl i32 %sub91, 1, !dbg !354
  store i32 %shl92, i32* %s32Temp2, align 4, !dbg !355
  %41 = load i32, i32* %s32Temp2, align 4, !dbg !356
  %42 = load i16, i16* %denominator.addr, align 2, !dbg !357
  %conv93 = sext i16 %42 to i32, !dbg !357
  %int_cast_to_i6410 = zext i32 %conv93 to i64, !dbg !358
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !358
  %div94 = sdiv i32 %41, %conv93, !dbg !358, !klee.check.div !106
  store i32 %div94, i32* %s32Temp1, align 4, !dbg !359
  %43 = load i32, i32* %s32Temp1, align 4, !dbg !360
  %44 = load i32, i32* %numerator.addr, align 4, !dbg !361
  %45 = load i16, i16* %denominator.addr, align 2, !dbg !362
  %conv95 = sext i16 %45 to i32, !dbg !362
  %int_cast_to_i6411 = zext i32 %conv95 to i64, !dbg !363
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !363
  %div96 = sdiv i32 %44, %conv95, !dbg !363, !klee.check.div !106
  %add97 = add nsw i32 %43, %div96, !dbg !364
  store i32 %add97, i32* %s32Temp1, align 4, !dbg !365
  %46 = load i32, i32* %s32Temp1, align 4, !dbg !366
  %cmp98 = icmp slt i32 %46, 32767, !dbg !368
  br i1 %cmp98, label %if.then100, label %if.else106, !dbg !369

if.then100:                                       ; preds = %if.then86
  %47 = load i32, i32* %s32Temp1, align 4, !dbg !370
  %cmp101 = icmp sgt i32 %47, -32768, !dbg !373
  br i1 %cmp101, label %if.then103, label %if.else105, !dbg !374

if.then103:                                       ; preds = %if.then100
  %48 = load i32, i32* %s32Temp1, align 4, !dbg !375
  %conv104 = trunc i32 %48 to i16, !dbg !377
  store i16 %conv104, i16* %retval, align 2, !dbg !378
  br label %return, !dbg !378

if.else105:                                       ; preds = %if.then100
  store i16 -32768, i16* %retval, align 2, !dbg !379
  br label %return, !dbg !379

if.else106:                                       ; preds = %if.then86
  store i16 32767, i16* %retval, align 2, !dbg !381
  br label %return, !dbg !381

if.else107:                                       ; preds = %if.else82
  store i16 32767, i16* %retval, align 2, !dbg !383
  br label %return, !dbg !383

return:                                           ; preds = %if.else107, %if.else106, %if.else105, %if.then103, %if.end78, %if.then69, %if.then61, %if.then54, %if.then44, %if.then35, %if.then26, %if.then16, %if.then10, %if.else, %if.then4
  %49 = load i16, i16* %retval, align 2, !dbg !385
  ret i16 %49, !dbg !385
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !386 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !389, metadata !DIExpression()), !dbg !390
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !391
  %cmp = icmp ne i64 %0, 0, !dbg !392
  %conv = zext i1 %cmp to i32, !dbg !392
  ret i32 %conv, !dbg !393
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !394 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !395, metadata !DIExpression()), !dbg !396
  %0 = load i64, i64* %left.addr, align 8, !dbg !397
  %cmp = icmp sge i64 %0, 0, !dbg !398
  %conv = zext i1 %cmp to i32, !dbg !398
  ret i32 %conv, !dbg !399
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !400 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !403, metadata !DIExpression()), !dbg !404
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !405, metadata !DIExpression()), !dbg !406
  %0 = load i32, i32* %count.addr, align 4, !dbg !407
  %cmp = icmp uge i32 %0, 63, !dbg !409
  br i1 %cmp, label %if.then, label %if.end, !dbg !410

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !411
  br label %return, !dbg !411

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !413
  %2 = load i32, i32* %count.addr, align 4, !dbg !414
  %sh_prom = zext i32 %2 to i64, !dbg !415
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !415
  %shl = shl i64 1, %sh_prom, !dbg !415, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !416
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !417
  %conv = zext i1 %cmp1 to i32, !dbg !417
  store i32 %conv, i32* %retval, align 4, !dbg !418
  br label %return, !dbg !418

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !419
  ret i32 %3, !dbg !419
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !420 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !423, metadata !DIExpression()), !dbg !424
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !425, metadata !DIExpression()), !dbg !426
  %0 = load i64, i64* %left.addr, align 8, !dbg !427
  %1 = load i64, i64* %right.addr, align 8, !dbg !428
  %mul = mul nsw i64 %0, %1, !dbg !429
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !430
  %conv = zext i1 %cmp to i32, !dbg !430
  ret i32 %conv, !dbg !431
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !432 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !433, metadata !DIExpression()), !dbg !434
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !435, metadata !DIExpression()), !dbg !436
  %0 = load i64, i64* %left.addr, align 8, !dbg !437
  %1 = load i64, i64* %right.addr, align 8, !dbg !438
  %mul = mul nsw i64 %0, %1, !dbg !439
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !440
  %conv = zext i1 %cmp to i32, !dbg !440
  ret i32 %conv, !dbg !441
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !442 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !443, metadata !DIExpression()), !dbg !444
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !445, metadata !DIExpression()), !dbg !446
  %0 = load i64, i64* %left.addr, align 8, !dbg !447
  %1 = load i64, i64* %right.addr, align 8, !dbg !448
  %add = add nsw i64 %0, %1, !dbg !449
  %cmp = icmp sle i64 %add, 2147483647, !dbg !450
  %conv = zext i1 %cmp to i32, !dbg !450
  ret i32 %conv, !dbg !451
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_lower(i64 %left, i64 %right) #0 !dbg !452 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !453, metadata !DIExpression()), !dbg !454
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !455, metadata !DIExpression()), !dbg !456
  %0 = load i64, i64* %left.addr, align 8, !dbg !457
  %1 = load i64, i64* %right.addr, align 8, !dbg !458
  %add = add nsw i64 %0, %1, !dbg !459
  %cmp = icmp sge i64 %add, -2147483648, !dbg !460
  %conv = zext i1 %cmp to i32, !dbg !460
  ret i32 %conv, !dbg !461
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !462 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !465, metadata !DIExpression()), !dbg !466
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !467, metadata !DIExpression()), !dbg !468
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !469, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !471, metadata !DIExpression()), !dbg !472
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !473, metadata !DIExpression()), !dbg !474
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !475
  %conv = zext i16 %0 to i32, !dbg !475
  %and = and i32 %conv, 65535, !dbg !476
  %conv1 = trunc i32 %and to i16, !dbg !475
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !477
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !478
  %conv2 = sext i16 %1 to i32, !dbg !478
  %shl = shl i32 %conv2, 16, !dbg !479
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !480
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !481
  %conv3 = zext i16 %2 to i32, !dbg !481
  %cmp = icmp eq i32 %conv3, 0, !dbg !483
  br i1 %cmp, label %if.then, label %if.else9, !dbg !484

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !485
  %conv5 = sext i16 %3 to i32, !dbg !485
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !488
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !489

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !490
  br label %return, !dbg !490

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !492
  br label %return, !dbg !492

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !494
  %conv10 = sext i16 %4 to i32, !dbg !494
  %shl11 = shl i32 %conv10, 16, !dbg !496
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !497
  %conv12 = sext i16 %5 to i32, !dbg !497
  %shl13 = shl i32 %conv12, 16, !dbg !498
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !499
  %conv14 = zext i16 %6 to i32, !dbg !499
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !500
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !500
  %div = sdiv i32 %shl13, %conv14, !dbg !500, !klee.check.div !106
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !501
  %conv15 = zext i16 %7 to i32, !dbg !501
  %mul = mul nsw i32 %div, %conv15, !dbg !502
  %sub = sub nsw i32 %shl11, %mul, !dbg !503
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !504
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !505
  %shl16 = shl i32 %8, 1, !dbg !506
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !507
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !508
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !509
  %conv17 = zext i16 %10 to i32, !dbg !509
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !510
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !510
  %div18 = sdiv i32 %9, %conv17, !dbg !510, !klee.check.div !106
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !511
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !512
  %conv19 = sext i16 %11 to i32, !dbg !512
  %shl20 = shl i32 %conv19, 16, !dbg !513
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !514
  %conv21 = zext i16 %12 to i32, !dbg !514
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !515
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !515
  %div22 = sdiv i32 %shl20, %conv21, !dbg !515, !klee.check.div !106
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !516
  %add = add nsw i32 %div22, %13, !dbg !517
  store i32 %add, i32* %s32Temp1, align 4, !dbg !518
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !519
  %cmp23 = icmp slt i32 %14, 32767, !dbg !521
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !522

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !523
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !526
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !527

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !528
  %conv29 = trunc i32 %16 to i16, !dbg !530
  store i16 %conv29, i16* %retval, align 2, !dbg !531
  br label %return, !dbg !531

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !532
  br label %return, !dbg !532

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !534
  br label %return, !dbg !534

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !536
  ret i16 %17, !dbg !536
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !537 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !538, metadata !DIExpression()), !dbg !539
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !540, metadata !DIExpression()), !dbg !541
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !542, metadata !DIExpression()), !dbg !543
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !544, metadata !DIExpression()), !dbg !545
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !546
  %conv = zext i16 %0 to i32, !dbg !546
  %and = and i32 %conv, 65535, !dbg !547
  %conv1 = trunc i32 %and to i16, !dbg !546
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !548
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !549
  %conv2 = zext i16 %1 to i32, !dbg !549
  %cmp = icmp eq i32 %conv2, 0, !dbg !551
  br i1 %cmp, label %if.then, label %if.else8, !dbg !552

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !553
  %conv4 = sext i16 %2 to i32, !dbg !553
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !556
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !557

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !558
  br label %return, !dbg !558

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !560
  br label %return, !dbg !560

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !562
  %conv9 = sext i16 %3 to i32, !dbg !562
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !564
  %conv10 = sext i16 %4 to i32, !dbg !564
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !565
  %conv11 = zext i16 %5 to i32, !dbg !565
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !566
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !566
  %div = sdiv i32 %conv10, %conv11, !dbg !566, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !567
  %conv12 = zext i16 %6 to i32, !dbg !567
  %mul = mul nsw i32 %div, %conv12, !dbg !568
  %sub = sub nsw i32 %conv9, %mul, !dbg !569
  %shl = shl i32 %sub, 1, !dbg !570
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !571
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !572
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !573
  %conv13 = zext i16 %8 to i32, !dbg !573
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !574
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !574
  %div14 = sdiv i32 %7, %conv13, !dbg !574, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !575
  %conv15 = sext i16 %9 to i32, !dbg !575
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !576
  %conv16 = zext i16 %10 to i32, !dbg !576
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !577
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !577
  %div17 = sdiv i32 %conv15, %conv16, !dbg !577, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !578
  store i32 %add, i32* %s32Temp1, align 4, !dbg !579
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !580
  %conv18 = trunc i32 %11 to i16, !dbg !580
  store i16 %conv18, i16* %retval, align 2, !dbg !581
  br label %return, !dbg !581

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !582
  ret i16 %12, !dbg !582
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !583 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !586, metadata !DIExpression()), !dbg !587
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !588, metadata !DIExpression()), !dbg !589
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !590, metadata !DIExpression()), !dbg !592
  store i32 0, i32* %u32Temp1, align 4, !dbg !592
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !593, metadata !DIExpression()), !dbg !594
  store i32 0, i32* %u32Temp2, align 4, !dbg !594
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !595, metadata !DIExpression()), !dbg !596
  store i32 0, i32* %u32Temp3, align 4, !dbg !596
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !597
  %conv = zext i16 %0 to i32, !dbg !597
  %cmp = icmp eq i32 %conv, 0, !dbg !599
  br i1 %cmp, label %if.then, label %if.else, !dbg !600

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !601
  br label %return, !dbg !601

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !603
  %conv2 = zext i16 %1 to i32, !dbg !603
  %shl = shl i32 %conv2, 16, !dbg !605
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !606
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !607
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !608
  %conv3 = zext i16 %3 to i32, !dbg !608
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !609
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !609
  %div = udiv i32 %2, %conv3, !dbg !609, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !610
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !611
  %add = add i32 %4, 128, !dbg !612
  %shr = lshr i32 %add, 8, !dbg !613
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !614
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !615
  %cmp4 = icmp ult i32 %5, 255, !dbg !617
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !618

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !619
  %conv7 = trunc i32 %6 to i8, !dbg !621
  store i8 %conv7, i8* %retval, align 1, !dbg !622
  br label %return, !dbg !622

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !623
  br label %return, !dbg !623

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !625
  ret i8 %7, !dbg !625
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !626 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !629, metadata !DIExpression()), !dbg !630
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !631, metadata !DIExpression()), !dbg !632
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !633, metadata !DIExpression()), !dbg !634
  store i32 0, i32* %s32Temp1, align 4, !dbg !634
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !635
  %conv = zext i16 %0 to i32, !dbg !635
  %and = and i32 %conv, 65535, !dbg !636
  %conv1 = trunc i32 %and to i16, !dbg !635
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !637
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !638
  %conv2 = zext i16 %1 to i32, !dbg !638
  %and3 = and i32 %conv2, 65535, !dbg !640
  %cmp = icmp eq i32 %and3, 0, !dbg !641
  br i1 %cmp, label %if.then, label %if.else8, !dbg !642

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !643
  %cmp5 = icmp sge i32 %2, 0, !dbg !646
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !647

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !648
  br label %return, !dbg !648

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !650
  br label %return, !dbg !650

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !652
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !654
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !655
  %conv9 = zext i16 %5 to i32, !dbg !655
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !656
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !656
  %div = sdiv i32 %4, %conv9, !dbg !656, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !657
  %conv10 = zext i16 %6 to i32, !dbg !657
  %mul = mul nsw i32 %div, %conv10, !dbg !658
  %sub = sub nsw i32 %3, %mul, !dbg !659
  %shl = shl i32 %sub, 1, !dbg !660
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !661
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !662
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !663
  %conv11 = zext i16 %8 to i32, !dbg !663
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !664
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !664
  %div12 = sdiv i32 %7, %conv11, !dbg !664, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !665
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !666
  %conv13 = zext i16 %10 to i32, !dbg !666
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !667
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !667
  %div14 = sdiv i32 %9, %conv13, !dbg !667, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !668
  store i32 %add, i32* %s32Temp1, align 4, !dbg !669
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !670
  %cmp15 = icmp slt i32 %11, 65535, !dbg !672
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !673

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !674
  %cmp18 = icmp sgt i32 %12, 0, !dbg !677
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !678

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !679
  %conv21 = trunc i32 %13 to i16, !dbg !681
  store i16 %conv21, i16* %retval, align 2, !dbg !682
  br label %return, !dbg !682

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !683
  br label %return, !dbg !683

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !685
  br label %return, !dbg !685

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !687
  ret i16 %14, !dbg !687
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !688 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !691, metadata !DIExpression()), !dbg !692
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !693, metadata !DIExpression()), !dbg !694
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !695, metadata !DIExpression()), !dbg !696
  store i32 0, i32* %u32Temp, align 4, !dbg !696
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !697
  %conv = zext i16 %0 to i32, !dbg !697
  %cmp = icmp eq i32 %conv, 0, !dbg !699
  br i1 %cmp, label %if.then, label %if.else, !dbg !700

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !701
  br label %return, !dbg !701

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !703
  %conv2 = zext i16 %1 to i32, !dbg !703
  %shl = shl i32 %conv2, 16, !dbg !705
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !706
  %conv3 = zext i16 %2 to i32, !dbg !706
  %shr = ashr i32 %conv3, 1, !dbg !707
  %add = add nsw i32 %shl, %shr, !dbg !708
  store i32 %add, i32* %u32Temp, align 4, !dbg !709
  %3 = load i32, i32* %u32Temp, align 4, !dbg !710
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !711
  %conv4 = zext i16 %4 to i32, !dbg !711
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !712
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !712
  %div = udiv i32 %3, %conv4, !dbg !712, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !713
  %5 = load i32, i32* %u32Temp, align 4, !dbg !714
  %cmp5 = icmp ult i32 %5, 65535, !dbg !716
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !717

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !718
  %and = and i32 %6, 65535, !dbg !720
  %conv8 = trunc i32 %and to i16, !dbg !718
  store i16 %conv8, i16* %retval, align 2, !dbg !721
  br label %return, !dbg !721

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !722
  br label %return, !dbg !722

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !724
  ret i16 %7, !dbg !724
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !725 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !728, metadata !DIExpression()), !dbg !729
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !730, metadata !DIExpression()), !dbg !731
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !732, metadata !DIExpression()), !dbg !733
  store i32 0, i32* %u32Temp1, align 4, !dbg !733
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !734, metadata !DIExpression()), !dbg !735
  store i32 0, i32* %u32Temp2, align 4, !dbg !735
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !736
  %conv = zext i16 %0 to i32, !dbg !736
  %and = and i32 %conv, 65535, !dbg !737
  %conv1 = trunc i32 %and to i16, !dbg !736
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !738
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !739
  %conv2 = zext i16 %1 to i32, !dbg !739
  %cmp = icmp eq i32 %conv2, 0, !dbg !741
  br i1 %cmp, label %if.then, label %if.else, !dbg !742

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !743
  br label %return, !dbg !743

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !745
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !747
  %conv4 = zext i16 %3 to i32, !dbg !747
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !748
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !748
  %div = udiv i32 %2, %conv4, !dbg !748, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !749
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !750
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !751
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !752
  %conv5 = zext i16 %6 to i32, !dbg !752
  %mul = mul i32 %5, %conv5, !dbg !753
  %sub = sub i32 %4, %mul, !dbg !754
  %shl = shl i32 %sub, 1, !dbg !755
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !756
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !757
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !758
  %conv6 = zext i16 %8 to i32, !dbg !758
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !759
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !759
  %div7 = udiv i32 %7, %conv6, !dbg !759, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !760
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !761
  %conv8 = zext i16 %10 to i32, !dbg !761
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !762
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !762
  %div9 = udiv i32 %9, %conv8, !dbg !762, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !763
  store i32 %add, i32* %u32Temp2, align 4, !dbg !764
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !765
  %cmp10 = icmp ult i32 %11, 65535, !dbg !767
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !768

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !769
  %and13 = and i32 %12, 65535, !dbg !771
  %conv14 = trunc i32 %and13 to i16, !dbg !769
  store i16 %conv14, i16* %retval, align 2, !dbg !772
  br label %return, !dbg !772

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !773
  br label %return, !dbg !773

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !775
  ret i16 %13, !dbg !775
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !776 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !779, metadata !DIExpression()), !dbg !780
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !781, metadata !DIExpression()), !dbg !782
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !783, metadata !DIExpression()), !dbg !784
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !785, metadata !DIExpression()), !dbg !786
  store i32 0, i32* %s32Result, align 4, !dbg !786
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !787, metadata !DIExpression()), !dbg !788
  store i32 0, i32* %s32Temp1, align 4, !dbg !788
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !789
  %conv = sext i16 %0 to i32, !dbg !789
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !790
  %conv1 = zext i16 %1 to i32, !dbg !790
  %mul = mul nsw i32 %conv, %conv1, !dbg !791
  store i32 %mul, i32* %s32Result, align 4, !dbg !792
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !793
  %conv2 = sext i16 %2 to i32, !dbg !793
  %cmp = icmp eq i32 %conv2, 0, !dbg !795
  br i1 %cmp, label %if.then, label %if.else7, !dbg !796

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !797
  %cmp4 = icmp slt i32 %3, 0, !dbg !800
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !801

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !802
  br label %return, !dbg !802

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !804
  br label %return, !dbg !804

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !806
  %5 = load i32, i32* %s32Result, align 4, !dbg !808
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !809
  %conv8 = sext i16 %6 to i32, !dbg !809
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !810
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !810
  %div = sdiv i32 %5, %conv8, !dbg !810, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !811
  %conv9 = sext i16 %7 to i32, !dbg !811
  %mul10 = mul nsw i32 %div, %conv9, !dbg !812
  %sub = sub nsw i32 %4, %mul10, !dbg !813
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !814
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !815
  %shl = shl i32 %8, 1, !dbg !816
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !817
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !818
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !819
  %conv11 = sext i16 %10 to i32, !dbg !819
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !820
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !820
  %div12 = sdiv i32 %9, %conv11, !dbg !820, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !821
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !822
  %conv13 = sext i16 %12 to i32, !dbg !822
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !823
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !823
  %div14 = sdiv i32 %11, %conv13, !dbg !823, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !824
  store i32 %add, i32* %s32Result, align 4, !dbg !825
  %13 = load i32, i32* %s32Result, align 4, !dbg !826
  %cmp15 = icmp slt i32 %13, 32767, !dbg !828
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !829

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !830
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !833
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !834

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !835
  %conv21 = trunc i32 %15 to i16, !dbg !837
  store i16 %conv21, i16* %retval, align 2, !dbg !838
  br label %return, !dbg !838

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !839
  br label %return, !dbg !839

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !841
  br label %return, !dbg !841

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !843
  ret i16 %16, !dbg !843
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !844 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !847, metadata !DIExpression()), !dbg !848
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !849, metadata !DIExpression()), !dbg !850
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !851, metadata !DIExpression()), !dbg !852
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !853, metadata !DIExpression()), !dbg !854
  store i32 0, i32* %s32Result, align 4, !dbg !854
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !855, metadata !DIExpression()), !dbg !856
  store i32 0, i32* %s32Temp1, align 4, !dbg !856
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !857
  %conv = zext i16 %0 to i32, !dbg !857
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !858
  %conv1 = sext i16 %1 to i32, !dbg !858
  %mul = mul nsw i32 %conv, %conv1, !dbg !859
  store i32 %mul, i32* %s32Result, align 4, !dbg !860
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !861
  %conv2 = zext i16 %2 to i32, !dbg !861
  %cmp = icmp eq i32 %conv2, 0, !dbg !863
  br i1 %cmp, label %if.then, label %if.else7, !dbg !864

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !865
  %cmp4 = icmp slt i32 %3, 0, !dbg !868
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !869

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !870
  br label %return, !dbg !870

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !872
  br label %return, !dbg !872

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !874
  %5 = load i32, i32* %s32Result, align 4, !dbg !876
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !877
  %conv8 = zext i16 %6 to i32, !dbg !877
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !878
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !878
  %div = sdiv i32 %5, %conv8, !dbg !878, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !879
  %conv9 = zext i16 %7 to i32, !dbg !879
  %mul10 = mul nsw i32 %div, %conv9, !dbg !880
  %sub = sub nsw i32 %4, %mul10, !dbg !881
  %shl = shl i32 %sub, 1, !dbg !882
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !883
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !884
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !885
  %conv11 = zext i16 %9 to i32, !dbg !885
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !886
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !886
  %div12 = sdiv i32 %8, %conv11, !dbg !886, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !887
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !888
  %conv13 = zext i16 %11 to i32, !dbg !888
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !889
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !889
  %div14 = sdiv i32 %10, %conv13, !dbg !889, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !890
  store i32 %add, i32* %s32Result, align 4, !dbg !891
  %12 = load i32, i32* %s32Result, align 4, !dbg !892
  %cmp15 = icmp slt i32 %12, 32767, !dbg !894
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !895

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !896
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !899
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !900

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !901
  %conv21 = trunc i32 %14 to i16, !dbg !903
  store i16 %conv21, i16* %retval, align 2, !dbg !904
  br label %return, !dbg !904

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !905
  br label %return, !dbg !905

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !907
  br label %return, !dbg !907

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !909
  ret i16 %15, !dbg !909
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !910 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !913, metadata !DIExpression()), !dbg !914
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !915, metadata !DIExpression()), !dbg !916
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !917, metadata !DIExpression()), !dbg !918
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !919, metadata !DIExpression()), !dbg !920
  store i32 0, i32* %u32Result, align 4, !dbg !920
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !921, metadata !DIExpression()), !dbg !922
  store i32 0, i32* %u32Temp1, align 4, !dbg !922
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !923, metadata !DIExpression()), !dbg !924
  store i32 0, i32* %s32Result, align 4, !dbg !924
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !925, metadata !DIExpression()), !dbg !926
  store i32 0, i32* %s32Temp1, align 4, !dbg !926
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !927
  %conv = sext i16 %0 to i32, !dbg !927
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !928
  %conv1 = zext i16 %1 to i32, !dbg !928
  %mul = mul nsw i32 %conv, %conv1, !dbg !929
  store i32 %mul, i32* %s32Result, align 4, !dbg !930
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !931
  %conv2 = sext i16 %2 to i32, !dbg !931
  %cmp = icmp eq i32 %conv2, 0, !dbg !933
  br i1 %cmp, label %if.then, label %if.else7, !dbg !934

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !935
  %cmp4 = icmp sge i32 %3, 0, !dbg !938
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !939

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !940
  br label %return, !dbg !940

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !942
  br label %return, !dbg !942

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !944
  %5 = load i32, i32* %s32Result, align 4, !dbg !946
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !947
  %conv8 = sext i16 %6 to i32, !dbg !947
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !948
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !948
  %div = sdiv i32 %5, %conv8, !dbg !948, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !949
  %conv9 = sext i16 %7 to i32, !dbg !949
  %mul10 = mul nsw i32 %div, %conv9, !dbg !950
  %sub = sub nsw i32 %4, %mul10, !dbg !951
  %shl = shl i32 %sub, 1, !dbg !952
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !953
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !954
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !955
  %conv11 = sext i16 %9 to i32, !dbg !955
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !956
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !956
  %div12 = sdiv i32 %8, %conv11, !dbg !956, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !957
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !958
  %conv13 = sext i16 %11 to i32, !dbg !958
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !959
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !959
  %div14 = sdiv i32 %10, %conv13, !dbg !959, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !960
  store i32 %add, i32* %s32Result, align 4, !dbg !961
  %12 = load i32, i32* %s32Result, align 4, !dbg !962
  %cmp15 = icmp slt i32 %12, 65535, !dbg !964
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !965

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !966
  %cmp18 = icmp sgt i32 %13, 0, !dbg !969
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !970

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !971
  %conv21 = trunc i32 %14 to i16, !dbg !973
  store i16 %conv21, i16* %retval, align 2, !dbg !974
  br label %return, !dbg !974

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !975
  br label %return, !dbg !975

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !977
  br label %return, !dbg !977

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !979
  ret i16 %15, !dbg !979
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !980 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !983, metadata !DIExpression()), !dbg !984
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !985, metadata !DIExpression()), !dbg !986
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !987, metadata !DIExpression()), !dbg !988
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !989, metadata !DIExpression()), !dbg !990
  store i32 0, i32* %s32Result, align 4, !dbg !990
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !991, metadata !DIExpression()), !dbg !992
  store i32 0, i32* %s32Temp1, align 4, !dbg !992
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !993
  %conv = sext i16 %0 to i32, !dbg !993
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !994
  %conv1 = zext i16 %1 to i32, !dbg !994
  %mul = mul nsw i32 %conv, %conv1, !dbg !995
  store i32 %mul, i32* %s32Result, align 4, !dbg !996
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !997
  %conv2 = zext i16 %2 to i32, !dbg !997
  %cmp = icmp eq i32 %conv2, 0, !dbg !999
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1000

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1001
  %cmp4 = icmp sge i32 %3, 0, !dbg !1004
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1005

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !1006
  br label %return, !dbg !1006

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1008
  br label %return, !dbg !1008

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1010
  %5 = load i32, i32* %s32Result, align 4, !dbg !1012
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1013
  %conv8 = zext i16 %6 to i32, !dbg !1013
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1014
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1014
  %div = sdiv i32 %5, %conv8, !dbg !1014, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1015
  %conv9 = zext i16 %7 to i32, !dbg !1015
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1016
  %sub = sub nsw i32 %4, %mul10, !dbg !1017
  %shl = shl i32 %sub, 1, !dbg !1018
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1019
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1020
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1021
  %conv11 = zext i16 %9 to i32, !dbg !1021
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1022
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1022
  %div12 = sdiv i32 %8, %conv11, !dbg !1022, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1023
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1024
  %conv13 = zext i16 %11 to i32, !dbg !1024
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1025
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1025
  %div14 = sdiv i32 %10, %conv13, !dbg !1025, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1026
  store i32 %add, i32* %s32Result, align 4, !dbg !1027
  %12 = load i32, i32* %s32Result, align 4, !dbg !1028
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1030
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1031

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1032
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1035
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1036

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1037
  %conv21 = trunc i32 %14 to i16, !dbg !1039
  store i16 %conv21, i16* %retval, align 2, !dbg !1040
  br label %return, !dbg !1040

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1041
  br label %return, !dbg !1041

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1043
  br label %return, !dbg !1043

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1045
  ret i16 %15, !dbg !1045
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1046 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1049, metadata !DIExpression()), !dbg !1050
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1051, metadata !DIExpression()), !dbg !1052
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1053, metadata !DIExpression()), !dbg !1054
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1055, metadata !DIExpression()), !dbg !1056
  store i32 0, i32* %u32Temp1, align 4, !dbg !1056
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1057, metadata !DIExpression()), !dbg !1058
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1058
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1059
  %conv = zext i16 %0 to i32, !dbg !1059
  %cmp = icmp eq i32 %conv, 0, !dbg !1061
  br i1 %cmp, label %if.then, label %if.else, !dbg !1062

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1063
  br label %return, !dbg !1063

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1065
  %conv2 = zext i16 %1 to i32, !dbg !1065
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1067
  %conv3 = zext i16 %2 to i32, !dbg !1067
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1068
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1069
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1070
  %conv4 = zext i16 %3 to i32, !dbg !1070
  %shr = ashr i32 %conv4, 1, !dbg !1071
  %conv5 = trunc i32 %shr to i16, !dbg !1070
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1072
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1073
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1074
  %conv6 = zext i16 %5 to i32, !dbg !1074
  %add = add i32 %4, %conv6, !dbg !1075
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1076
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1077
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1078
  %conv7 = zext i16 %7 to i32, !dbg !1078
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1079
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1079
  %div = udiv i32 %6, %conv7, !dbg !1079, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1080
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1081
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1083
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1084

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1085
  %and = and i32 %9, 65535, !dbg !1087
  %conv11 = trunc i32 %and to i16, !dbg !1088
  store i16 %conv11, i16* %retval, align 2, !dbg !1089
  br label %return, !dbg !1089

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1090
  br label %return, !dbg !1090

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1092
  ret i16 %10, !dbg !1092
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1093 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1096, metadata !DIExpression()), !dbg !1097
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1098, metadata !DIExpression()), !dbg !1099
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1100, metadata !DIExpression()), !dbg !1101
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1102, metadata !DIExpression()), !dbg !1103
  store i32 0, i32* %u32Temp1, align 4, !dbg !1103
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1104
  %cmp = icmp eq i32 %0, 0, !dbg !1106
  br i1 %cmp, label %if.then, label %if.else, !dbg !1107

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1108
  br label %return, !dbg !1108

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1110
  %conv = zext i16 %1 to i32, !dbg !1110
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1112
  %conv1 = zext i16 %2 to i32, !dbg !1112
  %mul = mul nsw i32 %conv, %conv1, !dbg !1113
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1114
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1115
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1115
  %div = udiv i32 %mul, %3, !dbg !1115, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1116
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1117
  %conv2 = zext i16 %4 to i32, !dbg !1117
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1119
  %conv3 = zext i16 %5 to i32, !dbg !1119
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1120
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1121
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1122
  %mul5 = mul i32 %6, %7, !dbg !1123
  %sub = sub i32 %mul4, %mul5, !dbg !1124
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1125
  %div6 = udiv i32 %8, 2, !dbg !1126
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1127
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1128

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1129
  %inc = add i32 %9, 1, !dbg !1129
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1129
  br label %if.end, !dbg !1131

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1132
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1134
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1135

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1136
  %and = and i32 %11, 65535, !dbg !1138
  %conv13 = trunc i32 %and to i16, !dbg !1139
  store i16 %conv13, i16* %retval, align 2, !dbg !1140
  br label %return, !dbg !1140

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1141
  br label %return, !dbg !1141

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1143
  ret i16 %12, !dbg !1143
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1144 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1147, metadata !DIExpression()), !dbg !1148
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1149, metadata !DIExpression()), !dbg !1150
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1151, metadata !DIExpression()), !dbg !1152
  store i32 0, i32* %u32Temp1, align 4, !dbg !1152
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1153
  %conv = zext i16 %0 to i32, !dbg !1153
  %cmp = icmp eq i32 %conv, 0, !dbg !1155
  br i1 %cmp, label %if.then, label %if.else, !dbg !1156

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1157
  br label %return, !dbg !1157

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1159
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1161
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1162
  %conv2 = zext i16 %3 to i32, !dbg !1162
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1163
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1163
  %div = udiv i32 %2, %conv2, !dbg !1163, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1164
  %conv3 = zext i16 %4 to i32, !dbg !1164
  %mul = mul i32 %div, %conv3, !dbg !1165
  %sub = sub i32 %1, %mul, !dbg !1166
  %shl = shl i32 %sub, 1, !dbg !1167
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1168
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1169
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1170
  %conv4 = zext i16 %6 to i32, !dbg !1170
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1171
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1171
  %div5 = udiv i32 %5, %conv4, !dbg !1171, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1172
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1173
  %conv6 = zext i16 %8 to i32, !dbg !1173
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1174
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1174
  %div7 = udiv i32 %7, %conv6, !dbg !1174, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1175
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1176
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1177
  store i32 %9, i32* %retval, align 4, !dbg !1178
  br label %return, !dbg !1178

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1179
  ret i32 %10, !dbg !1179
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1180 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1183, metadata !DIExpression()), !dbg !1184
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1185, metadata !DIExpression()), !dbg !1186
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1187, metadata !DIExpression()), !dbg !1188
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1189, metadata !DIExpression()), !dbg !1190
  store i32 0, i32* %s32Temp1, align 4, !dbg !1190
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1191, metadata !DIExpression()), !dbg !1192
  store i32 0, i32* %s32Temp2, align 4, !dbg !1192
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1193, metadata !DIExpression()), !dbg !1194
  store i32 0, i32* %s32Temp3, align 4, !dbg !1194
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1195
  %conv = sext i16 %0 to i32, !dbg !1195
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1196
  %conv1 = sext i16 %1 to i32, !dbg !1196
  %mul = mul nsw i32 %conv, %conv1, !dbg !1197
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1198
  %2 = load i16, i16* %div.addr, align 2, !dbg !1199
  %conv2 = sext i16 %2 to i32, !dbg !1199
  %cmp = icmp eq i32 %conv2, 0, !dbg !1201
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1202

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1203
  %cmp4 = icmp slt i32 %3, 0, !dbg !1206
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1207

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1208
  br label %return, !dbg !1208

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1210
  br label %return, !dbg !1210

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1212
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1214
  %6 = load i16, i16* %div.addr, align 2, !dbg !1215
  %conv8 = sext i16 %6 to i32, !dbg !1215
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1216
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1216
  %div9 = sdiv i32 %5, %conv8, !dbg !1216, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1217
  %conv10 = sext i16 %7 to i32, !dbg !1217
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1218
  %sub = sub nsw i32 %4, %mul11, !dbg !1219
  %shl = shl i32 %sub, 1, !dbg !1220
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1221
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1222
  %9 = load i16, i16* %div.addr, align 2, !dbg !1223
  %conv12 = sext i16 %9 to i32, !dbg !1223
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1224
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1224
  %div13 = sdiv i32 %8, %conv12, !dbg !1224, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1225
  %11 = load i16, i16* %div.addr, align 2, !dbg !1226
  %conv14 = sext i16 %11 to i32, !dbg !1226
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1227
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1227
  %div15 = sdiv i32 %10, %conv14, !dbg !1227, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1228
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1229
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1230
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1232
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1233

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1234
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1237
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1238

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1239
  %conv22 = trunc i32 %14 to i16, !dbg !1241
  store i16 %conv22, i16* %retval, align 2, !dbg !1242
  br label %return, !dbg !1242

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1243
  br label %return, !dbg !1243

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1245
  br label %return, !dbg !1245

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1247
  ret i16 %15, !dbg !1247
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1248 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1251, metadata !DIExpression()), !dbg !1252
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1253, metadata !DIExpression()), !dbg !1254
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1255, metadata !DIExpression()), !dbg !1256
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1257, metadata !DIExpression()), !dbg !1258
  store i32 0, i32* %s32Result, align 4, !dbg !1258
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1259, metadata !DIExpression()), !dbg !1260
  store i32 0, i32* %s32Temp1, align 4, !dbg !1260
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1261
  %conv = sext i16 %0 to i32, !dbg !1261
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1262
  %conv1 = sext i16 %1 to i32, !dbg !1262
  %mul = mul nsw i32 %conv, %conv1, !dbg !1263
  store i32 %mul, i32* %s32Result, align 4, !dbg !1264
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1265
  %conv2 = zext i16 %2 to i32, !dbg !1265
  %cmp = icmp eq i32 %conv2, 0, !dbg !1267
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1268

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1269
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1272
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1273

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1274
  br label %return, !dbg !1274

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1276
  %cmp7 = icmp eq i32 %4, 0, !dbg !1278
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1279

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1280
  br label %return, !dbg !1280

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1282
  br label %return, !dbg !1282

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1284
  %6 = load i32, i32* %s32Result, align 4, !dbg !1286
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1287
  %conv12 = zext i16 %7 to i32, !dbg !1287
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1288
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1288
  %div = sdiv i32 %6, %conv12, !dbg !1288, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1289
  %conv13 = zext i16 %8 to i32, !dbg !1289
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1290
  %sub = sub nsw i32 %5, %mul14, !dbg !1291
  %shl = shl i32 %sub, 1, !dbg !1292
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1293
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1294
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1295
  %conv15 = zext i16 %10 to i32, !dbg !1295
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1296
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1296
  %div16 = sdiv i32 %9, %conv15, !dbg !1296, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1297
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1298
  %conv17 = zext i16 %12 to i32, !dbg !1298
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1299
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1299
  %div18 = sdiv i32 %11, %conv17, !dbg !1299, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1300
  store i32 %add, i32* %s32Result, align 4, !dbg !1301
  %13 = load i32, i32* %s32Result, align 4, !dbg !1302
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1304
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1305

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1306
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1309
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1310

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1311
  %conv25 = trunc i32 %15 to i16, !dbg !1313
  store i16 %conv25, i16* %retval, align 2, !dbg !1314
  br label %return, !dbg !1314

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1315
  br label %return, !dbg !1315

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1317
  br label %return, !dbg !1317

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1319
  ret i16 %16, !dbg !1319
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1320 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1323, metadata !DIExpression()), !dbg !1324
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1325, metadata !DIExpression()), !dbg !1326
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1327, metadata !DIExpression()), !dbg !1328
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1329
  %cmp = icmp eq i32 %0, 0, !dbg !1331
  br i1 %cmp, label %if.then, label %if.else, !dbg !1332

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1333
  br label %return, !dbg !1333

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1335
  %cmp1 = icmp sle i32 %1, 0, !dbg !1338
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1339

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1340
  br label %return, !dbg !1340

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1342
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1344
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1345
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1346
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1346
  %div = udiv i32 %3, %4, !dbg !1346, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1347
  %mul = mul i32 %div, %5, !dbg !1348
  %sub = sub i32 %2, %mul, !dbg !1349
  %shl = shl i32 %sub, 1, !dbg !1350
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1351
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1352
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1353
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1354
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1354
  %div4 = udiv i32 %6, %7, !dbg !1354, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1355
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1356
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1357
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1357
  %div5 = udiv i32 %8, %9, !dbg !1357, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1358
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1359
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1360
  store i32 %10, i32* %retval, align 4, !dbg !1361
  br label %return, !dbg !1361

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1362
  ret i32 %11, !dbg !1362
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1363 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1366, metadata !DIExpression()), !dbg !1367
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1368, metadata !DIExpression()), !dbg !1369
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1370, metadata !DIExpression()), !dbg !1371
  store i32 0, i32* %s32Temp1, align 4, !dbg !1371
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1372
  %cmp = icmp eq i32 %0, 0, !dbg !1374
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1375

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1376
  %cmp1 = icmp sge i32 %1, 0, !dbg !1379
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1380

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1381
  br label %return, !dbg !1381

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1383
  br label %return, !dbg !1383

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1385
  %cmp4 = icmp sge i32 %2, 0, !dbg !1388
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1389

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1390
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1392
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1393
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1394
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1394
  %div = udiv i32 %4, %5, !dbg !1394, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1395
  %mul = mul i32 %div, %6, !dbg !1396
  %sub = sub i32 %3, %mul, !dbg !1397
  %shl = shl i32 %sub, 1, !dbg !1398
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1399
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1400
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1401
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1402
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1402
  %div6 = udiv i32 %7, %8, !dbg !1402, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1403
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1404
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1405
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1405
  %div7 = udiv i32 %9, %10, !dbg !1405, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1406
  store i32 %add, i32* %retval, align 4, !dbg !1407
  br label %return, !dbg !1407

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1408
  br label %return, !dbg !1408

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1410
  ret i32 %11, !dbg !1410
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1411 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1414, metadata !DIExpression()), !dbg !1415
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1416, metadata !DIExpression()), !dbg !1417
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1418, metadata !DIExpression()), !dbg !1419
  store i32 0, i32* %u32Temp1, align 4, !dbg !1419
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1420, metadata !DIExpression()), !dbg !1421
  store i32 0, i32* %u32Temp2, align 4, !dbg !1421
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1422
  %cmp = icmp eq i32 %0, 0, !dbg !1424
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1425

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1426
  %cmp1 = icmp slt i32 %1, 0, !dbg !1429
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1430

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1431
  br label %return, !dbg !1431

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1433
  br label %return, !dbg !1433

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1435
  %cmp4 = icmp sge i32 %2, 0, !dbg !1438
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1439

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1440
  %cmp6 = icmp eq i32 %3, 0, !dbg !1443
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1444

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1445
  br label %return, !dbg !1445

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1447
  %cmp9 = icmp sle i32 %4, 0, !dbg !1450
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1451

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1452
  br label %return, !dbg !1452

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1454
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1456
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1457
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1458
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1458
  %div = sdiv i32 %6, %7, !dbg !1458, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1459
  %mul = mul nsw i32 %div, %8, !dbg !1460
  %sub = sub nsw i32 %5, %mul, !dbg !1461
  %shl = shl i32 %sub, 1, !dbg !1462
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1463
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1464
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1465
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1466
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1466
  %div12 = udiv i32 %9, %10, !dbg !1466, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1467
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1468
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1469
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1469
  %div13 = sdiv i32 %11, %12, !dbg !1469, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1470
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1471
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1472
  store i32 %13, i32* %retval, align 4, !dbg !1473
  br label %return, !dbg !1473

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1474
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1477
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1478

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1479
  br label %return, !dbg !1479

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1481
  %sub18 = sub nsw i32 0, %15, !dbg !1483
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1484
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1485
  %sub19 = sub nsw i32 0, %16, !dbg !1486
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1487
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1488
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1489
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1490
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1491
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1491
  %div20 = sdiv i32 %18, %19, !dbg !1491, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1492
  %mul21 = mul nsw i32 %div20, %20, !dbg !1493
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1494
  %shl23 = shl i32 %sub22, 1, !dbg !1495
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1496
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1497
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1498
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1499
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1499
  %div24 = udiv i32 %21, %22, !dbg !1499, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1500
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1501
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1502
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1502
  %div25 = sdiv i32 %23, %24, !dbg !1502, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1503
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1504
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1505
  store i32 %25, i32* %retval, align 4, !dbg !1506
  br label %return, !dbg !1506

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1507
  ret i32 %26, !dbg !1507
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1508 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1511, metadata !DIExpression()), !dbg !1512
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1513, metadata !DIExpression()), !dbg !1514
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1515, metadata !DIExpression()), !dbg !1516
  store i32 0, i32* %u32Temp1, align 4, !dbg !1516
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1517, metadata !DIExpression()), !dbg !1518
  store i32 0, i32* %u32Temp2, align 4, !dbg !1518
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1519, metadata !DIExpression()), !dbg !1520
  store i32 0, i32* %u32Temp3, align 4, !dbg !1520
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1521, metadata !DIExpression()), !dbg !1522
  store i32 0, i32* %numerator_old, align 4, !dbg !1522
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1523
  %cmp = icmp eq i32 %0, 0, !dbg !1525
  br i1 %cmp, label %if.then, label %if.else, !dbg !1526

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1527
  br label %return, !dbg !1527

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1529
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1531
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1532
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1533
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1534
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1534
  %div = udiv i32 %3, %4, !dbg !1534, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1535
  %sub = sub i32 %1, %mul, !dbg !1536
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1537
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1538
  %and = and i32 %5, 1, !dbg !1540
  %cmp1 = icmp eq i32 %and, 0, !dbg !1541
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1542

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1543
  %shr = lshr i32 %6, 1, !dbg !1545
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1546
  br label %if.end, !dbg !1547

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1548
  %shr4 = lshr i32 %7, 1, !dbg !1550
  %add = add i32 %shr4, 1, !dbg !1551
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1552
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1553
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1555
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1556
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1557

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1558
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1560
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1561
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1561
  %div7 = udiv i32 %10, %11, !dbg !1561, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1562
  br label %return, !dbg !1562

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1563
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1565
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1566
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1566
  %div9 = udiv i32 %12, %13, !dbg !1566, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1567
  store i32 %add10, i32* %retval, align 4, !dbg !1568
  br label %return, !dbg !1568

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1569
  ret i32 %14, !dbg !1569
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1570 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1573, metadata !DIExpression()), !dbg !1574
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1575, metadata !DIExpression()), !dbg !1576
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1577, metadata !DIExpression()), !dbg !1578
  store i32 0, i32* %u32Temp1, align 4, !dbg !1578
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1579, metadata !DIExpression()), !dbg !1580
  store i32 0, i32* %u32Temp2, align 4, !dbg !1580
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1581
  %cmp = icmp sle i32 %0, 0, !dbg !1583
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1584

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1585
  %cmp1 = icmp sge i32 %1, 0, !dbg !1588
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1589

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1590
  br label %return, !dbg !1590

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1592
  %sub = sub nsw i32 0, %2, !dbg !1594
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1595
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1596
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1597
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1598
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1599
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1599
  %div = udiv i32 %4, %5, !dbg !1599, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1600
  %mul = mul i32 %div, %6, !dbg !1601
  %sub3 = sub i32 %3, %mul, !dbg !1602
  %shl = shl i32 %sub3, 1, !dbg !1603
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1604
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1605
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1606
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1607
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1607
  %div4 = udiv i32 %7, %8, !dbg !1607, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1608
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1609
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1610
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1610
  %div5 = udiv i32 %9, %10, !dbg !1610, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1611
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1612
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1613
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1615
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1616

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1617
  %sub8 = sub i32 0, %12, !dbg !1619
  store i32 %sub8, i32* %retval, align 4, !dbg !1620
  br label %return, !dbg !1620

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1621
  br label %return, !dbg !1621

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1623
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1625
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1626
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1627
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1627
  %div11 = udiv i32 %14, %15, !dbg !1627, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1628
  %mul12 = mul i32 %div11, %16, !dbg !1629
  %sub13 = sub i32 %13, %mul12, !dbg !1630
  %shl14 = shl i32 %sub13, 1, !dbg !1631
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1632
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1633
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1634
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1635
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1635
  %div15 = udiv i32 %17, %18, !dbg !1635, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1636
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1637
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1638
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1638
  %div16 = udiv i32 %19, %20, !dbg !1638, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1639
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1640
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1641
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1643
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1644

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1645
  store i32 %22, i32* %retval, align 4, !dbg !1647
  br label %return, !dbg !1647

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1648
  br label %return, !dbg !1648

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1650
  ret i32 %23, !dbg !1650
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1651 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1654, metadata !DIExpression()), !dbg !1655
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1656, metadata !DIExpression()), !dbg !1657
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1658, metadata !DIExpression()), !dbg !1659
  store i32 0, i32* %s32Temp1, align 4, !dbg !1659
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1660, metadata !DIExpression()), !dbg !1661
  store i32 0, i32* %s32Temp2, align 4, !dbg !1661
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1662, metadata !DIExpression()), !dbg !1663
  store i32 0, i32* %u32Temp0, align 4, !dbg !1663
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1664, metadata !DIExpression()), !dbg !1665
  store i32 0, i32* %u32Temp1, align 4, !dbg !1665
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1666, metadata !DIExpression()), !dbg !1667
  store i32 0, i32* %u32Temp2, align 4, !dbg !1667
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1668
  %cmp = icmp eq i32 %0, 0, !dbg !1670
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1671

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1672
  %cmp1 = icmp slt i32 %1, 0, !dbg !1675
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1676

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1677
  br label %return, !dbg !1677

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1679
  br label %return, !dbg !1679

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1681
  %cmp4 = icmp sle i32 %2, 0, !dbg !1684
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1685

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1686
  %sub = sub nsw i32 0, %3, !dbg !1688
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1689
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1690
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1691
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1692
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1692
  %div = udiv i32 %4, %5, !dbg !1692, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1693
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1694
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1695
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1696
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1697
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1697
  %div6 = udiv i32 %7, %8, !dbg !1697, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1698
  %mul = mul i32 %div6, %9, !dbg !1699
  %sub7 = sub i32 %6, %mul, !dbg !1700
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1701
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1702
  %and = and i32 %10, 1, !dbg !1704
  %cmp8 = icmp eq i32 %and, 0, !dbg !1705
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1706

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1707
  %shr = lshr i32 %11, 1, !dbg !1709
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1710
  br label %if.end, !dbg !1711

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1712
  %shr11 = lshr i32 %12, 1, !dbg !1714
  %add = add i32 %shr11, 1, !dbg !1715
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1716
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1717
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1719
  %cmp12 = icmp ult i32 %13, %14, !dbg !1720
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1721

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1722
  %neg = xor i32 %15, -1, !dbg !1724
  %add14 = add i32 %neg, 1, !dbg !1725
  store i32 %add14, i32* %retval, align 4, !dbg !1726
  br label %return, !dbg !1726

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1727
  %add16 = add i32 %16, 1, !dbg !1729
  %neg17 = xor i32 %add16, -1, !dbg !1730
  %add18 = add i32 %neg17, 1, !dbg !1731
  store i32 %add18, i32* %retval, align 4, !dbg !1732
  br label %return, !dbg !1732

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1733
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1735
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1736
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1737
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1737
  %div20 = udiv i32 %18, %19, !dbg !1737, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1738
  %mul21 = mul i32 %div20, %20, !dbg !1739
  %sub22 = sub i32 %17, %mul21, !dbg !1740
  %shl = shl i32 %sub22, 1, !dbg !1741
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1742
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1743
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1744
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1745
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1745
  %div23 = udiv i32 %21, %22, !dbg !1745, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1746
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1747
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1748
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1748
  %div24 = udiv i32 %23, %24, !dbg !1748, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1749
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1750
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1751
  store i32 %25, i32* %retval, align 4, !dbg !1752
  br label %return, !dbg !1752

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1753
  ret i32 %26, !dbg !1753
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1754 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1757, metadata !DIExpression()), !dbg !1758
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1759, metadata !DIExpression()), !dbg !1760
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1761, metadata !DIExpression()), !dbg !1762
  store i32 0, i32* %s32Temp1, align 4, !dbg !1762
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1763, metadata !DIExpression()), !dbg !1764
  store i32 0, i32* %s32Temp2, align 4, !dbg !1764
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1765, metadata !DIExpression()), !dbg !1766
  store i32 0, i32* %denominator_prime, align 4, !dbg !1766
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1767, metadata !DIExpression()), !dbg !1768
  store i32 0, i32* %u32Temp1, align 4, !dbg !1768
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1769, metadata !DIExpression()), !dbg !1770
  store i32 0, i32* %u32Temp2, align 4, !dbg !1770
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1771, metadata !DIExpression()), !dbg !1772
  store i32 0, i32* %u32numerator, align 4, !dbg !1772
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1773, metadata !DIExpression()), !dbg !1774
  store i32 0, i32* %u32denominator, align 4, !dbg !1774
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1775
  %cmp = icmp slt i32 %0, 0, !dbg !1777
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1778

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1779
  %cmp1 = icmp sle i32 %1, 0, !dbg !1782
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1783

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1784
  %cmp3 = icmp sge i32 %2, 0, !dbg !1787
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1788

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1789
  br label %return, !dbg !1789

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1791
  %sub = sub nsw i32 0, %3, !dbg !1793
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1794
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1795
  %sub5 = sub nsw i32 0, %4, !dbg !1796
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1797
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1798
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1799
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1800
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1801
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1801
  %div = udiv i32 %6, %7, !dbg !1801, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1802
  %mul = mul i32 %div, %8, !dbg !1803
  %sub6 = sub i32 %5, %mul, !dbg !1804
  %shl = shl i32 %sub6, 1, !dbg !1805
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1806
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1807
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1808
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1809
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1809
  %div7 = udiv i32 %9, %10, !dbg !1809, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1810
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1811
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1812
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1812
  %div8 = udiv i32 %11, %12, !dbg !1812, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1813
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1814
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1815
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1817
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1818

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1819
  store i32 %14, i32* %retval, align 4, !dbg !1821
  br label %return, !dbg !1821

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1822
  br label %return, !dbg !1822

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1824
  %neg = xor i32 %15, -1, !dbg !1826
  %add13 = add nsw i32 %neg, 1, !dbg !1827
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1828
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1829
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1830
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1831
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1832
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1832
  %div14 = udiv i32 %17, %18, !dbg !1832, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1833
  %mul15 = mul i32 %div14, %19, !dbg !1834
  %sub16 = sub i32 %16, %mul15, !dbg !1835
  %shl17 = shl i32 %sub16, 1, !dbg !1836
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1837
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1838
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1839
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1840
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1840
  %div18 = udiv i32 %20, %21, !dbg !1840, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1841
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1842
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1843
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1843
  %div19 = sdiv i32 %22, %23, !dbg !1843, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1844
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1845
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1846
  %neg21 = xor i32 %24, -1, !dbg !1847
  %add22 = add nsw i32 %neg21, 1, !dbg !1848
  store i32 %add22, i32* %retval, align 4, !dbg !1849
  br label %return, !dbg !1849

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1850
  %cmp24 = icmp sle i32 %25, 0, !dbg !1853
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1854

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1855
  %cmp26 = icmp sge i32 %26, 0, !dbg !1858
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1859

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1860
  br label %return, !dbg !1860

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1862
  %neg29 = xor i32 %27, -1, !dbg !1864
  %add30 = add nsw i32 %neg29, 1, !dbg !1865
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1866
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1867
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1868
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1869
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1870
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1870
  %div31 = udiv i32 %29, %30, !dbg !1870, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1871
  %mul32 = mul i32 %div31, %31, !dbg !1872
  %sub33 = sub i32 %28, %mul32, !dbg !1873
  %shl34 = shl i32 %sub33, 1, !dbg !1874
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1875
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1876
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1877
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1878
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1878
  %div35 = udiv i32 %32, %33, !dbg !1878, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1879
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1880
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1881
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1881
  %div36 = udiv i32 %34, %35, !dbg !1881, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1882
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1883
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1884
  %neg38 = xor i32 %36, -1, !dbg !1885
  %add39 = add nsw i32 %neg38, 1, !dbg !1886
  store i32 %add39, i32* %retval, align 4, !dbg !1887
  br label %return, !dbg !1887

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1888
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1890
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1891
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1892
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1892
  %div41 = sdiv i32 %38, %39, !dbg !1892, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1893
  %mul42 = mul nsw i32 %div41, %40, !dbg !1894
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1895
  %shl44 = shl i32 %sub43, 1, !dbg !1896
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1897
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1898
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1899
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1900
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1900
  %div45 = sdiv i32 %41, %42, !dbg !1900, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1901
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1902
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1903
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1903
  %div46 = udiv i32 %43, %44, !dbg !1903, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1904
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1905
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1906
  store i32 %45, i32* %retval, align 4, !dbg !1907
  br label %return, !dbg !1907

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1908
  ret i32 %46, !dbg !1908
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1909 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1912, metadata !DIExpression()), !dbg !1913
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1914, metadata !DIExpression()), !dbg !1915
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1916, metadata !DIExpression()), !dbg !1917
  store i32 0, i32* %numerator_prime, align 4, !dbg !1917
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1918, metadata !DIExpression()), !dbg !1919
  store i32 0, i32* %u32Temp1, align 4, !dbg !1919
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1920, metadata !DIExpression()), !dbg !1921
  store i32 0, i32* %u32Temp2, align 4, !dbg !1921
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1922, metadata !DIExpression()), !dbg !1923
  store i32 0, i32* %u32Temp3, align 4, !dbg !1923
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1924, metadata !DIExpression()), !dbg !1925
  store i32 0, i32* %s32Temp1, align 4, !dbg !1925
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1926, metadata !DIExpression()), !dbg !1927
  store i32 0, i32* %s32Temp2, align 4, !dbg !1927
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1928, metadata !DIExpression()), !dbg !1929
  store i32 0, i32* %s32Temp3, align 4, !dbg !1929
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1930
  %cmp = icmp eq i32 %0, 0, !dbg !1932
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1933

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1934
  %cmp1 = icmp slt i32 %1, 0, !dbg !1937
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1938

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1939
  br label %return, !dbg !1939

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1941
  br label %return, !dbg !1941

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1943
  %cmp4 = icmp slt i32 %2, 0, !dbg !1946
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1947

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1948
  %sub = sub nsw i32 0, %3, !dbg !1950
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1951
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1952
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1953
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1954
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1954
  %div = udiv i32 %4, %5, !dbg !1954, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1955
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1956
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1957
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1958
  %mul = mul i32 %7, %8, !dbg !1959
  %sub6 = sub i32 %6, %mul, !dbg !1960
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1961
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1962
  %and = and i32 %9, 1, !dbg !1964
  %cmp7 = icmp eq i32 %and, 0, !dbg !1965
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1966

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1967
  %shr = lshr i32 %10, 1, !dbg !1969
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1970
  br label %if.end, !dbg !1971

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1972
  %shr10 = lshr i32 %11, 1, !dbg !1974
  %add = add i32 %shr10, 1, !dbg !1975
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1976
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1977
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1979
  %cmp11 = icmp ult i32 %12, %13, !dbg !1980
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1981

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1982
  %neg = xor i32 %14, -1, !dbg !1984
  %add13 = add i32 %neg, 1, !dbg !1985
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1986
  br label %if.end18, !dbg !1987

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1988
  %add15 = add i32 %15, 1, !dbg !1990
  %neg16 = xor i32 %add15, -1, !dbg !1991
  %add17 = add i32 %neg16, 1, !dbg !1992
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1993
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1994
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1996
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1997

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1998
  %conv = trunc i32 %17 to i16, !dbg !2000
  store i16 %conv, i16* %retval, align 2, !dbg !2001
  br label %return, !dbg !2001

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !2002
  br label %return, !dbg !2002

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !2004
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !2006
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !2007
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !2007
  %div23 = udiv i32 %18, %19, !dbg !2007, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !2008
  %mul24 = mul i32 %div23, %20, !dbg !2009
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !2010
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !2011
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !2012
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !2013
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !2014
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !2014
  %div25 = udiv i32 %22, %23, !dbg !2014, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !2015
  %mul26 = mul i32 %div25, %24, !dbg !2016
  %sub27 = sub i32 %21, %mul26, !dbg !2017
  %shl = shl i32 %sub27, 1, !dbg !2018
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !2019
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !2020
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !2021
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !2022
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !2022
  %div28 = udiv i32 %25, %26, !dbg !2022, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !2023
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !2024
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !2025
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !2025
  %div29 = udiv i32 %27, %28, !dbg !2025, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !2026
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2027
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2028
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2030
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2031

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2032
  %conv34 = trunc i32 %30 to i16, !dbg !2034
  store i16 %conv34, i16* %retval, align 2, !dbg !2035
  br label %return, !dbg !2035

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2036
  br label %return, !dbg !2036

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2038
  ret i16 %31, !dbg !2038
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2039 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2045, metadata !DIExpression()), !dbg !2046
  %2 = icmp eq i64 %0, 0, !dbg !2047
  br i1 %2, label %3, label %4, !dbg !2049

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2050
  unreachable, !dbg !2050

4:                                                ; preds = %1
  ret void, !dbg !2051
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2052 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2058, metadata !DIExpression()), !dbg !2060
  call void @llvm.dbg.value(metadata i64 %1, metadata !2059, metadata !DIExpression()), !dbg !2060
  %3 = icmp ult i64 %1, %0, !dbg !2061
  br i1 %3, label %5, label %4, !dbg !2063

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2064
  unreachable, !dbg !2064

5:                                                ; preds = %2
  ret void, !dbg !2066
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0030/div_Ccode_alarm_0030.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0030")
!4 = !{}
!5 = !{!6, !13, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0030")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0030")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0030/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0030")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0030")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0030")
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
!332 = !DILocation(line: 317, column: 36, scope: !219)
!333 = !DILocation(line: 317, column: 53, scope: !219)
!334 = !DILocation(line: 317, column: 70, scope: !219)
!335 = !DILocation(line: 317, column: 65, scope: !219)
!336 = !DILocation(line: 317, column: 63, scope: !219)
!337 = !DILocation(line: 317, column: 45, scope: !219)
!338 = !DILocation(line: 317, column: 26, scope: !219)
!339 = !DILocation(line: 317, column: 24, scope: !219)
!340 = !DILocation(line: 318, column: 4, scope: !219)
!341 = !DILocation(line: 337, column: 7, scope: !342)
!342 = distinct !DILexicalBlock(scope: !343, file: !69, line: 337, column: 7)
!343 = distinct !DILexicalBlock(scope: !213, file: !69, line: 336, column: 3)
!344 = !DILocation(line: 337, column: 19, scope: !342)
!345 = !DILocation(line: 337, column: 7, scope: !343)
!346 = !DILocation(line: 339, column: 17, scope: !347)
!347 = distinct !DILexicalBlock(scope: !342, file: !69, line: 338, column: 4)
!348 = !DILocation(line: 339, column: 29, scope: !347)
!349 = !DILocation(line: 339, column: 38, scope: !347)
!350 = !DILocation(line: 339, column: 37, scope: !347)
!351 = !DILocation(line: 339, column: 53, scope: !347)
!352 = !DILocation(line: 339, column: 51, scope: !347)
!353 = !DILocation(line: 339, column: 26, scope: !347)
!354 = !DILocation(line: 339, column: 66, scope: !347)
!355 = !DILocation(line: 339, column: 14, scope: !347)
!356 = !DILocation(line: 340, column: 16, scope: !347)
!357 = !DILocation(line: 340, column: 25, scope: !347)
!358 = !DILocation(line: 340, column: 24, scope: !347)
!359 = !DILocation(line: 340, column: 14, scope: !347)
!360 = !DILocation(line: 341, column: 16, scope: !347)
!361 = !DILocation(line: 341, column: 28, scope: !347)
!362 = !DILocation(line: 341, column: 39, scope: !347)
!363 = !DILocation(line: 341, column: 38, scope: !347)
!364 = !DILocation(line: 341, column: 25, scope: !347)
!365 = !DILocation(line: 341, column: 14, scope: !347)
!366 = !DILocation(line: 342, column: 8, scope: !367)
!367 = distinct !DILexicalBlock(scope: !347, file: !69, line: 342, column: 8)
!368 = !DILocation(line: 342, column: 17, scope: !367)
!369 = !DILocation(line: 342, column: 8, scope: !347)
!370 = !DILocation(line: 344, column: 9, scope: !371)
!371 = distinct !DILexicalBlock(scope: !372, file: !69, line: 344, column: 9)
!372 = distinct !DILexicalBlock(scope: !367, file: !69, line: 343, column: 5)
!373 = !DILocation(line: 344, column: 18, scope: !371)
!374 = !DILocation(line: 344, column: 9, scope: !372)
!375 = !DILocation(line: 346, column: 19, scope: !376)
!376 = distinct !DILexicalBlock(scope: !371, file: !69, line: 345, column: 6)
!377 = !DILocation(line: 346, column: 14, scope: !376)
!378 = !DILocation(line: 346, column: 7, scope: !376)
!379 = !DILocation(line: 350, column: 7, scope: !380)
!380 = distinct !DILexicalBlock(scope: !371, file: !69, line: 349, column: 6)
!381 = !DILocation(line: 355, column: 6, scope: !382)
!382 = distinct !DILexicalBlock(scope: !367, file: !69, line: 354, column: 5)
!383 = !DILocation(line: 361, column: 5, scope: !384)
!384 = distinct !DILexicalBlock(scope: !342, file: !69, line: 360, column: 4)
!385 = !DILocation(line: 367, column: 1, scope: !186)
!386 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !387, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!387 = !DISubroutineType(types: !388)
!388 = !{!19, !13}
!389 = !DILocalVariable(name: "denominator", arg: 1, scope: !386, file: !33, line: 24, type: !13)
!390 = !DILocation(line: 24, column: 40, scope: !386)
!391 = !DILocation(line: 26, column: 12, scope: !386)
!392 = !DILocation(line: 26, column: 24, scope: !386)
!393 = !DILocation(line: 26, column: 5, scope: !386)
!394 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !387, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!395 = !DILocalVariable(name: "left", arg: 1, scope: !394, file: !33, line: 84, type: !13)
!396 = !DILocation(line: 84, column: 51, scope: !394)
!397 = !DILocation(line: 86, column: 12, scope: !394)
!398 = !DILocation(line: 86, column: 17, scope: !394)
!399 = !DILocation(line: 86, column: 5, scope: !394)
!400 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !401, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!401 = !DISubroutineType(types: !402)
!402 = !{!19, !13, !20}
!403 = !DILocalVariable(name: "left", arg: 1, scope: !400, file: !33, line: 90, type: !13)
!404 = !DILocation(line: 90, column: 41, scope: !400)
!405 = !DILocalVariable(name: "count", arg: 2, scope: !400, file: !33, line: 90, type: !20)
!406 = !DILocation(line: 90, column: 56, scope: !400)
!407 = !DILocation(line: 92, column: 9, scope: !408)
!408 = distinct !DILexicalBlock(scope: !400, file: !33, line: 92, column: 9)
!409 = !DILocation(line: 92, column: 15, scope: !408)
!410 = !DILocation(line: 92, column: 9, scope: !400)
!411 = !DILocation(line: 93, column: 9, scope: !412)
!412 = distinct !DILexicalBlock(scope: !408, file: !33, line: 92, column: 32)
!413 = !DILocation(line: 95, column: 12, scope: !400)
!414 = !DILocation(line: 95, column: 34, scope: !400)
!415 = !DILocation(line: 95, column: 31, scope: !400)
!416 = !DILocation(line: 95, column: 17, scope: !400)
!417 = !DILocation(line: 95, column: 41, scope: !400)
!418 = !DILocation(line: 95, column: 5, scope: !400)
!419 = !DILocation(line: 96, column: 1, scope: !400)
!420 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !421, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!421 = !DISubroutineType(types: !422)
!422 = !{!19, !13, !13}
!423 = !DILocalVariable(name: "left", arg: 1, scope: !420, file: !33, line: 78, type: !13)
!424 = !DILocation(line: 78, column: 38, scope: !420)
!425 = !DILocalVariable(name: "right", arg: 2, scope: !420, file: !33, line: 78, type: !13)
!426 = !DILocation(line: 78, column: 52, scope: !420)
!427 = !DILocation(line: 80, column: 12, scope: !420)
!428 = !DILocation(line: 80, column: 19, scope: !420)
!429 = !DILocation(line: 80, column: 17, scope: !420)
!430 = !DILocation(line: 80, column: 25, scope: !420)
!431 = !DILocation(line: 80, column: 5, scope: !420)
!432 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !421, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!433 = !DILocalVariable(name: "left", arg: 1, scope: !432, file: !33, line: 72, type: !13)
!434 = !DILocation(line: 72, column: 38, scope: !432)
!435 = !DILocalVariable(name: "right", arg: 2, scope: !432, file: !33, line: 72, type: !13)
!436 = !DILocation(line: 72, column: 52, scope: !432)
!437 = !DILocation(line: 74, column: 12, scope: !432)
!438 = !DILocation(line: 74, column: 19, scope: !432)
!439 = !DILocation(line: 74, column: 17, scope: !432)
!440 = !DILocation(line: 74, column: 25, scope: !432)
!441 = !DILocation(line: 74, column: 5, scope: !432)
!442 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !421, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!443 = !DILocalVariable(name: "left", arg: 1, scope: !442, file: !33, line: 54, type: !13)
!444 = !DILocation(line: 54, column: 38, scope: !442)
!445 = !DILocalVariable(name: "right", arg: 2, scope: !442, file: !33, line: 54, type: !13)
!446 = !DILocation(line: 54, column: 52, scope: !442)
!447 = !DILocation(line: 56, column: 12, scope: !442)
!448 = !DILocation(line: 56, column: 19, scope: !442)
!449 = !DILocation(line: 56, column: 17, scope: !442)
!450 = !DILocation(line: 56, column: 25, scope: !442)
!451 = !DILocation(line: 56, column: 5, scope: !442)
!452 = distinct !DISubprogram(name: "klee_alarm_s32_add_lower", scope: !33, file: !33, line: 48, type: !421, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!453 = !DILocalVariable(name: "left", arg: 1, scope: !452, file: !33, line: 48, type: !13)
!454 = !DILocation(line: 48, column: 38, scope: !452)
!455 = !DILocalVariable(name: "right", arg: 2, scope: !452, file: !33, line: 48, type: !13)
!456 = !DILocation(line: 48, column: 52, scope: !452)
!457 = !DILocation(line: 50, column: 12, scope: !452)
!458 = !DILocation(line: 50, column: 19, scope: !452)
!459 = !DILocation(line: 50, column: 17, scope: !452)
!460 = !DILocation(line: 50, column: 25, scope: !452)
!461 = !DILocation(line: 50, column: 5, scope: !452)
!462 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 385, type: !463, scopeLine: 386, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!463 = !DISubroutineType(types: !464)
!464 = !{!6, !6, !28}
!465 = !DILocalVariable(name: "numerator", arg: 1, scope: !462, file: !69, line: 385, type: !6)
!466 = !DILocation(line: 385, column: 31, scope: !462)
!467 = !DILocalVariable(name: "denominator", arg: 2, scope: !462, file: !69, line: 385, type: !28)
!468 = !DILocation(line: 385, column: 47, scope: !462)
!469 = !DILocalVariable(name: "u16Temp1", scope: !462, file: !69, line: 387, type: !28)
!470 = !DILocation(line: 387, column: 6, scope: !462)
!471 = !DILocalVariable(name: "s32Temp1", scope: !462, file: !69, line: 388, type: !16)
!472 = !DILocation(line: 388, column: 6, scope: !462)
!473 = !DILocalVariable(name: "s32Temp2", scope: !462, file: !69, line: 388, type: !16)
!474 = !DILocation(line: 388, column: 15, scope: !462)
!475 = !DILocation(line: 389, column: 13, scope: !462)
!476 = !DILocation(line: 389, column: 25, scope: !462)
!477 = !DILocation(line: 389, column: 11, scope: !462)
!478 = !DILocation(line: 390, column: 13, scope: !462)
!479 = !DILocation(line: 390, column: 22, scope: !462)
!480 = !DILocation(line: 390, column: 11, scope: !462)
!481 = !DILocation(line: 391, column: 5, scope: !482)
!482 = distinct !DILexicalBlock(scope: !462, file: !69, line: 391, column: 5)
!483 = !DILocation(line: 391, column: 14, scope: !482)
!484 = !DILocation(line: 391, column: 5, scope: !462)
!485 = !DILocation(line: 393, column: 7, scope: !486)
!486 = distinct !DILexicalBlock(scope: !487, file: !69, line: 393, column: 7)
!487 = distinct !DILexicalBlock(scope: !482, file: !69, line: 392, column: 2)
!488 = !DILocation(line: 393, column: 17, scope: !486)
!489 = !DILocation(line: 393, column: 7, scope: !487)
!490 = !DILocation(line: 395, column: 4, scope: !491)
!491 = distinct !DILexicalBlock(scope: !486, file: !69, line: 394, column: 3)
!492 = !DILocation(line: 399, column: 4, scope: !493)
!493 = distinct !DILexicalBlock(scope: !486, file: !69, line: 398, column: 3)
!494 = !DILocation(line: 404, column: 15, scope: !495)
!495 = distinct !DILexicalBlock(scope: !482, file: !69, line: 403, column: 2)
!496 = !DILocation(line: 404, column: 24, scope: !495)
!497 = !DILocation(line: 404, column: 32, scope: !495)
!498 = !DILocation(line: 404, column: 41, scope: !495)
!499 = !DILocation(line: 404, column: 47, scope: !495)
!500 = !DILocation(line: 404, column: 46, scope: !495)
!501 = !DILocation(line: 404, column: 57, scope: !495)
!502 = !DILocation(line: 404, column: 56, scope: !495)
!503 = !DILocation(line: 404, column: 29, scope: !495)
!504 = !DILocation(line: 404, column: 12, scope: !495)
!505 = !DILocation(line: 405, column: 14, scope: !495)
!506 = !DILocation(line: 405, column: 22, scope: !495)
!507 = !DILocation(line: 405, column: 12, scope: !495)
!508 = !DILocation(line: 406, column: 14, scope: !495)
!509 = !DILocation(line: 406, column: 23, scope: !495)
!510 = !DILocation(line: 406, column: 22, scope: !495)
!511 = !DILocation(line: 406, column: 12, scope: !495)
!512 = !DILocation(line: 407, column: 16, scope: !495)
!513 = !DILocation(line: 407, column: 25, scope: !495)
!514 = !DILocation(line: 407, column: 31, scope: !495)
!515 = !DILocation(line: 407, column: 30, scope: !495)
!516 = !DILocation(line: 407, column: 43, scope: !495)
!517 = !DILocation(line: 407, column: 41, scope: !495)
!518 = !DILocation(line: 407, column: 12, scope: !495)
!519 = !DILocation(line: 408, column: 6, scope: !520)
!520 = distinct !DILexicalBlock(scope: !495, file: !69, line: 408, column: 6)
!521 = !DILocation(line: 408, column: 15, scope: !520)
!522 = !DILocation(line: 408, column: 6, scope: !495)
!523 = !DILocation(line: 410, column: 7, scope: !524)
!524 = distinct !DILexicalBlock(scope: !525, file: !69, line: 410, column: 7)
!525 = distinct !DILexicalBlock(scope: !520, file: !69, line: 409, column: 3)
!526 = !DILocation(line: 410, column: 16, scope: !524)
!527 = !DILocation(line: 410, column: 7, scope: !525)
!528 = !DILocation(line: 412, column: 17, scope: !529)
!529 = distinct !DILexicalBlock(scope: !524, file: !69, line: 411, column: 4)
!530 = !DILocation(line: 412, column: 12, scope: !529)
!531 = !DILocation(line: 412, column: 5, scope: !529)
!532 = !DILocation(line: 416, column: 5, scope: !533)
!533 = distinct !DILexicalBlock(scope: !524, file: !69, line: 415, column: 4)
!534 = !DILocation(line: 421, column: 4, scope: !535)
!535 = distinct !DILexicalBlock(scope: !520, file: !69, line: 420, column: 3)
!536 = !DILocation(line: 424, column: 1, scope: !462)
!537 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 441, type: !463, scopeLine: 442, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!538 = !DILocalVariable(name: "numerator", arg: 1, scope: !537, file: !69, line: 441, type: !6)
!539 = !DILocation(line: 441, column: 30, scope: !537)
!540 = !DILocalVariable(name: "denominator", arg: 2, scope: !537, file: !69, line: 441, type: !28)
!541 = !DILocation(line: 441, column: 45, scope: !537)
!542 = !DILocalVariable(name: "u16Temp1", scope: !537, file: !69, line: 443, type: !28)
!543 = !DILocation(line: 443, column: 6, scope: !537)
!544 = !DILocalVariable(name: "s32Temp1", scope: !537, file: !69, line: 444, type: !16)
!545 = !DILocation(line: 444, column: 6, scope: !537)
!546 = !DILocation(line: 445, column: 13, scope: !537)
!547 = !DILocation(line: 445, column: 25, scope: !537)
!548 = !DILocation(line: 445, column: 11, scope: !537)
!549 = !DILocation(line: 446, column: 5, scope: !550)
!550 = distinct !DILexicalBlock(scope: !537, file: !69, line: 446, column: 5)
!551 = !DILocation(line: 446, column: 13, scope: !550)
!552 = !DILocation(line: 446, column: 5, scope: !537)
!553 = !DILocation(line: 448, column: 6, scope: !554)
!554 = distinct !DILexicalBlock(scope: !555, file: !69, line: 448, column: 6)
!555 = distinct !DILexicalBlock(scope: !550, file: !69, line: 447, column: 2)
!556 = !DILocation(line: 448, column: 15, scope: !554)
!557 = !DILocation(line: 448, column: 6, scope: !555)
!558 = !DILocation(line: 450, column: 4, scope: !559)
!559 = distinct !DILexicalBlock(scope: !554, file: !69, line: 449, column: 3)
!560 = !DILocation(line: 454, column: 4, scope: !561)
!561 = distinct !DILexicalBlock(scope: !554, file: !69, line: 453, column: 3)
!562 = !DILocation(line: 460, column: 15, scope: !563)
!563 = distinct !DILexicalBlock(scope: !550, file: !69, line: 459, column: 2)
!564 = !DILocation(line: 460, column: 27, scope: !563)
!565 = !DILocation(line: 460, column: 37, scope: !563)
!566 = !DILocation(line: 460, column: 36, scope: !563)
!567 = !DILocation(line: 460, column: 49, scope: !563)
!568 = !DILocation(line: 460, column: 47, scope: !563)
!569 = !DILocation(line: 460, column: 25, scope: !563)
!570 = !DILocation(line: 460, column: 59, scope: !563)
!571 = !DILocation(line: 460, column: 12, scope: !563)
!572 = !DILocation(line: 461, column: 15, scope: !563)
!573 = !DILocation(line: 461, column: 24, scope: !563)
!574 = !DILocation(line: 461, column: 23, scope: !563)
!575 = !DILocation(line: 461, column: 37, scope: !563)
!576 = !DILocation(line: 461, column: 47, scope: !563)
!577 = !DILocation(line: 461, column: 46, scope: !563)
!578 = !DILocation(line: 461, column: 34, scope: !563)
!579 = !DILocation(line: 461, column: 12, scope: !563)
!580 = !DILocation(line: 462, column: 10, scope: !563)
!581 = !DILocation(line: 462, column: 3, scope: !563)
!582 = !DILocation(line: 464, column: 1, scope: !537)
!583 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 482, type: !584, scopeLine: 483, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!584 = !DISubroutineType(types: !585)
!585 = !{!24, !28, !28}
!586 = !DILocalVariable(name: "numerator", arg: 1, scope: !583, file: !69, line: 482, type: !28)
!587 = !DILocation(line: 482, column: 28, scope: !583)
!588 = !DILocalVariable(name: "denominator", arg: 2, scope: !583, file: !69, line: 482, type: !28)
!589 = !DILocation(line: 482, column: 43, scope: !583)
!590 = !DILocalVariable(name: "u32Temp1", scope: !583, file: !69, line: 484, type: !591)
!591 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !20)
!592 = !DILocation(line: 484, column: 6, scope: !583)
!593 = !DILocalVariable(name: "u32Temp2", scope: !583, file: !69, line: 484, type: !591)
!594 = !DILocation(line: 484, column: 20, scope: !583)
!595 = !DILocalVariable(name: "u32Temp3", scope: !583, file: !69, line: 484, type: !591)
!596 = !DILocation(line: 484, column: 33, scope: !583)
!597 = !DILocation(line: 485, column: 5, scope: !598)
!598 = distinct !DILexicalBlock(scope: !583, file: !69, line: 485, column: 5)
!599 = !DILocation(line: 485, column: 16, scope: !598)
!600 = !DILocation(line: 485, column: 5, scope: !583)
!601 = !DILocation(line: 487, column: 3, scope: !602)
!602 = distinct !DILexicalBlock(scope: !598, file: !69, line: 486, column: 2)
!603 = !DILocation(line: 491, column: 15, scope: !604)
!604 = distinct !DILexicalBlock(scope: !598, file: !69, line: 490, column: 2)
!605 = !DILocation(line: 491, column: 24, scope: !604)
!606 = !DILocation(line: 491, column: 12, scope: !604)
!607 = !DILocation(line: 492, column: 14, scope: !604)
!608 = !DILocation(line: 492, column: 25, scope: !604)
!609 = !DILocation(line: 492, column: 23, scope: !604)
!610 = !DILocation(line: 492, column: 12, scope: !604)
!611 = !DILocation(line: 493, column: 15, scope: !604)
!612 = !DILocation(line: 493, column: 24, scope: !604)
!613 = !DILocation(line: 493, column: 32, scope: !604)
!614 = !DILocation(line: 493, column: 12, scope: !604)
!615 = !DILocation(line: 494, column: 6, scope: !616)
!616 = distinct !DILexicalBlock(scope: !604, file: !69, line: 494, column: 6)
!617 = !DILocation(line: 494, column: 15, scope: !616)
!618 = !DILocation(line: 494, column: 6, scope: !604)
!619 = !DILocation(line: 496, column: 15, scope: !620)
!620 = distinct !DILexicalBlock(scope: !616, file: !69, line: 495, column: 3)
!621 = !DILocation(line: 496, column: 11, scope: !620)
!622 = !DILocation(line: 496, column: 4, scope: !620)
!623 = !DILocation(line: 500, column: 4, scope: !624)
!624 = distinct !DILexicalBlock(scope: !616, file: !69, line: 499, column: 3)
!625 = !DILocation(line: 503, column: 1, scope: !583)
!626 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 520, type: !627, scopeLine: 521, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!627 = !DISubroutineType(types: !628)
!628 = !{!28, !16, !28}
!629 = !DILocalVariable(name: "x_value", arg: 1, scope: !626, file: !69, line: 520, type: !16)
!630 = !DILocation(line: 520, column: 25, scope: !626)
!631 = !DILocalVariable(name: "y_value", arg: 2, scope: !626, file: !69, line: 520, type: !28)
!632 = !DILocation(line: 520, column: 38, scope: !626)
!633 = !DILocalVariable(name: "s32Temp1", scope: !626, file: !69, line: 522, type: !16)
!634 = !DILocation(line: 522, column: 6, scope: !626)
!635 = !DILocation(line: 523, column: 12, scope: !626)
!636 = !DILocation(line: 523, column: 20, scope: !626)
!637 = !DILocation(line: 523, column: 10, scope: !626)
!638 = !DILocation(line: 524, column: 6, scope: !639)
!639 = distinct !DILexicalBlock(scope: !626, file: !69, line: 524, column: 5)
!640 = !DILocation(line: 524, column: 14, scope: !639)
!641 = !DILocation(line: 524, column: 24, scope: !639)
!642 = !DILocation(line: 524, column: 5, scope: !626)
!643 = !DILocation(line: 526, column: 6, scope: !644)
!644 = distinct !DILexicalBlock(scope: !645, file: !69, line: 526, column: 6)
!645 = distinct !DILexicalBlock(scope: !639, file: !69, line: 525, column: 2)
!646 = !DILocation(line: 526, column: 14, scope: !644)
!647 = !DILocation(line: 526, column: 6, scope: !645)
!648 = !DILocation(line: 528, column: 4, scope: !649)
!649 = distinct !DILexicalBlock(scope: !644, file: !69, line: 527, column: 3)
!650 = !DILocation(line: 532, column: 4, scope: !651)
!651 = distinct !DILexicalBlock(scope: !644, file: !69, line: 531, column: 3)
!652 = !DILocation(line: 537, column: 15, scope: !653)
!653 = distinct !DILexicalBlock(scope: !639, file: !69, line: 536, column: 2)
!654 = !DILocation(line: 537, column: 27, scope: !653)
!655 = !DILocation(line: 537, column: 35, scope: !653)
!656 = !DILocation(line: 537, column: 34, scope: !653)
!657 = !DILocation(line: 537, column: 46, scope: !653)
!658 = !DILocation(line: 537, column: 44, scope: !653)
!659 = !DILocation(line: 537, column: 23, scope: !653)
!660 = !DILocation(line: 537, column: 56, scope: !653)
!661 = !DILocation(line: 537, column: 12, scope: !653)
!662 = !DILocation(line: 538, column: 15, scope: !653)
!663 = !DILocation(line: 538, column: 24, scope: !653)
!664 = !DILocation(line: 538, column: 23, scope: !653)
!665 = !DILocation(line: 538, column: 36, scope: !653)
!666 = !DILocation(line: 538, column: 44, scope: !653)
!667 = !DILocation(line: 538, column: 43, scope: !653)
!668 = !DILocation(line: 538, column: 33, scope: !653)
!669 = !DILocation(line: 538, column: 12, scope: !653)
!670 = !DILocation(line: 539, column: 6, scope: !671)
!671 = distinct !DILexicalBlock(scope: !653, file: !69, line: 539, column: 6)
!672 = !DILocation(line: 539, column: 15, scope: !671)
!673 = !DILocation(line: 539, column: 6, scope: !653)
!674 = !DILocation(line: 541, column: 7, scope: !675)
!675 = distinct !DILexicalBlock(scope: !676, file: !69, line: 541, column: 7)
!676 = distinct !DILexicalBlock(scope: !671, file: !69, line: 540, column: 3)
!677 = !DILocation(line: 541, column: 16, scope: !675)
!678 = !DILocation(line: 541, column: 7, scope: !676)
!679 = !DILocation(line: 543, column: 17, scope: !680)
!680 = distinct !DILexicalBlock(scope: !675, file: !69, line: 542, column: 4)
!681 = !DILocation(line: 543, column: 12, scope: !680)
!682 = !DILocation(line: 543, column: 5, scope: !680)
!683 = !DILocation(line: 547, column: 5, scope: !684)
!684 = distinct !DILexicalBlock(scope: !675, file: !69, line: 546, column: 4)
!685 = !DILocation(line: 552, column: 4, scope: !686)
!686 = distinct !DILexicalBlock(scope: !671, file: !69, line: 551, column: 3)
!687 = !DILocation(line: 555, column: 1, scope: !626)
!688 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 573, type: !689, scopeLine: 574, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!689 = !DISubroutineType(types: !690)
!690 = !{!28, !28, !28}
!691 = !DILocalVariable(name: "numerator", arg: 1, scope: !688, file: !69, line: 573, type: !28)
!692 = !DILocation(line: 573, column: 31, scope: !688)
!693 = !DILocalVariable(name: "denominator", arg: 2, scope: !688, file: !69, line: 573, type: !28)
!694 = !DILocation(line: 573, column: 46, scope: !688)
!695 = !DILocalVariable(name: "u32Temp", scope: !688, file: !69, line: 575, type: !591)
!696 = !DILocation(line: 575, column: 6, scope: !688)
!697 = !DILocation(line: 576, column: 5, scope: !698)
!698 = distinct !DILexicalBlock(scope: !688, file: !69, line: 576, column: 5)
!699 = !DILocation(line: 576, column: 17, scope: !698)
!700 = !DILocation(line: 576, column: 5, scope: !688)
!701 = !DILocation(line: 578, column: 3, scope: !702)
!702 = distinct !DILexicalBlock(scope: !698, file: !69, line: 577, column: 2)
!703 = !DILocation(line: 582, column: 14, scope: !704)
!704 = distinct !DILexicalBlock(scope: !698, file: !69, line: 581, column: 2)
!705 = !DILocation(line: 582, column: 23, scope: !704)
!706 = !DILocation(line: 582, column: 32, scope: !704)
!707 = !DILocation(line: 582, column: 44, scope: !704)
!708 = !DILocation(line: 582, column: 29, scope: !704)
!709 = !DILocation(line: 582, column: 11, scope: !704)
!710 = !DILocation(line: 583, column: 13, scope: !704)
!711 = !DILocation(line: 583, column: 21, scope: !704)
!712 = !DILocation(line: 583, column: 20, scope: !704)
!713 = !DILocation(line: 583, column: 11, scope: !704)
!714 = !DILocation(line: 584, column: 6, scope: !715)
!715 = distinct !DILexicalBlock(scope: !704, file: !69, line: 584, column: 6)
!716 = !DILocation(line: 584, column: 14, scope: !715)
!717 = !DILocation(line: 584, column: 6, scope: !704)
!718 = !DILocation(line: 586, column: 11, scope: !719)
!719 = distinct !DILexicalBlock(scope: !715, file: !69, line: 585, column: 3)
!720 = !DILocation(line: 586, column: 19, scope: !719)
!721 = !DILocation(line: 586, column: 4, scope: !719)
!722 = !DILocation(line: 590, column: 4, scope: !723)
!723 = distinct !DILexicalBlock(scope: !715, file: !69, line: 589, column: 3)
!724 = !DILocation(line: 594, column: 1, scope: !688)
!725 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 611, type: !726, scopeLine: 612, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!726 = !DISubroutineType(types: !727)
!727 = !{!28, !591, !28}
!728 = !DILocalVariable(name: "x_value", arg: 1, scope: !725, file: !69, line: 611, type: !591)
!729 = !DILocation(line: 611, column: 25, scope: !725)
!730 = !DILocalVariable(name: "y_value", arg: 2, scope: !725, file: !69, line: 611, type: !28)
!731 = !DILocation(line: 611, column: 38, scope: !725)
!732 = !DILocalVariable(name: "u32Temp1", scope: !725, file: !69, line: 613, type: !591)
!733 = !DILocation(line: 613, column: 6, scope: !725)
!734 = !DILocalVariable(name: "u32Temp2", scope: !725, file: !69, line: 613, type: !591)
!735 = !DILocation(line: 613, column: 17, scope: !725)
!736 = !DILocation(line: 614, column: 12, scope: !725)
!737 = !DILocation(line: 614, column: 20, scope: !725)
!738 = !DILocation(line: 614, column: 10, scope: !725)
!739 = !DILocation(line: 615, column: 5, scope: !740)
!740 = distinct !DILexicalBlock(scope: !725, file: !69, line: 615, column: 5)
!741 = !DILocation(line: 615, column: 13, scope: !740)
!742 = !DILocation(line: 615, column: 5, scope: !725)
!743 = !DILocation(line: 617, column: 3, scope: !744)
!744 = distinct !DILexicalBlock(scope: !740, file: !69, line: 616, column: 2)
!745 = !DILocation(line: 621, column: 14, scope: !746)
!746 = distinct !DILexicalBlock(scope: !740, file: !69, line: 620, column: 2)
!747 = !DILocation(line: 621, column: 22, scope: !746)
!748 = !DILocation(line: 621, column: 21, scope: !746)
!749 = !DILocation(line: 621, column: 12, scope: !746)
!750 = !DILocation(line: 622, column: 14, scope: !746)
!751 = !DILocation(line: 622, column: 25, scope: !746)
!752 = !DILocation(line: 622, column: 36, scope: !746)
!753 = !DILocation(line: 622, column: 34, scope: !746)
!754 = !DILocation(line: 622, column: 22, scope: !746)
!755 = !DILocation(line: 622, column: 45, scope: !746)
!756 = !DILocation(line: 622, column: 12, scope: !746)
!757 = !DILocation(line: 623, column: 15, scope: !746)
!758 = !DILocation(line: 623, column: 24, scope: !746)
!759 = !DILocation(line: 623, column: 23, scope: !746)
!760 = !DILocation(line: 623, column: 36, scope: !746)
!761 = !DILocation(line: 623, column: 44, scope: !746)
!762 = !DILocation(line: 623, column: 43, scope: !746)
!763 = !DILocation(line: 623, column: 33, scope: !746)
!764 = !DILocation(line: 623, column: 12, scope: !746)
!765 = !DILocation(line: 624, column: 6, scope: !766)
!766 = distinct !DILexicalBlock(scope: !746, file: !69, line: 624, column: 6)
!767 = !DILocation(line: 624, column: 15, scope: !766)
!768 = !DILocation(line: 624, column: 6, scope: !746)
!769 = !DILocation(line: 626, column: 11, scope: !770)
!770 = distinct !DILexicalBlock(scope: !766, file: !69, line: 625, column: 3)
!771 = !DILocation(line: 626, column: 20, scope: !770)
!772 = !DILocation(line: 626, column: 4, scope: !770)
!773 = !DILocation(line: 630, column: 4, scope: !774)
!774 = distinct !DILexicalBlock(scope: !766, file: !69, line: 629, column: 3)
!775 = !DILocation(line: 634, column: 1, scope: !725)
!776 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 653, type: !777, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!777 = !DISubroutineType(types: !778)
!778 = !{!6, !6, !28, !6}
!779 = !DILocalVariable(name: "factor1", arg: 1, scope: !776, file: !69, line: 653, type: !6)
!780 = !DILocation(line: 653, column: 33, scope: !776)
!781 = !DILocalVariable(name: "factor2", arg: 2, scope: !776, file: !69, line: 653, type: !28)
!782 = !DILocation(line: 653, column: 46, scope: !776)
!783 = !DILocalVariable(name: "denominator", arg: 3, scope: !776, file: !69, line: 653, type: !6)
!784 = !DILocation(line: 653, column: 59, scope: !776)
!785 = !DILocalVariable(name: "s32Result", scope: !776, file: !69, line: 655, type: !16)
!786 = !DILocation(line: 655, column: 6, scope: !776)
!787 = !DILocalVariable(name: "s32Temp1", scope: !776, file: !69, line: 655, type: !16)
!788 = !DILocation(line: 655, column: 21, scope: !776)
!789 = !DILocation(line: 656, column: 14, scope: !776)
!790 = !DILocation(line: 656, column: 24, scope: !776)
!791 = !DILocation(line: 656, column: 22, scope: !776)
!792 = !DILocation(line: 656, column: 12, scope: !776)
!793 = !DILocation(line: 657, column: 5, scope: !794)
!794 = distinct !DILexicalBlock(scope: !776, file: !69, line: 657, column: 5)
!795 = !DILocation(line: 657, column: 17, scope: !794)
!796 = !DILocation(line: 657, column: 5, scope: !776)
!797 = !DILocation(line: 659, column: 6, scope: !798)
!798 = distinct !DILexicalBlock(scope: !799, file: !69, line: 659, column: 6)
!799 = distinct !DILexicalBlock(scope: !794, file: !69, line: 658, column: 2)
!800 = !DILocation(line: 659, column: 16, scope: !798)
!801 = !DILocation(line: 659, column: 6, scope: !799)
!802 = !DILocation(line: 661, column: 4, scope: !803)
!803 = distinct !DILexicalBlock(scope: !798, file: !69, line: 660, column: 3)
!804 = !DILocation(line: 665, column: 4, scope: !805)
!805 = distinct !DILexicalBlock(scope: !798, file: !69, line: 664, column: 3)
!806 = !DILocation(line: 670, column: 14, scope: !807)
!807 = distinct !DILexicalBlock(scope: !794, file: !69, line: 669, column: 2)
!808 = !DILocation(line: 670, column: 27, scope: !807)
!809 = !DILocation(line: 670, column: 37, scope: !807)
!810 = !DILocation(line: 670, column: 36, scope: !807)
!811 = !DILocation(line: 670, column: 50, scope: !807)
!812 = !DILocation(line: 670, column: 49, scope: !807)
!813 = !DILocation(line: 670, column: 24, scope: !807)
!814 = !DILocation(line: 670, column: 12, scope: !807)
!815 = !DILocation(line: 671, column: 14, scope: !807)
!816 = !DILocation(line: 671, column: 23, scope: !807)
!817 = !DILocation(line: 671, column: 12, scope: !807)
!818 = !DILocation(line: 672, column: 16, scope: !807)
!819 = !DILocation(line: 672, column: 25, scope: !807)
!820 = !DILocation(line: 672, column: 24, scope: !807)
!821 = !DILocation(line: 672, column: 41, scope: !807)
!822 = !DILocation(line: 672, column: 51, scope: !807)
!823 = !DILocation(line: 672, column: 50, scope: !807)
!824 = !DILocation(line: 672, column: 38, scope: !807)
!825 = !DILocation(line: 672, column: 13, scope: !807)
!826 = !DILocation(line: 673, column: 6, scope: !827)
!827 = distinct !DILexicalBlock(scope: !807, file: !69, line: 673, column: 6)
!828 = !DILocation(line: 673, column: 16, scope: !827)
!829 = !DILocation(line: 673, column: 6, scope: !807)
!830 = !DILocation(line: 675, column: 7, scope: !831)
!831 = distinct !DILexicalBlock(scope: !832, file: !69, line: 675, column: 7)
!832 = distinct !DILexicalBlock(scope: !827, file: !69, line: 674, column: 3)
!833 = !DILocation(line: 675, column: 17, scope: !831)
!834 = !DILocation(line: 675, column: 7, scope: !832)
!835 = !DILocation(line: 677, column: 17, scope: !836)
!836 = distinct !DILexicalBlock(scope: !831, file: !69, line: 676, column: 4)
!837 = !DILocation(line: 677, column: 12, scope: !836)
!838 = !DILocation(line: 677, column: 5, scope: !836)
!839 = !DILocation(line: 682, column: 5, scope: !840)
!840 = distinct !DILexicalBlock(scope: !831, file: !69, line: 681, column: 4)
!841 = !DILocation(line: 687, column: 4, scope: !842)
!842 = distinct !DILexicalBlock(scope: !827, file: !69, line: 686, column: 3)
!843 = !DILocation(line: 691, column: 1, scope: !776)
!844 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 709, type: !845, scopeLine: 710, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!845 = !DISubroutineType(types: !846)
!846 = !{!6, !28, !6, !28}
!847 = !DILocalVariable(name: "factor1", arg: 1, scope: !844, file: !69, line: 709, type: !28)
!848 = !DILocation(line: 709, column: 33, scope: !844)
!849 = !DILocalVariable(name: "factor2", arg: 2, scope: !844, file: !69, line: 709, type: !6)
!850 = !DILocation(line: 709, column: 46, scope: !844)
!851 = !DILocalVariable(name: "denominator", arg: 3, scope: !844, file: !69, line: 709, type: !28)
!852 = !DILocation(line: 709, column: 59, scope: !844)
!853 = !DILocalVariable(name: "s32Result", scope: !844, file: !69, line: 711, type: !16)
!854 = !DILocation(line: 711, column: 6, scope: !844)
!855 = !DILocalVariable(name: "s32Temp1", scope: !844, file: !69, line: 711, type: !16)
!856 = !DILocation(line: 711, column: 21, scope: !844)
!857 = !DILocation(line: 712, column: 14, scope: !844)
!858 = !DILocation(line: 712, column: 24, scope: !844)
!859 = !DILocation(line: 712, column: 22, scope: !844)
!860 = !DILocation(line: 712, column: 12, scope: !844)
!861 = !DILocation(line: 713, column: 5, scope: !862)
!862 = distinct !DILexicalBlock(scope: !844, file: !69, line: 713, column: 5)
!863 = !DILocation(line: 713, column: 16, scope: !862)
!864 = !DILocation(line: 713, column: 5, scope: !844)
!865 = !DILocation(line: 715, column: 6, scope: !866)
!866 = distinct !DILexicalBlock(scope: !867, file: !69, line: 715, column: 6)
!867 = distinct !DILexicalBlock(scope: !862, file: !69, line: 714, column: 2)
!868 = !DILocation(line: 715, column: 16, scope: !866)
!869 = !DILocation(line: 715, column: 6, scope: !867)
!870 = !DILocation(line: 717, column: 4, scope: !871)
!871 = distinct !DILexicalBlock(scope: !866, file: !69, line: 716, column: 3)
!872 = !DILocation(line: 721, column: 4, scope: !873)
!873 = distinct !DILexicalBlock(scope: !866, file: !69, line: 720, column: 3)
!874 = !DILocation(line: 726, column: 14, scope: !875)
!875 = distinct !DILexicalBlock(scope: !862, file: !69, line: 725, column: 2)
!876 = !DILocation(line: 726, column: 28, scope: !875)
!877 = !DILocation(line: 726, column: 38, scope: !875)
!878 = !DILocation(line: 726, column: 37, scope: !875)
!879 = !DILocation(line: 726, column: 53, scope: !875)
!880 = !DILocation(line: 726, column: 51, scope: !875)
!881 = !DILocation(line: 726, column: 24, scope: !875)
!882 = !DILocation(line: 726, column: 66, scope: !875)
!883 = !DILocation(line: 726, column: 12, scope: !875)
!884 = !DILocation(line: 727, column: 16, scope: !875)
!885 = !DILocation(line: 727, column: 25, scope: !875)
!886 = !DILocation(line: 727, column: 24, scope: !875)
!887 = !DILocation(line: 727, column: 41, scope: !875)
!888 = !DILocation(line: 727, column: 51, scope: !875)
!889 = !DILocation(line: 727, column: 50, scope: !875)
!890 = !DILocation(line: 727, column: 38, scope: !875)
!891 = !DILocation(line: 727, column: 13, scope: !875)
!892 = !DILocation(line: 728, column: 6, scope: !893)
!893 = distinct !DILexicalBlock(scope: !875, file: !69, line: 728, column: 6)
!894 = !DILocation(line: 728, column: 16, scope: !893)
!895 = !DILocation(line: 728, column: 6, scope: !875)
!896 = !DILocation(line: 730, column: 7, scope: !897)
!897 = distinct !DILexicalBlock(scope: !898, file: !69, line: 730, column: 7)
!898 = distinct !DILexicalBlock(scope: !893, file: !69, line: 729, column: 3)
!899 = !DILocation(line: 730, column: 17, scope: !897)
!900 = !DILocation(line: 730, column: 7, scope: !898)
!901 = !DILocation(line: 732, column: 17, scope: !902)
!902 = distinct !DILexicalBlock(scope: !897, file: !69, line: 731, column: 4)
!903 = !DILocation(line: 732, column: 12, scope: !902)
!904 = !DILocation(line: 732, column: 5, scope: !902)
!905 = !DILocation(line: 736, column: 5, scope: !906)
!906 = distinct !DILexicalBlock(scope: !897, file: !69, line: 735, column: 4)
!907 = !DILocation(line: 741, column: 4, scope: !908)
!908 = distinct !DILexicalBlock(scope: !893, file: !69, line: 740, column: 3)
!909 = !DILocation(line: 744, column: 1, scope: !844)
!910 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 763, type: !911, scopeLine: 764, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!911 = !DISubroutineType(types: !912)
!912 = !{!28, !6, !28, !6}
!913 = !DILocalVariable(name: "factor1", arg: 1, scope: !910, file: !69, line: 763, type: !6)
!914 = !DILocation(line: 763, column: 33, scope: !910)
!915 = !DILocalVariable(name: "factor2", arg: 2, scope: !910, file: !69, line: 763, type: !28)
!916 = !DILocation(line: 763, column: 46, scope: !910)
!917 = !DILocalVariable(name: "denominator", arg: 3, scope: !910, file: !69, line: 763, type: !6)
!918 = !DILocation(line: 763, column: 59, scope: !910)
!919 = !DILocalVariable(name: "u32Result", scope: !910, file: !69, line: 765, type: !591)
!920 = !DILocation(line: 765, column: 6, scope: !910)
!921 = !DILocalVariable(name: "u32Temp1", scope: !910, file: !69, line: 765, type: !591)
!922 = !DILocation(line: 765, column: 21, scope: !910)
!923 = !DILocalVariable(name: "s32Result", scope: !910, file: !69, line: 766, type: !16)
!924 = !DILocation(line: 766, column: 6, scope: !910)
!925 = !DILocalVariable(name: "s32Temp1", scope: !910, file: !69, line: 766, type: !16)
!926 = !DILocation(line: 766, column: 21, scope: !910)
!927 = !DILocation(line: 767, column: 14, scope: !910)
!928 = !DILocation(line: 767, column: 24, scope: !910)
!929 = !DILocation(line: 767, column: 22, scope: !910)
!930 = !DILocation(line: 767, column: 12, scope: !910)
!931 = !DILocation(line: 769, column: 5, scope: !932)
!932 = distinct !DILexicalBlock(scope: !910, file: !69, line: 769, column: 5)
!933 = !DILocation(line: 769, column: 17, scope: !932)
!934 = !DILocation(line: 769, column: 5, scope: !910)
!935 = !DILocation(line: 771, column: 6, scope: !936)
!936 = distinct !DILexicalBlock(scope: !937, file: !69, line: 771, column: 6)
!937 = distinct !DILexicalBlock(scope: !932, file: !69, line: 770, column: 2)
!938 = !DILocation(line: 771, column: 16, scope: !936)
!939 = !DILocation(line: 771, column: 6, scope: !937)
!940 = !DILocation(line: 773, column: 4, scope: !941)
!941 = distinct !DILexicalBlock(scope: !936, file: !69, line: 772, column: 3)
!942 = !DILocation(line: 777, column: 4, scope: !943)
!943 = distinct !DILexicalBlock(scope: !936, file: !69, line: 776, column: 3)
!944 = !DILocation(line: 782, column: 15, scope: !945)
!945 = distinct !DILexicalBlock(scope: !932, file: !69, line: 781, column: 2)
!946 = !DILocation(line: 782, column: 29, scope: !945)
!947 = !DILocation(line: 782, column: 39, scope: !945)
!948 = !DILocation(line: 782, column: 38, scope: !945)
!949 = !DILocation(line: 782, column: 54, scope: !945)
!950 = !DILocation(line: 782, column: 52, scope: !945)
!951 = !DILocation(line: 782, column: 25, scope: !945)
!952 = !DILocation(line: 782, column: 68, scope: !945)
!953 = !DILocation(line: 782, column: 12, scope: !945)
!954 = !DILocation(line: 783, column: 16, scope: !945)
!955 = !DILocation(line: 783, column: 25, scope: !945)
!956 = !DILocation(line: 783, column: 24, scope: !945)
!957 = !DILocation(line: 783, column: 41, scope: !945)
!958 = !DILocation(line: 783, column: 51, scope: !945)
!959 = !DILocation(line: 783, column: 50, scope: !945)
!960 = !DILocation(line: 783, column: 38, scope: !945)
!961 = !DILocation(line: 783, column: 13, scope: !945)
!962 = !DILocation(line: 784, column: 6, scope: !963)
!963 = distinct !DILexicalBlock(scope: !945, file: !69, line: 784, column: 6)
!964 = !DILocation(line: 784, column: 16, scope: !963)
!965 = !DILocation(line: 784, column: 6, scope: !945)
!966 = !DILocation(line: 786, column: 7, scope: !967)
!967 = distinct !DILexicalBlock(scope: !968, file: !69, line: 786, column: 7)
!968 = distinct !DILexicalBlock(scope: !963, file: !69, line: 785, column: 3)
!969 = !DILocation(line: 786, column: 17, scope: !967)
!970 = !DILocation(line: 786, column: 7, scope: !968)
!971 = !DILocation(line: 788, column: 17, scope: !972)
!972 = distinct !DILexicalBlock(scope: !967, file: !69, line: 787, column: 4)
!973 = !DILocation(line: 788, column: 12, scope: !972)
!974 = !DILocation(line: 788, column: 5, scope: !972)
!975 = !DILocation(line: 792, column: 5, scope: !976)
!976 = distinct !DILexicalBlock(scope: !967, file: !69, line: 791, column: 4)
!977 = !DILocation(line: 797, column: 4, scope: !978)
!978 = distinct !DILexicalBlock(scope: !963, file: !69, line: 796, column: 3)
!979 = !DILocation(line: 800, column: 1, scope: !910)
!980 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 819, type: !981, scopeLine: 820, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!981 = !DISubroutineType(types: !982)
!982 = !{!28, !6, !28, !28}
!983 = !DILocalVariable(name: "factor1", arg: 1, scope: !980, file: !69, line: 819, type: !6)
!984 = !DILocation(line: 819, column: 33, scope: !980)
!985 = !DILocalVariable(name: "factor2", arg: 2, scope: !980, file: !69, line: 819, type: !28)
!986 = !DILocation(line: 819, column: 46, scope: !980)
!987 = !DILocalVariable(name: "denominator", arg: 3, scope: !980, file: !69, line: 819, type: !28)
!988 = !DILocation(line: 819, column: 59, scope: !980)
!989 = !DILocalVariable(name: "s32Result", scope: !980, file: !69, line: 821, type: !16)
!990 = !DILocation(line: 821, column: 6, scope: !980)
!991 = !DILocalVariable(name: "s32Temp1", scope: !980, file: !69, line: 821, type: !16)
!992 = !DILocation(line: 821, column: 21, scope: !980)
!993 = !DILocation(line: 822, column: 14, scope: !980)
!994 = !DILocation(line: 822, column: 24, scope: !980)
!995 = !DILocation(line: 822, column: 22, scope: !980)
!996 = !DILocation(line: 822, column: 12, scope: !980)
!997 = !DILocation(line: 824, column: 5, scope: !998)
!998 = distinct !DILexicalBlock(scope: !980, file: !69, line: 824, column: 5)
!999 = !DILocation(line: 824, column: 17, scope: !998)
!1000 = !DILocation(line: 824, column: 5, scope: !980)
!1001 = !DILocation(line: 826, column: 6, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !1003, file: !69, line: 826, column: 6)
!1003 = distinct !DILexicalBlock(scope: !998, file: !69, line: 825, column: 2)
!1004 = !DILocation(line: 826, column: 16, scope: !1002)
!1005 = !DILocation(line: 826, column: 6, scope: !1003)
!1006 = !DILocation(line: 828, column: 4, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !1002, file: !69, line: 827, column: 3)
!1008 = !DILocation(line: 832, column: 4, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !1002, file: !69, line: 831, column: 3)
!1010 = !DILocation(line: 837, column: 15, scope: !1011)
!1011 = distinct !DILexicalBlock(scope: !998, file: !69, line: 836, column: 2)
!1012 = !DILocation(line: 837, column: 29, scope: !1011)
!1013 = !DILocation(line: 837, column: 39, scope: !1011)
!1014 = !DILocation(line: 837, column: 38, scope: !1011)
!1015 = !DILocation(line: 837, column: 54, scope: !1011)
!1016 = !DILocation(line: 837, column: 52, scope: !1011)
!1017 = !DILocation(line: 837, column: 25, scope: !1011)
!1018 = !DILocation(line: 837, column: 68, scope: !1011)
!1019 = !DILocation(line: 837, column: 12, scope: !1011)
!1020 = !DILocation(line: 838, column: 16, scope: !1011)
!1021 = !DILocation(line: 838, column: 25, scope: !1011)
!1022 = !DILocation(line: 838, column: 24, scope: !1011)
!1023 = !DILocation(line: 838, column: 41, scope: !1011)
!1024 = !DILocation(line: 838, column: 51, scope: !1011)
!1025 = !DILocation(line: 838, column: 50, scope: !1011)
!1026 = !DILocation(line: 838, column: 38, scope: !1011)
!1027 = !DILocation(line: 838, column: 13, scope: !1011)
!1028 = !DILocation(line: 839, column: 6, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1011, file: !69, line: 839, column: 6)
!1030 = !DILocation(line: 839, column: 16, scope: !1029)
!1031 = !DILocation(line: 839, column: 6, scope: !1011)
!1032 = !DILocation(line: 841, column: 7, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1034, file: !69, line: 841, column: 7)
!1034 = distinct !DILexicalBlock(scope: !1029, file: !69, line: 840, column: 3)
!1035 = !DILocation(line: 841, column: 17, scope: !1033)
!1036 = !DILocation(line: 841, column: 7, scope: !1034)
!1037 = !DILocation(line: 843, column: 17, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1033, file: !69, line: 842, column: 4)
!1039 = !DILocation(line: 843, column: 12, scope: !1038)
!1040 = !DILocation(line: 843, column: 5, scope: !1038)
!1041 = !DILocation(line: 847, column: 5, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1033, file: !69, line: 846, column: 4)
!1043 = !DILocation(line: 852, column: 4, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1029, file: !69, line: 851, column: 3)
!1045 = !DILocation(line: 856, column: 1, scope: !980)
!1046 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 874, type: !1047, scopeLine: 875, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1047 = !DISubroutineType(types: !1048)
!1048 = !{!28, !28, !28, !28}
!1049 = !DILocalVariable(name: "factor1", arg: 1, scope: !1046, file: !69, line: 874, type: !28)
!1050 = !DILocation(line: 874, column: 33, scope: !1046)
!1051 = !DILocalVariable(name: "factor2", arg: 2, scope: !1046, file: !69, line: 874, type: !28)
!1052 = !DILocation(line: 874, column: 46, scope: !1046)
!1053 = !DILocalVariable(name: "denominator", arg: 3, scope: !1046, file: !69, line: 874, type: !28)
!1054 = !DILocation(line: 874, column: 59, scope: !1046)
!1055 = !DILocalVariable(name: "u32Temp1", scope: !1046, file: !69, line: 876, type: !591)
!1056 = !DILocation(line: 876, column: 6, scope: !1046)
!1057 = !DILocalVariable(name: "u16TempDenom", scope: !1046, file: !69, line: 877, type: !28)
!1058 = !DILocation(line: 877, column: 6, scope: !1046)
!1059 = !DILocation(line: 879, column: 5, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1046, file: !69, line: 879, column: 5)
!1061 = !DILocation(line: 879, column: 17, scope: !1060)
!1062 = !DILocation(line: 879, column: 5, scope: !1046)
!1063 = !DILocation(line: 881, column: 3, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1060, file: !69, line: 880, column: 2)
!1065 = !DILocation(line: 885, column: 14, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1060, file: !69, line: 884, column: 2)
!1067 = !DILocation(line: 885, column: 24, scope: !1066)
!1068 = !DILocation(line: 885, column: 22, scope: !1066)
!1069 = !DILocation(line: 885, column: 12, scope: !1066)
!1070 = !DILocation(line: 886, column: 18, scope: !1066)
!1071 = !DILocation(line: 886, column: 30, scope: !1066)
!1072 = !DILocation(line: 886, column: 16, scope: !1066)
!1073 = !DILocation(line: 887, column: 14, scope: !1066)
!1074 = !DILocation(line: 887, column: 25, scope: !1066)
!1075 = !DILocation(line: 887, column: 23, scope: !1066)
!1076 = !DILocation(line: 887, column: 12, scope: !1066)
!1077 = !DILocation(line: 888, column: 14, scope: !1066)
!1078 = !DILocation(line: 888, column: 25, scope: !1066)
!1079 = !DILocation(line: 888, column: 23, scope: !1066)
!1080 = !DILocation(line: 888, column: 12, scope: !1066)
!1081 = !DILocation(line: 889, column: 6, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1066, file: !69, line: 889, column: 6)
!1083 = !DILocation(line: 889, column: 15, scope: !1082)
!1084 = !DILocation(line: 889, column: 6, scope: !1066)
!1085 = !DILocation(line: 891, column: 12, scope: !1086)
!1086 = distinct !DILexicalBlock(scope: !1082, file: !69, line: 890, column: 3)
!1087 = !DILocation(line: 891, column: 21, scope: !1086)
!1088 = !DILocation(line: 891, column: 11, scope: !1086)
!1089 = !DILocation(line: 891, column: 4, scope: !1086)
!1090 = !DILocation(line: 896, column: 4, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1082, file: !69, line: 895, column: 3)
!1092 = !DILocation(line: 901, column: 1, scope: !1046)
!1093 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 918, type: !1094, scopeLine: 919, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1094 = !DISubroutineType(types: !1095)
!1095 = !{!28, !28, !28, !591}
!1096 = !DILocalVariable(name: "factor1", arg: 1, scope: !1093, file: !69, line: 918, type: !28)
!1097 = !DILocation(line: 918, column: 33, scope: !1093)
!1098 = !DILocalVariable(name: "factor2", arg: 2, scope: !1093, file: !69, line: 918, type: !28)
!1099 = !DILocation(line: 918, column: 46, scope: !1093)
!1100 = !DILocalVariable(name: "denominator", arg: 3, scope: !1093, file: !69, line: 918, type: !591)
!1101 = !DILocation(line: 918, column: 59, scope: !1093)
!1102 = !DILocalVariable(name: "u32Temp1", scope: !1093, file: !69, line: 920, type: !591)
!1103 = !DILocation(line: 920, column: 6, scope: !1093)
!1104 = !DILocation(line: 921, column: 5, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1093, file: !69, line: 921, column: 5)
!1106 = !DILocation(line: 921, column: 17, scope: !1105)
!1107 = !DILocation(line: 921, column: 5, scope: !1093)
!1108 = !DILocation(line: 923, column: 3, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1105, file: !69, line: 922, column: 2)
!1110 = !DILocation(line: 927, column: 15, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !1105, file: !69, line: 926, column: 2)
!1112 = !DILocation(line: 927, column: 25, scope: !1111)
!1113 = !DILocation(line: 927, column: 23, scope: !1111)
!1114 = !DILocation(line: 927, column: 36, scope: !1111)
!1115 = !DILocation(line: 927, column: 34, scope: !1111)
!1116 = !DILocation(line: 927, column: 12, scope: !1111)
!1117 = !DILocation(line: 928, column: 8, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1111, file: !69, line: 928, column: 6)
!1119 = !DILocation(line: 928, column: 18, scope: !1118)
!1120 = !DILocation(line: 928, column: 16, scope: !1118)
!1121 = !DILocation(line: 928, column: 28, scope: !1118)
!1122 = !DILocation(line: 928, column: 40, scope: !1118)
!1123 = !DILocation(line: 928, column: 39, scope: !1118)
!1124 = !DILocation(line: 928, column: 26, scope: !1118)
!1125 = !DILocation(line: 928, column: 53, scope: !1118)
!1126 = !DILocation(line: 928, column: 64, scope: !1118)
!1127 = !DILocation(line: 928, column: 50, scope: !1118)
!1128 = !DILocation(line: 928, column: 6, scope: !1111)
!1129 = !DILocation(line: 930, column: 12, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1118, file: !69, line: 929, column: 3)
!1131 = !DILocation(line: 931, column: 3, scope: !1130)
!1132 = !DILocation(line: 932, column: 6, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1111, file: !69, line: 932, column: 6)
!1134 = !DILocation(line: 932, column: 15, scope: !1133)
!1135 = !DILocation(line: 932, column: 6, scope: !1111)
!1136 = !DILocation(line: 934, column: 12, scope: !1137)
!1137 = distinct !DILexicalBlock(scope: !1133, file: !69, line: 933, column: 3)
!1138 = !DILocation(line: 934, column: 21, scope: !1137)
!1139 = !DILocation(line: 934, column: 11, scope: !1137)
!1140 = !DILocation(line: 934, column: 4, scope: !1137)
!1141 = !DILocation(line: 938, column: 4, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1133, file: !69, line: 937, column: 3)
!1143 = !DILocation(line: 941, column: 1, scope: !1093)
!1144 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 958, type: !1145, scopeLine: 959, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1145 = !DISubroutineType(types: !1146)
!1146 = !{!591, !591, !28}
!1147 = !DILocalVariable(name: "x_value", arg: 1, scope: !1144, file: !69, line: 958, type: !591)
!1148 = !DILocation(line: 958, column: 25, scope: !1144)
!1149 = !DILocalVariable(name: "y_value", arg: 2, scope: !1144, file: !69, line: 958, type: !28)
!1150 = !DILocation(line: 958, column: 38, scope: !1144)
!1151 = !DILocalVariable(name: "u32Temp1", scope: !1144, file: !69, line: 960, type: !591)
!1152 = !DILocation(line: 960, column: 6, scope: !1144)
!1153 = !DILocation(line: 961, column: 5, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1144, file: !69, line: 961, column: 5)
!1155 = !DILocation(line: 961, column: 13, scope: !1154)
!1156 = !DILocation(line: 961, column: 5, scope: !1144)
!1157 = !DILocation(line: 963, column: 3, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1154, file: !69, line: 962, column: 2)
!1159 = !DILocation(line: 967, column: 15, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1154, file: !69, line: 966, column: 2)
!1161 = !DILocation(line: 967, column: 26, scope: !1160)
!1162 = !DILocation(line: 967, column: 34, scope: !1160)
!1163 = !DILocation(line: 967, column: 33, scope: !1160)
!1164 = !DILocation(line: 967, column: 45, scope: !1160)
!1165 = !DILocation(line: 967, column: 43, scope: !1160)
!1166 = !DILocation(line: 967, column: 23, scope: !1160)
!1167 = !DILocation(line: 967, column: 54, scope: !1160)
!1168 = !DILocation(line: 967, column: 12, scope: !1160)
!1169 = !DILocation(line: 968, column: 15, scope: !1160)
!1170 = !DILocation(line: 968, column: 23, scope: !1160)
!1171 = !DILocation(line: 968, column: 22, scope: !1160)
!1172 = !DILocation(line: 968, column: 35, scope: !1160)
!1173 = !DILocation(line: 968, column: 44, scope: !1160)
!1174 = !DILocation(line: 968, column: 43, scope: !1160)
!1175 = !DILocation(line: 968, column: 32, scope: !1160)
!1176 = !DILocation(line: 968, column: 12, scope: !1160)
!1177 = !DILocation(line: 969, column: 10, scope: !1160)
!1178 = !DILocation(line: 969, column: 3, scope: !1160)
!1179 = !DILocation(line: 971, column: 1, scope: !1144)
!1180 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 989, type: !1181, scopeLine: 990, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1181 = !DISubroutineType(types: !1182)
!1182 = !{!6, !6, !6, !6}
!1183 = !DILocalVariable(name: "fak1", arg: 1, scope: !1180, file: !69, line: 989, type: !6)
!1184 = !DILocation(line: 989, column: 33, scope: !1180)
!1185 = !DILocalVariable(name: "fak2", arg: 2, scope: !1180, file: !69, line: 989, type: !6)
!1186 = !DILocation(line: 989, column: 43, scope: !1180)
!1187 = !DILocalVariable(name: "div", arg: 3, scope: !1180, file: !69, line: 989, type: !6)
!1188 = !DILocation(line: 989, column: 53, scope: !1180)
!1189 = !DILocalVariable(name: "s32Temp1", scope: !1180, file: !69, line: 991, type: !16)
!1190 = !DILocation(line: 991, column: 6, scope: !1180)
!1191 = !DILocalVariable(name: "s32Temp2", scope: !1180, file: !69, line: 991, type: !16)
!1192 = !DILocation(line: 991, column: 20, scope: !1180)
!1193 = !DILocalVariable(name: "s32Temp3", scope: !1180, file: !69, line: 991, type: !16)
!1194 = !DILocation(line: 991, column: 34, scope: !1180)
!1195 = !DILocation(line: 992, column: 13, scope: !1180)
!1196 = !DILocation(line: 992, column: 20, scope: !1180)
!1197 = !DILocation(line: 992, column: 18, scope: !1180)
!1198 = !DILocation(line: 992, column: 11, scope: !1180)
!1199 = !DILocation(line: 993, column: 5, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1180, file: !69, line: 993, column: 5)
!1201 = !DILocation(line: 993, column: 9, scope: !1200)
!1202 = !DILocation(line: 993, column: 5, scope: !1180)
!1203 = !DILocation(line: 995, column: 6, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1205, file: !69, line: 995, column: 6)
!1205 = distinct !DILexicalBlock(scope: !1200, file: !69, line: 994, column: 2)
!1206 = !DILocation(line: 995, column: 15, scope: !1204)
!1207 = !DILocation(line: 995, column: 6, scope: !1205)
!1208 = !DILocation(line: 997, column: 4, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1204, file: !69, line: 996, column: 3)
!1210 = !DILocation(line: 1001, column: 4, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1204, file: !69, line: 1000, column: 3)
!1212 = !DILocation(line: 1006, column: 15, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1200, file: !69, line: 1005, column: 2)
!1214 = !DILocation(line: 1006, column: 28, scope: !1213)
!1215 = !DILocation(line: 1006, column: 39, scope: !1213)
!1216 = !DILocation(line: 1006, column: 37, scope: !1213)
!1217 = !DILocation(line: 1006, column: 46, scope: !1213)
!1218 = !DILocation(line: 1006, column: 44, scope: !1213)
!1219 = !DILocation(line: 1006, column: 24, scope: !1213)
!1220 = !DILocation(line: 1006, column: 52, scope: !1213)
!1221 = !DILocation(line: 1006, column: 12, scope: !1213)
!1222 = !DILocation(line: 1007, column: 15, scope: !1213)
!1223 = !DILocation(line: 1007, column: 24, scope: !1213)
!1224 = !DILocation(line: 1007, column: 23, scope: !1213)
!1225 = !DILocation(line: 1007, column: 32, scope: !1213)
!1226 = !DILocation(line: 1007, column: 41, scope: !1213)
!1227 = !DILocation(line: 1007, column: 40, scope: !1213)
!1228 = !DILocation(line: 1007, column: 29, scope: !1213)
!1229 = !DILocation(line: 1007, column: 12, scope: !1213)
!1230 = !DILocation(line: 1008, column: 6, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1213, file: !69, line: 1008, column: 6)
!1232 = !DILocation(line: 1008, column: 15, scope: !1231)
!1233 = !DILocation(line: 1008, column: 6, scope: !1213)
!1234 = !DILocation(line: 1010, column: 7, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1236, file: !69, line: 1010, column: 7)
!1236 = distinct !DILexicalBlock(scope: !1231, file: !69, line: 1009, column: 3)
!1237 = !DILocation(line: 1010, column: 16, scope: !1235)
!1238 = !DILocation(line: 1010, column: 7, scope: !1236)
!1239 = !DILocation(line: 1012, column: 17, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1235, file: !69, line: 1011, column: 4)
!1241 = !DILocation(line: 1012, column: 12, scope: !1240)
!1242 = !DILocation(line: 1012, column: 5, scope: !1240)
!1243 = !DILocation(line: 1016, column: 5, scope: !1244)
!1244 = distinct !DILexicalBlock(scope: !1235, file: !69, line: 1015, column: 4)
!1245 = !DILocation(line: 1021, column: 4, scope: !1246)
!1246 = distinct !DILexicalBlock(scope: !1231, file: !69, line: 1020, column: 3)
!1247 = !DILocation(line: 1024, column: 1, scope: !1180)
!1248 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1042, type: !1249, scopeLine: 1043, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1249 = !DISubroutineType(types: !1250)
!1250 = !{!6, !6, !6, !28}
!1251 = !DILocalVariable(name: "data1", arg: 1, scope: !1248, file: !69, line: 1042, type: !6)
!1252 = !DILocation(line: 1042, column: 33, scope: !1248)
!1253 = !DILocalVariable(name: "data2", arg: 2, scope: !1248, file: !69, line: 1042, type: !6)
!1254 = !DILocation(line: 1042, column: 43, scope: !1248)
!1255 = !DILocalVariable(name: "denominator", arg: 3, scope: !1248, file: !69, line: 1042, type: !28)
!1256 = !DILocation(line: 1042, column: 53, scope: !1248)
!1257 = !DILocalVariable(name: "s32Result", scope: !1248, file: !69, line: 1044, type: !16)
!1258 = !DILocation(line: 1044, column: 6, scope: !1248)
!1259 = !DILocalVariable(name: "s32Temp1", scope: !1248, file: !69, line: 1044, type: !16)
!1260 = !DILocation(line: 1044, column: 21, scope: !1248)
!1261 = !DILocation(line: 1045, column: 14, scope: !1248)
!1262 = !DILocation(line: 1045, column: 22, scope: !1248)
!1263 = !DILocation(line: 1045, column: 20, scope: !1248)
!1264 = !DILocation(line: 1045, column: 12, scope: !1248)
!1265 = !DILocation(line: 1047, column: 5, scope: !1266)
!1266 = distinct !DILexicalBlock(scope: !1248, file: !69, line: 1047, column: 5)
!1267 = !DILocation(line: 1047, column: 17, scope: !1266)
!1268 = !DILocation(line: 1047, column: 5, scope: !1248)
!1269 = !DILocation(line: 1049, column: 6, scope: !1270)
!1270 = distinct !DILexicalBlock(scope: !1271, file: !69, line: 1049, column: 6)
!1271 = distinct !DILexicalBlock(scope: !1266, file: !69, line: 1048, column: 2)
!1272 = !DILocation(line: 1049, column: 16, scope: !1270)
!1273 = !DILocation(line: 1049, column: 6, scope: !1271)
!1274 = !DILocation(line: 1051, column: 4, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1270, file: !69, line: 1050, column: 3)
!1276 = !DILocation(line: 1053, column: 11, scope: !1277)
!1277 = distinct !DILexicalBlock(scope: !1270, file: !69, line: 1053, column: 11)
!1278 = !DILocation(line: 1053, column: 21, scope: !1277)
!1279 = !DILocation(line: 1053, column: 11, scope: !1270)
!1280 = !DILocation(line: 1055, column: 4, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1277, file: !69, line: 1054, column: 3)
!1282 = !DILocation(line: 1059, column: 4, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1277, file: !69, line: 1058, column: 3)
!1284 = !DILocation(line: 1064, column: 15, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1266, file: !69, line: 1063, column: 2)
!1286 = !DILocation(line: 1064, column: 28, scope: !1285)
!1287 = !DILocation(line: 1064, column: 38, scope: !1285)
!1288 = !DILocation(line: 1064, column: 37, scope: !1285)
!1289 = !DILocation(line: 1064, column: 51, scope: !1285)
!1290 = !DILocation(line: 1064, column: 50, scope: !1285)
!1291 = !DILocation(line: 1064, column: 25, scope: !1285)
!1292 = !DILocation(line: 1064, column: 64, scope: !1285)
!1293 = !DILocation(line: 1064, column: 12, scope: !1285)
!1294 = !DILocation(line: 1065, column: 16, scope: !1285)
!1295 = !DILocation(line: 1065, column: 25, scope: !1285)
!1296 = !DILocation(line: 1065, column: 24, scope: !1285)
!1297 = !DILocation(line: 1065, column: 41, scope: !1285)
!1298 = !DILocation(line: 1065, column: 51, scope: !1285)
!1299 = !DILocation(line: 1065, column: 50, scope: !1285)
!1300 = !DILocation(line: 1065, column: 38, scope: !1285)
!1301 = !DILocation(line: 1065, column: 13, scope: !1285)
!1302 = !DILocation(line: 1066, column: 6, scope: !1303)
!1303 = distinct !DILexicalBlock(scope: !1285, file: !69, line: 1066, column: 6)
!1304 = !DILocation(line: 1066, column: 16, scope: !1303)
!1305 = !DILocation(line: 1066, column: 6, scope: !1285)
!1306 = !DILocation(line: 1068, column: 7, scope: !1307)
!1307 = distinct !DILexicalBlock(scope: !1308, file: !69, line: 1068, column: 7)
!1308 = distinct !DILexicalBlock(scope: !1303, file: !69, line: 1067, column: 3)
!1309 = !DILocation(line: 1068, column: 17, scope: !1307)
!1310 = !DILocation(line: 1068, column: 7, scope: !1308)
!1311 = !DILocation(line: 1070, column: 17, scope: !1312)
!1312 = distinct !DILexicalBlock(scope: !1307, file: !69, line: 1069, column: 4)
!1313 = !DILocation(line: 1070, column: 12, scope: !1312)
!1314 = !DILocation(line: 1070, column: 5, scope: !1312)
!1315 = !DILocation(line: 1074, column: 5, scope: !1316)
!1316 = distinct !DILexicalBlock(scope: !1307, file: !69, line: 1073, column: 4)
!1317 = !DILocation(line: 1079, column: 4, scope: !1318)
!1318 = distinct !DILexicalBlock(scope: !1303, file: !69, line: 1078, column: 3)
!1319 = !DILocation(line: 1083, column: 1, scope: !1248)
!1320 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1100, type: !1321, scopeLine: 1101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1321 = !DISubroutineType(types: !1322)
!1322 = !{!591, !591, !16}
!1323 = !DILocalVariable(name: "numerator", arg: 1, scope: !1320, file: !69, line: 1100, type: !591)
!1324 = !DILocation(line: 1100, column: 25, scope: !1320)
!1325 = !DILocalVariable(name: "denominator", arg: 2, scope: !1320, file: !69, line: 1100, type: !16)
!1326 = !DILocation(line: 1100, column: 40, scope: !1320)
!1327 = !DILocalVariable(name: "u32Temp1", scope: !1320, file: !69, line: 1102, type: !591)
!1328 = !DILocation(line: 1102, column: 6, scope: !1320)
!1329 = !DILocation(line: 1103, column: 5, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1320, file: !69, line: 1103, column: 5)
!1331 = !DILocation(line: 1103, column: 17, scope: !1330)
!1332 = !DILocation(line: 1103, column: 5, scope: !1320)
!1333 = !DILocation(line: 1105, column: 3, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1330, file: !69, line: 1104, column: 2)
!1335 = !DILocation(line: 1109, column: 6, scope: !1336)
!1336 = distinct !DILexicalBlock(scope: !1337, file: !69, line: 1109, column: 6)
!1337 = distinct !DILexicalBlock(scope: !1330, file: !69, line: 1108, column: 2)
!1338 = !DILocation(line: 1109, column: 18, scope: !1336)
!1339 = !DILocation(line: 1109, column: 6, scope: !1337)
!1340 = !DILocation(line: 1111, column: 4, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1336, file: !69, line: 1110, column: 3)
!1342 = !DILocation(line: 1115, column: 16, scope: !1343)
!1343 = distinct !DILexicalBlock(scope: !1336, file: !69, line: 1114, column: 3)
!1344 = !DILocation(line: 1115, column: 30, scope: !1343)
!1345 = !DILocation(line: 1115, column: 40, scope: !1343)
!1346 = !DILocation(line: 1115, column: 39, scope: !1343)
!1347 = !DILocation(line: 1115, column: 55, scope: !1343)
!1348 = !DILocation(line: 1115, column: 53, scope: !1343)
!1349 = !DILocation(line: 1115, column: 26, scope: !1343)
!1350 = !DILocation(line: 1115, column: 68, scope: !1343)
!1351 = !DILocation(line: 1115, column: 13, scope: !1343)
!1352 = !DILocation(line: 1116, column: 16, scope: !1343)
!1353 = !DILocation(line: 1116, column: 25, scope: !1343)
!1354 = !DILocation(line: 1116, column: 24, scope: !1343)
!1355 = !DILocation(line: 1116, column: 41, scope: !1343)
!1356 = !DILocation(line: 1116, column: 51, scope: !1343)
!1357 = !DILocation(line: 1116, column: 50, scope: !1343)
!1358 = !DILocation(line: 1116, column: 38, scope: !1343)
!1359 = !DILocation(line: 1116, column: 13, scope: !1343)
!1360 = !DILocation(line: 1117, column: 11, scope: !1343)
!1361 = !DILocation(line: 1117, column: 4, scope: !1343)
!1362 = !DILocation(line: 1120, column: 1, scope: !1320)
!1363 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1137, type: !1364, scopeLine: 1138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1364 = !DISubroutineType(types: !1365)
!1365 = !{!591, !16, !591}
!1366 = !DILocalVariable(name: "numerator", arg: 1, scope: !1363, file: !69, line: 1137, type: !16)
!1367 = !DILocation(line: 1137, column: 25, scope: !1363)
!1368 = !DILocalVariable(name: "denominator", arg: 2, scope: !1363, file: !69, line: 1137, type: !591)
!1369 = !DILocation(line: 1137, column: 40, scope: !1363)
!1370 = !DILocalVariable(name: "s32Temp1", scope: !1363, file: !69, line: 1139, type: !16)
!1371 = !DILocation(line: 1139, column: 6, scope: !1363)
!1372 = !DILocation(line: 1140, column: 5, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1363, file: !69, line: 1140, column: 5)
!1374 = !DILocation(line: 1140, column: 17, scope: !1373)
!1375 = !DILocation(line: 1140, column: 5, scope: !1363)
!1376 = !DILocation(line: 1142, column: 6, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1378, file: !69, line: 1142, column: 6)
!1378 = distinct !DILexicalBlock(scope: !1373, file: !69, line: 1141, column: 2)
!1379 = !DILocation(line: 1142, column: 16, scope: !1377)
!1380 = !DILocation(line: 1142, column: 6, scope: !1378)
!1381 = !DILocation(line: 1144, column: 4, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1377, file: !69, line: 1143, column: 3)
!1383 = !DILocation(line: 1148, column: 4, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1377, file: !69, line: 1147, column: 3)
!1385 = !DILocation(line: 1153, column: 6, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1387, file: !69, line: 1153, column: 6)
!1387 = distinct !DILexicalBlock(scope: !1373, file: !69, line: 1152, column: 2)
!1388 = !DILocation(line: 1153, column: 16, scope: !1386)
!1389 = !DILocation(line: 1153, column: 6, scope: !1387)
!1390 = !DILocation(line: 1155, column: 17, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1386, file: !69, line: 1154, column: 3)
!1392 = !DILocation(line: 1155, column: 31, scope: !1391)
!1393 = !DILocation(line: 1155, column: 41, scope: !1391)
!1394 = !DILocation(line: 1155, column: 40, scope: !1391)
!1395 = !DILocation(line: 1155, column: 56, scope: !1391)
!1396 = !DILocation(line: 1155, column: 54, scope: !1391)
!1397 = !DILocation(line: 1155, column: 27, scope: !1391)
!1398 = !DILocation(line: 1155, column: 69, scope: !1391)
!1399 = !DILocation(line: 1155, column: 13, scope: !1391)
!1400 = !DILocation(line: 1156, column: 13, scope: !1391)
!1401 = !DILocation(line: 1156, column: 23, scope: !1391)
!1402 = !DILocation(line: 1156, column: 22, scope: !1391)
!1403 = !DILocation(line: 1156, column: 39, scope: !1391)
!1404 = !DILocation(line: 1156, column: 48, scope: !1391)
!1405 = !DILocation(line: 1156, column: 47, scope: !1391)
!1406 = !DILocation(line: 1156, column: 36, scope: !1391)
!1407 = !DILocation(line: 1156, column: 4, scope: !1391)
!1408 = !DILocation(line: 1160, column: 4, scope: !1409)
!1409 = distinct !DILexicalBlock(scope: !1386, file: !69, line: 1159, column: 3)
!1410 = !DILocation(line: 1163, column: 1, scope: !1363)
!1411 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1180, type: !1412, scopeLine: 1181, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1412 = !DISubroutineType(types: !1413)
!1413 = !{!591, !16, !16}
!1414 = !DILocalVariable(name: "numerator", arg: 1, scope: !1411, file: !69, line: 1180, type: !16)
!1415 = !DILocation(line: 1180, column: 25, scope: !1411)
!1416 = !DILocalVariable(name: "denominator", arg: 2, scope: !1411, file: !69, line: 1180, type: !16)
!1417 = !DILocation(line: 1180, column: 40, scope: !1411)
!1418 = !DILocalVariable(name: "u32Temp1", scope: !1411, file: !69, line: 1182, type: !591)
!1419 = !DILocation(line: 1182, column: 6, scope: !1411)
!1420 = !DILocalVariable(name: "u32Temp2", scope: !1411, file: !69, line: 1182, type: !591)
!1421 = !DILocation(line: 1182, column: 20, scope: !1411)
!1422 = !DILocation(line: 1183, column: 5, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1411, file: !69, line: 1183, column: 5)
!1424 = !DILocation(line: 1183, column: 17, scope: !1423)
!1425 = !DILocation(line: 1183, column: 5, scope: !1411)
!1426 = !DILocation(line: 1185, column: 6, scope: !1427)
!1427 = distinct !DILexicalBlock(scope: !1428, file: !69, line: 1185, column: 6)
!1428 = distinct !DILexicalBlock(scope: !1423, file: !69, line: 1184, column: 2)
!1429 = !DILocation(line: 1185, column: 16, scope: !1427)
!1430 = !DILocation(line: 1185, column: 6, scope: !1428)
!1431 = !DILocation(line: 1187, column: 4, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1427, file: !69, line: 1186, column: 3)
!1433 = !DILocation(line: 1191, column: 4, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1427, file: !69, line: 1190, column: 3)
!1435 = !DILocation(line: 1196, column: 6, scope: !1436)
!1436 = distinct !DILexicalBlock(scope: !1437, file: !69, line: 1196, column: 6)
!1437 = distinct !DILexicalBlock(scope: !1423, file: !69, line: 1195, column: 2)
!1438 = !DILocation(line: 1196, column: 16, scope: !1436)
!1439 = !DILocation(line: 1196, column: 6, scope: !1437)
!1440 = !DILocation(line: 1198, column: 7, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1442, file: !69, line: 1198, column: 7)
!1442 = distinct !DILexicalBlock(scope: !1436, file: !69, line: 1197, column: 3)
!1443 = !DILocation(line: 1198, column: 17, scope: !1441)
!1444 = !DILocation(line: 1198, column: 7, scope: !1442)
!1445 = !DILocation(line: 1200, column: 5, scope: !1446)
!1446 = distinct !DILexicalBlock(scope: !1441, file: !69, line: 1199, column: 4)
!1447 = !DILocation(line: 1204, column: 8, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1449, file: !69, line: 1204, column: 8)
!1449 = distinct !DILexicalBlock(scope: !1441, file: !69, line: 1203, column: 4)
!1450 = !DILocation(line: 1204, column: 20, scope: !1448)
!1451 = !DILocation(line: 1204, column: 8, scope: !1449)
!1452 = !DILocation(line: 1206, column: 6, scope: !1453)
!1453 = distinct !DILexicalBlock(scope: !1448, file: !69, line: 1205, column: 5)
!1454 = !DILocation(line: 1210, column: 18, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1448, file: !69, line: 1209, column: 5)
!1456 = !DILocation(line: 1210, column: 32, scope: !1455)
!1457 = !DILocation(line: 1210, column: 42, scope: !1455)
!1458 = !DILocation(line: 1210, column: 41, scope: !1455)
!1459 = !DILocation(line: 1210, column: 57, scope: !1455)
!1460 = !DILocation(line: 1210, column: 55, scope: !1455)
!1461 = !DILocation(line: 1210, column: 28, scope: !1455)
!1462 = !DILocation(line: 1210, column: 71, scope: !1455)
!1463 = !DILocation(line: 1210, column: 15, scope: !1455)
!1464 = !DILocation(line: 1211, column: 18, scope: !1455)
!1465 = !DILocation(line: 1211, column: 29, scope: !1455)
!1466 = !DILocation(line: 1211, column: 27, scope: !1455)
!1467 = !DILocation(line: 1211, column: 45, scope: !1455)
!1468 = !DILocation(line: 1211, column: 57, scope: !1455)
!1469 = !DILocation(line: 1211, column: 55, scope: !1455)
!1470 = !DILocation(line: 1211, column: 42, scope: !1455)
!1471 = !DILocation(line: 1211, column: 15, scope: !1455)
!1472 = !DILocation(line: 1212, column: 13, scope: !1455)
!1473 = !DILocation(line: 1212, column: 6, scope: !1455)
!1474 = !DILocation(line: 1218, column: 7, scope: !1475)
!1475 = distinct !DILexicalBlock(scope: !1476, file: !69, line: 1218, column: 7)
!1476 = distinct !DILexicalBlock(scope: !1436, file: !69, line: 1217, column: 3)
!1477 = !DILocation(line: 1218, column: 19, scope: !1475)
!1478 = !DILocation(line: 1218, column: 7, scope: !1476)
!1479 = !DILocation(line: 1220, column: 5, scope: !1480)
!1480 = distinct !DILexicalBlock(scope: !1475, file: !69, line: 1219, column: 4)
!1481 = !DILocation(line: 1224, column: 18, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1475, file: !69, line: 1223, column: 4)
!1483 = !DILocation(line: 1224, column: 17, scope: !1482)
!1484 = !DILocation(line: 1224, column: 15, scope: !1482)
!1485 = !DILocation(line: 1225, column: 20, scope: !1482)
!1486 = !DILocation(line: 1225, column: 19, scope: !1482)
!1487 = !DILocation(line: 1225, column: 17, scope: !1482)
!1488 = !DILocation(line: 1226, column: 17, scope: !1482)
!1489 = !DILocation(line: 1226, column: 31, scope: !1482)
!1490 = !DILocation(line: 1226, column: 41, scope: !1482)
!1491 = !DILocation(line: 1226, column: 40, scope: !1482)
!1492 = !DILocation(line: 1226, column: 56, scope: !1482)
!1493 = !DILocation(line: 1226, column: 54, scope: !1482)
!1494 = !DILocation(line: 1226, column: 27, scope: !1482)
!1495 = !DILocation(line: 1226, column: 70, scope: !1482)
!1496 = !DILocation(line: 1226, column: 14, scope: !1482)
!1497 = !DILocation(line: 1227, column: 17, scope: !1482)
!1498 = !DILocation(line: 1227, column: 28, scope: !1482)
!1499 = !DILocation(line: 1227, column: 26, scope: !1482)
!1500 = !DILocation(line: 1227, column: 44, scope: !1482)
!1501 = !DILocation(line: 1227, column: 56, scope: !1482)
!1502 = !DILocation(line: 1227, column: 54, scope: !1482)
!1503 = !DILocation(line: 1227, column: 41, scope: !1482)
!1504 = !DILocation(line: 1227, column: 14, scope: !1482)
!1505 = !DILocation(line: 1228, column: 12, scope: !1482)
!1506 = !DILocation(line: 1228, column: 5, scope: !1482)
!1507 = !DILocation(line: 1233, column: 1, scope: !1411)
!1508 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1250, type: !1509, scopeLine: 1251, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1509 = !DISubroutineType(types: !1510)
!1510 = !{!591, !591, !591}
!1511 = !DILocalVariable(name: "numerator", arg: 1, scope: !1508, file: !69, line: 1250, type: !591)
!1512 = !DILocation(line: 1250, column: 25, scope: !1508)
!1513 = !DILocalVariable(name: "denominator", arg: 2, scope: !1508, file: !69, line: 1250, type: !591)
!1514 = !DILocation(line: 1250, column: 40, scope: !1508)
!1515 = !DILocalVariable(name: "u32Temp1", scope: !1508, file: !69, line: 1253, type: !591)
!1516 = !DILocation(line: 1253, column: 6, scope: !1508)
!1517 = !DILocalVariable(name: "u32Temp2", scope: !1508, file: !69, line: 1253, type: !591)
!1518 = !DILocation(line: 1253, column: 20, scope: !1508)
!1519 = !DILocalVariable(name: "u32Temp3", scope: !1508, file: !69, line: 1253, type: !591)
!1520 = !DILocation(line: 1253, column: 34, scope: !1508)
!1521 = !DILocalVariable(name: "numerator_old", scope: !1508, file: !69, line: 1253, type: !591)
!1522 = !DILocation(line: 1253, column: 48, scope: !1508)
!1523 = !DILocation(line: 1254, column: 5, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1508, file: !69, line: 1254, column: 5)
!1525 = !DILocation(line: 1254, column: 16, scope: !1524)
!1526 = !DILocation(line: 1254, column: 5, scope: !1508)
!1527 = !DILocation(line: 1256, column: 3, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1524, file: !69, line: 1255, column: 2)
!1529 = !DILocation(line: 1260, column: 14, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1524, file: !69, line: 1259, column: 2)
!1531 = !DILocation(line: 1260, column: 26, scope: !1530)
!1532 = !DILocation(line: 1260, column: 41, scope: !1530)
!1533 = !DILocation(line: 1260, column: 51, scope: !1530)
!1534 = !DILocation(line: 1260, column: 50, scope: !1530)
!1535 = !DILocation(line: 1260, column: 38, scope: !1530)
!1536 = !DILocation(line: 1260, column: 24, scope: !1530)
!1537 = !DILocation(line: 1260, column: 12, scope: !1530)
!1538 = !DILocation(line: 1261, column: 7, scope: !1539)
!1539 = distinct !DILexicalBlock(scope: !1530, file: !69, line: 1261, column: 6)
!1540 = !DILocation(line: 1261, column: 16, scope: !1539)
!1541 = !DILocation(line: 1261, column: 24, scope: !1539)
!1542 = !DILocation(line: 1261, column: 6, scope: !1530)
!1543 = !DILocation(line: 1263, column: 16, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1539, file: !69, line: 1262, column: 3)
!1545 = !DILocation(line: 1263, column: 27, scope: !1544)
!1546 = !DILocation(line: 1263, column: 13, scope: !1544)
!1547 = !DILocation(line: 1264, column: 3, scope: !1544)
!1548 = !DILocation(line: 1267, column: 16, scope: !1549)
!1549 = distinct !DILexicalBlock(scope: !1539, file: !69, line: 1266, column: 3)
!1550 = !DILocation(line: 1267, column: 27, scope: !1549)
!1551 = !DILocation(line: 1267, column: 32, scope: !1549)
!1552 = !DILocation(line: 1267, column: 13, scope: !1549)
!1553 = !DILocation(line: 1270, column: 6, scope: !1554)
!1554 = distinct !DILexicalBlock(scope: !1530, file: !69, line: 1270, column: 6)
!1555 = !DILocation(line: 1270, column: 17, scope: !1554)
!1556 = !DILocation(line: 1270, column: 15, scope: !1554)
!1557 = !DILocation(line: 1270, column: 6, scope: !1530)
!1558 = !DILocation(line: 1272, column: 12, scope: !1559)
!1559 = distinct !DILexicalBlock(scope: !1554, file: !69, line: 1271, column: 3)
!1560 = !DILocation(line: 1272, column: 22, scope: !1559)
!1561 = !DILocation(line: 1272, column: 21, scope: !1559)
!1562 = !DILocation(line: 1272, column: 4, scope: !1559)
!1563 = !DILocation(line: 1276, column: 13, scope: !1564)
!1564 = distinct !DILexicalBlock(scope: !1554, file: !69, line: 1275, column: 3)
!1565 = !DILocation(line: 1276, column: 23, scope: !1564)
!1566 = !DILocation(line: 1276, column: 22, scope: !1564)
!1567 = !DILocation(line: 1276, column: 36, scope: !1564)
!1568 = !DILocation(line: 1276, column: 4, scope: !1564)
!1569 = !DILocation(line: 1281, column: 1, scope: !1508)
!1570 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1298, type: !1571, scopeLine: 1299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1571 = !DISubroutineType(types: !1572)
!1572 = !{!16, !591, !16}
!1573 = !DILocalVariable(name: "numerator", arg: 1, scope: !1570, file: !69, line: 1298, type: !591)
!1574 = !DILocation(line: 1298, column: 25, scope: !1570)
!1575 = !DILocalVariable(name: "denominator", arg: 2, scope: !1570, file: !69, line: 1298, type: !16)
!1576 = !DILocation(line: 1298, column: 40, scope: !1570)
!1577 = !DILocalVariable(name: "u32Temp1", scope: !1570, file: !69, line: 1300, type: !591)
!1578 = !DILocation(line: 1300, column: 6, scope: !1570)
!1579 = !DILocalVariable(name: "u32Temp2", scope: !1570, file: !69, line: 1300, type: !591)
!1580 = !DILocation(line: 1300, column: 20, scope: !1570)
!1581 = !DILocation(line: 1301, column: 5, scope: !1582)
!1582 = distinct !DILexicalBlock(scope: !1570, file: !69, line: 1301, column: 5)
!1583 = !DILocation(line: 1301, column: 17, scope: !1582)
!1584 = !DILocation(line: 1301, column: 5, scope: !1570)
!1585 = !DILocation(line: 1303, column: 6, scope: !1586)
!1586 = distinct !DILexicalBlock(scope: !1587, file: !69, line: 1303, column: 6)
!1587 = distinct !DILexicalBlock(scope: !1582, file: !69, line: 1302, column: 2)
!1588 = !DILocation(line: 1303, column: 18, scope: !1586)
!1589 = !DILocation(line: 1303, column: 6, scope: !1587)
!1590 = !DILocation(line: 1305, column: 4, scope: !1591)
!1591 = distinct !DILexicalBlock(scope: !1586, file: !69, line: 1304, column: 3)
!1592 = !DILocation(line: 1309, column: 19, scope: !1593)
!1593 = distinct !DILexicalBlock(scope: !1586, file: !69, line: 1308, column: 3)
!1594 = !DILocation(line: 1309, column: 18, scope: !1593)
!1595 = !DILocation(line: 1309, column: 16, scope: !1593)
!1596 = !DILocation(line: 1310, column: 16, scope: !1593)
!1597 = !DILocation(line: 1310, column: 30, scope: !1593)
!1598 = !DILocation(line: 1310, column: 40, scope: !1593)
!1599 = !DILocation(line: 1310, column: 39, scope: !1593)
!1600 = !DILocation(line: 1310, column: 55, scope: !1593)
!1601 = !DILocation(line: 1310, column: 53, scope: !1593)
!1602 = !DILocation(line: 1310, column: 26, scope: !1593)
!1603 = !DILocation(line: 1310, column: 69, scope: !1593)
!1604 = !DILocation(line: 1310, column: 13, scope: !1593)
!1605 = !DILocation(line: 1311, column: 16, scope: !1593)
!1606 = !DILocation(line: 1311, column: 25, scope: !1593)
!1607 = !DILocation(line: 1311, column: 24, scope: !1593)
!1608 = !DILocation(line: 1311, column: 41, scope: !1593)
!1609 = !DILocation(line: 1311, column: 51, scope: !1593)
!1610 = !DILocation(line: 1311, column: 50, scope: !1593)
!1611 = !DILocation(line: 1311, column: 38, scope: !1593)
!1612 = !DILocation(line: 1311, column: 13, scope: !1593)
!1613 = !DILocation(line: 1312, column: 7, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1593, file: !69, line: 1312, column: 7)
!1615 = !DILocation(line: 1312, column: 16, scope: !1614)
!1616 = !DILocation(line: 1312, column: 7, scope: !1593)
!1617 = !DILocation(line: 1314, column: 13, scope: !1618)
!1618 = distinct !DILexicalBlock(scope: !1614, file: !69, line: 1313, column: 4)
!1619 = !DILocation(line: 1314, column: 12, scope: !1618)
!1620 = !DILocation(line: 1314, column: 5, scope: !1618)
!1621 = !DILocation(line: 1318, column: 5, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1614, file: !69, line: 1317, column: 4)
!1623 = !DILocation(line: 1324, column: 15, scope: !1624)
!1624 = distinct !DILexicalBlock(scope: !1582, file: !69, line: 1323, column: 2)
!1625 = !DILocation(line: 1324, column: 29, scope: !1624)
!1626 = !DILocation(line: 1324, column: 39, scope: !1624)
!1627 = !DILocation(line: 1324, column: 38, scope: !1624)
!1628 = !DILocation(line: 1324, column: 54, scope: !1624)
!1629 = !DILocation(line: 1324, column: 52, scope: !1624)
!1630 = !DILocation(line: 1324, column: 25, scope: !1624)
!1631 = !DILocation(line: 1324, column: 68, scope: !1624)
!1632 = !DILocation(line: 1324, column: 12, scope: !1624)
!1633 = !DILocation(line: 1325, column: 15, scope: !1624)
!1634 = !DILocation(line: 1325, column: 24, scope: !1624)
!1635 = !DILocation(line: 1325, column: 23, scope: !1624)
!1636 = !DILocation(line: 1325, column: 40, scope: !1624)
!1637 = !DILocation(line: 1325, column: 50, scope: !1624)
!1638 = !DILocation(line: 1325, column: 49, scope: !1624)
!1639 = !DILocation(line: 1325, column: 37, scope: !1624)
!1640 = !DILocation(line: 1325, column: 12, scope: !1624)
!1641 = !DILocation(line: 1326, column: 6, scope: !1642)
!1642 = distinct !DILexicalBlock(scope: !1624, file: !69, line: 1326, column: 6)
!1643 = !DILocation(line: 1326, column: 15, scope: !1642)
!1644 = !DILocation(line: 1326, column: 6, scope: !1624)
!1645 = !DILocation(line: 1328, column: 11, scope: !1646)
!1646 = distinct !DILexicalBlock(scope: !1642, file: !69, line: 1327, column: 3)
!1647 = !DILocation(line: 1328, column: 4, scope: !1646)
!1648 = !DILocation(line: 1332, column: 4, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1642, file: !69, line: 1331, column: 3)
!1650 = !DILocation(line: 1335, column: 1, scope: !1570)
!1651 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1353, type: !1652, scopeLine: 1354, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1652 = !DISubroutineType(types: !1653)
!1653 = !{!16, !16, !591}
!1654 = !DILocalVariable(name: "numerator", arg: 1, scope: !1651, file: !69, line: 1353, type: !16)
!1655 = !DILocation(line: 1353, column: 25, scope: !1651)
!1656 = !DILocalVariable(name: "denominator", arg: 2, scope: !1651, file: !69, line: 1353, type: !591)
!1657 = !DILocation(line: 1353, column: 40, scope: !1651)
!1658 = !DILocalVariable(name: "s32Temp1", scope: !1651, file: !69, line: 1355, type: !16)
!1659 = !DILocation(line: 1355, column: 6, scope: !1651)
!1660 = !DILocalVariable(name: "s32Temp2", scope: !1651, file: !69, line: 1355, type: !16)
!1661 = !DILocation(line: 1355, column: 20, scope: !1651)
!1662 = !DILocalVariable(name: "u32Temp0", scope: !1651, file: !69, line: 1356, type: !591)
!1663 = !DILocation(line: 1356, column: 6, scope: !1651)
!1664 = !DILocalVariable(name: "u32Temp1", scope: !1651, file: !69, line: 1356, type: !591)
!1665 = !DILocation(line: 1356, column: 20, scope: !1651)
!1666 = !DILocalVariable(name: "u32Temp2", scope: !1651, file: !69, line: 1356, type: !591)
!1667 = !DILocation(line: 1356, column: 34, scope: !1651)
!1668 = !DILocation(line: 1357, column: 5, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1651, file: !69, line: 1357, column: 5)
!1670 = !DILocation(line: 1357, column: 17, scope: !1669)
!1671 = !DILocation(line: 1357, column: 5, scope: !1651)
!1672 = !DILocation(line: 1359, column: 6, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1674, file: !69, line: 1359, column: 6)
!1674 = distinct !DILexicalBlock(scope: !1669, file: !69, line: 1358, column: 2)
!1675 = !DILocation(line: 1359, column: 16, scope: !1673)
!1676 = !DILocation(line: 1359, column: 6, scope: !1674)
!1677 = !DILocation(line: 1361, column: 4, scope: !1678)
!1678 = distinct !DILexicalBlock(scope: !1673, file: !69, line: 1360, column: 3)
!1679 = !DILocation(line: 1365, column: 4, scope: !1680)
!1680 = distinct !DILexicalBlock(scope: !1673, file: !69, line: 1364, column: 3)
!1681 = !DILocation(line: 1370, column: 6, scope: !1682)
!1682 = distinct !DILexicalBlock(scope: !1683, file: !69, line: 1370, column: 6)
!1683 = distinct !DILexicalBlock(scope: !1669, file: !69, line: 1369, column: 2)
!1684 = !DILocation(line: 1370, column: 16, scope: !1682)
!1685 = !DILocation(line: 1370, column: 6, scope: !1683)
!1686 = !DILocation(line: 1372, column: 16, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1682, file: !69, line: 1371, column: 3)
!1688 = !DILocation(line: 1372, column: 15, scope: !1687)
!1689 = !DILocation(line: 1372, column: 13, scope: !1687)
!1690 = !DILocation(line: 1373, column: 16, scope: !1687)
!1691 = !DILocation(line: 1373, column: 25, scope: !1687)
!1692 = !DILocation(line: 1373, column: 24, scope: !1687)
!1693 = !DILocation(line: 1373, column: 13, scope: !1687)
!1694 = !DILocation(line: 1374, column: 15, scope: !1687)
!1695 = !DILocation(line: 1374, column: 28, scope: !1687)
!1696 = !DILocation(line: 1374, column: 37, scope: !1687)
!1697 = !DILocation(line: 1374, column: 36, scope: !1687)
!1698 = !DILocation(line: 1374, column: 52, scope: !1687)
!1699 = !DILocation(line: 1374, column: 50, scope: !1687)
!1700 = !DILocation(line: 1374, column: 24, scope: !1687)
!1701 = !DILocation(line: 1374, column: 13, scope: !1687)
!1702 = !DILocation(line: 1376, column: 8, scope: !1703)
!1703 = distinct !DILexicalBlock(scope: !1687, file: !69, line: 1376, column: 7)
!1704 = !DILocation(line: 1376, column: 20, scope: !1703)
!1705 = !DILocation(line: 1376, column: 27, scope: !1703)
!1706 = !DILocation(line: 1376, column: 7, scope: !1687)
!1707 = !DILocation(line: 1378, column: 20, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1703, file: !69, line: 1377, column: 4)
!1709 = !DILocation(line: 1378, column: 32, scope: !1708)
!1710 = !DILocation(line: 1378, column: 17, scope: !1708)
!1711 = !DILocation(line: 1379, column: 4, scope: !1708)
!1712 = !DILocation(line: 1382, column: 20, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1703, file: !69, line: 1381, column: 4)
!1714 = !DILocation(line: 1382, column: 32, scope: !1713)
!1715 = !DILocation(line: 1382, column: 38, scope: !1713)
!1716 = !DILocation(line: 1382, column: 17, scope: !1713)
!1717 = !DILocation(line: 1386, column: 7, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1687, file: !69, line: 1386, column: 7)
!1719 = !DILocation(line: 1386, column: 18, scope: !1718)
!1720 = !DILocation(line: 1386, column: 16, scope: !1718)
!1721 = !DILocation(line: 1386, column: 7, scope: !1687)
!1722 = !DILocation(line: 1388, column: 14, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1718, file: !69, line: 1387, column: 4)
!1724 = !DILocation(line: 1388, column: 13, scope: !1723)
!1725 = !DILocation(line: 1388, column: 23, scope: !1723)
!1726 = !DILocation(line: 1388, column: 5, scope: !1723)
!1727 = !DILocation(line: 1392, column: 14, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1718, file: !69, line: 1391, column: 4)
!1729 = !DILocation(line: 1392, column: 23, scope: !1728)
!1730 = !DILocation(line: 1392, column: 12, scope: !1728)
!1731 = !DILocation(line: 1392, column: 27, scope: !1728)
!1732 = !DILocation(line: 1392, column: 5, scope: !1728)
!1733 = !DILocation(line: 1399, column: 16, scope: !1734)
!1734 = distinct !DILexicalBlock(scope: !1682, file: !69, line: 1398, column: 3)
!1735 = !DILocation(line: 1399, column: 30, scope: !1734)
!1736 = !DILocation(line: 1399, column: 40, scope: !1734)
!1737 = !DILocation(line: 1399, column: 39, scope: !1734)
!1738 = !DILocation(line: 1399, column: 55, scope: !1734)
!1739 = !DILocation(line: 1399, column: 53, scope: !1734)
!1740 = !DILocation(line: 1399, column: 26, scope: !1734)
!1741 = !DILocation(line: 1399, column: 69, scope: !1734)
!1742 = !DILocation(line: 1399, column: 13, scope: !1734)
!1743 = !DILocation(line: 1400, column: 16, scope: !1734)
!1744 = !DILocation(line: 1400, column: 26, scope: !1734)
!1745 = !DILocation(line: 1400, column: 25, scope: !1734)
!1746 = !DILocation(line: 1400, column: 42, scope: !1734)
!1747 = !DILocation(line: 1400, column: 51, scope: !1734)
!1748 = !DILocation(line: 1400, column: 50, scope: !1734)
!1749 = !DILocation(line: 1400, column: 39, scope: !1734)
!1750 = !DILocation(line: 1400, column: 13, scope: !1734)
!1751 = !DILocation(line: 1401, column: 11, scope: !1734)
!1752 = !DILocation(line: 1401, column: 4, scope: !1734)
!1753 = !DILocation(line: 1404, column: 1, scope: !1651)
!1754 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1421, type: !1755, scopeLine: 1422, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1755 = !DISubroutineType(types: !1756)
!1756 = !{!16, !16, !16}
!1757 = !DILocalVariable(name: "numerator", arg: 1, scope: !1754, file: !69, line: 1421, type: !16)
!1758 = !DILocation(line: 1421, column: 25, scope: !1754)
!1759 = !DILocalVariable(name: "denominator", arg: 2, scope: !1754, file: !69, line: 1421, type: !16)
!1760 = !DILocation(line: 1421, column: 40, scope: !1754)
!1761 = !DILocalVariable(name: "s32Temp1", scope: !1754, file: !69, line: 1423, type: !16)
!1762 = !DILocation(line: 1423, column: 6, scope: !1754)
!1763 = !DILocalVariable(name: "s32Temp2", scope: !1754, file: !69, line: 1423, type: !16)
!1764 = !DILocation(line: 1423, column: 20, scope: !1754)
!1765 = !DILocalVariable(name: "denominator_prime", scope: !1754, file: !69, line: 1424, type: !591)
!1766 = !DILocation(line: 1424, column: 6, scope: !1754)
!1767 = !DILocalVariable(name: "u32Temp1", scope: !1754, file: !69, line: 1424, type: !591)
!1768 = !DILocation(line: 1424, column: 29, scope: !1754)
!1769 = !DILocalVariable(name: "u32Temp2", scope: !1754, file: !69, line: 1424, type: !591)
!1770 = !DILocation(line: 1424, column: 43, scope: !1754)
!1771 = !DILocalVariable(name: "u32numerator", scope: !1754, file: !69, line: 1425, type: !591)
!1772 = !DILocation(line: 1425, column: 6, scope: !1754)
!1773 = !DILocalVariable(name: "u32denominator", scope: !1754, file: !69, line: 1425, type: !591)
!1774 = !DILocation(line: 1425, column: 23, scope: !1754)
!1775 = !DILocation(line: 1426, column: 5, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1754, file: !69, line: 1426, column: 5)
!1777 = !DILocation(line: 1426, column: 15, scope: !1776)
!1778 = !DILocation(line: 1426, column: 5, scope: !1754)
!1779 = !DILocation(line: 1428, column: 6, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1781, file: !69, line: 1428, column: 6)
!1781 = distinct !DILexicalBlock(scope: !1776, file: !69, line: 1427, column: 2)
!1782 = !DILocation(line: 1428, column: 18, scope: !1780)
!1783 = !DILocation(line: 1428, column: 6, scope: !1781)
!1784 = !DILocation(line: 1430, column: 7, scope: !1785)
!1785 = distinct !DILexicalBlock(scope: !1786, file: !69, line: 1430, column: 7)
!1786 = distinct !DILexicalBlock(scope: !1780, file: !69, line: 1429, column: 3)
!1787 = !DILocation(line: 1430, column: 19, scope: !1785)
!1788 = !DILocation(line: 1430, column: 7, scope: !1786)
!1789 = !DILocation(line: 1432, column: 5, scope: !1790)
!1790 = distinct !DILexicalBlock(scope: !1785, file: !69, line: 1431, column: 4)
!1791 = !DILocation(line: 1436, column: 21, scope: !1792)
!1792 = distinct !DILexicalBlock(scope: !1785, file: !69, line: 1435, column: 4)
!1793 = !DILocation(line: 1436, column: 20, scope: !1792)
!1794 = !DILocation(line: 1436, column: 18, scope: !1792)
!1795 = !DILocation(line: 1437, column: 23, scope: !1792)
!1796 = !DILocation(line: 1437, column: 22, scope: !1792)
!1797 = !DILocation(line: 1437, column: 20, scope: !1792)
!1798 = !DILocation(line: 1438, column: 16, scope: !1792)
!1799 = !DILocation(line: 1438, column: 33, scope: !1792)
!1800 = !DILocation(line: 1438, column: 46, scope: !1792)
!1801 = !DILocation(line: 1438, column: 45, scope: !1792)
!1802 = !DILocation(line: 1438, column: 64, scope: !1792)
!1803 = !DILocation(line: 1438, column: 62, scope: !1792)
!1804 = !DILocation(line: 1438, column: 29, scope: !1792)
!1805 = !DILocation(line: 1438, column: 81, scope: !1792)
!1806 = !DILocation(line: 1438, column: 14, scope: !1792)
!1807 = !DILocation(line: 1439, column: 17, scope: !1792)
!1808 = !DILocation(line: 1439, column: 30, scope: !1792)
!1809 = !DILocation(line: 1439, column: 29, scope: !1792)
!1810 = !DILocation(line: 1439, column: 49, scope: !1792)
!1811 = !DILocation(line: 1439, column: 58, scope: !1792)
!1812 = !DILocation(line: 1439, column: 57, scope: !1792)
!1813 = !DILocation(line: 1439, column: 46, scope: !1792)
!1814 = !DILocation(line: 1439, column: 14, scope: !1792)
!1815 = !DILocation(line: 1440, column: 8, scope: !1816)
!1816 = distinct !DILexicalBlock(scope: !1792, file: !69, line: 1440, column: 8)
!1817 = !DILocation(line: 1440, column: 17, scope: !1816)
!1818 = !DILocation(line: 1440, column: 8, scope: !1792)
!1819 = !DILocation(line: 1442, column: 13, scope: !1820)
!1820 = distinct !DILexicalBlock(scope: !1816, file: !69, line: 1441, column: 5)
!1821 = !DILocation(line: 1442, column: 6, scope: !1820)
!1822 = !DILocation(line: 1446, column: 6, scope: !1823)
!1823 = distinct !DILexicalBlock(scope: !1816, file: !69, line: 1445, column: 5)
!1824 = !DILocation(line: 1452, column: 20, scope: !1825)
!1825 = distinct !DILexicalBlock(scope: !1780, file: !69, line: 1451, column: 3)
!1826 = !DILocation(line: 1452, column: 19, scope: !1825)
!1827 = !DILocation(line: 1452, column: 29, scope: !1825)
!1828 = !DILocation(line: 1452, column: 17, scope: !1825)
!1829 = !DILocation(line: 1453, column: 16, scope: !1825)
!1830 = !DILocation(line: 1453, column: 33, scope: !1825)
!1831 = !DILocation(line: 1453, column: 46, scope: !1825)
!1832 = !DILocation(line: 1453, column: 45, scope: !1825)
!1833 = !DILocation(line: 1453, column: 61, scope: !1825)
!1834 = !DILocation(line: 1453, column: 59, scope: !1825)
!1835 = !DILocation(line: 1453, column: 29, scope: !1825)
!1836 = !DILocation(line: 1453, column: 75, scope: !1825)
!1837 = !DILocation(line: 1453, column: 13, scope: !1825)
!1838 = !DILocation(line: 1454, column: 16, scope: !1825)
!1839 = !DILocation(line: 1454, column: 29, scope: !1825)
!1840 = !DILocation(line: 1454, column: 28, scope: !1825)
!1841 = !DILocation(line: 1454, column: 45, scope: !1825)
!1842 = !DILocation(line: 1454, column: 54, scope: !1825)
!1843 = !DILocation(line: 1454, column: 53, scope: !1825)
!1844 = !DILocation(line: 1454, column: 42, scope: !1825)
!1845 = !DILocation(line: 1454, column: 13, scope: !1825)
!1846 = !DILocation(line: 1455, column: 13, scope: !1825)
!1847 = !DILocation(line: 1455, column: 12, scope: !1825)
!1848 = !DILocation(line: 1455, column: 22, scope: !1825)
!1849 = !DILocation(line: 1455, column: 4, scope: !1825)
!1850 = !DILocation(line: 1460, column: 6, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1852, file: !69, line: 1460, column: 6)
!1852 = distinct !DILexicalBlock(scope: !1776, file: !69, line: 1459, column: 2)
!1853 = !DILocation(line: 1460, column: 18, scope: !1851)
!1854 = !DILocation(line: 1460, column: 6, scope: !1852)
!1855 = !DILocation(line: 1462, column: 7, scope: !1856)
!1856 = distinct !DILexicalBlock(scope: !1857, file: !69, line: 1462, column: 7)
!1857 = distinct !DILexicalBlock(scope: !1851, file: !69, line: 1461, column: 3)
!1858 = !DILocation(line: 1462, column: 19, scope: !1856)
!1859 = !DILocation(line: 1462, column: 7, scope: !1857)
!1860 = !DILocation(line: 1464, column: 5, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1856, file: !69, line: 1463, column: 4)
!1862 = !DILocation(line: 1468, column: 23, scope: !1863)
!1863 = distinct !DILexicalBlock(scope: !1856, file: !69, line: 1467, column: 4)
!1864 = !DILocation(line: 1468, column: 22, scope: !1863)
!1865 = !DILocation(line: 1468, column: 35, scope: !1863)
!1866 = !DILocation(line: 1468, column: 20, scope: !1863)
!1867 = !DILocation(line: 1469, column: 17, scope: !1863)
!1868 = !DILocation(line: 1469, column: 31, scope: !1863)
!1869 = !DILocation(line: 1469, column: 41, scope: !1863)
!1870 = !DILocation(line: 1469, column: 40, scope: !1863)
!1871 = !DILocation(line: 1469, column: 59, scope: !1863)
!1872 = !DILocation(line: 1469, column: 57, scope: !1863)
!1873 = !DILocation(line: 1469, column: 27, scope: !1863)
!1874 = !DILocation(line: 1469, column: 76, scope: !1863)
!1875 = !DILocation(line: 1469, column: 14, scope: !1863)
!1876 = !DILocation(line: 1470, column: 17, scope: !1863)
!1877 = !DILocation(line: 1470, column: 27, scope: !1863)
!1878 = !DILocation(line: 1470, column: 26, scope: !1863)
!1879 = !DILocation(line: 1470, column: 46, scope: !1863)
!1880 = !DILocation(line: 1470, column: 55, scope: !1863)
!1881 = !DILocation(line: 1470, column: 54, scope: !1863)
!1882 = !DILocation(line: 1470, column: 43, scope: !1863)
!1883 = !DILocation(line: 1470, column: 14, scope: !1863)
!1884 = !DILocation(line: 1471, column: 14, scope: !1863)
!1885 = !DILocation(line: 1471, column: 13, scope: !1863)
!1886 = !DILocation(line: 1471, column: 23, scope: !1863)
!1887 = !DILocation(line: 1471, column: 5, scope: !1863)
!1888 = !DILocation(line: 1476, column: 16, scope: !1889)
!1889 = distinct !DILexicalBlock(scope: !1851, file: !69, line: 1475, column: 3)
!1890 = !DILocation(line: 1476, column: 30, scope: !1889)
!1891 = !DILocation(line: 1476, column: 40, scope: !1889)
!1892 = !DILocation(line: 1476, column: 39, scope: !1889)
!1893 = !DILocation(line: 1476, column: 55, scope: !1889)
!1894 = !DILocation(line: 1476, column: 53, scope: !1889)
!1895 = !DILocation(line: 1476, column: 26, scope: !1889)
!1896 = !DILocation(line: 1476, column: 69, scope: !1889)
!1897 = !DILocation(line: 1476, column: 13, scope: !1889)
!1898 = !DILocation(line: 1477, column: 16, scope: !1889)
!1899 = !DILocation(line: 1477, column: 26, scope: !1889)
!1900 = !DILocation(line: 1477, column: 25, scope: !1889)
!1901 = !DILocation(line: 1477, column: 42, scope: !1889)
!1902 = !DILocation(line: 1477, column: 51, scope: !1889)
!1903 = !DILocation(line: 1477, column: 50, scope: !1889)
!1904 = !DILocation(line: 1477, column: 39, scope: !1889)
!1905 = !DILocation(line: 1477, column: 13, scope: !1889)
!1906 = !DILocation(line: 1478, column: 11, scope: !1889)
!1907 = !DILocation(line: 1478, column: 4, scope: !1889)
!1908 = !DILocation(line: 1481, column: 1, scope: !1754)
!1909 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1499, type: !1910, scopeLine: 1500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1910 = !DISubroutineType(types: !1911)
!1911 = !{!6, !16, !591}
!1912 = !DILocalVariable(name: "numerator", arg: 1, scope: !1909, file: !69, line: 1499, type: !16)
!1913 = !DILocation(line: 1499, column: 25, scope: !1909)
!1914 = !DILocalVariable(name: "denominator", arg: 2, scope: !1909, file: !69, line: 1499, type: !591)
!1915 = !DILocation(line: 1499, column: 40, scope: !1909)
!1916 = !DILocalVariable(name: "numerator_prime", scope: !1909, file: !69, line: 1502, type: !591)
!1917 = !DILocation(line: 1502, column: 6, scope: !1909)
!1918 = !DILocalVariable(name: "u32Temp1", scope: !1909, file: !69, line: 1502, type: !591)
!1919 = !DILocation(line: 1502, column: 27, scope: !1909)
!1920 = !DILocalVariable(name: "u32Temp2", scope: !1909, file: !69, line: 1502, type: !591)
!1921 = !DILocation(line: 1502, column: 41, scope: !1909)
!1922 = !DILocalVariable(name: "u32Temp3", scope: !1909, file: !69, line: 1502, type: !591)
!1923 = !DILocation(line: 1502, column: 55, scope: !1909)
!1924 = !DILocalVariable(name: "s32Temp1", scope: !1909, file: !69, line: 1503, type: !16)
!1925 = !DILocation(line: 1503, column: 6, scope: !1909)
!1926 = !DILocalVariable(name: "s32Temp2", scope: !1909, file: !69, line: 1503, type: !16)
!1927 = !DILocation(line: 1503, column: 20, scope: !1909)
!1928 = !DILocalVariable(name: "s32Temp3", scope: !1909, file: !69, line: 1503, type: !16)
!1929 = !DILocation(line: 1503, column: 34, scope: !1909)
!1930 = !DILocation(line: 1504, column: 5, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1909, file: !69, line: 1504, column: 5)
!1932 = !DILocation(line: 1504, column: 17, scope: !1931)
!1933 = !DILocation(line: 1504, column: 5, scope: !1909)
!1934 = !DILocation(line: 1506, column: 6, scope: !1935)
!1935 = distinct !DILexicalBlock(scope: !1936, file: !69, line: 1506, column: 6)
!1936 = distinct !DILexicalBlock(scope: !1931, file: !69, line: 1505, column: 2)
!1937 = !DILocation(line: 1506, column: 15, scope: !1935)
!1938 = !DILocation(line: 1506, column: 6, scope: !1936)
!1939 = !DILocation(line: 1508, column: 4, scope: !1940)
!1940 = distinct !DILexicalBlock(scope: !1935, file: !69, line: 1507, column: 3)
!1941 = !DILocation(line: 1512, column: 4, scope: !1942)
!1942 = distinct !DILexicalBlock(scope: !1935, file: !69, line: 1511, column: 3)
!1943 = !DILocation(line: 1517, column: 6, scope: !1944)
!1944 = distinct !DILexicalBlock(scope: !1945, file: !69, line: 1517, column: 6)
!1945 = distinct !DILexicalBlock(scope: !1931, file: !69, line: 1516, column: 2)
!1946 = !DILocation(line: 1517, column: 16, scope: !1944)
!1947 = !DILocation(line: 1517, column: 6, scope: !1945)
!1948 = !DILocation(line: 1519, column: 23, scope: !1949)
!1949 = distinct !DILexicalBlock(scope: !1944, file: !69, line: 1518, column: 3)
!1950 = !DILocation(line: 1519, column: 22, scope: !1949)
!1951 = !DILocation(line: 1519, column: 20, scope: !1949)
!1952 = !DILocation(line: 1520, column: 16, scope: !1949)
!1953 = !DILocation(line: 1520, column: 32, scope: !1949)
!1954 = !DILocation(line: 1520, column: 31, scope: !1949)
!1955 = !DILocation(line: 1520, column: 13, scope: !1949)
!1956 = !DILocation(line: 1521, column: 15, scope: !1949)
!1957 = !DILocation(line: 1521, column: 34, scope: !1949)
!1958 = !DILocation(line: 1521, column: 45, scope: !1949)
!1959 = !DILocation(line: 1521, column: 43, scope: !1949)
!1960 = !DILocation(line: 1521, column: 31, scope: !1949)
!1961 = !DILocation(line: 1521, column: 13, scope: !1949)
!1962 = !DILocation(line: 1523, column: 8, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1949, file: !69, line: 1523, column: 7)
!1964 = !DILocation(line: 1523, column: 20, scope: !1963)
!1965 = !DILocation(line: 1523, column: 27, scope: !1963)
!1966 = !DILocation(line: 1523, column: 7, scope: !1949)
!1967 = !DILocation(line: 1525, column: 19, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1963, file: !69, line: 1524, column: 4)
!1969 = !DILocation(line: 1525, column: 31, scope: !1968)
!1970 = !DILocation(line: 1525, column: 17, scope: !1968)
!1971 = !DILocation(line: 1526, column: 4, scope: !1968)
!1972 = !DILocation(line: 1529, column: 20, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1963, file: !69, line: 1528, column: 4)
!1974 = !DILocation(line: 1529, column: 32, scope: !1973)
!1975 = !DILocation(line: 1529, column: 38, scope: !1973)
!1976 = !DILocation(line: 1529, column: 17, scope: !1973)
!1977 = !DILocation(line: 1532, column: 7, scope: !1978)
!1978 = distinct !DILexicalBlock(scope: !1949, file: !69, line: 1532, column: 7)
!1979 = !DILocation(line: 1532, column: 18, scope: !1978)
!1980 = !DILocation(line: 1532, column: 16, scope: !1978)
!1981 = !DILocation(line: 1532, column: 7, scope: !1949)
!1982 = !DILocation(line: 1534, column: 18, scope: !1983)
!1983 = distinct !DILexicalBlock(scope: !1978, file: !69, line: 1533, column: 4)
!1984 = !DILocation(line: 1534, column: 16, scope: !1983)
!1985 = !DILocation(line: 1534, column: 28, scope: !1983)
!1986 = !DILocation(line: 1534, column: 14, scope: !1983)
!1987 = !DILocation(line: 1535, column: 4, scope: !1983)
!1988 = !DILocation(line: 1538, column: 18, scope: !1989)
!1989 = distinct !DILexicalBlock(scope: !1978, file: !69, line: 1537, column: 4)
!1990 = !DILocation(line: 1538, column: 26, scope: !1989)
!1991 = !DILocation(line: 1538, column: 16, scope: !1989)
!1992 = !DILocation(line: 1538, column: 30, scope: !1989)
!1993 = !DILocation(line: 1538, column: 14, scope: !1989)
!1994 = !DILocation(line: 1540, column: 8, scope: !1995)
!1995 = distinct !DILexicalBlock(scope: !1949, file: !69, line: 1540, column: 7)
!1996 = !DILocation(line: 1540, column: 18, scope: !1995)
!1997 = !DILocation(line: 1540, column: 7, scope: !1949)
!1998 = !DILocation(line: 1542, column: 18, scope: !1999)
!1999 = distinct !DILexicalBlock(scope: !1995, file: !69, line: 1541, column: 4)
!2000 = !DILocation(line: 1542, column: 12, scope: !1999)
!2001 = !DILocation(line: 1542, column: 5, scope: !1999)
!2002 = !DILocation(line: 1546, column: 5, scope: !2003)
!2003 = distinct !DILexicalBlock(scope: !1995, file: !69, line: 1545, column: 4)
!2004 = !DILocation(line: 1551, column: 16, scope: !2005)
!2005 = distinct !DILexicalBlock(scope: !1944, file: !69, line: 1550, column: 3)
!2006 = !DILocation(line: 1551, column: 26, scope: !2005)
!2007 = !DILocation(line: 1551, column: 25, scope: !2005)
!2008 = !DILocation(line: 1551, column: 41, scope: !2005)
!2009 = !DILocation(line: 1551, column: 39, scope: !2005)
!2010 = !DILocation(line: 1551, column: 13, scope: !2005)
!2011 = !DILocation(line: 1552, column: 16, scope: !2005)
!2012 = !DILocation(line: 1552, column: 30, scope: !2005)
!2013 = !DILocation(line: 1552, column: 40, scope: !2005)
!2014 = !DILocation(line: 1552, column: 39, scope: !2005)
!2015 = !DILocation(line: 1552, column: 55, scope: !2005)
!2016 = !DILocation(line: 1552, column: 53, scope: !2005)
!2017 = !DILocation(line: 1552, column: 26, scope: !2005)
!2018 = !DILocation(line: 1552, column: 68, scope: !2005)
!2019 = !DILocation(line: 1552, column: 13, scope: !2005)
!2020 = !DILocation(line: 1553, column: 16, scope: !2005)
!2021 = !DILocation(line: 1553, column: 25, scope: !2005)
!2022 = !DILocation(line: 1553, column: 24, scope: !2005)
!2023 = !DILocation(line: 1553, column: 41, scope: !2005)
!2024 = !DILocation(line: 1553, column: 51, scope: !2005)
!2025 = !DILocation(line: 1553, column: 50, scope: !2005)
!2026 = !DILocation(line: 1553, column: 38, scope: !2005)
!2027 = !DILocation(line: 1553, column: 13, scope: !2005)
!2028 = !DILocation(line: 1554, column: 7, scope: !2029)
!2029 = distinct !DILexicalBlock(scope: !2005, file: !69, line: 1554, column: 7)
!2030 = !DILocation(line: 1554, column: 16, scope: !2029)
!2031 = !DILocation(line: 1554, column: 7, scope: !2005)
!2032 = !DILocation(line: 1556, column: 17, scope: !2033)
!2033 = distinct !DILexicalBlock(scope: !2029, file: !69, line: 1555, column: 4)
!2034 = !DILocation(line: 1556, column: 12, scope: !2033)
!2035 = !DILocation(line: 1556, column: 5, scope: !2033)
!2036 = !DILocation(line: 1560, column: 5, scope: !2037)
!2037 = distinct !DILexicalBlock(scope: !2029, file: !69, line: 1559, column: 4)
!2038 = !DILocation(line: 1564, column: 1, scope: !1909)
!2039 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2040, file: !2040, line: 12, type: !2041, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2044)
!2040 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2041 = !DISubroutineType(types: !2042)
!2042 = !{null, !2043}
!2043 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2044 = !{!2045}
!2045 = !DILocalVariable(name: "z", arg: 1, scope: !2039, file: !2040, line: 12, type: !2043)
!2046 = !DILocation(line: 0, scope: !2039)
!2047 = !DILocation(line: 13, column: 9, scope: !2048)
!2048 = distinct !DILexicalBlock(scope: !2039, file: !2040, line: 13, column: 7)
!2049 = !DILocation(line: 13, column: 7, scope: !2039)
!2050 = !DILocation(line: 14, column: 5, scope: !2048)
!2051 = !DILocation(line: 15, column: 1, scope: !2039)
!2052 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2053, file: !2053, line: 20, type: !2054, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2057)
!2053 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2054 = !DISubroutineType(types: !2055)
!2055 = !{null, !2056, !2056}
!2056 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2057 = !{!2058, !2059}
!2058 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2052, file: !2053, line: 20, type: !2056)
!2059 = !DILocalVariable(name: "shift", arg: 2, scope: !2052, file: !2053, line: 20, type: !2056)
!2060 = !DILocation(line: 0, scope: !2052)
!2061 = !DILocation(line: 21, column: 13, scope: !2062)
!2062 = distinct !DILexicalBlock(scope: !2052, file: !2053, line: 21, column: 7)
!2063 = !DILocation(line: 21, column: 7, scope: !2052)
!2064 = !DILocation(line: 27, column: 5, scope: !2065)
!2065 = distinct !DILexicalBlock(scope: !2062, file: !2053, line: 21, column: 26)
!2066 = !DILocation(line: 29, column: 1, scope: !2052)
