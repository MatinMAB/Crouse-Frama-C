; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0036/build/s16_div_s32_s16_alarm_0036.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [111 x i8] c"KLEE-ALARM-0036: signed overflow. assert -2147483648 <= (s32)(s32Temp1 / (s32)denominator) * (s32)denominator;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0036.err\00", align 1
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
  br i1 %cmp92, label %if.then94, label %if.else130, !dbg !359

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
  %42 = load i16, i16* %denominator.addr, align 2, !dbg !370
  %conv100 = sext i16 %42 to i32, !dbg !371
  %int_cast_to_i649 = zext i32 %conv100 to i64, !dbg !372
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !372
  %div101 = sdiv i32 %41, %conv100, !dbg !372, !klee.check.div !106
  %conv102 = sext i32 %div101 to i64, !dbg !373
  %43 = load i16, i16* %denominator.addr, align 2, !dbg !374
  %conv103 = sext i16 %43 to i32, !dbg !375
  %conv104 = sext i32 %conv103 to i64, !dbg !376
  %call105 = call i32 @klee_alarm_s32_mul_upper(i64 %conv102, i64 %conv104), !dbg !377
  %tobool106 = icmp ne i32 %call105, 0, !dbg !377
  br i1 %tobool106, label %if.end108, label %if.then107, !dbg !378

if.then107:                                       ; preds = %if.end99
  store i16 0, i16* %retval, align 2, !dbg !379
  br label %return, !dbg !379

if.end108:                                        ; preds = %if.end99
  %44 = load i32, i32* %s32Temp1, align 4, !dbg !381
  %conv109 = sext i32 %44 to i64, !dbg !383
  %45 = load i16, i16* %denominator.addr, align 2, !dbg !384
  %conv110 = sext i16 %45 to i32, !dbg !385
  %conv111 = sext i32 %conv110 to i64, !dbg !386
  %call112 = call i32 @klee_alarm_s32_div_representable(i64 %conv109, i64 %conv111), !dbg !387
  %tobool113 = icmp ne i32 %call112, 0, !dbg !387
  br i1 %tobool113, label %if.end115, label %if.then114, !dbg !388

if.then114:                                       ; preds = %if.end108
  store i16 0, i16* %retval, align 2, !dbg !389
  br label %return, !dbg !389

if.end115:                                        ; preds = %if.end108
  %46 = load i32, i32* %s32Temp1, align 4, !dbg !391
  %47 = load i16, i16* %denominator.addr, align 2, !dbg !393
  %conv116 = sext i16 %47 to i32, !dbg !394
  %int_cast_to_i6410 = zext i32 %conv116 to i64, !dbg !395
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !395
  %div117 = sdiv i32 %46, %conv116, !dbg !395, !klee.check.div !106
  %conv118 = sext i32 %div117 to i64, !dbg !396
  %48 = load i16, i16* %denominator.addr, align 2, !dbg !397
  %conv119 = sext i16 %48 to i32, !dbg !398
  %conv120 = sext i32 %conv119 to i64, !dbg !399
  %call121 = call i32 @klee_alarm_s32_mul_lower(i64 %conv118, i64 %conv120), !dbg !400
  %tobool122 = icmp ne i32 %call121, 0, !dbg !400
  br i1 %tobool122, label %if.end124, label %if.then123, !dbg !401

if.then123:                                       ; preds = %if.end115
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 349, i8* getelementptr inbounds ([111 x i8], [111 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !402
  unreachable, !dbg !402

if.end124:                                        ; preds = %if.end115
  %49 = load i32, i32* %s32Temp1, align 4, !dbg !404
  %50 = load i16, i16* %denominator.addr, align 2, !dbg !405
  %conv125 = sext i16 %50 to i32, !dbg !406
  %int_cast_to_i6411 = zext i32 %conv125 to i64, !dbg !407
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !407
  %div126 = sdiv i32 %49, %conv125, !dbg !407, !klee.check.div !106
  %51 = load i16, i16* %denominator.addr, align 2, !dbg !408
  %conv127 = sext i16 %51 to i32, !dbg !409
  %mul128 = mul nsw i32 %div126, %conv127, !dbg !410
  %conv129 = sext i32 %mul128 to i64, !dbg !411
  store volatile i64 %conv129, i64* @klee_alarm_sink_s64, align 8, !dbg !412
  store i16 0, i16* %retval, align 2, !dbg !413
  br label %return, !dbg !413

if.else130:                                       ; preds = %if.else90
  store i16 32767, i16* %retval, align 2, !dbg !414
  br label %return, !dbg !414

return:                                           ; preds = %if.else130, %if.end124, %if.then114, %if.then107, %if.then98, %if.else89, %if.else88, %if.then86, %if.then77, %if.then69, %if.then61, %if.then54, %if.then44, %if.then35, %if.then26, %if.then16, %if.then10, %if.else, %if.then4
  %52 = load i16, i16* %retval, align 2, !dbg !416
  ret i16 %52, !dbg !416
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !417 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !420, metadata !DIExpression()), !dbg !421
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !422
  %cmp = icmp ne i64 %0, 0, !dbg !423
  %conv = zext i1 %cmp to i32, !dbg !423
  ret i32 %conv, !dbg !424
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !425 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !426, metadata !DIExpression()), !dbg !427
  %0 = load i64, i64* %left.addr, align 8, !dbg !428
  %cmp = icmp sge i64 %0, 0, !dbg !429
  %conv = zext i1 %cmp to i32, !dbg !429
  ret i32 %conv, !dbg !430
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !431 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !434, metadata !DIExpression()), !dbg !435
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !436, metadata !DIExpression()), !dbg !437
  %0 = load i32, i32* %count.addr, align 4, !dbg !438
  %cmp = icmp uge i32 %0, 63, !dbg !440
  br i1 %cmp, label %if.then, label %if.end, !dbg !441

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !442
  br label %return, !dbg !442

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !444
  %2 = load i32, i32* %count.addr, align 4, !dbg !445
  %sh_prom = zext i32 %2 to i64, !dbg !446
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !446
  %shl = shl i64 1, %sh_prom, !dbg !446, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !447
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !448
  %conv = zext i1 %cmp1 to i32, !dbg !448
  store i32 %conv, i32* %retval, align 4, !dbg !449
  br label %return, !dbg !449

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !450
  ret i32 %3, !dbg !450
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !451 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !454, metadata !DIExpression()), !dbg !455
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !456, metadata !DIExpression()), !dbg !457
  %0 = load i64, i64* %left.addr, align 8, !dbg !458
  %1 = load i64, i64* %right.addr, align 8, !dbg !459
  %mul = mul nsw i64 %0, %1, !dbg !460
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !461
  %conv = zext i1 %cmp to i32, !dbg !461
  ret i32 %conv, !dbg !462
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !463 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !464, metadata !DIExpression()), !dbg !465
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !466, metadata !DIExpression()), !dbg !467
  %0 = load i64, i64* %left.addr, align 8, !dbg !468
  %1 = load i64, i64* %right.addr, align 8, !dbg !469
  %mul = mul nsw i64 %0, %1, !dbg !470
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !471
  %conv = zext i1 %cmp to i32, !dbg !471
  ret i32 %conv, !dbg !472
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_lower(i64 %left, i64 %right) #0 !dbg !473 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !474, metadata !DIExpression()), !dbg !475
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !476, metadata !DIExpression()), !dbg !477
  %0 = load i64, i64* %left.addr, align 8, !dbg !478
  %1 = load i64, i64* %right.addr, align 8, !dbg !479
  %add = add nsw i64 %0, %1, !dbg !480
  %cmp = icmp sge i64 %add, -2147483648, !dbg !481
  %conv = zext i1 %cmp to i32, !dbg !481
  ret i32 %conv, !dbg !482
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !483 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !484, metadata !DIExpression()), !dbg !485
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !486, metadata !DIExpression()), !dbg !487
  %0 = load i64, i64* %left.addr, align 8, !dbg !488
  %1 = load i64, i64* %right.addr, align 8, !dbg !489
  %add = add nsw i64 %0, %1, !dbg !490
  %cmp = icmp sle i64 %add, 2147483647, !dbg !491
  %conv = zext i1 %cmp to i32, !dbg !491
  ret i32 %conv, !dbg !492
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_div_representable(i64 %numerator, i64 %denominator) #0 !dbg !493 {
entry:
  %numerator.addr = alloca i64, align 8
  %denominator.addr = alloca i64, align 8
  store i64 %numerator, i64* %numerator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %numerator.addr, metadata !494, metadata !DIExpression()), !dbg !495
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !496, metadata !DIExpression()), !dbg !497
  %0 = load i64, i64* %numerator.addr, align 8, !dbg !498
  %cmp = icmp eq i64 %0, -2147483648, !dbg !499
  %1 = load i64, i64* %denominator.addr, align 8, !dbg !500
  %cmp1 = icmp eq i64 %1, -1, !dbg !500
  %2 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !500
  %lnot = xor i1 %2, true, !dbg !501
  %lnot.ext = zext i1 %lnot to i32, !dbg !501
  ret i32 %lnot.ext, !dbg !502
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !503 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !506, metadata !DIExpression()), !dbg !507
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !508, metadata !DIExpression()), !dbg !509
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !510, metadata !DIExpression()), !dbg !511
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !512, metadata !DIExpression()), !dbg !513
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !514, metadata !DIExpression()), !dbg !515
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !516
  %conv = zext i16 %0 to i32, !dbg !516
  %and = and i32 %conv, 65535, !dbg !517
  %conv1 = trunc i32 %and to i16, !dbg !516
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !518
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !519
  %conv2 = sext i16 %1 to i32, !dbg !519
  %shl = shl i32 %conv2, 16, !dbg !520
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !521
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !522
  %conv3 = zext i16 %2 to i32, !dbg !522
  %cmp = icmp eq i32 %conv3, 0, !dbg !524
  br i1 %cmp, label %if.then, label %if.else9, !dbg !525

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !526
  %conv5 = sext i16 %3 to i32, !dbg !526
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !529
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !530

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !531
  br label %return, !dbg !531

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !533
  br label %return, !dbg !533

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !535
  %conv10 = sext i16 %4 to i32, !dbg !535
  %shl11 = shl i32 %conv10, 16, !dbg !537
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !538
  %conv12 = sext i16 %5 to i32, !dbg !538
  %shl13 = shl i32 %conv12, 16, !dbg !539
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !540
  %conv14 = zext i16 %6 to i32, !dbg !540
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !541
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !541
  %div = sdiv i32 %shl13, %conv14, !dbg !541, !klee.check.div !106
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !542
  %conv15 = zext i16 %7 to i32, !dbg !542
  %mul = mul nsw i32 %div, %conv15, !dbg !543
  %sub = sub nsw i32 %shl11, %mul, !dbg !544
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !545
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !546
  %shl16 = shl i32 %8, 1, !dbg !547
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !548
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !549
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !550
  %conv17 = zext i16 %10 to i32, !dbg !550
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !551
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !551
  %div18 = sdiv i32 %9, %conv17, !dbg !551, !klee.check.div !106
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !552
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !553
  %conv19 = sext i16 %11 to i32, !dbg !553
  %shl20 = shl i32 %conv19, 16, !dbg !554
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !555
  %conv21 = zext i16 %12 to i32, !dbg !555
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !556
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !556
  %div22 = sdiv i32 %shl20, %conv21, !dbg !556, !klee.check.div !106
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !557
  %add = add nsw i32 %div22, %13, !dbg !558
  store i32 %add, i32* %s32Temp1, align 4, !dbg !559
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !560
  %cmp23 = icmp slt i32 %14, 32767, !dbg !562
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !563

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !564
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !567
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !568

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !569
  %conv29 = trunc i32 %16 to i16, !dbg !571
  store i16 %conv29, i16* %retval, align 2, !dbg !572
  br label %return, !dbg !572

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !573
  br label %return, !dbg !573

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !575
  br label %return, !dbg !575

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !577
  ret i16 %17, !dbg !577
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !578 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !579, metadata !DIExpression()), !dbg !580
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !581, metadata !DIExpression()), !dbg !582
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !583, metadata !DIExpression()), !dbg !584
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !585, metadata !DIExpression()), !dbg !586
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !587
  %conv = zext i16 %0 to i32, !dbg !587
  %and = and i32 %conv, 65535, !dbg !588
  %conv1 = trunc i32 %and to i16, !dbg !587
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !589
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !590
  %conv2 = zext i16 %1 to i32, !dbg !590
  %cmp = icmp eq i32 %conv2, 0, !dbg !592
  br i1 %cmp, label %if.then, label %if.else8, !dbg !593

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !594
  %conv4 = sext i16 %2 to i32, !dbg !594
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !597
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !598

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !599
  br label %return, !dbg !599

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !601
  br label %return, !dbg !601

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !603
  %conv9 = sext i16 %3 to i32, !dbg !603
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !605
  %conv10 = sext i16 %4 to i32, !dbg !605
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !606
  %conv11 = zext i16 %5 to i32, !dbg !606
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !607
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !607
  %div = sdiv i32 %conv10, %conv11, !dbg !607, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !608
  %conv12 = zext i16 %6 to i32, !dbg !608
  %mul = mul nsw i32 %div, %conv12, !dbg !609
  %sub = sub nsw i32 %conv9, %mul, !dbg !610
  %shl = shl i32 %sub, 1, !dbg !611
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !612
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !613
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !614
  %conv13 = zext i16 %8 to i32, !dbg !614
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !615
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !615
  %div14 = sdiv i32 %7, %conv13, !dbg !615, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !616
  %conv15 = sext i16 %9 to i32, !dbg !616
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !617
  %conv16 = zext i16 %10 to i32, !dbg !617
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !618
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !618
  %div17 = sdiv i32 %conv15, %conv16, !dbg !618, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !619
  store i32 %add, i32* %s32Temp1, align 4, !dbg !620
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !621
  %conv18 = trunc i32 %11 to i16, !dbg !621
  store i16 %conv18, i16* %retval, align 2, !dbg !622
  br label %return, !dbg !622

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !623
  ret i16 %12, !dbg !623
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !624 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !627, metadata !DIExpression()), !dbg !628
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !629, metadata !DIExpression()), !dbg !630
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !631, metadata !DIExpression()), !dbg !633
  store i32 0, i32* %u32Temp1, align 4, !dbg !633
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !634, metadata !DIExpression()), !dbg !635
  store i32 0, i32* %u32Temp2, align 4, !dbg !635
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !636, metadata !DIExpression()), !dbg !637
  store i32 0, i32* %u32Temp3, align 4, !dbg !637
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !638
  %conv = zext i16 %0 to i32, !dbg !638
  %cmp = icmp eq i32 %conv, 0, !dbg !640
  br i1 %cmp, label %if.then, label %if.else, !dbg !641

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !642
  br label %return, !dbg !642

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !644
  %conv2 = zext i16 %1 to i32, !dbg !644
  %shl = shl i32 %conv2, 16, !dbg !646
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !647
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !648
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !649
  %conv3 = zext i16 %3 to i32, !dbg !649
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !650
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !650
  %div = udiv i32 %2, %conv3, !dbg !650, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !651
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !652
  %add = add i32 %4, 128, !dbg !653
  %shr = lshr i32 %add, 8, !dbg !654
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !655
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !656
  %cmp4 = icmp ult i32 %5, 255, !dbg !658
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !659

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !660
  %conv7 = trunc i32 %6 to i8, !dbg !662
  store i8 %conv7, i8* %retval, align 1, !dbg !663
  br label %return, !dbg !663

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !664
  br label %return, !dbg !664

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !666
  ret i8 %7, !dbg !666
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !667 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !670, metadata !DIExpression()), !dbg !671
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !672, metadata !DIExpression()), !dbg !673
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !674, metadata !DIExpression()), !dbg !675
  store i32 0, i32* %s32Temp1, align 4, !dbg !675
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !676
  %conv = zext i16 %0 to i32, !dbg !676
  %and = and i32 %conv, 65535, !dbg !677
  %conv1 = trunc i32 %and to i16, !dbg !676
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !678
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !679
  %conv2 = zext i16 %1 to i32, !dbg !679
  %and3 = and i32 %conv2, 65535, !dbg !681
  %cmp = icmp eq i32 %and3, 0, !dbg !682
  br i1 %cmp, label %if.then, label %if.else8, !dbg !683

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !684
  %cmp5 = icmp sge i32 %2, 0, !dbg !687
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !688

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !689
  br label %return, !dbg !689

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !691
  br label %return, !dbg !691

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !693
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !695
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !696
  %conv9 = zext i16 %5 to i32, !dbg !696
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !697
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !697
  %div = sdiv i32 %4, %conv9, !dbg !697, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !698
  %conv10 = zext i16 %6 to i32, !dbg !698
  %mul = mul nsw i32 %div, %conv10, !dbg !699
  %sub = sub nsw i32 %3, %mul, !dbg !700
  %shl = shl i32 %sub, 1, !dbg !701
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !702
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !703
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !704
  %conv11 = zext i16 %8 to i32, !dbg !704
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !705
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !705
  %div12 = sdiv i32 %7, %conv11, !dbg !705, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !706
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !707
  %conv13 = zext i16 %10 to i32, !dbg !707
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !708
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !708
  %div14 = sdiv i32 %9, %conv13, !dbg !708, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !709
  store i32 %add, i32* %s32Temp1, align 4, !dbg !710
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !711
  %cmp15 = icmp slt i32 %11, 65535, !dbg !713
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !714

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !715
  %cmp18 = icmp sgt i32 %12, 0, !dbg !718
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !719

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !720
  %conv21 = trunc i32 %13 to i16, !dbg !722
  store i16 %conv21, i16* %retval, align 2, !dbg !723
  br label %return, !dbg !723

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !724
  br label %return, !dbg !724

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !726
  br label %return, !dbg !726

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !728
  ret i16 %14, !dbg !728
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !729 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !732, metadata !DIExpression()), !dbg !733
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !734, metadata !DIExpression()), !dbg !735
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !736, metadata !DIExpression()), !dbg !737
  store i32 0, i32* %u32Temp, align 4, !dbg !737
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !738
  %conv = zext i16 %0 to i32, !dbg !738
  %cmp = icmp eq i32 %conv, 0, !dbg !740
  br i1 %cmp, label %if.then, label %if.else, !dbg !741

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !742
  br label %return, !dbg !742

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !744
  %conv2 = zext i16 %1 to i32, !dbg !744
  %shl = shl i32 %conv2, 16, !dbg !746
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !747
  %conv3 = zext i16 %2 to i32, !dbg !747
  %shr = ashr i32 %conv3, 1, !dbg !748
  %add = add nsw i32 %shl, %shr, !dbg !749
  store i32 %add, i32* %u32Temp, align 4, !dbg !750
  %3 = load i32, i32* %u32Temp, align 4, !dbg !751
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !752
  %conv4 = zext i16 %4 to i32, !dbg !752
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !753
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !753
  %div = udiv i32 %3, %conv4, !dbg !753, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !754
  %5 = load i32, i32* %u32Temp, align 4, !dbg !755
  %cmp5 = icmp ult i32 %5, 65535, !dbg !757
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !758

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !759
  %and = and i32 %6, 65535, !dbg !761
  %conv8 = trunc i32 %and to i16, !dbg !759
  store i16 %conv8, i16* %retval, align 2, !dbg !762
  br label %return, !dbg !762

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !763
  br label %return, !dbg !763

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !765
  ret i16 %7, !dbg !765
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !766 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !769, metadata !DIExpression()), !dbg !770
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !771, metadata !DIExpression()), !dbg !772
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !773, metadata !DIExpression()), !dbg !774
  store i32 0, i32* %u32Temp1, align 4, !dbg !774
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !775, metadata !DIExpression()), !dbg !776
  store i32 0, i32* %u32Temp2, align 4, !dbg !776
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !777
  %conv = zext i16 %0 to i32, !dbg !777
  %and = and i32 %conv, 65535, !dbg !778
  %conv1 = trunc i32 %and to i16, !dbg !777
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !779
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !780
  %conv2 = zext i16 %1 to i32, !dbg !780
  %cmp = icmp eq i32 %conv2, 0, !dbg !782
  br i1 %cmp, label %if.then, label %if.else, !dbg !783

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !784
  br label %return, !dbg !784

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !786
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !788
  %conv4 = zext i16 %3 to i32, !dbg !788
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !789
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !789
  %div = udiv i32 %2, %conv4, !dbg !789, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !790
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !791
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !792
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !793
  %conv5 = zext i16 %6 to i32, !dbg !793
  %mul = mul i32 %5, %conv5, !dbg !794
  %sub = sub i32 %4, %mul, !dbg !795
  %shl = shl i32 %sub, 1, !dbg !796
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !797
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !798
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !799
  %conv6 = zext i16 %8 to i32, !dbg !799
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !800
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !800
  %div7 = udiv i32 %7, %conv6, !dbg !800, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !801
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !802
  %conv8 = zext i16 %10 to i32, !dbg !802
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !803
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !803
  %div9 = udiv i32 %9, %conv8, !dbg !803, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !804
  store i32 %add, i32* %u32Temp2, align 4, !dbg !805
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !806
  %cmp10 = icmp ult i32 %11, 65535, !dbg !808
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !809

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !810
  %and13 = and i32 %12, 65535, !dbg !812
  %conv14 = trunc i32 %and13 to i16, !dbg !810
  store i16 %conv14, i16* %retval, align 2, !dbg !813
  br label %return, !dbg !813

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !814
  br label %return, !dbg !814

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !816
  ret i16 %13, !dbg !816
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !817 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !820, metadata !DIExpression()), !dbg !821
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !822, metadata !DIExpression()), !dbg !823
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !824, metadata !DIExpression()), !dbg !825
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !826, metadata !DIExpression()), !dbg !827
  store i32 0, i32* %s32Result, align 4, !dbg !827
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !828, metadata !DIExpression()), !dbg !829
  store i32 0, i32* %s32Temp1, align 4, !dbg !829
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !830
  %conv = sext i16 %0 to i32, !dbg !830
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !831
  %conv1 = zext i16 %1 to i32, !dbg !831
  %mul = mul nsw i32 %conv, %conv1, !dbg !832
  store i32 %mul, i32* %s32Result, align 4, !dbg !833
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !834
  %conv2 = sext i16 %2 to i32, !dbg !834
  %cmp = icmp eq i32 %conv2, 0, !dbg !836
  br i1 %cmp, label %if.then, label %if.else7, !dbg !837

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !838
  %cmp4 = icmp slt i32 %3, 0, !dbg !841
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !842

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !843
  br label %return, !dbg !843

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !845
  br label %return, !dbg !845

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !847
  %5 = load i32, i32* %s32Result, align 4, !dbg !849
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !850
  %conv8 = sext i16 %6 to i32, !dbg !850
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !851
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !851
  %div = sdiv i32 %5, %conv8, !dbg !851, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !852
  %conv9 = sext i16 %7 to i32, !dbg !852
  %mul10 = mul nsw i32 %div, %conv9, !dbg !853
  %sub = sub nsw i32 %4, %mul10, !dbg !854
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !855
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !856
  %shl = shl i32 %8, 1, !dbg !857
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !858
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !859
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !860
  %conv11 = sext i16 %10 to i32, !dbg !860
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !861
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !861
  %div12 = sdiv i32 %9, %conv11, !dbg !861, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !862
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !863
  %conv13 = sext i16 %12 to i32, !dbg !863
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !864
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !864
  %div14 = sdiv i32 %11, %conv13, !dbg !864, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !865
  store i32 %add, i32* %s32Result, align 4, !dbg !866
  %13 = load i32, i32* %s32Result, align 4, !dbg !867
  %cmp15 = icmp slt i32 %13, 32767, !dbg !869
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !870

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !871
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !874
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !875

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !876
  %conv21 = trunc i32 %15 to i16, !dbg !878
  store i16 %conv21, i16* %retval, align 2, !dbg !879
  br label %return, !dbg !879

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !880
  br label %return, !dbg !880

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !882
  br label %return, !dbg !882

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !884
  ret i16 %16, !dbg !884
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !885 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !888, metadata !DIExpression()), !dbg !889
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !890, metadata !DIExpression()), !dbg !891
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !892, metadata !DIExpression()), !dbg !893
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !894, metadata !DIExpression()), !dbg !895
  store i32 0, i32* %s32Result, align 4, !dbg !895
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !896, metadata !DIExpression()), !dbg !897
  store i32 0, i32* %s32Temp1, align 4, !dbg !897
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !898
  %conv = zext i16 %0 to i32, !dbg !898
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !899
  %conv1 = sext i16 %1 to i32, !dbg !899
  %mul = mul nsw i32 %conv, %conv1, !dbg !900
  store i32 %mul, i32* %s32Result, align 4, !dbg !901
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !902
  %conv2 = zext i16 %2 to i32, !dbg !902
  %cmp = icmp eq i32 %conv2, 0, !dbg !904
  br i1 %cmp, label %if.then, label %if.else7, !dbg !905

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !906
  %cmp4 = icmp slt i32 %3, 0, !dbg !909
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !910

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !911
  br label %return, !dbg !911

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !913
  br label %return, !dbg !913

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !915
  %5 = load i32, i32* %s32Result, align 4, !dbg !917
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !918
  %conv8 = zext i16 %6 to i32, !dbg !918
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !919
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !919
  %div = sdiv i32 %5, %conv8, !dbg !919, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !920
  %conv9 = zext i16 %7 to i32, !dbg !920
  %mul10 = mul nsw i32 %div, %conv9, !dbg !921
  %sub = sub nsw i32 %4, %mul10, !dbg !922
  %shl = shl i32 %sub, 1, !dbg !923
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !924
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !925
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !926
  %conv11 = zext i16 %9 to i32, !dbg !926
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !927
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !927
  %div12 = sdiv i32 %8, %conv11, !dbg !927, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !928
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !929
  %conv13 = zext i16 %11 to i32, !dbg !929
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !930
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !930
  %div14 = sdiv i32 %10, %conv13, !dbg !930, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !931
  store i32 %add, i32* %s32Result, align 4, !dbg !932
  %12 = load i32, i32* %s32Result, align 4, !dbg !933
  %cmp15 = icmp slt i32 %12, 32767, !dbg !935
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !936

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !937
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !940
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !941

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !942
  %conv21 = trunc i32 %14 to i16, !dbg !944
  store i16 %conv21, i16* %retval, align 2, !dbg !945
  br label %return, !dbg !945

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !946
  br label %return, !dbg !946

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !948
  br label %return, !dbg !948

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !950
  ret i16 %15, !dbg !950
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !951 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !954, metadata !DIExpression()), !dbg !955
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !956, metadata !DIExpression()), !dbg !957
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !958, metadata !DIExpression()), !dbg !959
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !960, metadata !DIExpression()), !dbg !961
  store i32 0, i32* %u32Result, align 4, !dbg !961
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !962, metadata !DIExpression()), !dbg !963
  store i32 0, i32* %u32Temp1, align 4, !dbg !963
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !964, metadata !DIExpression()), !dbg !965
  store i32 0, i32* %s32Result, align 4, !dbg !965
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !966, metadata !DIExpression()), !dbg !967
  store i32 0, i32* %s32Temp1, align 4, !dbg !967
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !968
  %conv = sext i16 %0 to i32, !dbg !968
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !969
  %conv1 = zext i16 %1 to i32, !dbg !969
  %mul = mul nsw i32 %conv, %conv1, !dbg !970
  store i32 %mul, i32* %s32Result, align 4, !dbg !971
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !972
  %conv2 = sext i16 %2 to i32, !dbg !972
  %cmp = icmp eq i32 %conv2, 0, !dbg !974
  br i1 %cmp, label %if.then, label %if.else7, !dbg !975

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !976
  %cmp4 = icmp sge i32 %3, 0, !dbg !979
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !980

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !981
  br label %return, !dbg !981

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !983
  br label %return, !dbg !983

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !985
  %5 = load i32, i32* %s32Result, align 4, !dbg !987
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !988
  %conv8 = sext i16 %6 to i32, !dbg !988
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !989
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !989
  %div = sdiv i32 %5, %conv8, !dbg !989, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !990
  %conv9 = sext i16 %7 to i32, !dbg !990
  %mul10 = mul nsw i32 %div, %conv9, !dbg !991
  %sub = sub nsw i32 %4, %mul10, !dbg !992
  %shl = shl i32 %sub, 1, !dbg !993
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !994
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !995
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !996
  %conv11 = sext i16 %9 to i32, !dbg !996
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !997
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !997
  %div12 = sdiv i32 %8, %conv11, !dbg !997, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !998
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !999
  %conv13 = sext i16 %11 to i32, !dbg !999
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1000
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1000
  %div14 = sdiv i32 %10, %conv13, !dbg !1000, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1001
  store i32 %add, i32* %s32Result, align 4, !dbg !1002
  %12 = load i32, i32* %s32Result, align 4, !dbg !1003
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1005
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1006

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1007
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1010
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1011

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1012
  %conv21 = trunc i32 %14 to i16, !dbg !1014
  store i16 %conv21, i16* %retval, align 2, !dbg !1015
  br label %return, !dbg !1015

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1016
  br label %return, !dbg !1016

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1018
  br label %return, !dbg !1018

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1020
  ret i16 %15, !dbg !1020
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1021 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1024, metadata !DIExpression()), !dbg !1025
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1026, metadata !DIExpression()), !dbg !1027
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1028, metadata !DIExpression()), !dbg !1029
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1030, metadata !DIExpression()), !dbg !1031
  store i32 0, i32* %s32Result, align 4, !dbg !1031
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1032, metadata !DIExpression()), !dbg !1033
  store i32 0, i32* %s32Temp1, align 4, !dbg !1033
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !1034
  %conv = sext i16 %0 to i32, !dbg !1034
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !1035
  %conv1 = zext i16 %1 to i32, !dbg !1035
  %mul = mul nsw i32 %conv, %conv1, !dbg !1036
  store i32 %mul, i32* %s32Result, align 4, !dbg !1037
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1038
  %conv2 = zext i16 %2 to i32, !dbg !1038
  %cmp = icmp eq i32 %conv2, 0, !dbg !1040
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1041

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1042
  %cmp4 = icmp sge i32 %3, 0, !dbg !1045
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1046

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !1047
  br label %return, !dbg !1047

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1049
  br label %return, !dbg !1049

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1051
  %5 = load i32, i32* %s32Result, align 4, !dbg !1053
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1054
  %conv8 = zext i16 %6 to i32, !dbg !1054
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1055
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1055
  %div = sdiv i32 %5, %conv8, !dbg !1055, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1056
  %conv9 = zext i16 %7 to i32, !dbg !1056
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1057
  %sub = sub nsw i32 %4, %mul10, !dbg !1058
  %shl = shl i32 %sub, 1, !dbg !1059
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1060
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1061
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1062
  %conv11 = zext i16 %9 to i32, !dbg !1062
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1063
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1063
  %div12 = sdiv i32 %8, %conv11, !dbg !1063, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1064
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1065
  %conv13 = zext i16 %11 to i32, !dbg !1065
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1066
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1066
  %div14 = sdiv i32 %10, %conv13, !dbg !1066, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1067
  store i32 %add, i32* %s32Result, align 4, !dbg !1068
  %12 = load i32, i32* %s32Result, align 4, !dbg !1069
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1071
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1072

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1073
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1076
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1077

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1078
  %conv21 = trunc i32 %14 to i16, !dbg !1080
  store i16 %conv21, i16* %retval, align 2, !dbg !1081
  br label %return, !dbg !1081

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1082
  br label %return, !dbg !1082

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1084
  br label %return, !dbg !1084

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1086
  ret i16 %15, !dbg !1086
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1087 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1090, metadata !DIExpression()), !dbg !1091
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1092, metadata !DIExpression()), !dbg !1093
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1094, metadata !DIExpression()), !dbg !1095
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1096, metadata !DIExpression()), !dbg !1097
  store i32 0, i32* %u32Temp1, align 4, !dbg !1097
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1098, metadata !DIExpression()), !dbg !1099
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1099
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1100
  %conv = zext i16 %0 to i32, !dbg !1100
  %cmp = icmp eq i32 %conv, 0, !dbg !1102
  br i1 %cmp, label %if.then, label %if.else, !dbg !1103

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1104
  br label %return, !dbg !1104

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1106
  %conv2 = zext i16 %1 to i32, !dbg !1106
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1108
  %conv3 = zext i16 %2 to i32, !dbg !1108
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1109
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1110
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1111
  %conv4 = zext i16 %3 to i32, !dbg !1111
  %shr = ashr i32 %conv4, 1, !dbg !1112
  %conv5 = trunc i32 %shr to i16, !dbg !1111
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1113
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1114
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1115
  %conv6 = zext i16 %5 to i32, !dbg !1115
  %add = add i32 %4, %conv6, !dbg !1116
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1117
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1118
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1119
  %conv7 = zext i16 %7 to i32, !dbg !1119
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1120
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1120
  %div = udiv i32 %6, %conv7, !dbg !1120, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1121
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1122
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1124
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1125

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1126
  %and = and i32 %9, 65535, !dbg !1128
  %conv11 = trunc i32 %and to i16, !dbg !1129
  store i16 %conv11, i16* %retval, align 2, !dbg !1130
  br label %return, !dbg !1130

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1131
  br label %return, !dbg !1131

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1133
  ret i16 %10, !dbg !1133
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1134 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1137, metadata !DIExpression()), !dbg !1138
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1139, metadata !DIExpression()), !dbg !1140
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1141, metadata !DIExpression()), !dbg !1142
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1143, metadata !DIExpression()), !dbg !1144
  store i32 0, i32* %u32Temp1, align 4, !dbg !1144
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1145
  %cmp = icmp eq i32 %0, 0, !dbg !1147
  br i1 %cmp, label %if.then, label %if.else, !dbg !1148

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1149
  br label %return, !dbg !1149

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1151
  %conv = zext i16 %1 to i32, !dbg !1151
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1153
  %conv1 = zext i16 %2 to i32, !dbg !1153
  %mul = mul nsw i32 %conv, %conv1, !dbg !1154
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1155
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1156
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1156
  %div = udiv i32 %mul, %3, !dbg !1156, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1157
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1158
  %conv2 = zext i16 %4 to i32, !dbg !1158
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1160
  %conv3 = zext i16 %5 to i32, !dbg !1160
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1161
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1162
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1163
  %mul5 = mul i32 %6, %7, !dbg !1164
  %sub = sub i32 %mul4, %mul5, !dbg !1165
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1166
  %div6 = udiv i32 %8, 2, !dbg !1167
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1168
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1169

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1170
  %inc = add i32 %9, 1, !dbg !1170
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1170
  br label %if.end, !dbg !1172

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1173
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1175
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1176

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1177
  %and = and i32 %11, 65535, !dbg !1179
  %conv13 = trunc i32 %and to i16, !dbg !1180
  store i16 %conv13, i16* %retval, align 2, !dbg !1181
  br label %return, !dbg !1181

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1182
  br label %return, !dbg !1182

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1184
  ret i16 %12, !dbg !1184
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1185 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1188, metadata !DIExpression()), !dbg !1189
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1190, metadata !DIExpression()), !dbg !1191
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1192, metadata !DIExpression()), !dbg !1193
  store i32 0, i32* %u32Temp1, align 4, !dbg !1193
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1194
  %conv = zext i16 %0 to i32, !dbg !1194
  %cmp = icmp eq i32 %conv, 0, !dbg !1196
  br i1 %cmp, label %if.then, label %if.else, !dbg !1197

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1198
  br label %return, !dbg !1198

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1200
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1202
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1203
  %conv2 = zext i16 %3 to i32, !dbg !1203
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1204
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1204
  %div = udiv i32 %2, %conv2, !dbg !1204, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1205
  %conv3 = zext i16 %4 to i32, !dbg !1205
  %mul = mul i32 %div, %conv3, !dbg !1206
  %sub = sub i32 %1, %mul, !dbg !1207
  %shl = shl i32 %sub, 1, !dbg !1208
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1209
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1210
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1211
  %conv4 = zext i16 %6 to i32, !dbg !1211
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1212
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1212
  %div5 = udiv i32 %5, %conv4, !dbg !1212, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1213
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1214
  %conv6 = zext i16 %8 to i32, !dbg !1214
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1215
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1215
  %div7 = udiv i32 %7, %conv6, !dbg !1215, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1216
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1217
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1218
  store i32 %9, i32* %retval, align 4, !dbg !1219
  br label %return, !dbg !1219

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1220
  ret i32 %10, !dbg !1220
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1221 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1224, metadata !DIExpression()), !dbg !1225
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1226, metadata !DIExpression()), !dbg !1227
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1228, metadata !DIExpression()), !dbg !1229
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1230, metadata !DIExpression()), !dbg !1231
  store i32 0, i32* %s32Temp1, align 4, !dbg !1231
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1232, metadata !DIExpression()), !dbg !1233
  store i32 0, i32* %s32Temp2, align 4, !dbg !1233
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1234, metadata !DIExpression()), !dbg !1235
  store i32 0, i32* %s32Temp3, align 4, !dbg !1235
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1236
  %conv = sext i16 %0 to i32, !dbg !1236
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1237
  %conv1 = sext i16 %1 to i32, !dbg !1237
  %mul = mul nsw i32 %conv, %conv1, !dbg !1238
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1239
  %2 = load i16, i16* %div.addr, align 2, !dbg !1240
  %conv2 = sext i16 %2 to i32, !dbg !1240
  %cmp = icmp eq i32 %conv2, 0, !dbg !1242
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1243

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1244
  %cmp4 = icmp slt i32 %3, 0, !dbg !1247
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1248

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1249
  br label %return, !dbg !1249

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1251
  br label %return, !dbg !1251

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1253
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1255
  %6 = load i16, i16* %div.addr, align 2, !dbg !1256
  %conv8 = sext i16 %6 to i32, !dbg !1256
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1257
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1257
  %div9 = sdiv i32 %5, %conv8, !dbg !1257, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1258
  %conv10 = sext i16 %7 to i32, !dbg !1258
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1259
  %sub = sub nsw i32 %4, %mul11, !dbg !1260
  %shl = shl i32 %sub, 1, !dbg !1261
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1262
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1263
  %9 = load i16, i16* %div.addr, align 2, !dbg !1264
  %conv12 = sext i16 %9 to i32, !dbg !1264
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1265
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1265
  %div13 = sdiv i32 %8, %conv12, !dbg !1265, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1266
  %11 = load i16, i16* %div.addr, align 2, !dbg !1267
  %conv14 = sext i16 %11 to i32, !dbg !1267
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1268
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1268
  %div15 = sdiv i32 %10, %conv14, !dbg !1268, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1269
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1270
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1271
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1273
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1274

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1275
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1278
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1279

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1280
  %conv22 = trunc i32 %14 to i16, !dbg !1282
  store i16 %conv22, i16* %retval, align 2, !dbg !1283
  br label %return, !dbg !1283

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1284
  br label %return, !dbg !1284

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1286
  br label %return, !dbg !1286

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1288
  ret i16 %15, !dbg !1288
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1289 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1292, metadata !DIExpression()), !dbg !1293
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1294, metadata !DIExpression()), !dbg !1295
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1296, metadata !DIExpression()), !dbg !1297
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1298, metadata !DIExpression()), !dbg !1299
  store i32 0, i32* %s32Result, align 4, !dbg !1299
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1300, metadata !DIExpression()), !dbg !1301
  store i32 0, i32* %s32Temp1, align 4, !dbg !1301
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1302
  %conv = sext i16 %0 to i32, !dbg !1302
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1303
  %conv1 = sext i16 %1 to i32, !dbg !1303
  %mul = mul nsw i32 %conv, %conv1, !dbg !1304
  store i32 %mul, i32* %s32Result, align 4, !dbg !1305
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1306
  %conv2 = zext i16 %2 to i32, !dbg !1306
  %cmp = icmp eq i32 %conv2, 0, !dbg !1308
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1309

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1310
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1313
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1314

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1315
  br label %return, !dbg !1315

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1317
  %cmp7 = icmp eq i32 %4, 0, !dbg !1319
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1320

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1321
  br label %return, !dbg !1321

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1323
  br label %return, !dbg !1323

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1325
  %6 = load i32, i32* %s32Result, align 4, !dbg !1327
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1328
  %conv12 = zext i16 %7 to i32, !dbg !1328
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1329
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1329
  %div = sdiv i32 %6, %conv12, !dbg !1329, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1330
  %conv13 = zext i16 %8 to i32, !dbg !1330
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1331
  %sub = sub nsw i32 %5, %mul14, !dbg !1332
  %shl = shl i32 %sub, 1, !dbg !1333
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1334
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1335
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1336
  %conv15 = zext i16 %10 to i32, !dbg !1336
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1337
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1337
  %div16 = sdiv i32 %9, %conv15, !dbg !1337, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1338
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1339
  %conv17 = zext i16 %12 to i32, !dbg !1339
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1340
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1340
  %div18 = sdiv i32 %11, %conv17, !dbg !1340, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1341
  store i32 %add, i32* %s32Result, align 4, !dbg !1342
  %13 = load i32, i32* %s32Result, align 4, !dbg !1343
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1345
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1346

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1347
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1350
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1351

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1352
  %conv25 = trunc i32 %15 to i16, !dbg !1354
  store i16 %conv25, i16* %retval, align 2, !dbg !1355
  br label %return, !dbg !1355

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1356
  br label %return, !dbg !1356

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1358
  br label %return, !dbg !1358

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1360
  ret i16 %16, !dbg !1360
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1361 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1364, metadata !DIExpression()), !dbg !1365
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1366, metadata !DIExpression()), !dbg !1367
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1368, metadata !DIExpression()), !dbg !1369
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1370
  %cmp = icmp eq i32 %0, 0, !dbg !1372
  br i1 %cmp, label %if.then, label %if.else, !dbg !1373

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1374
  br label %return, !dbg !1374

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1376
  %cmp1 = icmp sle i32 %1, 0, !dbg !1379
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1380

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1381
  br label %return, !dbg !1381

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1383
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1385
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1386
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1387
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1387
  %div = udiv i32 %3, %4, !dbg !1387, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1388
  %mul = mul i32 %div, %5, !dbg !1389
  %sub = sub i32 %2, %mul, !dbg !1390
  %shl = shl i32 %sub, 1, !dbg !1391
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1392
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1393
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1394
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1395
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1395
  %div4 = udiv i32 %6, %7, !dbg !1395, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1396
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1397
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1398
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1398
  %div5 = udiv i32 %8, %9, !dbg !1398, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1399
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1400
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1401
  store i32 %10, i32* %retval, align 4, !dbg !1402
  br label %return, !dbg !1402

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1403
  ret i32 %11, !dbg !1403
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1404 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1407, metadata !DIExpression()), !dbg !1408
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1409, metadata !DIExpression()), !dbg !1410
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1411, metadata !DIExpression()), !dbg !1412
  store i32 0, i32* %s32Temp1, align 4, !dbg !1412
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1413
  %cmp = icmp eq i32 %0, 0, !dbg !1415
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1416

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1417
  %cmp1 = icmp sge i32 %1, 0, !dbg !1420
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1421

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1422
  br label %return, !dbg !1422

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1424
  br label %return, !dbg !1424

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1426
  %cmp4 = icmp sge i32 %2, 0, !dbg !1429
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1430

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1431
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1433
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1434
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1435
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1435
  %div = udiv i32 %4, %5, !dbg !1435, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1436
  %mul = mul i32 %div, %6, !dbg !1437
  %sub = sub i32 %3, %mul, !dbg !1438
  %shl = shl i32 %sub, 1, !dbg !1439
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1440
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1441
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1442
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1443
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1443
  %div6 = udiv i32 %7, %8, !dbg !1443, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1444
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1445
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1446
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1446
  %div7 = udiv i32 %9, %10, !dbg !1446, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1447
  store i32 %add, i32* %retval, align 4, !dbg !1448
  br label %return, !dbg !1448

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1449
  br label %return, !dbg !1449

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1451
  ret i32 %11, !dbg !1451
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1452 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1455, metadata !DIExpression()), !dbg !1456
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1457, metadata !DIExpression()), !dbg !1458
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1459, metadata !DIExpression()), !dbg !1460
  store i32 0, i32* %u32Temp1, align 4, !dbg !1460
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1461, metadata !DIExpression()), !dbg !1462
  store i32 0, i32* %u32Temp2, align 4, !dbg !1462
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1463
  %cmp = icmp eq i32 %0, 0, !dbg !1465
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1466

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1467
  %cmp1 = icmp slt i32 %1, 0, !dbg !1470
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1471

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1472
  br label %return, !dbg !1472

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1474
  br label %return, !dbg !1474

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1476
  %cmp4 = icmp sge i32 %2, 0, !dbg !1479
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1480

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1481
  %cmp6 = icmp eq i32 %3, 0, !dbg !1484
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1485

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1486
  br label %return, !dbg !1486

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1488
  %cmp9 = icmp sle i32 %4, 0, !dbg !1491
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1492

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1493
  br label %return, !dbg !1493

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1495
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1497
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1498
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1499
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1499
  %div = sdiv i32 %6, %7, !dbg !1499, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1500
  %mul = mul nsw i32 %div, %8, !dbg !1501
  %sub = sub nsw i32 %5, %mul, !dbg !1502
  %shl = shl i32 %sub, 1, !dbg !1503
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1504
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1505
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1506
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1507
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1507
  %div12 = udiv i32 %9, %10, !dbg !1507, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1508
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1509
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1510
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1510
  %div13 = sdiv i32 %11, %12, !dbg !1510, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1511
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1512
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1513
  store i32 %13, i32* %retval, align 4, !dbg !1514
  br label %return, !dbg !1514

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1515
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1518
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1519

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1520
  br label %return, !dbg !1520

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1522
  %sub18 = sub nsw i32 0, %15, !dbg !1524
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1525
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1526
  %sub19 = sub nsw i32 0, %16, !dbg !1527
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1528
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1529
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1530
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1531
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1532
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1532
  %div20 = sdiv i32 %18, %19, !dbg !1532, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1533
  %mul21 = mul nsw i32 %div20, %20, !dbg !1534
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1535
  %shl23 = shl i32 %sub22, 1, !dbg !1536
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1537
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1538
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1539
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1540
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1540
  %div24 = udiv i32 %21, %22, !dbg !1540, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1541
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1542
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1543
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1543
  %div25 = sdiv i32 %23, %24, !dbg !1543, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1544
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1545
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1546
  store i32 %25, i32* %retval, align 4, !dbg !1547
  br label %return, !dbg !1547

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1548
  ret i32 %26, !dbg !1548
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1549 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1552, metadata !DIExpression()), !dbg !1553
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1554, metadata !DIExpression()), !dbg !1555
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1556, metadata !DIExpression()), !dbg !1557
  store i32 0, i32* %u32Temp1, align 4, !dbg !1557
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1558, metadata !DIExpression()), !dbg !1559
  store i32 0, i32* %u32Temp2, align 4, !dbg !1559
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1560, metadata !DIExpression()), !dbg !1561
  store i32 0, i32* %u32Temp3, align 4, !dbg !1561
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1562, metadata !DIExpression()), !dbg !1563
  store i32 0, i32* %numerator_old, align 4, !dbg !1563
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1564
  %cmp = icmp eq i32 %0, 0, !dbg !1566
  br i1 %cmp, label %if.then, label %if.else, !dbg !1567

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1568
  br label %return, !dbg !1568

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1570
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1572
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1573
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1574
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1575
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1575
  %div = udiv i32 %3, %4, !dbg !1575, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1576
  %sub = sub i32 %1, %mul, !dbg !1577
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1578
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1579
  %and = and i32 %5, 1, !dbg !1581
  %cmp1 = icmp eq i32 %and, 0, !dbg !1582
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1583

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1584
  %shr = lshr i32 %6, 1, !dbg !1586
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1587
  br label %if.end, !dbg !1588

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1589
  %shr4 = lshr i32 %7, 1, !dbg !1591
  %add = add i32 %shr4, 1, !dbg !1592
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1593
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1594
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1596
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1597
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1598

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1599
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1601
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1602
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1602
  %div7 = udiv i32 %10, %11, !dbg !1602, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1603
  br label %return, !dbg !1603

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1604
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1606
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1607
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1607
  %div9 = udiv i32 %12, %13, !dbg !1607, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1608
  store i32 %add10, i32* %retval, align 4, !dbg !1609
  br label %return, !dbg !1609

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1610
  ret i32 %14, !dbg !1610
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1611 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1614, metadata !DIExpression()), !dbg !1615
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1616, metadata !DIExpression()), !dbg !1617
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1618, metadata !DIExpression()), !dbg !1619
  store i32 0, i32* %u32Temp1, align 4, !dbg !1619
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1620, metadata !DIExpression()), !dbg !1621
  store i32 0, i32* %u32Temp2, align 4, !dbg !1621
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1622
  %cmp = icmp sle i32 %0, 0, !dbg !1624
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1625

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1626
  %cmp1 = icmp sge i32 %1, 0, !dbg !1629
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1630

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1631
  br label %return, !dbg !1631

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1633
  %sub = sub nsw i32 0, %2, !dbg !1635
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1636
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1637
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1638
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1639
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1640
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1640
  %div = udiv i32 %4, %5, !dbg !1640, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1641
  %mul = mul i32 %div, %6, !dbg !1642
  %sub3 = sub i32 %3, %mul, !dbg !1643
  %shl = shl i32 %sub3, 1, !dbg !1644
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1645
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1646
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1647
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1648
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1648
  %div4 = udiv i32 %7, %8, !dbg !1648, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1649
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1650
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1651
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1651
  %div5 = udiv i32 %9, %10, !dbg !1651, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1652
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1653
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1654
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1656
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1657

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1658
  %sub8 = sub i32 0, %12, !dbg !1660
  store i32 %sub8, i32* %retval, align 4, !dbg !1661
  br label %return, !dbg !1661

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1662
  br label %return, !dbg !1662

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1664
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1666
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1667
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1668
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1668
  %div11 = udiv i32 %14, %15, !dbg !1668, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1669
  %mul12 = mul i32 %div11, %16, !dbg !1670
  %sub13 = sub i32 %13, %mul12, !dbg !1671
  %shl14 = shl i32 %sub13, 1, !dbg !1672
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1673
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1674
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1675
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1676
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1676
  %div15 = udiv i32 %17, %18, !dbg !1676, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1677
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1678
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1679
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1679
  %div16 = udiv i32 %19, %20, !dbg !1679, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1680
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1681
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1682
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1684
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1685

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1686
  store i32 %22, i32* %retval, align 4, !dbg !1688
  br label %return, !dbg !1688

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1689
  br label %return, !dbg !1689

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1691
  ret i32 %23, !dbg !1691
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1692 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1695, metadata !DIExpression()), !dbg !1696
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1697, metadata !DIExpression()), !dbg !1698
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1699, metadata !DIExpression()), !dbg !1700
  store i32 0, i32* %s32Temp1, align 4, !dbg !1700
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1701, metadata !DIExpression()), !dbg !1702
  store i32 0, i32* %s32Temp2, align 4, !dbg !1702
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1703, metadata !DIExpression()), !dbg !1704
  store i32 0, i32* %u32Temp0, align 4, !dbg !1704
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1705, metadata !DIExpression()), !dbg !1706
  store i32 0, i32* %u32Temp1, align 4, !dbg !1706
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1707, metadata !DIExpression()), !dbg !1708
  store i32 0, i32* %u32Temp2, align 4, !dbg !1708
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1709
  %cmp = icmp eq i32 %0, 0, !dbg !1711
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1712

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1713
  %cmp1 = icmp slt i32 %1, 0, !dbg !1716
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1717

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1718
  br label %return, !dbg !1718

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1720
  br label %return, !dbg !1720

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1722
  %cmp4 = icmp sle i32 %2, 0, !dbg !1725
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1726

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1727
  %sub = sub nsw i32 0, %3, !dbg !1729
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1730
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1731
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1732
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1733
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1733
  %div = udiv i32 %4, %5, !dbg !1733, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1734
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1735
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1736
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1737
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1738
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1738
  %div6 = udiv i32 %7, %8, !dbg !1738, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1739
  %mul = mul i32 %div6, %9, !dbg !1740
  %sub7 = sub i32 %6, %mul, !dbg !1741
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1742
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1743
  %and = and i32 %10, 1, !dbg !1745
  %cmp8 = icmp eq i32 %and, 0, !dbg !1746
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1747

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1748
  %shr = lshr i32 %11, 1, !dbg !1750
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1751
  br label %if.end, !dbg !1752

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1753
  %shr11 = lshr i32 %12, 1, !dbg !1755
  %add = add i32 %shr11, 1, !dbg !1756
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1757
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1758
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1760
  %cmp12 = icmp ult i32 %13, %14, !dbg !1761
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1762

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1763
  %neg = xor i32 %15, -1, !dbg !1765
  %add14 = add i32 %neg, 1, !dbg !1766
  store i32 %add14, i32* %retval, align 4, !dbg !1767
  br label %return, !dbg !1767

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1768
  %add16 = add i32 %16, 1, !dbg !1770
  %neg17 = xor i32 %add16, -1, !dbg !1771
  %add18 = add i32 %neg17, 1, !dbg !1772
  store i32 %add18, i32* %retval, align 4, !dbg !1773
  br label %return, !dbg !1773

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1774
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1776
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1777
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1778
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1778
  %div20 = udiv i32 %18, %19, !dbg !1778, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1779
  %mul21 = mul i32 %div20, %20, !dbg !1780
  %sub22 = sub i32 %17, %mul21, !dbg !1781
  %shl = shl i32 %sub22, 1, !dbg !1782
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1783
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1784
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1785
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1786
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1786
  %div23 = udiv i32 %21, %22, !dbg !1786, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1787
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1788
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1789
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1789
  %div24 = udiv i32 %23, %24, !dbg !1789, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1790
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1791
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1792
  store i32 %25, i32* %retval, align 4, !dbg !1793
  br label %return, !dbg !1793

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1794
  ret i32 %26, !dbg !1794
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1795 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1798, metadata !DIExpression()), !dbg !1799
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1800, metadata !DIExpression()), !dbg !1801
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1802, metadata !DIExpression()), !dbg !1803
  store i32 0, i32* %s32Temp1, align 4, !dbg !1803
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1804, metadata !DIExpression()), !dbg !1805
  store i32 0, i32* %s32Temp2, align 4, !dbg !1805
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1806, metadata !DIExpression()), !dbg !1807
  store i32 0, i32* %denominator_prime, align 4, !dbg !1807
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1808, metadata !DIExpression()), !dbg !1809
  store i32 0, i32* %u32Temp1, align 4, !dbg !1809
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1810, metadata !DIExpression()), !dbg !1811
  store i32 0, i32* %u32Temp2, align 4, !dbg !1811
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1812, metadata !DIExpression()), !dbg !1813
  store i32 0, i32* %u32numerator, align 4, !dbg !1813
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1814, metadata !DIExpression()), !dbg !1815
  store i32 0, i32* %u32denominator, align 4, !dbg !1815
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1816
  %cmp = icmp slt i32 %0, 0, !dbg !1818
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1819

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1820
  %cmp1 = icmp sle i32 %1, 0, !dbg !1823
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1824

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1825
  %cmp3 = icmp sge i32 %2, 0, !dbg !1828
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1829

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1830
  br label %return, !dbg !1830

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1832
  %sub = sub nsw i32 0, %3, !dbg !1834
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1835
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1836
  %sub5 = sub nsw i32 0, %4, !dbg !1837
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1838
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1839
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1840
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1841
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1842
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1842
  %div = udiv i32 %6, %7, !dbg !1842, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1843
  %mul = mul i32 %div, %8, !dbg !1844
  %sub6 = sub i32 %5, %mul, !dbg !1845
  %shl = shl i32 %sub6, 1, !dbg !1846
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1847
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1848
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1849
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1850
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1850
  %div7 = udiv i32 %9, %10, !dbg !1850, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1851
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1852
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1853
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1853
  %div8 = udiv i32 %11, %12, !dbg !1853, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1854
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1855
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1856
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1858
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1859

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1860
  store i32 %14, i32* %retval, align 4, !dbg !1862
  br label %return, !dbg !1862

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1863
  br label %return, !dbg !1863

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1865
  %neg = xor i32 %15, -1, !dbg !1867
  %add13 = add nsw i32 %neg, 1, !dbg !1868
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1869
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1870
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1871
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1872
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1873
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1873
  %div14 = udiv i32 %17, %18, !dbg !1873, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1874
  %mul15 = mul i32 %div14, %19, !dbg !1875
  %sub16 = sub i32 %16, %mul15, !dbg !1876
  %shl17 = shl i32 %sub16, 1, !dbg !1877
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1878
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1879
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1880
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1881
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1881
  %div18 = udiv i32 %20, %21, !dbg !1881, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1882
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1883
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1884
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1884
  %div19 = sdiv i32 %22, %23, !dbg !1884, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1885
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1886
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1887
  %neg21 = xor i32 %24, -1, !dbg !1888
  %add22 = add nsw i32 %neg21, 1, !dbg !1889
  store i32 %add22, i32* %retval, align 4, !dbg !1890
  br label %return, !dbg !1890

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1891
  %cmp24 = icmp sle i32 %25, 0, !dbg !1894
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1895

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1896
  %cmp26 = icmp sge i32 %26, 0, !dbg !1899
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1900

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1901
  br label %return, !dbg !1901

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1903
  %neg29 = xor i32 %27, -1, !dbg !1905
  %add30 = add nsw i32 %neg29, 1, !dbg !1906
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1907
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1908
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1909
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1910
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1911
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1911
  %div31 = udiv i32 %29, %30, !dbg !1911, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1912
  %mul32 = mul i32 %div31, %31, !dbg !1913
  %sub33 = sub i32 %28, %mul32, !dbg !1914
  %shl34 = shl i32 %sub33, 1, !dbg !1915
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1916
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1917
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1918
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1919
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1919
  %div35 = udiv i32 %32, %33, !dbg !1919, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1920
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1921
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1922
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1922
  %div36 = udiv i32 %34, %35, !dbg !1922, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1923
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1924
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1925
  %neg38 = xor i32 %36, -1, !dbg !1926
  %add39 = add nsw i32 %neg38, 1, !dbg !1927
  store i32 %add39, i32* %retval, align 4, !dbg !1928
  br label %return, !dbg !1928

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1929
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1931
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1932
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1933
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1933
  %div41 = sdiv i32 %38, %39, !dbg !1933, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1934
  %mul42 = mul nsw i32 %div41, %40, !dbg !1935
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1936
  %shl44 = shl i32 %sub43, 1, !dbg !1937
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1938
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1939
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1940
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1941
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1941
  %div45 = sdiv i32 %41, %42, !dbg !1941, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1942
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1943
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1944
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1944
  %div46 = udiv i32 %43, %44, !dbg !1944, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1945
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1946
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1947
  store i32 %45, i32* %retval, align 4, !dbg !1948
  br label %return, !dbg !1948

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1949
  ret i32 %46, !dbg !1949
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1950 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1953, metadata !DIExpression()), !dbg !1954
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1955, metadata !DIExpression()), !dbg !1956
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1957, metadata !DIExpression()), !dbg !1958
  store i32 0, i32* %numerator_prime, align 4, !dbg !1958
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1959, metadata !DIExpression()), !dbg !1960
  store i32 0, i32* %u32Temp1, align 4, !dbg !1960
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1961, metadata !DIExpression()), !dbg !1962
  store i32 0, i32* %u32Temp2, align 4, !dbg !1962
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1963, metadata !DIExpression()), !dbg !1964
  store i32 0, i32* %u32Temp3, align 4, !dbg !1964
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1965, metadata !DIExpression()), !dbg !1966
  store i32 0, i32* %s32Temp1, align 4, !dbg !1966
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1967, metadata !DIExpression()), !dbg !1968
  store i32 0, i32* %s32Temp2, align 4, !dbg !1968
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1969, metadata !DIExpression()), !dbg !1970
  store i32 0, i32* %s32Temp3, align 4, !dbg !1970
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1971
  %cmp = icmp eq i32 %0, 0, !dbg !1973
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1974

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1975
  %cmp1 = icmp slt i32 %1, 0, !dbg !1978
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1979

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1980
  br label %return, !dbg !1980

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1982
  br label %return, !dbg !1982

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1984
  %cmp4 = icmp slt i32 %2, 0, !dbg !1987
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1988

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1989
  %sub = sub nsw i32 0, %3, !dbg !1991
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1992
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1993
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1994
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1995
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1995
  %div = udiv i32 %4, %5, !dbg !1995, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1996
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1997
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1998
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1999
  %mul = mul i32 %7, %8, !dbg !2000
  %sub6 = sub i32 %6, %mul, !dbg !2001
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !2002
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !2003
  %and = and i32 %9, 1, !dbg !2005
  %cmp7 = icmp eq i32 %and, 0, !dbg !2006
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !2007

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !2008
  %shr = lshr i32 %10, 1, !dbg !2010
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !2011
  br label %if.end, !dbg !2012

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !2013
  %shr10 = lshr i32 %11, 1, !dbg !2015
  %add = add i32 %shr10, 1, !dbg !2016
  store i32 %add, i32* %denominator.addr, align 4, !dbg !2017
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2018
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !2020
  %cmp11 = icmp ult i32 %12, %13, !dbg !2021
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !2022

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2023
  %neg = xor i32 %14, -1, !dbg !2025
  %add13 = add i32 %neg, 1, !dbg !2026
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !2027
  br label %if.end18, !dbg !2028

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !2029
  %add15 = add i32 %15, 1, !dbg !2031
  %neg16 = xor i32 %add15, -1, !dbg !2032
  %add17 = add i32 %neg16, 1, !dbg !2033
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !2034
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !2035
  %cmp19 = icmp sge i32 %16, -32768, !dbg !2037
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !2038

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !2039
  %conv = trunc i32 %17 to i16, !dbg !2041
  store i16 %conv, i16* %retval, align 2, !dbg !2042
  br label %return, !dbg !2042

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !2043
  br label %return, !dbg !2043

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !2045
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !2047
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !2048
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !2048
  %div23 = udiv i32 %18, %19, !dbg !2048, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !2049
  %mul24 = mul i32 %div23, %20, !dbg !2050
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !2051
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !2052
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !2053
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !2054
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !2055
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !2055
  %div25 = udiv i32 %22, %23, !dbg !2055, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !2056
  %mul26 = mul i32 %div25, %24, !dbg !2057
  %sub27 = sub i32 %21, %mul26, !dbg !2058
  %shl = shl i32 %sub27, 1, !dbg !2059
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !2060
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !2061
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !2062
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !2063
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !2063
  %div28 = udiv i32 %25, %26, !dbg !2063, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !2064
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !2065
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !2066
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !2066
  %div29 = udiv i32 %27, %28, !dbg !2066, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !2067
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2068
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2069
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2071
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2072

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2073
  %conv34 = trunc i32 %30 to i16, !dbg !2075
  store i16 %conv34, i16* %retval, align 2, !dbg !2076
  br label %return, !dbg !2076

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2077
  br label %return, !dbg !2077

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2079
  ret i16 %31, !dbg !2079
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2080 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2086, metadata !DIExpression()), !dbg !2087
  %2 = icmp eq i64 %0, 0, !dbg !2088
  br i1 %2, label %3, label %4, !dbg !2090

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2091
  unreachable, !dbg !2091

4:                                                ; preds = %1
  ret void, !dbg !2092
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2093 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2099, metadata !DIExpression()), !dbg !2101
  call void @llvm.dbg.value(metadata i64 %1, metadata !2100, metadata !DIExpression()), !dbg !2101
  %3 = icmp ult i64 %1, %0, !dbg !2102
  br i1 %3, label %5, label %4, !dbg !2104

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2105
  unreachable, !dbg !2105

5:                                                ; preds = %2
  ret void, !dbg !2107
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0036/div_Ccode_alarm_0036.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0036")
!4 = !{}
!5 = !{!6, !13, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0036")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0036")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0036/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0036")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0036")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0036")
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
!368 = !DILocation(line: 338, column: 52, scope: !369)
!369 = distinct !DILexicalBlock(scope: !362, file: !69, line: 338, column: 9)
!370 = !DILocation(line: 338, column: 68, scope: !369)
!371 = !DILocation(line: 338, column: 63, scope: !369)
!372 = !DILocation(line: 338, column: 61, scope: !369)
!373 = !DILocation(line: 338, column: 36, scope: !369)
!374 = !DILocation(line: 338, column: 98, scope: !369)
!375 = !DILocation(line: 338, column: 93, scope: !369)
!376 = !DILocation(line: 338, column: 83, scope: !369)
!377 = !DILocation(line: 338, column: 11, scope: !369)
!378 = !DILocation(line: 338, column: 9, scope: !362)
!379 = !DILocation(line: 339, column: 9, scope: !380)
!380 = distinct !DILexicalBlock(scope: !369, file: !69, line: 338, column: 114)
!381 = !DILocation(line: 342, column: 54, scope: !382)
!382 = distinct !DILexicalBlock(scope: !362, file: !69, line: 342, column: 9)
!383 = !DILocation(line: 342, column: 44, scope: !382)
!384 = !DILocation(line: 342, column: 80, scope: !382)
!385 = !DILocation(line: 342, column: 75, scope: !382)
!386 = !DILocation(line: 342, column: 65, scope: !382)
!387 = !DILocation(line: 342, column: 11, scope: !382)
!388 = !DILocation(line: 342, column: 9, scope: !362)
!389 = !DILocation(line: 343, column: 9, scope: !390)
!390 = distinct !DILexicalBlock(scope: !382, file: !69, line: 342, column: 96)
!391 = !DILocation(line: 346, column: 52, scope: !392)
!392 = distinct !DILexicalBlock(scope: !362, file: !69, line: 346, column: 9)
!393 = !DILocation(line: 346, column: 68, scope: !392)
!394 = !DILocation(line: 346, column: 63, scope: !392)
!395 = !DILocation(line: 346, column: 61, scope: !392)
!396 = !DILocation(line: 346, column: 36, scope: !392)
!397 = !DILocation(line: 346, column: 98, scope: !392)
!398 = !DILocation(line: 346, column: 93, scope: !392)
!399 = !DILocation(line: 346, column: 83, scope: !392)
!400 = !DILocation(line: 346, column: 11, scope: !392)
!401 = !DILocation(line: 346, column: 9, scope: !362)
!402 = !DILocation(line: 347, column: 9, scope: !403)
!403 = distinct !DILexicalBlock(scope: !392, file: !69, line: 346, column: 114)
!404 = !DILocation(line: 354, column: 43, scope: !362)
!405 = !DILocation(line: 354, column: 59, scope: !362)
!406 = !DILocation(line: 354, column: 54, scope: !362)
!407 = !DILocation(line: 354, column: 52, scope: !362)
!408 = !DILocation(line: 354, column: 79, scope: !362)
!409 = !DILocation(line: 354, column: 74, scope: !362)
!410 = !DILocation(line: 354, column: 72, scope: !362)
!411 = !DILocation(line: 354, column: 27, scope: !362)
!412 = !DILocation(line: 354, column: 25, scope: !362)
!413 = !DILocation(line: 355, column: 5, scope: !362)
!414 = !DILocation(line: 377, column: 5, scope: !415)
!415 = distinct !DILexicalBlock(scope: !356, file: !69, line: 376, column: 4)
!416 = !DILocation(line: 383, column: 1, scope: !186)
!417 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !418, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!418 = !DISubroutineType(types: !419)
!419 = !{!19, !13}
!420 = !DILocalVariable(name: "denominator", arg: 1, scope: !417, file: !33, line: 24, type: !13)
!421 = !DILocation(line: 24, column: 40, scope: !417)
!422 = !DILocation(line: 26, column: 12, scope: !417)
!423 = !DILocation(line: 26, column: 24, scope: !417)
!424 = !DILocation(line: 26, column: 5, scope: !417)
!425 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !418, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!426 = !DILocalVariable(name: "left", arg: 1, scope: !425, file: !33, line: 84, type: !13)
!427 = !DILocation(line: 84, column: 51, scope: !425)
!428 = !DILocation(line: 86, column: 12, scope: !425)
!429 = !DILocation(line: 86, column: 17, scope: !425)
!430 = !DILocation(line: 86, column: 5, scope: !425)
!431 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !432, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!432 = !DISubroutineType(types: !433)
!433 = !{!19, !13, !20}
!434 = !DILocalVariable(name: "left", arg: 1, scope: !431, file: !33, line: 90, type: !13)
!435 = !DILocation(line: 90, column: 41, scope: !431)
!436 = !DILocalVariable(name: "count", arg: 2, scope: !431, file: !33, line: 90, type: !20)
!437 = !DILocation(line: 90, column: 56, scope: !431)
!438 = !DILocation(line: 92, column: 9, scope: !439)
!439 = distinct !DILexicalBlock(scope: !431, file: !33, line: 92, column: 9)
!440 = !DILocation(line: 92, column: 15, scope: !439)
!441 = !DILocation(line: 92, column: 9, scope: !431)
!442 = !DILocation(line: 93, column: 9, scope: !443)
!443 = distinct !DILexicalBlock(scope: !439, file: !33, line: 92, column: 32)
!444 = !DILocation(line: 95, column: 12, scope: !431)
!445 = !DILocation(line: 95, column: 34, scope: !431)
!446 = !DILocation(line: 95, column: 31, scope: !431)
!447 = !DILocation(line: 95, column: 17, scope: !431)
!448 = !DILocation(line: 95, column: 41, scope: !431)
!449 = !DILocation(line: 95, column: 5, scope: !431)
!450 = !DILocation(line: 96, column: 1, scope: !431)
!451 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !452, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!452 = !DISubroutineType(types: !453)
!453 = !{!19, !13, !13}
!454 = !DILocalVariable(name: "left", arg: 1, scope: !451, file: !33, line: 78, type: !13)
!455 = !DILocation(line: 78, column: 38, scope: !451)
!456 = !DILocalVariable(name: "right", arg: 2, scope: !451, file: !33, line: 78, type: !13)
!457 = !DILocation(line: 78, column: 52, scope: !451)
!458 = !DILocation(line: 80, column: 12, scope: !451)
!459 = !DILocation(line: 80, column: 19, scope: !451)
!460 = !DILocation(line: 80, column: 17, scope: !451)
!461 = !DILocation(line: 80, column: 25, scope: !451)
!462 = !DILocation(line: 80, column: 5, scope: !451)
!463 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !452, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!464 = !DILocalVariable(name: "left", arg: 1, scope: !463, file: !33, line: 72, type: !13)
!465 = !DILocation(line: 72, column: 38, scope: !463)
!466 = !DILocalVariable(name: "right", arg: 2, scope: !463, file: !33, line: 72, type: !13)
!467 = !DILocation(line: 72, column: 52, scope: !463)
!468 = !DILocation(line: 74, column: 12, scope: !463)
!469 = !DILocation(line: 74, column: 19, scope: !463)
!470 = !DILocation(line: 74, column: 17, scope: !463)
!471 = !DILocation(line: 74, column: 25, scope: !463)
!472 = !DILocation(line: 74, column: 5, scope: !463)
!473 = distinct !DISubprogram(name: "klee_alarm_s32_add_lower", scope: !33, file: !33, line: 48, type: !452, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!474 = !DILocalVariable(name: "left", arg: 1, scope: !473, file: !33, line: 48, type: !13)
!475 = !DILocation(line: 48, column: 38, scope: !473)
!476 = !DILocalVariable(name: "right", arg: 2, scope: !473, file: !33, line: 48, type: !13)
!477 = !DILocation(line: 48, column: 52, scope: !473)
!478 = !DILocation(line: 50, column: 12, scope: !473)
!479 = !DILocation(line: 50, column: 19, scope: !473)
!480 = !DILocation(line: 50, column: 17, scope: !473)
!481 = !DILocation(line: 50, column: 25, scope: !473)
!482 = !DILocation(line: 50, column: 5, scope: !473)
!483 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !452, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!484 = !DILocalVariable(name: "left", arg: 1, scope: !483, file: !33, line: 54, type: !13)
!485 = !DILocation(line: 54, column: 38, scope: !483)
!486 = !DILocalVariable(name: "right", arg: 2, scope: !483, file: !33, line: 54, type: !13)
!487 = !DILocation(line: 54, column: 52, scope: !483)
!488 = !DILocation(line: 56, column: 12, scope: !483)
!489 = !DILocation(line: 56, column: 19, scope: !483)
!490 = !DILocation(line: 56, column: 17, scope: !483)
!491 = !DILocation(line: 56, column: 25, scope: !483)
!492 = !DILocation(line: 56, column: 5, scope: !483)
!493 = distinct !DISubprogram(name: "klee_alarm_s32_div_representable", scope: !33, file: !33, line: 30, type: !452, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!494 = !DILocalVariable(name: "numerator", arg: 1, scope: !493, file: !33, line: 30, type: !13)
!495 = !DILocation(line: 30, column: 46, scope: !493)
!496 = !DILocalVariable(name: "denominator", arg: 2, scope: !493, file: !33, line: 30, type: !13)
!497 = !DILocation(line: 30, column: 65, scope: !493)
!498 = !DILocation(line: 32, column: 14, scope: !493)
!499 = !DILocation(line: 32, column: 24, scope: !493)
!500 = !DILocation(line: 32, column: 37, scope: !493)
!501 = !DILocation(line: 32, column: 12, scope: !493)
!502 = !DILocation(line: 32, column: 5, scope: !493)
!503 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 401, type: !504, scopeLine: 402, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!504 = !DISubroutineType(types: !505)
!505 = !{!6, !6, !28}
!506 = !DILocalVariable(name: "numerator", arg: 1, scope: !503, file: !69, line: 401, type: !6)
!507 = !DILocation(line: 401, column: 31, scope: !503)
!508 = !DILocalVariable(name: "denominator", arg: 2, scope: !503, file: !69, line: 401, type: !28)
!509 = !DILocation(line: 401, column: 47, scope: !503)
!510 = !DILocalVariable(name: "u16Temp1", scope: !503, file: !69, line: 403, type: !28)
!511 = !DILocation(line: 403, column: 6, scope: !503)
!512 = !DILocalVariable(name: "s32Temp1", scope: !503, file: !69, line: 404, type: !16)
!513 = !DILocation(line: 404, column: 6, scope: !503)
!514 = !DILocalVariable(name: "s32Temp2", scope: !503, file: !69, line: 404, type: !16)
!515 = !DILocation(line: 404, column: 15, scope: !503)
!516 = !DILocation(line: 405, column: 13, scope: !503)
!517 = !DILocation(line: 405, column: 25, scope: !503)
!518 = !DILocation(line: 405, column: 11, scope: !503)
!519 = !DILocation(line: 406, column: 13, scope: !503)
!520 = !DILocation(line: 406, column: 22, scope: !503)
!521 = !DILocation(line: 406, column: 11, scope: !503)
!522 = !DILocation(line: 407, column: 5, scope: !523)
!523 = distinct !DILexicalBlock(scope: !503, file: !69, line: 407, column: 5)
!524 = !DILocation(line: 407, column: 14, scope: !523)
!525 = !DILocation(line: 407, column: 5, scope: !503)
!526 = !DILocation(line: 409, column: 7, scope: !527)
!527 = distinct !DILexicalBlock(scope: !528, file: !69, line: 409, column: 7)
!528 = distinct !DILexicalBlock(scope: !523, file: !69, line: 408, column: 2)
!529 = !DILocation(line: 409, column: 17, scope: !527)
!530 = !DILocation(line: 409, column: 7, scope: !528)
!531 = !DILocation(line: 411, column: 4, scope: !532)
!532 = distinct !DILexicalBlock(scope: !527, file: !69, line: 410, column: 3)
!533 = !DILocation(line: 415, column: 4, scope: !534)
!534 = distinct !DILexicalBlock(scope: !527, file: !69, line: 414, column: 3)
!535 = !DILocation(line: 420, column: 15, scope: !536)
!536 = distinct !DILexicalBlock(scope: !523, file: !69, line: 419, column: 2)
!537 = !DILocation(line: 420, column: 24, scope: !536)
!538 = !DILocation(line: 420, column: 32, scope: !536)
!539 = !DILocation(line: 420, column: 41, scope: !536)
!540 = !DILocation(line: 420, column: 47, scope: !536)
!541 = !DILocation(line: 420, column: 46, scope: !536)
!542 = !DILocation(line: 420, column: 57, scope: !536)
!543 = !DILocation(line: 420, column: 56, scope: !536)
!544 = !DILocation(line: 420, column: 29, scope: !536)
!545 = !DILocation(line: 420, column: 12, scope: !536)
!546 = !DILocation(line: 421, column: 14, scope: !536)
!547 = !DILocation(line: 421, column: 22, scope: !536)
!548 = !DILocation(line: 421, column: 12, scope: !536)
!549 = !DILocation(line: 422, column: 14, scope: !536)
!550 = !DILocation(line: 422, column: 23, scope: !536)
!551 = !DILocation(line: 422, column: 22, scope: !536)
!552 = !DILocation(line: 422, column: 12, scope: !536)
!553 = !DILocation(line: 423, column: 16, scope: !536)
!554 = !DILocation(line: 423, column: 25, scope: !536)
!555 = !DILocation(line: 423, column: 31, scope: !536)
!556 = !DILocation(line: 423, column: 30, scope: !536)
!557 = !DILocation(line: 423, column: 43, scope: !536)
!558 = !DILocation(line: 423, column: 41, scope: !536)
!559 = !DILocation(line: 423, column: 12, scope: !536)
!560 = !DILocation(line: 424, column: 6, scope: !561)
!561 = distinct !DILexicalBlock(scope: !536, file: !69, line: 424, column: 6)
!562 = !DILocation(line: 424, column: 15, scope: !561)
!563 = !DILocation(line: 424, column: 6, scope: !536)
!564 = !DILocation(line: 426, column: 7, scope: !565)
!565 = distinct !DILexicalBlock(scope: !566, file: !69, line: 426, column: 7)
!566 = distinct !DILexicalBlock(scope: !561, file: !69, line: 425, column: 3)
!567 = !DILocation(line: 426, column: 16, scope: !565)
!568 = !DILocation(line: 426, column: 7, scope: !566)
!569 = !DILocation(line: 428, column: 17, scope: !570)
!570 = distinct !DILexicalBlock(scope: !565, file: !69, line: 427, column: 4)
!571 = !DILocation(line: 428, column: 12, scope: !570)
!572 = !DILocation(line: 428, column: 5, scope: !570)
!573 = !DILocation(line: 432, column: 5, scope: !574)
!574 = distinct !DILexicalBlock(scope: !565, file: !69, line: 431, column: 4)
!575 = !DILocation(line: 437, column: 4, scope: !576)
!576 = distinct !DILexicalBlock(scope: !561, file: !69, line: 436, column: 3)
!577 = !DILocation(line: 440, column: 1, scope: !503)
!578 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 457, type: !504, scopeLine: 458, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!579 = !DILocalVariable(name: "numerator", arg: 1, scope: !578, file: !69, line: 457, type: !6)
!580 = !DILocation(line: 457, column: 30, scope: !578)
!581 = !DILocalVariable(name: "denominator", arg: 2, scope: !578, file: !69, line: 457, type: !28)
!582 = !DILocation(line: 457, column: 45, scope: !578)
!583 = !DILocalVariable(name: "u16Temp1", scope: !578, file: !69, line: 459, type: !28)
!584 = !DILocation(line: 459, column: 6, scope: !578)
!585 = !DILocalVariable(name: "s32Temp1", scope: !578, file: !69, line: 460, type: !16)
!586 = !DILocation(line: 460, column: 6, scope: !578)
!587 = !DILocation(line: 461, column: 13, scope: !578)
!588 = !DILocation(line: 461, column: 25, scope: !578)
!589 = !DILocation(line: 461, column: 11, scope: !578)
!590 = !DILocation(line: 462, column: 5, scope: !591)
!591 = distinct !DILexicalBlock(scope: !578, file: !69, line: 462, column: 5)
!592 = !DILocation(line: 462, column: 13, scope: !591)
!593 = !DILocation(line: 462, column: 5, scope: !578)
!594 = !DILocation(line: 464, column: 6, scope: !595)
!595 = distinct !DILexicalBlock(scope: !596, file: !69, line: 464, column: 6)
!596 = distinct !DILexicalBlock(scope: !591, file: !69, line: 463, column: 2)
!597 = !DILocation(line: 464, column: 15, scope: !595)
!598 = !DILocation(line: 464, column: 6, scope: !596)
!599 = !DILocation(line: 466, column: 4, scope: !600)
!600 = distinct !DILexicalBlock(scope: !595, file: !69, line: 465, column: 3)
!601 = !DILocation(line: 470, column: 4, scope: !602)
!602 = distinct !DILexicalBlock(scope: !595, file: !69, line: 469, column: 3)
!603 = !DILocation(line: 476, column: 15, scope: !604)
!604 = distinct !DILexicalBlock(scope: !591, file: !69, line: 475, column: 2)
!605 = !DILocation(line: 476, column: 27, scope: !604)
!606 = !DILocation(line: 476, column: 37, scope: !604)
!607 = !DILocation(line: 476, column: 36, scope: !604)
!608 = !DILocation(line: 476, column: 49, scope: !604)
!609 = !DILocation(line: 476, column: 47, scope: !604)
!610 = !DILocation(line: 476, column: 25, scope: !604)
!611 = !DILocation(line: 476, column: 59, scope: !604)
!612 = !DILocation(line: 476, column: 12, scope: !604)
!613 = !DILocation(line: 477, column: 15, scope: !604)
!614 = !DILocation(line: 477, column: 24, scope: !604)
!615 = !DILocation(line: 477, column: 23, scope: !604)
!616 = !DILocation(line: 477, column: 37, scope: !604)
!617 = !DILocation(line: 477, column: 47, scope: !604)
!618 = !DILocation(line: 477, column: 46, scope: !604)
!619 = !DILocation(line: 477, column: 34, scope: !604)
!620 = !DILocation(line: 477, column: 12, scope: !604)
!621 = !DILocation(line: 478, column: 10, scope: !604)
!622 = !DILocation(line: 478, column: 3, scope: !604)
!623 = !DILocation(line: 480, column: 1, scope: !578)
!624 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 498, type: !625, scopeLine: 499, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!625 = !DISubroutineType(types: !626)
!626 = !{!24, !28, !28}
!627 = !DILocalVariable(name: "numerator", arg: 1, scope: !624, file: !69, line: 498, type: !28)
!628 = !DILocation(line: 498, column: 28, scope: !624)
!629 = !DILocalVariable(name: "denominator", arg: 2, scope: !624, file: !69, line: 498, type: !28)
!630 = !DILocation(line: 498, column: 43, scope: !624)
!631 = !DILocalVariable(name: "u32Temp1", scope: !624, file: !69, line: 500, type: !632)
!632 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !20)
!633 = !DILocation(line: 500, column: 6, scope: !624)
!634 = !DILocalVariable(name: "u32Temp2", scope: !624, file: !69, line: 500, type: !632)
!635 = !DILocation(line: 500, column: 20, scope: !624)
!636 = !DILocalVariable(name: "u32Temp3", scope: !624, file: !69, line: 500, type: !632)
!637 = !DILocation(line: 500, column: 33, scope: !624)
!638 = !DILocation(line: 501, column: 5, scope: !639)
!639 = distinct !DILexicalBlock(scope: !624, file: !69, line: 501, column: 5)
!640 = !DILocation(line: 501, column: 16, scope: !639)
!641 = !DILocation(line: 501, column: 5, scope: !624)
!642 = !DILocation(line: 503, column: 3, scope: !643)
!643 = distinct !DILexicalBlock(scope: !639, file: !69, line: 502, column: 2)
!644 = !DILocation(line: 507, column: 15, scope: !645)
!645 = distinct !DILexicalBlock(scope: !639, file: !69, line: 506, column: 2)
!646 = !DILocation(line: 507, column: 24, scope: !645)
!647 = !DILocation(line: 507, column: 12, scope: !645)
!648 = !DILocation(line: 508, column: 14, scope: !645)
!649 = !DILocation(line: 508, column: 25, scope: !645)
!650 = !DILocation(line: 508, column: 23, scope: !645)
!651 = !DILocation(line: 508, column: 12, scope: !645)
!652 = !DILocation(line: 509, column: 15, scope: !645)
!653 = !DILocation(line: 509, column: 24, scope: !645)
!654 = !DILocation(line: 509, column: 32, scope: !645)
!655 = !DILocation(line: 509, column: 12, scope: !645)
!656 = !DILocation(line: 510, column: 6, scope: !657)
!657 = distinct !DILexicalBlock(scope: !645, file: !69, line: 510, column: 6)
!658 = !DILocation(line: 510, column: 15, scope: !657)
!659 = !DILocation(line: 510, column: 6, scope: !645)
!660 = !DILocation(line: 512, column: 15, scope: !661)
!661 = distinct !DILexicalBlock(scope: !657, file: !69, line: 511, column: 3)
!662 = !DILocation(line: 512, column: 11, scope: !661)
!663 = !DILocation(line: 512, column: 4, scope: !661)
!664 = !DILocation(line: 516, column: 4, scope: !665)
!665 = distinct !DILexicalBlock(scope: !657, file: !69, line: 515, column: 3)
!666 = !DILocation(line: 519, column: 1, scope: !624)
!667 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 536, type: !668, scopeLine: 537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!668 = !DISubroutineType(types: !669)
!669 = !{!28, !16, !28}
!670 = !DILocalVariable(name: "x_value", arg: 1, scope: !667, file: !69, line: 536, type: !16)
!671 = !DILocation(line: 536, column: 25, scope: !667)
!672 = !DILocalVariable(name: "y_value", arg: 2, scope: !667, file: !69, line: 536, type: !28)
!673 = !DILocation(line: 536, column: 38, scope: !667)
!674 = !DILocalVariable(name: "s32Temp1", scope: !667, file: !69, line: 538, type: !16)
!675 = !DILocation(line: 538, column: 6, scope: !667)
!676 = !DILocation(line: 539, column: 12, scope: !667)
!677 = !DILocation(line: 539, column: 20, scope: !667)
!678 = !DILocation(line: 539, column: 10, scope: !667)
!679 = !DILocation(line: 540, column: 6, scope: !680)
!680 = distinct !DILexicalBlock(scope: !667, file: !69, line: 540, column: 5)
!681 = !DILocation(line: 540, column: 14, scope: !680)
!682 = !DILocation(line: 540, column: 24, scope: !680)
!683 = !DILocation(line: 540, column: 5, scope: !667)
!684 = !DILocation(line: 542, column: 6, scope: !685)
!685 = distinct !DILexicalBlock(scope: !686, file: !69, line: 542, column: 6)
!686 = distinct !DILexicalBlock(scope: !680, file: !69, line: 541, column: 2)
!687 = !DILocation(line: 542, column: 14, scope: !685)
!688 = !DILocation(line: 542, column: 6, scope: !686)
!689 = !DILocation(line: 544, column: 4, scope: !690)
!690 = distinct !DILexicalBlock(scope: !685, file: !69, line: 543, column: 3)
!691 = !DILocation(line: 548, column: 4, scope: !692)
!692 = distinct !DILexicalBlock(scope: !685, file: !69, line: 547, column: 3)
!693 = !DILocation(line: 553, column: 15, scope: !694)
!694 = distinct !DILexicalBlock(scope: !680, file: !69, line: 552, column: 2)
!695 = !DILocation(line: 553, column: 27, scope: !694)
!696 = !DILocation(line: 553, column: 35, scope: !694)
!697 = !DILocation(line: 553, column: 34, scope: !694)
!698 = !DILocation(line: 553, column: 46, scope: !694)
!699 = !DILocation(line: 553, column: 44, scope: !694)
!700 = !DILocation(line: 553, column: 23, scope: !694)
!701 = !DILocation(line: 553, column: 56, scope: !694)
!702 = !DILocation(line: 553, column: 12, scope: !694)
!703 = !DILocation(line: 554, column: 15, scope: !694)
!704 = !DILocation(line: 554, column: 24, scope: !694)
!705 = !DILocation(line: 554, column: 23, scope: !694)
!706 = !DILocation(line: 554, column: 36, scope: !694)
!707 = !DILocation(line: 554, column: 44, scope: !694)
!708 = !DILocation(line: 554, column: 43, scope: !694)
!709 = !DILocation(line: 554, column: 33, scope: !694)
!710 = !DILocation(line: 554, column: 12, scope: !694)
!711 = !DILocation(line: 555, column: 6, scope: !712)
!712 = distinct !DILexicalBlock(scope: !694, file: !69, line: 555, column: 6)
!713 = !DILocation(line: 555, column: 15, scope: !712)
!714 = !DILocation(line: 555, column: 6, scope: !694)
!715 = !DILocation(line: 557, column: 7, scope: !716)
!716 = distinct !DILexicalBlock(scope: !717, file: !69, line: 557, column: 7)
!717 = distinct !DILexicalBlock(scope: !712, file: !69, line: 556, column: 3)
!718 = !DILocation(line: 557, column: 16, scope: !716)
!719 = !DILocation(line: 557, column: 7, scope: !717)
!720 = !DILocation(line: 559, column: 17, scope: !721)
!721 = distinct !DILexicalBlock(scope: !716, file: !69, line: 558, column: 4)
!722 = !DILocation(line: 559, column: 12, scope: !721)
!723 = !DILocation(line: 559, column: 5, scope: !721)
!724 = !DILocation(line: 563, column: 5, scope: !725)
!725 = distinct !DILexicalBlock(scope: !716, file: !69, line: 562, column: 4)
!726 = !DILocation(line: 568, column: 4, scope: !727)
!727 = distinct !DILexicalBlock(scope: !712, file: !69, line: 567, column: 3)
!728 = !DILocation(line: 571, column: 1, scope: !667)
!729 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 589, type: !730, scopeLine: 590, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!730 = !DISubroutineType(types: !731)
!731 = !{!28, !28, !28}
!732 = !DILocalVariable(name: "numerator", arg: 1, scope: !729, file: !69, line: 589, type: !28)
!733 = !DILocation(line: 589, column: 31, scope: !729)
!734 = !DILocalVariable(name: "denominator", arg: 2, scope: !729, file: !69, line: 589, type: !28)
!735 = !DILocation(line: 589, column: 46, scope: !729)
!736 = !DILocalVariable(name: "u32Temp", scope: !729, file: !69, line: 591, type: !632)
!737 = !DILocation(line: 591, column: 6, scope: !729)
!738 = !DILocation(line: 592, column: 5, scope: !739)
!739 = distinct !DILexicalBlock(scope: !729, file: !69, line: 592, column: 5)
!740 = !DILocation(line: 592, column: 17, scope: !739)
!741 = !DILocation(line: 592, column: 5, scope: !729)
!742 = !DILocation(line: 594, column: 3, scope: !743)
!743 = distinct !DILexicalBlock(scope: !739, file: !69, line: 593, column: 2)
!744 = !DILocation(line: 598, column: 14, scope: !745)
!745 = distinct !DILexicalBlock(scope: !739, file: !69, line: 597, column: 2)
!746 = !DILocation(line: 598, column: 23, scope: !745)
!747 = !DILocation(line: 598, column: 32, scope: !745)
!748 = !DILocation(line: 598, column: 44, scope: !745)
!749 = !DILocation(line: 598, column: 29, scope: !745)
!750 = !DILocation(line: 598, column: 11, scope: !745)
!751 = !DILocation(line: 599, column: 13, scope: !745)
!752 = !DILocation(line: 599, column: 21, scope: !745)
!753 = !DILocation(line: 599, column: 20, scope: !745)
!754 = !DILocation(line: 599, column: 11, scope: !745)
!755 = !DILocation(line: 600, column: 6, scope: !756)
!756 = distinct !DILexicalBlock(scope: !745, file: !69, line: 600, column: 6)
!757 = !DILocation(line: 600, column: 14, scope: !756)
!758 = !DILocation(line: 600, column: 6, scope: !745)
!759 = !DILocation(line: 602, column: 11, scope: !760)
!760 = distinct !DILexicalBlock(scope: !756, file: !69, line: 601, column: 3)
!761 = !DILocation(line: 602, column: 19, scope: !760)
!762 = !DILocation(line: 602, column: 4, scope: !760)
!763 = !DILocation(line: 606, column: 4, scope: !764)
!764 = distinct !DILexicalBlock(scope: !756, file: !69, line: 605, column: 3)
!765 = !DILocation(line: 610, column: 1, scope: !729)
!766 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 627, type: !767, scopeLine: 628, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!767 = !DISubroutineType(types: !768)
!768 = !{!28, !632, !28}
!769 = !DILocalVariable(name: "x_value", arg: 1, scope: !766, file: !69, line: 627, type: !632)
!770 = !DILocation(line: 627, column: 25, scope: !766)
!771 = !DILocalVariable(name: "y_value", arg: 2, scope: !766, file: !69, line: 627, type: !28)
!772 = !DILocation(line: 627, column: 38, scope: !766)
!773 = !DILocalVariable(name: "u32Temp1", scope: !766, file: !69, line: 629, type: !632)
!774 = !DILocation(line: 629, column: 6, scope: !766)
!775 = !DILocalVariable(name: "u32Temp2", scope: !766, file: !69, line: 629, type: !632)
!776 = !DILocation(line: 629, column: 17, scope: !766)
!777 = !DILocation(line: 630, column: 12, scope: !766)
!778 = !DILocation(line: 630, column: 20, scope: !766)
!779 = !DILocation(line: 630, column: 10, scope: !766)
!780 = !DILocation(line: 631, column: 5, scope: !781)
!781 = distinct !DILexicalBlock(scope: !766, file: !69, line: 631, column: 5)
!782 = !DILocation(line: 631, column: 13, scope: !781)
!783 = !DILocation(line: 631, column: 5, scope: !766)
!784 = !DILocation(line: 633, column: 3, scope: !785)
!785 = distinct !DILexicalBlock(scope: !781, file: !69, line: 632, column: 2)
!786 = !DILocation(line: 637, column: 14, scope: !787)
!787 = distinct !DILexicalBlock(scope: !781, file: !69, line: 636, column: 2)
!788 = !DILocation(line: 637, column: 22, scope: !787)
!789 = !DILocation(line: 637, column: 21, scope: !787)
!790 = !DILocation(line: 637, column: 12, scope: !787)
!791 = !DILocation(line: 638, column: 14, scope: !787)
!792 = !DILocation(line: 638, column: 25, scope: !787)
!793 = !DILocation(line: 638, column: 36, scope: !787)
!794 = !DILocation(line: 638, column: 34, scope: !787)
!795 = !DILocation(line: 638, column: 22, scope: !787)
!796 = !DILocation(line: 638, column: 45, scope: !787)
!797 = !DILocation(line: 638, column: 12, scope: !787)
!798 = !DILocation(line: 639, column: 15, scope: !787)
!799 = !DILocation(line: 639, column: 24, scope: !787)
!800 = !DILocation(line: 639, column: 23, scope: !787)
!801 = !DILocation(line: 639, column: 36, scope: !787)
!802 = !DILocation(line: 639, column: 44, scope: !787)
!803 = !DILocation(line: 639, column: 43, scope: !787)
!804 = !DILocation(line: 639, column: 33, scope: !787)
!805 = !DILocation(line: 639, column: 12, scope: !787)
!806 = !DILocation(line: 640, column: 6, scope: !807)
!807 = distinct !DILexicalBlock(scope: !787, file: !69, line: 640, column: 6)
!808 = !DILocation(line: 640, column: 15, scope: !807)
!809 = !DILocation(line: 640, column: 6, scope: !787)
!810 = !DILocation(line: 642, column: 11, scope: !811)
!811 = distinct !DILexicalBlock(scope: !807, file: !69, line: 641, column: 3)
!812 = !DILocation(line: 642, column: 20, scope: !811)
!813 = !DILocation(line: 642, column: 4, scope: !811)
!814 = !DILocation(line: 646, column: 4, scope: !815)
!815 = distinct !DILexicalBlock(scope: !807, file: !69, line: 645, column: 3)
!816 = !DILocation(line: 650, column: 1, scope: !766)
!817 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 669, type: !818, scopeLine: 670, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!818 = !DISubroutineType(types: !819)
!819 = !{!6, !6, !28, !6}
!820 = !DILocalVariable(name: "factor1", arg: 1, scope: !817, file: !69, line: 669, type: !6)
!821 = !DILocation(line: 669, column: 33, scope: !817)
!822 = !DILocalVariable(name: "factor2", arg: 2, scope: !817, file: !69, line: 669, type: !28)
!823 = !DILocation(line: 669, column: 46, scope: !817)
!824 = !DILocalVariable(name: "denominator", arg: 3, scope: !817, file: !69, line: 669, type: !6)
!825 = !DILocation(line: 669, column: 59, scope: !817)
!826 = !DILocalVariable(name: "s32Result", scope: !817, file: !69, line: 671, type: !16)
!827 = !DILocation(line: 671, column: 6, scope: !817)
!828 = !DILocalVariable(name: "s32Temp1", scope: !817, file: !69, line: 671, type: !16)
!829 = !DILocation(line: 671, column: 21, scope: !817)
!830 = !DILocation(line: 672, column: 14, scope: !817)
!831 = !DILocation(line: 672, column: 24, scope: !817)
!832 = !DILocation(line: 672, column: 22, scope: !817)
!833 = !DILocation(line: 672, column: 12, scope: !817)
!834 = !DILocation(line: 673, column: 5, scope: !835)
!835 = distinct !DILexicalBlock(scope: !817, file: !69, line: 673, column: 5)
!836 = !DILocation(line: 673, column: 17, scope: !835)
!837 = !DILocation(line: 673, column: 5, scope: !817)
!838 = !DILocation(line: 675, column: 6, scope: !839)
!839 = distinct !DILexicalBlock(scope: !840, file: !69, line: 675, column: 6)
!840 = distinct !DILexicalBlock(scope: !835, file: !69, line: 674, column: 2)
!841 = !DILocation(line: 675, column: 16, scope: !839)
!842 = !DILocation(line: 675, column: 6, scope: !840)
!843 = !DILocation(line: 677, column: 4, scope: !844)
!844 = distinct !DILexicalBlock(scope: !839, file: !69, line: 676, column: 3)
!845 = !DILocation(line: 681, column: 4, scope: !846)
!846 = distinct !DILexicalBlock(scope: !839, file: !69, line: 680, column: 3)
!847 = !DILocation(line: 686, column: 14, scope: !848)
!848 = distinct !DILexicalBlock(scope: !835, file: !69, line: 685, column: 2)
!849 = !DILocation(line: 686, column: 27, scope: !848)
!850 = !DILocation(line: 686, column: 37, scope: !848)
!851 = !DILocation(line: 686, column: 36, scope: !848)
!852 = !DILocation(line: 686, column: 50, scope: !848)
!853 = !DILocation(line: 686, column: 49, scope: !848)
!854 = !DILocation(line: 686, column: 24, scope: !848)
!855 = !DILocation(line: 686, column: 12, scope: !848)
!856 = !DILocation(line: 687, column: 14, scope: !848)
!857 = !DILocation(line: 687, column: 23, scope: !848)
!858 = !DILocation(line: 687, column: 12, scope: !848)
!859 = !DILocation(line: 688, column: 16, scope: !848)
!860 = !DILocation(line: 688, column: 25, scope: !848)
!861 = !DILocation(line: 688, column: 24, scope: !848)
!862 = !DILocation(line: 688, column: 41, scope: !848)
!863 = !DILocation(line: 688, column: 51, scope: !848)
!864 = !DILocation(line: 688, column: 50, scope: !848)
!865 = !DILocation(line: 688, column: 38, scope: !848)
!866 = !DILocation(line: 688, column: 13, scope: !848)
!867 = !DILocation(line: 689, column: 6, scope: !868)
!868 = distinct !DILexicalBlock(scope: !848, file: !69, line: 689, column: 6)
!869 = !DILocation(line: 689, column: 16, scope: !868)
!870 = !DILocation(line: 689, column: 6, scope: !848)
!871 = !DILocation(line: 691, column: 7, scope: !872)
!872 = distinct !DILexicalBlock(scope: !873, file: !69, line: 691, column: 7)
!873 = distinct !DILexicalBlock(scope: !868, file: !69, line: 690, column: 3)
!874 = !DILocation(line: 691, column: 17, scope: !872)
!875 = !DILocation(line: 691, column: 7, scope: !873)
!876 = !DILocation(line: 693, column: 17, scope: !877)
!877 = distinct !DILexicalBlock(scope: !872, file: !69, line: 692, column: 4)
!878 = !DILocation(line: 693, column: 12, scope: !877)
!879 = !DILocation(line: 693, column: 5, scope: !877)
!880 = !DILocation(line: 698, column: 5, scope: !881)
!881 = distinct !DILexicalBlock(scope: !872, file: !69, line: 697, column: 4)
!882 = !DILocation(line: 703, column: 4, scope: !883)
!883 = distinct !DILexicalBlock(scope: !868, file: !69, line: 702, column: 3)
!884 = !DILocation(line: 707, column: 1, scope: !817)
!885 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 725, type: !886, scopeLine: 726, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!886 = !DISubroutineType(types: !887)
!887 = !{!6, !28, !6, !28}
!888 = !DILocalVariable(name: "factor1", arg: 1, scope: !885, file: !69, line: 725, type: !28)
!889 = !DILocation(line: 725, column: 33, scope: !885)
!890 = !DILocalVariable(name: "factor2", arg: 2, scope: !885, file: !69, line: 725, type: !6)
!891 = !DILocation(line: 725, column: 46, scope: !885)
!892 = !DILocalVariable(name: "denominator", arg: 3, scope: !885, file: !69, line: 725, type: !28)
!893 = !DILocation(line: 725, column: 59, scope: !885)
!894 = !DILocalVariable(name: "s32Result", scope: !885, file: !69, line: 727, type: !16)
!895 = !DILocation(line: 727, column: 6, scope: !885)
!896 = !DILocalVariable(name: "s32Temp1", scope: !885, file: !69, line: 727, type: !16)
!897 = !DILocation(line: 727, column: 21, scope: !885)
!898 = !DILocation(line: 728, column: 14, scope: !885)
!899 = !DILocation(line: 728, column: 24, scope: !885)
!900 = !DILocation(line: 728, column: 22, scope: !885)
!901 = !DILocation(line: 728, column: 12, scope: !885)
!902 = !DILocation(line: 729, column: 5, scope: !903)
!903 = distinct !DILexicalBlock(scope: !885, file: !69, line: 729, column: 5)
!904 = !DILocation(line: 729, column: 16, scope: !903)
!905 = !DILocation(line: 729, column: 5, scope: !885)
!906 = !DILocation(line: 731, column: 6, scope: !907)
!907 = distinct !DILexicalBlock(scope: !908, file: !69, line: 731, column: 6)
!908 = distinct !DILexicalBlock(scope: !903, file: !69, line: 730, column: 2)
!909 = !DILocation(line: 731, column: 16, scope: !907)
!910 = !DILocation(line: 731, column: 6, scope: !908)
!911 = !DILocation(line: 733, column: 4, scope: !912)
!912 = distinct !DILexicalBlock(scope: !907, file: !69, line: 732, column: 3)
!913 = !DILocation(line: 737, column: 4, scope: !914)
!914 = distinct !DILexicalBlock(scope: !907, file: !69, line: 736, column: 3)
!915 = !DILocation(line: 742, column: 14, scope: !916)
!916 = distinct !DILexicalBlock(scope: !903, file: !69, line: 741, column: 2)
!917 = !DILocation(line: 742, column: 28, scope: !916)
!918 = !DILocation(line: 742, column: 38, scope: !916)
!919 = !DILocation(line: 742, column: 37, scope: !916)
!920 = !DILocation(line: 742, column: 53, scope: !916)
!921 = !DILocation(line: 742, column: 51, scope: !916)
!922 = !DILocation(line: 742, column: 24, scope: !916)
!923 = !DILocation(line: 742, column: 66, scope: !916)
!924 = !DILocation(line: 742, column: 12, scope: !916)
!925 = !DILocation(line: 743, column: 16, scope: !916)
!926 = !DILocation(line: 743, column: 25, scope: !916)
!927 = !DILocation(line: 743, column: 24, scope: !916)
!928 = !DILocation(line: 743, column: 41, scope: !916)
!929 = !DILocation(line: 743, column: 51, scope: !916)
!930 = !DILocation(line: 743, column: 50, scope: !916)
!931 = !DILocation(line: 743, column: 38, scope: !916)
!932 = !DILocation(line: 743, column: 13, scope: !916)
!933 = !DILocation(line: 744, column: 6, scope: !934)
!934 = distinct !DILexicalBlock(scope: !916, file: !69, line: 744, column: 6)
!935 = !DILocation(line: 744, column: 16, scope: !934)
!936 = !DILocation(line: 744, column: 6, scope: !916)
!937 = !DILocation(line: 746, column: 7, scope: !938)
!938 = distinct !DILexicalBlock(scope: !939, file: !69, line: 746, column: 7)
!939 = distinct !DILexicalBlock(scope: !934, file: !69, line: 745, column: 3)
!940 = !DILocation(line: 746, column: 17, scope: !938)
!941 = !DILocation(line: 746, column: 7, scope: !939)
!942 = !DILocation(line: 748, column: 17, scope: !943)
!943 = distinct !DILexicalBlock(scope: !938, file: !69, line: 747, column: 4)
!944 = !DILocation(line: 748, column: 12, scope: !943)
!945 = !DILocation(line: 748, column: 5, scope: !943)
!946 = !DILocation(line: 752, column: 5, scope: !947)
!947 = distinct !DILexicalBlock(scope: !938, file: !69, line: 751, column: 4)
!948 = !DILocation(line: 757, column: 4, scope: !949)
!949 = distinct !DILexicalBlock(scope: !934, file: !69, line: 756, column: 3)
!950 = !DILocation(line: 760, column: 1, scope: !885)
!951 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 779, type: !952, scopeLine: 780, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!952 = !DISubroutineType(types: !953)
!953 = !{!28, !6, !28, !6}
!954 = !DILocalVariable(name: "factor1", arg: 1, scope: !951, file: !69, line: 779, type: !6)
!955 = !DILocation(line: 779, column: 33, scope: !951)
!956 = !DILocalVariable(name: "factor2", arg: 2, scope: !951, file: !69, line: 779, type: !28)
!957 = !DILocation(line: 779, column: 46, scope: !951)
!958 = !DILocalVariable(name: "denominator", arg: 3, scope: !951, file: !69, line: 779, type: !6)
!959 = !DILocation(line: 779, column: 59, scope: !951)
!960 = !DILocalVariable(name: "u32Result", scope: !951, file: !69, line: 781, type: !632)
!961 = !DILocation(line: 781, column: 6, scope: !951)
!962 = !DILocalVariable(name: "u32Temp1", scope: !951, file: !69, line: 781, type: !632)
!963 = !DILocation(line: 781, column: 21, scope: !951)
!964 = !DILocalVariable(name: "s32Result", scope: !951, file: !69, line: 782, type: !16)
!965 = !DILocation(line: 782, column: 6, scope: !951)
!966 = !DILocalVariable(name: "s32Temp1", scope: !951, file: !69, line: 782, type: !16)
!967 = !DILocation(line: 782, column: 21, scope: !951)
!968 = !DILocation(line: 783, column: 14, scope: !951)
!969 = !DILocation(line: 783, column: 24, scope: !951)
!970 = !DILocation(line: 783, column: 22, scope: !951)
!971 = !DILocation(line: 783, column: 12, scope: !951)
!972 = !DILocation(line: 785, column: 5, scope: !973)
!973 = distinct !DILexicalBlock(scope: !951, file: !69, line: 785, column: 5)
!974 = !DILocation(line: 785, column: 17, scope: !973)
!975 = !DILocation(line: 785, column: 5, scope: !951)
!976 = !DILocation(line: 787, column: 6, scope: !977)
!977 = distinct !DILexicalBlock(scope: !978, file: !69, line: 787, column: 6)
!978 = distinct !DILexicalBlock(scope: !973, file: !69, line: 786, column: 2)
!979 = !DILocation(line: 787, column: 16, scope: !977)
!980 = !DILocation(line: 787, column: 6, scope: !978)
!981 = !DILocation(line: 789, column: 4, scope: !982)
!982 = distinct !DILexicalBlock(scope: !977, file: !69, line: 788, column: 3)
!983 = !DILocation(line: 793, column: 4, scope: !984)
!984 = distinct !DILexicalBlock(scope: !977, file: !69, line: 792, column: 3)
!985 = !DILocation(line: 798, column: 15, scope: !986)
!986 = distinct !DILexicalBlock(scope: !973, file: !69, line: 797, column: 2)
!987 = !DILocation(line: 798, column: 29, scope: !986)
!988 = !DILocation(line: 798, column: 39, scope: !986)
!989 = !DILocation(line: 798, column: 38, scope: !986)
!990 = !DILocation(line: 798, column: 54, scope: !986)
!991 = !DILocation(line: 798, column: 52, scope: !986)
!992 = !DILocation(line: 798, column: 25, scope: !986)
!993 = !DILocation(line: 798, column: 68, scope: !986)
!994 = !DILocation(line: 798, column: 12, scope: !986)
!995 = !DILocation(line: 799, column: 16, scope: !986)
!996 = !DILocation(line: 799, column: 25, scope: !986)
!997 = !DILocation(line: 799, column: 24, scope: !986)
!998 = !DILocation(line: 799, column: 41, scope: !986)
!999 = !DILocation(line: 799, column: 51, scope: !986)
!1000 = !DILocation(line: 799, column: 50, scope: !986)
!1001 = !DILocation(line: 799, column: 38, scope: !986)
!1002 = !DILocation(line: 799, column: 13, scope: !986)
!1003 = !DILocation(line: 800, column: 6, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !986, file: !69, line: 800, column: 6)
!1005 = !DILocation(line: 800, column: 16, scope: !1004)
!1006 = !DILocation(line: 800, column: 6, scope: !986)
!1007 = !DILocation(line: 802, column: 7, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !1009, file: !69, line: 802, column: 7)
!1009 = distinct !DILexicalBlock(scope: !1004, file: !69, line: 801, column: 3)
!1010 = !DILocation(line: 802, column: 17, scope: !1008)
!1011 = !DILocation(line: 802, column: 7, scope: !1009)
!1012 = !DILocation(line: 804, column: 17, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !1008, file: !69, line: 803, column: 4)
!1014 = !DILocation(line: 804, column: 12, scope: !1013)
!1015 = !DILocation(line: 804, column: 5, scope: !1013)
!1016 = !DILocation(line: 808, column: 5, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !1008, file: !69, line: 807, column: 4)
!1018 = !DILocation(line: 813, column: 4, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1004, file: !69, line: 812, column: 3)
!1020 = !DILocation(line: 816, column: 1, scope: !951)
!1021 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 835, type: !1022, scopeLine: 836, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1022 = !DISubroutineType(types: !1023)
!1023 = !{!28, !6, !28, !28}
!1024 = !DILocalVariable(name: "factor1", arg: 1, scope: !1021, file: !69, line: 835, type: !6)
!1025 = !DILocation(line: 835, column: 33, scope: !1021)
!1026 = !DILocalVariable(name: "factor2", arg: 2, scope: !1021, file: !69, line: 835, type: !28)
!1027 = !DILocation(line: 835, column: 46, scope: !1021)
!1028 = !DILocalVariable(name: "denominator", arg: 3, scope: !1021, file: !69, line: 835, type: !28)
!1029 = !DILocation(line: 835, column: 59, scope: !1021)
!1030 = !DILocalVariable(name: "s32Result", scope: !1021, file: !69, line: 837, type: !16)
!1031 = !DILocation(line: 837, column: 6, scope: !1021)
!1032 = !DILocalVariable(name: "s32Temp1", scope: !1021, file: !69, line: 837, type: !16)
!1033 = !DILocation(line: 837, column: 21, scope: !1021)
!1034 = !DILocation(line: 838, column: 14, scope: !1021)
!1035 = !DILocation(line: 838, column: 24, scope: !1021)
!1036 = !DILocation(line: 838, column: 22, scope: !1021)
!1037 = !DILocation(line: 838, column: 12, scope: !1021)
!1038 = !DILocation(line: 840, column: 5, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1021, file: !69, line: 840, column: 5)
!1040 = !DILocation(line: 840, column: 17, scope: !1039)
!1041 = !DILocation(line: 840, column: 5, scope: !1021)
!1042 = !DILocation(line: 842, column: 6, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !1044, file: !69, line: 842, column: 6)
!1044 = distinct !DILexicalBlock(scope: !1039, file: !69, line: 841, column: 2)
!1045 = !DILocation(line: 842, column: 16, scope: !1043)
!1046 = !DILocation(line: 842, column: 6, scope: !1044)
!1047 = !DILocation(line: 844, column: 4, scope: !1048)
!1048 = distinct !DILexicalBlock(scope: !1043, file: !69, line: 843, column: 3)
!1049 = !DILocation(line: 848, column: 4, scope: !1050)
!1050 = distinct !DILexicalBlock(scope: !1043, file: !69, line: 847, column: 3)
!1051 = !DILocation(line: 853, column: 15, scope: !1052)
!1052 = distinct !DILexicalBlock(scope: !1039, file: !69, line: 852, column: 2)
!1053 = !DILocation(line: 853, column: 29, scope: !1052)
!1054 = !DILocation(line: 853, column: 39, scope: !1052)
!1055 = !DILocation(line: 853, column: 38, scope: !1052)
!1056 = !DILocation(line: 853, column: 54, scope: !1052)
!1057 = !DILocation(line: 853, column: 52, scope: !1052)
!1058 = !DILocation(line: 853, column: 25, scope: !1052)
!1059 = !DILocation(line: 853, column: 68, scope: !1052)
!1060 = !DILocation(line: 853, column: 12, scope: !1052)
!1061 = !DILocation(line: 854, column: 16, scope: !1052)
!1062 = !DILocation(line: 854, column: 25, scope: !1052)
!1063 = !DILocation(line: 854, column: 24, scope: !1052)
!1064 = !DILocation(line: 854, column: 41, scope: !1052)
!1065 = !DILocation(line: 854, column: 51, scope: !1052)
!1066 = !DILocation(line: 854, column: 50, scope: !1052)
!1067 = !DILocation(line: 854, column: 38, scope: !1052)
!1068 = !DILocation(line: 854, column: 13, scope: !1052)
!1069 = !DILocation(line: 855, column: 6, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1052, file: !69, line: 855, column: 6)
!1071 = !DILocation(line: 855, column: 16, scope: !1070)
!1072 = !DILocation(line: 855, column: 6, scope: !1052)
!1073 = !DILocation(line: 857, column: 7, scope: !1074)
!1074 = distinct !DILexicalBlock(scope: !1075, file: !69, line: 857, column: 7)
!1075 = distinct !DILexicalBlock(scope: !1070, file: !69, line: 856, column: 3)
!1076 = !DILocation(line: 857, column: 17, scope: !1074)
!1077 = !DILocation(line: 857, column: 7, scope: !1075)
!1078 = !DILocation(line: 859, column: 17, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1074, file: !69, line: 858, column: 4)
!1080 = !DILocation(line: 859, column: 12, scope: !1079)
!1081 = !DILocation(line: 859, column: 5, scope: !1079)
!1082 = !DILocation(line: 863, column: 5, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1074, file: !69, line: 862, column: 4)
!1084 = !DILocation(line: 868, column: 4, scope: !1085)
!1085 = distinct !DILexicalBlock(scope: !1070, file: !69, line: 867, column: 3)
!1086 = !DILocation(line: 872, column: 1, scope: !1021)
!1087 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 890, type: !1088, scopeLine: 891, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1088 = !DISubroutineType(types: !1089)
!1089 = !{!28, !28, !28, !28}
!1090 = !DILocalVariable(name: "factor1", arg: 1, scope: !1087, file: !69, line: 890, type: !28)
!1091 = !DILocation(line: 890, column: 33, scope: !1087)
!1092 = !DILocalVariable(name: "factor2", arg: 2, scope: !1087, file: !69, line: 890, type: !28)
!1093 = !DILocation(line: 890, column: 46, scope: !1087)
!1094 = !DILocalVariable(name: "denominator", arg: 3, scope: !1087, file: !69, line: 890, type: !28)
!1095 = !DILocation(line: 890, column: 59, scope: !1087)
!1096 = !DILocalVariable(name: "u32Temp1", scope: !1087, file: !69, line: 892, type: !632)
!1097 = !DILocation(line: 892, column: 6, scope: !1087)
!1098 = !DILocalVariable(name: "u16TempDenom", scope: !1087, file: !69, line: 893, type: !28)
!1099 = !DILocation(line: 893, column: 6, scope: !1087)
!1100 = !DILocation(line: 895, column: 5, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1087, file: !69, line: 895, column: 5)
!1102 = !DILocation(line: 895, column: 17, scope: !1101)
!1103 = !DILocation(line: 895, column: 5, scope: !1087)
!1104 = !DILocation(line: 897, column: 3, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1101, file: !69, line: 896, column: 2)
!1106 = !DILocation(line: 901, column: 14, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1101, file: !69, line: 900, column: 2)
!1108 = !DILocation(line: 901, column: 24, scope: !1107)
!1109 = !DILocation(line: 901, column: 22, scope: !1107)
!1110 = !DILocation(line: 901, column: 12, scope: !1107)
!1111 = !DILocation(line: 902, column: 18, scope: !1107)
!1112 = !DILocation(line: 902, column: 30, scope: !1107)
!1113 = !DILocation(line: 902, column: 16, scope: !1107)
!1114 = !DILocation(line: 903, column: 14, scope: !1107)
!1115 = !DILocation(line: 903, column: 25, scope: !1107)
!1116 = !DILocation(line: 903, column: 23, scope: !1107)
!1117 = !DILocation(line: 903, column: 12, scope: !1107)
!1118 = !DILocation(line: 904, column: 14, scope: !1107)
!1119 = !DILocation(line: 904, column: 25, scope: !1107)
!1120 = !DILocation(line: 904, column: 23, scope: !1107)
!1121 = !DILocation(line: 904, column: 12, scope: !1107)
!1122 = !DILocation(line: 905, column: 6, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1107, file: !69, line: 905, column: 6)
!1124 = !DILocation(line: 905, column: 15, scope: !1123)
!1125 = !DILocation(line: 905, column: 6, scope: !1107)
!1126 = !DILocation(line: 907, column: 12, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1123, file: !69, line: 906, column: 3)
!1128 = !DILocation(line: 907, column: 21, scope: !1127)
!1129 = !DILocation(line: 907, column: 11, scope: !1127)
!1130 = !DILocation(line: 907, column: 4, scope: !1127)
!1131 = !DILocation(line: 912, column: 4, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1123, file: !69, line: 911, column: 3)
!1133 = !DILocation(line: 917, column: 1, scope: !1087)
!1134 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 934, type: !1135, scopeLine: 935, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1135 = !DISubroutineType(types: !1136)
!1136 = !{!28, !28, !28, !632}
!1137 = !DILocalVariable(name: "factor1", arg: 1, scope: !1134, file: !69, line: 934, type: !28)
!1138 = !DILocation(line: 934, column: 33, scope: !1134)
!1139 = !DILocalVariable(name: "factor2", arg: 2, scope: !1134, file: !69, line: 934, type: !28)
!1140 = !DILocation(line: 934, column: 46, scope: !1134)
!1141 = !DILocalVariable(name: "denominator", arg: 3, scope: !1134, file: !69, line: 934, type: !632)
!1142 = !DILocation(line: 934, column: 59, scope: !1134)
!1143 = !DILocalVariable(name: "u32Temp1", scope: !1134, file: !69, line: 936, type: !632)
!1144 = !DILocation(line: 936, column: 6, scope: !1134)
!1145 = !DILocation(line: 937, column: 5, scope: !1146)
!1146 = distinct !DILexicalBlock(scope: !1134, file: !69, line: 937, column: 5)
!1147 = !DILocation(line: 937, column: 17, scope: !1146)
!1148 = !DILocation(line: 937, column: 5, scope: !1134)
!1149 = !DILocation(line: 939, column: 3, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1146, file: !69, line: 938, column: 2)
!1151 = !DILocation(line: 943, column: 15, scope: !1152)
!1152 = distinct !DILexicalBlock(scope: !1146, file: !69, line: 942, column: 2)
!1153 = !DILocation(line: 943, column: 25, scope: !1152)
!1154 = !DILocation(line: 943, column: 23, scope: !1152)
!1155 = !DILocation(line: 943, column: 36, scope: !1152)
!1156 = !DILocation(line: 943, column: 34, scope: !1152)
!1157 = !DILocation(line: 943, column: 12, scope: !1152)
!1158 = !DILocation(line: 944, column: 8, scope: !1159)
!1159 = distinct !DILexicalBlock(scope: !1152, file: !69, line: 944, column: 6)
!1160 = !DILocation(line: 944, column: 18, scope: !1159)
!1161 = !DILocation(line: 944, column: 16, scope: !1159)
!1162 = !DILocation(line: 944, column: 28, scope: !1159)
!1163 = !DILocation(line: 944, column: 40, scope: !1159)
!1164 = !DILocation(line: 944, column: 39, scope: !1159)
!1165 = !DILocation(line: 944, column: 26, scope: !1159)
!1166 = !DILocation(line: 944, column: 53, scope: !1159)
!1167 = !DILocation(line: 944, column: 64, scope: !1159)
!1168 = !DILocation(line: 944, column: 50, scope: !1159)
!1169 = !DILocation(line: 944, column: 6, scope: !1152)
!1170 = !DILocation(line: 946, column: 12, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1159, file: !69, line: 945, column: 3)
!1172 = !DILocation(line: 947, column: 3, scope: !1171)
!1173 = !DILocation(line: 948, column: 6, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1152, file: !69, line: 948, column: 6)
!1175 = !DILocation(line: 948, column: 15, scope: !1174)
!1176 = !DILocation(line: 948, column: 6, scope: !1152)
!1177 = !DILocation(line: 950, column: 12, scope: !1178)
!1178 = distinct !DILexicalBlock(scope: !1174, file: !69, line: 949, column: 3)
!1179 = !DILocation(line: 950, column: 21, scope: !1178)
!1180 = !DILocation(line: 950, column: 11, scope: !1178)
!1181 = !DILocation(line: 950, column: 4, scope: !1178)
!1182 = !DILocation(line: 954, column: 4, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1174, file: !69, line: 953, column: 3)
!1184 = !DILocation(line: 957, column: 1, scope: !1134)
!1185 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 974, type: !1186, scopeLine: 975, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1186 = !DISubroutineType(types: !1187)
!1187 = !{!632, !632, !28}
!1188 = !DILocalVariable(name: "x_value", arg: 1, scope: !1185, file: !69, line: 974, type: !632)
!1189 = !DILocation(line: 974, column: 25, scope: !1185)
!1190 = !DILocalVariable(name: "y_value", arg: 2, scope: !1185, file: !69, line: 974, type: !28)
!1191 = !DILocation(line: 974, column: 38, scope: !1185)
!1192 = !DILocalVariable(name: "u32Temp1", scope: !1185, file: !69, line: 976, type: !632)
!1193 = !DILocation(line: 976, column: 6, scope: !1185)
!1194 = !DILocation(line: 977, column: 5, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1185, file: !69, line: 977, column: 5)
!1196 = !DILocation(line: 977, column: 13, scope: !1195)
!1197 = !DILocation(line: 977, column: 5, scope: !1185)
!1198 = !DILocation(line: 979, column: 3, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1195, file: !69, line: 978, column: 2)
!1200 = !DILocation(line: 983, column: 15, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1195, file: !69, line: 982, column: 2)
!1202 = !DILocation(line: 983, column: 26, scope: !1201)
!1203 = !DILocation(line: 983, column: 34, scope: !1201)
!1204 = !DILocation(line: 983, column: 33, scope: !1201)
!1205 = !DILocation(line: 983, column: 45, scope: !1201)
!1206 = !DILocation(line: 983, column: 43, scope: !1201)
!1207 = !DILocation(line: 983, column: 23, scope: !1201)
!1208 = !DILocation(line: 983, column: 54, scope: !1201)
!1209 = !DILocation(line: 983, column: 12, scope: !1201)
!1210 = !DILocation(line: 984, column: 15, scope: !1201)
!1211 = !DILocation(line: 984, column: 23, scope: !1201)
!1212 = !DILocation(line: 984, column: 22, scope: !1201)
!1213 = !DILocation(line: 984, column: 35, scope: !1201)
!1214 = !DILocation(line: 984, column: 44, scope: !1201)
!1215 = !DILocation(line: 984, column: 43, scope: !1201)
!1216 = !DILocation(line: 984, column: 32, scope: !1201)
!1217 = !DILocation(line: 984, column: 12, scope: !1201)
!1218 = !DILocation(line: 985, column: 10, scope: !1201)
!1219 = !DILocation(line: 985, column: 3, scope: !1201)
!1220 = !DILocation(line: 987, column: 1, scope: !1185)
!1221 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 1005, type: !1222, scopeLine: 1006, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1222 = !DISubroutineType(types: !1223)
!1223 = !{!6, !6, !6, !6}
!1224 = !DILocalVariable(name: "fak1", arg: 1, scope: !1221, file: !69, line: 1005, type: !6)
!1225 = !DILocation(line: 1005, column: 33, scope: !1221)
!1226 = !DILocalVariable(name: "fak2", arg: 2, scope: !1221, file: !69, line: 1005, type: !6)
!1227 = !DILocation(line: 1005, column: 43, scope: !1221)
!1228 = !DILocalVariable(name: "div", arg: 3, scope: !1221, file: !69, line: 1005, type: !6)
!1229 = !DILocation(line: 1005, column: 53, scope: !1221)
!1230 = !DILocalVariable(name: "s32Temp1", scope: !1221, file: !69, line: 1007, type: !16)
!1231 = !DILocation(line: 1007, column: 6, scope: !1221)
!1232 = !DILocalVariable(name: "s32Temp2", scope: !1221, file: !69, line: 1007, type: !16)
!1233 = !DILocation(line: 1007, column: 20, scope: !1221)
!1234 = !DILocalVariable(name: "s32Temp3", scope: !1221, file: !69, line: 1007, type: !16)
!1235 = !DILocation(line: 1007, column: 34, scope: !1221)
!1236 = !DILocation(line: 1008, column: 13, scope: !1221)
!1237 = !DILocation(line: 1008, column: 20, scope: !1221)
!1238 = !DILocation(line: 1008, column: 18, scope: !1221)
!1239 = !DILocation(line: 1008, column: 11, scope: !1221)
!1240 = !DILocation(line: 1009, column: 5, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1221, file: !69, line: 1009, column: 5)
!1242 = !DILocation(line: 1009, column: 9, scope: !1241)
!1243 = !DILocation(line: 1009, column: 5, scope: !1221)
!1244 = !DILocation(line: 1011, column: 6, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1246, file: !69, line: 1011, column: 6)
!1246 = distinct !DILexicalBlock(scope: !1241, file: !69, line: 1010, column: 2)
!1247 = !DILocation(line: 1011, column: 15, scope: !1245)
!1248 = !DILocation(line: 1011, column: 6, scope: !1246)
!1249 = !DILocation(line: 1013, column: 4, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1245, file: !69, line: 1012, column: 3)
!1251 = !DILocation(line: 1017, column: 4, scope: !1252)
!1252 = distinct !DILexicalBlock(scope: !1245, file: !69, line: 1016, column: 3)
!1253 = !DILocation(line: 1022, column: 15, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1241, file: !69, line: 1021, column: 2)
!1255 = !DILocation(line: 1022, column: 28, scope: !1254)
!1256 = !DILocation(line: 1022, column: 39, scope: !1254)
!1257 = !DILocation(line: 1022, column: 37, scope: !1254)
!1258 = !DILocation(line: 1022, column: 46, scope: !1254)
!1259 = !DILocation(line: 1022, column: 44, scope: !1254)
!1260 = !DILocation(line: 1022, column: 24, scope: !1254)
!1261 = !DILocation(line: 1022, column: 52, scope: !1254)
!1262 = !DILocation(line: 1022, column: 12, scope: !1254)
!1263 = !DILocation(line: 1023, column: 15, scope: !1254)
!1264 = !DILocation(line: 1023, column: 24, scope: !1254)
!1265 = !DILocation(line: 1023, column: 23, scope: !1254)
!1266 = !DILocation(line: 1023, column: 32, scope: !1254)
!1267 = !DILocation(line: 1023, column: 41, scope: !1254)
!1268 = !DILocation(line: 1023, column: 40, scope: !1254)
!1269 = !DILocation(line: 1023, column: 29, scope: !1254)
!1270 = !DILocation(line: 1023, column: 12, scope: !1254)
!1271 = !DILocation(line: 1024, column: 6, scope: !1272)
!1272 = distinct !DILexicalBlock(scope: !1254, file: !69, line: 1024, column: 6)
!1273 = !DILocation(line: 1024, column: 15, scope: !1272)
!1274 = !DILocation(line: 1024, column: 6, scope: !1254)
!1275 = !DILocation(line: 1026, column: 7, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1277, file: !69, line: 1026, column: 7)
!1277 = distinct !DILexicalBlock(scope: !1272, file: !69, line: 1025, column: 3)
!1278 = !DILocation(line: 1026, column: 16, scope: !1276)
!1279 = !DILocation(line: 1026, column: 7, scope: !1277)
!1280 = !DILocation(line: 1028, column: 17, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1276, file: !69, line: 1027, column: 4)
!1282 = !DILocation(line: 1028, column: 12, scope: !1281)
!1283 = !DILocation(line: 1028, column: 5, scope: !1281)
!1284 = !DILocation(line: 1032, column: 5, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1276, file: !69, line: 1031, column: 4)
!1286 = !DILocation(line: 1037, column: 4, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1272, file: !69, line: 1036, column: 3)
!1288 = !DILocation(line: 1040, column: 1, scope: !1221)
!1289 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1058, type: !1290, scopeLine: 1059, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{!6, !6, !6, !28}
!1292 = !DILocalVariable(name: "data1", arg: 1, scope: !1289, file: !69, line: 1058, type: !6)
!1293 = !DILocation(line: 1058, column: 33, scope: !1289)
!1294 = !DILocalVariable(name: "data2", arg: 2, scope: !1289, file: !69, line: 1058, type: !6)
!1295 = !DILocation(line: 1058, column: 43, scope: !1289)
!1296 = !DILocalVariable(name: "denominator", arg: 3, scope: !1289, file: !69, line: 1058, type: !28)
!1297 = !DILocation(line: 1058, column: 53, scope: !1289)
!1298 = !DILocalVariable(name: "s32Result", scope: !1289, file: !69, line: 1060, type: !16)
!1299 = !DILocation(line: 1060, column: 6, scope: !1289)
!1300 = !DILocalVariable(name: "s32Temp1", scope: !1289, file: !69, line: 1060, type: !16)
!1301 = !DILocation(line: 1060, column: 21, scope: !1289)
!1302 = !DILocation(line: 1061, column: 14, scope: !1289)
!1303 = !DILocation(line: 1061, column: 22, scope: !1289)
!1304 = !DILocation(line: 1061, column: 20, scope: !1289)
!1305 = !DILocation(line: 1061, column: 12, scope: !1289)
!1306 = !DILocation(line: 1063, column: 5, scope: !1307)
!1307 = distinct !DILexicalBlock(scope: !1289, file: !69, line: 1063, column: 5)
!1308 = !DILocation(line: 1063, column: 17, scope: !1307)
!1309 = !DILocation(line: 1063, column: 5, scope: !1289)
!1310 = !DILocation(line: 1065, column: 6, scope: !1311)
!1311 = distinct !DILexicalBlock(scope: !1312, file: !69, line: 1065, column: 6)
!1312 = distinct !DILexicalBlock(scope: !1307, file: !69, line: 1064, column: 2)
!1313 = !DILocation(line: 1065, column: 16, scope: !1311)
!1314 = !DILocation(line: 1065, column: 6, scope: !1312)
!1315 = !DILocation(line: 1067, column: 4, scope: !1316)
!1316 = distinct !DILexicalBlock(scope: !1311, file: !69, line: 1066, column: 3)
!1317 = !DILocation(line: 1069, column: 11, scope: !1318)
!1318 = distinct !DILexicalBlock(scope: !1311, file: !69, line: 1069, column: 11)
!1319 = !DILocation(line: 1069, column: 21, scope: !1318)
!1320 = !DILocation(line: 1069, column: 11, scope: !1311)
!1321 = !DILocation(line: 1071, column: 4, scope: !1322)
!1322 = distinct !DILexicalBlock(scope: !1318, file: !69, line: 1070, column: 3)
!1323 = !DILocation(line: 1075, column: 4, scope: !1324)
!1324 = distinct !DILexicalBlock(scope: !1318, file: !69, line: 1074, column: 3)
!1325 = !DILocation(line: 1080, column: 15, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1307, file: !69, line: 1079, column: 2)
!1327 = !DILocation(line: 1080, column: 28, scope: !1326)
!1328 = !DILocation(line: 1080, column: 38, scope: !1326)
!1329 = !DILocation(line: 1080, column: 37, scope: !1326)
!1330 = !DILocation(line: 1080, column: 51, scope: !1326)
!1331 = !DILocation(line: 1080, column: 50, scope: !1326)
!1332 = !DILocation(line: 1080, column: 25, scope: !1326)
!1333 = !DILocation(line: 1080, column: 64, scope: !1326)
!1334 = !DILocation(line: 1080, column: 12, scope: !1326)
!1335 = !DILocation(line: 1081, column: 16, scope: !1326)
!1336 = !DILocation(line: 1081, column: 25, scope: !1326)
!1337 = !DILocation(line: 1081, column: 24, scope: !1326)
!1338 = !DILocation(line: 1081, column: 41, scope: !1326)
!1339 = !DILocation(line: 1081, column: 51, scope: !1326)
!1340 = !DILocation(line: 1081, column: 50, scope: !1326)
!1341 = !DILocation(line: 1081, column: 38, scope: !1326)
!1342 = !DILocation(line: 1081, column: 13, scope: !1326)
!1343 = !DILocation(line: 1082, column: 6, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1326, file: !69, line: 1082, column: 6)
!1345 = !DILocation(line: 1082, column: 16, scope: !1344)
!1346 = !DILocation(line: 1082, column: 6, scope: !1326)
!1347 = !DILocation(line: 1084, column: 7, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !1349, file: !69, line: 1084, column: 7)
!1349 = distinct !DILexicalBlock(scope: !1344, file: !69, line: 1083, column: 3)
!1350 = !DILocation(line: 1084, column: 17, scope: !1348)
!1351 = !DILocation(line: 1084, column: 7, scope: !1349)
!1352 = !DILocation(line: 1086, column: 17, scope: !1353)
!1353 = distinct !DILexicalBlock(scope: !1348, file: !69, line: 1085, column: 4)
!1354 = !DILocation(line: 1086, column: 12, scope: !1353)
!1355 = !DILocation(line: 1086, column: 5, scope: !1353)
!1356 = !DILocation(line: 1090, column: 5, scope: !1357)
!1357 = distinct !DILexicalBlock(scope: !1348, file: !69, line: 1089, column: 4)
!1358 = !DILocation(line: 1095, column: 4, scope: !1359)
!1359 = distinct !DILexicalBlock(scope: !1344, file: !69, line: 1094, column: 3)
!1360 = !DILocation(line: 1099, column: 1, scope: !1289)
!1361 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1116, type: !1362, scopeLine: 1117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1362 = !DISubroutineType(types: !1363)
!1363 = !{!632, !632, !16}
!1364 = !DILocalVariable(name: "numerator", arg: 1, scope: !1361, file: !69, line: 1116, type: !632)
!1365 = !DILocation(line: 1116, column: 25, scope: !1361)
!1366 = !DILocalVariable(name: "denominator", arg: 2, scope: !1361, file: !69, line: 1116, type: !16)
!1367 = !DILocation(line: 1116, column: 40, scope: !1361)
!1368 = !DILocalVariable(name: "u32Temp1", scope: !1361, file: !69, line: 1118, type: !632)
!1369 = !DILocation(line: 1118, column: 6, scope: !1361)
!1370 = !DILocation(line: 1119, column: 5, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1361, file: !69, line: 1119, column: 5)
!1372 = !DILocation(line: 1119, column: 17, scope: !1371)
!1373 = !DILocation(line: 1119, column: 5, scope: !1361)
!1374 = !DILocation(line: 1121, column: 3, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1371, file: !69, line: 1120, column: 2)
!1376 = !DILocation(line: 1125, column: 6, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1378, file: !69, line: 1125, column: 6)
!1378 = distinct !DILexicalBlock(scope: !1371, file: !69, line: 1124, column: 2)
!1379 = !DILocation(line: 1125, column: 18, scope: !1377)
!1380 = !DILocation(line: 1125, column: 6, scope: !1378)
!1381 = !DILocation(line: 1127, column: 4, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1377, file: !69, line: 1126, column: 3)
!1383 = !DILocation(line: 1131, column: 16, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1377, file: !69, line: 1130, column: 3)
!1385 = !DILocation(line: 1131, column: 30, scope: !1384)
!1386 = !DILocation(line: 1131, column: 40, scope: !1384)
!1387 = !DILocation(line: 1131, column: 39, scope: !1384)
!1388 = !DILocation(line: 1131, column: 55, scope: !1384)
!1389 = !DILocation(line: 1131, column: 53, scope: !1384)
!1390 = !DILocation(line: 1131, column: 26, scope: !1384)
!1391 = !DILocation(line: 1131, column: 68, scope: !1384)
!1392 = !DILocation(line: 1131, column: 13, scope: !1384)
!1393 = !DILocation(line: 1132, column: 16, scope: !1384)
!1394 = !DILocation(line: 1132, column: 25, scope: !1384)
!1395 = !DILocation(line: 1132, column: 24, scope: !1384)
!1396 = !DILocation(line: 1132, column: 41, scope: !1384)
!1397 = !DILocation(line: 1132, column: 51, scope: !1384)
!1398 = !DILocation(line: 1132, column: 50, scope: !1384)
!1399 = !DILocation(line: 1132, column: 38, scope: !1384)
!1400 = !DILocation(line: 1132, column: 13, scope: !1384)
!1401 = !DILocation(line: 1133, column: 11, scope: !1384)
!1402 = !DILocation(line: 1133, column: 4, scope: !1384)
!1403 = !DILocation(line: 1136, column: 1, scope: !1361)
!1404 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1153, type: !1405, scopeLine: 1154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1405 = !DISubroutineType(types: !1406)
!1406 = !{!632, !16, !632}
!1407 = !DILocalVariable(name: "numerator", arg: 1, scope: !1404, file: !69, line: 1153, type: !16)
!1408 = !DILocation(line: 1153, column: 25, scope: !1404)
!1409 = !DILocalVariable(name: "denominator", arg: 2, scope: !1404, file: !69, line: 1153, type: !632)
!1410 = !DILocation(line: 1153, column: 40, scope: !1404)
!1411 = !DILocalVariable(name: "s32Temp1", scope: !1404, file: !69, line: 1155, type: !16)
!1412 = !DILocation(line: 1155, column: 6, scope: !1404)
!1413 = !DILocation(line: 1156, column: 5, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1404, file: !69, line: 1156, column: 5)
!1415 = !DILocation(line: 1156, column: 17, scope: !1414)
!1416 = !DILocation(line: 1156, column: 5, scope: !1404)
!1417 = !DILocation(line: 1158, column: 6, scope: !1418)
!1418 = distinct !DILexicalBlock(scope: !1419, file: !69, line: 1158, column: 6)
!1419 = distinct !DILexicalBlock(scope: !1414, file: !69, line: 1157, column: 2)
!1420 = !DILocation(line: 1158, column: 16, scope: !1418)
!1421 = !DILocation(line: 1158, column: 6, scope: !1419)
!1422 = !DILocation(line: 1160, column: 4, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1418, file: !69, line: 1159, column: 3)
!1424 = !DILocation(line: 1164, column: 4, scope: !1425)
!1425 = distinct !DILexicalBlock(scope: !1418, file: !69, line: 1163, column: 3)
!1426 = !DILocation(line: 1169, column: 6, scope: !1427)
!1427 = distinct !DILexicalBlock(scope: !1428, file: !69, line: 1169, column: 6)
!1428 = distinct !DILexicalBlock(scope: !1414, file: !69, line: 1168, column: 2)
!1429 = !DILocation(line: 1169, column: 16, scope: !1427)
!1430 = !DILocation(line: 1169, column: 6, scope: !1428)
!1431 = !DILocation(line: 1171, column: 17, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1427, file: !69, line: 1170, column: 3)
!1433 = !DILocation(line: 1171, column: 31, scope: !1432)
!1434 = !DILocation(line: 1171, column: 41, scope: !1432)
!1435 = !DILocation(line: 1171, column: 40, scope: !1432)
!1436 = !DILocation(line: 1171, column: 56, scope: !1432)
!1437 = !DILocation(line: 1171, column: 54, scope: !1432)
!1438 = !DILocation(line: 1171, column: 27, scope: !1432)
!1439 = !DILocation(line: 1171, column: 69, scope: !1432)
!1440 = !DILocation(line: 1171, column: 13, scope: !1432)
!1441 = !DILocation(line: 1172, column: 13, scope: !1432)
!1442 = !DILocation(line: 1172, column: 23, scope: !1432)
!1443 = !DILocation(line: 1172, column: 22, scope: !1432)
!1444 = !DILocation(line: 1172, column: 39, scope: !1432)
!1445 = !DILocation(line: 1172, column: 48, scope: !1432)
!1446 = !DILocation(line: 1172, column: 47, scope: !1432)
!1447 = !DILocation(line: 1172, column: 36, scope: !1432)
!1448 = !DILocation(line: 1172, column: 4, scope: !1432)
!1449 = !DILocation(line: 1176, column: 4, scope: !1450)
!1450 = distinct !DILexicalBlock(scope: !1427, file: !69, line: 1175, column: 3)
!1451 = !DILocation(line: 1179, column: 1, scope: !1404)
!1452 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1196, type: !1453, scopeLine: 1197, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1453 = !DISubroutineType(types: !1454)
!1454 = !{!632, !16, !16}
!1455 = !DILocalVariable(name: "numerator", arg: 1, scope: !1452, file: !69, line: 1196, type: !16)
!1456 = !DILocation(line: 1196, column: 25, scope: !1452)
!1457 = !DILocalVariable(name: "denominator", arg: 2, scope: !1452, file: !69, line: 1196, type: !16)
!1458 = !DILocation(line: 1196, column: 40, scope: !1452)
!1459 = !DILocalVariable(name: "u32Temp1", scope: !1452, file: !69, line: 1198, type: !632)
!1460 = !DILocation(line: 1198, column: 6, scope: !1452)
!1461 = !DILocalVariable(name: "u32Temp2", scope: !1452, file: !69, line: 1198, type: !632)
!1462 = !DILocation(line: 1198, column: 20, scope: !1452)
!1463 = !DILocation(line: 1199, column: 5, scope: !1464)
!1464 = distinct !DILexicalBlock(scope: !1452, file: !69, line: 1199, column: 5)
!1465 = !DILocation(line: 1199, column: 17, scope: !1464)
!1466 = !DILocation(line: 1199, column: 5, scope: !1452)
!1467 = !DILocation(line: 1201, column: 6, scope: !1468)
!1468 = distinct !DILexicalBlock(scope: !1469, file: !69, line: 1201, column: 6)
!1469 = distinct !DILexicalBlock(scope: !1464, file: !69, line: 1200, column: 2)
!1470 = !DILocation(line: 1201, column: 16, scope: !1468)
!1471 = !DILocation(line: 1201, column: 6, scope: !1469)
!1472 = !DILocation(line: 1203, column: 4, scope: !1473)
!1473 = distinct !DILexicalBlock(scope: !1468, file: !69, line: 1202, column: 3)
!1474 = !DILocation(line: 1207, column: 4, scope: !1475)
!1475 = distinct !DILexicalBlock(scope: !1468, file: !69, line: 1206, column: 3)
!1476 = !DILocation(line: 1212, column: 6, scope: !1477)
!1477 = distinct !DILexicalBlock(scope: !1478, file: !69, line: 1212, column: 6)
!1478 = distinct !DILexicalBlock(scope: !1464, file: !69, line: 1211, column: 2)
!1479 = !DILocation(line: 1212, column: 16, scope: !1477)
!1480 = !DILocation(line: 1212, column: 6, scope: !1478)
!1481 = !DILocation(line: 1214, column: 7, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1483, file: !69, line: 1214, column: 7)
!1483 = distinct !DILexicalBlock(scope: !1477, file: !69, line: 1213, column: 3)
!1484 = !DILocation(line: 1214, column: 17, scope: !1482)
!1485 = !DILocation(line: 1214, column: 7, scope: !1483)
!1486 = !DILocation(line: 1216, column: 5, scope: !1487)
!1487 = distinct !DILexicalBlock(scope: !1482, file: !69, line: 1215, column: 4)
!1488 = !DILocation(line: 1220, column: 8, scope: !1489)
!1489 = distinct !DILexicalBlock(scope: !1490, file: !69, line: 1220, column: 8)
!1490 = distinct !DILexicalBlock(scope: !1482, file: !69, line: 1219, column: 4)
!1491 = !DILocation(line: 1220, column: 20, scope: !1489)
!1492 = !DILocation(line: 1220, column: 8, scope: !1490)
!1493 = !DILocation(line: 1222, column: 6, scope: !1494)
!1494 = distinct !DILexicalBlock(scope: !1489, file: !69, line: 1221, column: 5)
!1495 = !DILocation(line: 1226, column: 18, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1489, file: !69, line: 1225, column: 5)
!1497 = !DILocation(line: 1226, column: 32, scope: !1496)
!1498 = !DILocation(line: 1226, column: 42, scope: !1496)
!1499 = !DILocation(line: 1226, column: 41, scope: !1496)
!1500 = !DILocation(line: 1226, column: 57, scope: !1496)
!1501 = !DILocation(line: 1226, column: 55, scope: !1496)
!1502 = !DILocation(line: 1226, column: 28, scope: !1496)
!1503 = !DILocation(line: 1226, column: 71, scope: !1496)
!1504 = !DILocation(line: 1226, column: 15, scope: !1496)
!1505 = !DILocation(line: 1227, column: 18, scope: !1496)
!1506 = !DILocation(line: 1227, column: 29, scope: !1496)
!1507 = !DILocation(line: 1227, column: 27, scope: !1496)
!1508 = !DILocation(line: 1227, column: 45, scope: !1496)
!1509 = !DILocation(line: 1227, column: 57, scope: !1496)
!1510 = !DILocation(line: 1227, column: 55, scope: !1496)
!1511 = !DILocation(line: 1227, column: 42, scope: !1496)
!1512 = !DILocation(line: 1227, column: 15, scope: !1496)
!1513 = !DILocation(line: 1228, column: 13, scope: !1496)
!1514 = !DILocation(line: 1228, column: 6, scope: !1496)
!1515 = !DILocation(line: 1234, column: 7, scope: !1516)
!1516 = distinct !DILexicalBlock(scope: !1517, file: !69, line: 1234, column: 7)
!1517 = distinct !DILexicalBlock(scope: !1477, file: !69, line: 1233, column: 3)
!1518 = !DILocation(line: 1234, column: 19, scope: !1516)
!1519 = !DILocation(line: 1234, column: 7, scope: !1517)
!1520 = !DILocation(line: 1236, column: 5, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1516, file: !69, line: 1235, column: 4)
!1522 = !DILocation(line: 1240, column: 18, scope: !1523)
!1523 = distinct !DILexicalBlock(scope: !1516, file: !69, line: 1239, column: 4)
!1524 = !DILocation(line: 1240, column: 17, scope: !1523)
!1525 = !DILocation(line: 1240, column: 15, scope: !1523)
!1526 = !DILocation(line: 1241, column: 20, scope: !1523)
!1527 = !DILocation(line: 1241, column: 19, scope: !1523)
!1528 = !DILocation(line: 1241, column: 17, scope: !1523)
!1529 = !DILocation(line: 1242, column: 17, scope: !1523)
!1530 = !DILocation(line: 1242, column: 31, scope: !1523)
!1531 = !DILocation(line: 1242, column: 41, scope: !1523)
!1532 = !DILocation(line: 1242, column: 40, scope: !1523)
!1533 = !DILocation(line: 1242, column: 56, scope: !1523)
!1534 = !DILocation(line: 1242, column: 54, scope: !1523)
!1535 = !DILocation(line: 1242, column: 27, scope: !1523)
!1536 = !DILocation(line: 1242, column: 70, scope: !1523)
!1537 = !DILocation(line: 1242, column: 14, scope: !1523)
!1538 = !DILocation(line: 1243, column: 17, scope: !1523)
!1539 = !DILocation(line: 1243, column: 28, scope: !1523)
!1540 = !DILocation(line: 1243, column: 26, scope: !1523)
!1541 = !DILocation(line: 1243, column: 44, scope: !1523)
!1542 = !DILocation(line: 1243, column: 56, scope: !1523)
!1543 = !DILocation(line: 1243, column: 54, scope: !1523)
!1544 = !DILocation(line: 1243, column: 41, scope: !1523)
!1545 = !DILocation(line: 1243, column: 14, scope: !1523)
!1546 = !DILocation(line: 1244, column: 12, scope: !1523)
!1547 = !DILocation(line: 1244, column: 5, scope: !1523)
!1548 = !DILocation(line: 1249, column: 1, scope: !1452)
!1549 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1266, type: !1550, scopeLine: 1267, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1550 = !DISubroutineType(types: !1551)
!1551 = !{!632, !632, !632}
!1552 = !DILocalVariable(name: "numerator", arg: 1, scope: !1549, file: !69, line: 1266, type: !632)
!1553 = !DILocation(line: 1266, column: 25, scope: !1549)
!1554 = !DILocalVariable(name: "denominator", arg: 2, scope: !1549, file: !69, line: 1266, type: !632)
!1555 = !DILocation(line: 1266, column: 40, scope: !1549)
!1556 = !DILocalVariable(name: "u32Temp1", scope: !1549, file: !69, line: 1269, type: !632)
!1557 = !DILocation(line: 1269, column: 6, scope: !1549)
!1558 = !DILocalVariable(name: "u32Temp2", scope: !1549, file: !69, line: 1269, type: !632)
!1559 = !DILocation(line: 1269, column: 20, scope: !1549)
!1560 = !DILocalVariable(name: "u32Temp3", scope: !1549, file: !69, line: 1269, type: !632)
!1561 = !DILocation(line: 1269, column: 34, scope: !1549)
!1562 = !DILocalVariable(name: "numerator_old", scope: !1549, file: !69, line: 1269, type: !632)
!1563 = !DILocation(line: 1269, column: 48, scope: !1549)
!1564 = !DILocation(line: 1270, column: 5, scope: !1565)
!1565 = distinct !DILexicalBlock(scope: !1549, file: !69, line: 1270, column: 5)
!1566 = !DILocation(line: 1270, column: 16, scope: !1565)
!1567 = !DILocation(line: 1270, column: 5, scope: !1549)
!1568 = !DILocation(line: 1272, column: 3, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1565, file: !69, line: 1271, column: 2)
!1570 = !DILocation(line: 1276, column: 14, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1565, file: !69, line: 1275, column: 2)
!1572 = !DILocation(line: 1276, column: 26, scope: !1571)
!1573 = !DILocation(line: 1276, column: 41, scope: !1571)
!1574 = !DILocation(line: 1276, column: 51, scope: !1571)
!1575 = !DILocation(line: 1276, column: 50, scope: !1571)
!1576 = !DILocation(line: 1276, column: 38, scope: !1571)
!1577 = !DILocation(line: 1276, column: 24, scope: !1571)
!1578 = !DILocation(line: 1276, column: 12, scope: !1571)
!1579 = !DILocation(line: 1277, column: 7, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1571, file: !69, line: 1277, column: 6)
!1581 = !DILocation(line: 1277, column: 16, scope: !1580)
!1582 = !DILocation(line: 1277, column: 24, scope: !1580)
!1583 = !DILocation(line: 1277, column: 6, scope: !1571)
!1584 = !DILocation(line: 1279, column: 16, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !1580, file: !69, line: 1278, column: 3)
!1586 = !DILocation(line: 1279, column: 27, scope: !1585)
!1587 = !DILocation(line: 1279, column: 13, scope: !1585)
!1588 = !DILocation(line: 1280, column: 3, scope: !1585)
!1589 = !DILocation(line: 1283, column: 16, scope: !1590)
!1590 = distinct !DILexicalBlock(scope: !1580, file: !69, line: 1282, column: 3)
!1591 = !DILocation(line: 1283, column: 27, scope: !1590)
!1592 = !DILocation(line: 1283, column: 32, scope: !1590)
!1593 = !DILocation(line: 1283, column: 13, scope: !1590)
!1594 = !DILocation(line: 1286, column: 6, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1571, file: !69, line: 1286, column: 6)
!1596 = !DILocation(line: 1286, column: 17, scope: !1595)
!1597 = !DILocation(line: 1286, column: 15, scope: !1595)
!1598 = !DILocation(line: 1286, column: 6, scope: !1571)
!1599 = !DILocation(line: 1288, column: 12, scope: !1600)
!1600 = distinct !DILexicalBlock(scope: !1595, file: !69, line: 1287, column: 3)
!1601 = !DILocation(line: 1288, column: 22, scope: !1600)
!1602 = !DILocation(line: 1288, column: 21, scope: !1600)
!1603 = !DILocation(line: 1288, column: 4, scope: !1600)
!1604 = !DILocation(line: 1292, column: 13, scope: !1605)
!1605 = distinct !DILexicalBlock(scope: !1595, file: !69, line: 1291, column: 3)
!1606 = !DILocation(line: 1292, column: 23, scope: !1605)
!1607 = !DILocation(line: 1292, column: 22, scope: !1605)
!1608 = !DILocation(line: 1292, column: 36, scope: !1605)
!1609 = !DILocation(line: 1292, column: 4, scope: !1605)
!1610 = !DILocation(line: 1297, column: 1, scope: !1549)
!1611 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1314, type: !1612, scopeLine: 1315, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1612 = !DISubroutineType(types: !1613)
!1613 = !{!16, !632, !16}
!1614 = !DILocalVariable(name: "numerator", arg: 1, scope: !1611, file: !69, line: 1314, type: !632)
!1615 = !DILocation(line: 1314, column: 25, scope: !1611)
!1616 = !DILocalVariable(name: "denominator", arg: 2, scope: !1611, file: !69, line: 1314, type: !16)
!1617 = !DILocation(line: 1314, column: 40, scope: !1611)
!1618 = !DILocalVariable(name: "u32Temp1", scope: !1611, file: !69, line: 1316, type: !632)
!1619 = !DILocation(line: 1316, column: 6, scope: !1611)
!1620 = !DILocalVariable(name: "u32Temp2", scope: !1611, file: !69, line: 1316, type: !632)
!1621 = !DILocation(line: 1316, column: 20, scope: !1611)
!1622 = !DILocation(line: 1317, column: 5, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1611, file: !69, line: 1317, column: 5)
!1624 = !DILocation(line: 1317, column: 17, scope: !1623)
!1625 = !DILocation(line: 1317, column: 5, scope: !1611)
!1626 = !DILocation(line: 1319, column: 6, scope: !1627)
!1627 = distinct !DILexicalBlock(scope: !1628, file: !69, line: 1319, column: 6)
!1628 = distinct !DILexicalBlock(scope: !1623, file: !69, line: 1318, column: 2)
!1629 = !DILocation(line: 1319, column: 18, scope: !1627)
!1630 = !DILocation(line: 1319, column: 6, scope: !1628)
!1631 = !DILocation(line: 1321, column: 4, scope: !1632)
!1632 = distinct !DILexicalBlock(scope: !1627, file: !69, line: 1320, column: 3)
!1633 = !DILocation(line: 1325, column: 19, scope: !1634)
!1634 = distinct !DILexicalBlock(scope: !1627, file: !69, line: 1324, column: 3)
!1635 = !DILocation(line: 1325, column: 18, scope: !1634)
!1636 = !DILocation(line: 1325, column: 16, scope: !1634)
!1637 = !DILocation(line: 1326, column: 16, scope: !1634)
!1638 = !DILocation(line: 1326, column: 30, scope: !1634)
!1639 = !DILocation(line: 1326, column: 40, scope: !1634)
!1640 = !DILocation(line: 1326, column: 39, scope: !1634)
!1641 = !DILocation(line: 1326, column: 55, scope: !1634)
!1642 = !DILocation(line: 1326, column: 53, scope: !1634)
!1643 = !DILocation(line: 1326, column: 26, scope: !1634)
!1644 = !DILocation(line: 1326, column: 69, scope: !1634)
!1645 = !DILocation(line: 1326, column: 13, scope: !1634)
!1646 = !DILocation(line: 1327, column: 16, scope: !1634)
!1647 = !DILocation(line: 1327, column: 25, scope: !1634)
!1648 = !DILocation(line: 1327, column: 24, scope: !1634)
!1649 = !DILocation(line: 1327, column: 41, scope: !1634)
!1650 = !DILocation(line: 1327, column: 51, scope: !1634)
!1651 = !DILocation(line: 1327, column: 50, scope: !1634)
!1652 = !DILocation(line: 1327, column: 38, scope: !1634)
!1653 = !DILocation(line: 1327, column: 13, scope: !1634)
!1654 = !DILocation(line: 1328, column: 7, scope: !1655)
!1655 = distinct !DILexicalBlock(scope: !1634, file: !69, line: 1328, column: 7)
!1656 = !DILocation(line: 1328, column: 16, scope: !1655)
!1657 = !DILocation(line: 1328, column: 7, scope: !1634)
!1658 = !DILocation(line: 1330, column: 13, scope: !1659)
!1659 = distinct !DILexicalBlock(scope: !1655, file: !69, line: 1329, column: 4)
!1660 = !DILocation(line: 1330, column: 12, scope: !1659)
!1661 = !DILocation(line: 1330, column: 5, scope: !1659)
!1662 = !DILocation(line: 1334, column: 5, scope: !1663)
!1663 = distinct !DILexicalBlock(scope: !1655, file: !69, line: 1333, column: 4)
!1664 = !DILocation(line: 1340, column: 15, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1623, file: !69, line: 1339, column: 2)
!1666 = !DILocation(line: 1340, column: 29, scope: !1665)
!1667 = !DILocation(line: 1340, column: 39, scope: !1665)
!1668 = !DILocation(line: 1340, column: 38, scope: !1665)
!1669 = !DILocation(line: 1340, column: 54, scope: !1665)
!1670 = !DILocation(line: 1340, column: 52, scope: !1665)
!1671 = !DILocation(line: 1340, column: 25, scope: !1665)
!1672 = !DILocation(line: 1340, column: 68, scope: !1665)
!1673 = !DILocation(line: 1340, column: 12, scope: !1665)
!1674 = !DILocation(line: 1341, column: 15, scope: !1665)
!1675 = !DILocation(line: 1341, column: 24, scope: !1665)
!1676 = !DILocation(line: 1341, column: 23, scope: !1665)
!1677 = !DILocation(line: 1341, column: 40, scope: !1665)
!1678 = !DILocation(line: 1341, column: 50, scope: !1665)
!1679 = !DILocation(line: 1341, column: 49, scope: !1665)
!1680 = !DILocation(line: 1341, column: 37, scope: !1665)
!1681 = !DILocation(line: 1341, column: 12, scope: !1665)
!1682 = !DILocation(line: 1342, column: 6, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1665, file: !69, line: 1342, column: 6)
!1684 = !DILocation(line: 1342, column: 15, scope: !1683)
!1685 = !DILocation(line: 1342, column: 6, scope: !1665)
!1686 = !DILocation(line: 1344, column: 11, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1683, file: !69, line: 1343, column: 3)
!1688 = !DILocation(line: 1344, column: 4, scope: !1687)
!1689 = !DILocation(line: 1348, column: 4, scope: !1690)
!1690 = distinct !DILexicalBlock(scope: !1683, file: !69, line: 1347, column: 3)
!1691 = !DILocation(line: 1351, column: 1, scope: !1611)
!1692 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1369, type: !1693, scopeLine: 1370, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1693 = !DISubroutineType(types: !1694)
!1694 = !{!16, !16, !632}
!1695 = !DILocalVariable(name: "numerator", arg: 1, scope: !1692, file: !69, line: 1369, type: !16)
!1696 = !DILocation(line: 1369, column: 25, scope: !1692)
!1697 = !DILocalVariable(name: "denominator", arg: 2, scope: !1692, file: !69, line: 1369, type: !632)
!1698 = !DILocation(line: 1369, column: 40, scope: !1692)
!1699 = !DILocalVariable(name: "s32Temp1", scope: !1692, file: !69, line: 1371, type: !16)
!1700 = !DILocation(line: 1371, column: 6, scope: !1692)
!1701 = !DILocalVariable(name: "s32Temp2", scope: !1692, file: !69, line: 1371, type: !16)
!1702 = !DILocation(line: 1371, column: 20, scope: !1692)
!1703 = !DILocalVariable(name: "u32Temp0", scope: !1692, file: !69, line: 1372, type: !632)
!1704 = !DILocation(line: 1372, column: 6, scope: !1692)
!1705 = !DILocalVariable(name: "u32Temp1", scope: !1692, file: !69, line: 1372, type: !632)
!1706 = !DILocation(line: 1372, column: 20, scope: !1692)
!1707 = !DILocalVariable(name: "u32Temp2", scope: !1692, file: !69, line: 1372, type: !632)
!1708 = !DILocation(line: 1372, column: 34, scope: !1692)
!1709 = !DILocation(line: 1373, column: 5, scope: !1710)
!1710 = distinct !DILexicalBlock(scope: !1692, file: !69, line: 1373, column: 5)
!1711 = !DILocation(line: 1373, column: 17, scope: !1710)
!1712 = !DILocation(line: 1373, column: 5, scope: !1692)
!1713 = !DILocation(line: 1375, column: 6, scope: !1714)
!1714 = distinct !DILexicalBlock(scope: !1715, file: !69, line: 1375, column: 6)
!1715 = distinct !DILexicalBlock(scope: !1710, file: !69, line: 1374, column: 2)
!1716 = !DILocation(line: 1375, column: 16, scope: !1714)
!1717 = !DILocation(line: 1375, column: 6, scope: !1715)
!1718 = !DILocation(line: 1377, column: 4, scope: !1719)
!1719 = distinct !DILexicalBlock(scope: !1714, file: !69, line: 1376, column: 3)
!1720 = !DILocation(line: 1381, column: 4, scope: !1721)
!1721 = distinct !DILexicalBlock(scope: !1714, file: !69, line: 1380, column: 3)
!1722 = !DILocation(line: 1386, column: 6, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1724, file: !69, line: 1386, column: 6)
!1724 = distinct !DILexicalBlock(scope: !1710, file: !69, line: 1385, column: 2)
!1725 = !DILocation(line: 1386, column: 16, scope: !1723)
!1726 = !DILocation(line: 1386, column: 6, scope: !1724)
!1727 = !DILocation(line: 1388, column: 16, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1723, file: !69, line: 1387, column: 3)
!1729 = !DILocation(line: 1388, column: 15, scope: !1728)
!1730 = !DILocation(line: 1388, column: 13, scope: !1728)
!1731 = !DILocation(line: 1389, column: 16, scope: !1728)
!1732 = !DILocation(line: 1389, column: 25, scope: !1728)
!1733 = !DILocation(line: 1389, column: 24, scope: !1728)
!1734 = !DILocation(line: 1389, column: 13, scope: !1728)
!1735 = !DILocation(line: 1390, column: 15, scope: !1728)
!1736 = !DILocation(line: 1390, column: 28, scope: !1728)
!1737 = !DILocation(line: 1390, column: 37, scope: !1728)
!1738 = !DILocation(line: 1390, column: 36, scope: !1728)
!1739 = !DILocation(line: 1390, column: 52, scope: !1728)
!1740 = !DILocation(line: 1390, column: 50, scope: !1728)
!1741 = !DILocation(line: 1390, column: 24, scope: !1728)
!1742 = !DILocation(line: 1390, column: 13, scope: !1728)
!1743 = !DILocation(line: 1392, column: 8, scope: !1744)
!1744 = distinct !DILexicalBlock(scope: !1728, file: !69, line: 1392, column: 7)
!1745 = !DILocation(line: 1392, column: 20, scope: !1744)
!1746 = !DILocation(line: 1392, column: 27, scope: !1744)
!1747 = !DILocation(line: 1392, column: 7, scope: !1728)
!1748 = !DILocation(line: 1394, column: 20, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !1744, file: !69, line: 1393, column: 4)
!1750 = !DILocation(line: 1394, column: 32, scope: !1749)
!1751 = !DILocation(line: 1394, column: 17, scope: !1749)
!1752 = !DILocation(line: 1395, column: 4, scope: !1749)
!1753 = !DILocation(line: 1398, column: 20, scope: !1754)
!1754 = distinct !DILexicalBlock(scope: !1744, file: !69, line: 1397, column: 4)
!1755 = !DILocation(line: 1398, column: 32, scope: !1754)
!1756 = !DILocation(line: 1398, column: 38, scope: !1754)
!1757 = !DILocation(line: 1398, column: 17, scope: !1754)
!1758 = !DILocation(line: 1402, column: 7, scope: !1759)
!1759 = distinct !DILexicalBlock(scope: !1728, file: !69, line: 1402, column: 7)
!1760 = !DILocation(line: 1402, column: 18, scope: !1759)
!1761 = !DILocation(line: 1402, column: 16, scope: !1759)
!1762 = !DILocation(line: 1402, column: 7, scope: !1728)
!1763 = !DILocation(line: 1404, column: 14, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1759, file: !69, line: 1403, column: 4)
!1765 = !DILocation(line: 1404, column: 13, scope: !1764)
!1766 = !DILocation(line: 1404, column: 23, scope: !1764)
!1767 = !DILocation(line: 1404, column: 5, scope: !1764)
!1768 = !DILocation(line: 1408, column: 14, scope: !1769)
!1769 = distinct !DILexicalBlock(scope: !1759, file: !69, line: 1407, column: 4)
!1770 = !DILocation(line: 1408, column: 23, scope: !1769)
!1771 = !DILocation(line: 1408, column: 12, scope: !1769)
!1772 = !DILocation(line: 1408, column: 27, scope: !1769)
!1773 = !DILocation(line: 1408, column: 5, scope: !1769)
!1774 = !DILocation(line: 1415, column: 16, scope: !1775)
!1775 = distinct !DILexicalBlock(scope: !1723, file: !69, line: 1414, column: 3)
!1776 = !DILocation(line: 1415, column: 30, scope: !1775)
!1777 = !DILocation(line: 1415, column: 40, scope: !1775)
!1778 = !DILocation(line: 1415, column: 39, scope: !1775)
!1779 = !DILocation(line: 1415, column: 55, scope: !1775)
!1780 = !DILocation(line: 1415, column: 53, scope: !1775)
!1781 = !DILocation(line: 1415, column: 26, scope: !1775)
!1782 = !DILocation(line: 1415, column: 69, scope: !1775)
!1783 = !DILocation(line: 1415, column: 13, scope: !1775)
!1784 = !DILocation(line: 1416, column: 16, scope: !1775)
!1785 = !DILocation(line: 1416, column: 26, scope: !1775)
!1786 = !DILocation(line: 1416, column: 25, scope: !1775)
!1787 = !DILocation(line: 1416, column: 42, scope: !1775)
!1788 = !DILocation(line: 1416, column: 51, scope: !1775)
!1789 = !DILocation(line: 1416, column: 50, scope: !1775)
!1790 = !DILocation(line: 1416, column: 39, scope: !1775)
!1791 = !DILocation(line: 1416, column: 13, scope: !1775)
!1792 = !DILocation(line: 1417, column: 11, scope: !1775)
!1793 = !DILocation(line: 1417, column: 4, scope: !1775)
!1794 = !DILocation(line: 1420, column: 1, scope: !1692)
!1795 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1437, type: !1796, scopeLine: 1438, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1796 = !DISubroutineType(types: !1797)
!1797 = !{!16, !16, !16}
!1798 = !DILocalVariable(name: "numerator", arg: 1, scope: !1795, file: !69, line: 1437, type: !16)
!1799 = !DILocation(line: 1437, column: 25, scope: !1795)
!1800 = !DILocalVariable(name: "denominator", arg: 2, scope: !1795, file: !69, line: 1437, type: !16)
!1801 = !DILocation(line: 1437, column: 40, scope: !1795)
!1802 = !DILocalVariable(name: "s32Temp1", scope: !1795, file: !69, line: 1439, type: !16)
!1803 = !DILocation(line: 1439, column: 6, scope: !1795)
!1804 = !DILocalVariable(name: "s32Temp2", scope: !1795, file: !69, line: 1439, type: !16)
!1805 = !DILocation(line: 1439, column: 20, scope: !1795)
!1806 = !DILocalVariable(name: "denominator_prime", scope: !1795, file: !69, line: 1440, type: !632)
!1807 = !DILocation(line: 1440, column: 6, scope: !1795)
!1808 = !DILocalVariable(name: "u32Temp1", scope: !1795, file: !69, line: 1440, type: !632)
!1809 = !DILocation(line: 1440, column: 29, scope: !1795)
!1810 = !DILocalVariable(name: "u32Temp2", scope: !1795, file: !69, line: 1440, type: !632)
!1811 = !DILocation(line: 1440, column: 43, scope: !1795)
!1812 = !DILocalVariable(name: "u32numerator", scope: !1795, file: !69, line: 1441, type: !632)
!1813 = !DILocation(line: 1441, column: 6, scope: !1795)
!1814 = !DILocalVariable(name: "u32denominator", scope: !1795, file: !69, line: 1441, type: !632)
!1815 = !DILocation(line: 1441, column: 23, scope: !1795)
!1816 = !DILocation(line: 1442, column: 5, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1795, file: !69, line: 1442, column: 5)
!1818 = !DILocation(line: 1442, column: 15, scope: !1817)
!1819 = !DILocation(line: 1442, column: 5, scope: !1795)
!1820 = !DILocation(line: 1444, column: 6, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1822, file: !69, line: 1444, column: 6)
!1822 = distinct !DILexicalBlock(scope: !1817, file: !69, line: 1443, column: 2)
!1823 = !DILocation(line: 1444, column: 18, scope: !1821)
!1824 = !DILocation(line: 1444, column: 6, scope: !1822)
!1825 = !DILocation(line: 1446, column: 7, scope: !1826)
!1826 = distinct !DILexicalBlock(scope: !1827, file: !69, line: 1446, column: 7)
!1827 = distinct !DILexicalBlock(scope: !1821, file: !69, line: 1445, column: 3)
!1828 = !DILocation(line: 1446, column: 19, scope: !1826)
!1829 = !DILocation(line: 1446, column: 7, scope: !1827)
!1830 = !DILocation(line: 1448, column: 5, scope: !1831)
!1831 = distinct !DILexicalBlock(scope: !1826, file: !69, line: 1447, column: 4)
!1832 = !DILocation(line: 1452, column: 21, scope: !1833)
!1833 = distinct !DILexicalBlock(scope: !1826, file: !69, line: 1451, column: 4)
!1834 = !DILocation(line: 1452, column: 20, scope: !1833)
!1835 = !DILocation(line: 1452, column: 18, scope: !1833)
!1836 = !DILocation(line: 1453, column: 23, scope: !1833)
!1837 = !DILocation(line: 1453, column: 22, scope: !1833)
!1838 = !DILocation(line: 1453, column: 20, scope: !1833)
!1839 = !DILocation(line: 1454, column: 16, scope: !1833)
!1840 = !DILocation(line: 1454, column: 33, scope: !1833)
!1841 = !DILocation(line: 1454, column: 46, scope: !1833)
!1842 = !DILocation(line: 1454, column: 45, scope: !1833)
!1843 = !DILocation(line: 1454, column: 64, scope: !1833)
!1844 = !DILocation(line: 1454, column: 62, scope: !1833)
!1845 = !DILocation(line: 1454, column: 29, scope: !1833)
!1846 = !DILocation(line: 1454, column: 81, scope: !1833)
!1847 = !DILocation(line: 1454, column: 14, scope: !1833)
!1848 = !DILocation(line: 1455, column: 17, scope: !1833)
!1849 = !DILocation(line: 1455, column: 30, scope: !1833)
!1850 = !DILocation(line: 1455, column: 29, scope: !1833)
!1851 = !DILocation(line: 1455, column: 49, scope: !1833)
!1852 = !DILocation(line: 1455, column: 58, scope: !1833)
!1853 = !DILocation(line: 1455, column: 57, scope: !1833)
!1854 = !DILocation(line: 1455, column: 46, scope: !1833)
!1855 = !DILocation(line: 1455, column: 14, scope: !1833)
!1856 = !DILocation(line: 1456, column: 8, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1833, file: !69, line: 1456, column: 8)
!1858 = !DILocation(line: 1456, column: 17, scope: !1857)
!1859 = !DILocation(line: 1456, column: 8, scope: !1833)
!1860 = !DILocation(line: 1458, column: 13, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1857, file: !69, line: 1457, column: 5)
!1862 = !DILocation(line: 1458, column: 6, scope: !1861)
!1863 = !DILocation(line: 1462, column: 6, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1857, file: !69, line: 1461, column: 5)
!1865 = !DILocation(line: 1468, column: 20, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1821, file: !69, line: 1467, column: 3)
!1867 = !DILocation(line: 1468, column: 19, scope: !1866)
!1868 = !DILocation(line: 1468, column: 29, scope: !1866)
!1869 = !DILocation(line: 1468, column: 17, scope: !1866)
!1870 = !DILocation(line: 1469, column: 16, scope: !1866)
!1871 = !DILocation(line: 1469, column: 33, scope: !1866)
!1872 = !DILocation(line: 1469, column: 46, scope: !1866)
!1873 = !DILocation(line: 1469, column: 45, scope: !1866)
!1874 = !DILocation(line: 1469, column: 61, scope: !1866)
!1875 = !DILocation(line: 1469, column: 59, scope: !1866)
!1876 = !DILocation(line: 1469, column: 29, scope: !1866)
!1877 = !DILocation(line: 1469, column: 75, scope: !1866)
!1878 = !DILocation(line: 1469, column: 13, scope: !1866)
!1879 = !DILocation(line: 1470, column: 16, scope: !1866)
!1880 = !DILocation(line: 1470, column: 29, scope: !1866)
!1881 = !DILocation(line: 1470, column: 28, scope: !1866)
!1882 = !DILocation(line: 1470, column: 45, scope: !1866)
!1883 = !DILocation(line: 1470, column: 54, scope: !1866)
!1884 = !DILocation(line: 1470, column: 53, scope: !1866)
!1885 = !DILocation(line: 1470, column: 42, scope: !1866)
!1886 = !DILocation(line: 1470, column: 13, scope: !1866)
!1887 = !DILocation(line: 1471, column: 13, scope: !1866)
!1888 = !DILocation(line: 1471, column: 12, scope: !1866)
!1889 = !DILocation(line: 1471, column: 22, scope: !1866)
!1890 = !DILocation(line: 1471, column: 4, scope: !1866)
!1891 = !DILocation(line: 1476, column: 6, scope: !1892)
!1892 = distinct !DILexicalBlock(scope: !1893, file: !69, line: 1476, column: 6)
!1893 = distinct !DILexicalBlock(scope: !1817, file: !69, line: 1475, column: 2)
!1894 = !DILocation(line: 1476, column: 18, scope: !1892)
!1895 = !DILocation(line: 1476, column: 6, scope: !1893)
!1896 = !DILocation(line: 1478, column: 7, scope: !1897)
!1897 = distinct !DILexicalBlock(scope: !1898, file: !69, line: 1478, column: 7)
!1898 = distinct !DILexicalBlock(scope: !1892, file: !69, line: 1477, column: 3)
!1899 = !DILocation(line: 1478, column: 19, scope: !1897)
!1900 = !DILocation(line: 1478, column: 7, scope: !1898)
!1901 = !DILocation(line: 1480, column: 5, scope: !1902)
!1902 = distinct !DILexicalBlock(scope: !1897, file: !69, line: 1479, column: 4)
!1903 = !DILocation(line: 1484, column: 23, scope: !1904)
!1904 = distinct !DILexicalBlock(scope: !1897, file: !69, line: 1483, column: 4)
!1905 = !DILocation(line: 1484, column: 22, scope: !1904)
!1906 = !DILocation(line: 1484, column: 35, scope: !1904)
!1907 = !DILocation(line: 1484, column: 20, scope: !1904)
!1908 = !DILocation(line: 1485, column: 17, scope: !1904)
!1909 = !DILocation(line: 1485, column: 31, scope: !1904)
!1910 = !DILocation(line: 1485, column: 41, scope: !1904)
!1911 = !DILocation(line: 1485, column: 40, scope: !1904)
!1912 = !DILocation(line: 1485, column: 59, scope: !1904)
!1913 = !DILocation(line: 1485, column: 57, scope: !1904)
!1914 = !DILocation(line: 1485, column: 27, scope: !1904)
!1915 = !DILocation(line: 1485, column: 76, scope: !1904)
!1916 = !DILocation(line: 1485, column: 14, scope: !1904)
!1917 = !DILocation(line: 1486, column: 17, scope: !1904)
!1918 = !DILocation(line: 1486, column: 27, scope: !1904)
!1919 = !DILocation(line: 1486, column: 26, scope: !1904)
!1920 = !DILocation(line: 1486, column: 46, scope: !1904)
!1921 = !DILocation(line: 1486, column: 55, scope: !1904)
!1922 = !DILocation(line: 1486, column: 54, scope: !1904)
!1923 = !DILocation(line: 1486, column: 43, scope: !1904)
!1924 = !DILocation(line: 1486, column: 14, scope: !1904)
!1925 = !DILocation(line: 1487, column: 14, scope: !1904)
!1926 = !DILocation(line: 1487, column: 13, scope: !1904)
!1927 = !DILocation(line: 1487, column: 23, scope: !1904)
!1928 = !DILocation(line: 1487, column: 5, scope: !1904)
!1929 = !DILocation(line: 1492, column: 16, scope: !1930)
!1930 = distinct !DILexicalBlock(scope: !1892, file: !69, line: 1491, column: 3)
!1931 = !DILocation(line: 1492, column: 30, scope: !1930)
!1932 = !DILocation(line: 1492, column: 40, scope: !1930)
!1933 = !DILocation(line: 1492, column: 39, scope: !1930)
!1934 = !DILocation(line: 1492, column: 55, scope: !1930)
!1935 = !DILocation(line: 1492, column: 53, scope: !1930)
!1936 = !DILocation(line: 1492, column: 26, scope: !1930)
!1937 = !DILocation(line: 1492, column: 69, scope: !1930)
!1938 = !DILocation(line: 1492, column: 13, scope: !1930)
!1939 = !DILocation(line: 1493, column: 16, scope: !1930)
!1940 = !DILocation(line: 1493, column: 26, scope: !1930)
!1941 = !DILocation(line: 1493, column: 25, scope: !1930)
!1942 = !DILocation(line: 1493, column: 42, scope: !1930)
!1943 = !DILocation(line: 1493, column: 51, scope: !1930)
!1944 = !DILocation(line: 1493, column: 50, scope: !1930)
!1945 = !DILocation(line: 1493, column: 39, scope: !1930)
!1946 = !DILocation(line: 1493, column: 13, scope: !1930)
!1947 = !DILocation(line: 1494, column: 11, scope: !1930)
!1948 = !DILocation(line: 1494, column: 4, scope: !1930)
!1949 = !DILocation(line: 1497, column: 1, scope: !1795)
!1950 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1515, type: !1951, scopeLine: 1516, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1951 = !DISubroutineType(types: !1952)
!1952 = !{!6, !16, !632}
!1953 = !DILocalVariable(name: "numerator", arg: 1, scope: !1950, file: !69, line: 1515, type: !16)
!1954 = !DILocation(line: 1515, column: 25, scope: !1950)
!1955 = !DILocalVariable(name: "denominator", arg: 2, scope: !1950, file: !69, line: 1515, type: !632)
!1956 = !DILocation(line: 1515, column: 40, scope: !1950)
!1957 = !DILocalVariable(name: "numerator_prime", scope: !1950, file: !69, line: 1518, type: !632)
!1958 = !DILocation(line: 1518, column: 6, scope: !1950)
!1959 = !DILocalVariable(name: "u32Temp1", scope: !1950, file: !69, line: 1518, type: !632)
!1960 = !DILocation(line: 1518, column: 27, scope: !1950)
!1961 = !DILocalVariable(name: "u32Temp2", scope: !1950, file: !69, line: 1518, type: !632)
!1962 = !DILocation(line: 1518, column: 41, scope: !1950)
!1963 = !DILocalVariable(name: "u32Temp3", scope: !1950, file: !69, line: 1518, type: !632)
!1964 = !DILocation(line: 1518, column: 55, scope: !1950)
!1965 = !DILocalVariable(name: "s32Temp1", scope: !1950, file: !69, line: 1519, type: !16)
!1966 = !DILocation(line: 1519, column: 6, scope: !1950)
!1967 = !DILocalVariable(name: "s32Temp2", scope: !1950, file: !69, line: 1519, type: !16)
!1968 = !DILocation(line: 1519, column: 20, scope: !1950)
!1969 = !DILocalVariable(name: "s32Temp3", scope: !1950, file: !69, line: 1519, type: !16)
!1970 = !DILocation(line: 1519, column: 34, scope: !1950)
!1971 = !DILocation(line: 1520, column: 5, scope: !1972)
!1972 = distinct !DILexicalBlock(scope: !1950, file: !69, line: 1520, column: 5)
!1973 = !DILocation(line: 1520, column: 17, scope: !1972)
!1974 = !DILocation(line: 1520, column: 5, scope: !1950)
!1975 = !DILocation(line: 1522, column: 6, scope: !1976)
!1976 = distinct !DILexicalBlock(scope: !1977, file: !69, line: 1522, column: 6)
!1977 = distinct !DILexicalBlock(scope: !1972, file: !69, line: 1521, column: 2)
!1978 = !DILocation(line: 1522, column: 15, scope: !1976)
!1979 = !DILocation(line: 1522, column: 6, scope: !1977)
!1980 = !DILocation(line: 1524, column: 4, scope: !1981)
!1981 = distinct !DILexicalBlock(scope: !1976, file: !69, line: 1523, column: 3)
!1982 = !DILocation(line: 1528, column: 4, scope: !1983)
!1983 = distinct !DILexicalBlock(scope: !1976, file: !69, line: 1527, column: 3)
!1984 = !DILocation(line: 1533, column: 6, scope: !1985)
!1985 = distinct !DILexicalBlock(scope: !1986, file: !69, line: 1533, column: 6)
!1986 = distinct !DILexicalBlock(scope: !1972, file: !69, line: 1532, column: 2)
!1987 = !DILocation(line: 1533, column: 16, scope: !1985)
!1988 = !DILocation(line: 1533, column: 6, scope: !1986)
!1989 = !DILocation(line: 1535, column: 23, scope: !1990)
!1990 = distinct !DILexicalBlock(scope: !1985, file: !69, line: 1534, column: 3)
!1991 = !DILocation(line: 1535, column: 22, scope: !1990)
!1992 = !DILocation(line: 1535, column: 20, scope: !1990)
!1993 = !DILocation(line: 1536, column: 16, scope: !1990)
!1994 = !DILocation(line: 1536, column: 32, scope: !1990)
!1995 = !DILocation(line: 1536, column: 31, scope: !1990)
!1996 = !DILocation(line: 1536, column: 13, scope: !1990)
!1997 = !DILocation(line: 1537, column: 15, scope: !1990)
!1998 = !DILocation(line: 1537, column: 34, scope: !1990)
!1999 = !DILocation(line: 1537, column: 45, scope: !1990)
!2000 = !DILocation(line: 1537, column: 43, scope: !1990)
!2001 = !DILocation(line: 1537, column: 31, scope: !1990)
!2002 = !DILocation(line: 1537, column: 13, scope: !1990)
!2003 = !DILocation(line: 1539, column: 8, scope: !2004)
!2004 = distinct !DILexicalBlock(scope: !1990, file: !69, line: 1539, column: 7)
!2005 = !DILocation(line: 1539, column: 20, scope: !2004)
!2006 = !DILocation(line: 1539, column: 27, scope: !2004)
!2007 = !DILocation(line: 1539, column: 7, scope: !1990)
!2008 = !DILocation(line: 1541, column: 19, scope: !2009)
!2009 = distinct !DILexicalBlock(scope: !2004, file: !69, line: 1540, column: 4)
!2010 = !DILocation(line: 1541, column: 31, scope: !2009)
!2011 = !DILocation(line: 1541, column: 17, scope: !2009)
!2012 = !DILocation(line: 1542, column: 4, scope: !2009)
!2013 = !DILocation(line: 1545, column: 20, scope: !2014)
!2014 = distinct !DILexicalBlock(scope: !2004, file: !69, line: 1544, column: 4)
!2015 = !DILocation(line: 1545, column: 32, scope: !2014)
!2016 = !DILocation(line: 1545, column: 38, scope: !2014)
!2017 = !DILocation(line: 1545, column: 17, scope: !2014)
!2018 = !DILocation(line: 1548, column: 7, scope: !2019)
!2019 = distinct !DILexicalBlock(scope: !1990, file: !69, line: 1548, column: 7)
!2020 = !DILocation(line: 1548, column: 18, scope: !2019)
!2021 = !DILocation(line: 1548, column: 16, scope: !2019)
!2022 = !DILocation(line: 1548, column: 7, scope: !1990)
!2023 = !DILocation(line: 1550, column: 18, scope: !2024)
!2024 = distinct !DILexicalBlock(scope: !2019, file: !69, line: 1549, column: 4)
!2025 = !DILocation(line: 1550, column: 16, scope: !2024)
!2026 = !DILocation(line: 1550, column: 28, scope: !2024)
!2027 = !DILocation(line: 1550, column: 14, scope: !2024)
!2028 = !DILocation(line: 1551, column: 4, scope: !2024)
!2029 = !DILocation(line: 1554, column: 18, scope: !2030)
!2030 = distinct !DILexicalBlock(scope: !2019, file: !69, line: 1553, column: 4)
!2031 = !DILocation(line: 1554, column: 26, scope: !2030)
!2032 = !DILocation(line: 1554, column: 16, scope: !2030)
!2033 = !DILocation(line: 1554, column: 30, scope: !2030)
!2034 = !DILocation(line: 1554, column: 14, scope: !2030)
!2035 = !DILocation(line: 1556, column: 8, scope: !2036)
!2036 = distinct !DILexicalBlock(scope: !1990, file: !69, line: 1556, column: 7)
!2037 = !DILocation(line: 1556, column: 18, scope: !2036)
!2038 = !DILocation(line: 1556, column: 7, scope: !1990)
!2039 = !DILocation(line: 1558, column: 18, scope: !2040)
!2040 = distinct !DILexicalBlock(scope: !2036, file: !69, line: 1557, column: 4)
!2041 = !DILocation(line: 1558, column: 12, scope: !2040)
!2042 = !DILocation(line: 1558, column: 5, scope: !2040)
!2043 = !DILocation(line: 1562, column: 5, scope: !2044)
!2044 = distinct !DILexicalBlock(scope: !2036, file: !69, line: 1561, column: 4)
!2045 = !DILocation(line: 1567, column: 16, scope: !2046)
!2046 = distinct !DILexicalBlock(scope: !1985, file: !69, line: 1566, column: 3)
!2047 = !DILocation(line: 1567, column: 26, scope: !2046)
!2048 = !DILocation(line: 1567, column: 25, scope: !2046)
!2049 = !DILocation(line: 1567, column: 41, scope: !2046)
!2050 = !DILocation(line: 1567, column: 39, scope: !2046)
!2051 = !DILocation(line: 1567, column: 13, scope: !2046)
!2052 = !DILocation(line: 1568, column: 16, scope: !2046)
!2053 = !DILocation(line: 1568, column: 30, scope: !2046)
!2054 = !DILocation(line: 1568, column: 40, scope: !2046)
!2055 = !DILocation(line: 1568, column: 39, scope: !2046)
!2056 = !DILocation(line: 1568, column: 55, scope: !2046)
!2057 = !DILocation(line: 1568, column: 53, scope: !2046)
!2058 = !DILocation(line: 1568, column: 26, scope: !2046)
!2059 = !DILocation(line: 1568, column: 68, scope: !2046)
!2060 = !DILocation(line: 1568, column: 13, scope: !2046)
!2061 = !DILocation(line: 1569, column: 16, scope: !2046)
!2062 = !DILocation(line: 1569, column: 25, scope: !2046)
!2063 = !DILocation(line: 1569, column: 24, scope: !2046)
!2064 = !DILocation(line: 1569, column: 41, scope: !2046)
!2065 = !DILocation(line: 1569, column: 51, scope: !2046)
!2066 = !DILocation(line: 1569, column: 50, scope: !2046)
!2067 = !DILocation(line: 1569, column: 38, scope: !2046)
!2068 = !DILocation(line: 1569, column: 13, scope: !2046)
!2069 = !DILocation(line: 1570, column: 7, scope: !2070)
!2070 = distinct !DILexicalBlock(scope: !2046, file: !69, line: 1570, column: 7)
!2071 = !DILocation(line: 1570, column: 16, scope: !2070)
!2072 = !DILocation(line: 1570, column: 7, scope: !2046)
!2073 = !DILocation(line: 1572, column: 17, scope: !2074)
!2074 = distinct !DILexicalBlock(scope: !2070, file: !69, line: 1571, column: 4)
!2075 = !DILocation(line: 1572, column: 12, scope: !2074)
!2076 = !DILocation(line: 1572, column: 5, scope: !2074)
!2077 = !DILocation(line: 1576, column: 5, scope: !2078)
!2078 = distinct !DILexicalBlock(scope: !2070, file: !69, line: 1575, column: 4)
!2079 = !DILocation(line: 1580, column: 1, scope: !1950)
!2080 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2081, file: !2081, line: 12, type: !2082, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2085)
!2081 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2082 = !DISubroutineType(types: !2083)
!2083 = !{null, !2084}
!2084 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2085 = !{!2086}
!2086 = !DILocalVariable(name: "z", arg: 1, scope: !2080, file: !2081, line: 12, type: !2084)
!2087 = !DILocation(line: 0, scope: !2080)
!2088 = !DILocation(line: 13, column: 9, scope: !2089)
!2089 = distinct !DILexicalBlock(scope: !2080, file: !2081, line: 13, column: 7)
!2090 = !DILocation(line: 13, column: 7, scope: !2080)
!2091 = !DILocation(line: 14, column: 5, scope: !2089)
!2092 = !DILocation(line: 15, column: 1, scope: !2080)
!2093 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2094, file: !2094, line: 20, type: !2095, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2098)
!2094 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2095 = !DISubroutineType(types: !2096)
!2096 = !{null, !2097, !2097}
!2097 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2098 = !{!2099, !2100}
!2099 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2093, file: !2094, line: 20, type: !2097)
!2100 = !DILocalVariable(name: "shift", arg: 2, scope: !2093, file: !2094, line: 20, type: !2097)
!2101 = !DILocation(line: 0, scope: !2093)
!2102 = !DILocation(line: 21, column: 13, scope: !2103)
!2103 = distinct !DILexicalBlock(scope: !2093, file: !2094, line: 21, column: 7)
!2104 = !DILocation(line: 21, column: 7, scope: !2093)
!2105 = !DILocation(line: 27, column: 5, scope: !2106)
!2106 = distinct !DILexicalBlock(scope: !2103, file: !2094, line: 21, column: 26)
!2107 = !DILocation(line: 29, column: 1, scope: !2093)
