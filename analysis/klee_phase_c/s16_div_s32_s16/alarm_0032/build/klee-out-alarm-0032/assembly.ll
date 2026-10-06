; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0032/build/s16_div_s32_s16_alarm_0032.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [65 x i8] c"KLEE-ALARM-0032: division by zero. assert (s32)denominator != 0;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0032.err\00", align 1
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
  br i1 %cmp92, label %if.then94, label %if.else103, !dbg !359

if.then94:                                        ; preds = %if.else90
  %40 = load i16, i16* %denominator.addr, align 2, !dbg !360
  %conv95 = sext i16 %40 to i64, !dbg !363
  %call96 = call i32 @klee_alarm_divisor_nonzero(i64 %conv95), !dbg !364
  %tobool97 = icmp ne i32 %call96, 0, !dbg !364
  br i1 %tobool97, label %if.end99, label %if.then98, !dbg !365

if.then98:                                        ; preds = %if.then94
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 337, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !366
  unreachable, !dbg !366

if.end99:                                         ; preds = %if.then94
  %41 = load i32, i32* %s32Temp1, align 4, !dbg !368
  %42 = load i16, i16* %denominator.addr, align 2, !dbg !369
  %conv100 = sext i16 %42 to i32, !dbg !369
  %int_cast_to_i649 = zext i32 %conv100 to i64, !dbg !370
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !370
  %div101 = sdiv i32 %41, %conv100, !dbg !370, !klee.check.div !106
  %conv102 = sext i32 %div101 to i64, !dbg !371
  store volatile i64 %conv102, i64* @klee_alarm_sink_s64, align 8, !dbg !372
  store i16 0, i16* %retval, align 2, !dbg !373
  br label %return, !dbg !373

if.else103:                                       ; preds = %if.else90
  store i16 32767, i16* %retval, align 2, !dbg !374
  br label %return, !dbg !374

return:                                           ; preds = %if.else103, %if.end99, %if.else89, %if.else88, %if.then86, %if.then77, %if.then69, %if.then61, %if.then54, %if.then44, %if.then35, %if.then26, %if.then16, %if.then10, %if.else, %if.then4
  %43 = load i16, i16* %retval, align 2, !dbg !376
  ret i16 %43, !dbg !376
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !377 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !380, metadata !DIExpression()), !dbg !381
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !382
  %cmp = icmp ne i64 %0, 0, !dbg !383
  %conv = zext i1 %cmp to i32, !dbg !383
  ret i32 %conv, !dbg !384
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !385 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !386, metadata !DIExpression()), !dbg !387
  %0 = load i64, i64* %left.addr, align 8, !dbg !388
  %cmp = icmp sge i64 %0, 0, !dbg !389
  %conv = zext i1 %cmp to i32, !dbg !389
  ret i32 %conv, !dbg !390
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !391 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !394, metadata !DIExpression()), !dbg !395
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !396, metadata !DIExpression()), !dbg !397
  %0 = load i32, i32* %count.addr, align 4, !dbg !398
  %cmp = icmp uge i32 %0, 63, !dbg !400
  br i1 %cmp, label %if.then, label %if.end, !dbg !401

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !402
  br label %return, !dbg !402

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !404
  %2 = load i32, i32* %count.addr, align 4, !dbg !405
  %sh_prom = zext i32 %2 to i64, !dbg !406
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !406
  %shl = shl i64 1, %sh_prom, !dbg !406, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !407
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !408
  %conv = zext i1 %cmp1 to i32, !dbg !408
  store i32 %conv, i32* %retval, align 4, !dbg !409
  br label %return, !dbg !409

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !410
  ret i32 %3, !dbg !410
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !411 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !414, metadata !DIExpression()), !dbg !415
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !416, metadata !DIExpression()), !dbg !417
  %0 = load i64, i64* %left.addr, align 8, !dbg !418
  %1 = load i64, i64* %right.addr, align 8, !dbg !419
  %mul = mul nsw i64 %0, %1, !dbg !420
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !421
  %conv = zext i1 %cmp to i32, !dbg !421
  ret i32 %conv, !dbg !422
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !423 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !424, metadata !DIExpression()), !dbg !425
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !426, metadata !DIExpression()), !dbg !427
  %0 = load i64, i64* %left.addr, align 8, !dbg !428
  %1 = load i64, i64* %right.addr, align 8, !dbg !429
  %mul = mul nsw i64 %0, %1, !dbg !430
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !431
  %conv = zext i1 %cmp to i32, !dbg !431
  ret i32 %conv, !dbg !432
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_lower(i64 %left, i64 %right) #0 !dbg !433 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !434, metadata !DIExpression()), !dbg !435
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !436, metadata !DIExpression()), !dbg !437
  %0 = load i64, i64* %left.addr, align 8, !dbg !438
  %1 = load i64, i64* %right.addr, align 8, !dbg !439
  %add = add nsw i64 %0, %1, !dbg !440
  %cmp = icmp sge i64 %add, -2147483648, !dbg !441
  %conv = zext i1 %cmp to i32, !dbg !441
  ret i32 %conv, !dbg !442
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !443 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !444, metadata !DIExpression()), !dbg !445
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !446, metadata !DIExpression()), !dbg !447
  %0 = load i64, i64* %left.addr, align 8, !dbg !448
  %1 = load i64, i64* %right.addr, align 8, !dbg !449
  %add = add nsw i64 %0, %1, !dbg !450
  %cmp = icmp sle i64 %add, 2147483647, !dbg !451
  %conv = zext i1 %cmp to i32, !dbg !451
  ret i32 %conv, !dbg !452
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !453 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !456, metadata !DIExpression()), !dbg !457
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !458, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !460, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !462, metadata !DIExpression()), !dbg !463
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !464, metadata !DIExpression()), !dbg !465
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !466
  %conv = zext i16 %0 to i32, !dbg !466
  %and = and i32 %conv, 65535, !dbg !467
  %conv1 = trunc i32 %and to i16, !dbg !466
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !468
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !469
  %conv2 = sext i16 %1 to i32, !dbg !469
  %shl = shl i32 %conv2, 16, !dbg !470
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !471
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !472
  %conv3 = zext i16 %2 to i32, !dbg !472
  %cmp = icmp eq i32 %conv3, 0, !dbg !474
  br i1 %cmp, label %if.then, label %if.else9, !dbg !475

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !476
  %conv5 = sext i16 %3 to i32, !dbg !476
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !479
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !480

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !481
  br label %return, !dbg !481

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !483
  br label %return, !dbg !483

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !485
  %conv10 = sext i16 %4 to i32, !dbg !485
  %shl11 = shl i32 %conv10, 16, !dbg !487
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !488
  %conv12 = sext i16 %5 to i32, !dbg !488
  %shl13 = shl i32 %conv12, 16, !dbg !489
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !490
  %conv14 = zext i16 %6 to i32, !dbg !490
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !491
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !491
  %div = sdiv i32 %shl13, %conv14, !dbg !491, !klee.check.div !106
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !492
  %conv15 = zext i16 %7 to i32, !dbg !492
  %mul = mul nsw i32 %div, %conv15, !dbg !493
  %sub = sub nsw i32 %shl11, %mul, !dbg !494
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !495
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !496
  %shl16 = shl i32 %8, 1, !dbg !497
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !498
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !499
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !500
  %conv17 = zext i16 %10 to i32, !dbg !500
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !501
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !501
  %div18 = sdiv i32 %9, %conv17, !dbg !501, !klee.check.div !106
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !502
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !503
  %conv19 = sext i16 %11 to i32, !dbg !503
  %shl20 = shl i32 %conv19, 16, !dbg !504
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !505
  %conv21 = zext i16 %12 to i32, !dbg !505
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !506
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !506
  %div22 = sdiv i32 %shl20, %conv21, !dbg !506, !klee.check.div !106
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !507
  %add = add nsw i32 %div22, %13, !dbg !508
  store i32 %add, i32* %s32Temp1, align 4, !dbg !509
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !510
  %cmp23 = icmp slt i32 %14, 32767, !dbg !512
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !513

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !514
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !517
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !518

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !519
  %conv29 = trunc i32 %16 to i16, !dbg !521
  store i16 %conv29, i16* %retval, align 2, !dbg !522
  br label %return, !dbg !522

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !523
  br label %return, !dbg !523

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !525
  br label %return, !dbg !525

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !527
  ret i16 %17, !dbg !527
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !528 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !529, metadata !DIExpression()), !dbg !530
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !531, metadata !DIExpression()), !dbg !532
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !533, metadata !DIExpression()), !dbg !534
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !535, metadata !DIExpression()), !dbg !536
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !537
  %conv = zext i16 %0 to i32, !dbg !537
  %and = and i32 %conv, 65535, !dbg !538
  %conv1 = trunc i32 %and to i16, !dbg !537
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !539
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !540
  %conv2 = zext i16 %1 to i32, !dbg !540
  %cmp = icmp eq i32 %conv2, 0, !dbg !542
  br i1 %cmp, label %if.then, label %if.else8, !dbg !543

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !544
  %conv4 = sext i16 %2 to i32, !dbg !544
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !547
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !548

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !549
  br label %return, !dbg !549

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !551
  br label %return, !dbg !551

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !553
  %conv9 = sext i16 %3 to i32, !dbg !553
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !555
  %conv10 = sext i16 %4 to i32, !dbg !555
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !556
  %conv11 = zext i16 %5 to i32, !dbg !556
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !557
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !557
  %div = sdiv i32 %conv10, %conv11, !dbg !557, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !558
  %conv12 = zext i16 %6 to i32, !dbg !558
  %mul = mul nsw i32 %div, %conv12, !dbg !559
  %sub = sub nsw i32 %conv9, %mul, !dbg !560
  %shl = shl i32 %sub, 1, !dbg !561
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !562
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !563
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !564
  %conv13 = zext i16 %8 to i32, !dbg !564
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !565
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !565
  %div14 = sdiv i32 %7, %conv13, !dbg !565, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !566
  %conv15 = sext i16 %9 to i32, !dbg !566
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !567
  %conv16 = zext i16 %10 to i32, !dbg !567
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !568
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !568
  %div17 = sdiv i32 %conv15, %conv16, !dbg !568, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !569
  store i32 %add, i32* %s32Temp1, align 4, !dbg !570
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !571
  %conv18 = trunc i32 %11 to i16, !dbg !571
  store i16 %conv18, i16* %retval, align 2, !dbg !572
  br label %return, !dbg !572

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !573
  ret i16 %12, !dbg !573
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !574 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !577, metadata !DIExpression()), !dbg !578
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !579, metadata !DIExpression()), !dbg !580
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !581, metadata !DIExpression()), !dbg !583
  store i32 0, i32* %u32Temp1, align 4, !dbg !583
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !584, metadata !DIExpression()), !dbg !585
  store i32 0, i32* %u32Temp2, align 4, !dbg !585
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !586, metadata !DIExpression()), !dbg !587
  store i32 0, i32* %u32Temp3, align 4, !dbg !587
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !588
  %conv = zext i16 %0 to i32, !dbg !588
  %cmp = icmp eq i32 %conv, 0, !dbg !590
  br i1 %cmp, label %if.then, label %if.else, !dbg !591

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !592
  br label %return, !dbg !592

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !594
  %conv2 = zext i16 %1 to i32, !dbg !594
  %shl = shl i32 %conv2, 16, !dbg !596
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !597
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !598
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !599
  %conv3 = zext i16 %3 to i32, !dbg !599
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !600
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !600
  %div = udiv i32 %2, %conv3, !dbg !600, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !601
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !602
  %add = add i32 %4, 128, !dbg !603
  %shr = lshr i32 %add, 8, !dbg !604
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !605
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !606
  %cmp4 = icmp ult i32 %5, 255, !dbg !608
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !609

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !610
  %conv7 = trunc i32 %6 to i8, !dbg !612
  store i8 %conv7, i8* %retval, align 1, !dbg !613
  br label %return, !dbg !613

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !614
  br label %return, !dbg !614

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !616
  ret i8 %7, !dbg !616
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !617 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !620, metadata !DIExpression()), !dbg !621
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !622, metadata !DIExpression()), !dbg !623
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !624, metadata !DIExpression()), !dbg !625
  store i32 0, i32* %s32Temp1, align 4, !dbg !625
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !626
  %conv = zext i16 %0 to i32, !dbg !626
  %and = and i32 %conv, 65535, !dbg !627
  %conv1 = trunc i32 %and to i16, !dbg !626
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !628
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !629
  %conv2 = zext i16 %1 to i32, !dbg !629
  %and3 = and i32 %conv2, 65535, !dbg !631
  %cmp = icmp eq i32 %and3, 0, !dbg !632
  br i1 %cmp, label %if.then, label %if.else8, !dbg !633

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !634
  %cmp5 = icmp sge i32 %2, 0, !dbg !637
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !638

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !639
  br label %return, !dbg !639

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !641
  br label %return, !dbg !641

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !643
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !645
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !646
  %conv9 = zext i16 %5 to i32, !dbg !646
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !647
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !647
  %div = sdiv i32 %4, %conv9, !dbg !647, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !648
  %conv10 = zext i16 %6 to i32, !dbg !648
  %mul = mul nsw i32 %div, %conv10, !dbg !649
  %sub = sub nsw i32 %3, %mul, !dbg !650
  %shl = shl i32 %sub, 1, !dbg !651
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !652
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !653
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !654
  %conv11 = zext i16 %8 to i32, !dbg !654
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !655
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !655
  %div12 = sdiv i32 %7, %conv11, !dbg !655, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !656
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !657
  %conv13 = zext i16 %10 to i32, !dbg !657
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !658
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !658
  %div14 = sdiv i32 %9, %conv13, !dbg !658, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !659
  store i32 %add, i32* %s32Temp1, align 4, !dbg !660
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !661
  %cmp15 = icmp slt i32 %11, 65535, !dbg !663
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !664

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !665
  %cmp18 = icmp sgt i32 %12, 0, !dbg !668
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !669

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !670
  %conv21 = trunc i32 %13 to i16, !dbg !672
  store i16 %conv21, i16* %retval, align 2, !dbg !673
  br label %return, !dbg !673

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !674
  br label %return, !dbg !674

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !676
  br label %return, !dbg !676

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !678
  ret i16 %14, !dbg !678
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !679 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !682, metadata !DIExpression()), !dbg !683
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !684, metadata !DIExpression()), !dbg !685
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !686, metadata !DIExpression()), !dbg !687
  store i32 0, i32* %u32Temp, align 4, !dbg !687
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !688
  %conv = zext i16 %0 to i32, !dbg !688
  %cmp = icmp eq i32 %conv, 0, !dbg !690
  br i1 %cmp, label %if.then, label %if.else, !dbg !691

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !692
  br label %return, !dbg !692

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !694
  %conv2 = zext i16 %1 to i32, !dbg !694
  %shl = shl i32 %conv2, 16, !dbg !696
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !697
  %conv3 = zext i16 %2 to i32, !dbg !697
  %shr = ashr i32 %conv3, 1, !dbg !698
  %add = add nsw i32 %shl, %shr, !dbg !699
  store i32 %add, i32* %u32Temp, align 4, !dbg !700
  %3 = load i32, i32* %u32Temp, align 4, !dbg !701
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !702
  %conv4 = zext i16 %4 to i32, !dbg !702
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !703
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !703
  %div = udiv i32 %3, %conv4, !dbg !703, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !704
  %5 = load i32, i32* %u32Temp, align 4, !dbg !705
  %cmp5 = icmp ult i32 %5, 65535, !dbg !707
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !708

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !709
  %and = and i32 %6, 65535, !dbg !711
  %conv8 = trunc i32 %and to i16, !dbg !709
  store i16 %conv8, i16* %retval, align 2, !dbg !712
  br label %return, !dbg !712

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !713
  br label %return, !dbg !713

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !715
  ret i16 %7, !dbg !715
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !716 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !719, metadata !DIExpression()), !dbg !720
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !721, metadata !DIExpression()), !dbg !722
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !723, metadata !DIExpression()), !dbg !724
  store i32 0, i32* %u32Temp1, align 4, !dbg !724
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !725, metadata !DIExpression()), !dbg !726
  store i32 0, i32* %u32Temp2, align 4, !dbg !726
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !727
  %conv = zext i16 %0 to i32, !dbg !727
  %and = and i32 %conv, 65535, !dbg !728
  %conv1 = trunc i32 %and to i16, !dbg !727
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !729
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !730
  %conv2 = zext i16 %1 to i32, !dbg !730
  %cmp = icmp eq i32 %conv2, 0, !dbg !732
  br i1 %cmp, label %if.then, label %if.else, !dbg !733

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !734
  br label %return, !dbg !734

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !736
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !738
  %conv4 = zext i16 %3 to i32, !dbg !738
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !739
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !739
  %div = udiv i32 %2, %conv4, !dbg !739, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !740
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !741
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !742
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !743
  %conv5 = zext i16 %6 to i32, !dbg !743
  %mul = mul i32 %5, %conv5, !dbg !744
  %sub = sub i32 %4, %mul, !dbg !745
  %shl = shl i32 %sub, 1, !dbg !746
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !747
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !748
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !749
  %conv6 = zext i16 %8 to i32, !dbg !749
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !750
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !750
  %div7 = udiv i32 %7, %conv6, !dbg !750, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !751
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !752
  %conv8 = zext i16 %10 to i32, !dbg !752
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !753
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !753
  %div9 = udiv i32 %9, %conv8, !dbg !753, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !754
  store i32 %add, i32* %u32Temp2, align 4, !dbg !755
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !756
  %cmp10 = icmp ult i32 %11, 65535, !dbg !758
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !759

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !760
  %and13 = and i32 %12, 65535, !dbg !762
  %conv14 = trunc i32 %and13 to i16, !dbg !760
  store i16 %conv14, i16* %retval, align 2, !dbg !763
  br label %return, !dbg !763

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !764
  br label %return, !dbg !764

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !766
  ret i16 %13, !dbg !766
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !767 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !770, metadata !DIExpression()), !dbg !771
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !772, metadata !DIExpression()), !dbg !773
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !774, metadata !DIExpression()), !dbg !775
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !776, metadata !DIExpression()), !dbg !777
  store i32 0, i32* %s32Result, align 4, !dbg !777
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !778, metadata !DIExpression()), !dbg !779
  store i32 0, i32* %s32Temp1, align 4, !dbg !779
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !780
  %conv = sext i16 %0 to i32, !dbg !780
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !781
  %conv1 = zext i16 %1 to i32, !dbg !781
  %mul = mul nsw i32 %conv, %conv1, !dbg !782
  store i32 %mul, i32* %s32Result, align 4, !dbg !783
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !784
  %conv2 = sext i16 %2 to i32, !dbg !784
  %cmp = icmp eq i32 %conv2, 0, !dbg !786
  br i1 %cmp, label %if.then, label %if.else7, !dbg !787

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !788
  %cmp4 = icmp slt i32 %3, 0, !dbg !791
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !792

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !793
  br label %return, !dbg !793

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !795
  br label %return, !dbg !795

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !797
  %5 = load i32, i32* %s32Result, align 4, !dbg !799
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !800
  %conv8 = sext i16 %6 to i32, !dbg !800
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !801
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !801
  %div = sdiv i32 %5, %conv8, !dbg !801, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !802
  %conv9 = sext i16 %7 to i32, !dbg !802
  %mul10 = mul nsw i32 %div, %conv9, !dbg !803
  %sub = sub nsw i32 %4, %mul10, !dbg !804
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !805
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !806
  %shl = shl i32 %8, 1, !dbg !807
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !808
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !809
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !810
  %conv11 = sext i16 %10 to i32, !dbg !810
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !811
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !811
  %div12 = sdiv i32 %9, %conv11, !dbg !811, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !812
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !813
  %conv13 = sext i16 %12 to i32, !dbg !813
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !814
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !814
  %div14 = sdiv i32 %11, %conv13, !dbg !814, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !815
  store i32 %add, i32* %s32Result, align 4, !dbg !816
  %13 = load i32, i32* %s32Result, align 4, !dbg !817
  %cmp15 = icmp slt i32 %13, 32767, !dbg !819
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !820

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !821
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !824
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !825

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !826
  %conv21 = trunc i32 %15 to i16, !dbg !828
  store i16 %conv21, i16* %retval, align 2, !dbg !829
  br label %return, !dbg !829

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !830
  br label %return, !dbg !830

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !832
  br label %return, !dbg !832

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !834
  ret i16 %16, !dbg !834
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !835 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !838, metadata !DIExpression()), !dbg !839
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !840, metadata !DIExpression()), !dbg !841
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !842, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !844, metadata !DIExpression()), !dbg !845
  store i32 0, i32* %s32Result, align 4, !dbg !845
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !846, metadata !DIExpression()), !dbg !847
  store i32 0, i32* %s32Temp1, align 4, !dbg !847
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !848
  %conv = zext i16 %0 to i32, !dbg !848
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !849
  %conv1 = sext i16 %1 to i32, !dbg !849
  %mul = mul nsw i32 %conv, %conv1, !dbg !850
  store i32 %mul, i32* %s32Result, align 4, !dbg !851
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !852
  %conv2 = zext i16 %2 to i32, !dbg !852
  %cmp = icmp eq i32 %conv2, 0, !dbg !854
  br i1 %cmp, label %if.then, label %if.else7, !dbg !855

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !856
  %cmp4 = icmp slt i32 %3, 0, !dbg !859
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !860

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !861
  br label %return, !dbg !861

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !863
  br label %return, !dbg !863

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !865
  %5 = load i32, i32* %s32Result, align 4, !dbg !867
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !868
  %conv8 = zext i16 %6 to i32, !dbg !868
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !869
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !869
  %div = sdiv i32 %5, %conv8, !dbg !869, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !870
  %conv9 = zext i16 %7 to i32, !dbg !870
  %mul10 = mul nsw i32 %div, %conv9, !dbg !871
  %sub = sub nsw i32 %4, %mul10, !dbg !872
  %shl = shl i32 %sub, 1, !dbg !873
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !874
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !875
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !876
  %conv11 = zext i16 %9 to i32, !dbg !876
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !877
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !877
  %div12 = sdiv i32 %8, %conv11, !dbg !877, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !878
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !879
  %conv13 = zext i16 %11 to i32, !dbg !879
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !880
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !880
  %div14 = sdiv i32 %10, %conv13, !dbg !880, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !881
  store i32 %add, i32* %s32Result, align 4, !dbg !882
  %12 = load i32, i32* %s32Result, align 4, !dbg !883
  %cmp15 = icmp slt i32 %12, 32767, !dbg !885
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !886

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !887
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !890
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !891

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !892
  %conv21 = trunc i32 %14 to i16, !dbg !894
  store i16 %conv21, i16* %retval, align 2, !dbg !895
  br label %return, !dbg !895

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !896
  br label %return, !dbg !896

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !898
  br label %return, !dbg !898

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !900
  ret i16 %15, !dbg !900
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !901 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !904, metadata !DIExpression()), !dbg !905
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !906, metadata !DIExpression()), !dbg !907
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !908, metadata !DIExpression()), !dbg !909
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !910, metadata !DIExpression()), !dbg !911
  store i32 0, i32* %u32Result, align 4, !dbg !911
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !912, metadata !DIExpression()), !dbg !913
  store i32 0, i32* %u32Temp1, align 4, !dbg !913
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !914, metadata !DIExpression()), !dbg !915
  store i32 0, i32* %s32Result, align 4, !dbg !915
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !916, metadata !DIExpression()), !dbg !917
  store i32 0, i32* %s32Temp1, align 4, !dbg !917
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !918
  %conv = sext i16 %0 to i32, !dbg !918
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !919
  %conv1 = zext i16 %1 to i32, !dbg !919
  %mul = mul nsw i32 %conv, %conv1, !dbg !920
  store i32 %mul, i32* %s32Result, align 4, !dbg !921
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !922
  %conv2 = sext i16 %2 to i32, !dbg !922
  %cmp = icmp eq i32 %conv2, 0, !dbg !924
  br i1 %cmp, label %if.then, label %if.else7, !dbg !925

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !926
  %cmp4 = icmp sge i32 %3, 0, !dbg !929
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !930

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !931
  br label %return, !dbg !931

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !933
  br label %return, !dbg !933

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !935
  %5 = load i32, i32* %s32Result, align 4, !dbg !937
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !938
  %conv8 = sext i16 %6 to i32, !dbg !938
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !939
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !939
  %div = sdiv i32 %5, %conv8, !dbg !939, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !940
  %conv9 = sext i16 %7 to i32, !dbg !940
  %mul10 = mul nsw i32 %div, %conv9, !dbg !941
  %sub = sub nsw i32 %4, %mul10, !dbg !942
  %shl = shl i32 %sub, 1, !dbg !943
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !944
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !945
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !946
  %conv11 = sext i16 %9 to i32, !dbg !946
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !947
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !947
  %div12 = sdiv i32 %8, %conv11, !dbg !947, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !948
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !949
  %conv13 = sext i16 %11 to i32, !dbg !949
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !950
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !950
  %div14 = sdiv i32 %10, %conv13, !dbg !950, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !951
  store i32 %add, i32* %s32Result, align 4, !dbg !952
  %12 = load i32, i32* %s32Result, align 4, !dbg !953
  %cmp15 = icmp slt i32 %12, 65535, !dbg !955
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !956

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !957
  %cmp18 = icmp sgt i32 %13, 0, !dbg !960
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !961

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !962
  %conv21 = trunc i32 %14 to i16, !dbg !964
  store i16 %conv21, i16* %retval, align 2, !dbg !965
  br label %return, !dbg !965

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !966
  br label %return, !dbg !966

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !968
  br label %return, !dbg !968

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !970
  ret i16 %15, !dbg !970
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !971 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !974, metadata !DIExpression()), !dbg !975
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !976, metadata !DIExpression()), !dbg !977
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !978, metadata !DIExpression()), !dbg !979
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !980, metadata !DIExpression()), !dbg !981
  store i32 0, i32* %s32Result, align 4, !dbg !981
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !982, metadata !DIExpression()), !dbg !983
  store i32 0, i32* %s32Temp1, align 4, !dbg !983
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !984
  %conv = sext i16 %0 to i32, !dbg !984
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !985
  %conv1 = zext i16 %1 to i32, !dbg !985
  %mul = mul nsw i32 %conv, %conv1, !dbg !986
  store i32 %mul, i32* %s32Result, align 4, !dbg !987
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !988
  %conv2 = zext i16 %2 to i32, !dbg !988
  %cmp = icmp eq i32 %conv2, 0, !dbg !990
  br i1 %cmp, label %if.then, label %if.else7, !dbg !991

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !992
  %cmp4 = icmp sge i32 %3, 0, !dbg !995
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !996

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !997
  br label %return, !dbg !997

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !999
  br label %return, !dbg !999

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1001
  %5 = load i32, i32* %s32Result, align 4, !dbg !1003
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1004
  %conv8 = zext i16 %6 to i32, !dbg !1004
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1005
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1005
  %div = sdiv i32 %5, %conv8, !dbg !1005, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1006
  %conv9 = zext i16 %7 to i32, !dbg !1006
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1007
  %sub = sub nsw i32 %4, %mul10, !dbg !1008
  %shl = shl i32 %sub, 1, !dbg !1009
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1010
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1011
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1012
  %conv11 = zext i16 %9 to i32, !dbg !1012
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1013
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1013
  %div12 = sdiv i32 %8, %conv11, !dbg !1013, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !1014
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1015
  %conv13 = zext i16 %11 to i32, !dbg !1015
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1016
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1016
  %div14 = sdiv i32 %10, %conv13, !dbg !1016, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !1017
  store i32 %add, i32* %s32Result, align 4, !dbg !1018
  %12 = load i32, i32* %s32Result, align 4, !dbg !1019
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1021
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1022

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1023
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1026
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1027

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1028
  %conv21 = trunc i32 %14 to i16, !dbg !1030
  store i16 %conv21, i16* %retval, align 2, !dbg !1031
  br label %return, !dbg !1031

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1032
  br label %return, !dbg !1032

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1034
  br label %return, !dbg !1034

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1036
  ret i16 %15, !dbg !1036
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1037 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1040, metadata !DIExpression()), !dbg !1041
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1042, metadata !DIExpression()), !dbg !1043
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1044, metadata !DIExpression()), !dbg !1045
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1046, metadata !DIExpression()), !dbg !1047
  store i32 0, i32* %u32Temp1, align 4, !dbg !1047
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1048, metadata !DIExpression()), !dbg !1049
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1049
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1050
  %conv = zext i16 %0 to i32, !dbg !1050
  %cmp = icmp eq i32 %conv, 0, !dbg !1052
  br i1 %cmp, label %if.then, label %if.else, !dbg !1053

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1054
  br label %return, !dbg !1054

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1056
  %conv2 = zext i16 %1 to i32, !dbg !1056
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1058
  %conv3 = zext i16 %2 to i32, !dbg !1058
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1059
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1060
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1061
  %conv4 = zext i16 %3 to i32, !dbg !1061
  %shr = ashr i32 %conv4, 1, !dbg !1062
  %conv5 = trunc i32 %shr to i16, !dbg !1061
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1063
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1064
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1065
  %conv6 = zext i16 %5 to i32, !dbg !1065
  %add = add i32 %4, %conv6, !dbg !1066
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1067
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1068
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1069
  %conv7 = zext i16 %7 to i32, !dbg !1069
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1070
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1070
  %div = udiv i32 %6, %conv7, !dbg !1070, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1071
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1072
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1074
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1075

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1076
  %and = and i32 %9, 65535, !dbg !1078
  %conv11 = trunc i32 %and to i16, !dbg !1079
  store i16 %conv11, i16* %retval, align 2, !dbg !1080
  br label %return, !dbg !1080

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1081
  br label %return, !dbg !1081

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1083
  ret i16 %10, !dbg !1083
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1084 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1087, metadata !DIExpression()), !dbg !1088
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1089, metadata !DIExpression()), !dbg !1090
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1091, metadata !DIExpression()), !dbg !1092
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1093, metadata !DIExpression()), !dbg !1094
  store i32 0, i32* %u32Temp1, align 4, !dbg !1094
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1095
  %cmp = icmp eq i32 %0, 0, !dbg !1097
  br i1 %cmp, label %if.then, label %if.else, !dbg !1098

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1099
  br label %return, !dbg !1099

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1101
  %conv = zext i16 %1 to i32, !dbg !1101
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1103
  %conv1 = zext i16 %2 to i32, !dbg !1103
  %mul = mul nsw i32 %conv, %conv1, !dbg !1104
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1105
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1106
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1106
  %div = udiv i32 %mul, %3, !dbg !1106, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1107
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1108
  %conv2 = zext i16 %4 to i32, !dbg !1108
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1110
  %conv3 = zext i16 %5 to i32, !dbg !1110
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1111
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1112
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1113
  %mul5 = mul i32 %6, %7, !dbg !1114
  %sub = sub i32 %mul4, %mul5, !dbg !1115
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1116
  %div6 = udiv i32 %8, 2, !dbg !1117
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1118
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1119

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1120
  %inc = add i32 %9, 1, !dbg !1120
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1120
  br label %if.end, !dbg !1122

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1123
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1125
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1126

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1127
  %and = and i32 %11, 65535, !dbg !1129
  %conv13 = trunc i32 %and to i16, !dbg !1130
  store i16 %conv13, i16* %retval, align 2, !dbg !1131
  br label %return, !dbg !1131

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1132
  br label %return, !dbg !1132

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1134
  ret i16 %12, !dbg !1134
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1135 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1138, metadata !DIExpression()), !dbg !1139
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1140, metadata !DIExpression()), !dbg !1141
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1142, metadata !DIExpression()), !dbg !1143
  store i32 0, i32* %u32Temp1, align 4, !dbg !1143
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1144
  %conv = zext i16 %0 to i32, !dbg !1144
  %cmp = icmp eq i32 %conv, 0, !dbg !1146
  br i1 %cmp, label %if.then, label %if.else, !dbg !1147

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1148
  br label %return, !dbg !1148

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1150
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1152
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1153
  %conv2 = zext i16 %3 to i32, !dbg !1153
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1154
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1154
  %div = udiv i32 %2, %conv2, !dbg !1154, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1155
  %conv3 = zext i16 %4 to i32, !dbg !1155
  %mul = mul i32 %div, %conv3, !dbg !1156
  %sub = sub i32 %1, %mul, !dbg !1157
  %shl = shl i32 %sub, 1, !dbg !1158
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1159
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1160
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1161
  %conv4 = zext i16 %6 to i32, !dbg !1161
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1162
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1162
  %div5 = udiv i32 %5, %conv4, !dbg !1162, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1163
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1164
  %conv6 = zext i16 %8 to i32, !dbg !1164
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1165
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1165
  %div7 = udiv i32 %7, %conv6, !dbg !1165, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1166
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1167
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1168
  store i32 %9, i32* %retval, align 4, !dbg !1169
  br label %return, !dbg !1169

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1170
  ret i32 %10, !dbg !1170
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1171 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1174, metadata !DIExpression()), !dbg !1175
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1176, metadata !DIExpression()), !dbg !1177
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1178, metadata !DIExpression()), !dbg !1179
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1180, metadata !DIExpression()), !dbg !1181
  store i32 0, i32* %s32Temp1, align 4, !dbg !1181
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1182, metadata !DIExpression()), !dbg !1183
  store i32 0, i32* %s32Temp2, align 4, !dbg !1183
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1184, metadata !DIExpression()), !dbg !1185
  store i32 0, i32* %s32Temp3, align 4, !dbg !1185
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1186
  %conv = sext i16 %0 to i32, !dbg !1186
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1187
  %conv1 = sext i16 %1 to i32, !dbg !1187
  %mul = mul nsw i32 %conv, %conv1, !dbg !1188
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1189
  %2 = load i16, i16* %div.addr, align 2, !dbg !1190
  %conv2 = sext i16 %2 to i32, !dbg !1190
  %cmp = icmp eq i32 %conv2, 0, !dbg !1192
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1193

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1194
  %cmp4 = icmp slt i32 %3, 0, !dbg !1197
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1198

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1199
  br label %return, !dbg !1199

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1201
  br label %return, !dbg !1201

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1203
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1205
  %6 = load i16, i16* %div.addr, align 2, !dbg !1206
  %conv8 = sext i16 %6 to i32, !dbg !1206
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1207
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1207
  %div9 = sdiv i32 %5, %conv8, !dbg !1207, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1208
  %conv10 = sext i16 %7 to i32, !dbg !1208
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1209
  %sub = sub nsw i32 %4, %mul11, !dbg !1210
  %shl = shl i32 %sub, 1, !dbg !1211
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1212
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1213
  %9 = load i16, i16* %div.addr, align 2, !dbg !1214
  %conv12 = sext i16 %9 to i32, !dbg !1214
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1215
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1215
  %div13 = sdiv i32 %8, %conv12, !dbg !1215, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1216
  %11 = load i16, i16* %div.addr, align 2, !dbg !1217
  %conv14 = sext i16 %11 to i32, !dbg !1217
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1218
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1218
  %div15 = sdiv i32 %10, %conv14, !dbg !1218, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1219
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1220
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1221
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1223
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1224

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1225
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1228
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1229

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1230
  %conv22 = trunc i32 %14 to i16, !dbg !1232
  store i16 %conv22, i16* %retval, align 2, !dbg !1233
  br label %return, !dbg !1233

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1234
  br label %return, !dbg !1234

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1236
  br label %return, !dbg !1236

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1238
  ret i16 %15, !dbg !1238
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1239 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1242, metadata !DIExpression()), !dbg !1243
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1244, metadata !DIExpression()), !dbg !1245
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1246, metadata !DIExpression()), !dbg !1247
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1248, metadata !DIExpression()), !dbg !1249
  store i32 0, i32* %s32Result, align 4, !dbg !1249
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1250, metadata !DIExpression()), !dbg !1251
  store i32 0, i32* %s32Temp1, align 4, !dbg !1251
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1252
  %conv = sext i16 %0 to i32, !dbg !1252
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1253
  %conv1 = sext i16 %1 to i32, !dbg !1253
  %mul = mul nsw i32 %conv, %conv1, !dbg !1254
  store i32 %mul, i32* %s32Result, align 4, !dbg !1255
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1256
  %conv2 = zext i16 %2 to i32, !dbg !1256
  %cmp = icmp eq i32 %conv2, 0, !dbg !1258
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1259

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1260
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1263
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1264

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1265
  br label %return, !dbg !1265

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1267
  %cmp7 = icmp eq i32 %4, 0, !dbg !1269
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1270

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1271
  br label %return, !dbg !1271

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1273
  br label %return, !dbg !1273

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1275
  %6 = load i32, i32* %s32Result, align 4, !dbg !1277
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1278
  %conv12 = zext i16 %7 to i32, !dbg !1278
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1279
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1279
  %div = sdiv i32 %6, %conv12, !dbg !1279, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1280
  %conv13 = zext i16 %8 to i32, !dbg !1280
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1281
  %sub = sub nsw i32 %5, %mul14, !dbg !1282
  %shl = shl i32 %sub, 1, !dbg !1283
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1284
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1285
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1286
  %conv15 = zext i16 %10 to i32, !dbg !1286
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1287
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1287
  %div16 = sdiv i32 %9, %conv15, !dbg !1287, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1288
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1289
  %conv17 = zext i16 %12 to i32, !dbg !1289
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1290
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1290
  %div18 = sdiv i32 %11, %conv17, !dbg !1290, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1291
  store i32 %add, i32* %s32Result, align 4, !dbg !1292
  %13 = load i32, i32* %s32Result, align 4, !dbg !1293
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1295
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1296

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1297
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1300
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1301

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1302
  %conv25 = trunc i32 %15 to i16, !dbg !1304
  store i16 %conv25, i16* %retval, align 2, !dbg !1305
  br label %return, !dbg !1305

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1306
  br label %return, !dbg !1306

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1308
  br label %return, !dbg !1308

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1310
  ret i16 %16, !dbg !1310
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1311 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1314, metadata !DIExpression()), !dbg !1315
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1316, metadata !DIExpression()), !dbg !1317
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1318, metadata !DIExpression()), !dbg !1319
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1320
  %cmp = icmp eq i32 %0, 0, !dbg !1322
  br i1 %cmp, label %if.then, label %if.else, !dbg !1323

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1324
  br label %return, !dbg !1324

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1326
  %cmp1 = icmp sle i32 %1, 0, !dbg !1329
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1330

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1331
  br label %return, !dbg !1331

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1333
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1335
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1336
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1337
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1337
  %div = udiv i32 %3, %4, !dbg !1337, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1338
  %mul = mul i32 %div, %5, !dbg !1339
  %sub = sub i32 %2, %mul, !dbg !1340
  %shl = shl i32 %sub, 1, !dbg !1341
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1342
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1343
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1344
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1345
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1345
  %div4 = udiv i32 %6, %7, !dbg !1345, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1346
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1347
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1348
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1348
  %div5 = udiv i32 %8, %9, !dbg !1348, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1349
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1350
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1351
  store i32 %10, i32* %retval, align 4, !dbg !1352
  br label %return, !dbg !1352

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1353
  ret i32 %11, !dbg !1353
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1354 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1357, metadata !DIExpression()), !dbg !1358
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1359, metadata !DIExpression()), !dbg !1360
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1361, metadata !DIExpression()), !dbg !1362
  store i32 0, i32* %s32Temp1, align 4, !dbg !1362
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1363
  %cmp = icmp eq i32 %0, 0, !dbg !1365
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1366

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1367
  %cmp1 = icmp sge i32 %1, 0, !dbg !1370
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1371

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1372
  br label %return, !dbg !1372

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1374
  br label %return, !dbg !1374

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1376
  %cmp4 = icmp sge i32 %2, 0, !dbg !1379
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1380

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1381
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1383
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1384
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1385
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1385
  %div = udiv i32 %4, %5, !dbg !1385, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1386
  %mul = mul i32 %div, %6, !dbg !1387
  %sub = sub i32 %3, %mul, !dbg !1388
  %shl = shl i32 %sub, 1, !dbg !1389
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1390
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1391
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1392
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1393
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1393
  %div6 = udiv i32 %7, %8, !dbg !1393, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1394
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1395
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1396
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1396
  %div7 = udiv i32 %9, %10, !dbg !1396, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1397
  store i32 %add, i32* %retval, align 4, !dbg !1398
  br label %return, !dbg !1398

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1399
  br label %return, !dbg !1399

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1401
  ret i32 %11, !dbg !1401
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1402 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1405, metadata !DIExpression()), !dbg !1406
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1407, metadata !DIExpression()), !dbg !1408
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1409, metadata !DIExpression()), !dbg !1410
  store i32 0, i32* %u32Temp1, align 4, !dbg !1410
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1411, metadata !DIExpression()), !dbg !1412
  store i32 0, i32* %u32Temp2, align 4, !dbg !1412
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1413
  %cmp = icmp eq i32 %0, 0, !dbg !1415
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1416

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1417
  %cmp1 = icmp slt i32 %1, 0, !dbg !1420
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1421

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1422
  br label %return, !dbg !1422

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1424
  br label %return, !dbg !1424

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1426
  %cmp4 = icmp sge i32 %2, 0, !dbg !1429
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1430

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1431
  %cmp6 = icmp eq i32 %3, 0, !dbg !1434
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1435

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1436
  br label %return, !dbg !1436

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1438
  %cmp9 = icmp sle i32 %4, 0, !dbg !1441
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1442

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1443
  br label %return, !dbg !1443

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1445
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1447
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1448
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1449
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1449
  %div = sdiv i32 %6, %7, !dbg !1449, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1450
  %mul = mul nsw i32 %div, %8, !dbg !1451
  %sub = sub nsw i32 %5, %mul, !dbg !1452
  %shl = shl i32 %sub, 1, !dbg !1453
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1454
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1455
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1456
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1457
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1457
  %div12 = udiv i32 %9, %10, !dbg !1457, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1458
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1459
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1460
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1460
  %div13 = sdiv i32 %11, %12, !dbg !1460, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1461
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1462
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1463
  store i32 %13, i32* %retval, align 4, !dbg !1464
  br label %return, !dbg !1464

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1465
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1468
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1469

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1470
  br label %return, !dbg !1470

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1472
  %sub18 = sub nsw i32 0, %15, !dbg !1474
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1475
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1476
  %sub19 = sub nsw i32 0, %16, !dbg !1477
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1478
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1479
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1480
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1481
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1482
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1482
  %div20 = sdiv i32 %18, %19, !dbg !1482, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1483
  %mul21 = mul nsw i32 %div20, %20, !dbg !1484
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1485
  %shl23 = shl i32 %sub22, 1, !dbg !1486
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1487
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1488
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1489
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1490
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1490
  %div24 = udiv i32 %21, %22, !dbg !1490, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1491
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1492
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1493
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1493
  %div25 = sdiv i32 %23, %24, !dbg !1493, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1494
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1495
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1496
  store i32 %25, i32* %retval, align 4, !dbg !1497
  br label %return, !dbg !1497

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1498
  ret i32 %26, !dbg !1498
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1499 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1502, metadata !DIExpression()), !dbg !1503
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1504, metadata !DIExpression()), !dbg !1505
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1506, metadata !DIExpression()), !dbg !1507
  store i32 0, i32* %u32Temp1, align 4, !dbg !1507
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1508, metadata !DIExpression()), !dbg !1509
  store i32 0, i32* %u32Temp2, align 4, !dbg !1509
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1510, metadata !DIExpression()), !dbg !1511
  store i32 0, i32* %u32Temp3, align 4, !dbg !1511
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1512, metadata !DIExpression()), !dbg !1513
  store i32 0, i32* %numerator_old, align 4, !dbg !1513
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1514
  %cmp = icmp eq i32 %0, 0, !dbg !1516
  br i1 %cmp, label %if.then, label %if.else, !dbg !1517

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1518
  br label %return, !dbg !1518

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1520
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1522
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1523
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1524
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1525
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1525
  %div = udiv i32 %3, %4, !dbg !1525, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1526
  %sub = sub i32 %1, %mul, !dbg !1527
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1528
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1529
  %and = and i32 %5, 1, !dbg !1531
  %cmp1 = icmp eq i32 %and, 0, !dbg !1532
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1533

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1534
  %shr = lshr i32 %6, 1, !dbg !1536
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1537
  br label %if.end, !dbg !1538

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1539
  %shr4 = lshr i32 %7, 1, !dbg !1541
  %add = add i32 %shr4, 1, !dbg !1542
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1543
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1544
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1546
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1547
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1548

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1549
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1551
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1552
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1552
  %div7 = udiv i32 %10, %11, !dbg !1552, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1553
  br label %return, !dbg !1553

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1554
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1556
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1557
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1557
  %div9 = udiv i32 %12, %13, !dbg !1557, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1558
  store i32 %add10, i32* %retval, align 4, !dbg !1559
  br label %return, !dbg !1559

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1560
  ret i32 %14, !dbg !1560
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1561 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1564, metadata !DIExpression()), !dbg !1565
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1566, metadata !DIExpression()), !dbg !1567
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1568, metadata !DIExpression()), !dbg !1569
  store i32 0, i32* %u32Temp1, align 4, !dbg !1569
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1570, metadata !DIExpression()), !dbg !1571
  store i32 0, i32* %u32Temp2, align 4, !dbg !1571
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1572
  %cmp = icmp sle i32 %0, 0, !dbg !1574
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1575

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1576
  %cmp1 = icmp sge i32 %1, 0, !dbg !1579
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1580

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1581
  br label %return, !dbg !1581

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1583
  %sub = sub nsw i32 0, %2, !dbg !1585
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1586
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1587
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1588
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1589
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1590
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1590
  %div = udiv i32 %4, %5, !dbg !1590, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1591
  %mul = mul i32 %div, %6, !dbg !1592
  %sub3 = sub i32 %3, %mul, !dbg !1593
  %shl = shl i32 %sub3, 1, !dbg !1594
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1595
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1596
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1597
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1598
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1598
  %div4 = udiv i32 %7, %8, !dbg !1598, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1599
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1600
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1601
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1601
  %div5 = udiv i32 %9, %10, !dbg !1601, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1602
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1603
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1604
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1606
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1607

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1608
  %sub8 = sub i32 0, %12, !dbg !1610
  store i32 %sub8, i32* %retval, align 4, !dbg !1611
  br label %return, !dbg !1611

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1612
  br label %return, !dbg !1612

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1614
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1616
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1617
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1618
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1618
  %div11 = udiv i32 %14, %15, !dbg !1618, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1619
  %mul12 = mul i32 %div11, %16, !dbg !1620
  %sub13 = sub i32 %13, %mul12, !dbg !1621
  %shl14 = shl i32 %sub13, 1, !dbg !1622
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1623
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1624
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1625
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1626
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1626
  %div15 = udiv i32 %17, %18, !dbg !1626, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1627
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1628
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1629
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1629
  %div16 = udiv i32 %19, %20, !dbg !1629, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1630
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1631
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1632
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1634
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1635

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1636
  store i32 %22, i32* %retval, align 4, !dbg !1638
  br label %return, !dbg !1638

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1639
  br label %return, !dbg !1639

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1641
  ret i32 %23, !dbg !1641
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1642 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1645, metadata !DIExpression()), !dbg !1646
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1647, metadata !DIExpression()), !dbg !1648
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1649, metadata !DIExpression()), !dbg !1650
  store i32 0, i32* %s32Temp1, align 4, !dbg !1650
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1651, metadata !DIExpression()), !dbg !1652
  store i32 0, i32* %s32Temp2, align 4, !dbg !1652
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1653, metadata !DIExpression()), !dbg !1654
  store i32 0, i32* %u32Temp0, align 4, !dbg !1654
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1655, metadata !DIExpression()), !dbg !1656
  store i32 0, i32* %u32Temp1, align 4, !dbg !1656
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1657, metadata !DIExpression()), !dbg !1658
  store i32 0, i32* %u32Temp2, align 4, !dbg !1658
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1659
  %cmp = icmp eq i32 %0, 0, !dbg !1661
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1662

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1663
  %cmp1 = icmp slt i32 %1, 0, !dbg !1666
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1667

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1668
  br label %return, !dbg !1668

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1670
  br label %return, !dbg !1670

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1672
  %cmp4 = icmp sle i32 %2, 0, !dbg !1675
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1676

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1677
  %sub = sub nsw i32 0, %3, !dbg !1679
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1680
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1681
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1682
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1683
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1683
  %div = udiv i32 %4, %5, !dbg !1683, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1684
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1685
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1686
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1687
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1688
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1688
  %div6 = udiv i32 %7, %8, !dbg !1688, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1689
  %mul = mul i32 %div6, %9, !dbg !1690
  %sub7 = sub i32 %6, %mul, !dbg !1691
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1692
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1693
  %and = and i32 %10, 1, !dbg !1695
  %cmp8 = icmp eq i32 %and, 0, !dbg !1696
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1697

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1698
  %shr = lshr i32 %11, 1, !dbg !1700
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1701
  br label %if.end, !dbg !1702

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1703
  %shr11 = lshr i32 %12, 1, !dbg !1705
  %add = add i32 %shr11, 1, !dbg !1706
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1707
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1708
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1710
  %cmp12 = icmp ult i32 %13, %14, !dbg !1711
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1712

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1713
  %neg = xor i32 %15, -1, !dbg !1715
  %add14 = add i32 %neg, 1, !dbg !1716
  store i32 %add14, i32* %retval, align 4, !dbg !1717
  br label %return, !dbg !1717

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1718
  %add16 = add i32 %16, 1, !dbg !1720
  %neg17 = xor i32 %add16, -1, !dbg !1721
  %add18 = add i32 %neg17, 1, !dbg !1722
  store i32 %add18, i32* %retval, align 4, !dbg !1723
  br label %return, !dbg !1723

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1724
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1726
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1727
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1728
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1728
  %div20 = udiv i32 %18, %19, !dbg !1728, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1729
  %mul21 = mul i32 %div20, %20, !dbg !1730
  %sub22 = sub i32 %17, %mul21, !dbg !1731
  %shl = shl i32 %sub22, 1, !dbg !1732
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1733
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1734
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1735
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1736
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1736
  %div23 = udiv i32 %21, %22, !dbg !1736, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1737
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1738
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1739
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1739
  %div24 = udiv i32 %23, %24, !dbg !1739, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1740
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1741
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1742
  store i32 %25, i32* %retval, align 4, !dbg !1743
  br label %return, !dbg !1743

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1744
  ret i32 %26, !dbg !1744
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1745 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1748, metadata !DIExpression()), !dbg !1749
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1750, metadata !DIExpression()), !dbg !1751
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1752, metadata !DIExpression()), !dbg !1753
  store i32 0, i32* %s32Temp1, align 4, !dbg !1753
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1754, metadata !DIExpression()), !dbg !1755
  store i32 0, i32* %s32Temp2, align 4, !dbg !1755
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1756, metadata !DIExpression()), !dbg !1757
  store i32 0, i32* %denominator_prime, align 4, !dbg !1757
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1758, metadata !DIExpression()), !dbg !1759
  store i32 0, i32* %u32Temp1, align 4, !dbg !1759
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1760, metadata !DIExpression()), !dbg !1761
  store i32 0, i32* %u32Temp2, align 4, !dbg !1761
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1762, metadata !DIExpression()), !dbg !1763
  store i32 0, i32* %u32numerator, align 4, !dbg !1763
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1764, metadata !DIExpression()), !dbg !1765
  store i32 0, i32* %u32denominator, align 4, !dbg !1765
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1766
  %cmp = icmp slt i32 %0, 0, !dbg !1768
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1769

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1770
  %cmp1 = icmp sle i32 %1, 0, !dbg !1773
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1774

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1775
  %cmp3 = icmp sge i32 %2, 0, !dbg !1778
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1779

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1780
  br label %return, !dbg !1780

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1782
  %sub = sub nsw i32 0, %3, !dbg !1784
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1785
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1786
  %sub5 = sub nsw i32 0, %4, !dbg !1787
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1788
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1789
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1790
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1791
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1792
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1792
  %div = udiv i32 %6, %7, !dbg !1792, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1793
  %mul = mul i32 %div, %8, !dbg !1794
  %sub6 = sub i32 %5, %mul, !dbg !1795
  %shl = shl i32 %sub6, 1, !dbg !1796
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1797
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1798
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1799
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1800
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1800
  %div7 = udiv i32 %9, %10, !dbg !1800, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1801
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1802
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1803
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1803
  %div8 = udiv i32 %11, %12, !dbg !1803, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1804
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1805
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1806
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1808
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1809

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1810
  store i32 %14, i32* %retval, align 4, !dbg !1812
  br label %return, !dbg !1812

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1813
  br label %return, !dbg !1813

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1815
  %neg = xor i32 %15, -1, !dbg !1817
  %add13 = add nsw i32 %neg, 1, !dbg !1818
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1819
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1820
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1821
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1822
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1823
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1823
  %div14 = udiv i32 %17, %18, !dbg !1823, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1824
  %mul15 = mul i32 %div14, %19, !dbg !1825
  %sub16 = sub i32 %16, %mul15, !dbg !1826
  %shl17 = shl i32 %sub16, 1, !dbg !1827
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1828
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1829
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1830
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1831
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1831
  %div18 = udiv i32 %20, %21, !dbg !1831, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1832
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1833
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1834
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1834
  %div19 = sdiv i32 %22, %23, !dbg !1834, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1835
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1836
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1837
  %neg21 = xor i32 %24, -1, !dbg !1838
  %add22 = add nsw i32 %neg21, 1, !dbg !1839
  store i32 %add22, i32* %retval, align 4, !dbg !1840
  br label %return, !dbg !1840

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1841
  %cmp24 = icmp sle i32 %25, 0, !dbg !1844
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1845

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1846
  %cmp26 = icmp sge i32 %26, 0, !dbg !1849
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1850

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1851
  br label %return, !dbg !1851

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1853
  %neg29 = xor i32 %27, -1, !dbg !1855
  %add30 = add nsw i32 %neg29, 1, !dbg !1856
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1857
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1858
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1859
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1860
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1861
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1861
  %div31 = udiv i32 %29, %30, !dbg !1861, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1862
  %mul32 = mul i32 %div31, %31, !dbg !1863
  %sub33 = sub i32 %28, %mul32, !dbg !1864
  %shl34 = shl i32 %sub33, 1, !dbg !1865
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1866
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1867
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1868
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1869
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1869
  %div35 = udiv i32 %32, %33, !dbg !1869, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1870
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1871
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1872
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1872
  %div36 = udiv i32 %34, %35, !dbg !1872, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1873
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1874
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1875
  %neg38 = xor i32 %36, -1, !dbg !1876
  %add39 = add nsw i32 %neg38, 1, !dbg !1877
  store i32 %add39, i32* %retval, align 4, !dbg !1878
  br label %return, !dbg !1878

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1879
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1881
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1882
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1883
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1883
  %div41 = sdiv i32 %38, %39, !dbg !1883, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1884
  %mul42 = mul nsw i32 %div41, %40, !dbg !1885
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1886
  %shl44 = shl i32 %sub43, 1, !dbg !1887
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1888
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1889
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1890
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1891
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1891
  %div45 = sdiv i32 %41, %42, !dbg !1891, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1892
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1893
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1894
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1894
  %div46 = udiv i32 %43, %44, !dbg !1894, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1895
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1896
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1897
  store i32 %45, i32* %retval, align 4, !dbg !1898
  br label %return, !dbg !1898

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1899
  ret i32 %46, !dbg !1899
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1900 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1903, metadata !DIExpression()), !dbg !1904
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1905, metadata !DIExpression()), !dbg !1906
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1907, metadata !DIExpression()), !dbg !1908
  store i32 0, i32* %numerator_prime, align 4, !dbg !1908
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1909, metadata !DIExpression()), !dbg !1910
  store i32 0, i32* %u32Temp1, align 4, !dbg !1910
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1911, metadata !DIExpression()), !dbg !1912
  store i32 0, i32* %u32Temp2, align 4, !dbg !1912
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1913, metadata !DIExpression()), !dbg !1914
  store i32 0, i32* %u32Temp3, align 4, !dbg !1914
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1915, metadata !DIExpression()), !dbg !1916
  store i32 0, i32* %s32Temp1, align 4, !dbg !1916
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1917, metadata !DIExpression()), !dbg !1918
  store i32 0, i32* %s32Temp2, align 4, !dbg !1918
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1919, metadata !DIExpression()), !dbg !1920
  store i32 0, i32* %s32Temp3, align 4, !dbg !1920
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1921
  %cmp = icmp eq i32 %0, 0, !dbg !1923
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1924

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1925
  %cmp1 = icmp slt i32 %1, 0, !dbg !1928
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1929

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1930
  br label %return, !dbg !1930

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1932
  br label %return, !dbg !1932

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1934
  %cmp4 = icmp slt i32 %2, 0, !dbg !1937
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1938

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1939
  %sub = sub nsw i32 0, %3, !dbg !1941
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1942
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1943
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1944
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1945
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1945
  %div = udiv i32 %4, %5, !dbg !1945, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1946
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1947
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1948
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1949
  %mul = mul i32 %7, %8, !dbg !1950
  %sub6 = sub i32 %6, %mul, !dbg !1951
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1952
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1953
  %and = and i32 %9, 1, !dbg !1955
  %cmp7 = icmp eq i32 %and, 0, !dbg !1956
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1957

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1958
  %shr = lshr i32 %10, 1, !dbg !1960
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1961
  br label %if.end, !dbg !1962

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1963
  %shr10 = lshr i32 %11, 1, !dbg !1965
  %add = add i32 %shr10, 1, !dbg !1966
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1967
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1968
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1970
  %cmp11 = icmp ult i32 %12, %13, !dbg !1971
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1972

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1973
  %neg = xor i32 %14, -1, !dbg !1975
  %add13 = add i32 %neg, 1, !dbg !1976
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1977
  br label %if.end18, !dbg !1978

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1979
  %add15 = add i32 %15, 1, !dbg !1981
  %neg16 = xor i32 %add15, -1, !dbg !1982
  %add17 = add i32 %neg16, 1, !dbg !1983
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1984
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1985
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1987
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1988

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1989
  %conv = trunc i32 %17 to i16, !dbg !1991
  store i16 %conv, i16* %retval, align 2, !dbg !1992
  br label %return, !dbg !1992

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1993
  br label %return, !dbg !1993

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1995
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1997
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1998
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1998
  %div23 = udiv i32 %18, %19, !dbg !1998, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1999
  %mul24 = mul i32 %div23, %20, !dbg !2000
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !2001
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !2002
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !2003
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !2004
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !2005
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !2005
  %div25 = udiv i32 %22, %23, !dbg !2005, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !2006
  %mul26 = mul i32 %div25, %24, !dbg !2007
  %sub27 = sub i32 %21, %mul26, !dbg !2008
  %shl = shl i32 %sub27, 1, !dbg !2009
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !2010
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !2011
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !2012
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !2013
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !2013
  %div28 = udiv i32 %25, %26, !dbg !2013, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !2014
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !2015
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !2016
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !2016
  %div29 = udiv i32 %27, %28, !dbg !2016, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !2017
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2018
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2019
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2021
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2022

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2023
  %conv34 = trunc i32 %30 to i16, !dbg !2025
  store i16 %conv34, i16* %retval, align 2, !dbg !2026
  br label %return, !dbg !2026

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2027
  br label %return, !dbg !2027

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2029
  ret i16 %31, !dbg !2029
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2030 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2036, metadata !DIExpression()), !dbg !2037
  %2 = icmp eq i64 %0, 0, !dbg !2038
  br i1 %2, label %3, label %4, !dbg !2040

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2041
  unreachable, !dbg !2041

4:                                                ; preds = %1
  ret void, !dbg !2042
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2043 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2049, metadata !DIExpression()), !dbg !2051
  call void @llvm.dbg.value(metadata i64 %1, metadata !2050, metadata !DIExpression()), !dbg !2051
  %3 = icmp ult i64 %1, %0, !dbg !2052
  br i1 %3, label %5, label %4, !dbg !2054

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2055
  unreachable, !dbg !2055

5:                                                ; preds = %2
  ret void, !dbg !2057
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0032/div_Ccode_alarm_0032.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0032")
!4 = !{}
!5 = !{!6, !13, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0032")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0032")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0032/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0032")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0032")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0032")
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
!368 = !DILocation(line: 342, column: 37, scope: !362)
!369 = !DILocation(line: 342, column: 48, scope: !362)
!370 = !DILocation(line: 342, column: 46, scope: !362)
!371 = !DILocation(line: 342, column: 27, scope: !362)
!372 = !DILocation(line: 342, column: 25, scope: !362)
!373 = !DILocation(line: 343, column: 5, scope: !362)
!374 = !DILocation(line: 365, column: 5, scope: !375)
!375 = distinct !DILexicalBlock(scope: !356, file: !69, line: 364, column: 4)
!376 = !DILocation(line: 371, column: 1, scope: !186)
!377 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !378, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!378 = !DISubroutineType(types: !379)
!379 = !{!19, !13}
!380 = !DILocalVariable(name: "denominator", arg: 1, scope: !377, file: !33, line: 24, type: !13)
!381 = !DILocation(line: 24, column: 40, scope: !377)
!382 = !DILocation(line: 26, column: 12, scope: !377)
!383 = !DILocation(line: 26, column: 24, scope: !377)
!384 = !DILocation(line: 26, column: 5, scope: !377)
!385 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !378, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!386 = !DILocalVariable(name: "left", arg: 1, scope: !385, file: !33, line: 84, type: !13)
!387 = !DILocation(line: 84, column: 51, scope: !385)
!388 = !DILocation(line: 86, column: 12, scope: !385)
!389 = !DILocation(line: 86, column: 17, scope: !385)
!390 = !DILocation(line: 86, column: 5, scope: !385)
!391 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !392, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!392 = !DISubroutineType(types: !393)
!393 = !{!19, !13, !20}
!394 = !DILocalVariable(name: "left", arg: 1, scope: !391, file: !33, line: 90, type: !13)
!395 = !DILocation(line: 90, column: 41, scope: !391)
!396 = !DILocalVariable(name: "count", arg: 2, scope: !391, file: !33, line: 90, type: !20)
!397 = !DILocation(line: 90, column: 56, scope: !391)
!398 = !DILocation(line: 92, column: 9, scope: !399)
!399 = distinct !DILexicalBlock(scope: !391, file: !33, line: 92, column: 9)
!400 = !DILocation(line: 92, column: 15, scope: !399)
!401 = !DILocation(line: 92, column: 9, scope: !391)
!402 = !DILocation(line: 93, column: 9, scope: !403)
!403 = distinct !DILexicalBlock(scope: !399, file: !33, line: 92, column: 32)
!404 = !DILocation(line: 95, column: 12, scope: !391)
!405 = !DILocation(line: 95, column: 34, scope: !391)
!406 = !DILocation(line: 95, column: 31, scope: !391)
!407 = !DILocation(line: 95, column: 17, scope: !391)
!408 = !DILocation(line: 95, column: 41, scope: !391)
!409 = !DILocation(line: 95, column: 5, scope: !391)
!410 = !DILocation(line: 96, column: 1, scope: !391)
!411 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !412, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!412 = !DISubroutineType(types: !413)
!413 = !{!19, !13, !13}
!414 = !DILocalVariable(name: "left", arg: 1, scope: !411, file: !33, line: 78, type: !13)
!415 = !DILocation(line: 78, column: 38, scope: !411)
!416 = !DILocalVariable(name: "right", arg: 2, scope: !411, file: !33, line: 78, type: !13)
!417 = !DILocation(line: 78, column: 52, scope: !411)
!418 = !DILocation(line: 80, column: 12, scope: !411)
!419 = !DILocation(line: 80, column: 19, scope: !411)
!420 = !DILocation(line: 80, column: 17, scope: !411)
!421 = !DILocation(line: 80, column: 25, scope: !411)
!422 = !DILocation(line: 80, column: 5, scope: !411)
!423 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !33, file: !33, line: 72, type: !412, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!424 = !DILocalVariable(name: "left", arg: 1, scope: !423, file: !33, line: 72, type: !13)
!425 = !DILocation(line: 72, column: 38, scope: !423)
!426 = !DILocalVariable(name: "right", arg: 2, scope: !423, file: !33, line: 72, type: !13)
!427 = !DILocation(line: 72, column: 52, scope: !423)
!428 = !DILocation(line: 74, column: 12, scope: !423)
!429 = !DILocation(line: 74, column: 19, scope: !423)
!430 = !DILocation(line: 74, column: 17, scope: !423)
!431 = !DILocation(line: 74, column: 25, scope: !423)
!432 = !DILocation(line: 74, column: 5, scope: !423)
!433 = distinct !DISubprogram(name: "klee_alarm_s32_add_lower", scope: !33, file: !33, line: 48, type: !412, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!434 = !DILocalVariable(name: "left", arg: 1, scope: !433, file: !33, line: 48, type: !13)
!435 = !DILocation(line: 48, column: 38, scope: !433)
!436 = !DILocalVariable(name: "right", arg: 2, scope: !433, file: !33, line: 48, type: !13)
!437 = !DILocation(line: 48, column: 52, scope: !433)
!438 = !DILocation(line: 50, column: 12, scope: !433)
!439 = !DILocation(line: 50, column: 19, scope: !433)
!440 = !DILocation(line: 50, column: 17, scope: !433)
!441 = !DILocation(line: 50, column: 25, scope: !433)
!442 = !DILocation(line: 50, column: 5, scope: !433)
!443 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !412, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!444 = !DILocalVariable(name: "left", arg: 1, scope: !443, file: !33, line: 54, type: !13)
!445 = !DILocation(line: 54, column: 38, scope: !443)
!446 = !DILocalVariable(name: "right", arg: 2, scope: !443, file: !33, line: 54, type: !13)
!447 = !DILocation(line: 54, column: 52, scope: !443)
!448 = !DILocation(line: 56, column: 12, scope: !443)
!449 = !DILocation(line: 56, column: 19, scope: !443)
!450 = !DILocation(line: 56, column: 17, scope: !443)
!451 = !DILocation(line: 56, column: 25, scope: !443)
!452 = !DILocation(line: 56, column: 5, scope: !443)
!453 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 389, type: !454, scopeLine: 390, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!454 = !DISubroutineType(types: !455)
!455 = !{!6, !6, !28}
!456 = !DILocalVariable(name: "numerator", arg: 1, scope: !453, file: !69, line: 389, type: !6)
!457 = !DILocation(line: 389, column: 31, scope: !453)
!458 = !DILocalVariable(name: "denominator", arg: 2, scope: !453, file: !69, line: 389, type: !28)
!459 = !DILocation(line: 389, column: 47, scope: !453)
!460 = !DILocalVariable(name: "u16Temp1", scope: !453, file: !69, line: 391, type: !28)
!461 = !DILocation(line: 391, column: 6, scope: !453)
!462 = !DILocalVariable(name: "s32Temp1", scope: !453, file: !69, line: 392, type: !16)
!463 = !DILocation(line: 392, column: 6, scope: !453)
!464 = !DILocalVariable(name: "s32Temp2", scope: !453, file: !69, line: 392, type: !16)
!465 = !DILocation(line: 392, column: 15, scope: !453)
!466 = !DILocation(line: 393, column: 13, scope: !453)
!467 = !DILocation(line: 393, column: 25, scope: !453)
!468 = !DILocation(line: 393, column: 11, scope: !453)
!469 = !DILocation(line: 394, column: 13, scope: !453)
!470 = !DILocation(line: 394, column: 22, scope: !453)
!471 = !DILocation(line: 394, column: 11, scope: !453)
!472 = !DILocation(line: 395, column: 5, scope: !473)
!473 = distinct !DILexicalBlock(scope: !453, file: !69, line: 395, column: 5)
!474 = !DILocation(line: 395, column: 14, scope: !473)
!475 = !DILocation(line: 395, column: 5, scope: !453)
!476 = !DILocation(line: 397, column: 7, scope: !477)
!477 = distinct !DILexicalBlock(scope: !478, file: !69, line: 397, column: 7)
!478 = distinct !DILexicalBlock(scope: !473, file: !69, line: 396, column: 2)
!479 = !DILocation(line: 397, column: 17, scope: !477)
!480 = !DILocation(line: 397, column: 7, scope: !478)
!481 = !DILocation(line: 399, column: 4, scope: !482)
!482 = distinct !DILexicalBlock(scope: !477, file: !69, line: 398, column: 3)
!483 = !DILocation(line: 403, column: 4, scope: !484)
!484 = distinct !DILexicalBlock(scope: !477, file: !69, line: 402, column: 3)
!485 = !DILocation(line: 408, column: 15, scope: !486)
!486 = distinct !DILexicalBlock(scope: !473, file: !69, line: 407, column: 2)
!487 = !DILocation(line: 408, column: 24, scope: !486)
!488 = !DILocation(line: 408, column: 32, scope: !486)
!489 = !DILocation(line: 408, column: 41, scope: !486)
!490 = !DILocation(line: 408, column: 47, scope: !486)
!491 = !DILocation(line: 408, column: 46, scope: !486)
!492 = !DILocation(line: 408, column: 57, scope: !486)
!493 = !DILocation(line: 408, column: 56, scope: !486)
!494 = !DILocation(line: 408, column: 29, scope: !486)
!495 = !DILocation(line: 408, column: 12, scope: !486)
!496 = !DILocation(line: 409, column: 14, scope: !486)
!497 = !DILocation(line: 409, column: 22, scope: !486)
!498 = !DILocation(line: 409, column: 12, scope: !486)
!499 = !DILocation(line: 410, column: 14, scope: !486)
!500 = !DILocation(line: 410, column: 23, scope: !486)
!501 = !DILocation(line: 410, column: 22, scope: !486)
!502 = !DILocation(line: 410, column: 12, scope: !486)
!503 = !DILocation(line: 411, column: 16, scope: !486)
!504 = !DILocation(line: 411, column: 25, scope: !486)
!505 = !DILocation(line: 411, column: 31, scope: !486)
!506 = !DILocation(line: 411, column: 30, scope: !486)
!507 = !DILocation(line: 411, column: 43, scope: !486)
!508 = !DILocation(line: 411, column: 41, scope: !486)
!509 = !DILocation(line: 411, column: 12, scope: !486)
!510 = !DILocation(line: 412, column: 6, scope: !511)
!511 = distinct !DILexicalBlock(scope: !486, file: !69, line: 412, column: 6)
!512 = !DILocation(line: 412, column: 15, scope: !511)
!513 = !DILocation(line: 412, column: 6, scope: !486)
!514 = !DILocation(line: 414, column: 7, scope: !515)
!515 = distinct !DILexicalBlock(scope: !516, file: !69, line: 414, column: 7)
!516 = distinct !DILexicalBlock(scope: !511, file: !69, line: 413, column: 3)
!517 = !DILocation(line: 414, column: 16, scope: !515)
!518 = !DILocation(line: 414, column: 7, scope: !516)
!519 = !DILocation(line: 416, column: 17, scope: !520)
!520 = distinct !DILexicalBlock(scope: !515, file: !69, line: 415, column: 4)
!521 = !DILocation(line: 416, column: 12, scope: !520)
!522 = !DILocation(line: 416, column: 5, scope: !520)
!523 = !DILocation(line: 420, column: 5, scope: !524)
!524 = distinct !DILexicalBlock(scope: !515, file: !69, line: 419, column: 4)
!525 = !DILocation(line: 425, column: 4, scope: !526)
!526 = distinct !DILexicalBlock(scope: !511, file: !69, line: 424, column: 3)
!527 = !DILocation(line: 428, column: 1, scope: !453)
!528 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 445, type: !454, scopeLine: 446, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!529 = !DILocalVariable(name: "numerator", arg: 1, scope: !528, file: !69, line: 445, type: !6)
!530 = !DILocation(line: 445, column: 30, scope: !528)
!531 = !DILocalVariable(name: "denominator", arg: 2, scope: !528, file: !69, line: 445, type: !28)
!532 = !DILocation(line: 445, column: 45, scope: !528)
!533 = !DILocalVariable(name: "u16Temp1", scope: !528, file: !69, line: 447, type: !28)
!534 = !DILocation(line: 447, column: 6, scope: !528)
!535 = !DILocalVariable(name: "s32Temp1", scope: !528, file: !69, line: 448, type: !16)
!536 = !DILocation(line: 448, column: 6, scope: !528)
!537 = !DILocation(line: 449, column: 13, scope: !528)
!538 = !DILocation(line: 449, column: 25, scope: !528)
!539 = !DILocation(line: 449, column: 11, scope: !528)
!540 = !DILocation(line: 450, column: 5, scope: !541)
!541 = distinct !DILexicalBlock(scope: !528, file: !69, line: 450, column: 5)
!542 = !DILocation(line: 450, column: 13, scope: !541)
!543 = !DILocation(line: 450, column: 5, scope: !528)
!544 = !DILocation(line: 452, column: 6, scope: !545)
!545 = distinct !DILexicalBlock(scope: !546, file: !69, line: 452, column: 6)
!546 = distinct !DILexicalBlock(scope: !541, file: !69, line: 451, column: 2)
!547 = !DILocation(line: 452, column: 15, scope: !545)
!548 = !DILocation(line: 452, column: 6, scope: !546)
!549 = !DILocation(line: 454, column: 4, scope: !550)
!550 = distinct !DILexicalBlock(scope: !545, file: !69, line: 453, column: 3)
!551 = !DILocation(line: 458, column: 4, scope: !552)
!552 = distinct !DILexicalBlock(scope: !545, file: !69, line: 457, column: 3)
!553 = !DILocation(line: 464, column: 15, scope: !554)
!554 = distinct !DILexicalBlock(scope: !541, file: !69, line: 463, column: 2)
!555 = !DILocation(line: 464, column: 27, scope: !554)
!556 = !DILocation(line: 464, column: 37, scope: !554)
!557 = !DILocation(line: 464, column: 36, scope: !554)
!558 = !DILocation(line: 464, column: 49, scope: !554)
!559 = !DILocation(line: 464, column: 47, scope: !554)
!560 = !DILocation(line: 464, column: 25, scope: !554)
!561 = !DILocation(line: 464, column: 59, scope: !554)
!562 = !DILocation(line: 464, column: 12, scope: !554)
!563 = !DILocation(line: 465, column: 15, scope: !554)
!564 = !DILocation(line: 465, column: 24, scope: !554)
!565 = !DILocation(line: 465, column: 23, scope: !554)
!566 = !DILocation(line: 465, column: 37, scope: !554)
!567 = !DILocation(line: 465, column: 47, scope: !554)
!568 = !DILocation(line: 465, column: 46, scope: !554)
!569 = !DILocation(line: 465, column: 34, scope: !554)
!570 = !DILocation(line: 465, column: 12, scope: !554)
!571 = !DILocation(line: 466, column: 10, scope: !554)
!572 = !DILocation(line: 466, column: 3, scope: !554)
!573 = !DILocation(line: 468, column: 1, scope: !528)
!574 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 486, type: !575, scopeLine: 487, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!575 = !DISubroutineType(types: !576)
!576 = !{!24, !28, !28}
!577 = !DILocalVariable(name: "numerator", arg: 1, scope: !574, file: !69, line: 486, type: !28)
!578 = !DILocation(line: 486, column: 28, scope: !574)
!579 = !DILocalVariable(name: "denominator", arg: 2, scope: !574, file: !69, line: 486, type: !28)
!580 = !DILocation(line: 486, column: 43, scope: !574)
!581 = !DILocalVariable(name: "u32Temp1", scope: !574, file: !69, line: 488, type: !582)
!582 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !20)
!583 = !DILocation(line: 488, column: 6, scope: !574)
!584 = !DILocalVariable(name: "u32Temp2", scope: !574, file: !69, line: 488, type: !582)
!585 = !DILocation(line: 488, column: 20, scope: !574)
!586 = !DILocalVariable(name: "u32Temp3", scope: !574, file: !69, line: 488, type: !582)
!587 = !DILocation(line: 488, column: 33, scope: !574)
!588 = !DILocation(line: 489, column: 5, scope: !589)
!589 = distinct !DILexicalBlock(scope: !574, file: !69, line: 489, column: 5)
!590 = !DILocation(line: 489, column: 16, scope: !589)
!591 = !DILocation(line: 489, column: 5, scope: !574)
!592 = !DILocation(line: 491, column: 3, scope: !593)
!593 = distinct !DILexicalBlock(scope: !589, file: !69, line: 490, column: 2)
!594 = !DILocation(line: 495, column: 15, scope: !595)
!595 = distinct !DILexicalBlock(scope: !589, file: !69, line: 494, column: 2)
!596 = !DILocation(line: 495, column: 24, scope: !595)
!597 = !DILocation(line: 495, column: 12, scope: !595)
!598 = !DILocation(line: 496, column: 14, scope: !595)
!599 = !DILocation(line: 496, column: 25, scope: !595)
!600 = !DILocation(line: 496, column: 23, scope: !595)
!601 = !DILocation(line: 496, column: 12, scope: !595)
!602 = !DILocation(line: 497, column: 15, scope: !595)
!603 = !DILocation(line: 497, column: 24, scope: !595)
!604 = !DILocation(line: 497, column: 32, scope: !595)
!605 = !DILocation(line: 497, column: 12, scope: !595)
!606 = !DILocation(line: 498, column: 6, scope: !607)
!607 = distinct !DILexicalBlock(scope: !595, file: !69, line: 498, column: 6)
!608 = !DILocation(line: 498, column: 15, scope: !607)
!609 = !DILocation(line: 498, column: 6, scope: !595)
!610 = !DILocation(line: 500, column: 15, scope: !611)
!611 = distinct !DILexicalBlock(scope: !607, file: !69, line: 499, column: 3)
!612 = !DILocation(line: 500, column: 11, scope: !611)
!613 = !DILocation(line: 500, column: 4, scope: !611)
!614 = !DILocation(line: 504, column: 4, scope: !615)
!615 = distinct !DILexicalBlock(scope: !607, file: !69, line: 503, column: 3)
!616 = !DILocation(line: 507, column: 1, scope: !574)
!617 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 524, type: !618, scopeLine: 525, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!618 = !DISubroutineType(types: !619)
!619 = !{!28, !16, !28}
!620 = !DILocalVariable(name: "x_value", arg: 1, scope: !617, file: !69, line: 524, type: !16)
!621 = !DILocation(line: 524, column: 25, scope: !617)
!622 = !DILocalVariable(name: "y_value", arg: 2, scope: !617, file: !69, line: 524, type: !28)
!623 = !DILocation(line: 524, column: 38, scope: !617)
!624 = !DILocalVariable(name: "s32Temp1", scope: !617, file: !69, line: 526, type: !16)
!625 = !DILocation(line: 526, column: 6, scope: !617)
!626 = !DILocation(line: 527, column: 12, scope: !617)
!627 = !DILocation(line: 527, column: 20, scope: !617)
!628 = !DILocation(line: 527, column: 10, scope: !617)
!629 = !DILocation(line: 528, column: 6, scope: !630)
!630 = distinct !DILexicalBlock(scope: !617, file: !69, line: 528, column: 5)
!631 = !DILocation(line: 528, column: 14, scope: !630)
!632 = !DILocation(line: 528, column: 24, scope: !630)
!633 = !DILocation(line: 528, column: 5, scope: !617)
!634 = !DILocation(line: 530, column: 6, scope: !635)
!635 = distinct !DILexicalBlock(scope: !636, file: !69, line: 530, column: 6)
!636 = distinct !DILexicalBlock(scope: !630, file: !69, line: 529, column: 2)
!637 = !DILocation(line: 530, column: 14, scope: !635)
!638 = !DILocation(line: 530, column: 6, scope: !636)
!639 = !DILocation(line: 532, column: 4, scope: !640)
!640 = distinct !DILexicalBlock(scope: !635, file: !69, line: 531, column: 3)
!641 = !DILocation(line: 536, column: 4, scope: !642)
!642 = distinct !DILexicalBlock(scope: !635, file: !69, line: 535, column: 3)
!643 = !DILocation(line: 541, column: 15, scope: !644)
!644 = distinct !DILexicalBlock(scope: !630, file: !69, line: 540, column: 2)
!645 = !DILocation(line: 541, column: 27, scope: !644)
!646 = !DILocation(line: 541, column: 35, scope: !644)
!647 = !DILocation(line: 541, column: 34, scope: !644)
!648 = !DILocation(line: 541, column: 46, scope: !644)
!649 = !DILocation(line: 541, column: 44, scope: !644)
!650 = !DILocation(line: 541, column: 23, scope: !644)
!651 = !DILocation(line: 541, column: 56, scope: !644)
!652 = !DILocation(line: 541, column: 12, scope: !644)
!653 = !DILocation(line: 542, column: 15, scope: !644)
!654 = !DILocation(line: 542, column: 24, scope: !644)
!655 = !DILocation(line: 542, column: 23, scope: !644)
!656 = !DILocation(line: 542, column: 36, scope: !644)
!657 = !DILocation(line: 542, column: 44, scope: !644)
!658 = !DILocation(line: 542, column: 43, scope: !644)
!659 = !DILocation(line: 542, column: 33, scope: !644)
!660 = !DILocation(line: 542, column: 12, scope: !644)
!661 = !DILocation(line: 543, column: 6, scope: !662)
!662 = distinct !DILexicalBlock(scope: !644, file: !69, line: 543, column: 6)
!663 = !DILocation(line: 543, column: 15, scope: !662)
!664 = !DILocation(line: 543, column: 6, scope: !644)
!665 = !DILocation(line: 545, column: 7, scope: !666)
!666 = distinct !DILexicalBlock(scope: !667, file: !69, line: 545, column: 7)
!667 = distinct !DILexicalBlock(scope: !662, file: !69, line: 544, column: 3)
!668 = !DILocation(line: 545, column: 16, scope: !666)
!669 = !DILocation(line: 545, column: 7, scope: !667)
!670 = !DILocation(line: 547, column: 17, scope: !671)
!671 = distinct !DILexicalBlock(scope: !666, file: !69, line: 546, column: 4)
!672 = !DILocation(line: 547, column: 12, scope: !671)
!673 = !DILocation(line: 547, column: 5, scope: !671)
!674 = !DILocation(line: 551, column: 5, scope: !675)
!675 = distinct !DILexicalBlock(scope: !666, file: !69, line: 550, column: 4)
!676 = !DILocation(line: 556, column: 4, scope: !677)
!677 = distinct !DILexicalBlock(scope: !662, file: !69, line: 555, column: 3)
!678 = !DILocation(line: 559, column: 1, scope: !617)
!679 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 577, type: !680, scopeLine: 578, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!680 = !DISubroutineType(types: !681)
!681 = !{!28, !28, !28}
!682 = !DILocalVariable(name: "numerator", arg: 1, scope: !679, file: !69, line: 577, type: !28)
!683 = !DILocation(line: 577, column: 31, scope: !679)
!684 = !DILocalVariable(name: "denominator", arg: 2, scope: !679, file: !69, line: 577, type: !28)
!685 = !DILocation(line: 577, column: 46, scope: !679)
!686 = !DILocalVariable(name: "u32Temp", scope: !679, file: !69, line: 579, type: !582)
!687 = !DILocation(line: 579, column: 6, scope: !679)
!688 = !DILocation(line: 580, column: 5, scope: !689)
!689 = distinct !DILexicalBlock(scope: !679, file: !69, line: 580, column: 5)
!690 = !DILocation(line: 580, column: 17, scope: !689)
!691 = !DILocation(line: 580, column: 5, scope: !679)
!692 = !DILocation(line: 582, column: 3, scope: !693)
!693 = distinct !DILexicalBlock(scope: !689, file: !69, line: 581, column: 2)
!694 = !DILocation(line: 586, column: 14, scope: !695)
!695 = distinct !DILexicalBlock(scope: !689, file: !69, line: 585, column: 2)
!696 = !DILocation(line: 586, column: 23, scope: !695)
!697 = !DILocation(line: 586, column: 32, scope: !695)
!698 = !DILocation(line: 586, column: 44, scope: !695)
!699 = !DILocation(line: 586, column: 29, scope: !695)
!700 = !DILocation(line: 586, column: 11, scope: !695)
!701 = !DILocation(line: 587, column: 13, scope: !695)
!702 = !DILocation(line: 587, column: 21, scope: !695)
!703 = !DILocation(line: 587, column: 20, scope: !695)
!704 = !DILocation(line: 587, column: 11, scope: !695)
!705 = !DILocation(line: 588, column: 6, scope: !706)
!706 = distinct !DILexicalBlock(scope: !695, file: !69, line: 588, column: 6)
!707 = !DILocation(line: 588, column: 14, scope: !706)
!708 = !DILocation(line: 588, column: 6, scope: !695)
!709 = !DILocation(line: 590, column: 11, scope: !710)
!710 = distinct !DILexicalBlock(scope: !706, file: !69, line: 589, column: 3)
!711 = !DILocation(line: 590, column: 19, scope: !710)
!712 = !DILocation(line: 590, column: 4, scope: !710)
!713 = !DILocation(line: 594, column: 4, scope: !714)
!714 = distinct !DILexicalBlock(scope: !706, file: !69, line: 593, column: 3)
!715 = !DILocation(line: 598, column: 1, scope: !679)
!716 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 615, type: !717, scopeLine: 616, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!717 = !DISubroutineType(types: !718)
!718 = !{!28, !582, !28}
!719 = !DILocalVariable(name: "x_value", arg: 1, scope: !716, file: !69, line: 615, type: !582)
!720 = !DILocation(line: 615, column: 25, scope: !716)
!721 = !DILocalVariable(name: "y_value", arg: 2, scope: !716, file: !69, line: 615, type: !28)
!722 = !DILocation(line: 615, column: 38, scope: !716)
!723 = !DILocalVariable(name: "u32Temp1", scope: !716, file: !69, line: 617, type: !582)
!724 = !DILocation(line: 617, column: 6, scope: !716)
!725 = !DILocalVariable(name: "u32Temp2", scope: !716, file: !69, line: 617, type: !582)
!726 = !DILocation(line: 617, column: 17, scope: !716)
!727 = !DILocation(line: 618, column: 12, scope: !716)
!728 = !DILocation(line: 618, column: 20, scope: !716)
!729 = !DILocation(line: 618, column: 10, scope: !716)
!730 = !DILocation(line: 619, column: 5, scope: !731)
!731 = distinct !DILexicalBlock(scope: !716, file: !69, line: 619, column: 5)
!732 = !DILocation(line: 619, column: 13, scope: !731)
!733 = !DILocation(line: 619, column: 5, scope: !716)
!734 = !DILocation(line: 621, column: 3, scope: !735)
!735 = distinct !DILexicalBlock(scope: !731, file: !69, line: 620, column: 2)
!736 = !DILocation(line: 625, column: 14, scope: !737)
!737 = distinct !DILexicalBlock(scope: !731, file: !69, line: 624, column: 2)
!738 = !DILocation(line: 625, column: 22, scope: !737)
!739 = !DILocation(line: 625, column: 21, scope: !737)
!740 = !DILocation(line: 625, column: 12, scope: !737)
!741 = !DILocation(line: 626, column: 14, scope: !737)
!742 = !DILocation(line: 626, column: 25, scope: !737)
!743 = !DILocation(line: 626, column: 36, scope: !737)
!744 = !DILocation(line: 626, column: 34, scope: !737)
!745 = !DILocation(line: 626, column: 22, scope: !737)
!746 = !DILocation(line: 626, column: 45, scope: !737)
!747 = !DILocation(line: 626, column: 12, scope: !737)
!748 = !DILocation(line: 627, column: 15, scope: !737)
!749 = !DILocation(line: 627, column: 24, scope: !737)
!750 = !DILocation(line: 627, column: 23, scope: !737)
!751 = !DILocation(line: 627, column: 36, scope: !737)
!752 = !DILocation(line: 627, column: 44, scope: !737)
!753 = !DILocation(line: 627, column: 43, scope: !737)
!754 = !DILocation(line: 627, column: 33, scope: !737)
!755 = !DILocation(line: 627, column: 12, scope: !737)
!756 = !DILocation(line: 628, column: 6, scope: !757)
!757 = distinct !DILexicalBlock(scope: !737, file: !69, line: 628, column: 6)
!758 = !DILocation(line: 628, column: 15, scope: !757)
!759 = !DILocation(line: 628, column: 6, scope: !737)
!760 = !DILocation(line: 630, column: 11, scope: !761)
!761 = distinct !DILexicalBlock(scope: !757, file: !69, line: 629, column: 3)
!762 = !DILocation(line: 630, column: 20, scope: !761)
!763 = !DILocation(line: 630, column: 4, scope: !761)
!764 = !DILocation(line: 634, column: 4, scope: !765)
!765 = distinct !DILexicalBlock(scope: !757, file: !69, line: 633, column: 3)
!766 = !DILocation(line: 638, column: 1, scope: !716)
!767 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 657, type: !768, scopeLine: 658, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!768 = !DISubroutineType(types: !769)
!769 = !{!6, !6, !28, !6}
!770 = !DILocalVariable(name: "factor1", arg: 1, scope: !767, file: !69, line: 657, type: !6)
!771 = !DILocation(line: 657, column: 33, scope: !767)
!772 = !DILocalVariable(name: "factor2", arg: 2, scope: !767, file: !69, line: 657, type: !28)
!773 = !DILocation(line: 657, column: 46, scope: !767)
!774 = !DILocalVariable(name: "denominator", arg: 3, scope: !767, file: !69, line: 657, type: !6)
!775 = !DILocation(line: 657, column: 59, scope: !767)
!776 = !DILocalVariable(name: "s32Result", scope: !767, file: !69, line: 659, type: !16)
!777 = !DILocation(line: 659, column: 6, scope: !767)
!778 = !DILocalVariable(name: "s32Temp1", scope: !767, file: !69, line: 659, type: !16)
!779 = !DILocation(line: 659, column: 21, scope: !767)
!780 = !DILocation(line: 660, column: 14, scope: !767)
!781 = !DILocation(line: 660, column: 24, scope: !767)
!782 = !DILocation(line: 660, column: 22, scope: !767)
!783 = !DILocation(line: 660, column: 12, scope: !767)
!784 = !DILocation(line: 661, column: 5, scope: !785)
!785 = distinct !DILexicalBlock(scope: !767, file: !69, line: 661, column: 5)
!786 = !DILocation(line: 661, column: 17, scope: !785)
!787 = !DILocation(line: 661, column: 5, scope: !767)
!788 = !DILocation(line: 663, column: 6, scope: !789)
!789 = distinct !DILexicalBlock(scope: !790, file: !69, line: 663, column: 6)
!790 = distinct !DILexicalBlock(scope: !785, file: !69, line: 662, column: 2)
!791 = !DILocation(line: 663, column: 16, scope: !789)
!792 = !DILocation(line: 663, column: 6, scope: !790)
!793 = !DILocation(line: 665, column: 4, scope: !794)
!794 = distinct !DILexicalBlock(scope: !789, file: !69, line: 664, column: 3)
!795 = !DILocation(line: 669, column: 4, scope: !796)
!796 = distinct !DILexicalBlock(scope: !789, file: !69, line: 668, column: 3)
!797 = !DILocation(line: 674, column: 14, scope: !798)
!798 = distinct !DILexicalBlock(scope: !785, file: !69, line: 673, column: 2)
!799 = !DILocation(line: 674, column: 27, scope: !798)
!800 = !DILocation(line: 674, column: 37, scope: !798)
!801 = !DILocation(line: 674, column: 36, scope: !798)
!802 = !DILocation(line: 674, column: 50, scope: !798)
!803 = !DILocation(line: 674, column: 49, scope: !798)
!804 = !DILocation(line: 674, column: 24, scope: !798)
!805 = !DILocation(line: 674, column: 12, scope: !798)
!806 = !DILocation(line: 675, column: 14, scope: !798)
!807 = !DILocation(line: 675, column: 23, scope: !798)
!808 = !DILocation(line: 675, column: 12, scope: !798)
!809 = !DILocation(line: 676, column: 16, scope: !798)
!810 = !DILocation(line: 676, column: 25, scope: !798)
!811 = !DILocation(line: 676, column: 24, scope: !798)
!812 = !DILocation(line: 676, column: 41, scope: !798)
!813 = !DILocation(line: 676, column: 51, scope: !798)
!814 = !DILocation(line: 676, column: 50, scope: !798)
!815 = !DILocation(line: 676, column: 38, scope: !798)
!816 = !DILocation(line: 676, column: 13, scope: !798)
!817 = !DILocation(line: 677, column: 6, scope: !818)
!818 = distinct !DILexicalBlock(scope: !798, file: !69, line: 677, column: 6)
!819 = !DILocation(line: 677, column: 16, scope: !818)
!820 = !DILocation(line: 677, column: 6, scope: !798)
!821 = !DILocation(line: 679, column: 7, scope: !822)
!822 = distinct !DILexicalBlock(scope: !823, file: !69, line: 679, column: 7)
!823 = distinct !DILexicalBlock(scope: !818, file: !69, line: 678, column: 3)
!824 = !DILocation(line: 679, column: 17, scope: !822)
!825 = !DILocation(line: 679, column: 7, scope: !823)
!826 = !DILocation(line: 681, column: 17, scope: !827)
!827 = distinct !DILexicalBlock(scope: !822, file: !69, line: 680, column: 4)
!828 = !DILocation(line: 681, column: 12, scope: !827)
!829 = !DILocation(line: 681, column: 5, scope: !827)
!830 = !DILocation(line: 686, column: 5, scope: !831)
!831 = distinct !DILexicalBlock(scope: !822, file: !69, line: 685, column: 4)
!832 = !DILocation(line: 691, column: 4, scope: !833)
!833 = distinct !DILexicalBlock(scope: !818, file: !69, line: 690, column: 3)
!834 = !DILocation(line: 695, column: 1, scope: !767)
!835 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 713, type: !836, scopeLine: 714, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!836 = !DISubroutineType(types: !837)
!837 = !{!6, !28, !6, !28}
!838 = !DILocalVariable(name: "factor1", arg: 1, scope: !835, file: !69, line: 713, type: !28)
!839 = !DILocation(line: 713, column: 33, scope: !835)
!840 = !DILocalVariable(name: "factor2", arg: 2, scope: !835, file: !69, line: 713, type: !6)
!841 = !DILocation(line: 713, column: 46, scope: !835)
!842 = !DILocalVariable(name: "denominator", arg: 3, scope: !835, file: !69, line: 713, type: !28)
!843 = !DILocation(line: 713, column: 59, scope: !835)
!844 = !DILocalVariable(name: "s32Result", scope: !835, file: !69, line: 715, type: !16)
!845 = !DILocation(line: 715, column: 6, scope: !835)
!846 = !DILocalVariable(name: "s32Temp1", scope: !835, file: !69, line: 715, type: !16)
!847 = !DILocation(line: 715, column: 21, scope: !835)
!848 = !DILocation(line: 716, column: 14, scope: !835)
!849 = !DILocation(line: 716, column: 24, scope: !835)
!850 = !DILocation(line: 716, column: 22, scope: !835)
!851 = !DILocation(line: 716, column: 12, scope: !835)
!852 = !DILocation(line: 717, column: 5, scope: !853)
!853 = distinct !DILexicalBlock(scope: !835, file: !69, line: 717, column: 5)
!854 = !DILocation(line: 717, column: 16, scope: !853)
!855 = !DILocation(line: 717, column: 5, scope: !835)
!856 = !DILocation(line: 719, column: 6, scope: !857)
!857 = distinct !DILexicalBlock(scope: !858, file: !69, line: 719, column: 6)
!858 = distinct !DILexicalBlock(scope: !853, file: !69, line: 718, column: 2)
!859 = !DILocation(line: 719, column: 16, scope: !857)
!860 = !DILocation(line: 719, column: 6, scope: !858)
!861 = !DILocation(line: 721, column: 4, scope: !862)
!862 = distinct !DILexicalBlock(scope: !857, file: !69, line: 720, column: 3)
!863 = !DILocation(line: 725, column: 4, scope: !864)
!864 = distinct !DILexicalBlock(scope: !857, file: !69, line: 724, column: 3)
!865 = !DILocation(line: 730, column: 14, scope: !866)
!866 = distinct !DILexicalBlock(scope: !853, file: !69, line: 729, column: 2)
!867 = !DILocation(line: 730, column: 28, scope: !866)
!868 = !DILocation(line: 730, column: 38, scope: !866)
!869 = !DILocation(line: 730, column: 37, scope: !866)
!870 = !DILocation(line: 730, column: 53, scope: !866)
!871 = !DILocation(line: 730, column: 51, scope: !866)
!872 = !DILocation(line: 730, column: 24, scope: !866)
!873 = !DILocation(line: 730, column: 66, scope: !866)
!874 = !DILocation(line: 730, column: 12, scope: !866)
!875 = !DILocation(line: 731, column: 16, scope: !866)
!876 = !DILocation(line: 731, column: 25, scope: !866)
!877 = !DILocation(line: 731, column: 24, scope: !866)
!878 = !DILocation(line: 731, column: 41, scope: !866)
!879 = !DILocation(line: 731, column: 51, scope: !866)
!880 = !DILocation(line: 731, column: 50, scope: !866)
!881 = !DILocation(line: 731, column: 38, scope: !866)
!882 = !DILocation(line: 731, column: 13, scope: !866)
!883 = !DILocation(line: 732, column: 6, scope: !884)
!884 = distinct !DILexicalBlock(scope: !866, file: !69, line: 732, column: 6)
!885 = !DILocation(line: 732, column: 16, scope: !884)
!886 = !DILocation(line: 732, column: 6, scope: !866)
!887 = !DILocation(line: 734, column: 7, scope: !888)
!888 = distinct !DILexicalBlock(scope: !889, file: !69, line: 734, column: 7)
!889 = distinct !DILexicalBlock(scope: !884, file: !69, line: 733, column: 3)
!890 = !DILocation(line: 734, column: 17, scope: !888)
!891 = !DILocation(line: 734, column: 7, scope: !889)
!892 = !DILocation(line: 736, column: 17, scope: !893)
!893 = distinct !DILexicalBlock(scope: !888, file: !69, line: 735, column: 4)
!894 = !DILocation(line: 736, column: 12, scope: !893)
!895 = !DILocation(line: 736, column: 5, scope: !893)
!896 = !DILocation(line: 740, column: 5, scope: !897)
!897 = distinct !DILexicalBlock(scope: !888, file: !69, line: 739, column: 4)
!898 = !DILocation(line: 745, column: 4, scope: !899)
!899 = distinct !DILexicalBlock(scope: !884, file: !69, line: 744, column: 3)
!900 = !DILocation(line: 748, column: 1, scope: !835)
!901 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 767, type: !902, scopeLine: 768, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!902 = !DISubroutineType(types: !903)
!903 = !{!28, !6, !28, !6}
!904 = !DILocalVariable(name: "factor1", arg: 1, scope: !901, file: !69, line: 767, type: !6)
!905 = !DILocation(line: 767, column: 33, scope: !901)
!906 = !DILocalVariable(name: "factor2", arg: 2, scope: !901, file: !69, line: 767, type: !28)
!907 = !DILocation(line: 767, column: 46, scope: !901)
!908 = !DILocalVariable(name: "denominator", arg: 3, scope: !901, file: !69, line: 767, type: !6)
!909 = !DILocation(line: 767, column: 59, scope: !901)
!910 = !DILocalVariable(name: "u32Result", scope: !901, file: !69, line: 769, type: !582)
!911 = !DILocation(line: 769, column: 6, scope: !901)
!912 = !DILocalVariable(name: "u32Temp1", scope: !901, file: !69, line: 769, type: !582)
!913 = !DILocation(line: 769, column: 21, scope: !901)
!914 = !DILocalVariable(name: "s32Result", scope: !901, file: !69, line: 770, type: !16)
!915 = !DILocation(line: 770, column: 6, scope: !901)
!916 = !DILocalVariable(name: "s32Temp1", scope: !901, file: !69, line: 770, type: !16)
!917 = !DILocation(line: 770, column: 21, scope: !901)
!918 = !DILocation(line: 771, column: 14, scope: !901)
!919 = !DILocation(line: 771, column: 24, scope: !901)
!920 = !DILocation(line: 771, column: 22, scope: !901)
!921 = !DILocation(line: 771, column: 12, scope: !901)
!922 = !DILocation(line: 773, column: 5, scope: !923)
!923 = distinct !DILexicalBlock(scope: !901, file: !69, line: 773, column: 5)
!924 = !DILocation(line: 773, column: 17, scope: !923)
!925 = !DILocation(line: 773, column: 5, scope: !901)
!926 = !DILocation(line: 775, column: 6, scope: !927)
!927 = distinct !DILexicalBlock(scope: !928, file: !69, line: 775, column: 6)
!928 = distinct !DILexicalBlock(scope: !923, file: !69, line: 774, column: 2)
!929 = !DILocation(line: 775, column: 16, scope: !927)
!930 = !DILocation(line: 775, column: 6, scope: !928)
!931 = !DILocation(line: 777, column: 4, scope: !932)
!932 = distinct !DILexicalBlock(scope: !927, file: !69, line: 776, column: 3)
!933 = !DILocation(line: 781, column: 4, scope: !934)
!934 = distinct !DILexicalBlock(scope: !927, file: !69, line: 780, column: 3)
!935 = !DILocation(line: 786, column: 15, scope: !936)
!936 = distinct !DILexicalBlock(scope: !923, file: !69, line: 785, column: 2)
!937 = !DILocation(line: 786, column: 29, scope: !936)
!938 = !DILocation(line: 786, column: 39, scope: !936)
!939 = !DILocation(line: 786, column: 38, scope: !936)
!940 = !DILocation(line: 786, column: 54, scope: !936)
!941 = !DILocation(line: 786, column: 52, scope: !936)
!942 = !DILocation(line: 786, column: 25, scope: !936)
!943 = !DILocation(line: 786, column: 68, scope: !936)
!944 = !DILocation(line: 786, column: 12, scope: !936)
!945 = !DILocation(line: 787, column: 16, scope: !936)
!946 = !DILocation(line: 787, column: 25, scope: !936)
!947 = !DILocation(line: 787, column: 24, scope: !936)
!948 = !DILocation(line: 787, column: 41, scope: !936)
!949 = !DILocation(line: 787, column: 51, scope: !936)
!950 = !DILocation(line: 787, column: 50, scope: !936)
!951 = !DILocation(line: 787, column: 38, scope: !936)
!952 = !DILocation(line: 787, column: 13, scope: !936)
!953 = !DILocation(line: 788, column: 6, scope: !954)
!954 = distinct !DILexicalBlock(scope: !936, file: !69, line: 788, column: 6)
!955 = !DILocation(line: 788, column: 16, scope: !954)
!956 = !DILocation(line: 788, column: 6, scope: !936)
!957 = !DILocation(line: 790, column: 7, scope: !958)
!958 = distinct !DILexicalBlock(scope: !959, file: !69, line: 790, column: 7)
!959 = distinct !DILexicalBlock(scope: !954, file: !69, line: 789, column: 3)
!960 = !DILocation(line: 790, column: 17, scope: !958)
!961 = !DILocation(line: 790, column: 7, scope: !959)
!962 = !DILocation(line: 792, column: 17, scope: !963)
!963 = distinct !DILexicalBlock(scope: !958, file: !69, line: 791, column: 4)
!964 = !DILocation(line: 792, column: 12, scope: !963)
!965 = !DILocation(line: 792, column: 5, scope: !963)
!966 = !DILocation(line: 796, column: 5, scope: !967)
!967 = distinct !DILexicalBlock(scope: !958, file: !69, line: 795, column: 4)
!968 = !DILocation(line: 801, column: 4, scope: !969)
!969 = distinct !DILexicalBlock(scope: !954, file: !69, line: 800, column: 3)
!970 = !DILocation(line: 804, column: 1, scope: !901)
!971 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 823, type: !972, scopeLine: 824, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!972 = !DISubroutineType(types: !973)
!973 = !{!28, !6, !28, !28}
!974 = !DILocalVariable(name: "factor1", arg: 1, scope: !971, file: !69, line: 823, type: !6)
!975 = !DILocation(line: 823, column: 33, scope: !971)
!976 = !DILocalVariable(name: "factor2", arg: 2, scope: !971, file: !69, line: 823, type: !28)
!977 = !DILocation(line: 823, column: 46, scope: !971)
!978 = !DILocalVariable(name: "denominator", arg: 3, scope: !971, file: !69, line: 823, type: !28)
!979 = !DILocation(line: 823, column: 59, scope: !971)
!980 = !DILocalVariable(name: "s32Result", scope: !971, file: !69, line: 825, type: !16)
!981 = !DILocation(line: 825, column: 6, scope: !971)
!982 = !DILocalVariable(name: "s32Temp1", scope: !971, file: !69, line: 825, type: !16)
!983 = !DILocation(line: 825, column: 21, scope: !971)
!984 = !DILocation(line: 826, column: 14, scope: !971)
!985 = !DILocation(line: 826, column: 24, scope: !971)
!986 = !DILocation(line: 826, column: 22, scope: !971)
!987 = !DILocation(line: 826, column: 12, scope: !971)
!988 = !DILocation(line: 828, column: 5, scope: !989)
!989 = distinct !DILexicalBlock(scope: !971, file: !69, line: 828, column: 5)
!990 = !DILocation(line: 828, column: 17, scope: !989)
!991 = !DILocation(line: 828, column: 5, scope: !971)
!992 = !DILocation(line: 830, column: 6, scope: !993)
!993 = distinct !DILexicalBlock(scope: !994, file: !69, line: 830, column: 6)
!994 = distinct !DILexicalBlock(scope: !989, file: !69, line: 829, column: 2)
!995 = !DILocation(line: 830, column: 16, scope: !993)
!996 = !DILocation(line: 830, column: 6, scope: !994)
!997 = !DILocation(line: 832, column: 4, scope: !998)
!998 = distinct !DILexicalBlock(scope: !993, file: !69, line: 831, column: 3)
!999 = !DILocation(line: 836, column: 4, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !993, file: !69, line: 835, column: 3)
!1001 = !DILocation(line: 841, column: 15, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !989, file: !69, line: 840, column: 2)
!1003 = !DILocation(line: 841, column: 29, scope: !1002)
!1004 = !DILocation(line: 841, column: 39, scope: !1002)
!1005 = !DILocation(line: 841, column: 38, scope: !1002)
!1006 = !DILocation(line: 841, column: 54, scope: !1002)
!1007 = !DILocation(line: 841, column: 52, scope: !1002)
!1008 = !DILocation(line: 841, column: 25, scope: !1002)
!1009 = !DILocation(line: 841, column: 68, scope: !1002)
!1010 = !DILocation(line: 841, column: 12, scope: !1002)
!1011 = !DILocation(line: 842, column: 16, scope: !1002)
!1012 = !DILocation(line: 842, column: 25, scope: !1002)
!1013 = !DILocation(line: 842, column: 24, scope: !1002)
!1014 = !DILocation(line: 842, column: 41, scope: !1002)
!1015 = !DILocation(line: 842, column: 51, scope: !1002)
!1016 = !DILocation(line: 842, column: 50, scope: !1002)
!1017 = !DILocation(line: 842, column: 38, scope: !1002)
!1018 = !DILocation(line: 842, column: 13, scope: !1002)
!1019 = !DILocation(line: 843, column: 6, scope: !1020)
!1020 = distinct !DILexicalBlock(scope: !1002, file: !69, line: 843, column: 6)
!1021 = !DILocation(line: 843, column: 16, scope: !1020)
!1022 = !DILocation(line: 843, column: 6, scope: !1002)
!1023 = !DILocation(line: 845, column: 7, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1025, file: !69, line: 845, column: 7)
!1025 = distinct !DILexicalBlock(scope: !1020, file: !69, line: 844, column: 3)
!1026 = !DILocation(line: 845, column: 17, scope: !1024)
!1027 = !DILocation(line: 845, column: 7, scope: !1025)
!1028 = !DILocation(line: 847, column: 17, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1024, file: !69, line: 846, column: 4)
!1030 = !DILocation(line: 847, column: 12, scope: !1029)
!1031 = !DILocation(line: 847, column: 5, scope: !1029)
!1032 = !DILocation(line: 851, column: 5, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1024, file: !69, line: 850, column: 4)
!1034 = !DILocation(line: 856, column: 4, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1020, file: !69, line: 855, column: 3)
!1036 = !DILocation(line: 860, column: 1, scope: !971)
!1037 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 878, type: !1038, scopeLine: 879, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1038 = !DISubroutineType(types: !1039)
!1039 = !{!28, !28, !28, !28}
!1040 = !DILocalVariable(name: "factor1", arg: 1, scope: !1037, file: !69, line: 878, type: !28)
!1041 = !DILocation(line: 878, column: 33, scope: !1037)
!1042 = !DILocalVariable(name: "factor2", arg: 2, scope: !1037, file: !69, line: 878, type: !28)
!1043 = !DILocation(line: 878, column: 46, scope: !1037)
!1044 = !DILocalVariable(name: "denominator", arg: 3, scope: !1037, file: !69, line: 878, type: !28)
!1045 = !DILocation(line: 878, column: 59, scope: !1037)
!1046 = !DILocalVariable(name: "u32Temp1", scope: !1037, file: !69, line: 880, type: !582)
!1047 = !DILocation(line: 880, column: 6, scope: !1037)
!1048 = !DILocalVariable(name: "u16TempDenom", scope: !1037, file: !69, line: 881, type: !28)
!1049 = !DILocation(line: 881, column: 6, scope: !1037)
!1050 = !DILocation(line: 883, column: 5, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1037, file: !69, line: 883, column: 5)
!1052 = !DILocation(line: 883, column: 17, scope: !1051)
!1053 = !DILocation(line: 883, column: 5, scope: !1037)
!1054 = !DILocation(line: 885, column: 3, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1051, file: !69, line: 884, column: 2)
!1056 = !DILocation(line: 889, column: 14, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1051, file: !69, line: 888, column: 2)
!1058 = !DILocation(line: 889, column: 24, scope: !1057)
!1059 = !DILocation(line: 889, column: 22, scope: !1057)
!1060 = !DILocation(line: 889, column: 12, scope: !1057)
!1061 = !DILocation(line: 890, column: 18, scope: !1057)
!1062 = !DILocation(line: 890, column: 30, scope: !1057)
!1063 = !DILocation(line: 890, column: 16, scope: !1057)
!1064 = !DILocation(line: 891, column: 14, scope: !1057)
!1065 = !DILocation(line: 891, column: 25, scope: !1057)
!1066 = !DILocation(line: 891, column: 23, scope: !1057)
!1067 = !DILocation(line: 891, column: 12, scope: !1057)
!1068 = !DILocation(line: 892, column: 14, scope: !1057)
!1069 = !DILocation(line: 892, column: 25, scope: !1057)
!1070 = !DILocation(line: 892, column: 23, scope: !1057)
!1071 = !DILocation(line: 892, column: 12, scope: !1057)
!1072 = !DILocation(line: 893, column: 6, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1057, file: !69, line: 893, column: 6)
!1074 = !DILocation(line: 893, column: 15, scope: !1073)
!1075 = !DILocation(line: 893, column: 6, scope: !1057)
!1076 = !DILocation(line: 895, column: 12, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1073, file: !69, line: 894, column: 3)
!1078 = !DILocation(line: 895, column: 21, scope: !1077)
!1079 = !DILocation(line: 895, column: 11, scope: !1077)
!1080 = !DILocation(line: 895, column: 4, scope: !1077)
!1081 = !DILocation(line: 900, column: 4, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1073, file: !69, line: 899, column: 3)
!1083 = !DILocation(line: 905, column: 1, scope: !1037)
!1084 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 922, type: !1085, scopeLine: 923, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1085 = !DISubroutineType(types: !1086)
!1086 = !{!28, !28, !28, !582}
!1087 = !DILocalVariable(name: "factor1", arg: 1, scope: !1084, file: !69, line: 922, type: !28)
!1088 = !DILocation(line: 922, column: 33, scope: !1084)
!1089 = !DILocalVariable(name: "factor2", arg: 2, scope: !1084, file: !69, line: 922, type: !28)
!1090 = !DILocation(line: 922, column: 46, scope: !1084)
!1091 = !DILocalVariable(name: "denominator", arg: 3, scope: !1084, file: !69, line: 922, type: !582)
!1092 = !DILocation(line: 922, column: 59, scope: !1084)
!1093 = !DILocalVariable(name: "u32Temp1", scope: !1084, file: !69, line: 924, type: !582)
!1094 = !DILocation(line: 924, column: 6, scope: !1084)
!1095 = !DILocation(line: 925, column: 5, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1084, file: !69, line: 925, column: 5)
!1097 = !DILocation(line: 925, column: 17, scope: !1096)
!1098 = !DILocation(line: 925, column: 5, scope: !1084)
!1099 = !DILocation(line: 927, column: 3, scope: !1100)
!1100 = distinct !DILexicalBlock(scope: !1096, file: !69, line: 926, column: 2)
!1101 = !DILocation(line: 931, column: 15, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1096, file: !69, line: 930, column: 2)
!1103 = !DILocation(line: 931, column: 25, scope: !1102)
!1104 = !DILocation(line: 931, column: 23, scope: !1102)
!1105 = !DILocation(line: 931, column: 36, scope: !1102)
!1106 = !DILocation(line: 931, column: 34, scope: !1102)
!1107 = !DILocation(line: 931, column: 12, scope: !1102)
!1108 = !DILocation(line: 932, column: 8, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1102, file: !69, line: 932, column: 6)
!1110 = !DILocation(line: 932, column: 18, scope: !1109)
!1111 = !DILocation(line: 932, column: 16, scope: !1109)
!1112 = !DILocation(line: 932, column: 28, scope: !1109)
!1113 = !DILocation(line: 932, column: 40, scope: !1109)
!1114 = !DILocation(line: 932, column: 39, scope: !1109)
!1115 = !DILocation(line: 932, column: 26, scope: !1109)
!1116 = !DILocation(line: 932, column: 53, scope: !1109)
!1117 = !DILocation(line: 932, column: 64, scope: !1109)
!1118 = !DILocation(line: 932, column: 50, scope: !1109)
!1119 = !DILocation(line: 932, column: 6, scope: !1102)
!1120 = !DILocation(line: 934, column: 12, scope: !1121)
!1121 = distinct !DILexicalBlock(scope: !1109, file: !69, line: 933, column: 3)
!1122 = !DILocation(line: 935, column: 3, scope: !1121)
!1123 = !DILocation(line: 936, column: 6, scope: !1124)
!1124 = distinct !DILexicalBlock(scope: !1102, file: !69, line: 936, column: 6)
!1125 = !DILocation(line: 936, column: 15, scope: !1124)
!1126 = !DILocation(line: 936, column: 6, scope: !1102)
!1127 = !DILocation(line: 938, column: 12, scope: !1128)
!1128 = distinct !DILexicalBlock(scope: !1124, file: !69, line: 937, column: 3)
!1129 = !DILocation(line: 938, column: 21, scope: !1128)
!1130 = !DILocation(line: 938, column: 11, scope: !1128)
!1131 = !DILocation(line: 938, column: 4, scope: !1128)
!1132 = !DILocation(line: 942, column: 4, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1124, file: !69, line: 941, column: 3)
!1134 = !DILocation(line: 945, column: 1, scope: !1084)
!1135 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 962, type: !1136, scopeLine: 963, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1136 = !DISubroutineType(types: !1137)
!1137 = !{!582, !582, !28}
!1138 = !DILocalVariable(name: "x_value", arg: 1, scope: !1135, file: !69, line: 962, type: !582)
!1139 = !DILocation(line: 962, column: 25, scope: !1135)
!1140 = !DILocalVariable(name: "y_value", arg: 2, scope: !1135, file: !69, line: 962, type: !28)
!1141 = !DILocation(line: 962, column: 38, scope: !1135)
!1142 = !DILocalVariable(name: "u32Temp1", scope: !1135, file: !69, line: 964, type: !582)
!1143 = !DILocation(line: 964, column: 6, scope: !1135)
!1144 = !DILocation(line: 965, column: 5, scope: !1145)
!1145 = distinct !DILexicalBlock(scope: !1135, file: !69, line: 965, column: 5)
!1146 = !DILocation(line: 965, column: 13, scope: !1145)
!1147 = !DILocation(line: 965, column: 5, scope: !1135)
!1148 = !DILocation(line: 967, column: 3, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1145, file: !69, line: 966, column: 2)
!1150 = !DILocation(line: 971, column: 15, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1145, file: !69, line: 970, column: 2)
!1152 = !DILocation(line: 971, column: 26, scope: !1151)
!1153 = !DILocation(line: 971, column: 34, scope: !1151)
!1154 = !DILocation(line: 971, column: 33, scope: !1151)
!1155 = !DILocation(line: 971, column: 45, scope: !1151)
!1156 = !DILocation(line: 971, column: 43, scope: !1151)
!1157 = !DILocation(line: 971, column: 23, scope: !1151)
!1158 = !DILocation(line: 971, column: 54, scope: !1151)
!1159 = !DILocation(line: 971, column: 12, scope: !1151)
!1160 = !DILocation(line: 972, column: 15, scope: !1151)
!1161 = !DILocation(line: 972, column: 23, scope: !1151)
!1162 = !DILocation(line: 972, column: 22, scope: !1151)
!1163 = !DILocation(line: 972, column: 35, scope: !1151)
!1164 = !DILocation(line: 972, column: 44, scope: !1151)
!1165 = !DILocation(line: 972, column: 43, scope: !1151)
!1166 = !DILocation(line: 972, column: 32, scope: !1151)
!1167 = !DILocation(line: 972, column: 12, scope: !1151)
!1168 = !DILocation(line: 973, column: 10, scope: !1151)
!1169 = !DILocation(line: 973, column: 3, scope: !1151)
!1170 = !DILocation(line: 975, column: 1, scope: !1135)
!1171 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 993, type: !1172, scopeLine: 994, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1172 = !DISubroutineType(types: !1173)
!1173 = !{!6, !6, !6, !6}
!1174 = !DILocalVariable(name: "fak1", arg: 1, scope: !1171, file: !69, line: 993, type: !6)
!1175 = !DILocation(line: 993, column: 33, scope: !1171)
!1176 = !DILocalVariable(name: "fak2", arg: 2, scope: !1171, file: !69, line: 993, type: !6)
!1177 = !DILocation(line: 993, column: 43, scope: !1171)
!1178 = !DILocalVariable(name: "div", arg: 3, scope: !1171, file: !69, line: 993, type: !6)
!1179 = !DILocation(line: 993, column: 53, scope: !1171)
!1180 = !DILocalVariable(name: "s32Temp1", scope: !1171, file: !69, line: 995, type: !16)
!1181 = !DILocation(line: 995, column: 6, scope: !1171)
!1182 = !DILocalVariable(name: "s32Temp2", scope: !1171, file: !69, line: 995, type: !16)
!1183 = !DILocation(line: 995, column: 20, scope: !1171)
!1184 = !DILocalVariable(name: "s32Temp3", scope: !1171, file: !69, line: 995, type: !16)
!1185 = !DILocation(line: 995, column: 34, scope: !1171)
!1186 = !DILocation(line: 996, column: 13, scope: !1171)
!1187 = !DILocation(line: 996, column: 20, scope: !1171)
!1188 = !DILocation(line: 996, column: 18, scope: !1171)
!1189 = !DILocation(line: 996, column: 11, scope: !1171)
!1190 = !DILocation(line: 997, column: 5, scope: !1191)
!1191 = distinct !DILexicalBlock(scope: !1171, file: !69, line: 997, column: 5)
!1192 = !DILocation(line: 997, column: 9, scope: !1191)
!1193 = !DILocation(line: 997, column: 5, scope: !1171)
!1194 = !DILocation(line: 999, column: 6, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1196, file: !69, line: 999, column: 6)
!1196 = distinct !DILexicalBlock(scope: !1191, file: !69, line: 998, column: 2)
!1197 = !DILocation(line: 999, column: 15, scope: !1195)
!1198 = !DILocation(line: 999, column: 6, scope: !1196)
!1199 = !DILocation(line: 1001, column: 4, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1195, file: !69, line: 1000, column: 3)
!1201 = !DILocation(line: 1005, column: 4, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1195, file: !69, line: 1004, column: 3)
!1203 = !DILocation(line: 1010, column: 15, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1191, file: !69, line: 1009, column: 2)
!1205 = !DILocation(line: 1010, column: 28, scope: !1204)
!1206 = !DILocation(line: 1010, column: 39, scope: !1204)
!1207 = !DILocation(line: 1010, column: 37, scope: !1204)
!1208 = !DILocation(line: 1010, column: 46, scope: !1204)
!1209 = !DILocation(line: 1010, column: 44, scope: !1204)
!1210 = !DILocation(line: 1010, column: 24, scope: !1204)
!1211 = !DILocation(line: 1010, column: 52, scope: !1204)
!1212 = !DILocation(line: 1010, column: 12, scope: !1204)
!1213 = !DILocation(line: 1011, column: 15, scope: !1204)
!1214 = !DILocation(line: 1011, column: 24, scope: !1204)
!1215 = !DILocation(line: 1011, column: 23, scope: !1204)
!1216 = !DILocation(line: 1011, column: 32, scope: !1204)
!1217 = !DILocation(line: 1011, column: 41, scope: !1204)
!1218 = !DILocation(line: 1011, column: 40, scope: !1204)
!1219 = !DILocation(line: 1011, column: 29, scope: !1204)
!1220 = !DILocation(line: 1011, column: 12, scope: !1204)
!1221 = !DILocation(line: 1012, column: 6, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !1204, file: !69, line: 1012, column: 6)
!1223 = !DILocation(line: 1012, column: 15, scope: !1222)
!1224 = !DILocation(line: 1012, column: 6, scope: !1204)
!1225 = !DILocation(line: 1014, column: 7, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1227, file: !69, line: 1014, column: 7)
!1227 = distinct !DILexicalBlock(scope: !1222, file: !69, line: 1013, column: 3)
!1228 = !DILocation(line: 1014, column: 16, scope: !1226)
!1229 = !DILocation(line: 1014, column: 7, scope: !1227)
!1230 = !DILocation(line: 1016, column: 17, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1226, file: !69, line: 1015, column: 4)
!1232 = !DILocation(line: 1016, column: 12, scope: !1231)
!1233 = !DILocation(line: 1016, column: 5, scope: !1231)
!1234 = !DILocation(line: 1020, column: 5, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1226, file: !69, line: 1019, column: 4)
!1236 = !DILocation(line: 1025, column: 4, scope: !1237)
!1237 = distinct !DILexicalBlock(scope: !1222, file: !69, line: 1024, column: 3)
!1238 = !DILocation(line: 1028, column: 1, scope: !1171)
!1239 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1046, type: !1240, scopeLine: 1047, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1240 = !DISubroutineType(types: !1241)
!1241 = !{!6, !6, !6, !28}
!1242 = !DILocalVariable(name: "data1", arg: 1, scope: !1239, file: !69, line: 1046, type: !6)
!1243 = !DILocation(line: 1046, column: 33, scope: !1239)
!1244 = !DILocalVariable(name: "data2", arg: 2, scope: !1239, file: !69, line: 1046, type: !6)
!1245 = !DILocation(line: 1046, column: 43, scope: !1239)
!1246 = !DILocalVariable(name: "denominator", arg: 3, scope: !1239, file: !69, line: 1046, type: !28)
!1247 = !DILocation(line: 1046, column: 53, scope: !1239)
!1248 = !DILocalVariable(name: "s32Result", scope: !1239, file: !69, line: 1048, type: !16)
!1249 = !DILocation(line: 1048, column: 6, scope: !1239)
!1250 = !DILocalVariable(name: "s32Temp1", scope: !1239, file: !69, line: 1048, type: !16)
!1251 = !DILocation(line: 1048, column: 21, scope: !1239)
!1252 = !DILocation(line: 1049, column: 14, scope: !1239)
!1253 = !DILocation(line: 1049, column: 22, scope: !1239)
!1254 = !DILocation(line: 1049, column: 20, scope: !1239)
!1255 = !DILocation(line: 1049, column: 12, scope: !1239)
!1256 = !DILocation(line: 1051, column: 5, scope: !1257)
!1257 = distinct !DILexicalBlock(scope: !1239, file: !69, line: 1051, column: 5)
!1258 = !DILocation(line: 1051, column: 17, scope: !1257)
!1259 = !DILocation(line: 1051, column: 5, scope: !1239)
!1260 = !DILocation(line: 1053, column: 6, scope: !1261)
!1261 = distinct !DILexicalBlock(scope: !1262, file: !69, line: 1053, column: 6)
!1262 = distinct !DILexicalBlock(scope: !1257, file: !69, line: 1052, column: 2)
!1263 = !DILocation(line: 1053, column: 16, scope: !1261)
!1264 = !DILocation(line: 1053, column: 6, scope: !1262)
!1265 = !DILocation(line: 1055, column: 4, scope: !1266)
!1266 = distinct !DILexicalBlock(scope: !1261, file: !69, line: 1054, column: 3)
!1267 = !DILocation(line: 1057, column: 11, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1261, file: !69, line: 1057, column: 11)
!1269 = !DILocation(line: 1057, column: 21, scope: !1268)
!1270 = !DILocation(line: 1057, column: 11, scope: !1261)
!1271 = !DILocation(line: 1059, column: 4, scope: !1272)
!1272 = distinct !DILexicalBlock(scope: !1268, file: !69, line: 1058, column: 3)
!1273 = !DILocation(line: 1063, column: 4, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1268, file: !69, line: 1062, column: 3)
!1275 = !DILocation(line: 1068, column: 15, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1257, file: !69, line: 1067, column: 2)
!1277 = !DILocation(line: 1068, column: 28, scope: !1276)
!1278 = !DILocation(line: 1068, column: 38, scope: !1276)
!1279 = !DILocation(line: 1068, column: 37, scope: !1276)
!1280 = !DILocation(line: 1068, column: 51, scope: !1276)
!1281 = !DILocation(line: 1068, column: 50, scope: !1276)
!1282 = !DILocation(line: 1068, column: 25, scope: !1276)
!1283 = !DILocation(line: 1068, column: 64, scope: !1276)
!1284 = !DILocation(line: 1068, column: 12, scope: !1276)
!1285 = !DILocation(line: 1069, column: 16, scope: !1276)
!1286 = !DILocation(line: 1069, column: 25, scope: !1276)
!1287 = !DILocation(line: 1069, column: 24, scope: !1276)
!1288 = !DILocation(line: 1069, column: 41, scope: !1276)
!1289 = !DILocation(line: 1069, column: 51, scope: !1276)
!1290 = !DILocation(line: 1069, column: 50, scope: !1276)
!1291 = !DILocation(line: 1069, column: 38, scope: !1276)
!1292 = !DILocation(line: 1069, column: 13, scope: !1276)
!1293 = !DILocation(line: 1070, column: 6, scope: !1294)
!1294 = distinct !DILexicalBlock(scope: !1276, file: !69, line: 1070, column: 6)
!1295 = !DILocation(line: 1070, column: 16, scope: !1294)
!1296 = !DILocation(line: 1070, column: 6, scope: !1276)
!1297 = !DILocation(line: 1072, column: 7, scope: !1298)
!1298 = distinct !DILexicalBlock(scope: !1299, file: !69, line: 1072, column: 7)
!1299 = distinct !DILexicalBlock(scope: !1294, file: !69, line: 1071, column: 3)
!1300 = !DILocation(line: 1072, column: 17, scope: !1298)
!1301 = !DILocation(line: 1072, column: 7, scope: !1299)
!1302 = !DILocation(line: 1074, column: 17, scope: !1303)
!1303 = distinct !DILexicalBlock(scope: !1298, file: !69, line: 1073, column: 4)
!1304 = !DILocation(line: 1074, column: 12, scope: !1303)
!1305 = !DILocation(line: 1074, column: 5, scope: !1303)
!1306 = !DILocation(line: 1078, column: 5, scope: !1307)
!1307 = distinct !DILexicalBlock(scope: !1298, file: !69, line: 1077, column: 4)
!1308 = !DILocation(line: 1083, column: 4, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1294, file: !69, line: 1082, column: 3)
!1310 = !DILocation(line: 1087, column: 1, scope: !1239)
!1311 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1104, type: !1312, scopeLine: 1105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1312 = !DISubroutineType(types: !1313)
!1313 = !{!582, !582, !16}
!1314 = !DILocalVariable(name: "numerator", arg: 1, scope: !1311, file: !69, line: 1104, type: !582)
!1315 = !DILocation(line: 1104, column: 25, scope: !1311)
!1316 = !DILocalVariable(name: "denominator", arg: 2, scope: !1311, file: !69, line: 1104, type: !16)
!1317 = !DILocation(line: 1104, column: 40, scope: !1311)
!1318 = !DILocalVariable(name: "u32Temp1", scope: !1311, file: !69, line: 1106, type: !582)
!1319 = !DILocation(line: 1106, column: 6, scope: !1311)
!1320 = !DILocation(line: 1107, column: 5, scope: !1321)
!1321 = distinct !DILexicalBlock(scope: !1311, file: !69, line: 1107, column: 5)
!1322 = !DILocation(line: 1107, column: 17, scope: !1321)
!1323 = !DILocation(line: 1107, column: 5, scope: !1311)
!1324 = !DILocation(line: 1109, column: 3, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1321, file: !69, line: 1108, column: 2)
!1326 = !DILocation(line: 1113, column: 6, scope: !1327)
!1327 = distinct !DILexicalBlock(scope: !1328, file: !69, line: 1113, column: 6)
!1328 = distinct !DILexicalBlock(scope: !1321, file: !69, line: 1112, column: 2)
!1329 = !DILocation(line: 1113, column: 18, scope: !1327)
!1330 = !DILocation(line: 1113, column: 6, scope: !1328)
!1331 = !DILocation(line: 1115, column: 4, scope: !1332)
!1332 = distinct !DILexicalBlock(scope: !1327, file: !69, line: 1114, column: 3)
!1333 = !DILocation(line: 1119, column: 16, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1327, file: !69, line: 1118, column: 3)
!1335 = !DILocation(line: 1119, column: 30, scope: !1334)
!1336 = !DILocation(line: 1119, column: 40, scope: !1334)
!1337 = !DILocation(line: 1119, column: 39, scope: !1334)
!1338 = !DILocation(line: 1119, column: 55, scope: !1334)
!1339 = !DILocation(line: 1119, column: 53, scope: !1334)
!1340 = !DILocation(line: 1119, column: 26, scope: !1334)
!1341 = !DILocation(line: 1119, column: 68, scope: !1334)
!1342 = !DILocation(line: 1119, column: 13, scope: !1334)
!1343 = !DILocation(line: 1120, column: 16, scope: !1334)
!1344 = !DILocation(line: 1120, column: 25, scope: !1334)
!1345 = !DILocation(line: 1120, column: 24, scope: !1334)
!1346 = !DILocation(line: 1120, column: 41, scope: !1334)
!1347 = !DILocation(line: 1120, column: 51, scope: !1334)
!1348 = !DILocation(line: 1120, column: 50, scope: !1334)
!1349 = !DILocation(line: 1120, column: 38, scope: !1334)
!1350 = !DILocation(line: 1120, column: 13, scope: !1334)
!1351 = !DILocation(line: 1121, column: 11, scope: !1334)
!1352 = !DILocation(line: 1121, column: 4, scope: !1334)
!1353 = !DILocation(line: 1124, column: 1, scope: !1311)
!1354 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1141, type: !1355, scopeLine: 1142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1355 = !DISubroutineType(types: !1356)
!1356 = !{!582, !16, !582}
!1357 = !DILocalVariable(name: "numerator", arg: 1, scope: !1354, file: !69, line: 1141, type: !16)
!1358 = !DILocation(line: 1141, column: 25, scope: !1354)
!1359 = !DILocalVariable(name: "denominator", arg: 2, scope: !1354, file: !69, line: 1141, type: !582)
!1360 = !DILocation(line: 1141, column: 40, scope: !1354)
!1361 = !DILocalVariable(name: "s32Temp1", scope: !1354, file: !69, line: 1143, type: !16)
!1362 = !DILocation(line: 1143, column: 6, scope: !1354)
!1363 = !DILocation(line: 1144, column: 5, scope: !1364)
!1364 = distinct !DILexicalBlock(scope: !1354, file: !69, line: 1144, column: 5)
!1365 = !DILocation(line: 1144, column: 17, scope: !1364)
!1366 = !DILocation(line: 1144, column: 5, scope: !1354)
!1367 = !DILocation(line: 1146, column: 6, scope: !1368)
!1368 = distinct !DILexicalBlock(scope: !1369, file: !69, line: 1146, column: 6)
!1369 = distinct !DILexicalBlock(scope: !1364, file: !69, line: 1145, column: 2)
!1370 = !DILocation(line: 1146, column: 16, scope: !1368)
!1371 = !DILocation(line: 1146, column: 6, scope: !1369)
!1372 = !DILocation(line: 1148, column: 4, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1368, file: !69, line: 1147, column: 3)
!1374 = !DILocation(line: 1152, column: 4, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1368, file: !69, line: 1151, column: 3)
!1376 = !DILocation(line: 1157, column: 6, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1378, file: !69, line: 1157, column: 6)
!1378 = distinct !DILexicalBlock(scope: !1364, file: !69, line: 1156, column: 2)
!1379 = !DILocation(line: 1157, column: 16, scope: !1377)
!1380 = !DILocation(line: 1157, column: 6, scope: !1378)
!1381 = !DILocation(line: 1159, column: 17, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1377, file: !69, line: 1158, column: 3)
!1383 = !DILocation(line: 1159, column: 31, scope: !1382)
!1384 = !DILocation(line: 1159, column: 41, scope: !1382)
!1385 = !DILocation(line: 1159, column: 40, scope: !1382)
!1386 = !DILocation(line: 1159, column: 56, scope: !1382)
!1387 = !DILocation(line: 1159, column: 54, scope: !1382)
!1388 = !DILocation(line: 1159, column: 27, scope: !1382)
!1389 = !DILocation(line: 1159, column: 69, scope: !1382)
!1390 = !DILocation(line: 1159, column: 13, scope: !1382)
!1391 = !DILocation(line: 1160, column: 13, scope: !1382)
!1392 = !DILocation(line: 1160, column: 23, scope: !1382)
!1393 = !DILocation(line: 1160, column: 22, scope: !1382)
!1394 = !DILocation(line: 1160, column: 39, scope: !1382)
!1395 = !DILocation(line: 1160, column: 48, scope: !1382)
!1396 = !DILocation(line: 1160, column: 47, scope: !1382)
!1397 = !DILocation(line: 1160, column: 36, scope: !1382)
!1398 = !DILocation(line: 1160, column: 4, scope: !1382)
!1399 = !DILocation(line: 1164, column: 4, scope: !1400)
!1400 = distinct !DILexicalBlock(scope: !1377, file: !69, line: 1163, column: 3)
!1401 = !DILocation(line: 1167, column: 1, scope: !1354)
!1402 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1184, type: !1403, scopeLine: 1185, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1403 = !DISubroutineType(types: !1404)
!1404 = !{!582, !16, !16}
!1405 = !DILocalVariable(name: "numerator", arg: 1, scope: !1402, file: !69, line: 1184, type: !16)
!1406 = !DILocation(line: 1184, column: 25, scope: !1402)
!1407 = !DILocalVariable(name: "denominator", arg: 2, scope: !1402, file: !69, line: 1184, type: !16)
!1408 = !DILocation(line: 1184, column: 40, scope: !1402)
!1409 = !DILocalVariable(name: "u32Temp1", scope: !1402, file: !69, line: 1186, type: !582)
!1410 = !DILocation(line: 1186, column: 6, scope: !1402)
!1411 = !DILocalVariable(name: "u32Temp2", scope: !1402, file: !69, line: 1186, type: !582)
!1412 = !DILocation(line: 1186, column: 20, scope: !1402)
!1413 = !DILocation(line: 1187, column: 5, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1402, file: !69, line: 1187, column: 5)
!1415 = !DILocation(line: 1187, column: 17, scope: !1414)
!1416 = !DILocation(line: 1187, column: 5, scope: !1402)
!1417 = !DILocation(line: 1189, column: 6, scope: !1418)
!1418 = distinct !DILexicalBlock(scope: !1419, file: !69, line: 1189, column: 6)
!1419 = distinct !DILexicalBlock(scope: !1414, file: !69, line: 1188, column: 2)
!1420 = !DILocation(line: 1189, column: 16, scope: !1418)
!1421 = !DILocation(line: 1189, column: 6, scope: !1419)
!1422 = !DILocation(line: 1191, column: 4, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1418, file: !69, line: 1190, column: 3)
!1424 = !DILocation(line: 1195, column: 4, scope: !1425)
!1425 = distinct !DILexicalBlock(scope: !1418, file: !69, line: 1194, column: 3)
!1426 = !DILocation(line: 1200, column: 6, scope: !1427)
!1427 = distinct !DILexicalBlock(scope: !1428, file: !69, line: 1200, column: 6)
!1428 = distinct !DILexicalBlock(scope: !1414, file: !69, line: 1199, column: 2)
!1429 = !DILocation(line: 1200, column: 16, scope: !1427)
!1430 = !DILocation(line: 1200, column: 6, scope: !1428)
!1431 = !DILocation(line: 1202, column: 7, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1433, file: !69, line: 1202, column: 7)
!1433 = distinct !DILexicalBlock(scope: !1427, file: !69, line: 1201, column: 3)
!1434 = !DILocation(line: 1202, column: 17, scope: !1432)
!1435 = !DILocation(line: 1202, column: 7, scope: !1433)
!1436 = !DILocation(line: 1204, column: 5, scope: !1437)
!1437 = distinct !DILexicalBlock(scope: !1432, file: !69, line: 1203, column: 4)
!1438 = !DILocation(line: 1208, column: 8, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1440, file: !69, line: 1208, column: 8)
!1440 = distinct !DILexicalBlock(scope: !1432, file: !69, line: 1207, column: 4)
!1441 = !DILocation(line: 1208, column: 20, scope: !1439)
!1442 = !DILocation(line: 1208, column: 8, scope: !1440)
!1443 = !DILocation(line: 1210, column: 6, scope: !1444)
!1444 = distinct !DILexicalBlock(scope: !1439, file: !69, line: 1209, column: 5)
!1445 = !DILocation(line: 1214, column: 18, scope: !1446)
!1446 = distinct !DILexicalBlock(scope: !1439, file: !69, line: 1213, column: 5)
!1447 = !DILocation(line: 1214, column: 32, scope: !1446)
!1448 = !DILocation(line: 1214, column: 42, scope: !1446)
!1449 = !DILocation(line: 1214, column: 41, scope: !1446)
!1450 = !DILocation(line: 1214, column: 57, scope: !1446)
!1451 = !DILocation(line: 1214, column: 55, scope: !1446)
!1452 = !DILocation(line: 1214, column: 28, scope: !1446)
!1453 = !DILocation(line: 1214, column: 71, scope: !1446)
!1454 = !DILocation(line: 1214, column: 15, scope: !1446)
!1455 = !DILocation(line: 1215, column: 18, scope: !1446)
!1456 = !DILocation(line: 1215, column: 29, scope: !1446)
!1457 = !DILocation(line: 1215, column: 27, scope: !1446)
!1458 = !DILocation(line: 1215, column: 45, scope: !1446)
!1459 = !DILocation(line: 1215, column: 57, scope: !1446)
!1460 = !DILocation(line: 1215, column: 55, scope: !1446)
!1461 = !DILocation(line: 1215, column: 42, scope: !1446)
!1462 = !DILocation(line: 1215, column: 15, scope: !1446)
!1463 = !DILocation(line: 1216, column: 13, scope: !1446)
!1464 = !DILocation(line: 1216, column: 6, scope: !1446)
!1465 = !DILocation(line: 1222, column: 7, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1467, file: !69, line: 1222, column: 7)
!1467 = distinct !DILexicalBlock(scope: !1427, file: !69, line: 1221, column: 3)
!1468 = !DILocation(line: 1222, column: 19, scope: !1466)
!1469 = !DILocation(line: 1222, column: 7, scope: !1467)
!1470 = !DILocation(line: 1224, column: 5, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1466, file: !69, line: 1223, column: 4)
!1472 = !DILocation(line: 1228, column: 18, scope: !1473)
!1473 = distinct !DILexicalBlock(scope: !1466, file: !69, line: 1227, column: 4)
!1474 = !DILocation(line: 1228, column: 17, scope: !1473)
!1475 = !DILocation(line: 1228, column: 15, scope: !1473)
!1476 = !DILocation(line: 1229, column: 20, scope: !1473)
!1477 = !DILocation(line: 1229, column: 19, scope: !1473)
!1478 = !DILocation(line: 1229, column: 17, scope: !1473)
!1479 = !DILocation(line: 1230, column: 17, scope: !1473)
!1480 = !DILocation(line: 1230, column: 31, scope: !1473)
!1481 = !DILocation(line: 1230, column: 41, scope: !1473)
!1482 = !DILocation(line: 1230, column: 40, scope: !1473)
!1483 = !DILocation(line: 1230, column: 56, scope: !1473)
!1484 = !DILocation(line: 1230, column: 54, scope: !1473)
!1485 = !DILocation(line: 1230, column: 27, scope: !1473)
!1486 = !DILocation(line: 1230, column: 70, scope: !1473)
!1487 = !DILocation(line: 1230, column: 14, scope: !1473)
!1488 = !DILocation(line: 1231, column: 17, scope: !1473)
!1489 = !DILocation(line: 1231, column: 28, scope: !1473)
!1490 = !DILocation(line: 1231, column: 26, scope: !1473)
!1491 = !DILocation(line: 1231, column: 44, scope: !1473)
!1492 = !DILocation(line: 1231, column: 56, scope: !1473)
!1493 = !DILocation(line: 1231, column: 54, scope: !1473)
!1494 = !DILocation(line: 1231, column: 41, scope: !1473)
!1495 = !DILocation(line: 1231, column: 14, scope: !1473)
!1496 = !DILocation(line: 1232, column: 12, scope: !1473)
!1497 = !DILocation(line: 1232, column: 5, scope: !1473)
!1498 = !DILocation(line: 1237, column: 1, scope: !1402)
!1499 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1254, type: !1500, scopeLine: 1255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1500 = !DISubroutineType(types: !1501)
!1501 = !{!582, !582, !582}
!1502 = !DILocalVariable(name: "numerator", arg: 1, scope: !1499, file: !69, line: 1254, type: !582)
!1503 = !DILocation(line: 1254, column: 25, scope: !1499)
!1504 = !DILocalVariable(name: "denominator", arg: 2, scope: !1499, file: !69, line: 1254, type: !582)
!1505 = !DILocation(line: 1254, column: 40, scope: !1499)
!1506 = !DILocalVariable(name: "u32Temp1", scope: !1499, file: !69, line: 1257, type: !582)
!1507 = !DILocation(line: 1257, column: 6, scope: !1499)
!1508 = !DILocalVariable(name: "u32Temp2", scope: !1499, file: !69, line: 1257, type: !582)
!1509 = !DILocation(line: 1257, column: 20, scope: !1499)
!1510 = !DILocalVariable(name: "u32Temp3", scope: !1499, file: !69, line: 1257, type: !582)
!1511 = !DILocation(line: 1257, column: 34, scope: !1499)
!1512 = !DILocalVariable(name: "numerator_old", scope: !1499, file: !69, line: 1257, type: !582)
!1513 = !DILocation(line: 1257, column: 48, scope: !1499)
!1514 = !DILocation(line: 1258, column: 5, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1499, file: !69, line: 1258, column: 5)
!1516 = !DILocation(line: 1258, column: 16, scope: !1515)
!1517 = !DILocation(line: 1258, column: 5, scope: !1499)
!1518 = !DILocation(line: 1260, column: 3, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1515, file: !69, line: 1259, column: 2)
!1520 = !DILocation(line: 1264, column: 14, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1515, file: !69, line: 1263, column: 2)
!1522 = !DILocation(line: 1264, column: 26, scope: !1521)
!1523 = !DILocation(line: 1264, column: 41, scope: !1521)
!1524 = !DILocation(line: 1264, column: 51, scope: !1521)
!1525 = !DILocation(line: 1264, column: 50, scope: !1521)
!1526 = !DILocation(line: 1264, column: 38, scope: !1521)
!1527 = !DILocation(line: 1264, column: 24, scope: !1521)
!1528 = !DILocation(line: 1264, column: 12, scope: !1521)
!1529 = !DILocation(line: 1265, column: 7, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1521, file: !69, line: 1265, column: 6)
!1531 = !DILocation(line: 1265, column: 16, scope: !1530)
!1532 = !DILocation(line: 1265, column: 24, scope: !1530)
!1533 = !DILocation(line: 1265, column: 6, scope: !1521)
!1534 = !DILocation(line: 1267, column: 16, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1530, file: !69, line: 1266, column: 3)
!1536 = !DILocation(line: 1267, column: 27, scope: !1535)
!1537 = !DILocation(line: 1267, column: 13, scope: !1535)
!1538 = !DILocation(line: 1268, column: 3, scope: !1535)
!1539 = !DILocation(line: 1271, column: 16, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1530, file: !69, line: 1270, column: 3)
!1541 = !DILocation(line: 1271, column: 27, scope: !1540)
!1542 = !DILocation(line: 1271, column: 32, scope: !1540)
!1543 = !DILocation(line: 1271, column: 13, scope: !1540)
!1544 = !DILocation(line: 1274, column: 6, scope: !1545)
!1545 = distinct !DILexicalBlock(scope: !1521, file: !69, line: 1274, column: 6)
!1546 = !DILocation(line: 1274, column: 17, scope: !1545)
!1547 = !DILocation(line: 1274, column: 15, scope: !1545)
!1548 = !DILocation(line: 1274, column: 6, scope: !1521)
!1549 = !DILocation(line: 1276, column: 12, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1545, file: !69, line: 1275, column: 3)
!1551 = !DILocation(line: 1276, column: 22, scope: !1550)
!1552 = !DILocation(line: 1276, column: 21, scope: !1550)
!1553 = !DILocation(line: 1276, column: 4, scope: !1550)
!1554 = !DILocation(line: 1280, column: 13, scope: !1555)
!1555 = distinct !DILexicalBlock(scope: !1545, file: !69, line: 1279, column: 3)
!1556 = !DILocation(line: 1280, column: 23, scope: !1555)
!1557 = !DILocation(line: 1280, column: 22, scope: !1555)
!1558 = !DILocation(line: 1280, column: 36, scope: !1555)
!1559 = !DILocation(line: 1280, column: 4, scope: !1555)
!1560 = !DILocation(line: 1285, column: 1, scope: !1499)
!1561 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1302, type: !1562, scopeLine: 1303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1562 = !DISubroutineType(types: !1563)
!1563 = !{!16, !582, !16}
!1564 = !DILocalVariable(name: "numerator", arg: 1, scope: !1561, file: !69, line: 1302, type: !582)
!1565 = !DILocation(line: 1302, column: 25, scope: !1561)
!1566 = !DILocalVariable(name: "denominator", arg: 2, scope: !1561, file: !69, line: 1302, type: !16)
!1567 = !DILocation(line: 1302, column: 40, scope: !1561)
!1568 = !DILocalVariable(name: "u32Temp1", scope: !1561, file: !69, line: 1304, type: !582)
!1569 = !DILocation(line: 1304, column: 6, scope: !1561)
!1570 = !DILocalVariable(name: "u32Temp2", scope: !1561, file: !69, line: 1304, type: !582)
!1571 = !DILocation(line: 1304, column: 20, scope: !1561)
!1572 = !DILocation(line: 1305, column: 5, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1561, file: !69, line: 1305, column: 5)
!1574 = !DILocation(line: 1305, column: 17, scope: !1573)
!1575 = !DILocation(line: 1305, column: 5, scope: !1561)
!1576 = !DILocation(line: 1307, column: 6, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1578, file: !69, line: 1307, column: 6)
!1578 = distinct !DILexicalBlock(scope: !1573, file: !69, line: 1306, column: 2)
!1579 = !DILocation(line: 1307, column: 18, scope: !1577)
!1580 = !DILocation(line: 1307, column: 6, scope: !1578)
!1581 = !DILocation(line: 1309, column: 4, scope: !1582)
!1582 = distinct !DILexicalBlock(scope: !1577, file: !69, line: 1308, column: 3)
!1583 = !DILocation(line: 1313, column: 19, scope: !1584)
!1584 = distinct !DILexicalBlock(scope: !1577, file: !69, line: 1312, column: 3)
!1585 = !DILocation(line: 1313, column: 18, scope: !1584)
!1586 = !DILocation(line: 1313, column: 16, scope: !1584)
!1587 = !DILocation(line: 1314, column: 16, scope: !1584)
!1588 = !DILocation(line: 1314, column: 30, scope: !1584)
!1589 = !DILocation(line: 1314, column: 40, scope: !1584)
!1590 = !DILocation(line: 1314, column: 39, scope: !1584)
!1591 = !DILocation(line: 1314, column: 55, scope: !1584)
!1592 = !DILocation(line: 1314, column: 53, scope: !1584)
!1593 = !DILocation(line: 1314, column: 26, scope: !1584)
!1594 = !DILocation(line: 1314, column: 69, scope: !1584)
!1595 = !DILocation(line: 1314, column: 13, scope: !1584)
!1596 = !DILocation(line: 1315, column: 16, scope: !1584)
!1597 = !DILocation(line: 1315, column: 25, scope: !1584)
!1598 = !DILocation(line: 1315, column: 24, scope: !1584)
!1599 = !DILocation(line: 1315, column: 41, scope: !1584)
!1600 = !DILocation(line: 1315, column: 51, scope: !1584)
!1601 = !DILocation(line: 1315, column: 50, scope: !1584)
!1602 = !DILocation(line: 1315, column: 38, scope: !1584)
!1603 = !DILocation(line: 1315, column: 13, scope: !1584)
!1604 = !DILocation(line: 1316, column: 7, scope: !1605)
!1605 = distinct !DILexicalBlock(scope: !1584, file: !69, line: 1316, column: 7)
!1606 = !DILocation(line: 1316, column: 16, scope: !1605)
!1607 = !DILocation(line: 1316, column: 7, scope: !1584)
!1608 = !DILocation(line: 1318, column: 13, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1605, file: !69, line: 1317, column: 4)
!1610 = !DILocation(line: 1318, column: 12, scope: !1609)
!1611 = !DILocation(line: 1318, column: 5, scope: !1609)
!1612 = !DILocation(line: 1322, column: 5, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1605, file: !69, line: 1321, column: 4)
!1614 = !DILocation(line: 1328, column: 15, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1573, file: !69, line: 1327, column: 2)
!1616 = !DILocation(line: 1328, column: 29, scope: !1615)
!1617 = !DILocation(line: 1328, column: 39, scope: !1615)
!1618 = !DILocation(line: 1328, column: 38, scope: !1615)
!1619 = !DILocation(line: 1328, column: 54, scope: !1615)
!1620 = !DILocation(line: 1328, column: 52, scope: !1615)
!1621 = !DILocation(line: 1328, column: 25, scope: !1615)
!1622 = !DILocation(line: 1328, column: 68, scope: !1615)
!1623 = !DILocation(line: 1328, column: 12, scope: !1615)
!1624 = !DILocation(line: 1329, column: 15, scope: !1615)
!1625 = !DILocation(line: 1329, column: 24, scope: !1615)
!1626 = !DILocation(line: 1329, column: 23, scope: !1615)
!1627 = !DILocation(line: 1329, column: 40, scope: !1615)
!1628 = !DILocation(line: 1329, column: 50, scope: !1615)
!1629 = !DILocation(line: 1329, column: 49, scope: !1615)
!1630 = !DILocation(line: 1329, column: 37, scope: !1615)
!1631 = !DILocation(line: 1329, column: 12, scope: !1615)
!1632 = !DILocation(line: 1330, column: 6, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1615, file: !69, line: 1330, column: 6)
!1634 = !DILocation(line: 1330, column: 15, scope: !1633)
!1635 = !DILocation(line: 1330, column: 6, scope: !1615)
!1636 = !DILocation(line: 1332, column: 11, scope: !1637)
!1637 = distinct !DILexicalBlock(scope: !1633, file: !69, line: 1331, column: 3)
!1638 = !DILocation(line: 1332, column: 4, scope: !1637)
!1639 = !DILocation(line: 1336, column: 4, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1633, file: !69, line: 1335, column: 3)
!1641 = !DILocation(line: 1339, column: 1, scope: !1561)
!1642 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1357, type: !1643, scopeLine: 1358, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1643 = !DISubroutineType(types: !1644)
!1644 = !{!16, !16, !582}
!1645 = !DILocalVariable(name: "numerator", arg: 1, scope: !1642, file: !69, line: 1357, type: !16)
!1646 = !DILocation(line: 1357, column: 25, scope: !1642)
!1647 = !DILocalVariable(name: "denominator", arg: 2, scope: !1642, file: !69, line: 1357, type: !582)
!1648 = !DILocation(line: 1357, column: 40, scope: !1642)
!1649 = !DILocalVariable(name: "s32Temp1", scope: !1642, file: !69, line: 1359, type: !16)
!1650 = !DILocation(line: 1359, column: 6, scope: !1642)
!1651 = !DILocalVariable(name: "s32Temp2", scope: !1642, file: !69, line: 1359, type: !16)
!1652 = !DILocation(line: 1359, column: 20, scope: !1642)
!1653 = !DILocalVariable(name: "u32Temp0", scope: !1642, file: !69, line: 1360, type: !582)
!1654 = !DILocation(line: 1360, column: 6, scope: !1642)
!1655 = !DILocalVariable(name: "u32Temp1", scope: !1642, file: !69, line: 1360, type: !582)
!1656 = !DILocation(line: 1360, column: 20, scope: !1642)
!1657 = !DILocalVariable(name: "u32Temp2", scope: !1642, file: !69, line: 1360, type: !582)
!1658 = !DILocation(line: 1360, column: 34, scope: !1642)
!1659 = !DILocation(line: 1361, column: 5, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1642, file: !69, line: 1361, column: 5)
!1661 = !DILocation(line: 1361, column: 17, scope: !1660)
!1662 = !DILocation(line: 1361, column: 5, scope: !1642)
!1663 = !DILocation(line: 1363, column: 6, scope: !1664)
!1664 = distinct !DILexicalBlock(scope: !1665, file: !69, line: 1363, column: 6)
!1665 = distinct !DILexicalBlock(scope: !1660, file: !69, line: 1362, column: 2)
!1666 = !DILocation(line: 1363, column: 16, scope: !1664)
!1667 = !DILocation(line: 1363, column: 6, scope: !1665)
!1668 = !DILocation(line: 1365, column: 4, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1664, file: !69, line: 1364, column: 3)
!1670 = !DILocation(line: 1369, column: 4, scope: !1671)
!1671 = distinct !DILexicalBlock(scope: !1664, file: !69, line: 1368, column: 3)
!1672 = !DILocation(line: 1374, column: 6, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1674, file: !69, line: 1374, column: 6)
!1674 = distinct !DILexicalBlock(scope: !1660, file: !69, line: 1373, column: 2)
!1675 = !DILocation(line: 1374, column: 16, scope: !1673)
!1676 = !DILocation(line: 1374, column: 6, scope: !1674)
!1677 = !DILocation(line: 1376, column: 16, scope: !1678)
!1678 = distinct !DILexicalBlock(scope: !1673, file: !69, line: 1375, column: 3)
!1679 = !DILocation(line: 1376, column: 15, scope: !1678)
!1680 = !DILocation(line: 1376, column: 13, scope: !1678)
!1681 = !DILocation(line: 1377, column: 16, scope: !1678)
!1682 = !DILocation(line: 1377, column: 25, scope: !1678)
!1683 = !DILocation(line: 1377, column: 24, scope: !1678)
!1684 = !DILocation(line: 1377, column: 13, scope: !1678)
!1685 = !DILocation(line: 1378, column: 15, scope: !1678)
!1686 = !DILocation(line: 1378, column: 28, scope: !1678)
!1687 = !DILocation(line: 1378, column: 37, scope: !1678)
!1688 = !DILocation(line: 1378, column: 36, scope: !1678)
!1689 = !DILocation(line: 1378, column: 52, scope: !1678)
!1690 = !DILocation(line: 1378, column: 50, scope: !1678)
!1691 = !DILocation(line: 1378, column: 24, scope: !1678)
!1692 = !DILocation(line: 1378, column: 13, scope: !1678)
!1693 = !DILocation(line: 1380, column: 8, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1678, file: !69, line: 1380, column: 7)
!1695 = !DILocation(line: 1380, column: 20, scope: !1694)
!1696 = !DILocation(line: 1380, column: 27, scope: !1694)
!1697 = !DILocation(line: 1380, column: 7, scope: !1678)
!1698 = !DILocation(line: 1382, column: 20, scope: !1699)
!1699 = distinct !DILexicalBlock(scope: !1694, file: !69, line: 1381, column: 4)
!1700 = !DILocation(line: 1382, column: 32, scope: !1699)
!1701 = !DILocation(line: 1382, column: 17, scope: !1699)
!1702 = !DILocation(line: 1383, column: 4, scope: !1699)
!1703 = !DILocation(line: 1386, column: 20, scope: !1704)
!1704 = distinct !DILexicalBlock(scope: !1694, file: !69, line: 1385, column: 4)
!1705 = !DILocation(line: 1386, column: 32, scope: !1704)
!1706 = !DILocation(line: 1386, column: 38, scope: !1704)
!1707 = !DILocation(line: 1386, column: 17, scope: !1704)
!1708 = !DILocation(line: 1390, column: 7, scope: !1709)
!1709 = distinct !DILexicalBlock(scope: !1678, file: !69, line: 1390, column: 7)
!1710 = !DILocation(line: 1390, column: 18, scope: !1709)
!1711 = !DILocation(line: 1390, column: 16, scope: !1709)
!1712 = !DILocation(line: 1390, column: 7, scope: !1678)
!1713 = !DILocation(line: 1392, column: 14, scope: !1714)
!1714 = distinct !DILexicalBlock(scope: !1709, file: !69, line: 1391, column: 4)
!1715 = !DILocation(line: 1392, column: 13, scope: !1714)
!1716 = !DILocation(line: 1392, column: 23, scope: !1714)
!1717 = !DILocation(line: 1392, column: 5, scope: !1714)
!1718 = !DILocation(line: 1396, column: 14, scope: !1719)
!1719 = distinct !DILexicalBlock(scope: !1709, file: !69, line: 1395, column: 4)
!1720 = !DILocation(line: 1396, column: 23, scope: !1719)
!1721 = !DILocation(line: 1396, column: 12, scope: !1719)
!1722 = !DILocation(line: 1396, column: 27, scope: !1719)
!1723 = !DILocation(line: 1396, column: 5, scope: !1719)
!1724 = !DILocation(line: 1403, column: 16, scope: !1725)
!1725 = distinct !DILexicalBlock(scope: !1673, file: !69, line: 1402, column: 3)
!1726 = !DILocation(line: 1403, column: 30, scope: !1725)
!1727 = !DILocation(line: 1403, column: 40, scope: !1725)
!1728 = !DILocation(line: 1403, column: 39, scope: !1725)
!1729 = !DILocation(line: 1403, column: 55, scope: !1725)
!1730 = !DILocation(line: 1403, column: 53, scope: !1725)
!1731 = !DILocation(line: 1403, column: 26, scope: !1725)
!1732 = !DILocation(line: 1403, column: 69, scope: !1725)
!1733 = !DILocation(line: 1403, column: 13, scope: !1725)
!1734 = !DILocation(line: 1404, column: 16, scope: !1725)
!1735 = !DILocation(line: 1404, column: 26, scope: !1725)
!1736 = !DILocation(line: 1404, column: 25, scope: !1725)
!1737 = !DILocation(line: 1404, column: 42, scope: !1725)
!1738 = !DILocation(line: 1404, column: 51, scope: !1725)
!1739 = !DILocation(line: 1404, column: 50, scope: !1725)
!1740 = !DILocation(line: 1404, column: 39, scope: !1725)
!1741 = !DILocation(line: 1404, column: 13, scope: !1725)
!1742 = !DILocation(line: 1405, column: 11, scope: !1725)
!1743 = !DILocation(line: 1405, column: 4, scope: !1725)
!1744 = !DILocation(line: 1408, column: 1, scope: !1642)
!1745 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1425, type: !1746, scopeLine: 1426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1746 = !DISubroutineType(types: !1747)
!1747 = !{!16, !16, !16}
!1748 = !DILocalVariable(name: "numerator", arg: 1, scope: !1745, file: !69, line: 1425, type: !16)
!1749 = !DILocation(line: 1425, column: 25, scope: !1745)
!1750 = !DILocalVariable(name: "denominator", arg: 2, scope: !1745, file: !69, line: 1425, type: !16)
!1751 = !DILocation(line: 1425, column: 40, scope: !1745)
!1752 = !DILocalVariable(name: "s32Temp1", scope: !1745, file: !69, line: 1427, type: !16)
!1753 = !DILocation(line: 1427, column: 6, scope: !1745)
!1754 = !DILocalVariable(name: "s32Temp2", scope: !1745, file: !69, line: 1427, type: !16)
!1755 = !DILocation(line: 1427, column: 20, scope: !1745)
!1756 = !DILocalVariable(name: "denominator_prime", scope: !1745, file: !69, line: 1428, type: !582)
!1757 = !DILocation(line: 1428, column: 6, scope: !1745)
!1758 = !DILocalVariable(name: "u32Temp1", scope: !1745, file: !69, line: 1428, type: !582)
!1759 = !DILocation(line: 1428, column: 29, scope: !1745)
!1760 = !DILocalVariable(name: "u32Temp2", scope: !1745, file: !69, line: 1428, type: !582)
!1761 = !DILocation(line: 1428, column: 43, scope: !1745)
!1762 = !DILocalVariable(name: "u32numerator", scope: !1745, file: !69, line: 1429, type: !582)
!1763 = !DILocation(line: 1429, column: 6, scope: !1745)
!1764 = !DILocalVariable(name: "u32denominator", scope: !1745, file: !69, line: 1429, type: !582)
!1765 = !DILocation(line: 1429, column: 23, scope: !1745)
!1766 = !DILocation(line: 1430, column: 5, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1745, file: !69, line: 1430, column: 5)
!1768 = !DILocation(line: 1430, column: 15, scope: !1767)
!1769 = !DILocation(line: 1430, column: 5, scope: !1745)
!1770 = !DILocation(line: 1432, column: 6, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1772, file: !69, line: 1432, column: 6)
!1772 = distinct !DILexicalBlock(scope: !1767, file: !69, line: 1431, column: 2)
!1773 = !DILocation(line: 1432, column: 18, scope: !1771)
!1774 = !DILocation(line: 1432, column: 6, scope: !1772)
!1775 = !DILocation(line: 1434, column: 7, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1777, file: !69, line: 1434, column: 7)
!1777 = distinct !DILexicalBlock(scope: !1771, file: !69, line: 1433, column: 3)
!1778 = !DILocation(line: 1434, column: 19, scope: !1776)
!1779 = !DILocation(line: 1434, column: 7, scope: !1777)
!1780 = !DILocation(line: 1436, column: 5, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1776, file: !69, line: 1435, column: 4)
!1782 = !DILocation(line: 1440, column: 21, scope: !1783)
!1783 = distinct !DILexicalBlock(scope: !1776, file: !69, line: 1439, column: 4)
!1784 = !DILocation(line: 1440, column: 20, scope: !1783)
!1785 = !DILocation(line: 1440, column: 18, scope: !1783)
!1786 = !DILocation(line: 1441, column: 23, scope: !1783)
!1787 = !DILocation(line: 1441, column: 22, scope: !1783)
!1788 = !DILocation(line: 1441, column: 20, scope: !1783)
!1789 = !DILocation(line: 1442, column: 16, scope: !1783)
!1790 = !DILocation(line: 1442, column: 33, scope: !1783)
!1791 = !DILocation(line: 1442, column: 46, scope: !1783)
!1792 = !DILocation(line: 1442, column: 45, scope: !1783)
!1793 = !DILocation(line: 1442, column: 64, scope: !1783)
!1794 = !DILocation(line: 1442, column: 62, scope: !1783)
!1795 = !DILocation(line: 1442, column: 29, scope: !1783)
!1796 = !DILocation(line: 1442, column: 81, scope: !1783)
!1797 = !DILocation(line: 1442, column: 14, scope: !1783)
!1798 = !DILocation(line: 1443, column: 17, scope: !1783)
!1799 = !DILocation(line: 1443, column: 30, scope: !1783)
!1800 = !DILocation(line: 1443, column: 29, scope: !1783)
!1801 = !DILocation(line: 1443, column: 49, scope: !1783)
!1802 = !DILocation(line: 1443, column: 58, scope: !1783)
!1803 = !DILocation(line: 1443, column: 57, scope: !1783)
!1804 = !DILocation(line: 1443, column: 46, scope: !1783)
!1805 = !DILocation(line: 1443, column: 14, scope: !1783)
!1806 = !DILocation(line: 1444, column: 8, scope: !1807)
!1807 = distinct !DILexicalBlock(scope: !1783, file: !69, line: 1444, column: 8)
!1808 = !DILocation(line: 1444, column: 17, scope: !1807)
!1809 = !DILocation(line: 1444, column: 8, scope: !1783)
!1810 = !DILocation(line: 1446, column: 13, scope: !1811)
!1811 = distinct !DILexicalBlock(scope: !1807, file: !69, line: 1445, column: 5)
!1812 = !DILocation(line: 1446, column: 6, scope: !1811)
!1813 = !DILocation(line: 1450, column: 6, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1807, file: !69, line: 1449, column: 5)
!1815 = !DILocation(line: 1456, column: 20, scope: !1816)
!1816 = distinct !DILexicalBlock(scope: !1771, file: !69, line: 1455, column: 3)
!1817 = !DILocation(line: 1456, column: 19, scope: !1816)
!1818 = !DILocation(line: 1456, column: 29, scope: !1816)
!1819 = !DILocation(line: 1456, column: 17, scope: !1816)
!1820 = !DILocation(line: 1457, column: 16, scope: !1816)
!1821 = !DILocation(line: 1457, column: 33, scope: !1816)
!1822 = !DILocation(line: 1457, column: 46, scope: !1816)
!1823 = !DILocation(line: 1457, column: 45, scope: !1816)
!1824 = !DILocation(line: 1457, column: 61, scope: !1816)
!1825 = !DILocation(line: 1457, column: 59, scope: !1816)
!1826 = !DILocation(line: 1457, column: 29, scope: !1816)
!1827 = !DILocation(line: 1457, column: 75, scope: !1816)
!1828 = !DILocation(line: 1457, column: 13, scope: !1816)
!1829 = !DILocation(line: 1458, column: 16, scope: !1816)
!1830 = !DILocation(line: 1458, column: 29, scope: !1816)
!1831 = !DILocation(line: 1458, column: 28, scope: !1816)
!1832 = !DILocation(line: 1458, column: 45, scope: !1816)
!1833 = !DILocation(line: 1458, column: 54, scope: !1816)
!1834 = !DILocation(line: 1458, column: 53, scope: !1816)
!1835 = !DILocation(line: 1458, column: 42, scope: !1816)
!1836 = !DILocation(line: 1458, column: 13, scope: !1816)
!1837 = !DILocation(line: 1459, column: 13, scope: !1816)
!1838 = !DILocation(line: 1459, column: 12, scope: !1816)
!1839 = !DILocation(line: 1459, column: 22, scope: !1816)
!1840 = !DILocation(line: 1459, column: 4, scope: !1816)
!1841 = !DILocation(line: 1464, column: 6, scope: !1842)
!1842 = distinct !DILexicalBlock(scope: !1843, file: !69, line: 1464, column: 6)
!1843 = distinct !DILexicalBlock(scope: !1767, file: !69, line: 1463, column: 2)
!1844 = !DILocation(line: 1464, column: 18, scope: !1842)
!1845 = !DILocation(line: 1464, column: 6, scope: !1843)
!1846 = !DILocation(line: 1466, column: 7, scope: !1847)
!1847 = distinct !DILexicalBlock(scope: !1848, file: !69, line: 1466, column: 7)
!1848 = distinct !DILexicalBlock(scope: !1842, file: !69, line: 1465, column: 3)
!1849 = !DILocation(line: 1466, column: 19, scope: !1847)
!1850 = !DILocation(line: 1466, column: 7, scope: !1848)
!1851 = !DILocation(line: 1468, column: 5, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1847, file: !69, line: 1467, column: 4)
!1853 = !DILocation(line: 1472, column: 23, scope: !1854)
!1854 = distinct !DILexicalBlock(scope: !1847, file: !69, line: 1471, column: 4)
!1855 = !DILocation(line: 1472, column: 22, scope: !1854)
!1856 = !DILocation(line: 1472, column: 35, scope: !1854)
!1857 = !DILocation(line: 1472, column: 20, scope: !1854)
!1858 = !DILocation(line: 1473, column: 17, scope: !1854)
!1859 = !DILocation(line: 1473, column: 31, scope: !1854)
!1860 = !DILocation(line: 1473, column: 41, scope: !1854)
!1861 = !DILocation(line: 1473, column: 40, scope: !1854)
!1862 = !DILocation(line: 1473, column: 59, scope: !1854)
!1863 = !DILocation(line: 1473, column: 57, scope: !1854)
!1864 = !DILocation(line: 1473, column: 27, scope: !1854)
!1865 = !DILocation(line: 1473, column: 76, scope: !1854)
!1866 = !DILocation(line: 1473, column: 14, scope: !1854)
!1867 = !DILocation(line: 1474, column: 17, scope: !1854)
!1868 = !DILocation(line: 1474, column: 27, scope: !1854)
!1869 = !DILocation(line: 1474, column: 26, scope: !1854)
!1870 = !DILocation(line: 1474, column: 46, scope: !1854)
!1871 = !DILocation(line: 1474, column: 55, scope: !1854)
!1872 = !DILocation(line: 1474, column: 54, scope: !1854)
!1873 = !DILocation(line: 1474, column: 43, scope: !1854)
!1874 = !DILocation(line: 1474, column: 14, scope: !1854)
!1875 = !DILocation(line: 1475, column: 14, scope: !1854)
!1876 = !DILocation(line: 1475, column: 13, scope: !1854)
!1877 = !DILocation(line: 1475, column: 23, scope: !1854)
!1878 = !DILocation(line: 1475, column: 5, scope: !1854)
!1879 = !DILocation(line: 1480, column: 16, scope: !1880)
!1880 = distinct !DILexicalBlock(scope: !1842, file: !69, line: 1479, column: 3)
!1881 = !DILocation(line: 1480, column: 30, scope: !1880)
!1882 = !DILocation(line: 1480, column: 40, scope: !1880)
!1883 = !DILocation(line: 1480, column: 39, scope: !1880)
!1884 = !DILocation(line: 1480, column: 55, scope: !1880)
!1885 = !DILocation(line: 1480, column: 53, scope: !1880)
!1886 = !DILocation(line: 1480, column: 26, scope: !1880)
!1887 = !DILocation(line: 1480, column: 69, scope: !1880)
!1888 = !DILocation(line: 1480, column: 13, scope: !1880)
!1889 = !DILocation(line: 1481, column: 16, scope: !1880)
!1890 = !DILocation(line: 1481, column: 26, scope: !1880)
!1891 = !DILocation(line: 1481, column: 25, scope: !1880)
!1892 = !DILocation(line: 1481, column: 42, scope: !1880)
!1893 = !DILocation(line: 1481, column: 51, scope: !1880)
!1894 = !DILocation(line: 1481, column: 50, scope: !1880)
!1895 = !DILocation(line: 1481, column: 39, scope: !1880)
!1896 = !DILocation(line: 1481, column: 13, scope: !1880)
!1897 = !DILocation(line: 1482, column: 11, scope: !1880)
!1898 = !DILocation(line: 1482, column: 4, scope: !1880)
!1899 = !DILocation(line: 1485, column: 1, scope: !1745)
!1900 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1503, type: !1901, scopeLine: 1504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1901 = !DISubroutineType(types: !1902)
!1902 = !{!6, !16, !582}
!1903 = !DILocalVariable(name: "numerator", arg: 1, scope: !1900, file: !69, line: 1503, type: !16)
!1904 = !DILocation(line: 1503, column: 25, scope: !1900)
!1905 = !DILocalVariable(name: "denominator", arg: 2, scope: !1900, file: !69, line: 1503, type: !582)
!1906 = !DILocation(line: 1503, column: 40, scope: !1900)
!1907 = !DILocalVariable(name: "numerator_prime", scope: !1900, file: !69, line: 1506, type: !582)
!1908 = !DILocation(line: 1506, column: 6, scope: !1900)
!1909 = !DILocalVariable(name: "u32Temp1", scope: !1900, file: !69, line: 1506, type: !582)
!1910 = !DILocation(line: 1506, column: 27, scope: !1900)
!1911 = !DILocalVariable(name: "u32Temp2", scope: !1900, file: !69, line: 1506, type: !582)
!1912 = !DILocation(line: 1506, column: 41, scope: !1900)
!1913 = !DILocalVariable(name: "u32Temp3", scope: !1900, file: !69, line: 1506, type: !582)
!1914 = !DILocation(line: 1506, column: 55, scope: !1900)
!1915 = !DILocalVariable(name: "s32Temp1", scope: !1900, file: !69, line: 1507, type: !16)
!1916 = !DILocation(line: 1507, column: 6, scope: !1900)
!1917 = !DILocalVariable(name: "s32Temp2", scope: !1900, file: !69, line: 1507, type: !16)
!1918 = !DILocation(line: 1507, column: 20, scope: !1900)
!1919 = !DILocalVariable(name: "s32Temp3", scope: !1900, file: !69, line: 1507, type: !16)
!1920 = !DILocation(line: 1507, column: 34, scope: !1900)
!1921 = !DILocation(line: 1508, column: 5, scope: !1922)
!1922 = distinct !DILexicalBlock(scope: !1900, file: !69, line: 1508, column: 5)
!1923 = !DILocation(line: 1508, column: 17, scope: !1922)
!1924 = !DILocation(line: 1508, column: 5, scope: !1900)
!1925 = !DILocation(line: 1510, column: 6, scope: !1926)
!1926 = distinct !DILexicalBlock(scope: !1927, file: !69, line: 1510, column: 6)
!1927 = distinct !DILexicalBlock(scope: !1922, file: !69, line: 1509, column: 2)
!1928 = !DILocation(line: 1510, column: 15, scope: !1926)
!1929 = !DILocation(line: 1510, column: 6, scope: !1927)
!1930 = !DILocation(line: 1512, column: 4, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1926, file: !69, line: 1511, column: 3)
!1932 = !DILocation(line: 1516, column: 4, scope: !1933)
!1933 = distinct !DILexicalBlock(scope: !1926, file: !69, line: 1515, column: 3)
!1934 = !DILocation(line: 1521, column: 6, scope: !1935)
!1935 = distinct !DILexicalBlock(scope: !1936, file: !69, line: 1521, column: 6)
!1936 = distinct !DILexicalBlock(scope: !1922, file: !69, line: 1520, column: 2)
!1937 = !DILocation(line: 1521, column: 16, scope: !1935)
!1938 = !DILocation(line: 1521, column: 6, scope: !1936)
!1939 = !DILocation(line: 1523, column: 23, scope: !1940)
!1940 = distinct !DILexicalBlock(scope: !1935, file: !69, line: 1522, column: 3)
!1941 = !DILocation(line: 1523, column: 22, scope: !1940)
!1942 = !DILocation(line: 1523, column: 20, scope: !1940)
!1943 = !DILocation(line: 1524, column: 16, scope: !1940)
!1944 = !DILocation(line: 1524, column: 32, scope: !1940)
!1945 = !DILocation(line: 1524, column: 31, scope: !1940)
!1946 = !DILocation(line: 1524, column: 13, scope: !1940)
!1947 = !DILocation(line: 1525, column: 15, scope: !1940)
!1948 = !DILocation(line: 1525, column: 34, scope: !1940)
!1949 = !DILocation(line: 1525, column: 45, scope: !1940)
!1950 = !DILocation(line: 1525, column: 43, scope: !1940)
!1951 = !DILocation(line: 1525, column: 31, scope: !1940)
!1952 = !DILocation(line: 1525, column: 13, scope: !1940)
!1953 = !DILocation(line: 1527, column: 8, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1940, file: !69, line: 1527, column: 7)
!1955 = !DILocation(line: 1527, column: 20, scope: !1954)
!1956 = !DILocation(line: 1527, column: 27, scope: !1954)
!1957 = !DILocation(line: 1527, column: 7, scope: !1940)
!1958 = !DILocation(line: 1529, column: 19, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1954, file: !69, line: 1528, column: 4)
!1960 = !DILocation(line: 1529, column: 31, scope: !1959)
!1961 = !DILocation(line: 1529, column: 17, scope: !1959)
!1962 = !DILocation(line: 1530, column: 4, scope: !1959)
!1963 = !DILocation(line: 1533, column: 20, scope: !1964)
!1964 = distinct !DILexicalBlock(scope: !1954, file: !69, line: 1532, column: 4)
!1965 = !DILocation(line: 1533, column: 32, scope: !1964)
!1966 = !DILocation(line: 1533, column: 38, scope: !1964)
!1967 = !DILocation(line: 1533, column: 17, scope: !1964)
!1968 = !DILocation(line: 1536, column: 7, scope: !1969)
!1969 = distinct !DILexicalBlock(scope: !1940, file: !69, line: 1536, column: 7)
!1970 = !DILocation(line: 1536, column: 18, scope: !1969)
!1971 = !DILocation(line: 1536, column: 16, scope: !1969)
!1972 = !DILocation(line: 1536, column: 7, scope: !1940)
!1973 = !DILocation(line: 1538, column: 18, scope: !1974)
!1974 = distinct !DILexicalBlock(scope: !1969, file: !69, line: 1537, column: 4)
!1975 = !DILocation(line: 1538, column: 16, scope: !1974)
!1976 = !DILocation(line: 1538, column: 28, scope: !1974)
!1977 = !DILocation(line: 1538, column: 14, scope: !1974)
!1978 = !DILocation(line: 1539, column: 4, scope: !1974)
!1979 = !DILocation(line: 1542, column: 18, scope: !1980)
!1980 = distinct !DILexicalBlock(scope: !1969, file: !69, line: 1541, column: 4)
!1981 = !DILocation(line: 1542, column: 26, scope: !1980)
!1982 = !DILocation(line: 1542, column: 16, scope: !1980)
!1983 = !DILocation(line: 1542, column: 30, scope: !1980)
!1984 = !DILocation(line: 1542, column: 14, scope: !1980)
!1985 = !DILocation(line: 1544, column: 8, scope: !1986)
!1986 = distinct !DILexicalBlock(scope: !1940, file: !69, line: 1544, column: 7)
!1987 = !DILocation(line: 1544, column: 18, scope: !1986)
!1988 = !DILocation(line: 1544, column: 7, scope: !1940)
!1989 = !DILocation(line: 1546, column: 18, scope: !1990)
!1990 = distinct !DILexicalBlock(scope: !1986, file: !69, line: 1545, column: 4)
!1991 = !DILocation(line: 1546, column: 12, scope: !1990)
!1992 = !DILocation(line: 1546, column: 5, scope: !1990)
!1993 = !DILocation(line: 1550, column: 5, scope: !1994)
!1994 = distinct !DILexicalBlock(scope: !1986, file: !69, line: 1549, column: 4)
!1995 = !DILocation(line: 1555, column: 16, scope: !1996)
!1996 = distinct !DILexicalBlock(scope: !1935, file: !69, line: 1554, column: 3)
!1997 = !DILocation(line: 1555, column: 26, scope: !1996)
!1998 = !DILocation(line: 1555, column: 25, scope: !1996)
!1999 = !DILocation(line: 1555, column: 41, scope: !1996)
!2000 = !DILocation(line: 1555, column: 39, scope: !1996)
!2001 = !DILocation(line: 1555, column: 13, scope: !1996)
!2002 = !DILocation(line: 1556, column: 16, scope: !1996)
!2003 = !DILocation(line: 1556, column: 30, scope: !1996)
!2004 = !DILocation(line: 1556, column: 40, scope: !1996)
!2005 = !DILocation(line: 1556, column: 39, scope: !1996)
!2006 = !DILocation(line: 1556, column: 55, scope: !1996)
!2007 = !DILocation(line: 1556, column: 53, scope: !1996)
!2008 = !DILocation(line: 1556, column: 26, scope: !1996)
!2009 = !DILocation(line: 1556, column: 68, scope: !1996)
!2010 = !DILocation(line: 1556, column: 13, scope: !1996)
!2011 = !DILocation(line: 1557, column: 16, scope: !1996)
!2012 = !DILocation(line: 1557, column: 25, scope: !1996)
!2013 = !DILocation(line: 1557, column: 24, scope: !1996)
!2014 = !DILocation(line: 1557, column: 41, scope: !1996)
!2015 = !DILocation(line: 1557, column: 51, scope: !1996)
!2016 = !DILocation(line: 1557, column: 50, scope: !1996)
!2017 = !DILocation(line: 1557, column: 38, scope: !1996)
!2018 = !DILocation(line: 1557, column: 13, scope: !1996)
!2019 = !DILocation(line: 1558, column: 7, scope: !2020)
!2020 = distinct !DILexicalBlock(scope: !1996, file: !69, line: 1558, column: 7)
!2021 = !DILocation(line: 1558, column: 16, scope: !2020)
!2022 = !DILocation(line: 1558, column: 7, scope: !1996)
!2023 = !DILocation(line: 1560, column: 17, scope: !2024)
!2024 = distinct !DILexicalBlock(scope: !2020, file: !69, line: 1559, column: 4)
!2025 = !DILocation(line: 1560, column: 12, scope: !2024)
!2026 = !DILocation(line: 1560, column: 5, scope: !2024)
!2027 = !DILocation(line: 1564, column: 5, scope: !2028)
!2028 = distinct !DILexicalBlock(scope: !2020, file: !69, line: 1563, column: 4)
!2029 = !DILocation(line: 1568, column: 1, scope: !1900)
!2030 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2031, file: !2031, line: 12, type: !2032, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2035)
!2031 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2032 = !DISubroutineType(types: !2033)
!2033 = !{null, !2034}
!2034 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2035 = !{!2036}
!2036 = !DILocalVariable(name: "z", arg: 1, scope: !2030, file: !2031, line: 12, type: !2034)
!2037 = !DILocation(line: 0, scope: !2030)
!2038 = !DILocation(line: 13, column: 9, scope: !2039)
!2039 = distinct !DILexicalBlock(scope: !2030, file: !2031, line: 13, column: 7)
!2040 = !DILocation(line: 13, column: 7, scope: !2030)
!2041 = !DILocation(line: 14, column: 5, scope: !2039)
!2042 = !DILocation(line: 15, column: 1, scope: !2030)
!2043 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2044, file: !2044, line: 20, type: !2045, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2048)
!2044 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2045 = !DISubroutineType(types: !2046)
!2046 = !{null, !2047, !2047}
!2047 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2048 = !{!2049, !2050}
!2049 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2043, file: !2044, line: 20, type: !2047)
!2050 = !DILocalVariable(name: "shift", arg: 2, scope: !2043, file: !2044, line: 20, type: !2047)
!2051 = !DILocation(line: 0, scope: !2043)
!2052 = !DILocation(line: 21, column: 13, scope: !2053)
!2053 = distinct !DILexicalBlock(scope: !2043, file: !2044, line: 21, column: 7)
!2054 = !DILocation(line: 21, column: 7, scope: !2043)
!2055 = !DILocation(line: 27, column: 5, scope: !2056)
!2056 = distinct !DILexicalBlock(scope: !2053, file: !2044, line: 21, column: 26)
!2057 = !DILocation(line: 29, column: 1, scope: !2043)
