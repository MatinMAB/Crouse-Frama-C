; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0037/build/s16_div_s32_s16_alarm_0037.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [84 x i8] c"KLEE-ALARM-0037: signed overflow. assert s32Temp1 / (s32)denominator <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0037.err\00", align 1
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
  br i1 %cmp92, label %if.then94, label %if.else105, !dbg !359

if.then94:                                        ; preds = %if.else90
  %40 = load i32, i32* %s32Temp1, align 4, !dbg !360
  %conv95 = sext i32 %40 to i64, !dbg !363
  %41 = load i16, i16* %denominator.addr, align 2, !dbg !364
  %conv96 = sext i16 %41 to i32, !dbg !365
  %conv97 = sext i32 %conv96 to i64, !dbg !366
  %call98 = call i32 @klee_alarm_s32_div_representable(i64 %conv95, i64 %conv97), !dbg !367
  %tobool99 = icmp ne i32 %call98, 0, !dbg !367
  br i1 %tobool99, label %if.end101, label %if.then100, !dbg !368

if.then100:                                       ; preds = %if.then94
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 337, i8* getelementptr inbounds ([84 x i8], [84 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !369
  unreachable, !dbg !369

if.end101:                                        ; preds = %if.then94
  %42 = load i32, i32* %s32Temp1, align 4, !dbg !371
  %43 = load i16, i16* %denominator.addr, align 2, !dbg !372
  %conv102 = sext i16 %43 to i32, !dbg !373
  %int_cast_to_i649 = zext i32 %conv102 to i64, !dbg !374
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !374
  %div103 = sdiv i32 %42, %conv102, !dbg !374, !klee.check.div !106
  %conv104 = sext i32 %div103 to i64, !dbg !375
  store volatile i64 %conv104, i64* @klee_alarm_sink_s64, align 8, !dbg !376
  store i16 0, i16* %retval, align 2, !dbg !377
  br label %return, !dbg !377

if.else105:                                       ; preds = %if.else90
  store i16 32767, i16* %retval, align 2, !dbg !378
  br label %return, !dbg !378

return:                                           ; preds = %if.else105, %if.end101, %if.else89, %if.else88, %if.then86, %if.then77, %if.then69, %if.then61, %if.then54, %if.then44, %if.then35, %if.then26, %if.then16, %if.then10, %if.else, %if.then4
  %44 = load i16, i16* %retval, align 2, !dbg !380
  ret i16 %44, !dbg !380
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !381 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !384, metadata !DIExpression()), !dbg !385
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !386
  %cmp = icmp ne i64 %0, 0, !dbg !387
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

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !395 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !398, metadata !DIExpression()), !dbg !399
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !400, metadata !DIExpression()), !dbg !401
  %0 = load i32, i32* %count.addr, align 4, !dbg !402
  %cmp = icmp uge i32 %0, 63, !dbg !404
  br i1 %cmp, label %if.then, label %if.end, !dbg !405

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !406
  br label %return, !dbg !406

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !408
  %2 = load i32, i32* %count.addr, align 4, !dbg !409
  %sh_prom = zext i32 %2 to i64, !dbg !410
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !410
  %shl = shl i64 1, %sh_prom, !dbg !410, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !411
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !412
  %conv = zext i1 %cmp1 to i32, !dbg !412
  store i32 %conv, i32* %retval, align 4, !dbg !413
  br label %return, !dbg !413

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !414
  ret i32 %3, !dbg !414
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !415 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !418, metadata !DIExpression()), !dbg !419
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !420, metadata !DIExpression()), !dbg !421
  %0 = load i64, i64* %left.addr, align 8, !dbg !422
  %1 = load i64, i64* %right.addr, align 8, !dbg !423
  %mul = mul nsw i64 %0, %1, !dbg !424
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !425
  %conv = zext i1 %cmp to i32, !dbg !425
  ret i32 %conv, !dbg !426
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !427 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !428, metadata !DIExpression()), !dbg !429
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !430, metadata !DIExpression()), !dbg !431
  %0 = load i64, i64* %left.addr, align 8, !dbg !432
  %1 = load i64, i64* %right.addr, align 8, !dbg !433
  %mul = mul nsw i64 %0, %1, !dbg !434
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !435
  %conv = zext i1 %cmp to i32, !dbg !435
  ret i32 %conv, !dbg !436
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_lower(i64 %left, i64 %right) #0 !dbg !437 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !438, metadata !DIExpression()), !dbg !439
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !440, metadata !DIExpression()), !dbg !441
  %0 = load i64, i64* %left.addr, align 8, !dbg !442
  %1 = load i64, i64* %right.addr, align 8, !dbg !443
  %add = add nsw i64 %0, %1, !dbg !444
  %cmp = icmp sge i64 %add, -2147483648, !dbg !445
  %conv = zext i1 %cmp to i32, !dbg !445
  ret i32 %conv, !dbg !446
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !447 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !448, metadata !DIExpression()), !dbg !449
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !450, metadata !DIExpression()), !dbg !451
  %0 = load i64, i64* %left.addr, align 8, !dbg !452
  %1 = load i64, i64* %right.addr, align 8, !dbg !453
  %add = add nsw i64 %0, %1, !dbg !454
  %cmp = icmp sle i64 %add, 2147483647, !dbg !455
  %conv = zext i1 %cmp to i32, !dbg !455
  ret i32 %conv, !dbg !456
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_div_representable(i64 %numerator, i64 %denominator) #0 !dbg !457 {
entry:
  %numerator.addr = alloca i64, align 8
  %denominator.addr = alloca i64, align 8
  store i64 %numerator, i64* %numerator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %numerator.addr, metadata !458, metadata !DIExpression()), !dbg !459
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !460, metadata !DIExpression()), !dbg !461
  %0 = load i64, i64* %numerator.addr, align 8, !dbg !462
  %cmp = icmp eq i64 %0, -2147483648, !dbg !463
  %1 = load i64, i64* %denominator.addr, align 8, !dbg !464
  %cmp1 = icmp eq i64 %1, -1, !dbg !464
  %2 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !464
  %lnot = xor i1 %2, true, !dbg !465
  %lnot.ext = zext i1 %lnot to i32, !dbg !465
  ret i32 %lnot.ext, !dbg !466
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !467 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !470, metadata !DIExpression()), !dbg !471
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !472, metadata !DIExpression()), !dbg !473
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !474, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !476, metadata !DIExpression()), !dbg !477
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !478, metadata !DIExpression()), !dbg !479
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !480
  %conv = zext i16 %0 to i32, !dbg !480
  %and = and i32 %conv, 65535, !dbg !481
  %conv1 = trunc i32 %and to i16, !dbg !480
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !482
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !483
  %conv2 = sext i16 %1 to i32, !dbg !483
  %shl = shl i32 %conv2, 16, !dbg !484
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !485
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !486
  %conv3 = zext i16 %2 to i32, !dbg !486
  %cmp = icmp eq i32 %conv3, 0, !dbg !488
  br i1 %cmp, label %if.then, label %if.else9, !dbg !489

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !490
  %conv5 = sext i16 %3 to i32, !dbg !490
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !493
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !494

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !495
  br label %return, !dbg !495

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !497
  br label %return, !dbg !497

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !499
  %conv10 = sext i16 %4 to i32, !dbg !499
  %shl11 = shl i32 %conv10, 16, !dbg !501
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !502
  %conv12 = sext i16 %5 to i32, !dbg !502
  %shl13 = shl i32 %conv12, 16, !dbg !503
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !504
  %conv14 = zext i16 %6 to i32, !dbg !504
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !505
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !505
  %div = sdiv i32 %shl13, %conv14, !dbg !505, !klee.check.div !106
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !506
  %conv15 = zext i16 %7 to i32, !dbg !506
  %mul = mul nsw i32 %div, %conv15, !dbg !507
  %sub = sub nsw i32 %shl11, %mul, !dbg !508
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !509
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !510
  %shl16 = shl i32 %8, 1, !dbg !511
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !512
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !513
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !514
  %conv17 = zext i16 %10 to i32, !dbg !514
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !515
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !515
  %div18 = sdiv i32 %9, %conv17, !dbg !515, !klee.check.div !106
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !516
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !517
  %conv19 = sext i16 %11 to i32, !dbg !517
  %shl20 = shl i32 %conv19, 16, !dbg !518
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !519
  %conv21 = zext i16 %12 to i32, !dbg !519
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !520
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !520
  %div22 = sdiv i32 %shl20, %conv21, !dbg !520, !klee.check.div !106
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !521
  %add = add nsw i32 %div22, %13, !dbg !522
  store i32 %add, i32* %s32Temp1, align 4, !dbg !523
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !524
  %cmp23 = icmp slt i32 %14, 32767, !dbg !526
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !527

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !528
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !531
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !532

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !533
  %conv29 = trunc i32 %16 to i16, !dbg !535
  store i16 %conv29, i16* %retval, align 2, !dbg !536
  br label %return, !dbg !536

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !537
  br label %return, !dbg !537

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !539
  br label %return, !dbg !539

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !541
  ret i16 %17, !dbg !541
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !542 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !543, metadata !DIExpression()), !dbg !544
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !545, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !547, metadata !DIExpression()), !dbg !548
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !549, metadata !DIExpression()), !dbg !550
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !551
  %conv = zext i16 %0 to i32, !dbg !551
  %and = and i32 %conv, 65535, !dbg !552
  %conv1 = trunc i32 %and to i16, !dbg !551
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !553
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !554
  %conv2 = zext i16 %1 to i32, !dbg !554
  %cmp = icmp eq i32 %conv2, 0, !dbg !556
  br i1 %cmp, label %if.then, label %if.else8, !dbg !557

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !558
  %conv4 = sext i16 %2 to i32, !dbg !558
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !561
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !562

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !563
  br label %return, !dbg !563

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !565
  br label %return, !dbg !565

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !567
  %conv9 = sext i16 %3 to i32, !dbg !567
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !569
  %conv10 = sext i16 %4 to i32, !dbg !569
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !570
  %conv11 = zext i16 %5 to i32, !dbg !570
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !571
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !571
  %div = sdiv i32 %conv10, %conv11, !dbg !571, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !572
  %conv12 = zext i16 %6 to i32, !dbg !572
  %mul = mul nsw i32 %div, %conv12, !dbg !573
  %sub = sub nsw i32 %conv9, %mul, !dbg !574
  %shl = shl i32 %sub, 1, !dbg !575
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !576
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !577
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !578
  %conv13 = zext i16 %8 to i32, !dbg !578
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !579
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !579
  %div14 = sdiv i32 %7, %conv13, !dbg !579, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !580
  %conv15 = sext i16 %9 to i32, !dbg !580
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !581
  %conv16 = zext i16 %10 to i32, !dbg !581
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !582
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !582
  %div17 = sdiv i32 %conv15, %conv16, !dbg !582, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !583
  store i32 %add, i32* %s32Temp1, align 4, !dbg !584
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !585
  %conv18 = trunc i32 %11 to i16, !dbg !585
  store i16 %conv18, i16* %retval, align 2, !dbg !586
  br label %return, !dbg !586

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !587
  ret i16 %12, !dbg !587
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !588 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !591, metadata !DIExpression()), !dbg !592
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !593, metadata !DIExpression()), !dbg !594
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !595, metadata !DIExpression()), !dbg !597
  store i32 0, i32* %u32Temp1, align 4, !dbg !597
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !598, metadata !DIExpression()), !dbg !599
  store i32 0, i32* %u32Temp2, align 4, !dbg !599
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !600, metadata !DIExpression()), !dbg !601
  store i32 0, i32* %u32Temp3, align 4, !dbg !601
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !602
  %conv = zext i16 %0 to i32, !dbg !602
  %cmp = icmp eq i32 %conv, 0, !dbg !604
  br i1 %cmp, label %if.then, label %if.else, !dbg !605

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !606
  br label %return, !dbg !606

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !608
  %conv2 = zext i16 %1 to i32, !dbg !608
  %shl = shl i32 %conv2, 16, !dbg !610
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !611
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !612
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !613
  %conv3 = zext i16 %3 to i32, !dbg !613
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !614
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !614
  %div = udiv i32 %2, %conv3, !dbg !614, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !615
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !616
  %add = add i32 %4, 128, !dbg !617
  %shr = lshr i32 %add, 8, !dbg !618
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !619
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !620
  %cmp4 = icmp ult i32 %5, 255, !dbg !622
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !623

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !624
  %conv7 = trunc i32 %6 to i8, !dbg !626
  store i8 %conv7, i8* %retval, align 1, !dbg !627
  br label %return, !dbg !627

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !628
  br label %return, !dbg !628

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !630
  ret i8 %7, !dbg !630
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !631 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !634, metadata !DIExpression()), !dbg !635
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !636, metadata !DIExpression()), !dbg !637
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !638, metadata !DIExpression()), !dbg !639
  store i32 0, i32* %s32Temp1, align 4, !dbg !639
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !640
  %conv = zext i16 %0 to i32, !dbg !640
  %and = and i32 %conv, 65535, !dbg !641
  %conv1 = trunc i32 %and to i16, !dbg !640
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !642
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !643
  %conv2 = zext i16 %1 to i32, !dbg !643
  %and3 = and i32 %conv2, 65535, !dbg !645
  %cmp = icmp eq i32 %and3, 0, !dbg !646
  br i1 %cmp, label %if.then, label %if.else8, !dbg !647

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !648
  %cmp5 = icmp sge i32 %2, 0, !dbg !651
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !652

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !653
  br label %return, !dbg !653

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !655
  br label %return, !dbg !655

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !657
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !659
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !660
  %conv9 = zext i16 %5 to i32, !dbg !660
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !661
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !661
  %div = sdiv i32 %4, %conv9, !dbg !661, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !662
  %conv10 = zext i16 %6 to i32, !dbg !662
  %mul = mul nsw i32 %div, %conv10, !dbg !663
  %sub = sub nsw i32 %3, %mul, !dbg !664
  %shl = shl i32 %sub, 1, !dbg !665
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !666
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !667
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !668
  %conv11 = zext i16 %8 to i32, !dbg !668
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !669
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !669
  %div12 = sdiv i32 %7, %conv11, !dbg !669, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !670
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !671
  %conv13 = zext i16 %10 to i32, !dbg !671
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !672
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !672
  %div14 = sdiv i32 %9, %conv13, !dbg !672, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !673
  store i32 %add, i32* %s32Temp1, align 4, !dbg !674
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !675
  %cmp15 = icmp slt i32 %11, 65535, !dbg !677
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !678

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !679
  %cmp18 = icmp sgt i32 %12, 0, !dbg !682
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !683

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !684
  %conv21 = trunc i32 %13 to i16, !dbg !686
  store i16 %conv21, i16* %retval, align 2, !dbg !687
  br label %return, !dbg !687

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !688
  br label %return, !dbg !688

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !690
  br label %return, !dbg !690

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !692
  ret i16 %14, !dbg !692
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !693 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !696, metadata !DIExpression()), !dbg !697
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !698, metadata !DIExpression()), !dbg !699
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !700, metadata !DIExpression()), !dbg !701
  store i32 0, i32* %u32Temp, align 4, !dbg !701
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !702
  %conv = zext i16 %0 to i32, !dbg !702
  %cmp = icmp eq i32 %conv, 0, !dbg !704
  br i1 %cmp, label %if.then, label %if.else, !dbg !705

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !706
  br label %return, !dbg !706

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !708
  %conv2 = zext i16 %1 to i32, !dbg !708
  %shl = shl i32 %conv2, 16, !dbg !710
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !711
  %conv3 = zext i16 %2 to i32, !dbg !711
  %shr = ashr i32 %conv3, 1, !dbg !712
  %add = add nsw i32 %shl, %shr, !dbg !713
  store i32 %add, i32* %u32Temp, align 4, !dbg !714
  %3 = load i32, i32* %u32Temp, align 4, !dbg !715
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !716
  %conv4 = zext i16 %4 to i32, !dbg !716
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !717
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !717
  %div = udiv i32 %3, %conv4, !dbg !717, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !718
  %5 = load i32, i32* %u32Temp, align 4, !dbg !719
  %cmp5 = icmp ult i32 %5, 65535, !dbg !721
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !722

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !723
  %and = and i32 %6, 65535, !dbg !725
  %conv8 = trunc i32 %and to i16, !dbg !723
  store i16 %conv8, i16* %retval, align 2, !dbg !726
  br label %return, !dbg !726

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !727
  br label %return, !dbg !727

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !729
  ret i16 %7, !dbg !729
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !730 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !733, metadata !DIExpression()), !dbg !734
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !735, metadata !DIExpression()), !dbg !736
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !737, metadata !DIExpression()), !dbg !738
  store i32 0, i32* %u32Temp1, align 4, !dbg !738
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !739, metadata !DIExpression()), !dbg !740
  store i32 0, i32* %u32Temp2, align 4, !dbg !740
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !741
  %conv = zext i16 %0 to i32, !dbg !741
  %and = and i32 %conv, 65535, !dbg !742
  %conv1 = trunc i32 %and to i16, !dbg !741
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !743
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !744
  %conv2 = zext i16 %1 to i32, !dbg !744
  %cmp = icmp eq i32 %conv2, 0, !dbg !746
  br i1 %cmp, label %if.then, label %if.else, !dbg !747

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !748
  br label %return, !dbg !748

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !750
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !752
  %conv4 = zext i16 %3 to i32, !dbg !752
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !753
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !753
  %div = udiv i32 %2, %conv4, !dbg !753, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !754
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !755
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !756
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !757
  %conv5 = zext i16 %6 to i32, !dbg !757
  %mul = mul i32 %5, %conv5, !dbg !758
  %sub = sub i32 %4, %mul, !dbg !759
  %shl = shl i32 %sub, 1, !dbg !760
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !761
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !762
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !763
  %conv6 = zext i16 %8 to i32, !dbg !763
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !764
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !764
  %div7 = udiv i32 %7, %conv6, !dbg !764, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !765
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !766
  %conv8 = zext i16 %10 to i32, !dbg !766
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !767
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !767
  %div9 = udiv i32 %9, %conv8, !dbg !767, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !768
  store i32 %add, i32* %u32Temp2, align 4, !dbg !769
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !770
  %cmp10 = icmp ult i32 %11, 65535, !dbg !772
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !773

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !774
  %and13 = and i32 %12, 65535, !dbg !776
  %conv14 = trunc i32 %and13 to i16, !dbg !774
  store i16 %conv14, i16* %retval, align 2, !dbg !777
  br label %return, !dbg !777

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !778
  br label %return, !dbg !778

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !780
  ret i16 %13, !dbg !780
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !781 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !784, metadata !DIExpression()), !dbg !785
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !786, metadata !DIExpression()), !dbg !787
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !788, metadata !DIExpression()), !dbg !789
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !790, metadata !DIExpression()), !dbg !791
  store i32 0, i32* %s32Result, align 4, !dbg !791
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !792, metadata !DIExpression()), !dbg !793
  store i32 0, i32* %s32Temp1, align 4, !dbg !793
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !794
  %conv = sext i16 %0 to i32, !dbg !794
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !795
  %conv1 = zext i16 %1 to i32, !dbg !795
  %mul = mul nsw i32 %conv, %conv1, !dbg !796
  store i32 %mul, i32* %s32Result, align 4, !dbg !797
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !798
  %conv2 = sext i16 %2 to i32, !dbg !798
  %cmp = icmp eq i32 %conv2, 0, !dbg !800
  br i1 %cmp, label %if.then, label %if.else7, !dbg !801

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !802
  %cmp4 = icmp slt i32 %3, 0, !dbg !805
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !806

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !807
  br label %return, !dbg !807

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !809
  br label %return, !dbg !809

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !811
  %5 = load i32, i32* %s32Result, align 4, !dbg !813
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !814
  %conv8 = sext i16 %6 to i32, !dbg !814
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !815
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !815
  %div = sdiv i32 %5, %conv8, !dbg !815, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !816
  %conv9 = sext i16 %7 to i32, !dbg !816
  %mul10 = mul nsw i32 %div, %conv9, !dbg !817
  %sub = sub nsw i32 %4, %mul10, !dbg !818
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !819
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !820
  %shl = shl i32 %8, 1, !dbg !821
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !822
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !823
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !824
  %conv11 = sext i16 %10 to i32, !dbg !824
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !825
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !825
  %div12 = sdiv i32 %9, %conv11, !dbg !825, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !826
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !827
  %conv13 = sext i16 %12 to i32, !dbg !827
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !828
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !828
  %div14 = sdiv i32 %11, %conv13, !dbg !828, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !829
  store i32 %add, i32* %s32Result, align 4, !dbg !830
  %13 = load i32, i32* %s32Result, align 4, !dbg !831
  %cmp15 = icmp slt i32 %13, 32767, !dbg !833
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !834

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !835
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !838
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !839

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !840
  %conv21 = trunc i32 %15 to i16, !dbg !842
  store i16 %conv21, i16* %retval, align 2, !dbg !843
  br label %return, !dbg !843

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !844
  br label %return, !dbg !844

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !846
  br label %return, !dbg !846

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !848
  ret i16 %16, !dbg !848
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !849 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !852, metadata !DIExpression()), !dbg !853
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !854, metadata !DIExpression()), !dbg !855
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !856, metadata !DIExpression()), !dbg !857
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !858, metadata !DIExpression()), !dbg !859
  store i32 0, i32* %s32Result, align 4, !dbg !859
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !860, metadata !DIExpression()), !dbg !861
  store i32 0, i32* %s32Temp1, align 4, !dbg !861
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !862
  %conv = zext i16 %0 to i32, !dbg !862
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !863
  %conv1 = sext i16 %1 to i32, !dbg !863
  %mul = mul nsw i32 %conv, %conv1, !dbg !864
  store i32 %mul, i32* %s32Result, align 4, !dbg !865
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !866
  %conv2 = zext i16 %2 to i32, !dbg !866
  %cmp = icmp eq i32 %conv2, 0, !dbg !868
  br i1 %cmp, label %if.then, label %if.else7, !dbg !869

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !870
  %cmp4 = icmp slt i32 %3, 0, !dbg !873
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !874

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !875
  br label %return, !dbg !875

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !877
  br label %return, !dbg !877

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !879
  %5 = load i32, i32* %s32Result, align 4, !dbg !881
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !882
  %conv8 = zext i16 %6 to i32, !dbg !882
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !883
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !883
  %div = sdiv i32 %5, %conv8, !dbg !883, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !884
  %conv9 = zext i16 %7 to i32, !dbg !884
  %mul10 = mul nsw i32 %div, %conv9, !dbg !885
  %sub = sub nsw i32 %4, %mul10, !dbg !886
  %shl = shl i32 %sub, 1, !dbg !887
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !888
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !889
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !890
  %conv11 = zext i16 %9 to i32, !dbg !890
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !891
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !891
  %div12 = sdiv i32 %8, %conv11, !dbg !891, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !892
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !893
  %conv13 = zext i16 %11 to i32, !dbg !893
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !894
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !894
  %div14 = sdiv i32 %10, %conv13, !dbg !894, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !895
  store i32 %add, i32* %s32Result, align 4, !dbg !896
  %12 = load i32, i32* %s32Result, align 4, !dbg !897
  %cmp15 = icmp slt i32 %12, 32767, !dbg !899
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !900

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !901
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !904
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !905

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !906
  %conv21 = trunc i32 %14 to i16, !dbg !908
  store i16 %conv21, i16* %retval, align 2, !dbg !909
  br label %return, !dbg !909

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !910
  br label %return, !dbg !910

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !912
  br label %return, !dbg !912

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !914
  ret i16 %15, !dbg !914
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !915 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !918, metadata !DIExpression()), !dbg !919
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !920, metadata !DIExpression()), !dbg !921
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !922, metadata !DIExpression()), !dbg !923
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !924, metadata !DIExpression()), !dbg !925
  store i32 0, i32* %u32Result, align 4, !dbg !925
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !926, metadata !DIExpression()), !dbg !927
  store i32 0, i32* %u32Temp1, align 4, !dbg !927
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !928, metadata !DIExpression()), !dbg !929
  store i32 0, i32* %s32Result, align 4, !dbg !929
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !930, metadata !DIExpression()), !dbg !931
  store i32 0, i32* %s32Temp1, align 4, !dbg !931
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !932
  %conv = sext i16 %0 to i32, !dbg !932
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !933
  %conv1 = zext i16 %1 to i32, !dbg !933
  %mul = mul nsw i32 %conv, %conv1, !dbg !934
  store i32 %mul, i32* %s32Result, align 4, !dbg !935
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !936
  %conv2 = sext i16 %2 to i32, !dbg !936
  %cmp = icmp eq i32 %conv2, 0, !dbg !938
  br i1 %cmp, label %if.then, label %if.else7, !dbg !939

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !940
  %cmp4 = icmp sge i32 %3, 0, !dbg !943
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !944

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !945
  br label %return, !dbg !945

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !947
  br label %return, !dbg !947

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !949
  %5 = load i32, i32* %s32Result, align 4, !dbg !951
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !952
  %conv8 = sext i16 %6 to i32, !dbg !952
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !953
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !953
  %div = sdiv i32 %5, %conv8, !dbg !953, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !954
  %conv9 = sext i16 %7 to i32, !dbg !954
  %mul10 = mul nsw i32 %div, %conv9, !dbg !955
  %sub = sub nsw i32 %4, %mul10, !dbg !956
  %shl = shl i32 %sub, 1, !dbg !957
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !958
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !959
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !960
  %conv11 = sext i16 %9 to i32, !dbg !960
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !961
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !961
  %div12 = sdiv i32 %8, %conv11, !dbg !961, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !962
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !963
  %conv13 = sext i16 %11 to i32, !dbg !963
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !964
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !964
  %div14 = sdiv i32 %10, %conv13, !dbg !964, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !965
  store i32 %add, i32* %s32Result, align 4, !dbg !966
  %12 = load i32, i32* %s32Result, align 4, !dbg !967
  %cmp15 = icmp slt i32 %12, 65535, !dbg !969
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !970

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !971
  %cmp18 = icmp sgt i32 %13, 0, !dbg !974
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !975

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !976
  %conv21 = trunc i32 %14 to i16, !dbg !978
  store i16 %conv21, i16* %retval, align 2, !dbg !979
  br label %return, !dbg !979

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !980
  br label %return, !dbg !980

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !982
  br label %return, !dbg !982

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !984
  ret i16 %15, !dbg !984
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !985 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !988, metadata !DIExpression()), !dbg !989
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !990, metadata !DIExpression()), !dbg !991
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !992, metadata !DIExpression()), !dbg !993
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !994, metadata !DIExpression()), !dbg !995
  store i32 0, i32* %s32Result, align 4, !dbg !995
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !996, metadata !DIExpression()), !dbg !997
  store i32 0, i32* %s32Temp1, align 4, !dbg !997
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !998
  %conv = sext i16 %0 to i32, !dbg !998
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !999
  %conv1 = zext i16 %1 to i32, !dbg !999
  %mul = mul nsw i32 %conv, %conv1, !dbg !1000
  store i32 %mul, i32* %s32Result, align 4, !dbg !1001
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1002
  %conv2 = zext i16 %2 to i32, !dbg !1002
  %cmp = icmp eq i32 %conv2, 0, !dbg !1004
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1005

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1006
  %cmp4 = icmp sge i32 %3, 0, !dbg !1009
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1010

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !1011
  br label %return, !dbg !1011

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1013
  br label %return, !dbg !1013

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1015
  %5 = load i32, i32* %s32Result, align 4, !dbg !1017
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1018
  %conv8 = zext i16 %6 to i32, !dbg !1018
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1019
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1019
  %div = sdiv i32 %5, %conv8, !dbg !1019, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1020
  %conv9 = zext i16 %7 to i32, !dbg !1020
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1021
  %sub = sub nsw i32 %4, %mul10, !dbg !1022
  %shl = shl i32 %sub, 1, !dbg !1023
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1024
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1025
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1026
  %conv11 = zext i16 %9 to i32, !dbg !1026
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1027
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1027
  %div12 = sdiv i32 %8, %conv11, !dbg !1027, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1028
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1029
  %conv13 = zext i16 %11 to i32, !dbg !1029
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1030
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1030
  %div14 = sdiv i32 %10, %conv13, !dbg !1030, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1031
  store i32 %add, i32* %s32Result, align 4, !dbg !1032
  %12 = load i32, i32* %s32Result, align 4, !dbg !1033
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1035
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1036

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1037
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1040
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1041

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1042
  %conv21 = trunc i32 %14 to i16, !dbg !1044
  store i16 %conv21, i16* %retval, align 2, !dbg !1045
  br label %return, !dbg !1045

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1046
  br label %return, !dbg !1046

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1048
  br label %return, !dbg !1048

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1050
  ret i16 %15, !dbg !1050
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1051 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1054, metadata !DIExpression()), !dbg !1055
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1056, metadata !DIExpression()), !dbg !1057
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1058, metadata !DIExpression()), !dbg !1059
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1060, metadata !DIExpression()), !dbg !1061
  store i32 0, i32* %u32Temp1, align 4, !dbg !1061
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1062, metadata !DIExpression()), !dbg !1063
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1063
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1064
  %conv = zext i16 %0 to i32, !dbg !1064
  %cmp = icmp eq i32 %conv, 0, !dbg !1066
  br i1 %cmp, label %if.then, label %if.else, !dbg !1067

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1068
  br label %return, !dbg !1068

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1070
  %conv2 = zext i16 %1 to i32, !dbg !1070
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1072
  %conv3 = zext i16 %2 to i32, !dbg !1072
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1073
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1074
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1075
  %conv4 = zext i16 %3 to i32, !dbg !1075
  %shr = ashr i32 %conv4, 1, !dbg !1076
  %conv5 = trunc i32 %shr to i16, !dbg !1075
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1077
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1078
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1079
  %conv6 = zext i16 %5 to i32, !dbg !1079
  %add = add i32 %4, %conv6, !dbg !1080
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1081
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1082
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1083
  %conv7 = zext i16 %7 to i32, !dbg !1083
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1084
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1084
  %div = udiv i32 %6, %conv7, !dbg !1084, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1085
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1086
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1088
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1089

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1090
  %and = and i32 %9, 65535, !dbg !1092
  %conv11 = trunc i32 %and to i16, !dbg !1093
  store i16 %conv11, i16* %retval, align 2, !dbg !1094
  br label %return, !dbg !1094

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1095
  br label %return, !dbg !1095

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1097
  ret i16 %10, !dbg !1097
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1098 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1101, metadata !DIExpression()), !dbg !1102
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1103, metadata !DIExpression()), !dbg !1104
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1105, metadata !DIExpression()), !dbg !1106
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1107, metadata !DIExpression()), !dbg !1108
  store i32 0, i32* %u32Temp1, align 4, !dbg !1108
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1109
  %cmp = icmp eq i32 %0, 0, !dbg !1111
  br i1 %cmp, label %if.then, label %if.else, !dbg !1112

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1113
  br label %return, !dbg !1113

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1115
  %conv = zext i16 %1 to i32, !dbg !1115
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1117
  %conv1 = zext i16 %2 to i32, !dbg !1117
  %mul = mul nsw i32 %conv, %conv1, !dbg !1118
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1119
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1120
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1120
  %div = udiv i32 %mul, %3, !dbg !1120, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1121
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1122
  %conv2 = zext i16 %4 to i32, !dbg !1122
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1124
  %conv3 = zext i16 %5 to i32, !dbg !1124
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1125
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1126
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1127
  %mul5 = mul i32 %6, %7, !dbg !1128
  %sub = sub i32 %mul4, %mul5, !dbg !1129
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1130
  %div6 = udiv i32 %8, 2, !dbg !1131
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1132
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1133

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1134
  %inc = add i32 %9, 1, !dbg !1134
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1134
  br label %if.end, !dbg !1136

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1137
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1139
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1140

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1141
  %and = and i32 %11, 65535, !dbg !1143
  %conv13 = trunc i32 %and to i16, !dbg !1144
  store i16 %conv13, i16* %retval, align 2, !dbg !1145
  br label %return, !dbg !1145

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1146
  br label %return, !dbg !1146

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1148
  ret i16 %12, !dbg !1148
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1149 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1152, metadata !DIExpression()), !dbg !1153
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1154, metadata !DIExpression()), !dbg !1155
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1156, metadata !DIExpression()), !dbg !1157
  store i32 0, i32* %u32Temp1, align 4, !dbg !1157
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1158
  %conv = zext i16 %0 to i32, !dbg !1158
  %cmp = icmp eq i32 %conv, 0, !dbg !1160
  br i1 %cmp, label %if.then, label %if.else, !dbg !1161

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1162
  br label %return, !dbg !1162

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1164
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1166
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1167
  %conv2 = zext i16 %3 to i32, !dbg !1167
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1168
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1168
  %div = udiv i32 %2, %conv2, !dbg !1168, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1169
  %conv3 = zext i16 %4 to i32, !dbg !1169
  %mul = mul i32 %div, %conv3, !dbg !1170
  %sub = sub i32 %1, %mul, !dbg !1171
  %shl = shl i32 %sub, 1, !dbg !1172
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1173
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1174
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1175
  %conv4 = zext i16 %6 to i32, !dbg !1175
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1176
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1176
  %div5 = udiv i32 %5, %conv4, !dbg !1176, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1177
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1178
  %conv6 = zext i16 %8 to i32, !dbg !1178
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1179
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1179
  %div7 = udiv i32 %7, %conv6, !dbg !1179, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1180
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1181
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1182
  store i32 %9, i32* %retval, align 4, !dbg !1183
  br label %return, !dbg !1183

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1184
  ret i32 %10, !dbg !1184
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1185 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1188, metadata !DIExpression()), !dbg !1189
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1190, metadata !DIExpression()), !dbg !1191
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1192, metadata !DIExpression()), !dbg !1193
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1194, metadata !DIExpression()), !dbg !1195
  store i32 0, i32* %s32Temp1, align 4, !dbg !1195
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1196, metadata !DIExpression()), !dbg !1197
  store i32 0, i32* %s32Temp2, align 4, !dbg !1197
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1198, metadata !DIExpression()), !dbg !1199
  store i32 0, i32* %s32Temp3, align 4, !dbg !1199
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1200
  %conv = sext i16 %0 to i32, !dbg !1200
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1201
  %conv1 = sext i16 %1 to i32, !dbg !1201
  %mul = mul nsw i32 %conv, %conv1, !dbg !1202
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1203
  %2 = load i16, i16* %div.addr, align 2, !dbg !1204
  %conv2 = sext i16 %2 to i32, !dbg !1204
  %cmp = icmp eq i32 %conv2, 0, !dbg !1206
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1207

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1208
  %cmp4 = icmp slt i32 %3, 0, !dbg !1211
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1212

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1213
  br label %return, !dbg !1213

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1215
  br label %return, !dbg !1215

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1217
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1219
  %6 = load i16, i16* %div.addr, align 2, !dbg !1220
  %conv8 = sext i16 %6 to i32, !dbg !1220
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1221
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1221
  %div9 = sdiv i32 %5, %conv8, !dbg !1221, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1222
  %conv10 = sext i16 %7 to i32, !dbg !1222
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1223
  %sub = sub nsw i32 %4, %mul11, !dbg !1224
  %shl = shl i32 %sub, 1, !dbg !1225
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1226
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1227
  %9 = load i16, i16* %div.addr, align 2, !dbg !1228
  %conv12 = sext i16 %9 to i32, !dbg !1228
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1229
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1229
  %div13 = sdiv i32 %8, %conv12, !dbg !1229, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1230
  %11 = load i16, i16* %div.addr, align 2, !dbg !1231
  %conv14 = sext i16 %11 to i32, !dbg !1231
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1232
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1232
  %div15 = sdiv i32 %10, %conv14, !dbg !1232, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1233
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1234
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1235
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1237
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1238

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1239
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1242
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1243

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1244
  %conv22 = trunc i32 %14 to i16, !dbg !1246
  store i16 %conv22, i16* %retval, align 2, !dbg !1247
  br label %return, !dbg !1247

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1248
  br label %return, !dbg !1248

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1250
  br label %return, !dbg !1250

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1252
  ret i16 %15, !dbg !1252
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1253 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1256, metadata !DIExpression()), !dbg !1257
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1258, metadata !DIExpression()), !dbg !1259
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1260, metadata !DIExpression()), !dbg !1261
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1262, metadata !DIExpression()), !dbg !1263
  store i32 0, i32* %s32Result, align 4, !dbg !1263
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1264, metadata !DIExpression()), !dbg !1265
  store i32 0, i32* %s32Temp1, align 4, !dbg !1265
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1266
  %conv = sext i16 %0 to i32, !dbg !1266
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1267
  %conv1 = sext i16 %1 to i32, !dbg !1267
  %mul = mul nsw i32 %conv, %conv1, !dbg !1268
  store i32 %mul, i32* %s32Result, align 4, !dbg !1269
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1270
  %conv2 = zext i16 %2 to i32, !dbg !1270
  %cmp = icmp eq i32 %conv2, 0, !dbg !1272
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1273

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1274
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1277
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1278

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1279
  br label %return, !dbg !1279

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1281
  %cmp7 = icmp eq i32 %4, 0, !dbg !1283
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1284

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1285
  br label %return, !dbg !1285

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1287
  br label %return, !dbg !1287

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1289
  %6 = load i32, i32* %s32Result, align 4, !dbg !1291
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1292
  %conv12 = zext i16 %7 to i32, !dbg !1292
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1293
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1293
  %div = sdiv i32 %6, %conv12, !dbg !1293, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1294
  %conv13 = zext i16 %8 to i32, !dbg !1294
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1295
  %sub = sub nsw i32 %5, %mul14, !dbg !1296
  %shl = shl i32 %sub, 1, !dbg !1297
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1298
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1299
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1300
  %conv15 = zext i16 %10 to i32, !dbg !1300
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1301
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1301
  %div16 = sdiv i32 %9, %conv15, !dbg !1301, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1302
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1303
  %conv17 = zext i16 %12 to i32, !dbg !1303
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1304
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1304
  %div18 = sdiv i32 %11, %conv17, !dbg !1304, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1305
  store i32 %add, i32* %s32Result, align 4, !dbg !1306
  %13 = load i32, i32* %s32Result, align 4, !dbg !1307
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1309
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1310

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1311
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1314
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1315

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1316
  %conv25 = trunc i32 %15 to i16, !dbg !1318
  store i16 %conv25, i16* %retval, align 2, !dbg !1319
  br label %return, !dbg !1319

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1320
  br label %return, !dbg !1320

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1322
  br label %return, !dbg !1322

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1324
  ret i16 %16, !dbg !1324
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1325 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1328, metadata !DIExpression()), !dbg !1329
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1330, metadata !DIExpression()), !dbg !1331
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1332, metadata !DIExpression()), !dbg !1333
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1334
  %cmp = icmp eq i32 %0, 0, !dbg !1336
  br i1 %cmp, label %if.then, label %if.else, !dbg !1337

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1338
  br label %return, !dbg !1338

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1340
  %cmp1 = icmp sle i32 %1, 0, !dbg !1343
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1344

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1345
  br label %return, !dbg !1345

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1347
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1349
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1350
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1351
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1351
  %div = udiv i32 %3, %4, !dbg !1351, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1352
  %mul = mul i32 %div, %5, !dbg !1353
  %sub = sub i32 %2, %mul, !dbg !1354
  %shl = shl i32 %sub, 1, !dbg !1355
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1356
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1357
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1358
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1359
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1359
  %div4 = udiv i32 %6, %7, !dbg !1359, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1360
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1361
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1362
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1362
  %div5 = udiv i32 %8, %9, !dbg !1362, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1363
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1364
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1365
  store i32 %10, i32* %retval, align 4, !dbg !1366
  br label %return, !dbg !1366

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1367
  ret i32 %11, !dbg !1367
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1368 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1371, metadata !DIExpression()), !dbg !1372
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1373, metadata !DIExpression()), !dbg !1374
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1375, metadata !DIExpression()), !dbg !1376
  store i32 0, i32* %s32Temp1, align 4, !dbg !1376
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1377
  %cmp = icmp eq i32 %0, 0, !dbg !1379
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1380

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1381
  %cmp1 = icmp sge i32 %1, 0, !dbg !1384
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1385

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1386
  br label %return, !dbg !1386

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1388
  br label %return, !dbg !1388

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1390
  %cmp4 = icmp sge i32 %2, 0, !dbg !1393
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1394

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1395
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1397
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1398
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1399
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1399
  %div = udiv i32 %4, %5, !dbg !1399, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1400
  %mul = mul i32 %div, %6, !dbg !1401
  %sub = sub i32 %3, %mul, !dbg !1402
  %shl = shl i32 %sub, 1, !dbg !1403
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1404
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1405
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1406
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1407
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1407
  %div6 = udiv i32 %7, %8, !dbg !1407, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1408
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1409
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1410
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1410
  %div7 = udiv i32 %9, %10, !dbg !1410, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1411
  store i32 %add, i32* %retval, align 4, !dbg !1412
  br label %return, !dbg !1412

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1413
  br label %return, !dbg !1413

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1415
  ret i32 %11, !dbg !1415
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1416 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1419, metadata !DIExpression()), !dbg !1420
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1421, metadata !DIExpression()), !dbg !1422
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1423, metadata !DIExpression()), !dbg !1424
  store i32 0, i32* %u32Temp1, align 4, !dbg !1424
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1425, metadata !DIExpression()), !dbg !1426
  store i32 0, i32* %u32Temp2, align 4, !dbg !1426
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1427
  %cmp = icmp eq i32 %0, 0, !dbg !1429
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1430

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1431
  %cmp1 = icmp slt i32 %1, 0, !dbg !1434
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1435

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1436
  br label %return, !dbg !1436

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1438
  br label %return, !dbg !1438

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1440
  %cmp4 = icmp sge i32 %2, 0, !dbg !1443
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1444

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1445
  %cmp6 = icmp eq i32 %3, 0, !dbg !1448
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1449

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1450
  br label %return, !dbg !1450

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1452
  %cmp9 = icmp sle i32 %4, 0, !dbg !1455
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1456

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1457
  br label %return, !dbg !1457

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1459
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1461
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1462
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1463
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1463
  %div = sdiv i32 %6, %7, !dbg !1463, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1464
  %mul = mul nsw i32 %div, %8, !dbg !1465
  %sub = sub nsw i32 %5, %mul, !dbg !1466
  %shl = shl i32 %sub, 1, !dbg !1467
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1468
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1469
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1470
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1471
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1471
  %div12 = udiv i32 %9, %10, !dbg !1471, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1472
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1473
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1474
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1474
  %div13 = sdiv i32 %11, %12, !dbg !1474, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1475
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1476
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1477
  store i32 %13, i32* %retval, align 4, !dbg !1478
  br label %return, !dbg !1478

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1479
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1482
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1483

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1484
  br label %return, !dbg !1484

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1486
  %sub18 = sub nsw i32 0, %15, !dbg !1488
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1489
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1490
  %sub19 = sub nsw i32 0, %16, !dbg !1491
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1492
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1493
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1494
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1495
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1496
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1496
  %div20 = sdiv i32 %18, %19, !dbg !1496, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1497
  %mul21 = mul nsw i32 %div20, %20, !dbg !1498
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1499
  %shl23 = shl i32 %sub22, 1, !dbg !1500
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1501
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1502
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1503
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1504
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1504
  %div24 = udiv i32 %21, %22, !dbg !1504, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1505
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1506
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1507
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1507
  %div25 = sdiv i32 %23, %24, !dbg !1507, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1508
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1509
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1510
  store i32 %25, i32* %retval, align 4, !dbg !1511
  br label %return, !dbg !1511

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1512
  ret i32 %26, !dbg !1512
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1513 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1516, metadata !DIExpression()), !dbg !1517
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1518, metadata !DIExpression()), !dbg !1519
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1520, metadata !DIExpression()), !dbg !1521
  store i32 0, i32* %u32Temp1, align 4, !dbg !1521
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1522, metadata !DIExpression()), !dbg !1523
  store i32 0, i32* %u32Temp2, align 4, !dbg !1523
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1524, metadata !DIExpression()), !dbg !1525
  store i32 0, i32* %u32Temp3, align 4, !dbg !1525
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1526, metadata !DIExpression()), !dbg !1527
  store i32 0, i32* %numerator_old, align 4, !dbg !1527
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1528
  %cmp = icmp eq i32 %0, 0, !dbg !1530
  br i1 %cmp, label %if.then, label %if.else, !dbg !1531

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1532
  br label %return, !dbg !1532

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1534
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1536
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1537
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1538
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1539
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1539
  %div = udiv i32 %3, %4, !dbg !1539, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1540
  %sub = sub i32 %1, %mul, !dbg !1541
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1542
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1543
  %and = and i32 %5, 1, !dbg !1545
  %cmp1 = icmp eq i32 %and, 0, !dbg !1546
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1547

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1548
  %shr = lshr i32 %6, 1, !dbg !1550
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1551
  br label %if.end, !dbg !1552

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1553
  %shr4 = lshr i32 %7, 1, !dbg !1555
  %add = add i32 %shr4, 1, !dbg !1556
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1557
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1558
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1560
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1561
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1562

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1563
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1565
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1566
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1566
  %div7 = udiv i32 %10, %11, !dbg !1566, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1567
  br label %return, !dbg !1567

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1568
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1570
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1571
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1571
  %div9 = udiv i32 %12, %13, !dbg !1571, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1572
  store i32 %add10, i32* %retval, align 4, !dbg !1573
  br label %return, !dbg !1573

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1574
  ret i32 %14, !dbg !1574
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1575 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1578, metadata !DIExpression()), !dbg !1579
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1580, metadata !DIExpression()), !dbg !1581
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1582, metadata !DIExpression()), !dbg !1583
  store i32 0, i32* %u32Temp1, align 4, !dbg !1583
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1584, metadata !DIExpression()), !dbg !1585
  store i32 0, i32* %u32Temp2, align 4, !dbg !1585
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1586
  %cmp = icmp sle i32 %0, 0, !dbg !1588
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1589

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1590
  %cmp1 = icmp sge i32 %1, 0, !dbg !1593
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1594

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1595
  br label %return, !dbg !1595

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1597
  %sub = sub nsw i32 0, %2, !dbg !1599
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1600
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1601
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1602
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1603
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1604
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1604
  %div = udiv i32 %4, %5, !dbg !1604, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1605
  %mul = mul i32 %div, %6, !dbg !1606
  %sub3 = sub i32 %3, %mul, !dbg !1607
  %shl = shl i32 %sub3, 1, !dbg !1608
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1609
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1610
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1611
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1612
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1612
  %div4 = udiv i32 %7, %8, !dbg !1612, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1613
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1614
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1615
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1615
  %div5 = udiv i32 %9, %10, !dbg !1615, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1616
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1617
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1618
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1620
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1621

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1622
  %sub8 = sub i32 0, %12, !dbg !1624
  store i32 %sub8, i32* %retval, align 4, !dbg !1625
  br label %return, !dbg !1625

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1626
  br label %return, !dbg !1626

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1628
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1630
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1631
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1632
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1632
  %div11 = udiv i32 %14, %15, !dbg !1632, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1633
  %mul12 = mul i32 %div11, %16, !dbg !1634
  %sub13 = sub i32 %13, %mul12, !dbg !1635
  %shl14 = shl i32 %sub13, 1, !dbg !1636
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1637
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1638
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1639
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1640
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1640
  %div15 = udiv i32 %17, %18, !dbg !1640, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1641
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1642
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1643
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1643
  %div16 = udiv i32 %19, %20, !dbg !1643, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1644
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1645
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1646
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1648
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1649

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1650
  store i32 %22, i32* %retval, align 4, !dbg !1652
  br label %return, !dbg !1652

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1653
  br label %return, !dbg !1653

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1655
  ret i32 %23, !dbg !1655
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1656 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1659, metadata !DIExpression()), !dbg !1660
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1661, metadata !DIExpression()), !dbg !1662
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1663, metadata !DIExpression()), !dbg !1664
  store i32 0, i32* %s32Temp1, align 4, !dbg !1664
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1665, metadata !DIExpression()), !dbg !1666
  store i32 0, i32* %s32Temp2, align 4, !dbg !1666
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1667, metadata !DIExpression()), !dbg !1668
  store i32 0, i32* %u32Temp0, align 4, !dbg !1668
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1669, metadata !DIExpression()), !dbg !1670
  store i32 0, i32* %u32Temp1, align 4, !dbg !1670
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1671, metadata !DIExpression()), !dbg !1672
  store i32 0, i32* %u32Temp2, align 4, !dbg !1672
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1673
  %cmp = icmp eq i32 %0, 0, !dbg !1675
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1676

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1677
  %cmp1 = icmp slt i32 %1, 0, !dbg !1680
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1681

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1682
  br label %return, !dbg !1682

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1684
  br label %return, !dbg !1684

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1686
  %cmp4 = icmp sle i32 %2, 0, !dbg !1689
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1690

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1691
  %sub = sub nsw i32 0, %3, !dbg !1693
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1694
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1695
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1696
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1697
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1697
  %div = udiv i32 %4, %5, !dbg !1697, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1698
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1699
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1700
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1701
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1702
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1702
  %div6 = udiv i32 %7, %8, !dbg !1702, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1703
  %mul = mul i32 %div6, %9, !dbg !1704
  %sub7 = sub i32 %6, %mul, !dbg !1705
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1706
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1707
  %and = and i32 %10, 1, !dbg !1709
  %cmp8 = icmp eq i32 %and, 0, !dbg !1710
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1711

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1712
  %shr = lshr i32 %11, 1, !dbg !1714
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1715
  br label %if.end, !dbg !1716

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1717
  %shr11 = lshr i32 %12, 1, !dbg !1719
  %add = add i32 %shr11, 1, !dbg !1720
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1721
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1722
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1724
  %cmp12 = icmp ult i32 %13, %14, !dbg !1725
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1726

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1727
  %neg = xor i32 %15, -1, !dbg !1729
  %add14 = add i32 %neg, 1, !dbg !1730
  store i32 %add14, i32* %retval, align 4, !dbg !1731
  br label %return, !dbg !1731

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1732
  %add16 = add i32 %16, 1, !dbg !1734
  %neg17 = xor i32 %add16, -1, !dbg !1735
  %add18 = add i32 %neg17, 1, !dbg !1736
  store i32 %add18, i32* %retval, align 4, !dbg !1737
  br label %return, !dbg !1737

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1738
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1740
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1741
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1742
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1742
  %div20 = udiv i32 %18, %19, !dbg !1742, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1743
  %mul21 = mul i32 %div20, %20, !dbg !1744
  %sub22 = sub i32 %17, %mul21, !dbg !1745
  %shl = shl i32 %sub22, 1, !dbg !1746
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1747
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1748
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1749
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1750
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1750
  %div23 = udiv i32 %21, %22, !dbg !1750, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1751
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1752
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1753
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1753
  %div24 = udiv i32 %23, %24, !dbg !1753, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1754
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1755
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1756
  store i32 %25, i32* %retval, align 4, !dbg !1757
  br label %return, !dbg !1757

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1758
  ret i32 %26, !dbg !1758
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1759 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1762, metadata !DIExpression()), !dbg !1763
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1764, metadata !DIExpression()), !dbg !1765
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1766, metadata !DIExpression()), !dbg !1767
  store i32 0, i32* %s32Temp1, align 4, !dbg !1767
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1768, metadata !DIExpression()), !dbg !1769
  store i32 0, i32* %s32Temp2, align 4, !dbg !1769
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1770, metadata !DIExpression()), !dbg !1771
  store i32 0, i32* %denominator_prime, align 4, !dbg !1771
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1772, metadata !DIExpression()), !dbg !1773
  store i32 0, i32* %u32Temp1, align 4, !dbg !1773
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1774, metadata !DIExpression()), !dbg !1775
  store i32 0, i32* %u32Temp2, align 4, !dbg !1775
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1776, metadata !DIExpression()), !dbg !1777
  store i32 0, i32* %u32numerator, align 4, !dbg !1777
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1778, metadata !DIExpression()), !dbg !1779
  store i32 0, i32* %u32denominator, align 4, !dbg !1779
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1780
  %cmp = icmp slt i32 %0, 0, !dbg !1782
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1783

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1784
  %cmp1 = icmp sle i32 %1, 0, !dbg !1787
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1788

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1789
  %cmp3 = icmp sge i32 %2, 0, !dbg !1792
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1793

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1794
  br label %return, !dbg !1794

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1796
  %sub = sub nsw i32 0, %3, !dbg !1798
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1799
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1800
  %sub5 = sub nsw i32 0, %4, !dbg !1801
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1802
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1803
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1804
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1805
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1806
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1806
  %div = udiv i32 %6, %7, !dbg !1806, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1807
  %mul = mul i32 %div, %8, !dbg !1808
  %sub6 = sub i32 %5, %mul, !dbg !1809
  %shl = shl i32 %sub6, 1, !dbg !1810
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1811
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1812
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1813
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1814
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1814
  %div7 = udiv i32 %9, %10, !dbg !1814, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1815
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1816
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1817
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1817
  %div8 = udiv i32 %11, %12, !dbg !1817, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1818
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1819
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1820
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1822
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1823

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1824
  store i32 %14, i32* %retval, align 4, !dbg !1826
  br label %return, !dbg !1826

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1827
  br label %return, !dbg !1827

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1829
  %neg = xor i32 %15, -1, !dbg !1831
  %add13 = add nsw i32 %neg, 1, !dbg !1832
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1833
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1834
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1835
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1836
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1837
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1837
  %div14 = udiv i32 %17, %18, !dbg !1837, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1838
  %mul15 = mul i32 %div14, %19, !dbg !1839
  %sub16 = sub i32 %16, %mul15, !dbg !1840
  %shl17 = shl i32 %sub16, 1, !dbg !1841
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1842
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1843
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1844
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1845
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1845
  %div18 = udiv i32 %20, %21, !dbg !1845, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1846
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1847
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1848
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1848
  %div19 = sdiv i32 %22, %23, !dbg !1848, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1849
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1850
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1851
  %neg21 = xor i32 %24, -1, !dbg !1852
  %add22 = add nsw i32 %neg21, 1, !dbg !1853
  store i32 %add22, i32* %retval, align 4, !dbg !1854
  br label %return, !dbg !1854

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1855
  %cmp24 = icmp sle i32 %25, 0, !dbg !1858
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1859

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1860
  %cmp26 = icmp sge i32 %26, 0, !dbg !1863
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1864

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1865
  br label %return, !dbg !1865

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1867
  %neg29 = xor i32 %27, -1, !dbg !1869
  %add30 = add nsw i32 %neg29, 1, !dbg !1870
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1871
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1872
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1873
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1874
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1875
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1875
  %div31 = udiv i32 %29, %30, !dbg !1875, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1876
  %mul32 = mul i32 %div31, %31, !dbg !1877
  %sub33 = sub i32 %28, %mul32, !dbg !1878
  %shl34 = shl i32 %sub33, 1, !dbg !1879
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1880
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1881
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1882
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1883
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1883
  %div35 = udiv i32 %32, %33, !dbg !1883, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1884
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1885
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1886
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1886
  %div36 = udiv i32 %34, %35, !dbg !1886, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1887
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1888
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1889
  %neg38 = xor i32 %36, -1, !dbg !1890
  %add39 = add nsw i32 %neg38, 1, !dbg !1891
  store i32 %add39, i32* %retval, align 4, !dbg !1892
  br label %return, !dbg !1892

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1893
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1895
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1896
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1897
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1897
  %div41 = sdiv i32 %38, %39, !dbg !1897, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1898
  %mul42 = mul nsw i32 %div41, %40, !dbg !1899
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1900
  %shl44 = shl i32 %sub43, 1, !dbg !1901
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1902
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1903
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1904
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1905
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1905
  %div45 = sdiv i32 %41, %42, !dbg !1905, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1906
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1907
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1908
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1908
  %div46 = udiv i32 %43, %44, !dbg !1908, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1909
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1910
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1911
  store i32 %45, i32* %retval, align 4, !dbg !1912
  br label %return, !dbg !1912

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1913
  ret i32 %46, !dbg !1913
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1914 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1917, metadata !DIExpression()), !dbg !1918
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1919, metadata !DIExpression()), !dbg !1920
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1921, metadata !DIExpression()), !dbg !1922
  store i32 0, i32* %numerator_prime, align 4, !dbg !1922
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1923, metadata !DIExpression()), !dbg !1924
  store i32 0, i32* %u32Temp1, align 4, !dbg !1924
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1925, metadata !DIExpression()), !dbg !1926
  store i32 0, i32* %u32Temp2, align 4, !dbg !1926
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1927, metadata !DIExpression()), !dbg !1928
  store i32 0, i32* %u32Temp3, align 4, !dbg !1928
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1929, metadata !DIExpression()), !dbg !1930
  store i32 0, i32* %s32Temp1, align 4, !dbg !1930
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1931, metadata !DIExpression()), !dbg !1932
  store i32 0, i32* %s32Temp2, align 4, !dbg !1932
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1933, metadata !DIExpression()), !dbg !1934
  store i32 0, i32* %s32Temp3, align 4, !dbg !1934
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1935
  %cmp = icmp eq i32 %0, 0, !dbg !1937
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1938

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1939
  %cmp1 = icmp slt i32 %1, 0, !dbg !1942
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1943

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1944
  br label %return, !dbg !1944

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1946
  br label %return, !dbg !1946

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1948
  %cmp4 = icmp slt i32 %2, 0, !dbg !1951
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1952

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1953
  %sub = sub nsw i32 0, %3, !dbg !1955
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1956
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1957
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1958
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1959
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1959
  %div = udiv i32 %4, %5, !dbg !1959, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1960
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1961
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1962
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1963
  %mul = mul i32 %7, %8, !dbg !1964
  %sub6 = sub i32 %6, %mul, !dbg !1965
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1966
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1967
  %and = and i32 %9, 1, !dbg !1969
  %cmp7 = icmp eq i32 %and, 0, !dbg !1970
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1971

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1972
  %shr = lshr i32 %10, 1, !dbg !1974
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1975
  br label %if.end, !dbg !1976

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1977
  %shr10 = lshr i32 %11, 1, !dbg !1979
  %add = add i32 %shr10, 1, !dbg !1980
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1981
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1982
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1984
  %cmp11 = icmp ult i32 %12, %13, !dbg !1985
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1986

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1987
  %neg = xor i32 %14, -1, !dbg !1989
  %add13 = add i32 %neg, 1, !dbg !1990
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1991
  br label %if.end18, !dbg !1992

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1993
  %add15 = add i32 %15, 1, !dbg !1995
  %neg16 = xor i32 %add15, -1, !dbg !1996
  %add17 = add i32 %neg16, 1, !dbg !1997
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1998
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1999
  %cmp19 = icmp sge i32 %16, -32768, !dbg !2001
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !2002

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !2003
  %conv = trunc i32 %17 to i16, !dbg !2005
  store i16 %conv, i16* %retval, align 2, !dbg !2006
  br label %return, !dbg !2006

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !2007
  br label %return, !dbg !2007

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !2009
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !2011
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !2012
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !2012
  %div23 = udiv i32 %18, %19, !dbg !2012, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !2013
  %mul24 = mul i32 %div23, %20, !dbg !2014
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !2015
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !2016
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !2017
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !2018
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !2019
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !2019
  %div25 = udiv i32 %22, %23, !dbg !2019, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !2020
  %mul26 = mul i32 %div25, %24, !dbg !2021
  %sub27 = sub i32 %21, %mul26, !dbg !2022
  %shl = shl i32 %sub27, 1, !dbg !2023
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !2024
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !2025
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !2026
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !2027
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !2027
  %div28 = udiv i32 %25, %26, !dbg !2027, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !2028
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !2029
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !2030
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !2030
  %div29 = udiv i32 %27, %28, !dbg !2030, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !2031
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2032
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2033
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2035
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2036

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2037
  %conv34 = trunc i32 %30 to i16, !dbg !2039
  store i16 %conv34, i16* %retval, align 2, !dbg !2040
  br label %return, !dbg !2040

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2041
  br label %return, !dbg !2041

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2043
  ret i16 %31, !dbg !2043
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2044 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2050, metadata !DIExpression()), !dbg !2051
  %2 = icmp eq i64 %0, 0, !dbg !2052
  br i1 %2, label %3, label %4, !dbg !2054

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2055
  unreachable, !dbg !2055

4:                                                ; preds = %1
  ret void, !dbg !2056
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2057 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2063, metadata !DIExpression()), !dbg !2065
  call void @llvm.dbg.value(metadata i64 %1, metadata !2064, metadata !DIExpression()), !dbg !2065
  %3 = icmp ult i64 %1, %0, !dbg !2066
  br i1 %3, label %5, label %4, !dbg !2068

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2069
  unreachable, !dbg !2069

5:                                                ; preds = %2
  ret void, !dbg !2071
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0037/div_Ccode_alarm_0037.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0037")
!4 = !{}
!5 = !{!6, !13, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0037")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0037")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0037/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0037")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0037")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0037")
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
!360 = !DILocation(line: 334, column: 54, scope: !361)
!361 = distinct !DILexicalBlock(scope: !362, file: !69, line: 334, column: 9)
!362 = distinct !DILexicalBlock(scope: !356, file: !69, line: 332, column: 4)
!363 = !DILocation(line: 334, column: 44, scope: !361)
!364 = !DILocation(line: 334, column: 80, scope: !361)
!365 = !DILocation(line: 334, column: 75, scope: !361)
!366 = !DILocation(line: 334, column: 65, scope: !361)
!367 = !DILocation(line: 334, column: 11, scope: !361)
!368 = !DILocation(line: 334, column: 9, scope: !362)
!369 = !DILocation(line: 335, column: 9, scope: !370)
!370 = distinct !DILexicalBlock(scope: !361, file: !69, line: 334, column: 96)
!371 = !DILocation(line: 342, column: 37, scope: !362)
!372 = !DILocation(line: 342, column: 53, scope: !362)
!373 = !DILocation(line: 342, column: 48, scope: !362)
!374 = !DILocation(line: 342, column: 46, scope: !362)
!375 = !DILocation(line: 342, column: 27, scope: !362)
!376 = !DILocation(line: 342, column: 25, scope: !362)
!377 = !DILocation(line: 343, column: 5, scope: !362)
!378 = !DILocation(line: 365, column: 5, scope: !379)
!379 = distinct !DILexicalBlock(scope: !356, file: !69, line: 364, column: 4)
!380 = !DILocation(line: 371, column: 1, scope: !186)
!381 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !382, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!382 = !DISubroutineType(types: !383)
!383 = !{!19, !13}
!384 = !DILocalVariable(name: "denominator", arg: 1, scope: !381, file: !33, line: 24, type: !13)
!385 = !DILocation(line: 24, column: 40, scope: !381)
!386 = !DILocation(line: 26, column: 12, scope: !381)
!387 = !DILocation(line: 26, column: 24, scope: !381)
!388 = !DILocation(line: 26, column: 5, scope: !381)
!389 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !382, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!390 = !DILocalVariable(name: "left", arg: 1, scope: !389, file: !33, line: 84, type: !13)
!391 = !DILocation(line: 84, column: 51, scope: !389)
!392 = !DILocation(line: 86, column: 12, scope: !389)
!393 = !DILocation(line: 86, column: 17, scope: !389)
!394 = !DILocation(line: 86, column: 5, scope: !389)
!395 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !396, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!396 = !DISubroutineType(types: !397)
!397 = !{!19, !13, !20}
!398 = !DILocalVariable(name: "left", arg: 1, scope: !395, file: !33, line: 90, type: !13)
!399 = !DILocation(line: 90, column: 41, scope: !395)
!400 = !DILocalVariable(name: "count", arg: 2, scope: !395, file: !33, line: 90, type: !20)
!401 = !DILocation(line: 90, column: 56, scope: !395)
!402 = !DILocation(line: 92, column: 9, scope: !403)
!403 = distinct !DILexicalBlock(scope: !395, file: !33, line: 92, column: 9)
!404 = !DILocation(line: 92, column: 15, scope: !403)
!405 = !DILocation(line: 92, column: 9, scope: !395)
!406 = !DILocation(line: 93, column: 9, scope: !407)
!407 = distinct !DILexicalBlock(scope: !403, file: !33, line: 92, column: 32)
!408 = !DILocation(line: 95, column: 12, scope: !395)
!409 = !DILocation(line: 95, column: 34, scope: !395)
!410 = !DILocation(line: 95, column: 31, scope: !395)
!411 = !DILocation(line: 95, column: 17, scope: !395)
!412 = !DILocation(line: 95, column: 41, scope: !395)
!413 = !DILocation(line: 95, column: 5, scope: !395)
!414 = !DILocation(line: 96, column: 1, scope: !395)
!415 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !416, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!416 = !DISubroutineType(types: !417)
!417 = !{!19, !13, !13}
!418 = !DILocalVariable(name: "left", arg: 1, scope: !415, file: !33, line: 78, type: !13)
!419 = !DILocation(line: 78, column: 38, scope: !415)
!420 = !DILocalVariable(name: "right", arg: 2, scope: !415, file: !33, line: 78, type: !13)
!421 = !DILocation(line: 78, column: 52, scope: !415)
!422 = !DILocation(line: 80, column: 12, scope: !415)
!423 = !DILocation(line: 80, column: 19, scope: !415)
!424 = !DILocation(line: 80, column: 17, scope: !415)
!425 = !DILocation(line: 80, column: 25, scope: !415)
!426 = !DILocation(line: 80, column: 5, scope: !415)
!427 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !416, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!428 = !DILocalVariable(name: "left", arg: 1, scope: !427, file: !33, line: 72, type: !13)
!429 = !DILocation(line: 72, column: 38, scope: !427)
!430 = !DILocalVariable(name: "right", arg: 2, scope: !427, file: !33, line: 72, type: !13)
!431 = !DILocation(line: 72, column: 52, scope: !427)
!432 = !DILocation(line: 74, column: 12, scope: !427)
!433 = !DILocation(line: 74, column: 19, scope: !427)
!434 = !DILocation(line: 74, column: 17, scope: !427)
!435 = !DILocation(line: 74, column: 25, scope: !427)
!436 = !DILocation(line: 74, column: 5, scope: !427)
!437 = distinct !DISubprogram(name: "klee_alarm_s32_add_lower", scope: !33, file: !33, line: 48, type: !416, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!438 = !DILocalVariable(name: "left", arg: 1, scope: !437, file: !33, line: 48, type: !13)
!439 = !DILocation(line: 48, column: 38, scope: !437)
!440 = !DILocalVariable(name: "right", arg: 2, scope: !437, file: !33, line: 48, type: !13)
!441 = !DILocation(line: 48, column: 52, scope: !437)
!442 = !DILocation(line: 50, column: 12, scope: !437)
!443 = !DILocation(line: 50, column: 19, scope: !437)
!444 = !DILocation(line: 50, column: 17, scope: !437)
!445 = !DILocation(line: 50, column: 25, scope: !437)
!446 = !DILocation(line: 50, column: 5, scope: !437)
!447 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !416, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!448 = !DILocalVariable(name: "left", arg: 1, scope: !447, file: !33, line: 54, type: !13)
!449 = !DILocation(line: 54, column: 38, scope: !447)
!450 = !DILocalVariable(name: "right", arg: 2, scope: !447, file: !33, line: 54, type: !13)
!451 = !DILocation(line: 54, column: 52, scope: !447)
!452 = !DILocation(line: 56, column: 12, scope: !447)
!453 = !DILocation(line: 56, column: 19, scope: !447)
!454 = !DILocation(line: 56, column: 17, scope: !447)
!455 = !DILocation(line: 56, column: 25, scope: !447)
!456 = !DILocation(line: 56, column: 5, scope: !447)
!457 = distinct !DISubprogram(name: "klee_alarm_s32_div_representable", scope: !33, file: !33, line: 30, type: !416, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!458 = !DILocalVariable(name: "numerator", arg: 1, scope: !457, file: !33, line: 30, type: !13)
!459 = !DILocation(line: 30, column: 46, scope: !457)
!460 = !DILocalVariable(name: "denominator", arg: 2, scope: !457, file: !33, line: 30, type: !13)
!461 = !DILocation(line: 30, column: 65, scope: !457)
!462 = !DILocation(line: 32, column: 14, scope: !457)
!463 = !DILocation(line: 32, column: 24, scope: !457)
!464 = !DILocation(line: 32, column: 37, scope: !457)
!465 = !DILocation(line: 32, column: 12, scope: !457)
!466 = !DILocation(line: 32, column: 5, scope: !457)
!467 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 389, type: !468, scopeLine: 390, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!468 = !DISubroutineType(types: !469)
!469 = !{!6, !6, !28}
!470 = !DILocalVariable(name: "numerator", arg: 1, scope: !467, file: !69, line: 389, type: !6)
!471 = !DILocation(line: 389, column: 31, scope: !467)
!472 = !DILocalVariable(name: "denominator", arg: 2, scope: !467, file: !69, line: 389, type: !28)
!473 = !DILocation(line: 389, column: 47, scope: !467)
!474 = !DILocalVariable(name: "u16Temp1", scope: !467, file: !69, line: 391, type: !28)
!475 = !DILocation(line: 391, column: 6, scope: !467)
!476 = !DILocalVariable(name: "s32Temp1", scope: !467, file: !69, line: 392, type: !16)
!477 = !DILocation(line: 392, column: 6, scope: !467)
!478 = !DILocalVariable(name: "s32Temp2", scope: !467, file: !69, line: 392, type: !16)
!479 = !DILocation(line: 392, column: 15, scope: !467)
!480 = !DILocation(line: 393, column: 13, scope: !467)
!481 = !DILocation(line: 393, column: 25, scope: !467)
!482 = !DILocation(line: 393, column: 11, scope: !467)
!483 = !DILocation(line: 394, column: 13, scope: !467)
!484 = !DILocation(line: 394, column: 22, scope: !467)
!485 = !DILocation(line: 394, column: 11, scope: !467)
!486 = !DILocation(line: 395, column: 5, scope: !487)
!487 = distinct !DILexicalBlock(scope: !467, file: !69, line: 395, column: 5)
!488 = !DILocation(line: 395, column: 14, scope: !487)
!489 = !DILocation(line: 395, column: 5, scope: !467)
!490 = !DILocation(line: 397, column: 7, scope: !491)
!491 = distinct !DILexicalBlock(scope: !492, file: !69, line: 397, column: 7)
!492 = distinct !DILexicalBlock(scope: !487, file: !69, line: 396, column: 2)
!493 = !DILocation(line: 397, column: 17, scope: !491)
!494 = !DILocation(line: 397, column: 7, scope: !492)
!495 = !DILocation(line: 399, column: 4, scope: !496)
!496 = distinct !DILexicalBlock(scope: !491, file: !69, line: 398, column: 3)
!497 = !DILocation(line: 403, column: 4, scope: !498)
!498 = distinct !DILexicalBlock(scope: !491, file: !69, line: 402, column: 3)
!499 = !DILocation(line: 408, column: 15, scope: !500)
!500 = distinct !DILexicalBlock(scope: !487, file: !69, line: 407, column: 2)
!501 = !DILocation(line: 408, column: 24, scope: !500)
!502 = !DILocation(line: 408, column: 32, scope: !500)
!503 = !DILocation(line: 408, column: 41, scope: !500)
!504 = !DILocation(line: 408, column: 47, scope: !500)
!505 = !DILocation(line: 408, column: 46, scope: !500)
!506 = !DILocation(line: 408, column: 57, scope: !500)
!507 = !DILocation(line: 408, column: 56, scope: !500)
!508 = !DILocation(line: 408, column: 29, scope: !500)
!509 = !DILocation(line: 408, column: 12, scope: !500)
!510 = !DILocation(line: 409, column: 14, scope: !500)
!511 = !DILocation(line: 409, column: 22, scope: !500)
!512 = !DILocation(line: 409, column: 12, scope: !500)
!513 = !DILocation(line: 410, column: 14, scope: !500)
!514 = !DILocation(line: 410, column: 23, scope: !500)
!515 = !DILocation(line: 410, column: 22, scope: !500)
!516 = !DILocation(line: 410, column: 12, scope: !500)
!517 = !DILocation(line: 411, column: 16, scope: !500)
!518 = !DILocation(line: 411, column: 25, scope: !500)
!519 = !DILocation(line: 411, column: 31, scope: !500)
!520 = !DILocation(line: 411, column: 30, scope: !500)
!521 = !DILocation(line: 411, column: 43, scope: !500)
!522 = !DILocation(line: 411, column: 41, scope: !500)
!523 = !DILocation(line: 411, column: 12, scope: !500)
!524 = !DILocation(line: 412, column: 6, scope: !525)
!525 = distinct !DILexicalBlock(scope: !500, file: !69, line: 412, column: 6)
!526 = !DILocation(line: 412, column: 15, scope: !525)
!527 = !DILocation(line: 412, column: 6, scope: !500)
!528 = !DILocation(line: 414, column: 7, scope: !529)
!529 = distinct !DILexicalBlock(scope: !530, file: !69, line: 414, column: 7)
!530 = distinct !DILexicalBlock(scope: !525, file: !69, line: 413, column: 3)
!531 = !DILocation(line: 414, column: 16, scope: !529)
!532 = !DILocation(line: 414, column: 7, scope: !530)
!533 = !DILocation(line: 416, column: 17, scope: !534)
!534 = distinct !DILexicalBlock(scope: !529, file: !69, line: 415, column: 4)
!535 = !DILocation(line: 416, column: 12, scope: !534)
!536 = !DILocation(line: 416, column: 5, scope: !534)
!537 = !DILocation(line: 420, column: 5, scope: !538)
!538 = distinct !DILexicalBlock(scope: !529, file: !69, line: 419, column: 4)
!539 = !DILocation(line: 425, column: 4, scope: !540)
!540 = distinct !DILexicalBlock(scope: !525, file: !69, line: 424, column: 3)
!541 = !DILocation(line: 428, column: 1, scope: !467)
!542 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 445, type: !468, scopeLine: 446, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!543 = !DILocalVariable(name: "numerator", arg: 1, scope: !542, file: !69, line: 445, type: !6)
!544 = !DILocation(line: 445, column: 30, scope: !542)
!545 = !DILocalVariable(name: "denominator", arg: 2, scope: !542, file: !69, line: 445, type: !28)
!546 = !DILocation(line: 445, column: 45, scope: !542)
!547 = !DILocalVariable(name: "u16Temp1", scope: !542, file: !69, line: 447, type: !28)
!548 = !DILocation(line: 447, column: 6, scope: !542)
!549 = !DILocalVariable(name: "s32Temp1", scope: !542, file: !69, line: 448, type: !16)
!550 = !DILocation(line: 448, column: 6, scope: !542)
!551 = !DILocation(line: 449, column: 13, scope: !542)
!552 = !DILocation(line: 449, column: 25, scope: !542)
!553 = !DILocation(line: 449, column: 11, scope: !542)
!554 = !DILocation(line: 450, column: 5, scope: !555)
!555 = distinct !DILexicalBlock(scope: !542, file: !69, line: 450, column: 5)
!556 = !DILocation(line: 450, column: 13, scope: !555)
!557 = !DILocation(line: 450, column: 5, scope: !542)
!558 = !DILocation(line: 452, column: 6, scope: !559)
!559 = distinct !DILexicalBlock(scope: !560, file: !69, line: 452, column: 6)
!560 = distinct !DILexicalBlock(scope: !555, file: !69, line: 451, column: 2)
!561 = !DILocation(line: 452, column: 15, scope: !559)
!562 = !DILocation(line: 452, column: 6, scope: !560)
!563 = !DILocation(line: 454, column: 4, scope: !564)
!564 = distinct !DILexicalBlock(scope: !559, file: !69, line: 453, column: 3)
!565 = !DILocation(line: 458, column: 4, scope: !566)
!566 = distinct !DILexicalBlock(scope: !559, file: !69, line: 457, column: 3)
!567 = !DILocation(line: 464, column: 15, scope: !568)
!568 = distinct !DILexicalBlock(scope: !555, file: !69, line: 463, column: 2)
!569 = !DILocation(line: 464, column: 27, scope: !568)
!570 = !DILocation(line: 464, column: 37, scope: !568)
!571 = !DILocation(line: 464, column: 36, scope: !568)
!572 = !DILocation(line: 464, column: 49, scope: !568)
!573 = !DILocation(line: 464, column: 47, scope: !568)
!574 = !DILocation(line: 464, column: 25, scope: !568)
!575 = !DILocation(line: 464, column: 59, scope: !568)
!576 = !DILocation(line: 464, column: 12, scope: !568)
!577 = !DILocation(line: 465, column: 15, scope: !568)
!578 = !DILocation(line: 465, column: 24, scope: !568)
!579 = !DILocation(line: 465, column: 23, scope: !568)
!580 = !DILocation(line: 465, column: 37, scope: !568)
!581 = !DILocation(line: 465, column: 47, scope: !568)
!582 = !DILocation(line: 465, column: 46, scope: !568)
!583 = !DILocation(line: 465, column: 34, scope: !568)
!584 = !DILocation(line: 465, column: 12, scope: !568)
!585 = !DILocation(line: 466, column: 10, scope: !568)
!586 = !DILocation(line: 466, column: 3, scope: !568)
!587 = !DILocation(line: 468, column: 1, scope: !542)
!588 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 486, type: !589, scopeLine: 487, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!589 = !DISubroutineType(types: !590)
!590 = !{!24, !28, !28}
!591 = !DILocalVariable(name: "numerator", arg: 1, scope: !588, file: !69, line: 486, type: !28)
!592 = !DILocation(line: 486, column: 28, scope: !588)
!593 = !DILocalVariable(name: "denominator", arg: 2, scope: !588, file: !69, line: 486, type: !28)
!594 = !DILocation(line: 486, column: 43, scope: !588)
!595 = !DILocalVariable(name: "u32Temp1", scope: !588, file: !69, line: 488, type: !596)
!596 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !20)
!597 = !DILocation(line: 488, column: 6, scope: !588)
!598 = !DILocalVariable(name: "u32Temp2", scope: !588, file: !69, line: 488, type: !596)
!599 = !DILocation(line: 488, column: 20, scope: !588)
!600 = !DILocalVariable(name: "u32Temp3", scope: !588, file: !69, line: 488, type: !596)
!601 = !DILocation(line: 488, column: 33, scope: !588)
!602 = !DILocation(line: 489, column: 5, scope: !603)
!603 = distinct !DILexicalBlock(scope: !588, file: !69, line: 489, column: 5)
!604 = !DILocation(line: 489, column: 16, scope: !603)
!605 = !DILocation(line: 489, column: 5, scope: !588)
!606 = !DILocation(line: 491, column: 3, scope: !607)
!607 = distinct !DILexicalBlock(scope: !603, file: !69, line: 490, column: 2)
!608 = !DILocation(line: 495, column: 15, scope: !609)
!609 = distinct !DILexicalBlock(scope: !603, file: !69, line: 494, column: 2)
!610 = !DILocation(line: 495, column: 24, scope: !609)
!611 = !DILocation(line: 495, column: 12, scope: !609)
!612 = !DILocation(line: 496, column: 14, scope: !609)
!613 = !DILocation(line: 496, column: 25, scope: !609)
!614 = !DILocation(line: 496, column: 23, scope: !609)
!615 = !DILocation(line: 496, column: 12, scope: !609)
!616 = !DILocation(line: 497, column: 15, scope: !609)
!617 = !DILocation(line: 497, column: 24, scope: !609)
!618 = !DILocation(line: 497, column: 32, scope: !609)
!619 = !DILocation(line: 497, column: 12, scope: !609)
!620 = !DILocation(line: 498, column: 6, scope: !621)
!621 = distinct !DILexicalBlock(scope: !609, file: !69, line: 498, column: 6)
!622 = !DILocation(line: 498, column: 15, scope: !621)
!623 = !DILocation(line: 498, column: 6, scope: !609)
!624 = !DILocation(line: 500, column: 15, scope: !625)
!625 = distinct !DILexicalBlock(scope: !621, file: !69, line: 499, column: 3)
!626 = !DILocation(line: 500, column: 11, scope: !625)
!627 = !DILocation(line: 500, column: 4, scope: !625)
!628 = !DILocation(line: 504, column: 4, scope: !629)
!629 = distinct !DILexicalBlock(scope: !621, file: !69, line: 503, column: 3)
!630 = !DILocation(line: 507, column: 1, scope: !588)
!631 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 524, type: !632, scopeLine: 525, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!632 = !DISubroutineType(types: !633)
!633 = !{!28, !16, !28}
!634 = !DILocalVariable(name: "x_value", arg: 1, scope: !631, file: !69, line: 524, type: !16)
!635 = !DILocation(line: 524, column: 25, scope: !631)
!636 = !DILocalVariable(name: "y_value", arg: 2, scope: !631, file: !69, line: 524, type: !28)
!637 = !DILocation(line: 524, column: 38, scope: !631)
!638 = !DILocalVariable(name: "s32Temp1", scope: !631, file: !69, line: 526, type: !16)
!639 = !DILocation(line: 526, column: 6, scope: !631)
!640 = !DILocation(line: 527, column: 12, scope: !631)
!641 = !DILocation(line: 527, column: 20, scope: !631)
!642 = !DILocation(line: 527, column: 10, scope: !631)
!643 = !DILocation(line: 528, column: 6, scope: !644)
!644 = distinct !DILexicalBlock(scope: !631, file: !69, line: 528, column: 5)
!645 = !DILocation(line: 528, column: 14, scope: !644)
!646 = !DILocation(line: 528, column: 24, scope: !644)
!647 = !DILocation(line: 528, column: 5, scope: !631)
!648 = !DILocation(line: 530, column: 6, scope: !649)
!649 = distinct !DILexicalBlock(scope: !650, file: !69, line: 530, column: 6)
!650 = distinct !DILexicalBlock(scope: !644, file: !69, line: 529, column: 2)
!651 = !DILocation(line: 530, column: 14, scope: !649)
!652 = !DILocation(line: 530, column: 6, scope: !650)
!653 = !DILocation(line: 532, column: 4, scope: !654)
!654 = distinct !DILexicalBlock(scope: !649, file: !69, line: 531, column: 3)
!655 = !DILocation(line: 536, column: 4, scope: !656)
!656 = distinct !DILexicalBlock(scope: !649, file: !69, line: 535, column: 3)
!657 = !DILocation(line: 541, column: 15, scope: !658)
!658 = distinct !DILexicalBlock(scope: !644, file: !69, line: 540, column: 2)
!659 = !DILocation(line: 541, column: 27, scope: !658)
!660 = !DILocation(line: 541, column: 35, scope: !658)
!661 = !DILocation(line: 541, column: 34, scope: !658)
!662 = !DILocation(line: 541, column: 46, scope: !658)
!663 = !DILocation(line: 541, column: 44, scope: !658)
!664 = !DILocation(line: 541, column: 23, scope: !658)
!665 = !DILocation(line: 541, column: 56, scope: !658)
!666 = !DILocation(line: 541, column: 12, scope: !658)
!667 = !DILocation(line: 542, column: 15, scope: !658)
!668 = !DILocation(line: 542, column: 24, scope: !658)
!669 = !DILocation(line: 542, column: 23, scope: !658)
!670 = !DILocation(line: 542, column: 36, scope: !658)
!671 = !DILocation(line: 542, column: 44, scope: !658)
!672 = !DILocation(line: 542, column: 43, scope: !658)
!673 = !DILocation(line: 542, column: 33, scope: !658)
!674 = !DILocation(line: 542, column: 12, scope: !658)
!675 = !DILocation(line: 543, column: 6, scope: !676)
!676 = distinct !DILexicalBlock(scope: !658, file: !69, line: 543, column: 6)
!677 = !DILocation(line: 543, column: 15, scope: !676)
!678 = !DILocation(line: 543, column: 6, scope: !658)
!679 = !DILocation(line: 545, column: 7, scope: !680)
!680 = distinct !DILexicalBlock(scope: !681, file: !69, line: 545, column: 7)
!681 = distinct !DILexicalBlock(scope: !676, file: !69, line: 544, column: 3)
!682 = !DILocation(line: 545, column: 16, scope: !680)
!683 = !DILocation(line: 545, column: 7, scope: !681)
!684 = !DILocation(line: 547, column: 17, scope: !685)
!685 = distinct !DILexicalBlock(scope: !680, file: !69, line: 546, column: 4)
!686 = !DILocation(line: 547, column: 12, scope: !685)
!687 = !DILocation(line: 547, column: 5, scope: !685)
!688 = !DILocation(line: 551, column: 5, scope: !689)
!689 = distinct !DILexicalBlock(scope: !680, file: !69, line: 550, column: 4)
!690 = !DILocation(line: 556, column: 4, scope: !691)
!691 = distinct !DILexicalBlock(scope: !676, file: !69, line: 555, column: 3)
!692 = !DILocation(line: 559, column: 1, scope: !631)
!693 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 577, type: !694, scopeLine: 578, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!694 = !DISubroutineType(types: !695)
!695 = !{!28, !28, !28}
!696 = !DILocalVariable(name: "numerator", arg: 1, scope: !693, file: !69, line: 577, type: !28)
!697 = !DILocation(line: 577, column: 31, scope: !693)
!698 = !DILocalVariable(name: "denominator", arg: 2, scope: !693, file: !69, line: 577, type: !28)
!699 = !DILocation(line: 577, column: 46, scope: !693)
!700 = !DILocalVariable(name: "u32Temp", scope: !693, file: !69, line: 579, type: !596)
!701 = !DILocation(line: 579, column: 6, scope: !693)
!702 = !DILocation(line: 580, column: 5, scope: !703)
!703 = distinct !DILexicalBlock(scope: !693, file: !69, line: 580, column: 5)
!704 = !DILocation(line: 580, column: 17, scope: !703)
!705 = !DILocation(line: 580, column: 5, scope: !693)
!706 = !DILocation(line: 582, column: 3, scope: !707)
!707 = distinct !DILexicalBlock(scope: !703, file: !69, line: 581, column: 2)
!708 = !DILocation(line: 586, column: 14, scope: !709)
!709 = distinct !DILexicalBlock(scope: !703, file: !69, line: 585, column: 2)
!710 = !DILocation(line: 586, column: 23, scope: !709)
!711 = !DILocation(line: 586, column: 32, scope: !709)
!712 = !DILocation(line: 586, column: 44, scope: !709)
!713 = !DILocation(line: 586, column: 29, scope: !709)
!714 = !DILocation(line: 586, column: 11, scope: !709)
!715 = !DILocation(line: 587, column: 13, scope: !709)
!716 = !DILocation(line: 587, column: 21, scope: !709)
!717 = !DILocation(line: 587, column: 20, scope: !709)
!718 = !DILocation(line: 587, column: 11, scope: !709)
!719 = !DILocation(line: 588, column: 6, scope: !720)
!720 = distinct !DILexicalBlock(scope: !709, file: !69, line: 588, column: 6)
!721 = !DILocation(line: 588, column: 14, scope: !720)
!722 = !DILocation(line: 588, column: 6, scope: !709)
!723 = !DILocation(line: 590, column: 11, scope: !724)
!724 = distinct !DILexicalBlock(scope: !720, file: !69, line: 589, column: 3)
!725 = !DILocation(line: 590, column: 19, scope: !724)
!726 = !DILocation(line: 590, column: 4, scope: !724)
!727 = !DILocation(line: 594, column: 4, scope: !728)
!728 = distinct !DILexicalBlock(scope: !720, file: !69, line: 593, column: 3)
!729 = !DILocation(line: 598, column: 1, scope: !693)
!730 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 615, type: !731, scopeLine: 616, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!731 = !DISubroutineType(types: !732)
!732 = !{!28, !596, !28}
!733 = !DILocalVariable(name: "x_value", arg: 1, scope: !730, file: !69, line: 615, type: !596)
!734 = !DILocation(line: 615, column: 25, scope: !730)
!735 = !DILocalVariable(name: "y_value", arg: 2, scope: !730, file: !69, line: 615, type: !28)
!736 = !DILocation(line: 615, column: 38, scope: !730)
!737 = !DILocalVariable(name: "u32Temp1", scope: !730, file: !69, line: 617, type: !596)
!738 = !DILocation(line: 617, column: 6, scope: !730)
!739 = !DILocalVariable(name: "u32Temp2", scope: !730, file: !69, line: 617, type: !596)
!740 = !DILocation(line: 617, column: 17, scope: !730)
!741 = !DILocation(line: 618, column: 12, scope: !730)
!742 = !DILocation(line: 618, column: 20, scope: !730)
!743 = !DILocation(line: 618, column: 10, scope: !730)
!744 = !DILocation(line: 619, column: 5, scope: !745)
!745 = distinct !DILexicalBlock(scope: !730, file: !69, line: 619, column: 5)
!746 = !DILocation(line: 619, column: 13, scope: !745)
!747 = !DILocation(line: 619, column: 5, scope: !730)
!748 = !DILocation(line: 621, column: 3, scope: !749)
!749 = distinct !DILexicalBlock(scope: !745, file: !69, line: 620, column: 2)
!750 = !DILocation(line: 625, column: 14, scope: !751)
!751 = distinct !DILexicalBlock(scope: !745, file: !69, line: 624, column: 2)
!752 = !DILocation(line: 625, column: 22, scope: !751)
!753 = !DILocation(line: 625, column: 21, scope: !751)
!754 = !DILocation(line: 625, column: 12, scope: !751)
!755 = !DILocation(line: 626, column: 14, scope: !751)
!756 = !DILocation(line: 626, column: 25, scope: !751)
!757 = !DILocation(line: 626, column: 36, scope: !751)
!758 = !DILocation(line: 626, column: 34, scope: !751)
!759 = !DILocation(line: 626, column: 22, scope: !751)
!760 = !DILocation(line: 626, column: 45, scope: !751)
!761 = !DILocation(line: 626, column: 12, scope: !751)
!762 = !DILocation(line: 627, column: 15, scope: !751)
!763 = !DILocation(line: 627, column: 24, scope: !751)
!764 = !DILocation(line: 627, column: 23, scope: !751)
!765 = !DILocation(line: 627, column: 36, scope: !751)
!766 = !DILocation(line: 627, column: 44, scope: !751)
!767 = !DILocation(line: 627, column: 43, scope: !751)
!768 = !DILocation(line: 627, column: 33, scope: !751)
!769 = !DILocation(line: 627, column: 12, scope: !751)
!770 = !DILocation(line: 628, column: 6, scope: !771)
!771 = distinct !DILexicalBlock(scope: !751, file: !69, line: 628, column: 6)
!772 = !DILocation(line: 628, column: 15, scope: !771)
!773 = !DILocation(line: 628, column: 6, scope: !751)
!774 = !DILocation(line: 630, column: 11, scope: !775)
!775 = distinct !DILexicalBlock(scope: !771, file: !69, line: 629, column: 3)
!776 = !DILocation(line: 630, column: 20, scope: !775)
!777 = !DILocation(line: 630, column: 4, scope: !775)
!778 = !DILocation(line: 634, column: 4, scope: !779)
!779 = distinct !DILexicalBlock(scope: !771, file: !69, line: 633, column: 3)
!780 = !DILocation(line: 638, column: 1, scope: !730)
!781 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 657, type: !782, scopeLine: 658, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!782 = !DISubroutineType(types: !783)
!783 = !{!6, !6, !28, !6}
!784 = !DILocalVariable(name: "factor1", arg: 1, scope: !781, file: !69, line: 657, type: !6)
!785 = !DILocation(line: 657, column: 33, scope: !781)
!786 = !DILocalVariable(name: "factor2", arg: 2, scope: !781, file: !69, line: 657, type: !28)
!787 = !DILocation(line: 657, column: 46, scope: !781)
!788 = !DILocalVariable(name: "denominator", arg: 3, scope: !781, file: !69, line: 657, type: !6)
!789 = !DILocation(line: 657, column: 59, scope: !781)
!790 = !DILocalVariable(name: "s32Result", scope: !781, file: !69, line: 659, type: !16)
!791 = !DILocation(line: 659, column: 6, scope: !781)
!792 = !DILocalVariable(name: "s32Temp1", scope: !781, file: !69, line: 659, type: !16)
!793 = !DILocation(line: 659, column: 21, scope: !781)
!794 = !DILocation(line: 660, column: 14, scope: !781)
!795 = !DILocation(line: 660, column: 24, scope: !781)
!796 = !DILocation(line: 660, column: 22, scope: !781)
!797 = !DILocation(line: 660, column: 12, scope: !781)
!798 = !DILocation(line: 661, column: 5, scope: !799)
!799 = distinct !DILexicalBlock(scope: !781, file: !69, line: 661, column: 5)
!800 = !DILocation(line: 661, column: 17, scope: !799)
!801 = !DILocation(line: 661, column: 5, scope: !781)
!802 = !DILocation(line: 663, column: 6, scope: !803)
!803 = distinct !DILexicalBlock(scope: !804, file: !69, line: 663, column: 6)
!804 = distinct !DILexicalBlock(scope: !799, file: !69, line: 662, column: 2)
!805 = !DILocation(line: 663, column: 16, scope: !803)
!806 = !DILocation(line: 663, column: 6, scope: !804)
!807 = !DILocation(line: 665, column: 4, scope: !808)
!808 = distinct !DILexicalBlock(scope: !803, file: !69, line: 664, column: 3)
!809 = !DILocation(line: 669, column: 4, scope: !810)
!810 = distinct !DILexicalBlock(scope: !803, file: !69, line: 668, column: 3)
!811 = !DILocation(line: 674, column: 14, scope: !812)
!812 = distinct !DILexicalBlock(scope: !799, file: !69, line: 673, column: 2)
!813 = !DILocation(line: 674, column: 27, scope: !812)
!814 = !DILocation(line: 674, column: 37, scope: !812)
!815 = !DILocation(line: 674, column: 36, scope: !812)
!816 = !DILocation(line: 674, column: 50, scope: !812)
!817 = !DILocation(line: 674, column: 49, scope: !812)
!818 = !DILocation(line: 674, column: 24, scope: !812)
!819 = !DILocation(line: 674, column: 12, scope: !812)
!820 = !DILocation(line: 675, column: 14, scope: !812)
!821 = !DILocation(line: 675, column: 23, scope: !812)
!822 = !DILocation(line: 675, column: 12, scope: !812)
!823 = !DILocation(line: 676, column: 16, scope: !812)
!824 = !DILocation(line: 676, column: 25, scope: !812)
!825 = !DILocation(line: 676, column: 24, scope: !812)
!826 = !DILocation(line: 676, column: 41, scope: !812)
!827 = !DILocation(line: 676, column: 51, scope: !812)
!828 = !DILocation(line: 676, column: 50, scope: !812)
!829 = !DILocation(line: 676, column: 38, scope: !812)
!830 = !DILocation(line: 676, column: 13, scope: !812)
!831 = !DILocation(line: 677, column: 6, scope: !832)
!832 = distinct !DILexicalBlock(scope: !812, file: !69, line: 677, column: 6)
!833 = !DILocation(line: 677, column: 16, scope: !832)
!834 = !DILocation(line: 677, column: 6, scope: !812)
!835 = !DILocation(line: 679, column: 7, scope: !836)
!836 = distinct !DILexicalBlock(scope: !837, file: !69, line: 679, column: 7)
!837 = distinct !DILexicalBlock(scope: !832, file: !69, line: 678, column: 3)
!838 = !DILocation(line: 679, column: 17, scope: !836)
!839 = !DILocation(line: 679, column: 7, scope: !837)
!840 = !DILocation(line: 681, column: 17, scope: !841)
!841 = distinct !DILexicalBlock(scope: !836, file: !69, line: 680, column: 4)
!842 = !DILocation(line: 681, column: 12, scope: !841)
!843 = !DILocation(line: 681, column: 5, scope: !841)
!844 = !DILocation(line: 686, column: 5, scope: !845)
!845 = distinct !DILexicalBlock(scope: !836, file: !69, line: 685, column: 4)
!846 = !DILocation(line: 691, column: 4, scope: !847)
!847 = distinct !DILexicalBlock(scope: !832, file: !69, line: 690, column: 3)
!848 = !DILocation(line: 695, column: 1, scope: !781)
!849 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 713, type: !850, scopeLine: 714, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!850 = !DISubroutineType(types: !851)
!851 = !{!6, !28, !6, !28}
!852 = !DILocalVariable(name: "factor1", arg: 1, scope: !849, file: !69, line: 713, type: !28)
!853 = !DILocation(line: 713, column: 33, scope: !849)
!854 = !DILocalVariable(name: "factor2", arg: 2, scope: !849, file: !69, line: 713, type: !6)
!855 = !DILocation(line: 713, column: 46, scope: !849)
!856 = !DILocalVariable(name: "denominator", arg: 3, scope: !849, file: !69, line: 713, type: !28)
!857 = !DILocation(line: 713, column: 59, scope: !849)
!858 = !DILocalVariable(name: "s32Result", scope: !849, file: !69, line: 715, type: !16)
!859 = !DILocation(line: 715, column: 6, scope: !849)
!860 = !DILocalVariable(name: "s32Temp1", scope: !849, file: !69, line: 715, type: !16)
!861 = !DILocation(line: 715, column: 21, scope: !849)
!862 = !DILocation(line: 716, column: 14, scope: !849)
!863 = !DILocation(line: 716, column: 24, scope: !849)
!864 = !DILocation(line: 716, column: 22, scope: !849)
!865 = !DILocation(line: 716, column: 12, scope: !849)
!866 = !DILocation(line: 717, column: 5, scope: !867)
!867 = distinct !DILexicalBlock(scope: !849, file: !69, line: 717, column: 5)
!868 = !DILocation(line: 717, column: 16, scope: !867)
!869 = !DILocation(line: 717, column: 5, scope: !849)
!870 = !DILocation(line: 719, column: 6, scope: !871)
!871 = distinct !DILexicalBlock(scope: !872, file: !69, line: 719, column: 6)
!872 = distinct !DILexicalBlock(scope: !867, file: !69, line: 718, column: 2)
!873 = !DILocation(line: 719, column: 16, scope: !871)
!874 = !DILocation(line: 719, column: 6, scope: !872)
!875 = !DILocation(line: 721, column: 4, scope: !876)
!876 = distinct !DILexicalBlock(scope: !871, file: !69, line: 720, column: 3)
!877 = !DILocation(line: 725, column: 4, scope: !878)
!878 = distinct !DILexicalBlock(scope: !871, file: !69, line: 724, column: 3)
!879 = !DILocation(line: 730, column: 14, scope: !880)
!880 = distinct !DILexicalBlock(scope: !867, file: !69, line: 729, column: 2)
!881 = !DILocation(line: 730, column: 28, scope: !880)
!882 = !DILocation(line: 730, column: 38, scope: !880)
!883 = !DILocation(line: 730, column: 37, scope: !880)
!884 = !DILocation(line: 730, column: 53, scope: !880)
!885 = !DILocation(line: 730, column: 51, scope: !880)
!886 = !DILocation(line: 730, column: 24, scope: !880)
!887 = !DILocation(line: 730, column: 66, scope: !880)
!888 = !DILocation(line: 730, column: 12, scope: !880)
!889 = !DILocation(line: 731, column: 16, scope: !880)
!890 = !DILocation(line: 731, column: 25, scope: !880)
!891 = !DILocation(line: 731, column: 24, scope: !880)
!892 = !DILocation(line: 731, column: 41, scope: !880)
!893 = !DILocation(line: 731, column: 51, scope: !880)
!894 = !DILocation(line: 731, column: 50, scope: !880)
!895 = !DILocation(line: 731, column: 38, scope: !880)
!896 = !DILocation(line: 731, column: 13, scope: !880)
!897 = !DILocation(line: 732, column: 6, scope: !898)
!898 = distinct !DILexicalBlock(scope: !880, file: !69, line: 732, column: 6)
!899 = !DILocation(line: 732, column: 16, scope: !898)
!900 = !DILocation(line: 732, column: 6, scope: !880)
!901 = !DILocation(line: 734, column: 7, scope: !902)
!902 = distinct !DILexicalBlock(scope: !903, file: !69, line: 734, column: 7)
!903 = distinct !DILexicalBlock(scope: !898, file: !69, line: 733, column: 3)
!904 = !DILocation(line: 734, column: 17, scope: !902)
!905 = !DILocation(line: 734, column: 7, scope: !903)
!906 = !DILocation(line: 736, column: 17, scope: !907)
!907 = distinct !DILexicalBlock(scope: !902, file: !69, line: 735, column: 4)
!908 = !DILocation(line: 736, column: 12, scope: !907)
!909 = !DILocation(line: 736, column: 5, scope: !907)
!910 = !DILocation(line: 740, column: 5, scope: !911)
!911 = distinct !DILexicalBlock(scope: !902, file: !69, line: 739, column: 4)
!912 = !DILocation(line: 745, column: 4, scope: !913)
!913 = distinct !DILexicalBlock(scope: !898, file: !69, line: 744, column: 3)
!914 = !DILocation(line: 748, column: 1, scope: !849)
!915 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 767, type: !916, scopeLine: 768, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!916 = !DISubroutineType(types: !917)
!917 = !{!28, !6, !28, !6}
!918 = !DILocalVariable(name: "factor1", arg: 1, scope: !915, file: !69, line: 767, type: !6)
!919 = !DILocation(line: 767, column: 33, scope: !915)
!920 = !DILocalVariable(name: "factor2", arg: 2, scope: !915, file: !69, line: 767, type: !28)
!921 = !DILocation(line: 767, column: 46, scope: !915)
!922 = !DILocalVariable(name: "denominator", arg: 3, scope: !915, file: !69, line: 767, type: !6)
!923 = !DILocation(line: 767, column: 59, scope: !915)
!924 = !DILocalVariable(name: "u32Result", scope: !915, file: !69, line: 769, type: !596)
!925 = !DILocation(line: 769, column: 6, scope: !915)
!926 = !DILocalVariable(name: "u32Temp1", scope: !915, file: !69, line: 769, type: !596)
!927 = !DILocation(line: 769, column: 21, scope: !915)
!928 = !DILocalVariable(name: "s32Result", scope: !915, file: !69, line: 770, type: !16)
!929 = !DILocation(line: 770, column: 6, scope: !915)
!930 = !DILocalVariable(name: "s32Temp1", scope: !915, file: !69, line: 770, type: !16)
!931 = !DILocation(line: 770, column: 21, scope: !915)
!932 = !DILocation(line: 771, column: 14, scope: !915)
!933 = !DILocation(line: 771, column: 24, scope: !915)
!934 = !DILocation(line: 771, column: 22, scope: !915)
!935 = !DILocation(line: 771, column: 12, scope: !915)
!936 = !DILocation(line: 773, column: 5, scope: !937)
!937 = distinct !DILexicalBlock(scope: !915, file: !69, line: 773, column: 5)
!938 = !DILocation(line: 773, column: 17, scope: !937)
!939 = !DILocation(line: 773, column: 5, scope: !915)
!940 = !DILocation(line: 775, column: 6, scope: !941)
!941 = distinct !DILexicalBlock(scope: !942, file: !69, line: 775, column: 6)
!942 = distinct !DILexicalBlock(scope: !937, file: !69, line: 774, column: 2)
!943 = !DILocation(line: 775, column: 16, scope: !941)
!944 = !DILocation(line: 775, column: 6, scope: !942)
!945 = !DILocation(line: 777, column: 4, scope: !946)
!946 = distinct !DILexicalBlock(scope: !941, file: !69, line: 776, column: 3)
!947 = !DILocation(line: 781, column: 4, scope: !948)
!948 = distinct !DILexicalBlock(scope: !941, file: !69, line: 780, column: 3)
!949 = !DILocation(line: 786, column: 15, scope: !950)
!950 = distinct !DILexicalBlock(scope: !937, file: !69, line: 785, column: 2)
!951 = !DILocation(line: 786, column: 29, scope: !950)
!952 = !DILocation(line: 786, column: 39, scope: !950)
!953 = !DILocation(line: 786, column: 38, scope: !950)
!954 = !DILocation(line: 786, column: 54, scope: !950)
!955 = !DILocation(line: 786, column: 52, scope: !950)
!956 = !DILocation(line: 786, column: 25, scope: !950)
!957 = !DILocation(line: 786, column: 68, scope: !950)
!958 = !DILocation(line: 786, column: 12, scope: !950)
!959 = !DILocation(line: 787, column: 16, scope: !950)
!960 = !DILocation(line: 787, column: 25, scope: !950)
!961 = !DILocation(line: 787, column: 24, scope: !950)
!962 = !DILocation(line: 787, column: 41, scope: !950)
!963 = !DILocation(line: 787, column: 51, scope: !950)
!964 = !DILocation(line: 787, column: 50, scope: !950)
!965 = !DILocation(line: 787, column: 38, scope: !950)
!966 = !DILocation(line: 787, column: 13, scope: !950)
!967 = !DILocation(line: 788, column: 6, scope: !968)
!968 = distinct !DILexicalBlock(scope: !950, file: !69, line: 788, column: 6)
!969 = !DILocation(line: 788, column: 16, scope: !968)
!970 = !DILocation(line: 788, column: 6, scope: !950)
!971 = !DILocation(line: 790, column: 7, scope: !972)
!972 = distinct !DILexicalBlock(scope: !973, file: !69, line: 790, column: 7)
!973 = distinct !DILexicalBlock(scope: !968, file: !69, line: 789, column: 3)
!974 = !DILocation(line: 790, column: 17, scope: !972)
!975 = !DILocation(line: 790, column: 7, scope: !973)
!976 = !DILocation(line: 792, column: 17, scope: !977)
!977 = distinct !DILexicalBlock(scope: !972, file: !69, line: 791, column: 4)
!978 = !DILocation(line: 792, column: 12, scope: !977)
!979 = !DILocation(line: 792, column: 5, scope: !977)
!980 = !DILocation(line: 796, column: 5, scope: !981)
!981 = distinct !DILexicalBlock(scope: !972, file: !69, line: 795, column: 4)
!982 = !DILocation(line: 801, column: 4, scope: !983)
!983 = distinct !DILexicalBlock(scope: !968, file: !69, line: 800, column: 3)
!984 = !DILocation(line: 804, column: 1, scope: !915)
!985 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 823, type: !986, scopeLine: 824, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!986 = !DISubroutineType(types: !987)
!987 = !{!28, !6, !28, !28}
!988 = !DILocalVariable(name: "factor1", arg: 1, scope: !985, file: !69, line: 823, type: !6)
!989 = !DILocation(line: 823, column: 33, scope: !985)
!990 = !DILocalVariable(name: "factor2", arg: 2, scope: !985, file: !69, line: 823, type: !28)
!991 = !DILocation(line: 823, column: 46, scope: !985)
!992 = !DILocalVariable(name: "denominator", arg: 3, scope: !985, file: !69, line: 823, type: !28)
!993 = !DILocation(line: 823, column: 59, scope: !985)
!994 = !DILocalVariable(name: "s32Result", scope: !985, file: !69, line: 825, type: !16)
!995 = !DILocation(line: 825, column: 6, scope: !985)
!996 = !DILocalVariable(name: "s32Temp1", scope: !985, file: !69, line: 825, type: !16)
!997 = !DILocation(line: 825, column: 21, scope: !985)
!998 = !DILocation(line: 826, column: 14, scope: !985)
!999 = !DILocation(line: 826, column: 24, scope: !985)
!1000 = !DILocation(line: 826, column: 22, scope: !985)
!1001 = !DILocation(line: 826, column: 12, scope: !985)
!1002 = !DILocation(line: 828, column: 5, scope: !1003)
!1003 = distinct !DILexicalBlock(scope: !985, file: !69, line: 828, column: 5)
!1004 = !DILocation(line: 828, column: 17, scope: !1003)
!1005 = !DILocation(line: 828, column: 5, scope: !985)
!1006 = !DILocation(line: 830, column: 6, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !1008, file: !69, line: 830, column: 6)
!1008 = distinct !DILexicalBlock(scope: !1003, file: !69, line: 829, column: 2)
!1009 = !DILocation(line: 830, column: 16, scope: !1007)
!1010 = !DILocation(line: 830, column: 6, scope: !1008)
!1011 = !DILocation(line: 832, column: 4, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !1007, file: !69, line: 831, column: 3)
!1013 = !DILocation(line: 836, column: 4, scope: !1014)
!1014 = distinct !DILexicalBlock(scope: !1007, file: !69, line: 835, column: 3)
!1015 = !DILocation(line: 841, column: 15, scope: !1016)
!1016 = distinct !DILexicalBlock(scope: !1003, file: !69, line: 840, column: 2)
!1017 = !DILocation(line: 841, column: 29, scope: !1016)
!1018 = !DILocation(line: 841, column: 39, scope: !1016)
!1019 = !DILocation(line: 841, column: 38, scope: !1016)
!1020 = !DILocation(line: 841, column: 54, scope: !1016)
!1021 = !DILocation(line: 841, column: 52, scope: !1016)
!1022 = !DILocation(line: 841, column: 25, scope: !1016)
!1023 = !DILocation(line: 841, column: 68, scope: !1016)
!1024 = !DILocation(line: 841, column: 12, scope: !1016)
!1025 = !DILocation(line: 842, column: 16, scope: !1016)
!1026 = !DILocation(line: 842, column: 25, scope: !1016)
!1027 = !DILocation(line: 842, column: 24, scope: !1016)
!1028 = !DILocation(line: 842, column: 41, scope: !1016)
!1029 = !DILocation(line: 842, column: 51, scope: !1016)
!1030 = !DILocation(line: 842, column: 50, scope: !1016)
!1031 = !DILocation(line: 842, column: 38, scope: !1016)
!1032 = !DILocation(line: 842, column: 13, scope: !1016)
!1033 = !DILocation(line: 843, column: 6, scope: !1034)
!1034 = distinct !DILexicalBlock(scope: !1016, file: !69, line: 843, column: 6)
!1035 = !DILocation(line: 843, column: 16, scope: !1034)
!1036 = !DILocation(line: 843, column: 6, scope: !1016)
!1037 = !DILocation(line: 845, column: 7, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1039, file: !69, line: 845, column: 7)
!1039 = distinct !DILexicalBlock(scope: !1034, file: !69, line: 844, column: 3)
!1040 = !DILocation(line: 845, column: 17, scope: !1038)
!1041 = !DILocation(line: 845, column: 7, scope: !1039)
!1042 = !DILocation(line: 847, column: 17, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !1038, file: !69, line: 846, column: 4)
!1044 = !DILocation(line: 847, column: 12, scope: !1043)
!1045 = !DILocation(line: 847, column: 5, scope: !1043)
!1046 = !DILocation(line: 851, column: 5, scope: !1047)
!1047 = distinct !DILexicalBlock(scope: !1038, file: !69, line: 850, column: 4)
!1048 = !DILocation(line: 856, column: 4, scope: !1049)
!1049 = distinct !DILexicalBlock(scope: !1034, file: !69, line: 855, column: 3)
!1050 = !DILocation(line: 860, column: 1, scope: !985)
!1051 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 878, type: !1052, scopeLine: 879, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1052 = !DISubroutineType(types: !1053)
!1053 = !{!28, !28, !28, !28}
!1054 = !DILocalVariable(name: "factor1", arg: 1, scope: !1051, file: !69, line: 878, type: !28)
!1055 = !DILocation(line: 878, column: 33, scope: !1051)
!1056 = !DILocalVariable(name: "factor2", arg: 2, scope: !1051, file: !69, line: 878, type: !28)
!1057 = !DILocation(line: 878, column: 46, scope: !1051)
!1058 = !DILocalVariable(name: "denominator", arg: 3, scope: !1051, file: !69, line: 878, type: !28)
!1059 = !DILocation(line: 878, column: 59, scope: !1051)
!1060 = !DILocalVariable(name: "u32Temp1", scope: !1051, file: !69, line: 880, type: !596)
!1061 = !DILocation(line: 880, column: 6, scope: !1051)
!1062 = !DILocalVariable(name: "u16TempDenom", scope: !1051, file: !69, line: 881, type: !28)
!1063 = !DILocation(line: 881, column: 6, scope: !1051)
!1064 = !DILocation(line: 883, column: 5, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1051, file: !69, line: 883, column: 5)
!1066 = !DILocation(line: 883, column: 17, scope: !1065)
!1067 = !DILocation(line: 883, column: 5, scope: !1051)
!1068 = !DILocation(line: 885, column: 3, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1065, file: !69, line: 884, column: 2)
!1070 = !DILocation(line: 889, column: 14, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1065, file: !69, line: 888, column: 2)
!1072 = !DILocation(line: 889, column: 24, scope: !1071)
!1073 = !DILocation(line: 889, column: 22, scope: !1071)
!1074 = !DILocation(line: 889, column: 12, scope: !1071)
!1075 = !DILocation(line: 890, column: 18, scope: !1071)
!1076 = !DILocation(line: 890, column: 30, scope: !1071)
!1077 = !DILocation(line: 890, column: 16, scope: !1071)
!1078 = !DILocation(line: 891, column: 14, scope: !1071)
!1079 = !DILocation(line: 891, column: 25, scope: !1071)
!1080 = !DILocation(line: 891, column: 23, scope: !1071)
!1081 = !DILocation(line: 891, column: 12, scope: !1071)
!1082 = !DILocation(line: 892, column: 14, scope: !1071)
!1083 = !DILocation(line: 892, column: 25, scope: !1071)
!1084 = !DILocation(line: 892, column: 23, scope: !1071)
!1085 = !DILocation(line: 892, column: 12, scope: !1071)
!1086 = !DILocation(line: 893, column: 6, scope: !1087)
!1087 = distinct !DILexicalBlock(scope: !1071, file: !69, line: 893, column: 6)
!1088 = !DILocation(line: 893, column: 15, scope: !1087)
!1089 = !DILocation(line: 893, column: 6, scope: !1071)
!1090 = !DILocation(line: 895, column: 12, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1087, file: !69, line: 894, column: 3)
!1092 = !DILocation(line: 895, column: 21, scope: !1091)
!1093 = !DILocation(line: 895, column: 11, scope: !1091)
!1094 = !DILocation(line: 895, column: 4, scope: !1091)
!1095 = !DILocation(line: 900, column: 4, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1087, file: !69, line: 899, column: 3)
!1097 = !DILocation(line: 905, column: 1, scope: !1051)
!1098 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 922, type: !1099, scopeLine: 923, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1099 = !DISubroutineType(types: !1100)
!1100 = !{!28, !28, !28, !596}
!1101 = !DILocalVariable(name: "factor1", arg: 1, scope: !1098, file: !69, line: 922, type: !28)
!1102 = !DILocation(line: 922, column: 33, scope: !1098)
!1103 = !DILocalVariable(name: "factor2", arg: 2, scope: !1098, file: !69, line: 922, type: !28)
!1104 = !DILocation(line: 922, column: 46, scope: !1098)
!1105 = !DILocalVariable(name: "denominator", arg: 3, scope: !1098, file: !69, line: 922, type: !596)
!1106 = !DILocation(line: 922, column: 59, scope: !1098)
!1107 = !DILocalVariable(name: "u32Temp1", scope: !1098, file: !69, line: 924, type: !596)
!1108 = !DILocation(line: 924, column: 6, scope: !1098)
!1109 = !DILocation(line: 925, column: 5, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1098, file: !69, line: 925, column: 5)
!1111 = !DILocation(line: 925, column: 17, scope: !1110)
!1112 = !DILocation(line: 925, column: 5, scope: !1098)
!1113 = !DILocation(line: 927, column: 3, scope: !1114)
!1114 = distinct !DILexicalBlock(scope: !1110, file: !69, line: 926, column: 2)
!1115 = !DILocation(line: 931, column: 15, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1110, file: !69, line: 930, column: 2)
!1117 = !DILocation(line: 931, column: 25, scope: !1116)
!1118 = !DILocation(line: 931, column: 23, scope: !1116)
!1119 = !DILocation(line: 931, column: 36, scope: !1116)
!1120 = !DILocation(line: 931, column: 34, scope: !1116)
!1121 = !DILocation(line: 931, column: 12, scope: !1116)
!1122 = !DILocation(line: 932, column: 8, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1116, file: !69, line: 932, column: 6)
!1124 = !DILocation(line: 932, column: 18, scope: !1123)
!1125 = !DILocation(line: 932, column: 16, scope: !1123)
!1126 = !DILocation(line: 932, column: 28, scope: !1123)
!1127 = !DILocation(line: 932, column: 40, scope: !1123)
!1128 = !DILocation(line: 932, column: 39, scope: !1123)
!1129 = !DILocation(line: 932, column: 26, scope: !1123)
!1130 = !DILocation(line: 932, column: 53, scope: !1123)
!1131 = !DILocation(line: 932, column: 64, scope: !1123)
!1132 = !DILocation(line: 932, column: 50, scope: !1123)
!1133 = !DILocation(line: 932, column: 6, scope: !1116)
!1134 = !DILocation(line: 934, column: 12, scope: !1135)
!1135 = distinct !DILexicalBlock(scope: !1123, file: !69, line: 933, column: 3)
!1136 = !DILocation(line: 935, column: 3, scope: !1135)
!1137 = !DILocation(line: 936, column: 6, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1116, file: !69, line: 936, column: 6)
!1139 = !DILocation(line: 936, column: 15, scope: !1138)
!1140 = !DILocation(line: 936, column: 6, scope: !1116)
!1141 = !DILocation(line: 938, column: 12, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1138, file: !69, line: 937, column: 3)
!1143 = !DILocation(line: 938, column: 21, scope: !1142)
!1144 = !DILocation(line: 938, column: 11, scope: !1142)
!1145 = !DILocation(line: 938, column: 4, scope: !1142)
!1146 = !DILocation(line: 942, column: 4, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !1138, file: !69, line: 941, column: 3)
!1148 = !DILocation(line: 945, column: 1, scope: !1098)
!1149 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 962, type: !1150, scopeLine: 963, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1150 = !DISubroutineType(types: !1151)
!1151 = !{!596, !596, !28}
!1152 = !DILocalVariable(name: "x_value", arg: 1, scope: !1149, file: !69, line: 962, type: !596)
!1153 = !DILocation(line: 962, column: 25, scope: !1149)
!1154 = !DILocalVariable(name: "y_value", arg: 2, scope: !1149, file: !69, line: 962, type: !28)
!1155 = !DILocation(line: 962, column: 38, scope: !1149)
!1156 = !DILocalVariable(name: "u32Temp1", scope: !1149, file: !69, line: 964, type: !596)
!1157 = !DILocation(line: 964, column: 6, scope: !1149)
!1158 = !DILocation(line: 965, column: 5, scope: !1159)
!1159 = distinct !DILexicalBlock(scope: !1149, file: !69, line: 965, column: 5)
!1160 = !DILocation(line: 965, column: 13, scope: !1159)
!1161 = !DILocation(line: 965, column: 5, scope: !1149)
!1162 = !DILocation(line: 967, column: 3, scope: !1163)
!1163 = distinct !DILexicalBlock(scope: !1159, file: !69, line: 966, column: 2)
!1164 = !DILocation(line: 971, column: 15, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1159, file: !69, line: 970, column: 2)
!1166 = !DILocation(line: 971, column: 26, scope: !1165)
!1167 = !DILocation(line: 971, column: 34, scope: !1165)
!1168 = !DILocation(line: 971, column: 33, scope: !1165)
!1169 = !DILocation(line: 971, column: 45, scope: !1165)
!1170 = !DILocation(line: 971, column: 43, scope: !1165)
!1171 = !DILocation(line: 971, column: 23, scope: !1165)
!1172 = !DILocation(line: 971, column: 54, scope: !1165)
!1173 = !DILocation(line: 971, column: 12, scope: !1165)
!1174 = !DILocation(line: 972, column: 15, scope: !1165)
!1175 = !DILocation(line: 972, column: 23, scope: !1165)
!1176 = !DILocation(line: 972, column: 22, scope: !1165)
!1177 = !DILocation(line: 972, column: 35, scope: !1165)
!1178 = !DILocation(line: 972, column: 44, scope: !1165)
!1179 = !DILocation(line: 972, column: 43, scope: !1165)
!1180 = !DILocation(line: 972, column: 32, scope: !1165)
!1181 = !DILocation(line: 972, column: 12, scope: !1165)
!1182 = !DILocation(line: 973, column: 10, scope: !1165)
!1183 = !DILocation(line: 973, column: 3, scope: !1165)
!1184 = !DILocation(line: 975, column: 1, scope: !1149)
!1185 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 993, type: !1186, scopeLine: 994, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1186 = !DISubroutineType(types: !1187)
!1187 = !{!6, !6, !6, !6}
!1188 = !DILocalVariable(name: "fak1", arg: 1, scope: !1185, file: !69, line: 993, type: !6)
!1189 = !DILocation(line: 993, column: 33, scope: !1185)
!1190 = !DILocalVariable(name: "fak2", arg: 2, scope: !1185, file: !69, line: 993, type: !6)
!1191 = !DILocation(line: 993, column: 43, scope: !1185)
!1192 = !DILocalVariable(name: "div", arg: 3, scope: !1185, file: !69, line: 993, type: !6)
!1193 = !DILocation(line: 993, column: 53, scope: !1185)
!1194 = !DILocalVariable(name: "s32Temp1", scope: !1185, file: !69, line: 995, type: !16)
!1195 = !DILocation(line: 995, column: 6, scope: !1185)
!1196 = !DILocalVariable(name: "s32Temp2", scope: !1185, file: !69, line: 995, type: !16)
!1197 = !DILocation(line: 995, column: 20, scope: !1185)
!1198 = !DILocalVariable(name: "s32Temp3", scope: !1185, file: !69, line: 995, type: !16)
!1199 = !DILocation(line: 995, column: 34, scope: !1185)
!1200 = !DILocation(line: 996, column: 13, scope: !1185)
!1201 = !DILocation(line: 996, column: 20, scope: !1185)
!1202 = !DILocation(line: 996, column: 18, scope: !1185)
!1203 = !DILocation(line: 996, column: 11, scope: !1185)
!1204 = !DILocation(line: 997, column: 5, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1185, file: !69, line: 997, column: 5)
!1206 = !DILocation(line: 997, column: 9, scope: !1205)
!1207 = !DILocation(line: 997, column: 5, scope: !1185)
!1208 = !DILocation(line: 999, column: 6, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1210, file: !69, line: 999, column: 6)
!1210 = distinct !DILexicalBlock(scope: !1205, file: !69, line: 998, column: 2)
!1211 = !DILocation(line: 999, column: 15, scope: !1209)
!1212 = !DILocation(line: 999, column: 6, scope: !1210)
!1213 = !DILocation(line: 1001, column: 4, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1209, file: !69, line: 1000, column: 3)
!1215 = !DILocation(line: 1005, column: 4, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1209, file: !69, line: 1004, column: 3)
!1217 = !DILocation(line: 1010, column: 15, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1205, file: !69, line: 1009, column: 2)
!1219 = !DILocation(line: 1010, column: 28, scope: !1218)
!1220 = !DILocation(line: 1010, column: 39, scope: !1218)
!1221 = !DILocation(line: 1010, column: 37, scope: !1218)
!1222 = !DILocation(line: 1010, column: 46, scope: !1218)
!1223 = !DILocation(line: 1010, column: 44, scope: !1218)
!1224 = !DILocation(line: 1010, column: 24, scope: !1218)
!1225 = !DILocation(line: 1010, column: 52, scope: !1218)
!1226 = !DILocation(line: 1010, column: 12, scope: !1218)
!1227 = !DILocation(line: 1011, column: 15, scope: !1218)
!1228 = !DILocation(line: 1011, column: 24, scope: !1218)
!1229 = !DILocation(line: 1011, column: 23, scope: !1218)
!1230 = !DILocation(line: 1011, column: 32, scope: !1218)
!1231 = !DILocation(line: 1011, column: 41, scope: !1218)
!1232 = !DILocation(line: 1011, column: 40, scope: !1218)
!1233 = !DILocation(line: 1011, column: 29, scope: !1218)
!1234 = !DILocation(line: 1011, column: 12, scope: !1218)
!1235 = !DILocation(line: 1012, column: 6, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1218, file: !69, line: 1012, column: 6)
!1237 = !DILocation(line: 1012, column: 15, scope: !1236)
!1238 = !DILocation(line: 1012, column: 6, scope: !1218)
!1239 = !DILocation(line: 1014, column: 7, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1241, file: !69, line: 1014, column: 7)
!1241 = distinct !DILexicalBlock(scope: !1236, file: !69, line: 1013, column: 3)
!1242 = !DILocation(line: 1014, column: 16, scope: !1240)
!1243 = !DILocation(line: 1014, column: 7, scope: !1241)
!1244 = !DILocation(line: 1016, column: 17, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1240, file: !69, line: 1015, column: 4)
!1246 = !DILocation(line: 1016, column: 12, scope: !1245)
!1247 = !DILocation(line: 1016, column: 5, scope: !1245)
!1248 = !DILocation(line: 1020, column: 5, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1240, file: !69, line: 1019, column: 4)
!1250 = !DILocation(line: 1025, column: 4, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1236, file: !69, line: 1024, column: 3)
!1252 = !DILocation(line: 1028, column: 1, scope: !1185)
!1253 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1046, type: !1254, scopeLine: 1047, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1254 = !DISubroutineType(types: !1255)
!1255 = !{!6, !6, !6, !28}
!1256 = !DILocalVariable(name: "data1", arg: 1, scope: !1253, file: !69, line: 1046, type: !6)
!1257 = !DILocation(line: 1046, column: 33, scope: !1253)
!1258 = !DILocalVariable(name: "data2", arg: 2, scope: !1253, file: !69, line: 1046, type: !6)
!1259 = !DILocation(line: 1046, column: 43, scope: !1253)
!1260 = !DILocalVariable(name: "denominator", arg: 3, scope: !1253, file: !69, line: 1046, type: !28)
!1261 = !DILocation(line: 1046, column: 53, scope: !1253)
!1262 = !DILocalVariable(name: "s32Result", scope: !1253, file: !69, line: 1048, type: !16)
!1263 = !DILocation(line: 1048, column: 6, scope: !1253)
!1264 = !DILocalVariable(name: "s32Temp1", scope: !1253, file: !69, line: 1048, type: !16)
!1265 = !DILocation(line: 1048, column: 21, scope: !1253)
!1266 = !DILocation(line: 1049, column: 14, scope: !1253)
!1267 = !DILocation(line: 1049, column: 22, scope: !1253)
!1268 = !DILocation(line: 1049, column: 20, scope: !1253)
!1269 = !DILocation(line: 1049, column: 12, scope: !1253)
!1270 = !DILocation(line: 1051, column: 5, scope: !1271)
!1271 = distinct !DILexicalBlock(scope: !1253, file: !69, line: 1051, column: 5)
!1272 = !DILocation(line: 1051, column: 17, scope: !1271)
!1273 = !DILocation(line: 1051, column: 5, scope: !1253)
!1274 = !DILocation(line: 1053, column: 6, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1276, file: !69, line: 1053, column: 6)
!1276 = distinct !DILexicalBlock(scope: !1271, file: !69, line: 1052, column: 2)
!1277 = !DILocation(line: 1053, column: 16, scope: !1275)
!1278 = !DILocation(line: 1053, column: 6, scope: !1276)
!1279 = !DILocation(line: 1055, column: 4, scope: !1280)
!1280 = distinct !DILexicalBlock(scope: !1275, file: !69, line: 1054, column: 3)
!1281 = !DILocation(line: 1057, column: 11, scope: !1282)
!1282 = distinct !DILexicalBlock(scope: !1275, file: !69, line: 1057, column: 11)
!1283 = !DILocation(line: 1057, column: 21, scope: !1282)
!1284 = !DILocation(line: 1057, column: 11, scope: !1275)
!1285 = !DILocation(line: 1059, column: 4, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1282, file: !69, line: 1058, column: 3)
!1287 = !DILocation(line: 1063, column: 4, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1282, file: !69, line: 1062, column: 3)
!1289 = !DILocation(line: 1068, column: 15, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1271, file: !69, line: 1067, column: 2)
!1291 = !DILocation(line: 1068, column: 28, scope: !1290)
!1292 = !DILocation(line: 1068, column: 38, scope: !1290)
!1293 = !DILocation(line: 1068, column: 37, scope: !1290)
!1294 = !DILocation(line: 1068, column: 51, scope: !1290)
!1295 = !DILocation(line: 1068, column: 50, scope: !1290)
!1296 = !DILocation(line: 1068, column: 25, scope: !1290)
!1297 = !DILocation(line: 1068, column: 64, scope: !1290)
!1298 = !DILocation(line: 1068, column: 12, scope: !1290)
!1299 = !DILocation(line: 1069, column: 16, scope: !1290)
!1300 = !DILocation(line: 1069, column: 25, scope: !1290)
!1301 = !DILocation(line: 1069, column: 24, scope: !1290)
!1302 = !DILocation(line: 1069, column: 41, scope: !1290)
!1303 = !DILocation(line: 1069, column: 51, scope: !1290)
!1304 = !DILocation(line: 1069, column: 50, scope: !1290)
!1305 = !DILocation(line: 1069, column: 38, scope: !1290)
!1306 = !DILocation(line: 1069, column: 13, scope: !1290)
!1307 = !DILocation(line: 1070, column: 6, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1290, file: !69, line: 1070, column: 6)
!1309 = !DILocation(line: 1070, column: 16, scope: !1308)
!1310 = !DILocation(line: 1070, column: 6, scope: !1290)
!1311 = !DILocation(line: 1072, column: 7, scope: !1312)
!1312 = distinct !DILexicalBlock(scope: !1313, file: !69, line: 1072, column: 7)
!1313 = distinct !DILexicalBlock(scope: !1308, file: !69, line: 1071, column: 3)
!1314 = !DILocation(line: 1072, column: 17, scope: !1312)
!1315 = !DILocation(line: 1072, column: 7, scope: !1313)
!1316 = !DILocation(line: 1074, column: 17, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1312, file: !69, line: 1073, column: 4)
!1318 = !DILocation(line: 1074, column: 12, scope: !1317)
!1319 = !DILocation(line: 1074, column: 5, scope: !1317)
!1320 = !DILocation(line: 1078, column: 5, scope: !1321)
!1321 = distinct !DILexicalBlock(scope: !1312, file: !69, line: 1077, column: 4)
!1322 = !DILocation(line: 1083, column: 4, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1308, file: !69, line: 1082, column: 3)
!1324 = !DILocation(line: 1087, column: 1, scope: !1253)
!1325 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1104, type: !1326, scopeLine: 1105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1326 = !DISubroutineType(types: !1327)
!1327 = !{!596, !596, !16}
!1328 = !DILocalVariable(name: "numerator", arg: 1, scope: !1325, file: !69, line: 1104, type: !596)
!1329 = !DILocation(line: 1104, column: 25, scope: !1325)
!1330 = !DILocalVariable(name: "denominator", arg: 2, scope: !1325, file: !69, line: 1104, type: !16)
!1331 = !DILocation(line: 1104, column: 40, scope: !1325)
!1332 = !DILocalVariable(name: "u32Temp1", scope: !1325, file: !69, line: 1106, type: !596)
!1333 = !DILocation(line: 1106, column: 6, scope: !1325)
!1334 = !DILocation(line: 1107, column: 5, scope: !1335)
!1335 = distinct !DILexicalBlock(scope: !1325, file: !69, line: 1107, column: 5)
!1336 = !DILocation(line: 1107, column: 17, scope: !1335)
!1337 = !DILocation(line: 1107, column: 5, scope: !1325)
!1338 = !DILocation(line: 1109, column: 3, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1335, file: !69, line: 1108, column: 2)
!1340 = !DILocation(line: 1113, column: 6, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1342, file: !69, line: 1113, column: 6)
!1342 = distinct !DILexicalBlock(scope: !1335, file: !69, line: 1112, column: 2)
!1343 = !DILocation(line: 1113, column: 18, scope: !1341)
!1344 = !DILocation(line: 1113, column: 6, scope: !1342)
!1345 = !DILocation(line: 1115, column: 4, scope: !1346)
!1346 = distinct !DILexicalBlock(scope: !1341, file: !69, line: 1114, column: 3)
!1347 = !DILocation(line: 1119, column: 16, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !1341, file: !69, line: 1118, column: 3)
!1349 = !DILocation(line: 1119, column: 30, scope: !1348)
!1350 = !DILocation(line: 1119, column: 40, scope: !1348)
!1351 = !DILocation(line: 1119, column: 39, scope: !1348)
!1352 = !DILocation(line: 1119, column: 55, scope: !1348)
!1353 = !DILocation(line: 1119, column: 53, scope: !1348)
!1354 = !DILocation(line: 1119, column: 26, scope: !1348)
!1355 = !DILocation(line: 1119, column: 68, scope: !1348)
!1356 = !DILocation(line: 1119, column: 13, scope: !1348)
!1357 = !DILocation(line: 1120, column: 16, scope: !1348)
!1358 = !DILocation(line: 1120, column: 25, scope: !1348)
!1359 = !DILocation(line: 1120, column: 24, scope: !1348)
!1360 = !DILocation(line: 1120, column: 41, scope: !1348)
!1361 = !DILocation(line: 1120, column: 51, scope: !1348)
!1362 = !DILocation(line: 1120, column: 50, scope: !1348)
!1363 = !DILocation(line: 1120, column: 38, scope: !1348)
!1364 = !DILocation(line: 1120, column: 13, scope: !1348)
!1365 = !DILocation(line: 1121, column: 11, scope: !1348)
!1366 = !DILocation(line: 1121, column: 4, scope: !1348)
!1367 = !DILocation(line: 1124, column: 1, scope: !1325)
!1368 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1141, type: !1369, scopeLine: 1142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1369 = !DISubroutineType(types: !1370)
!1370 = !{!596, !16, !596}
!1371 = !DILocalVariable(name: "numerator", arg: 1, scope: !1368, file: !69, line: 1141, type: !16)
!1372 = !DILocation(line: 1141, column: 25, scope: !1368)
!1373 = !DILocalVariable(name: "denominator", arg: 2, scope: !1368, file: !69, line: 1141, type: !596)
!1374 = !DILocation(line: 1141, column: 40, scope: !1368)
!1375 = !DILocalVariable(name: "s32Temp1", scope: !1368, file: !69, line: 1143, type: !16)
!1376 = !DILocation(line: 1143, column: 6, scope: !1368)
!1377 = !DILocation(line: 1144, column: 5, scope: !1378)
!1378 = distinct !DILexicalBlock(scope: !1368, file: !69, line: 1144, column: 5)
!1379 = !DILocation(line: 1144, column: 17, scope: !1378)
!1380 = !DILocation(line: 1144, column: 5, scope: !1368)
!1381 = !DILocation(line: 1146, column: 6, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1383, file: !69, line: 1146, column: 6)
!1383 = distinct !DILexicalBlock(scope: !1378, file: !69, line: 1145, column: 2)
!1384 = !DILocation(line: 1146, column: 16, scope: !1382)
!1385 = !DILocation(line: 1146, column: 6, scope: !1383)
!1386 = !DILocation(line: 1148, column: 4, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1382, file: !69, line: 1147, column: 3)
!1388 = !DILocation(line: 1152, column: 4, scope: !1389)
!1389 = distinct !DILexicalBlock(scope: !1382, file: !69, line: 1151, column: 3)
!1390 = !DILocation(line: 1157, column: 6, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1392, file: !69, line: 1157, column: 6)
!1392 = distinct !DILexicalBlock(scope: !1378, file: !69, line: 1156, column: 2)
!1393 = !DILocation(line: 1157, column: 16, scope: !1391)
!1394 = !DILocation(line: 1157, column: 6, scope: !1392)
!1395 = !DILocation(line: 1159, column: 17, scope: !1396)
!1396 = distinct !DILexicalBlock(scope: !1391, file: !69, line: 1158, column: 3)
!1397 = !DILocation(line: 1159, column: 31, scope: !1396)
!1398 = !DILocation(line: 1159, column: 41, scope: !1396)
!1399 = !DILocation(line: 1159, column: 40, scope: !1396)
!1400 = !DILocation(line: 1159, column: 56, scope: !1396)
!1401 = !DILocation(line: 1159, column: 54, scope: !1396)
!1402 = !DILocation(line: 1159, column: 27, scope: !1396)
!1403 = !DILocation(line: 1159, column: 69, scope: !1396)
!1404 = !DILocation(line: 1159, column: 13, scope: !1396)
!1405 = !DILocation(line: 1160, column: 13, scope: !1396)
!1406 = !DILocation(line: 1160, column: 23, scope: !1396)
!1407 = !DILocation(line: 1160, column: 22, scope: !1396)
!1408 = !DILocation(line: 1160, column: 39, scope: !1396)
!1409 = !DILocation(line: 1160, column: 48, scope: !1396)
!1410 = !DILocation(line: 1160, column: 47, scope: !1396)
!1411 = !DILocation(line: 1160, column: 36, scope: !1396)
!1412 = !DILocation(line: 1160, column: 4, scope: !1396)
!1413 = !DILocation(line: 1164, column: 4, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1391, file: !69, line: 1163, column: 3)
!1415 = !DILocation(line: 1167, column: 1, scope: !1368)
!1416 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1184, type: !1417, scopeLine: 1185, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1417 = !DISubroutineType(types: !1418)
!1418 = !{!596, !16, !16}
!1419 = !DILocalVariable(name: "numerator", arg: 1, scope: !1416, file: !69, line: 1184, type: !16)
!1420 = !DILocation(line: 1184, column: 25, scope: !1416)
!1421 = !DILocalVariable(name: "denominator", arg: 2, scope: !1416, file: !69, line: 1184, type: !16)
!1422 = !DILocation(line: 1184, column: 40, scope: !1416)
!1423 = !DILocalVariable(name: "u32Temp1", scope: !1416, file: !69, line: 1186, type: !596)
!1424 = !DILocation(line: 1186, column: 6, scope: !1416)
!1425 = !DILocalVariable(name: "u32Temp2", scope: !1416, file: !69, line: 1186, type: !596)
!1426 = !DILocation(line: 1186, column: 20, scope: !1416)
!1427 = !DILocation(line: 1187, column: 5, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1416, file: !69, line: 1187, column: 5)
!1429 = !DILocation(line: 1187, column: 17, scope: !1428)
!1430 = !DILocation(line: 1187, column: 5, scope: !1416)
!1431 = !DILocation(line: 1189, column: 6, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1433, file: !69, line: 1189, column: 6)
!1433 = distinct !DILexicalBlock(scope: !1428, file: !69, line: 1188, column: 2)
!1434 = !DILocation(line: 1189, column: 16, scope: !1432)
!1435 = !DILocation(line: 1189, column: 6, scope: !1433)
!1436 = !DILocation(line: 1191, column: 4, scope: !1437)
!1437 = distinct !DILexicalBlock(scope: !1432, file: !69, line: 1190, column: 3)
!1438 = !DILocation(line: 1195, column: 4, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1432, file: !69, line: 1194, column: 3)
!1440 = !DILocation(line: 1200, column: 6, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1442, file: !69, line: 1200, column: 6)
!1442 = distinct !DILexicalBlock(scope: !1428, file: !69, line: 1199, column: 2)
!1443 = !DILocation(line: 1200, column: 16, scope: !1441)
!1444 = !DILocation(line: 1200, column: 6, scope: !1442)
!1445 = !DILocation(line: 1202, column: 7, scope: !1446)
!1446 = distinct !DILexicalBlock(scope: !1447, file: !69, line: 1202, column: 7)
!1447 = distinct !DILexicalBlock(scope: !1441, file: !69, line: 1201, column: 3)
!1448 = !DILocation(line: 1202, column: 17, scope: !1446)
!1449 = !DILocation(line: 1202, column: 7, scope: !1447)
!1450 = !DILocation(line: 1204, column: 5, scope: !1451)
!1451 = distinct !DILexicalBlock(scope: !1446, file: !69, line: 1203, column: 4)
!1452 = !DILocation(line: 1208, column: 8, scope: !1453)
!1453 = distinct !DILexicalBlock(scope: !1454, file: !69, line: 1208, column: 8)
!1454 = distinct !DILexicalBlock(scope: !1446, file: !69, line: 1207, column: 4)
!1455 = !DILocation(line: 1208, column: 20, scope: !1453)
!1456 = !DILocation(line: 1208, column: 8, scope: !1454)
!1457 = !DILocation(line: 1210, column: 6, scope: !1458)
!1458 = distinct !DILexicalBlock(scope: !1453, file: !69, line: 1209, column: 5)
!1459 = !DILocation(line: 1214, column: 18, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1453, file: !69, line: 1213, column: 5)
!1461 = !DILocation(line: 1214, column: 32, scope: !1460)
!1462 = !DILocation(line: 1214, column: 42, scope: !1460)
!1463 = !DILocation(line: 1214, column: 41, scope: !1460)
!1464 = !DILocation(line: 1214, column: 57, scope: !1460)
!1465 = !DILocation(line: 1214, column: 55, scope: !1460)
!1466 = !DILocation(line: 1214, column: 28, scope: !1460)
!1467 = !DILocation(line: 1214, column: 71, scope: !1460)
!1468 = !DILocation(line: 1214, column: 15, scope: !1460)
!1469 = !DILocation(line: 1215, column: 18, scope: !1460)
!1470 = !DILocation(line: 1215, column: 29, scope: !1460)
!1471 = !DILocation(line: 1215, column: 27, scope: !1460)
!1472 = !DILocation(line: 1215, column: 45, scope: !1460)
!1473 = !DILocation(line: 1215, column: 57, scope: !1460)
!1474 = !DILocation(line: 1215, column: 55, scope: !1460)
!1475 = !DILocation(line: 1215, column: 42, scope: !1460)
!1476 = !DILocation(line: 1215, column: 15, scope: !1460)
!1477 = !DILocation(line: 1216, column: 13, scope: !1460)
!1478 = !DILocation(line: 1216, column: 6, scope: !1460)
!1479 = !DILocation(line: 1222, column: 7, scope: !1480)
!1480 = distinct !DILexicalBlock(scope: !1481, file: !69, line: 1222, column: 7)
!1481 = distinct !DILexicalBlock(scope: !1441, file: !69, line: 1221, column: 3)
!1482 = !DILocation(line: 1222, column: 19, scope: !1480)
!1483 = !DILocation(line: 1222, column: 7, scope: !1481)
!1484 = !DILocation(line: 1224, column: 5, scope: !1485)
!1485 = distinct !DILexicalBlock(scope: !1480, file: !69, line: 1223, column: 4)
!1486 = !DILocation(line: 1228, column: 18, scope: !1487)
!1487 = distinct !DILexicalBlock(scope: !1480, file: !69, line: 1227, column: 4)
!1488 = !DILocation(line: 1228, column: 17, scope: !1487)
!1489 = !DILocation(line: 1228, column: 15, scope: !1487)
!1490 = !DILocation(line: 1229, column: 20, scope: !1487)
!1491 = !DILocation(line: 1229, column: 19, scope: !1487)
!1492 = !DILocation(line: 1229, column: 17, scope: !1487)
!1493 = !DILocation(line: 1230, column: 17, scope: !1487)
!1494 = !DILocation(line: 1230, column: 31, scope: !1487)
!1495 = !DILocation(line: 1230, column: 41, scope: !1487)
!1496 = !DILocation(line: 1230, column: 40, scope: !1487)
!1497 = !DILocation(line: 1230, column: 56, scope: !1487)
!1498 = !DILocation(line: 1230, column: 54, scope: !1487)
!1499 = !DILocation(line: 1230, column: 27, scope: !1487)
!1500 = !DILocation(line: 1230, column: 70, scope: !1487)
!1501 = !DILocation(line: 1230, column: 14, scope: !1487)
!1502 = !DILocation(line: 1231, column: 17, scope: !1487)
!1503 = !DILocation(line: 1231, column: 28, scope: !1487)
!1504 = !DILocation(line: 1231, column: 26, scope: !1487)
!1505 = !DILocation(line: 1231, column: 44, scope: !1487)
!1506 = !DILocation(line: 1231, column: 56, scope: !1487)
!1507 = !DILocation(line: 1231, column: 54, scope: !1487)
!1508 = !DILocation(line: 1231, column: 41, scope: !1487)
!1509 = !DILocation(line: 1231, column: 14, scope: !1487)
!1510 = !DILocation(line: 1232, column: 12, scope: !1487)
!1511 = !DILocation(line: 1232, column: 5, scope: !1487)
!1512 = !DILocation(line: 1237, column: 1, scope: !1416)
!1513 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1254, type: !1514, scopeLine: 1255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1514 = !DISubroutineType(types: !1515)
!1515 = !{!596, !596, !596}
!1516 = !DILocalVariable(name: "numerator", arg: 1, scope: !1513, file: !69, line: 1254, type: !596)
!1517 = !DILocation(line: 1254, column: 25, scope: !1513)
!1518 = !DILocalVariable(name: "denominator", arg: 2, scope: !1513, file: !69, line: 1254, type: !596)
!1519 = !DILocation(line: 1254, column: 40, scope: !1513)
!1520 = !DILocalVariable(name: "u32Temp1", scope: !1513, file: !69, line: 1257, type: !596)
!1521 = !DILocation(line: 1257, column: 6, scope: !1513)
!1522 = !DILocalVariable(name: "u32Temp2", scope: !1513, file: !69, line: 1257, type: !596)
!1523 = !DILocation(line: 1257, column: 20, scope: !1513)
!1524 = !DILocalVariable(name: "u32Temp3", scope: !1513, file: !69, line: 1257, type: !596)
!1525 = !DILocation(line: 1257, column: 34, scope: !1513)
!1526 = !DILocalVariable(name: "numerator_old", scope: !1513, file: !69, line: 1257, type: !596)
!1527 = !DILocation(line: 1257, column: 48, scope: !1513)
!1528 = !DILocation(line: 1258, column: 5, scope: !1529)
!1529 = distinct !DILexicalBlock(scope: !1513, file: !69, line: 1258, column: 5)
!1530 = !DILocation(line: 1258, column: 16, scope: !1529)
!1531 = !DILocation(line: 1258, column: 5, scope: !1513)
!1532 = !DILocation(line: 1260, column: 3, scope: !1533)
!1533 = distinct !DILexicalBlock(scope: !1529, file: !69, line: 1259, column: 2)
!1534 = !DILocation(line: 1264, column: 14, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1529, file: !69, line: 1263, column: 2)
!1536 = !DILocation(line: 1264, column: 26, scope: !1535)
!1537 = !DILocation(line: 1264, column: 41, scope: !1535)
!1538 = !DILocation(line: 1264, column: 51, scope: !1535)
!1539 = !DILocation(line: 1264, column: 50, scope: !1535)
!1540 = !DILocation(line: 1264, column: 38, scope: !1535)
!1541 = !DILocation(line: 1264, column: 24, scope: !1535)
!1542 = !DILocation(line: 1264, column: 12, scope: !1535)
!1543 = !DILocation(line: 1265, column: 7, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1535, file: !69, line: 1265, column: 6)
!1545 = !DILocation(line: 1265, column: 16, scope: !1544)
!1546 = !DILocation(line: 1265, column: 24, scope: !1544)
!1547 = !DILocation(line: 1265, column: 6, scope: !1535)
!1548 = !DILocation(line: 1267, column: 16, scope: !1549)
!1549 = distinct !DILexicalBlock(scope: !1544, file: !69, line: 1266, column: 3)
!1550 = !DILocation(line: 1267, column: 27, scope: !1549)
!1551 = !DILocation(line: 1267, column: 13, scope: !1549)
!1552 = !DILocation(line: 1268, column: 3, scope: !1549)
!1553 = !DILocation(line: 1271, column: 16, scope: !1554)
!1554 = distinct !DILexicalBlock(scope: !1544, file: !69, line: 1270, column: 3)
!1555 = !DILocation(line: 1271, column: 27, scope: !1554)
!1556 = !DILocation(line: 1271, column: 32, scope: !1554)
!1557 = !DILocation(line: 1271, column: 13, scope: !1554)
!1558 = !DILocation(line: 1274, column: 6, scope: !1559)
!1559 = distinct !DILexicalBlock(scope: !1535, file: !69, line: 1274, column: 6)
!1560 = !DILocation(line: 1274, column: 17, scope: !1559)
!1561 = !DILocation(line: 1274, column: 15, scope: !1559)
!1562 = !DILocation(line: 1274, column: 6, scope: !1535)
!1563 = !DILocation(line: 1276, column: 12, scope: !1564)
!1564 = distinct !DILexicalBlock(scope: !1559, file: !69, line: 1275, column: 3)
!1565 = !DILocation(line: 1276, column: 22, scope: !1564)
!1566 = !DILocation(line: 1276, column: 21, scope: !1564)
!1567 = !DILocation(line: 1276, column: 4, scope: !1564)
!1568 = !DILocation(line: 1280, column: 13, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1559, file: !69, line: 1279, column: 3)
!1570 = !DILocation(line: 1280, column: 23, scope: !1569)
!1571 = !DILocation(line: 1280, column: 22, scope: !1569)
!1572 = !DILocation(line: 1280, column: 36, scope: !1569)
!1573 = !DILocation(line: 1280, column: 4, scope: !1569)
!1574 = !DILocation(line: 1285, column: 1, scope: !1513)
!1575 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1302, type: !1576, scopeLine: 1303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1576 = !DISubroutineType(types: !1577)
!1577 = !{!16, !596, !16}
!1578 = !DILocalVariable(name: "numerator", arg: 1, scope: !1575, file: !69, line: 1302, type: !596)
!1579 = !DILocation(line: 1302, column: 25, scope: !1575)
!1580 = !DILocalVariable(name: "denominator", arg: 2, scope: !1575, file: !69, line: 1302, type: !16)
!1581 = !DILocation(line: 1302, column: 40, scope: !1575)
!1582 = !DILocalVariable(name: "u32Temp1", scope: !1575, file: !69, line: 1304, type: !596)
!1583 = !DILocation(line: 1304, column: 6, scope: !1575)
!1584 = !DILocalVariable(name: "u32Temp2", scope: !1575, file: !69, line: 1304, type: !596)
!1585 = !DILocation(line: 1304, column: 20, scope: !1575)
!1586 = !DILocation(line: 1305, column: 5, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1575, file: !69, line: 1305, column: 5)
!1588 = !DILocation(line: 1305, column: 17, scope: !1587)
!1589 = !DILocation(line: 1305, column: 5, scope: !1575)
!1590 = !DILocation(line: 1307, column: 6, scope: !1591)
!1591 = distinct !DILexicalBlock(scope: !1592, file: !69, line: 1307, column: 6)
!1592 = distinct !DILexicalBlock(scope: !1587, file: !69, line: 1306, column: 2)
!1593 = !DILocation(line: 1307, column: 18, scope: !1591)
!1594 = !DILocation(line: 1307, column: 6, scope: !1592)
!1595 = !DILocation(line: 1309, column: 4, scope: !1596)
!1596 = distinct !DILexicalBlock(scope: !1591, file: !69, line: 1308, column: 3)
!1597 = !DILocation(line: 1313, column: 19, scope: !1598)
!1598 = distinct !DILexicalBlock(scope: !1591, file: !69, line: 1312, column: 3)
!1599 = !DILocation(line: 1313, column: 18, scope: !1598)
!1600 = !DILocation(line: 1313, column: 16, scope: !1598)
!1601 = !DILocation(line: 1314, column: 16, scope: !1598)
!1602 = !DILocation(line: 1314, column: 30, scope: !1598)
!1603 = !DILocation(line: 1314, column: 40, scope: !1598)
!1604 = !DILocation(line: 1314, column: 39, scope: !1598)
!1605 = !DILocation(line: 1314, column: 55, scope: !1598)
!1606 = !DILocation(line: 1314, column: 53, scope: !1598)
!1607 = !DILocation(line: 1314, column: 26, scope: !1598)
!1608 = !DILocation(line: 1314, column: 69, scope: !1598)
!1609 = !DILocation(line: 1314, column: 13, scope: !1598)
!1610 = !DILocation(line: 1315, column: 16, scope: !1598)
!1611 = !DILocation(line: 1315, column: 25, scope: !1598)
!1612 = !DILocation(line: 1315, column: 24, scope: !1598)
!1613 = !DILocation(line: 1315, column: 41, scope: !1598)
!1614 = !DILocation(line: 1315, column: 51, scope: !1598)
!1615 = !DILocation(line: 1315, column: 50, scope: !1598)
!1616 = !DILocation(line: 1315, column: 38, scope: !1598)
!1617 = !DILocation(line: 1315, column: 13, scope: !1598)
!1618 = !DILocation(line: 1316, column: 7, scope: !1619)
!1619 = distinct !DILexicalBlock(scope: !1598, file: !69, line: 1316, column: 7)
!1620 = !DILocation(line: 1316, column: 16, scope: !1619)
!1621 = !DILocation(line: 1316, column: 7, scope: !1598)
!1622 = !DILocation(line: 1318, column: 13, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1619, file: !69, line: 1317, column: 4)
!1624 = !DILocation(line: 1318, column: 12, scope: !1623)
!1625 = !DILocation(line: 1318, column: 5, scope: !1623)
!1626 = !DILocation(line: 1322, column: 5, scope: !1627)
!1627 = distinct !DILexicalBlock(scope: !1619, file: !69, line: 1321, column: 4)
!1628 = !DILocation(line: 1328, column: 15, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1587, file: !69, line: 1327, column: 2)
!1630 = !DILocation(line: 1328, column: 29, scope: !1629)
!1631 = !DILocation(line: 1328, column: 39, scope: !1629)
!1632 = !DILocation(line: 1328, column: 38, scope: !1629)
!1633 = !DILocation(line: 1328, column: 54, scope: !1629)
!1634 = !DILocation(line: 1328, column: 52, scope: !1629)
!1635 = !DILocation(line: 1328, column: 25, scope: !1629)
!1636 = !DILocation(line: 1328, column: 68, scope: !1629)
!1637 = !DILocation(line: 1328, column: 12, scope: !1629)
!1638 = !DILocation(line: 1329, column: 15, scope: !1629)
!1639 = !DILocation(line: 1329, column: 24, scope: !1629)
!1640 = !DILocation(line: 1329, column: 23, scope: !1629)
!1641 = !DILocation(line: 1329, column: 40, scope: !1629)
!1642 = !DILocation(line: 1329, column: 50, scope: !1629)
!1643 = !DILocation(line: 1329, column: 49, scope: !1629)
!1644 = !DILocation(line: 1329, column: 37, scope: !1629)
!1645 = !DILocation(line: 1329, column: 12, scope: !1629)
!1646 = !DILocation(line: 1330, column: 6, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1629, file: !69, line: 1330, column: 6)
!1648 = !DILocation(line: 1330, column: 15, scope: !1647)
!1649 = !DILocation(line: 1330, column: 6, scope: !1629)
!1650 = !DILocation(line: 1332, column: 11, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1647, file: !69, line: 1331, column: 3)
!1652 = !DILocation(line: 1332, column: 4, scope: !1651)
!1653 = !DILocation(line: 1336, column: 4, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1647, file: !69, line: 1335, column: 3)
!1655 = !DILocation(line: 1339, column: 1, scope: !1575)
!1656 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1357, type: !1657, scopeLine: 1358, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1657 = !DISubroutineType(types: !1658)
!1658 = !{!16, !16, !596}
!1659 = !DILocalVariable(name: "numerator", arg: 1, scope: !1656, file: !69, line: 1357, type: !16)
!1660 = !DILocation(line: 1357, column: 25, scope: !1656)
!1661 = !DILocalVariable(name: "denominator", arg: 2, scope: !1656, file: !69, line: 1357, type: !596)
!1662 = !DILocation(line: 1357, column: 40, scope: !1656)
!1663 = !DILocalVariable(name: "s32Temp1", scope: !1656, file: !69, line: 1359, type: !16)
!1664 = !DILocation(line: 1359, column: 6, scope: !1656)
!1665 = !DILocalVariable(name: "s32Temp2", scope: !1656, file: !69, line: 1359, type: !16)
!1666 = !DILocation(line: 1359, column: 20, scope: !1656)
!1667 = !DILocalVariable(name: "u32Temp0", scope: !1656, file: !69, line: 1360, type: !596)
!1668 = !DILocation(line: 1360, column: 6, scope: !1656)
!1669 = !DILocalVariable(name: "u32Temp1", scope: !1656, file: !69, line: 1360, type: !596)
!1670 = !DILocation(line: 1360, column: 20, scope: !1656)
!1671 = !DILocalVariable(name: "u32Temp2", scope: !1656, file: !69, line: 1360, type: !596)
!1672 = !DILocation(line: 1360, column: 34, scope: !1656)
!1673 = !DILocation(line: 1361, column: 5, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1656, file: !69, line: 1361, column: 5)
!1675 = !DILocation(line: 1361, column: 17, scope: !1674)
!1676 = !DILocation(line: 1361, column: 5, scope: !1656)
!1677 = !DILocation(line: 1363, column: 6, scope: !1678)
!1678 = distinct !DILexicalBlock(scope: !1679, file: !69, line: 1363, column: 6)
!1679 = distinct !DILexicalBlock(scope: !1674, file: !69, line: 1362, column: 2)
!1680 = !DILocation(line: 1363, column: 16, scope: !1678)
!1681 = !DILocation(line: 1363, column: 6, scope: !1679)
!1682 = !DILocation(line: 1365, column: 4, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1678, file: !69, line: 1364, column: 3)
!1684 = !DILocation(line: 1369, column: 4, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1678, file: !69, line: 1368, column: 3)
!1686 = !DILocation(line: 1374, column: 6, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1688, file: !69, line: 1374, column: 6)
!1688 = distinct !DILexicalBlock(scope: !1674, file: !69, line: 1373, column: 2)
!1689 = !DILocation(line: 1374, column: 16, scope: !1687)
!1690 = !DILocation(line: 1374, column: 6, scope: !1688)
!1691 = !DILocation(line: 1376, column: 16, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1687, file: !69, line: 1375, column: 3)
!1693 = !DILocation(line: 1376, column: 15, scope: !1692)
!1694 = !DILocation(line: 1376, column: 13, scope: !1692)
!1695 = !DILocation(line: 1377, column: 16, scope: !1692)
!1696 = !DILocation(line: 1377, column: 25, scope: !1692)
!1697 = !DILocation(line: 1377, column: 24, scope: !1692)
!1698 = !DILocation(line: 1377, column: 13, scope: !1692)
!1699 = !DILocation(line: 1378, column: 15, scope: !1692)
!1700 = !DILocation(line: 1378, column: 28, scope: !1692)
!1701 = !DILocation(line: 1378, column: 37, scope: !1692)
!1702 = !DILocation(line: 1378, column: 36, scope: !1692)
!1703 = !DILocation(line: 1378, column: 52, scope: !1692)
!1704 = !DILocation(line: 1378, column: 50, scope: !1692)
!1705 = !DILocation(line: 1378, column: 24, scope: !1692)
!1706 = !DILocation(line: 1378, column: 13, scope: !1692)
!1707 = !DILocation(line: 1380, column: 8, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1692, file: !69, line: 1380, column: 7)
!1709 = !DILocation(line: 1380, column: 20, scope: !1708)
!1710 = !DILocation(line: 1380, column: 27, scope: !1708)
!1711 = !DILocation(line: 1380, column: 7, scope: !1692)
!1712 = !DILocation(line: 1382, column: 20, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1708, file: !69, line: 1381, column: 4)
!1714 = !DILocation(line: 1382, column: 32, scope: !1713)
!1715 = !DILocation(line: 1382, column: 17, scope: !1713)
!1716 = !DILocation(line: 1383, column: 4, scope: !1713)
!1717 = !DILocation(line: 1386, column: 20, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1708, file: !69, line: 1385, column: 4)
!1719 = !DILocation(line: 1386, column: 32, scope: !1718)
!1720 = !DILocation(line: 1386, column: 38, scope: !1718)
!1721 = !DILocation(line: 1386, column: 17, scope: !1718)
!1722 = !DILocation(line: 1390, column: 7, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1692, file: !69, line: 1390, column: 7)
!1724 = !DILocation(line: 1390, column: 18, scope: !1723)
!1725 = !DILocation(line: 1390, column: 16, scope: !1723)
!1726 = !DILocation(line: 1390, column: 7, scope: !1692)
!1727 = !DILocation(line: 1392, column: 14, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1723, file: !69, line: 1391, column: 4)
!1729 = !DILocation(line: 1392, column: 13, scope: !1728)
!1730 = !DILocation(line: 1392, column: 23, scope: !1728)
!1731 = !DILocation(line: 1392, column: 5, scope: !1728)
!1732 = !DILocation(line: 1396, column: 14, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1723, file: !69, line: 1395, column: 4)
!1734 = !DILocation(line: 1396, column: 23, scope: !1733)
!1735 = !DILocation(line: 1396, column: 12, scope: !1733)
!1736 = !DILocation(line: 1396, column: 27, scope: !1733)
!1737 = !DILocation(line: 1396, column: 5, scope: !1733)
!1738 = !DILocation(line: 1403, column: 16, scope: !1739)
!1739 = distinct !DILexicalBlock(scope: !1687, file: !69, line: 1402, column: 3)
!1740 = !DILocation(line: 1403, column: 30, scope: !1739)
!1741 = !DILocation(line: 1403, column: 40, scope: !1739)
!1742 = !DILocation(line: 1403, column: 39, scope: !1739)
!1743 = !DILocation(line: 1403, column: 55, scope: !1739)
!1744 = !DILocation(line: 1403, column: 53, scope: !1739)
!1745 = !DILocation(line: 1403, column: 26, scope: !1739)
!1746 = !DILocation(line: 1403, column: 69, scope: !1739)
!1747 = !DILocation(line: 1403, column: 13, scope: !1739)
!1748 = !DILocation(line: 1404, column: 16, scope: !1739)
!1749 = !DILocation(line: 1404, column: 26, scope: !1739)
!1750 = !DILocation(line: 1404, column: 25, scope: !1739)
!1751 = !DILocation(line: 1404, column: 42, scope: !1739)
!1752 = !DILocation(line: 1404, column: 51, scope: !1739)
!1753 = !DILocation(line: 1404, column: 50, scope: !1739)
!1754 = !DILocation(line: 1404, column: 39, scope: !1739)
!1755 = !DILocation(line: 1404, column: 13, scope: !1739)
!1756 = !DILocation(line: 1405, column: 11, scope: !1739)
!1757 = !DILocation(line: 1405, column: 4, scope: !1739)
!1758 = !DILocation(line: 1408, column: 1, scope: !1656)
!1759 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1425, type: !1760, scopeLine: 1426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1760 = !DISubroutineType(types: !1761)
!1761 = !{!16, !16, !16}
!1762 = !DILocalVariable(name: "numerator", arg: 1, scope: !1759, file: !69, line: 1425, type: !16)
!1763 = !DILocation(line: 1425, column: 25, scope: !1759)
!1764 = !DILocalVariable(name: "denominator", arg: 2, scope: !1759, file: !69, line: 1425, type: !16)
!1765 = !DILocation(line: 1425, column: 40, scope: !1759)
!1766 = !DILocalVariable(name: "s32Temp1", scope: !1759, file: !69, line: 1427, type: !16)
!1767 = !DILocation(line: 1427, column: 6, scope: !1759)
!1768 = !DILocalVariable(name: "s32Temp2", scope: !1759, file: !69, line: 1427, type: !16)
!1769 = !DILocation(line: 1427, column: 20, scope: !1759)
!1770 = !DILocalVariable(name: "denominator_prime", scope: !1759, file: !69, line: 1428, type: !596)
!1771 = !DILocation(line: 1428, column: 6, scope: !1759)
!1772 = !DILocalVariable(name: "u32Temp1", scope: !1759, file: !69, line: 1428, type: !596)
!1773 = !DILocation(line: 1428, column: 29, scope: !1759)
!1774 = !DILocalVariable(name: "u32Temp2", scope: !1759, file: !69, line: 1428, type: !596)
!1775 = !DILocation(line: 1428, column: 43, scope: !1759)
!1776 = !DILocalVariable(name: "u32numerator", scope: !1759, file: !69, line: 1429, type: !596)
!1777 = !DILocation(line: 1429, column: 6, scope: !1759)
!1778 = !DILocalVariable(name: "u32denominator", scope: !1759, file: !69, line: 1429, type: !596)
!1779 = !DILocation(line: 1429, column: 23, scope: !1759)
!1780 = !DILocation(line: 1430, column: 5, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1759, file: !69, line: 1430, column: 5)
!1782 = !DILocation(line: 1430, column: 15, scope: !1781)
!1783 = !DILocation(line: 1430, column: 5, scope: !1759)
!1784 = !DILocation(line: 1432, column: 6, scope: !1785)
!1785 = distinct !DILexicalBlock(scope: !1786, file: !69, line: 1432, column: 6)
!1786 = distinct !DILexicalBlock(scope: !1781, file: !69, line: 1431, column: 2)
!1787 = !DILocation(line: 1432, column: 18, scope: !1785)
!1788 = !DILocation(line: 1432, column: 6, scope: !1786)
!1789 = !DILocation(line: 1434, column: 7, scope: !1790)
!1790 = distinct !DILexicalBlock(scope: !1791, file: !69, line: 1434, column: 7)
!1791 = distinct !DILexicalBlock(scope: !1785, file: !69, line: 1433, column: 3)
!1792 = !DILocation(line: 1434, column: 19, scope: !1790)
!1793 = !DILocation(line: 1434, column: 7, scope: !1791)
!1794 = !DILocation(line: 1436, column: 5, scope: !1795)
!1795 = distinct !DILexicalBlock(scope: !1790, file: !69, line: 1435, column: 4)
!1796 = !DILocation(line: 1440, column: 21, scope: !1797)
!1797 = distinct !DILexicalBlock(scope: !1790, file: !69, line: 1439, column: 4)
!1798 = !DILocation(line: 1440, column: 20, scope: !1797)
!1799 = !DILocation(line: 1440, column: 18, scope: !1797)
!1800 = !DILocation(line: 1441, column: 23, scope: !1797)
!1801 = !DILocation(line: 1441, column: 22, scope: !1797)
!1802 = !DILocation(line: 1441, column: 20, scope: !1797)
!1803 = !DILocation(line: 1442, column: 16, scope: !1797)
!1804 = !DILocation(line: 1442, column: 33, scope: !1797)
!1805 = !DILocation(line: 1442, column: 46, scope: !1797)
!1806 = !DILocation(line: 1442, column: 45, scope: !1797)
!1807 = !DILocation(line: 1442, column: 64, scope: !1797)
!1808 = !DILocation(line: 1442, column: 62, scope: !1797)
!1809 = !DILocation(line: 1442, column: 29, scope: !1797)
!1810 = !DILocation(line: 1442, column: 81, scope: !1797)
!1811 = !DILocation(line: 1442, column: 14, scope: !1797)
!1812 = !DILocation(line: 1443, column: 17, scope: !1797)
!1813 = !DILocation(line: 1443, column: 30, scope: !1797)
!1814 = !DILocation(line: 1443, column: 29, scope: !1797)
!1815 = !DILocation(line: 1443, column: 49, scope: !1797)
!1816 = !DILocation(line: 1443, column: 58, scope: !1797)
!1817 = !DILocation(line: 1443, column: 57, scope: !1797)
!1818 = !DILocation(line: 1443, column: 46, scope: !1797)
!1819 = !DILocation(line: 1443, column: 14, scope: !1797)
!1820 = !DILocation(line: 1444, column: 8, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1797, file: !69, line: 1444, column: 8)
!1822 = !DILocation(line: 1444, column: 17, scope: !1821)
!1823 = !DILocation(line: 1444, column: 8, scope: !1797)
!1824 = !DILocation(line: 1446, column: 13, scope: !1825)
!1825 = distinct !DILexicalBlock(scope: !1821, file: !69, line: 1445, column: 5)
!1826 = !DILocation(line: 1446, column: 6, scope: !1825)
!1827 = !DILocation(line: 1450, column: 6, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1821, file: !69, line: 1449, column: 5)
!1829 = !DILocation(line: 1456, column: 20, scope: !1830)
!1830 = distinct !DILexicalBlock(scope: !1785, file: !69, line: 1455, column: 3)
!1831 = !DILocation(line: 1456, column: 19, scope: !1830)
!1832 = !DILocation(line: 1456, column: 29, scope: !1830)
!1833 = !DILocation(line: 1456, column: 17, scope: !1830)
!1834 = !DILocation(line: 1457, column: 16, scope: !1830)
!1835 = !DILocation(line: 1457, column: 33, scope: !1830)
!1836 = !DILocation(line: 1457, column: 46, scope: !1830)
!1837 = !DILocation(line: 1457, column: 45, scope: !1830)
!1838 = !DILocation(line: 1457, column: 61, scope: !1830)
!1839 = !DILocation(line: 1457, column: 59, scope: !1830)
!1840 = !DILocation(line: 1457, column: 29, scope: !1830)
!1841 = !DILocation(line: 1457, column: 75, scope: !1830)
!1842 = !DILocation(line: 1457, column: 13, scope: !1830)
!1843 = !DILocation(line: 1458, column: 16, scope: !1830)
!1844 = !DILocation(line: 1458, column: 29, scope: !1830)
!1845 = !DILocation(line: 1458, column: 28, scope: !1830)
!1846 = !DILocation(line: 1458, column: 45, scope: !1830)
!1847 = !DILocation(line: 1458, column: 54, scope: !1830)
!1848 = !DILocation(line: 1458, column: 53, scope: !1830)
!1849 = !DILocation(line: 1458, column: 42, scope: !1830)
!1850 = !DILocation(line: 1458, column: 13, scope: !1830)
!1851 = !DILocation(line: 1459, column: 13, scope: !1830)
!1852 = !DILocation(line: 1459, column: 12, scope: !1830)
!1853 = !DILocation(line: 1459, column: 22, scope: !1830)
!1854 = !DILocation(line: 1459, column: 4, scope: !1830)
!1855 = !DILocation(line: 1464, column: 6, scope: !1856)
!1856 = distinct !DILexicalBlock(scope: !1857, file: !69, line: 1464, column: 6)
!1857 = distinct !DILexicalBlock(scope: !1781, file: !69, line: 1463, column: 2)
!1858 = !DILocation(line: 1464, column: 18, scope: !1856)
!1859 = !DILocation(line: 1464, column: 6, scope: !1857)
!1860 = !DILocation(line: 1466, column: 7, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1862, file: !69, line: 1466, column: 7)
!1862 = distinct !DILexicalBlock(scope: !1856, file: !69, line: 1465, column: 3)
!1863 = !DILocation(line: 1466, column: 19, scope: !1861)
!1864 = !DILocation(line: 1466, column: 7, scope: !1862)
!1865 = !DILocation(line: 1468, column: 5, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1861, file: !69, line: 1467, column: 4)
!1867 = !DILocation(line: 1472, column: 23, scope: !1868)
!1868 = distinct !DILexicalBlock(scope: !1861, file: !69, line: 1471, column: 4)
!1869 = !DILocation(line: 1472, column: 22, scope: !1868)
!1870 = !DILocation(line: 1472, column: 35, scope: !1868)
!1871 = !DILocation(line: 1472, column: 20, scope: !1868)
!1872 = !DILocation(line: 1473, column: 17, scope: !1868)
!1873 = !DILocation(line: 1473, column: 31, scope: !1868)
!1874 = !DILocation(line: 1473, column: 41, scope: !1868)
!1875 = !DILocation(line: 1473, column: 40, scope: !1868)
!1876 = !DILocation(line: 1473, column: 59, scope: !1868)
!1877 = !DILocation(line: 1473, column: 57, scope: !1868)
!1878 = !DILocation(line: 1473, column: 27, scope: !1868)
!1879 = !DILocation(line: 1473, column: 76, scope: !1868)
!1880 = !DILocation(line: 1473, column: 14, scope: !1868)
!1881 = !DILocation(line: 1474, column: 17, scope: !1868)
!1882 = !DILocation(line: 1474, column: 27, scope: !1868)
!1883 = !DILocation(line: 1474, column: 26, scope: !1868)
!1884 = !DILocation(line: 1474, column: 46, scope: !1868)
!1885 = !DILocation(line: 1474, column: 55, scope: !1868)
!1886 = !DILocation(line: 1474, column: 54, scope: !1868)
!1887 = !DILocation(line: 1474, column: 43, scope: !1868)
!1888 = !DILocation(line: 1474, column: 14, scope: !1868)
!1889 = !DILocation(line: 1475, column: 14, scope: !1868)
!1890 = !DILocation(line: 1475, column: 13, scope: !1868)
!1891 = !DILocation(line: 1475, column: 23, scope: !1868)
!1892 = !DILocation(line: 1475, column: 5, scope: !1868)
!1893 = !DILocation(line: 1480, column: 16, scope: !1894)
!1894 = distinct !DILexicalBlock(scope: !1856, file: !69, line: 1479, column: 3)
!1895 = !DILocation(line: 1480, column: 30, scope: !1894)
!1896 = !DILocation(line: 1480, column: 40, scope: !1894)
!1897 = !DILocation(line: 1480, column: 39, scope: !1894)
!1898 = !DILocation(line: 1480, column: 55, scope: !1894)
!1899 = !DILocation(line: 1480, column: 53, scope: !1894)
!1900 = !DILocation(line: 1480, column: 26, scope: !1894)
!1901 = !DILocation(line: 1480, column: 69, scope: !1894)
!1902 = !DILocation(line: 1480, column: 13, scope: !1894)
!1903 = !DILocation(line: 1481, column: 16, scope: !1894)
!1904 = !DILocation(line: 1481, column: 26, scope: !1894)
!1905 = !DILocation(line: 1481, column: 25, scope: !1894)
!1906 = !DILocation(line: 1481, column: 42, scope: !1894)
!1907 = !DILocation(line: 1481, column: 51, scope: !1894)
!1908 = !DILocation(line: 1481, column: 50, scope: !1894)
!1909 = !DILocation(line: 1481, column: 39, scope: !1894)
!1910 = !DILocation(line: 1481, column: 13, scope: !1894)
!1911 = !DILocation(line: 1482, column: 11, scope: !1894)
!1912 = !DILocation(line: 1482, column: 4, scope: !1894)
!1913 = !DILocation(line: 1485, column: 1, scope: !1759)
!1914 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1503, type: !1915, scopeLine: 1504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1915 = !DISubroutineType(types: !1916)
!1916 = !{!6, !16, !596}
!1917 = !DILocalVariable(name: "numerator", arg: 1, scope: !1914, file: !69, line: 1503, type: !16)
!1918 = !DILocation(line: 1503, column: 25, scope: !1914)
!1919 = !DILocalVariable(name: "denominator", arg: 2, scope: !1914, file: !69, line: 1503, type: !596)
!1920 = !DILocation(line: 1503, column: 40, scope: !1914)
!1921 = !DILocalVariable(name: "numerator_prime", scope: !1914, file: !69, line: 1506, type: !596)
!1922 = !DILocation(line: 1506, column: 6, scope: !1914)
!1923 = !DILocalVariable(name: "u32Temp1", scope: !1914, file: !69, line: 1506, type: !596)
!1924 = !DILocation(line: 1506, column: 27, scope: !1914)
!1925 = !DILocalVariable(name: "u32Temp2", scope: !1914, file: !69, line: 1506, type: !596)
!1926 = !DILocation(line: 1506, column: 41, scope: !1914)
!1927 = !DILocalVariable(name: "u32Temp3", scope: !1914, file: !69, line: 1506, type: !596)
!1928 = !DILocation(line: 1506, column: 55, scope: !1914)
!1929 = !DILocalVariable(name: "s32Temp1", scope: !1914, file: !69, line: 1507, type: !16)
!1930 = !DILocation(line: 1507, column: 6, scope: !1914)
!1931 = !DILocalVariable(name: "s32Temp2", scope: !1914, file: !69, line: 1507, type: !16)
!1932 = !DILocation(line: 1507, column: 20, scope: !1914)
!1933 = !DILocalVariable(name: "s32Temp3", scope: !1914, file: !69, line: 1507, type: !16)
!1934 = !DILocation(line: 1507, column: 34, scope: !1914)
!1935 = !DILocation(line: 1508, column: 5, scope: !1936)
!1936 = distinct !DILexicalBlock(scope: !1914, file: !69, line: 1508, column: 5)
!1937 = !DILocation(line: 1508, column: 17, scope: !1936)
!1938 = !DILocation(line: 1508, column: 5, scope: !1914)
!1939 = !DILocation(line: 1510, column: 6, scope: !1940)
!1940 = distinct !DILexicalBlock(scope: !1941, file: !69, line: 1510, column: 6)
!1941 = distinct !DILexicalBlock(scope: !1936, file: !69, line: 1509, column: 2)
!1942 = !DILocation(line: 1510, column: 15, scope: !1940)
!1943 = !DILocation(line: 1510, column: 6, scope: !1941)
!1944 = !DILocation(line: 1512, column: 4, scope: !1945)
!1945 = distinct !DILexicalBlock(scope: !1940, file: !69, line: 1511, column: 3)
!1946 = !DILocation(line: 1516, column: 4, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1940, file: !69, line: 1515, column: 3)
!1948 = !DILocation(line: 1521, column: 6, scope: !1949)
!1949 = distinct !DILexicalBlock(scope: !1950, file: !69, line: 1521, column: 6)
!1950 = distinct !DILexicalBlock(scope: !1936, file: !69, line: 1520, column: 2)
!1951 = !DILocation(line: 1521, column: 16, scope: !1949)
!1952 = !DILocation(line: 1521, column: 6, scope: !1950)
!1953 = !DILocation(line: 1523, column: 23, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1949, file: !69, line: 1522, column: 3)
!1955 = !DILocation(line: 1523, column: 22, scope: !1954)
!1956 = !DILocation(line: 1523, column: 20, scope: !1954)
!1957 = !DILocation(line: 1524, column: 16, scope: !1954)
!1958 = !DILocation(line: 1524, column: 32, scope: !1954)
!1959 = !DILocation(line: 1524, column: 31, scope: !1954)
!1960 = !DILocation(line: 1524, column: 13, scope: !1954)
!1961 = !DILocation(line: 1525, column: 15, scope: !1954)
!1962 = !DILocation(line: 1525, column: 34, scope: !1954)
!1963 = !DILocation(line: 1525, column: 45, scope: !1954)
!1964 = !DILocation(line: 1525, column: 43, scope: !1954)
!1965 = !DILocation(line: 1525, column: 31, scope: !1954)
!1966 = !DILocation(line: 1525, column: 13, scope: !1954)
!1967 = !DILocation(line: 1527, column: 8, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1954, file: !69, line: 1527, column: 7)
!1969 = !DILocation(line: 1527, column: 20, scope: !1968)
!1970 = !DILocation(line: 1527, column: 27, scope: !1968)
!1971 = !DILocation(line: 1527, column: 7, scope: !1954)
!1972 = !DILocation(line: 1529, column: 19, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1968, file: !69, line: 1528, column: 4)
!1974 = !DILocation(line: 1529, column: 31, scope: !1973)
!1975 = !DILocation(line: 1529, column: 17, scope: !1973)
!1976 = !DILocation(line: 1530, column: 4, scope: !1973)
!1977 = !DILocation(line: 1533, column: 20, scope: !1978)
!1978 = distinct !DILexicalBlock(scope: !1968, file: !69, line: 1532, column: 4)
!1979 = !DILocation(line: 1533, column: 32, scope: !1978)
!1980 = !DILocation(line: 1533, column: 38, scope: !1978)
!1981 = !DILocation(line: 1533, column: 17, scope: !1978)
!1982 = !DILocation(line: 1536, column: 7, scope: !1983)
!1983 = distinct !DILexicalBlock(scope: !1954, file: !69, line: 1536, column: 7)
!1984 = !DILocation(line: 1536, column: 18, scope: !1983)
!1985 = !DILocation(line: 1536, column: 16, scope: !1983)
!1986 = !DILocation(line: 1536, column: 7, scope: !1954)
!1987 = !DILocation(line: 1538, column: 18, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1983, file: !69, line: 1537, column: 4)
!1989 = !DILocation(line: 1538, column: 16, scope: !1988)
!1990 = !DILocation(line: 1538, column: 28, scope: !1988)
!1991 = !DILocation(line: 1538, column: 14, scope: !1988)
!1992 = !DILocation(line: 1539, column: 4, scope: !1988)
!1993 = !DILocation(line: 1542, column: 18, scope: !1994)
!1994 = distinct !DILexicalBlock(scope: !1983, file: !69, line: 1541, column: 4)
!1995 = !DILocation(line: 1542, column: 26, scope: !1994)
!1996 = !DILocation(line: 1542, column: 16, scope: !1994)
!1997 = !DILocation(line: 1542, column: 30, scope: !1994)
!1998 = !DILocation(line: 1542, column: 14, scope: !1994)
!1999 = !DILocation(line: 1544, column: 8, scope: !2000)
!2000 = distinct !DILexicalBlock(scope: !1954, file: !69, line: 1544, column: 7)
!2001 = !DILocation(line: 1544, column: 18, scope: !2000)
!2002 = !DILocation(line: 1544, column: 7, scope: !1954)
!2003 = !DILocation(line: 1546, column: 18, scope: !2004)
!2004 = distinct !DILexicalBlock(scope: !2000, file: !69, line: 1545, column: 4)
!2005 = !DILocation(line: 1546, column: 12, scope: !2004)
!2006 = !DILocation(line: 1546, column: 5, scope: !2004)
!2007 = !DILocation(line: 1550, column: 5, scope: !2008)
!2008 = distinct !DILexicalBlock(scope: !2000, file: !69, line: 1549, column: 4)
!2009 = !DILocation(line: 1555, column: 16, scope: !2010)
!2010 = distinct !DILexicalBlock(scope: !1949, file: !69, line: 1554, column: 3)
!2011 = !DILocation(line: 1555, column: 26, scope: !2010)
!2012 = !DILocation(line: 1555, column: 25, scope: !2010)
!2013 = !DILocation(line: 1555, column: 41, scope: !2010)
!2014 = !DILocation(line: 1555, column: 39, scope: !2010)
!2015 = !DILocation(line: 1555, column: 13, scope: !2010)
!2016 = !DILocation(line: 1556, column: 16, scope: !2010)
!2017 = !DILocation(line: 1556, column: 30, scope: !2010)
!2018 = !DILocation(line: 1556, column: 40, scope: !2010)
!2019 = !DILocation(line: 1556, column: 39, scope: !2010)
!2020 = !DILocation(line: 1556, column: 55, scope: !2010)
!2021 = !DILocation(line: 1556, column: 53, scope: !2010)
!2022 = !DILocation(line: 1556, column: 26, scope: !2010)
!2023 = !DILocation(line: 1556, column: 68, scope: !2010)
!2024 = !DILocation(line: 1556, column: 13, scope: !2010)
!2025 = !DILocation(line: 1557, column: 16, scope: !2010)
!2026 = !DILocation(line: 1557, column: 25, scope: !2010)
!2027 = !DILocation(line: 1557, column: 24, scope: !2010)
!2028 = !DILocation(line: 1557, column: 41, scope: !2010)
!2029 = !DILocation(line: 1557, column: 51, scope: !2010)
!2030 = !DILocation(line: 1557, column: 50, scope: !2010)
!2031 = !DILocation(line: 1557, column: 38, scope: !2010)
!2032 = !DILocation(line: 1557, column: 13, scope: !2010)
!2033 = !DILocation(line: 1558, column: 7, scope: !2034)
!2034 = distinct !DILexicalBlock(scope: !2010, file: !69, line: 1558, column: 7)
!2035 = !DILocation(line: 1558, column: 16, scope: !2034)
!2036 = !DILocation(line: 1558, column: 7, scope: !2010)
!2037 = !DILocation(line: 1560, column: 17, scope: !2038)
!2038 = distinct !DILexicalBlock(scope: !2034, file: !69, line: 1559, column: 4)
!2039 = !DILocation(line: 1560, column: 12, scope: !2038)
!2040 = !DILocation(line: 1560, column: 5, scope: !2038)
!2041 = !DILocation(line: 1564, column: 5, scope: !2042)
!2042 = distinct !DILexicalBlock(scope: !2034, file: !69, line: 1563, column: 4)
!2043 = !DILocation(line: 1568, column: 1, scope: !1914)
!2044 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2045, file: !2045, line: 12, type: !2046, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2049)
!2045 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2046 = !DISubroutineType(types: !2047)
!2047 = !{null, !2048}
!2048 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2049 = !{!2050}
!2050 = !DILocalVariable(name: "z", arg: 1, scope: !2044, file: !2045, line: 12, type: !2048)
!2051 = !DILocation(line: 0, scope: !2044)
!2052 = !DILocation(line: 13, column: 9, scope: !2053)
!2053 = distinct !DILexicalBlock(scope: !2044, file: !2045, line: 13, column: 7)
!2054 = !DILocation(line: 13, column: 7, scope: !2044)
!2055 = !DILocation(line: 14, column: 5, scope: !2053)
!2056 = !DILocation(line: 15, column: 1, scope: !2044)
!2057 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2058, file: !2058, line: 20, type: !2059, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2062)
!2058 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2059 = !DISubroutineType(types: !2060)
!2060 = !{null, !2061, !2061}
!2061 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2062 = !{!2063, !2064}
!2063 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2057, file: !2058, line: 20, type: !2061)
!2064 = !DILocalVariable(name: "shift", arg: 2, scope: !2057, file: !2058, line: 20, type: !2061)
!2065 = !DILocation(line: 0, scope: !2057)
!2066 = !DILocation(line: 21, column: 13, scope: !2067)
!2067 = distinct !DILexicalBlock(scope: !2057, file: !2058, line: 21, column: 7)
!2068 = !DILocation(line: 21, column: 7, scope: !2057)
!2069 = !DILocation(line: 27, column: 5, scope: !2070)
!2070 = distinct !DILexicalBlock(scope: !2067, file: !2058, line: 21, column: 26)
!2071 = !DILocation(line: 29, column: 1, scope: !2057)
