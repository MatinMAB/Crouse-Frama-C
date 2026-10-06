; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0139/build/u16_mul_s16_u16_div_u16_alarm_0139.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"factor1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"factor2\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [131 x i8] c"KLEE-ALARM-0139: signed overflow. assert -2147483648 <= s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator);\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0139.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %factor1 = alloca i16, align 2
  %factor2 = alloca i16, align 2
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %factor1, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i16* %factor2, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i16* %result, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = bitcast i16* %factor1 to i8*, !dbg !55
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !56
  %1 = bitcast i16* %factor2 to i8*, !dbg !57
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  %2 = bitcast i16* %denominator to i8*, !dbg !59
  call void @klee_make_symbolic(i8* %2, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  %3 = load i16, i16* %factor1, align 2, !dbg !61
  %4 = load i16, i16* %factor2, align 2, !dbg !62
  %5 = load i16, i16* %denominator, align 2, !dbg !63
  %call = call zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %3, i16 zeroext %4, i16 zeroext %5), !dbg !64
  store i16 %call, i16* %result, align 2, !dbg !65
  %6 = load i16, i16* %result, align 2, !dbg !66
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
  br i1 %cmp6, label %if.then8, label %if.else24, !dbg !216

if.then8:                                         ; preds = %if.else5
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !217
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !219
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !220
  %conv9 = sext i16 %6 to i32, !dbg !220
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !221
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !221
  %div = sdiv i32 %5, %conv9, !dbg !221, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !222
  %conv10 = sext i16 %7 to i32, !dbg !222
  %mul = mul nsw i32 %div, %conv10, !dbg !223
  %sub = sub nsw i32 %4, %mul, !dbg !224
  %shl = shl i32 %sub, 1, !dbg !225
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !226
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !227
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !228
  %conv11 = sext i16 %9 to i32, !dbg !228
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !229
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !229
  %div12 = sdiv i32 %8, %conv11, !dbg !229, !klee.check.div !106
  store i32 %div12, i32* %s32Temp1, align 4, !dbg !230
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !231
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !232
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !233
  %conv13 = sext i16 %12 to i32, !dbg !233
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !234
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !234
  %div14 = sdiv i32 %11, %conv13, !dbg !234, !klee.check.div !106
  %add = add nsw i32 %10, %div14, !dbg !235
  store i32 %add, i32* %s32Temp1, align 4, !dbg !236
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !237
  %cmp15 = icmp slt i32 %13, 32767, !dbg !239
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !240

if.then17:                                        ; preds = %if.then8
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !241
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !244
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !245

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !246
  %conv21 = trunc i32 %15 to i16, !dbg !248
  store i16 %conv21, i16* %retval, align 2, !dbg !249
  br label %return, !dbg !249

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !250
  br label %return, !dbg !250

if.else23:                                        ; preds = %if.then8
  store i16 32767, i16* %retval, align 2, !dbg !252
  br label %return, !dbg !252

if.else24:                                        ; preds = %if.else5
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !254
  %conv25 = sext i16 %16 to i32, !dbg !254
  %cmp26 = icmp ne i32 %conv25, -1, !dbg !257
  br i1 %cmp26, label %if.then28, label %if.else49, !dbg !258

if.then28:                                        ; preds = %if.else24
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !259
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !261
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !262
  %conv29 = sext i16 %19 to i32, !dbg !262
  %int_cast_to_i643 = zext i32 %conv29 to i64, !dbg !263
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !263
  %div30 = sdiv i32 %18, %conv29, !dbg !263, !klee.check.div !106
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !264
  %conv31 = sext i16 %20 to i32, !dbg !264
  %mul32 = mul nsw i32 %div30, %conv31, !dbg !265
  %sub33 = sub nsw i32 %17, %mul32, !dbg !266
  %shl34 = shl i32 %sub33, 1, !dbg !267
  store i32 %shl34, i32* %s32Temp2, align 4, !dbg !268
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !269
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !270
  %conv35 = sext i16 %22 to i32, !dbg !270
  %int_cast_to_i644 = zext i32 %conv35 to i64, !dbg !271
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !271
  %div36 = sdiv i32 %21, %conv35, !dbg !271, !klee.check.div !106
  store i32 %div36, i32* %s32Temp1, align 4, !dbg !272
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !273
  %24 = load i32, i32* %numerator.addr, align 4, !dbg !274
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !275
  %conv37 = sext i16 %25 to i32, !dbg !275
  %int_cast_to_i645 = zext i32 %conv37 to i64, !dbg !276
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !276
  %div38 = sdiv i32 %24, %conv37, !dbg !276, !klee.check.div !106
  %add39 = add nsw i32 %23, %div38, !dbg !277
  store i32 %add39, i32* %s32Temp1, align 4, !dbg !278
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !279
  %cmp40 = icmp slt i32 %26, 32767, !dbg !281
  br i1 %cmp40, label %if.then42, label %if.else48, !dbg !282

if.then42:                                        ; preds = %if.then28
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !283
  %cmp43 = icmp sgt i32 %27, -32768, !dbg !286
  br i1 %cmp43, label %if.then45, label %if.else47, !dbg !287

if.then45:                                        ; preds = %if.then42
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !288
  %conv46 = trunc i32 %28 to i16, !dbg !290
  store i16 %conv46, i16* %retval, align 2, !dbg !291
  br label %return, !dbg !291

if.else47:                                        ; preds = %if.then42
  store i16 -32768, i16* %retval, align 2, !dbg !292
  br label %return, !dbg !292

if.else48:                                        ; preds = %if.then28
  store i16 32767, i16* %retval, align 2, !dbg !294
  br label %return, !dbg !294

if.else49:                                        ; preds = %if.else24
  store i16 32767, i16* %retval, align 2, !dbg !296
  br label %return, !dbg !296

return:                                           ; preds = %if.else49, %if.else48, %if.else47, %if.then45, %if.else23, %if.else22, %if.then20, %if.else, %if.then4
  %29 = load i16, i16* %retval, align 2, !dbg !298
  ret i16 %29, !dbg !298
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !299 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !302, metadata !DIExpression()), !dbg !303
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !304, metadata !DIExpression()), !dbg !305
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !306, metadata !DIExpression()), !dbg !307
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !308, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !310, metadata !DIExpression()), !dbg !311
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !312
  %conv = zext i16 %0 to i32, !dbg !312
  %and = and i32 %conv, 65535, !dbg !313
  %conv1 = trunc i32 %and to i16, !dbg !312
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !314
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !315
  %conv2 = sext i16 %1 to i32, !dbg !315
  %shl = shl i32 %conv2, 16, !dbg !316
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !317
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !318
  %conv3 = zext i16 %2 to i32, !dbg !318
  %cmp = icmp eq i32 %conv3, 0, !dbg !320
  br i1 %cmp, label %if.then, label %if.else9, !dbg !321

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !322
  %conv5 = sext i16 %3 to i32, !dbg !322
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !325
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !326

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !327
  br label %return, !dbg !327

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !329
  br label %return, !dbg !329

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !331
  %conv10 = sext i16 %4 to i32, !dbg !331
  %shl11 = shl i32 %conv10, 16, !dbg !333
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !334
  %conv12 = sext i16 %5 to i32, !dbg !334
  %shl13 = shl i32 %conv12, 16, !dbg !335
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !336
  %conv14 = zext i16 %6 to i32, !dbg !336
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !337
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !337
  %div = sdiv i32 %shl13, %conv14, !dbg !337, !klee.check.div !106
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !338
  %conv15 = zext i16 %7 to i32, !dbg !338
  %mul = mul nsw i32 %div, %conv15, !dbg !339
  %sub = sub nsw i32 %shl11, %mul, !dbg !340
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !341
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !342
  %shl16 = shl i32 %8, 1, !dbg !343
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !344
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !345
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !346
  %conv17 = zext i16 %10 to i32, !dbg !346
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !347
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !347
  %div18 = sdiv i32 %9, %conv17, !dbg !347, !klee.check.div !106
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !348
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !349
  %conv19 = sext i16 %11 to i32, !dbg !349
  %shl20 = shl i32 %conv19, 16, !dbg !350
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !351
  %conv21 = zext i16 %12 to i32, !dbg !351
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !352
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !352
  %div22 = sdiv i32 %shl20, %conv21, !dbg !352, !klee.check.div !106
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !353
  %add = add nsw i32 %div22, %13, !dbg !354
  store i32 %add, i32* %s32Temp1, align 4, !dbg !355
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !356
  %cmp23 = icmp slt i32 %14, 32767, !dbg !358
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !359

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !360
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !363
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !364

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !365
  %conv29 = trunc i32 %16 to i16, !dbg !367
  store i16 %conv29, i16* %retval, align 2, !dbg !368
  br label %return, !dbg !368

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !369
  br label %return, !dbg !369

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !371
  br label %return, !dbg !371

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !373
  ret i16 %17, !dbg !373
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !374 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !375, metadata !DIExpression()), !dbg !376
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !377, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !379, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !381, metadata !DIExpression()), !dbg !382
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !383
  %conv = zext i16 %0 to i32, !dbg !383
  %and = and i32 %conv, 65535, !dbg !384
  %conv1 = trunc i32 %and to i16, !dbg !383
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !385
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !386
  %conv2 = zext i16 %1 to i32, !dbg !386
  %cmp = icmp eq i32 %conv2, 0, !dbg !388
  br i1 %cmp, label %if.then, label %if.else8, !dbg !389

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !390
  %conv4 = sext i16 %2 to i32, !dbg !390
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !393
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !394

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !395
  br label %return, !dbg !395

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !397
  br label %return, !dbg !397

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !399
  %conv9 = sext i16 %3 to i32, !dbg !399
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !401
  %conv10 = sext i16 %4 to i32, !dbg !401
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !402
  %conv11 = zext i16 %5 to i32, !dbg !402
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !403
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !403
  %div = sdiv i32 %conv10, %conv11, !dbg !403, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !404
  %conv12 = zext i16 %6 to i32, !dbg !404
  %mul = mul nsw i32 %div, %conv12, !dbg !405
  %sub = sub nsw i32 %conv9, %mul, !dbg !406
  %shl = shl i32 %sub, 1, !dbg !407
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !408
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !409
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !410
  %conv13 = zext i16 %8 to i32, !dbg !410
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !411
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !411
  %div14 = sdiv i32 %7, %conv13, !dbg !411, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !412
  %conv15 = sext i16 %9 to i32, !dbg !412
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !413
  %conv16 = zext i16 %10 to i32, !dbg !413
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !414
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !414
  %div17 = sdiv i32 %conv15, %conv16, !dbg !414, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !415
  store i32 %add, i32* %s32Temp1, align 4, !dbg !416
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !417
  %conv18 = trunc i32 %11 to i16, !dbg !417
  store i16 %conv18, i16* %retval, align 2, !dbg !418
  br label %return, !dbg !418

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !419
  ret i16 %12, !dbg !419
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !420 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !423, metadata !DIExpression()), !dbg !424
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !425, metadata !DIExpression()), !dbg !426
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !427, metadata !DIExpression()), !dbg !432
  store i32 0, i32* %u32Temp1, align 4, !dbg !432
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !433, metadata !DIExpression()), !dbg !434
  store i32 0, i32* %u32Temp2, align 4, !dbg !434
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !435, metadata !DIExpression()), !dbg !436
  store i32 0, i32* %u32Temp3, align 4, !dbg !436
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !437
  %conv = zext i16 %0 to i32, !dbg !437
  %cmp = icmp eq i32 %conv, 0, !dbg !439
  br i1 %cmp, label %if.then, label %if.else, !dbg !440

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !441
  br label %return, !dbg !441

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !443
  %conv2 = zext i16 %1 to i32, !dbg !443
  %shl = shl i32 %conv2, 16, !dbg !445
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !446
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !447
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !448
  %conv3 = zext i16 %3 to i32, !dbg !448
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !449
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !449
  %div = udiv i32 %2, %conv3, !dbg !449, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !450
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !451
  %add = add i32 %4, 128, !dbg !452
  %shr = lshr i32 %add, 8, !dbg !453
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !454
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !455
  %cmp4 = icmp ult i32 %5, 255, !dbg !457
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !458

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !459
  %conv7 = trunc i32 %6 to i8, !dbg !461
  store i8 %conv7, i8* %retval, align 1, !dbg !462
  br label %return, !dbg !462

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !463
  br label %return, !dbg !463

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !465
  ret i8 %7, !dbg !465
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !466 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !469, metadata !DIExpression()), !dbg !470
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !471, metadata !DIExpression()), !dbg !472
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !473, metadata !DIExpression()), !dbg !474
  store i32 0, i32* %s32Temp1, align 4, !dbg !474
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !475
  %conv = zext i16 %0 to i32, !dbg !475
  %and = and i32 %conv, 65535, !dbg !476
  %conv1 = trunc i32 %and to i16, !dbg !475
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !477
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !478
  %conv2 = zext i16 %1 to i32, !dbg !478
  %and3 = and i32 %conv2, 65535, !dbg !480
  %cmp = icmp eq i32 %and3, 0, !dbg !481
  br i1 %cmp, label %if.then, label %if.else8, !dbg !482

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !483
  %cmp5 = icmp sge i32 %2, 0, !dbg !486
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !487

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !488
  br label %return, !dbg !488

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !490
  br label %return, !dbg !490

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !492
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !494
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !495
  %conv9 = zext i16 %5 to i32, !dbg !495
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !496
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !496
  %div = sdiv i32 %4, %conv9, !dbg !496, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !497
  %conv10 = zext i16 %6 to i32, !dbg !497
  %mul = mul nsw i32 %div, %conv10, !dbg !498
  %sub = sub nsw i32 %3, %mul, !dbg !499
  %shl = shl i32 %sub, 1, !dbg !500
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !501
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !502
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !503
  %conv11 = zext i16 %8 to i32, !dbg !503
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !504
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !504
  %div12 = sdiv i32 %7, %conv11, !dbg !504, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !505
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !506
  %conv13 = zext i16 %10 to i32, !dbg !506
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !507
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !507
  %div14 = sdiv i32 %9, %conv13, !dbg !507, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !508
  store i32 %add, i32* %s32Temp1, align 4, !dbg !509
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !510
  %cmp15 = icmp slt i32 %11, 65535, !dbg !512
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !513

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !514
  %cmp18 = icmp sgt i32 %12, 0, !dbg !517
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !518

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !519
  %conv21 = trunc i32 %13 to i16, !dbg !521
  store i16 %conv21, i16* %retval, align 2, !dbg !522
  br label %return, !dbg !522

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !523
  br label %return, !dbg !523

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !525
  br label %return, !dbg !525

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !527
  ret i16 %14, !dbg !527
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !528 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !531, metadata !DIExpression()), !dbg !532
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !533, metadata !DIExpression()), !dbg !534
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !535, metadata !DIExpression()), !dbg !536
  store i32 0, i32* %u32Temp, align 4, !dbg !536
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !537
  %conv = zext i16 %0 to i32, !dbg !537
  %cmp = icmp eq i32 %conv, 0, !dbg !539
  br i1 %cmp, label %if.then, label %if.else, !dbg !540

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !541
  br label %return, !dbg !541

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !543
  %conv2 = zext i16 %1 to i32, !dbg !543
  %shl = shl i32 %conv2, 16, !dbg !545
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !546
  %conv3 = zext i16 %2 to i32, !dbg !546
  %shr = ashr i32 %conv3, 1, !dbg !547
  %add = add nsw i32 %shl, %shr, !dbg !548
  store i32 %add, i32* %u32Temp, align 4, !dbg !549
  %3 = load i32, i32* %u32Temp, align 4, !dbg !550
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !551
  %conv4 = zext i16 %4 to i32, !dbg !551
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !552
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !552
  %div = udiv i32 %3, %conv4, !dbg !552, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !553
  %5 = load i32, i32* %u32Temp, align 4, !dbg !554
  %cmp5 = icmp ult i32 %5, 65535, !dbg !556
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !557

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !558
  %and = and i32 %6, 65535, !dbg !560
  %conv8 = trunc i32 %and to i16, !dbg !558
  store i16 %conv8, i16* %retval, align 2, !dbg !561
  br label %return, !dbg !561

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !562
  br label %return, !dbg !562

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !564
  ret i16 %7, !dbg !564
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !565 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !568, metadata !DIExpression()), !dbg !569
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !570, metadata !DIExpression()), !dbg !571
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !572, metadata !DIExpression()), !dbg !573
  store i32 0, i32* %u32Temp1, align 4, !dbg !573
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !574, metadata !DIExpression()), !dbg !575
  store i32 0, i32* %u32Temp2, align 4, !dbg !575
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !576
  %conv = zext i16 %0 to i32, !dbg !576
  %and = and i32 %conv, 65535, !dbg !577
  %conv1 = trunc i32 %and to i16, !dbg !576
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !578
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !579
  %conv2 = zext i16 %1 to i32, !dbg !579
  %cmp = icmp eq i32 %conv2, 0, !dbg !581
  br i1 %cmp, label %if.then, label %if.else, !dbg !582

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !583
  br label %return, !dbg !583

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !585
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !587
  %conv4 = zext i16 %3 to i32, !dbg !587
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !588
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !588
  %div = udiv i32 %2, %conv4, !dbg !588, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !589
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !590
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !591
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !592
  %conv5 = zext i16 %6 to i32, !dbg !592
  %mul = mul i32 %5, %conv5, !dbg !593
  %sub = sub i32 %4, %mul, !dbg !594
  %shl = shl i32 %sub, 1, !dbg !595
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !596
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !597
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !598
  %conv6 = zext i16 %8 to i32, !dbg !598
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !599
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !599
  %div7 = udiv i32 %7, %conv6, !dbg !599, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !600
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !601
  %conv8 = zext i16 %10 to i32, !dbg !601
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !602
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !602
  %div9 = udiv i32 %9, %conv8, !dbg !602, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !603
  store i32 %add, i32* %u32Temp2, align 4, !dbg !604
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !605
  %cmp10 = icmp ult i32 %11, 65535, !dbg !607
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !608

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !609
  %and13 = and i32 %12, 65535, !dbg !611
  %conv14 = trunc i32 %and13 to i16, !dbg !609
  store i16 %conv14, i16* %retval, align 2, !dbg !612
  br label %return, !dbg !612

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !613
  br label %return, !dbg !613

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !615
  ret i16 %13, !dbg !615
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !616 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !619, metadata !DIExpression()), !dbg !620
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !621, metadata !DIExpression()), !dbg !622
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !623, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !625, metadata !DIExpression()), !dbg !626
  store i32 0, i32* %s32Result, align 4, !dbg !626
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !627, metadata !DIExpression()), !dbg !628
  store i32 0, i32* %s32Temp1, align 4, !dbg !628
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !629
  %conv = sext i16 %0 to i32, !dbg !629
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !630
  %conv1 = zext i16 %1 to i32, !dbg !630
  %mul = mul nsw i32 %conv, %conv1, !dbg !631
  store i32 %mul, i32* %s32Result, align 4, !dbg !632
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !633
  %conv2 = sext i16 %2 to i32, !dbg !633
  %cmp = icmp eq i32 %conv2, 0, !dbg !635
  br i1 %cmp, label %if.then, label %if.else7, !dbg !636

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !637
  %cmp4 = icmp slt i32 %3, 0, !dbg !640
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !641

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !642
  br label %return, !dbg !642

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !644
  br label %return, !dbg !644

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !646
  %5 = load i32, i32* %s32Result, align 4, !dbg !648
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !649
  %conv8 = sext i16 %6 to i32, !dbg !649
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !650
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !650
  %div = sdiv i32 %5, %conv8, !dbg !650, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !651
  %conv9 = sext i16 %7 to i32, !dbg !651
  %mul10 = mul nsw i32 %div, %conv9, !dbg !652
  %sub = sub nsw i32 %4, %mul10, !dbg !653
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !654
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !655
  %shl = shl i32 %8, 1, !dbg !656
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !657
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !658
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !659
  %conv11 = sext i16 %10 to i32, !dbg !659
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !660
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !660
  %div12 = sdiv i32 %9, %conv11, !dbg !660, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !661
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !662
  %conv13 = sext i16 %12 to i32, !dbg !662
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !663
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !663
  %div14 = sdiv i32 %11, %conv13, !dbg !663, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !664
  store i32 %add, i32* %s32Result, align 4, !dbg !665
  %13 = load i32, i32* %s32Result, align 4, !dbg !666
  %cmp15 = icmp slt i32 %13, 32767, !dbg !668
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !669

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !670
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !673
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !674

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !675
  %conv21 = trunc i32 %15 to i16, !dbg !677
  store i16 %conv21, i16* %retval, align 2, !dbg !678
  br label %return, !dbg !678

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !679
  br label %return, !dbg !679

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !681
  br label %return, !dbg !681

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !683
  ret i16 %16, !dbg !683
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !684 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !687, metadata !DIExpression()), !dbg !688
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !689, metadata !DIExpression()), !dbg !690
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !691, metadata !DIExpression()), !dbg !692
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !693, metadata !DIExpression()), !dbg !694
  store i32 0, i32* %s32Result, align 4, !dbg !694
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !695, metadata !DIExpression()), !dbg !696
  store i32 0, i32* %s32Temp1, align 4, !dbg !696
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !697
  %conv = zext i16 %0 to i32, !dbg !697
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !698
  %conv1 = sext i16 %1 to i32, !dbg !698
  %mul = mul nsw i32 %conv, %conv1, !dbg !699
  store i32 %mul, i32* %s32Result, align 4, !dbg !700
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !701
  %conv2 = zext i16 %2 to i32, !dbg !701
  %cmp = icmp eq i32 %conv2, 0, !dbg !703
  br i1 %cmp, label %if.then, label %if.else7, !dbg !704

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !705
  %cmp4 = icmp slt i32 %3, 0, !dbg !708
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !709

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !710
  br label %return, !dbg !710

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !712
  br label %return, !dbg !712

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !714
  %5 = load i32, i32* %s32Result, align 4, !dbg !716
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !717
  %conv8 = zext i16 %6 to i32, !dbg !717
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !718
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !718
  %div = sdiv i32 %5, %conv8, !dbg !718, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !719
  %conv9 = zext i16 %7 to i32, !dbg !719
  %mul10 = mul nsw i32 %div, %conv9, !dbg !720
  %sub = sub nsw i32 %4, %mul10, !dbg !721
  %shl = shl i32 %sub, 1, !dbg !722
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !723
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !724
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !725
  %conv11 = zext i16 %9 to i32, !dbg !725
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !726
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !726
  %div12 = sdiv i32 %8, %conv11, !dbg !726, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !727
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !728
  %conv13 = zext i16 %11 to i32, !dbg !728
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !729
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !729
  %div14 = sdiv i32 %10, %conv13, !dbg !729, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !730
  store i32 %add, i32* %s32Result, align 4, !dbg !731
  %12 = load i32, i32* %s32Result, align 4, !dbg !732
  %cmp15 = icmp slt i32 %12, 32767, !dbg !734
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !735

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !736
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !739
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !740

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !741
  %conv21 = trunc i32 %14 to i16, !dbg !743
  store i16 %conv21, i16* %retval, align 2, !dbg !744
  br label %return, !dbg !744

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !745
  br label %return, !dbg !745

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !747
  br label %return, !dbg !747

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !749
  ret i16 %15, !dbg !749
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !750 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !753, metadata !DIExpression()), !dbg !754
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !755, metadata !DIExpression()), !dbg !756
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !757, metadata !DIExpression()), !dbg !758
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !759, metadata !DIExpression()), !dbg !760
  store i32 0, i32* %u32Result, align 4, !dbg !760
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !761, metadata !DIExpression()), !dbg !762
  store i32 0, i32* %u32Temp1, align 4, !dbg !762
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !763, metadata !DIExpression()), !dbg !764
  store i32 0, i32* %s32Result, align 4, !dbg !764
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !765, metadata !DIExpression()), !dbg !766
  store i32 0, i32* %s32Temp1, align 4, !dbg !766
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !767
  %conv = sext i16 %0 to i32, !dbg !767
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !768
  %conv1 = zext i16 %1 to i32, !dbg !768
  %mul = mul nsw i32 %conv, %conv1, !dbg !769
  store i32 %mul, i32* %s32Result, align 4, !dbg !770
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !771
  %conv2 = sext i16 %2 to i32, !dbg !771
  %cmp = icmp eq i32 %conv2, 0, !dbg !773
  br i1 %cmp, label %if.then, label %if.else7, !dbg !774

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !775
  %cmp4 = icmp sge i32 %3, 0, !dbg !778
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !779

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !780
  br label %return, !dbg !780

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !782
  br label %return, !dbg !782

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !784
  %5 = load i32, i32* %s32Result, align 4, !dbg !786
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !787
  %conv8 = sext i16 %6 to i32, !dbg !787
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !788
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !788
  %div = sdiv i32 %5, %conv8, !dbg !788, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !789
  %conv9 = sext i16 %7 to i32, !dbg !789
  %mul10 = mul nsw i32 %div, %conv9, !dbg !790
  %sub = sub nsw i32 %4, %mul10, !dbg !791
  %shl = shl i32 %sub, 1, !dbg !792
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !793
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !794
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !795
  %conv11 = sext i16 %9 to i32, !dbg !795
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !796
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !796
  %div12 = sdiv i32 %8, %conv11, !dbg !796, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !797
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !798
  %conv13 = sext i16 %11 to i32, !dbg !798
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !799
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !799
  %div14 = sdiv i32 %10, %conv13, !dbg !799, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !800
  store i32 %add, i32* %s32Result, align 4, !dbg !801
  %12 = load i32, i32* %s32Result, align 4, !dbg !802
  %cmp15 = icmp slt i32 %12, 65535, !dbg !804
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !805

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !806
  %cmp18 = icmp sgt i32 %13, 0, !dbg !809
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !810

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !811
  %conv21 = trunc i32 %14 to i16, !dbg !813
  store i16 %conv21, i16* %retval, align 2, !dbg !814
  br label %return, !dbg !814

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !815
  br label %return, !dbg !815

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !817
  br label %return, !dbg !817

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !819
  ret i16 %15, !dbg !819
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !820 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !823, metadata !DIExpression()), !dbg !824
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !825, metadata !DIExpression()), !dbg !826
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !827, metadata !DIExpression()), !dbg !828
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !829, metadata !DIExpression()), !dbg !830
  store i32 0, i32* %s32Result, align 4, !dbg !830
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !831, metadata !DIExpression()), !dbg !832
  store i32 0, i32* %s32Temp1, align 4, !dbg !832
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !833
  %conv = sext i16 %0 to i32, !dbg !833
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !834
  %conv1 = zext i16 %1 to i32, !dbg !834
  %mul = mul nsw i32 %conv, %conv1, !dbg !835
  store i32 %mul, i32* %s32Result, align 4, !dbg !836
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !837
  %conv2 = zext i16 %2 to i32, !dbg !837
  %cmp = icmp eq i32 %conv2, 0, !dbg !839
  br i1 %cmp, label %if.then, label %if.else7, !dbg !840

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !841
  %cmp4 = icmp sge i32 %3, 0, !dbg !844
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !845

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !846
  br label %return, !dbg !846

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !848
  br label %return, !dbg !848

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !850
  %5 = load i16, i16* %denominator.addr, align 2, !dbg !853
  %conv8 = zext i16 %5 to i32, !dbg !854
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !855
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !855
  %div = sdiv i32 %4, %conv8, !dbg !855, !klee.check.div !106
  %conv9 = sext i32 %div to i64, !dbg !856
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !857
  %conv10 = zext i16 %6 to i32, !dbg !858
  %conv11 = sext i32 %conv10 to i64, !dbg !859
  %call = call i32 @klee_alarm_s32_mul_upper(i64 %conv9, i64 %conv11), !dbg !860
  %tobool = icmp ne i32 %call, 0, !dbg !860
  br i1 %tobool, label %if.end, label %if.then12, !dbg !861

if.then12:                                        ; preds = %if.else7
  store i16 0, i16* %retval, align 2, !dbg !862
  br label %return, !dbg !862

if.end:                                           ; preds = %if.else7
  %7 = load i32, i32* %s32Result, align 4, !dbg !864
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !866
  %conv13 = zext i16 %8 to i32, !dbg !867
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !868
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !868
  %div14 = sdiv i32 %7, %conv13, !dbg !868, !klee.check.div !106
  %conv15 = sext i32 %div14 to i64, !dbg !869
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !870
  %conv16 = zext i16 %9 to i32, !dbg !871
  %conv17 = sext i32 %conv16 to i64, !dbg !872
  %call18 = call i32 @klee_alarm_s32_mul_lower(i64 %conv15, i64 %conv17), !dbg !873
  %tobool19 = icmp ne i32 %call18, 0, !dbg !873
  br i1 %tobool19, label %if.end21, label %if.then20, !dbg !874

if.then20:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !875
  br label %return, !dbg !875

if.end21:                                         ; preds = %if.end
  %10 = load i32, i32* %s32Result, align 4, !dbg !877
  %conv22 = sext i32 %10 to i64, !dbg !879
  %11 = load i32, i32* %s32Result, align 4, !dbg !880
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !881
  %conv23 = zext i16 %12 to i32, !dbg !882
  %int_cast_to_i642 = zext i32 %conv23 to i64, !dbg !883
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !883
  %div24 = sdiv i32 %11, %conv23, !dbg !883, !klee.check.div !106
  %13 = load i16, i16* %denominator.addr, align 2, !dbg !884
  %conv25 = zext i16 %13 to i32, !dbg !885
  %mul26 = mul nsw i32 %div24, %conv25, !dbg !886
  %conv27 = sext i32 %mul26 to i64, !dbg !887
  %call28 = call i32 @klee_alarm_s32_sub_lower(i64 %conv22, i64 %conv27), !dbg !888
  %tobool29 = icmp ne i32 %call28, 0, !dbg !888
  br i1 %tobool29, label %if.end31, label %if.then30, !dbg !889

if.then30:                                        ; preds = %if.end21
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 807, i8* getelementptr inbounds ([131 x i8], [131 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !890
  unreachable, !dbg !890

if.end31:                                         ; preds = %if.end21
  %14 = load i32, i32* %s32Result, align 4, !dbg !892
  %15 = load i32, i32* %s32Result, align 4, !dbg !893
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !894
  %conv32 = zext i16 %16 to i32, !dbg !895
  %int_cast_to_i643 = zext i32 %conv32 to i64, !dbg !896
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !896
  %div33 = sdiv i32 %15, %conv32, !dbg !896, !klee.check.div !106
  %17 = load i16, i16* %denominator.addr, align 2, !dbg !897
  %conv34 = zext i16 %17 to i32, !dbg !898
  %mul35 = mul nsw i32 %div33, %conv34, !dbg !899
  %sub = sub nsw i32 %14, %mul35, !dbg !900
  %conv36 = sext i32 %sub to i64, !dbg !901
  store volatile i64 %conv36, i64* @klee_alarm_sink_s64, align 8, !dbg !902
  store i16 0, i16* %retval, align 2, !dbg !903
  br label %return, !dbg !903

return:                                           ; preds = %if.end31, %if.then20, %if.then12, %if.else, %if.then6
  %18 = load i16, i16* %retval, align 2, !dbg !904
  ret i16 %18, !dbg !904
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !905 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !908, metadata !DIExpression()), !dbg !909
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !910, metadata !DIExpression()), !dbg !911
  %0 = load i64, i64* %left.addr, align 8, !dbg !912
  %1 = load i64, i64* %right.addr, align 8, !dbg !913
  %mul = mul nsw i64 %0, %1, !dbg !914
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !915
  %conv = zext i1 %cmp to i32, !dbg !915
  ret i32 %conv, !dbg !916
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !917 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !918, metadata !DIExpression()), !dbg !919
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !920, metadata !DIExpression()), !dbg !921
  %0 = load i64, i64* %left.addr, align 8, !dbg !922
  %1 = load i64, i64* %right.addr, align 8, !dbg !923
  %mul = mul nsw i64 %0, %1, !dbg !924
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !925
  %conv = zext i1 %cmp to i32, !dbg !925
  ret i32 %conv, !dbg !926
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_sub_lower(i64 %left, i64 %right) #0 !dbg !927 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !928, metadata !DIExpression()), !dbg !929
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !930, metadata !DIExpression()), !dbg !931
  %0 = load i64, i64* %left.addr, align 8, !dbg !932
  %1 = load i64, i64* %right.addr, align 8, !dbg !933
  %sub = sub nsw i64 %0, %1, !dbg !934
  %cmp = icmp sge i64 %sub, -2147483648, !dbg !935
  %conv = zext i1 %cmp to i32, !dbg !935
  ret i32 %conv, !dbg !936
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !937 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !940, metadata !DIExpression()), !dbg !941
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !942, metadata !DIExpression()), !dbg !943
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !944, metadata !DIExpression()), !dbg !945
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !946, metadata !DIExpression()), !dbg !947
  store i32 0, i32* %u32Temp1, align 4, !dbg !947
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !948, metadata !DIExpression()), !dbg !949
  store i16 0, i16* %u16TempDenom, align 2, !dbg !949
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !950
  %conv = zext i16 %0 to i32, !dbg !950
  %cmp = icmp eq i32 %conv, 0, !dbg !952
  br i1 %cmp, label %if.then, label %if.else, !dbg !953

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !954
  br label %return, !dbg !954

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !956
  %conv2 = zext i16 %1 to i32, !dbg !956
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !958
  %conv3 = zext i16 %2 to i32, !dbg !958
  %mul = mul nsw i32 %conv2, %conv3, !dbg !959
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !960
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !961
  %conv4 = zext i16 %3 to i32, !dbg !961
  %shr = ashr i32 %conv4, 1, !dbg !962
  %conv5 = trunc i32 %shr to i16, !dbg !961
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !963
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !964
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !965
  %conv6 = zext i16 %5 to i32, !dbg !965
  %add = add i32 %4, %conv6, !dbg !966
  store i32 %add, i32* %u32Temp1, align 4, !dbg !967
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !968
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !969
  %conv7 = zext i16 %7 to i32, !dbg !969
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !970
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !970
  %div = udiv i32 %6, %conv7, !dbg !970, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !971
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !972
  %cmp8 = icmp ult i32 %8, 65535, !dbg !974
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !975

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !976
  %and = and i32 %9, 65535, !dbg !978
  %conv11 = trunc i32 %and to i16, !dbg !979
  store i16 %conv11, i16* %retval, align 2, !dbg !980
  br label %return, !dbg !980

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !981
  br label %return, !dbg !981

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !983
  ret i16 %10, !dbg !983
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !984 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !987, metadata !DIExpression()), !dbg !988
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !989, metadata !DIExpression()), !dbg !990
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !991, metadata !DIExpression()), !dbg !992
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !993, metadata !DIExpression()), !dbg !994
  store i32 0, i32* %u32Temp1, align 4, !dbg !994
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !995
  %cmp = icmp eq i32 %0, 0, !dbg !997
  br i1 %cmp, label %if.then, label %if.else, !dbg !998

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !999
  br label %return, !dbg !999

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1001
  %conv = zext i16 %1 to i32, !dbg !1001
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1003
  %conv1 = zext i16 %2 to i32, !dbg !1003
  %mul = mul nsw i32 %conv, %conv1, !dbg !1004
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1005
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1006
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1006
  %div = udiv i32 %mul, %3, !dbg !1006, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1007
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1008
  %conv2 = zext i16 %4 to i32, !dbg !1008
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1010
  %conv3 = zext i16 %5 to i32, !dbg !1010
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1011
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1012
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1013
  %mul5 = mul i32 %6, %7, !dbg !1014
  %sub = sub i32 %mul4, %mul5, !dbg !1015
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1016
  %div6 = udiv i32 %8, 2, !dbg !1017
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1018
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1019

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1020
  %inc = add i32 %9, 1, !dbg !1020
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1020
  br label %if.end, !dbg !1022

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1023
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1025
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1026

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1027
  %and = and i32 %11, 65535, !dbg !1029
  %conv13 = trunc i32 %and to i16, !dbg !1030
  store i16 %conv13, i16* %retval, align 2, !dbg !1031
  br label %return, !dbg !1031

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1032
  br label %return, !dbg !1032

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1034
  ret i16 %12, !dbg !1034
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1035 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1038, metadata !DIExpression()), !dbg !1039
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1040, metadata !DIExpression()), !dbg !1041
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1042, metadata !DIExpression()), !dbg !1043
  store i32 0, i32* %u32Temp1, align 4, !dbg !1043
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1044
  %conv = zext i16 %0 to i32, !dbg !1044
  %cmp = icmp eq i32 %conv, 0, !dbg !1046
  br i1 %cmp, label %if.then, label %if.else, !dbg !1047

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1048
  br label %return, !dbg !1048

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1050
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1052
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1053
  %conv2 = zext i16 %3 to i32, !dbg !1053
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1054
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1054
  %div = udiv i32 %2, %conv2, !dbg !1054, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1055
  %conv3 = zext i16 %4 to i32, !dbg !1055
  %mul = mul i32 %div, %conv3, !dbg !1056
  %sub = sub i32 %1, %mul, !dbg !1057
  %shl = shl i32 %sub, 1, !dbg !1058
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1059
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1060
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1061
  %conv4 = zext i16 %6 to i32, !dbg !1061
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1062
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1062
  %div5 = udiv i32 %5, %conv4, !dbg !1062, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1063
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1064
  %conv6 = zext i16 %8 to i32, !dbg !1064
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1065
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1065
  %div7 = udiv i32 %7, %conv6, !dbg !1065, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1066
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1067
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1068
  store i32 %9, i32* %retval, align 4, !dbg !1069
  br label %return, !dbg !1069

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1070
  ret i32 %10, !dbg !1070
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1071 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1074, metadata !DIExpression()), !dbg !1075
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1076, metadata !DIExpression()), !dbg !1077
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1078, metadata !DIExpression()), !dbg !1079
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1080, metadata !DIExpression()), !dbg !1081
  store i32 0, i32* %s32Temp1, align 4, !dbg !1081
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1082, metadata !DIExpression()), !dbg !1083
  store i32 0, i32* %s32Temp2, align 4, !dbg !1083
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1084, metadata !DIExpression()), !dbg !1085
  store i32 0, i32* %s32Temp3, align 4, !dbg !1085
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1086
  %conv = sext i16 %0 to i32, !dbg !1086
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1087
  %conv1 = sext i16 %1 to i32, !dbg !1087
  %mul = mul nsw i32 %conv, %conv1, !dbg !1088
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1089
  %2 = load i16, i16* %div.addr, align 2, !dbg !1090
  %conv2 = sext i16 %2 to i32, !dbg !1090
  %cmp = icmp eq i32 %conv2, 0, !dbg !1092
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1093

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1094
  %cmp4 = icmp slt i32 %3, 0, !dbg !1097
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1098

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1099
  br label %return, !dbg !1099

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1101
  br label %return, !dbg !1101

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1103
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1105
  %6 = load i16, i16* %div.addr, align 2, !dbg !1106
  %conv8 = sext i16 %6 to i32, !dbg !1106
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1107
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1107
  %div9 = sdiv i32 %5, %conv8, !dbg !1107, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1108
  %conv10 = sext i16 %7 to i32, !dbg !1108
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1109
  %sub = sub nsw i32 %4, %mul11, !dbg !1110
  %shl = shl i32 %sub, 1, !dbg !1111
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1112
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1113
  %9 = load i16, i16* %div.addr, align 2, !dbg !1114
  %conv12 = sext i16 %9 to i32, !dbg !1114
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1115
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1115
  %div13 = sdiv i32 %8, %conv12, !dbg !1115, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1116
  %11 = load i16, i16* %div.addr, align 2, !dbg !1117
  %conv14 = sext i16 %11 to i32, !dbg !1117
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1118
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1118
  %div15 = sdiv i32 %10, %conv14, !dbg !1118, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1119
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1120
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1121
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1123
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1124

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1125
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1128
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1129

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1130
  %conv22 = trunc i32 %14 to i16, !dbg !1132
  store i16 %conv22, i16* %retval, align 2, !dbg !1133
  br label %return, !dbg !1133

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1134
  br label %return, !dbg !1134

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1136
  br label %return, !dbg !1136

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1138
  ret i16 %15, !dbg !1138
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1139 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1142, metadata !DIExpression()), !dbg !1143
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1144, metadata !DIExpression()), !dbg !1145
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1146, metadata !DIExpression()), !dbg !1147
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1148, metadata !DIExpression()), !dbg !1149
  store i32 0, i32* %s32Result, align 4, !dbg !1149
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1150, metadata !DIExpression()), !dbg !1151
  store i32 0, i32* %s32Temp1, align 4, !dbg !1151
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1152
  %conv = sext i16 %0 to i32, !dbg !1152
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1153
  %conv1 = sext i16 %1 to i32, !dbg !1153
  %mul = mul nsw i32 %conv, %conv1, !dbg !1154
  store i32 %mul, i32* %s32Result, align 4, !dbg !1155
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1156
  %conv2 = zext i16 %2 to i32, !dbg !1156
  %cmp = icmp eq i32 %conv2, 0, !dbg !1158
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1159

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1160
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1163
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1164

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1165
  br label %return, !dbg !1165

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1167
  %cmp7 = icmp eq i32 %4, 0, !dbg !1169
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1170

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1171
  br label %return, !dbg !1171

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1173
  br label %return, !dbg !1173

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1175
  %6 = load i32, i32* %s32Result, align 4, !dbg !1177
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1178
  %conv12 = zext i16 %7 to i32, !dbg !1178
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1179
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1179
  %div = sdiv i32 %6, %conv12, !dbg !1179, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1180
  %conv13 = zext i16 %8 to i32, !dbg !1180
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1181
  %sub = sub nsw i32 %5, %mul14, !dbg !1182
  %shl = shl i32 %sub, 1, !dbg !1183
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1184
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1185
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1186
  %conv15 = zext i16 %10 to i32, !dbg !1186
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1187
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1187
  %div16 = sdiv i32 %9, %conv15, !dbg !1187, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1188
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1189
  %conv17 = zext i16 %12 to i32, !dbg !1189
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1190
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1190
  %div18 = sdiv i32 %11, %conv17, !dbg !1190, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1191
  store i32 %add, i32* %s32Result, align 4, !dbg !1192
  %13 = load i32, i32* %s32Result, align 4, !dbg !1193
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1195
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1196

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1197
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1200
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1201

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1202
  %conv25 = trunc i32 %15 to i16, !dbg !1204
  store i16 %conv25, i16* %retval, align 2, !dbg !1205
  br label %return, !dbg !1205

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1206
  br label %return, !dbg !1206

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1208
  br label %return, !dbg !1208

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1210
  ret i16 %16, !dbg !1210
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1211 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1214, metadata !DIExpression()), !dbg !1215
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1216, metadata !DIExpression()), !dbg !1217
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1218, metadata !DIExpression()), !dbg !1219
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1220
  %cmp = icmp eq i32 %0, 0, !dbg !1222
  br i1 %cmp, label %if.then, label %if.else, !dbg !1223

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1224
  br label %return, !dbg !1224

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1226
  %cmp1 = icmp sle i32 %1, 0, !dbg !1229
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1230

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1231
  br label %return, !dbg !1231

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1233
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1235
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1236
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1237
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1237
  %div = udiv i32 %3, %4, !dbg !1237, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1238
  %mul = mul i32 %div, %5, !dbg !1239
  %sub = sub i32 %2, %mul, !dbg !1240
  %shl = shl i32 %sub, 1, !dbg !1241
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1242
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1243
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1244
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1245
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1245
  %div4 = udiv i32 %6, %7, !dbg !1245, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1246
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1247
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1248
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1248
  %div5 = udiv i32 %8, %9, !dbg !1248, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1249
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1250
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1251
  store i32 %10, i32* %retval, align 4, !dbg !1252
  br label %return, !dbg !1252

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1253
  ret i32 %11, !dbg !1253
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1254 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1257, metadata !DIExpression()), !dbg !1258
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1259, metadata !DIExpression()), !dbg !1260
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1261, metadata !DIExpression()), !dbg !1262
  store i32 0, i32* %s32Temp1, align 4, !dbg !1262
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1263
  %cmp = icmp eq i32 %0, 0, !dbg !1265
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1266

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1267
  %cmp1 = icmp sge i32 %1, 0, !dbg !1270
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1271

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1272
  br label %return, !dbg !1272

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1274
  br label %return, !dbg !1274

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1276
  %cmp4 = icmp sge i32 %2, 0, !dbg !1279
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1280

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1281
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1283
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1284
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1285
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1285
  %div = udiv i32 %4, %5, !dbg !1285, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1286
  %mul = mul i32 %div, %6, !dbg !1287
  %sub = sub i32 %3, %mul, !dbg !1288
  %shl = shl i32 %sub, 1, !dbg !1289
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1290
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1291
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1292
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1293
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1293
  %div6 = udiv i32 %7, %8, !dbg !1293, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1294
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1295
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1296
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1296
  %div7 = udiv i32 %9, %10, !dbg !1296, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1297
  store i32 %add, i32* %retval, align 4, !dbg !1298
  br label %return, !dbg !1298

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1299
  br label %return, !dbg !1299

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1301
  ret i32 %11, !dbg !1301
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1302 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1305, metadata !DIExpression()), !dbg !1306
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1307, metadata !DIExpression()), !dbg !1308
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1309, metadata !DIExpression()), !dbg !1310
  store i32 0, i32* %u32Temp1, align 4, !dbg !1310
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1311, metadata !DIExpression()), !dbg !1312
  store i32 0, i32* %u32Temp2, align 4, !dbg !1312
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1313
  %cmp = icmp eq i32 %0, 0, !dbg !1315
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1316

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1317
  %cmp1 = icmp slt i32 %1, 0, !dbg !1320
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1321

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1322
  br label %return, !dbg !1322

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1324
  br label %return, !dbg !1324

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1326
  %cmp4 = icmp sge i32 %2, 0, !dbg !1329
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1330

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1331
  %cmp6 = icmp eq i32 %3, 0, !dbg !1334
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1335

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1336
  br label %return, !dbg !1336

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1338
  %cmp9 = icmp sle i32 %4, 0, !dbg !1341
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1342

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1343
  br label %return, !dbg !1343

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1345
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1347
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1348
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1349
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1349
  %div = sdiv i32 %6, %7, !dbg !1349, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1350
  %mul = mul nsw i32 %div, %8, !dbg !1351
  %sub = sub nsw i32 %5, %mul, !dbg !1352
  %shl = shl i32 %sub, 1, !dbg !1353
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1354
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1355
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1356
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1357
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1357
  %div12 = udiv i32 %9, %10, !dbg !1357, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1358
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1359
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1360
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1360
  %div13 = sdiv i32 %11, %12, !dbg !1360, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1361
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1362
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1363
  store i32 %13, i32* %retval, align 4, !dbg !1364
  br label %return, !dbg !1364

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1365
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1368
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1369

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1370
  br label %return, !dbg !1370

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1372
  %sub18 = sub nsw i32 0, %15, !dbg !1374
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1375
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1376
  %sub19 = sub nsw i32 0, %16, !dbg !1377
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1378
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1379
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1380
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1381
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1382
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1382
  %div20 = sdiv i32 %18, %19, !dbg !1382, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1383
  %mul21 = mul nsw i32 %div20, %20, !dbg !1384
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1385
  %shl23 = shl i32 %sub22, 1, !dbg !1386
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1387
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1388
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1389
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1390
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1390
  %div24 = udiv i32 %21, %22, !dbg !1390, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1391
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1392
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1393
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1393
  %div25 = sdiv i32 %23, %24, !dbg !1393, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1394
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1395
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1396
  store i32 %25, i32* %retval, align 4, !dbg !1397
  br label %return, !dbg !1397

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1398
  ret i32 %26, !dbg !1398
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1399 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1402, metadata !DIExpression()), !dbg !1403
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1404, metadata !DIExpression()), !dbg !1405
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1406, metadata !DIExpression()), !dbg !1407
  store i32 0, i32* %u32Temp1, align 4, !dbg !1407
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1408, metadata !DIExpression()), !dbg !1409
  store i32 0, i32* %u32Temp2, align 4, !dbg !1409
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1410, metadata !DIExpression()), !dbg !1411
  store i32 0, i32* %u32Temp3, align 4, !dbg !1411
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1412, metadata !DIExpression()), !dbg !1413
  store i32 0, i32* %numerator_old, align 4, !dbg !1413
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1414
  %cmp = icmp eq i32 %0, 0, !dbg !1416
  br i1 %cmp, label %if.then, label %if.else, !dbg !1417

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1418
  br label %return, !dbg !1418

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1420
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1422
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1423
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1424
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1425
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1425
  %div = udiv i32 %3, %4, !dbg !1425, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1426
  %sub = sub i32 %1, %mul, !dbg !1427
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1428
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1429
  %and = and i32 %5, 1, !dbg !1431
  %cmp1 = icmp eq i32 %and, 0, !dbg !1432
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1433

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1434
  %shr = lshr i32 %6, 1, !dbg !1436
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1437
  br label %if.end, !dbg !1438

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1439
  %shr4 = lshr i32 %7, 1, !dbg !1441
  %add = add i32 %shr4, 1, !dbg !1442
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1443
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1444
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1446
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1447
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1448

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1449
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1451
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1452
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1452
  %div7 = udiv i32 %10, %11, !dbg !1452, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1453
  br label %return, !dbg !1453

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1454
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1456
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1457
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1457
  %div9 = udiv i32 %12, %13, !dbg !1457, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1458
  store i32 %add10, i32* %retval, align 4, !dbg !1459
  br label %return, !dbg !1459

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1460
  ret i32 %14, !dbg !1460
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1461 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1464, metadata !DIExpression()), !dbg !1465
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1466, metadata !DIExpression()), !dbg !1467
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1468, metadata !DIExpression()), !dbg !1469
  store i32 0, i32* %u32Temp1, align 4, !dbg !1469
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1470, metadata !DIExpression()), !dbg !1471
  store i32 0, i32* %u32Temp2, align 4, !dbg !1471
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1472
  %cmp = icmp sle i32 %0, 0, !dbg !1474
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1475

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1476
  %cmp1 = icmp sge i32 %1, 0, !dbg !1479
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1480

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1481
  br label %return, !dbg !1481

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1483
  %sub = sub nsw i32 0, %2, !dbg !1485
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1486
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1487
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1488
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1489
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1490
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1490
  %div = udiv i32 %4, %5, !dbg !1490, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1491
  %mul = mul i32 %div, %6, !dbg !1492
  %sub3 = sub i32 %3, %mul, !dbg !1493
  %shl = shl i32 %sub3, 1, !dbg !1494
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1495
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1496
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1497
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1498
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1498
  %div4 = udiv i32 %7, %8, !dbg !1498, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1499
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1500
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1501
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1501
  %div5 = udiv i32 %9, %10, !dbg !1501, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1502
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1503
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1504
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1506
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1507

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1508
  %sub8 = sub i32 0, %12, !dbg !1510
  store i32 %sub8, i32* %retval, align 4, !dbg !1511
  br label %return, !dbg !1511

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1512
  br label %return, !dbg !1512

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1514
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1516
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1517
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1518
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1518
  %div11 = udiv i32 %14, %15, !dbg !1518, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1519
  %mul12 = mul i32 %div11, %16, !dbg !1520
  %sub13 = sub i32 %13, %mul12, !dbg !1521
  %shl14 = shl i32 %sub13, 1, !dbg !1522
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1523
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1524
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1525
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1526
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1526
  %div15 = udiv i32 %17, %18, !dbg !1526, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1527
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1528
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1529
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1529
  %div16 = udiv i32 %19, %20, !dbg !1529, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1530
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1531
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1532
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1534
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1535

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1536
  store i32 %22, i32* %retval, align 4, !dbg !1538
  br label %return, !dbg !1538

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1539
  br label %return, !dbg !1539

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1541
  ret i32 %23, !dbg !1541
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1542 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1545, metadata !DIExpression()), !dbg !1546
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1547, metadata !DIExpression()), !dbg !1548
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1549, metadata !DIExpression()), !dbg !1550
  store i32 0, i32* %s32Temp1, align 4, !dbg !1550
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1551, metadata !DIExpression()), !dbg !1552
  store i32 0, i32* %s32Temp2, align 4, !dbg !1552
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1553, metadata !DIExpression()), !dbg !1554
  store i32 0, i32* %u32Temp0, align 4, !dbg !1554
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1555, metadata !DIExpression()), !dbg !1556
  store i32 0, i32* %u32Temp1, align 4, !dbg !1556
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1557, metadata !DIExpression()), !dbg !1558
  store i32 0, i32* %u32Temp2, align 4, !dbg !1558
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1559
  %cmp = icmp eq i32 %0, 0, !dbg !1561
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1562

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1563
  %cmp1 = icmp slt i32 %1, 0, !dbg !1566
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1567

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1568
  br label %return, !dbg !1568

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1570
  br label %return, !dbg !1570

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1572
  %cmp4 = icmp sle i32 %2, 0, !dbg !1575
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1576

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1577
  %sub = sub nsw i32 0, %3, !dbg !1579
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1580
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1581
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1582
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1583
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1583
  %div = udiv i32 %4, %5, !dbg !1583, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1584
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1585
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1586
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1587
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1588
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1588
  %div6 = udiv i32 %7, %8, !dbg !1588, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1589
  %mul = mul i32 %div6, %9, !dbg !1590
  %sub7 = sub i32 %6, %mul, !dbg !1591
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1592
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1593
  %and = and i32 %10, 1, !dbg !1595
  %cmp8 = icmp eq i32 %and, 0, !dbg !1596
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1597

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1598
  %shr = lshr i32 %11, 1, !dbg !1600
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1601
  br label %if.end, !dbg !1602

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1603
  %shr11 = lshr i32 %12, 1, !dbg !1605
  %add = add i32 %shr11, 1, !dbg !1606
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1607
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1608
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1610
  %cmp12 = icmp ult i32 %13, %14, !dbg !1611
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1612

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1613
  %neg = xor i32 %15, -1, !dbg !1615
  %add14 = add i32 %neg, 1, !dbg !1616
  store i32 %add14, i32* %retval, align 4, !dbg !1617
  br label %return, !dbg !1617

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1618
  %add16 = add i32 %16, 1, !dbg !1620
  %neg17 = xor i32 %add16, -1, !dbg !1621
  %add18 = add i32 %neg17, 1, !dbg !1622
  store i32 %add18, i32* %retval, align 4, !dbg !1623
  br label %return, !dbg !1623

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1624
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1626
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1627
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1628
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1628
  %div20 = udiv i32 %18, %19, !dbg !1628, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1629
  %mul21 = mul i32 %div20, %20, !dbg !1630
  %sub22 = sub i32 %17, %mul21, !dbg !1631
  %shl = shl i32 %sub22, 1, !dbg !1632
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1633
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1634
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1635
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1636
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1636
  %div23 = udiv i32 %21, %22, !dbg !1636, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1637
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1638
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1639
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1639
  %div24 = udiv i32 %23, %24, !dbg !1639, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1640
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1641
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1642
  store i32 %25, i32* %retval, align 4, !dbg !1643
  br label %return, !dbg !1643

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1644
  ret i32 %26, !dbg !1644
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1645 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1648, metadata !DIExpression()), !dbg !1649
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1650, metadata !DIExpression()), !dbg !1651
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1652, metadata !DIExpression()), !dbg !1653
  store i32 0, i32* %s32Temp1, align 4, !dbg !1653
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1654, metadata !DIExpression()), !dbg !1655
  store i32 0, i32* %s32Temp2, align 4, !dbg !1655
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1656, metadata !DIExpression()), !dbg !1657
  store i32 0, i32* %denominator_prime, align 4, !dbg !1657
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1658, metadata !DIExpression()), !dbg !1659
  store i32 0, i32* %u32Temp1, align 4, !dbg !1659
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1660, metadata !DIExpression()), !dbg !1661
  store i32 0, i32* %u32Temp2, align 4, !dbg !1661
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1662, metadata !DIExpression()), !dbg !1663
  store i32 0, i32* %u32numerator, align 4, !dbg !1663
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1664, metadata !DIExpression()), !dbg !1665
  store i32 0, i32* %u32denominator, align 4, !dbg !1665
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1666
  %cmp = icmp slt i32 %0, 0, !dbg !1668
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1669

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1670
  %cmp1 = icmp sle i32 %1, 0, !dbg !1673
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1674

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1675
  %cmp3 = icmp sge i32 %2, 0, !dbg !1678
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1679

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1680
  br label %return, !dbg !1680

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1682
  %sub = sub nsw i32 0, %3, !dbg !1684
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1685
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1686
  %sub5 = sub nsw i32 0, %4, !dbg !1687
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1688
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1689
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1690
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1691
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1692
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1692
  %div = udiv i32 %6, %7, !dbg !1692, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1693
  %mul = mul i32 %div, %8, !dbg !1694
  %sub6 = sub i32 %5, %mul, !dbg !1695
  %shl = shl i32 %sub6, 1, !dbg !1696
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1697
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1698
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1699
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1700
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1700
  %div7 = udiv i32 %9, %10, !dbg !1700, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1701
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1702
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1703
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1703
  %div8 = udiv i32 %11, %12, !dbg !1703, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1704
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1705
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1706
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1708
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1709

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1710
  store i32 %14, i32* %retval, align 4, !dbg !1712
  br label %return, !dbg !1712

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1713
  br label %return, !dbg !1713

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1715
  %neg = xor i32 %15, -1, !dbg !1717
  %add13 = add nsw i32 %neg, 1, !dbg !1718
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1719
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1720
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1721
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1722
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1723
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1723
  %div14 = udiv i32 %17, %18, !dbg !1723, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1724
  %mul15 = mul i32 %div14, %19, !dbg !1725
  %sub16 = sub i32 %16, %mul15, !dbg !1726
  %shl17 = shl i32 %sub16, 1, !dbg !1727
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1728
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1729
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1730
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1731
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1731
  %div18 = udiv i32 %20, %21, !dbg !1731, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1732
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1733
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1734
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1734
  %div19 = sdiv i32 %22, %23, !dbg !1734, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1735
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1736
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1737
  %neg21 = xor i32 %24, -1, !dbg !1738
  %add22 = add nsw i32 %neg21, 1, !dbg !1739
  store i32 %add22, i32* %retval, align 4, !dbg !1740
  br label %return, !dbg !1740

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1741
  %cmp24 = icmp sle i32 %25, 0, !dbg !1744
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1745

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1746
  %cmp26 = icmp sge i32 %26, 0, !dbg !1749
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1750

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1751
  br label %return, !dbg !1751

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1753
  %neg29 = xor i32 %27, -1, !dbg !1755
  %add30 = add nsw i32 %neg29, 1, !dbg !1756
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1757
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1758
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1759
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1760
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1761
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1761
  %div31 = udiv i32 %29, %30, !dbg !1761, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1762
  %mul32 = mul i32 %div31, %31, !dbg !1763
  %sub33 = sub i32 %28, %mul32, !dbg !1764
  %shl34 = shl i32 %sub33, 1, !dbg !1765
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1766
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1767
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1768
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1769
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1769
  %div35 = udiv i32 %32, %33, !dbg !1769, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1770
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1771
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1772
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1772
  %div36 = udiv i32 %34, %35, !dbg !1772, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1773
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1774
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1775
  %neg38 = xor i32 %36, -1, !dbg !1776
  %add39 = add nsw i32 %neg38, 1, !dbg !1777
  store i32 %add39, i32* %retval, align 4, !dbg !1778
  br label %return, !dbg !1778

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1779
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1781
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1782
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1783
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1783
  %div41 = sdiv i32 %38, %39, !dbg !1783, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1784
  %mul42 = mul nsw i32 %div41, %40, !dbg !1785
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1786
  %shl44 = shl i32 %sub43, 1, !dbg !1787
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1788
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1789
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1790
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1791
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1791
  %div45 = sdiv i32 %41, %42, !dbg !1791, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1792
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1793
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1794
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1794
  %div46 = udiv i32 %43, %44, !dbg !1794, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1795
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1796
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1797
  store i32 %45, i32* %retval, align 4, !dbg !1798
  br label %return, !dbg !1798

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1799
  ret i32 %46, !dbg !1799
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1800 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1803, metadata !DIExpression()), !dbg !1804
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1805, metadata !DIExpression()), !dbg !1806
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1807, metadata !DIExpression()), !dbg !1808
  store i32 0, i32* %numerator_prime, align 4, !dbg !1808
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1809, metadata !DIExpression()), !dbg !1810
  store i32 0, i32* %u32Temp1, align 4, !dbg !1810
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1811, metadata !DIExpression()), !dbg !1812
  store i32 0, i32* %u32Temp2, align 4, !dbg !1812
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1813, metadata !DIExpression()), !dbg !1814
  store i32 0, i32* %u32Temp3, align 4, !dbg !1814
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1815, metadata !DIExpression()), !dbg !1816
  store i32 0, i32* %s32Temp1, align 4, !dbg !1816
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1817, metadata !DIExpression()), !dbg !1818
  store i32 0, i32* %s32Temp2, align 4, !dbg !1818
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1819, metadata !DIExpression()), !dbg !1820
  store i32 0, i32* %s32Temp3, align 4, !dbg !1820
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1821
  %cmp = icmp eq i32 %0, 0, !dbg !1823
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1824

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1825
  %cmp1 = icmp slt i32 %1, 0, !dbg !1828
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1829

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1830
  br label %return, !dbg !1830

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1832
  br label %return, !dbg !1832

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1834
  %cmp4 = icmp slt i32 %2, 0, !dbg !1837
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1838

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1839
  %sub = sub nsw i32 0, %3, !dbg !1841
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1842
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1843
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1844
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1845
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1845
  %div = udiv i32 %4, %5, !dbg !1845, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1846
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1847
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1848
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1849
  %mul = mul i32 %7, %8, !dbg !1850
  %sub6 = sub i32 %6, %mul, !dbg !1851
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1852
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1853
  %and = and i32 %9, 1, !dbg !1855
  %cmp7 = icmp eq i32 %and, 0, !dbg !1856
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1857

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1858
  %shr = lshr i32 %10, 1, !dbg !1860
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1861
  br label %if.end, !dbg !1862

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1863
  %shr10 = lshr i32 %11, 1, !dbg !1865
  %add = add i32 %shr10, 1, !dbg !1866
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1867
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1868
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1870
  %cmp11 = icmp ult i32 %12, %13, !dbg !1871
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1872

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1873
  %neg = xor i32 %14, -1, !dbg !1875
  %add13 = add i32 %neg, 1, !dbg !1876
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1877
  br label %if.end18, !dbg !1878

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1879
  %add15 = add i32 %15, 1, !dbg !1881
  %neg16 = xor i32 %add15, -1, !dbg !1882
  %add17 = add i32 %neg16, 1, !dbg !1883
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1884
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1885
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1887
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1888

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1889
  %conv = trunc i32 %17 to i16, !dbg !1891
  store i16 %conv, i16* %retval, align 2, !dbg !1892
  br label %return, !dbg !1892

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1893
  br label %return, !dbg !1893

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1895
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1897
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1898
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1898
  %div23 = udiv i32 %18, %19, !dbg !1898, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1899
  %mul24 = mul i32 %div23, %20, !dbg !1900
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1901
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1902
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1903
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1904
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1905
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1905
  %div25 = udiv i32 %22, %23, !dbg !1905, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1906
  %mul26 = mul i32 %div25, %24, !dbg !1907
  %sub27 = sub i32 %21, %mul26, !dbg !1908
  %shl = shl i32 %sub27, 1, !dbg !1909
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1910
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1911
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1912
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1913
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1913
  %div28 = udiv i32 %25, %26, !dbg !1913, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1914
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1915
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1916
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1916
  %div29 = udiv i32 %27, %28, !dbg !1916, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !1917
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1918
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1919
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1921
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1922

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1923
  %conv34 = trunc i32 %30 to i16, !dbg !1925
  store i16 %conv34, i16* %retval, align 2, !dbg !1926
  br label %return, !dbg !1926

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1927
  br label %return, !dbg !1927

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1929
  ret i16 %31, !dbg !1929
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1930 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1936, metadata !DIExpression()), !dbg !1937
  %2 = icmp eq i64 %0, 0, !dbg !1938
  br i1 %2, label %3, label %4, !dbg !1940

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1941
  unreachable, !dbg !1941

4:                                                ; preds = %1
  ret void, !dbg !1942
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!32, !2, !34}
!llvm.ident = !{!36, !36, !37}
!llvm.module.flags = !{!38, !39, !40, !41, !42}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !30, line: 21, type: !31, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !29, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0139/div_Ccode_alarm_0139.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0139")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0139")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !9, line: 25, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !11, line: 39, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !7, line: 6, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !15, line: 24, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 38, baseType: !17)
!17 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !7, line: 8, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !15, line: 25, baseType: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 40, baseType: !21)
!21 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !24)
!24 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !28)
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !{!0}
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0139")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0139/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0139")
!34 = distinct !DICompileUnit(language: DW_LANG_C89, file: !35, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!36 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!37 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!38 = !{i32 7, !"Dwarf Version", i32 4}
!39 = !{i32 2, !"Debug Info Version", i32 3}
!40 = !{i32 1, !"wchar_size", i32 4}
!41 = !{i32 7, !"uwtable", i32 1}
!42 = !{i32 7, !"frame-pointer", i32 2}
!43 = distinct !DISubprogram(name: "main", scope: !44, file: !44, line: 7, type: !45, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !4)
!44 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0139")
!45 = !DISubroutineType(types: !46)
!46 = !{!28}
!47 = !DILocalVariable(name: "factor1", scope: !43, file: !44, line: 9, type: !8)
!48 = !DILocation(line: 9, column: 13, scope: !43)
!49 = !DILocalVariable(name: "factor2", scope: !43, file: !44, line: 10, type: !19)
!50 = !DILocation(line: 10, column: 14, scope: !43)
!51 = !DILocalVariable(name: "denominator", scope: !43, file: !44, line: 11, type: !19)
!52 = !DILocation(line: 11, column: 14, scope: !43)
!53 = !DILocalVariable(name: "result", scope: !43, file: !44, line: 12, type: !19)
!54 = !DILocation(line: 12, column: 14, scope: !43)
!55 = !DILocation(line: 14, column: 24, scope: !43)
!56 = !DILocation(line: 14, column: 5, scope: !43)
!57 = !DILocation(line: 15, column: 24, scope: !43)
!58 = !DILocation(line: 15, column: 5, scope: !43)
!59 = !DILocation(line: 16, column: 24, scope: !43)
!60 = !DILocation(line: 16, column: 5, scope: !43)
!61 = !DILocation(line: 18, column: 38, scope: !43)
!62 = !DILocation(line: 18, column: 47, scope: !43)
!63 = !DILocation(line: 18, column: 56, scope: !43)
!64 = !DILocation(line: 18, column: 14, scope: !43)
!65 = !DILocation(line: 18, column: 12, scope: !43)
!66 = !DILocation(line: 20, column: 11, scope: !43)
!67 = !DILocation(line: 21, column: 5, scope: !43)
!68 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !69, file: !69, line: 170, type: !70, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0139")
!70 = !DISubroutineType(types: !71)
!71 = !{!6, !6, !6}
!72 = !DILocalVariable(name: "numerator", arg: 1, scope: !68, file: !69, line: 170, type: !6)
!73 = !DILocation(line: 170, column: 31, scope: !68)
!74 = !DILocalVariable(name: "denominator", arg: 2, scope: !68, file: !69, line: 170, type: !6)
!75 = !DILocation(line: 170, column: 47, scope: !68)
!76 = !DILocalVariable(name: "s32Temp1", scope: !68, file: !69, line: 172, type: !25)
!77 = !DILocation(line: 172, column: 6, scope: !68)
!78 = !DILocalVariable(name: "s32Temp2", scope: !68, file: !69, line: 172, type: !25)
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
!188 = !{!6, !25, !6}
!189 = !DILocalVariable(name: "numerator", arg: 1, scope: !186, file: !69, line: 255, type: !25)
!190 = !DILocation(line: 255, column: 25, scope: !186)
!191 = !DILocalVariable(name: "denominator", arg: 2, scope: !186, file: !69, line: 255, type: !6)
!192 = !DILocation(line: 255, column: 41, scope: !186)
!193 = !DILocalVariable(name: "s32Temp1", scope: !186, file: !69, line: 257, type: !25)
!194 = !DILocation(line: 257, column: 6, scope: !186)
!195 = !DILocalVariable(name: "s32Temp2", scope: !186, file: !69, line: 257, type: !25)
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
!217 = !DILocation(line: 274, column: 16, scope: !218)
!218 = distinct !DILexicalBlock(scope: !213, file: !69, line: 273, column: 3)
!219 = !DILocation(line: 274, column: 28, scope: !218)
!220 = !DILocation(line: 274, column: 37, scope: !218)
!221 = !DILocation(line: 274, column: 36, scope: !218)
!222 = !DILocation(line: 274, column: 52, scope: !218)
!223 = !DILocation(line: 274, column: 50, scope: !218)
!224 = !DILocation(line: 274, column: 25, scope: !218)
!225 = !DILocation(line: 274, column: 65, scope: !218)
!226 = !DILocation(line: 274, column: 13, scope: !218)
!227 = !DILocation(line: 275, column: 15, scope: !218)
!228 = !DILocation(line: 275, column: 24, scope: !218)
!229 = !DILocation(line: 275, column: 23, scope: !218)
!230 = !DILocation(line: 275, column: 13, scope: !218)
!231 = !DILocation(line: 276, column: 15, scope: !218)
!232 = !DILocation(line: 276, column: 27, scope: !218)
!233 = !DILocation(line: 276, column: 38, scope: !218)
!234 = !DILocation(line: 276, column: 37, scope: !218)
!235 = !DILocation(line: 276, column: 24, scope: !218)
!236 = !DILocation(line: 276, column: 13, scope: !218)
!237 = !DILocation(line: 277, column: 7, scope: !238)
!238 = distinct !DILexicalBlock(scope: !218, file: !69, line: 277, column: 7)
!239 = !DILocation(line: 277, column: 16, scope: !238)
!240 = !DILocation(line: 277, column: 7, scope: !218)
!241 = !DILocation(line: 279, column: 8, scope: !242)
!242 = distinct !DILexicalBlock(scope: !243, file: !69, line: 279, column: 8)
!243 = distinct !DILexicalBlock(scope: !238, file: !69, line: 278, column: 4)
!244 = !DILocation(line: 279, column: 17, scope: !242)
!245 = !DILocation(line: 279, column: 8, scope: !243)
!246 = !DILocation(line: 281, column: 18, scope: !247)
!247 = distinct !DILexicalBlock(scope: !242, file: !69, line: 280, column: 5)
!248 = !DILocation(line: 281, column: 13, scope: !247)
!249 = !DILocation(line: 281, column: 6, scope: !247)
!250 = !DILocation(line: 285, column: 6, scope: !251)
!251 = distinct !DILexicalBlock(scope: !242, file: !69, line: 284, column: 5)
!252 = !DILocation(line: 290, column: 5, scope: !253)
!253 = distinct !DILexicalBlock(scope: !238, file: !69, line: 289, column: 4)
!254 = !DILocation(line: 295, column: 7, scope: !255)
!255 = distinct !DILexicalBlock(scope: !256, file: !69, line: 295, column: 7)
!256 = distinct !DILexicalBlock(scope: !213, file: !69, line: 294, column: 3)
!257 = !DILocation(line: 295, column: 19, scope: !255)
!258 = !DILocation(line: 295, column: 7, scope: !256)
!259 = !DILocation(line: 297, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !255, file: !69, line: 296, column: 4)
!261 = !DILocation(line: 297, column: 29, scope: !260)
!262 = !DILocation(line: 297, column: 38, scope: !260)
!263 = !DILocation(line: 297, column: 37, scope: !260)
!264 = !DILocation(line: 297, column: 53, scope: !260)
!265 = !DILocation(line: 297, column: 51, scope: !260)
!266 = !DILocation(line: 297, column: 26, scope: !260)
!267 = !DILocation(line: 297, column: 66, scope: !260)
!268 = !DILocation(line: 297, column: 14, scope: !260)
!269 = !DILocation(line: 298, column: 16, scope: !260)
!270 = !DILocation(line: 298, column: 25, scope: !260)
!271 = !DILocation(line: 298, column: 24, scope: !260)
!272 = !DILocation(line: 298, column: 14, scope: !260)
!273 = !DILocation(line: 299, column: 16, scope: !260)
!274 = !DILocation(line: 299, column: 28, scope: !260)
!275 = !DILocation(line: 299, column: 39, scope: !260)
!276 = !DILocation(line: 299, column: 38, scope: !260)
!277 = !DILocation(line: 299, column: 25, scope: !260)
!278 = !DILocation(line: 299, column: 14, scope: !260)
!279 = !DILocation(line: 300, column: 8, scope: !280)
!280 = distinct !DILexicalBlock(scope: !260, file: !69, line: 300, column: 8)
!281 = !DILocation(line: 300, column: 17, scope: !280)
!282 = !DILocation(line: 300, column: 8, scope: !260)
!283 = !DILocation(line: 302, column: 9, scope: !284)
!284 = distinct !DILexicalBlock(scope: !285, file: !69, line: 302, column: 9)
!285 = distinct !DILexicalBlock(scope: !280, file: !69, line: 301, column: 5)
!286 = !DILocation(line: 302, column: 18, scope: !284)
!287 = !DILocation(line: 302, column: 9, scope: !285)
!288 = !DILocation(line: 304, column: 19, scope: !289)
!289 = distinct !DILexicalBlock(scope: !284, file: !69, line: 303, column: 6)
!290 = !DILocation(line: 304, column: 14, scope: !289)
!291 = !DILocation(line: 304, column: 7, scope: !289)
!292 = !DILocation(line: 308, column: 7, scope: !293)
!293 = distinct !DILexicalBlock(scope: !284, file: !69, line: 307, column: 6)
!294 = !DILocation(line: 313, column: 6, scope: !295)
!295 = distinct !DILexicalBlock(scope: !280, file: !69, line: 312, column: 5)
!296 = !DILocation(line: 319, column: 5, scope: !297)
!297 = distinct !DILexicalBlock(scope: !255, file: !69, line: 318, column: 4)
!298 = !DILocation(line: 325, column: 1, scope: !186)
!299 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 343, type: !300, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!300 = !DISubroutineType(types: !301)
!301 = !{!6, !6, !18}
!302 = !DILocalVariable(name: "numerator", arg: 1, scope: !299, file: !69, line: 343, type: !6)
!303 = !DILocation(line: 343, column: 31, scope: !299)
!304 = !DILocalVariable(name: "denominator", arg: 2, scope: !299, file: !69, line: 343, type: !18)
!305 = !DILocation(line: 343, column: 47, scope: !299)
!306 = !DILocalVariable(name: "u16Temp1", scope: !299, file: !69, line: 345, type: !18)
!307 = !DILocation(line: 345, column: 6, scope: !299)
!308 = !DILocalVariable(name: "s32Temp1", scope: !299, file: !69, line: 346, type: !25)
!309 = !DILocation(line: 346, column: 6, scope: !299)
!310 = !DILocalVariable(name: "s32Temp2", scope: !299, file: !69, line: 346, type: !25)
!311 = !DILocation(line: 346, column: 15, scope: !299)
!312 = !DILocation(line: 347, column: 13, scope: !299)
!313 = !DILocation(line: 347, column: 25, scope: !299)
!314 = !DILocation(line: 347, column: 11, scope: !299)
!315 = !DILocation(line: 348, column: 13, scope: !299)
!316 = !DILocation(line: 348, column: 22, scope: !299)
!317 = !DILocation(line: 348, column: 11, scope: !299)
!318 = !DILocation(line: 349, column: 5, scope: !319)
!319 = distinct !DILexicalBlock(scope: !299, file: !69, line: 349, column: 5)
!320 = !DILocation(line: 349, column: 14, scope: !319)
!321 = !DILocation(line: 349, column: 5, scope: !299)
!322 = !DILocation(line: 351, column: 7, scope: !323)
!323 = distinct !DILexicalBlock(scope: !324, file: !69, line: 351, column: 7)
!324 = distinct !DILexicalBlock(scope: !319, file: !69, line: 350, column: 2)
!325 = !DILocation(line: 351, column: 17, scope: !323)
!326 = !DILocation(line: 351, column: 7, scope: !324)
!327 = !DILocation(line: 353, column: 4, scope: !328)
!328 = distinct !DILexicalBlock(scope: !323, file: !69, line: 352, column: 3)
!329 = !DILocation(line: 357, column: 4, scope: !330)
!330 = distinct !DILexicalBlock(scope: !323, file: !69, line: 356, column: 3)
!331 = !DILocation(line: 362, column: 15, scope: !332)
!332 = distinct !DILexicalBlock(scope: !319, file: !69, line: 361, column: 2)
!333 = !DILocation(line: 362, column: 24, scope: !332)
!334 = !DILocation(line: 362, column: 32, scope: !332)
!335 = !DILocation(line: 362, column: 41, scope: !332)
!336 = !DILocation(line: 362, column: 47, scope: !332)
!337 = !DILocation(line: 362, column: 46, scope: !332)
!338 = !DILocation(line: 362, column: 57, scope: !332)
!339 = !DILocation(line: 362, column: 56, scope: !332)
!340 = !DILocation(line: 362, column: 29, scope: !332)
!341 = !DILocation(line: 362, column: 12, scope: !332)
!342 = !DILocation(line: 363, column: 14, scope: !332)
!343 = !DILocation(line: 363, column: 22, scope: !332)
!344 = !DILocation(line: 363, column: 12, scope: !332)
!345 = !DILocation(line: 364, column: 14, scope: !332)
!346 = !DILocation(line: 364, column: 23, scope: !332)
!347 = !DILocation(line: 364, column: 22, scope: !332)
!348 = !DILocation(line: 364, column: 12, scope: !332)
!349 = !DILocation(line: 365, column: 16, scope: !332)
!350 = !DILocation(line: 365, column: 25, scope: !332)
!351 = !DILocation(line: 365, column: 31, scope: !332)
!352 = !DILocation(line: 365, column: 30, scope: !332)
!353 = !DILocation(line: 365, column: 43, scope: !332)
!354 = !DILocation(line: 365, column: 41, scope: !332)
!355 = !DILocation(line: 365, column: 12, scope: !332)
!356 = !DILocation(line: 366, column: 6, scope: !357)
!357 = distinct !DILexicalBlock(scope: !332, file: !69, line: 366, column: 6)
!358 = !DILocation(line: 366, column: 15, scope: !357)
!359 = !DILocation(line: 366, column: 6, scope: !332)
!360 = !DILocation(line: 368, column: 7, scope: !361)
!361 = distinct !DILexicalBlock(scope: !362, file: !69, line: 368, column: 7)
!362 = distinct !DILexicalBlock(scope: !357, file: !69, line: 367, column: 3)
!363 = !DILocation(line: 368, column: 16, scope: !361)
!364 = !DILocation(line: 368, column: 7, scope: !362)
!365 = !DILocation(line: 370, column: 17, scope: !366)
!366 = distinct !DILexicalBlock(scope: !361, file: !69, line: 369, column: 4)
!367 = !DILocation(line: 370, column: 12, scope: !366)
!368 = !DILocation(line: 370, column: 5, scope: !366)
!369 = !DILocation(line: 374, column: 5, scope: !370)
!370 = distinct !DILexicalBlock(scope: !361, file: !69, line: 373, column: 4)
!371 = !DILocation(line: 379, column: 4, scope: !372)
!372 = distinct !DILexicalBlock(scope: !357, file: !69, line: 378, column: 3)
!373 = !DILocation(line: 382, column: 1, scope: !299)
!374 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 399, type: !300, scopeLine: 400, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!375 = !DILocalVariable(name: "numerator", arg: 1, scope: !374, file: !69, line: 399, type: !6)
!376 = !DILocation(line: 399, column: 30, scope: !374)
!377 = !DILocalVariable(name: "denominator", arg: 2, scope: !374, file: !69, line: 399, type: !18)
!378 = !DILocation(line: 399, column: 45, scope: !374)
!379 = !DILocalVariable(name: "u16Temp1", scope: !374, file: !69, line: 401, type: !18)
!380 = !DILocation(line: 401, column: 6, scope: !374)
!381 = !DILocalVariable(name: "s32Temp1", scope: !374, file: !69, line: 402, type: !25)
!382 = !DILocation(line: 402, column: 6, scope: !374)
!383 = !DILocation(line: 403, column: 13, scope: !374)
!384 = !DILocation(line: 403, column: 25, scope: !374)
!385 = !DILocation(line: 403, column: 11, scope: !374)
!386 = !DILocation(line: 404, column: 5, scope: !387)
!387 = distinct !DILexicalBlock(scope: !374, file: !69, line: 404, column: 5)
!388 = !DILocation(line: 404, column: 13, scope: !387)
!389 = !DILocation(line: 404, column: 5, scope: !374)
!390 = !DILocation(line: 406, column: 6, scope: !391)
!391 = distinct !DILexicalBlock(scope: !392, file: !69, line: 406, column: 6)
!392 = distinct !DILexicalBlock(scope: !387, file: !69, line: 405, column: 2)
!393 = !DILocation(line: 406, column: 15, scope: !391)
!394 = !DILocation(line: 406, column: 6, scope: !392)
!395 = !DILocation(line: 408, column: 4, scope: !396)
!396 = distinct !DILexicalBlock(scope: !391, file: !69, line: 407, column: 3)
!397 = !DILocation(line: 412, column: 4, scope: !398)
!398 = distinct !DILexicalBlock(scope: !391, file: !69, line: 411, column: 3)
!399 = !DILocation(line: 418, column: 15, scope: !400)
!400 = distinct !DILexicalBlock(scope: !387, file: !69, line: 417, column: 2)
!401 = !DILocation(line: 418, column: 27, scope: !400)
!402 = !DILocation(line: 418, column: 37, scope: !400)
!403 = !DILocation(line: 418, column: 36, scope: !400)
!404 = !DILocation(line: 418, column: 49, scope: !400)
!405 = !DILocation(line: 418, column: 47, scope: !400)
!406 = !DILocation(line: 418, column: 25, scope: !400)
!407 = !DILocation(line: 418, column: 59, scope: !400)
!408 = !DILocation(line: 418, column: 12, scope: !400)
!409 = !DILocation(line: 419, column: 15, scope: !400)
!410 = !DILocation(line: 419, column: 24, scope: !400)
!411 = !DILocation(line: 419, column: 23, scope: !400)
!412 = !DILocation(line: 419, column: 37, scope: !400)
!413 = !DILocation(line: 419, column: 47, scope: !400)
!414 = !DILocation(line: 419, column: 46, scope: !400)
!415 = !DILocation(line: 419, column: 34, scope: !400)
!416 = !DILocation(line: 419, column: 12, scope: !400)
!417 = !DILocation(line: 420, column: 10, scope: !400)
!418 = !DILocation(line: 420, column: 3, scope: !400)
!419 = !DILocation(line: 422, column: 1, scope: !374)
!420 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 440, type: !421, scopeLine: 441, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!421 = !DISubroutineType(types: !422)
!422 = !{!13, !18, !18}
!423 = !DILocalVariable(name: "numerator", arg: 1, scope: !420, file: !69, line: 440, type: !18)
!424 = !DILocation(line: 440, column: 28, scope: !420)
!425 = !DILocalVariable(name: "denominator", arg: 2, scope: !420, file: !69, line: 440, type: !18)
!426 = !DILocation(line: 440, column: 43, scope: !420)
!427 = !DILocalVariable(name: "u32Temp1", scope: !420, file: !69, line: 442, type: !428)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !429)
!429 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !15, line: 26, baseType: !430)
!430 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !431)
!431 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!432 = !DILocation(line: 442, column: 6, scope: !420)
!433 = !DILocalVariable(name: "u32Temp2", scope: !420, file: !69, line: 442, type: !428)
!434 = !DILocation(line: 442, column: 20, scope: !420)
!435 = !DILocalVariable(name: "u32Temp3", scope: !420, file: !69, line: 442, type: !428)
!436 = !DILocation(line: 442, column: 33, scope: !420)
!437 = !DILocation(line: 443, column: 5, scope: !438)
!438 = distinct !DILexicalBlock(scope: !420, file: !69, line: 443, column: 5)
!439 = !DILocation(line: 443, column: 16, scope: !438)
!440 = !DILocation(line: 443, column: 5, scope: !420)
!441 = !DILocation(line: 445, column: 3, scope: !442)
!442 = distinct !DILexicalBlock(scope: !438, file: !69, line: 444, column: 2)
!443 = !DILocation(line: 449, column: 15, scope: !444)
!444 = distinct !DILexicalBlock(scope: !438, file: !69, line: 448, column: 2)
!445 = !DILocation(line: 449, column: 24, scope: !444)
!446 = !DILocation(line: 449, column: 12, scope: !444)
!447 = !DILocation(line: 450, column: 14, scope: !444)
!448 = !DILocation(line: 450, column: 25, scope: !444)
!449 = !DILocation(line: 450, column: 23, scope: !444)
!450 = !DILocation(line: 450, column: 12, scope: !444)
!451 = !DILocation(line: 451, column: 15, scope: !444)
!452 = !DILocation(line: 451, column: 24, scope: !444)
!453 = !DILocation(line: 451, column: 32, scope: !444)
!454 = !DILocation(line: 451, column: 12, scope: !444)
!455 = !DILocation(line: 452, column: 6, scope: !456)
!456 = distinct !DILexicalBlock(scope: !444, file: !69, line: 452, column: 6)
!457 = !DILocation(line: 452, column: 15, scope: !456)
!458 = !DILocation(line: 452, column: 6, scope: !444)
!459 = !DILocation(line: 454, column: 15, scope: !460)
!460 = distinct !DILexicalBlock(scope: !456, file: !69, line: 453, column: 3)
!461 = !DILocation(line: 454, column: 11, scope: !460)
!462 = !DILocation(line: 454, column: 4, scope: !460)
!463 = !DILocation(line: 458, column: 4, scope: !464)
!464 = distinct !DILexicalBlock(scope: !456, file: !69, line: 457, column: 3)
!465 = !DILocation(line: 461, column: 1, scope: !420)
!466 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 478, type: !467, scopeLine: 479, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!467 = !DISubroutineType(types: !468)
!468 = !{!18, !25, !18}
!469 = !DILocalVariable(name: "x_value", arg: 1, scope: !466, file: !69, line: 478, type: !25)
!470 = !DILocation(line: 478, column: 25, scope: !466)
!471 = !DILocalVariable(name: "y_value", arg: 2, scope: !466, file: !69, line: 478, type: !18)
!472 = !DILocation(line: 478, column: 38, scope: !466)
!473 = !DILocalVariable(name: "s32Temp1", scope: !466, file: !69, line: 480, type: !25)
!474 = !DILocation(line: 480, column: 6, scope: !466)
!475 = !DILocation(line: 481, column: 12, scope: !466)
!476 = !DILocation(line: 481, column: 20, scope: !466)
!477 = !DILocation(line: 481, column: 10, scope: !466)
!478 = !DILocation(line: 482, column: 6, scope: !479)
!479 = distinct !DILexicalBlock(scope: !466, file: !69, line: 482, column: 5)
!480 = !DILocation(line: 482, column: 14, scope: !479)
!481 = !DILocation(line: 482, column: 24, scope: !479)
!482 = !DILocation(line: 482, column: 5, scope: !466)
!483 = !DILocation(line: 484, column: 6, scope: !484)
!484 = distinct !DILexicalBlock(scope: !485, file: !69, line: 484, column: 6)
!485 = distinct !DILexicalBlock(scope: !479, file: !69, line: 483, column: 2)
!486 = !DILocation(line: 484, column: 14, scope: !484)
!487 = !DILocation(line: 484, column: 6, scope: !485)
!488 = !DILocation(line: 486, column: 4, scope: !489)
!489 = distinct !DILexicalBlock(scope: !484, file: !69, line: 485, column: 3)
!490 = !DILocation(line: 490, column: 4, scope: !491)
!491 = distinct !DILexicalBlock(scope: !484, file: !69, line: 489, column: 3)
!492 = !DILocation(line: 495, column: 15, scope: !493)
!493 = distinct !DILexicalBlock(scope: !479, file: !69, line: 494, column: 2)
!494 = !DILocation(line: 495, column: 27, scope: !493)
!495 = !DILocation(line: 495, column: 35, scope: !493)
!496 = !DILocation(line: 495, column: 34, scope: !493)
!497 = !DILocation(line: 495, column: 46, scope: !493)
!498 = !DILocation(line: 495, column: 44, scope: !493)
!499 = !DILocation(line: 495, column: 23, scope: !493)
!500 = !DILocation(line: 495, column: 56, scope: !493)
!501 = !DILocation(line: 495, column: 12, scope: !493)
!502 = !DILocation(line: 496, column: 15, scope: !493)
!503 = !DILocation(line: 496, column: 24, scope: !493)
!504 = !DILocation(line: 496, column: 23, scope: !493)
!505 = !DILocation(line: 496, column: 36, scope: !493)
!506 = !DILocation(line: 496, column: 44, scope: !493)
!507 = !DILocation(line: 496, column: 43, scope: !493)
!508 = !DILocation(line: 496, column: 33, scope: !493)
!509 = !DILocation(line: 496, column: 12, scope: !493)
!510 = !DILocation(line: 497, column: 6, scope: !511)
!511 = distinct !DILexicalBlock(scope: !493, file: !69, line: 497, column: 6)
!512 = !DILocation(line: 497, column: 15, scope: !511)
!513 = !DILocation(line: 497, column: 6, scope: !493)
!514 = !DILocation(line: 499, column: 7, scope: !515)
!515 = distinct !DILexicalBlock(scope: !516, file: !69, line: 499, column: 7)
!516 = distinct !DILexicalBlock(scope: !511, file: !69, line: 498, column: 3)
!517 = !DILocation(line: 499, column: 16, scope: !515)
!518 = !DILocation(line: 499, column: 7, scope: !516)
!519 = !DILocation(line: 501, column: 17, scope: !520)
!520 = distinct !DILexicalBlock(scope: !515, file: !69, line: 500, column: 4)
!521 = !DILocation(line: 501, column: 12, scope: !520)
!522 = !DILocation(line: 501, column: 5, scope: !520)
!523 = !DILocation(line: 505, column: 5, scope: !524)
!524 = distinct !DILexicalBlock(scope: !515, file: !69, line: 504, column: 4)
!525 = !DILocation(line: 510, column: 4, scope: !526)
!526 = distinct !DILexicalBlock(scope: !511, file: !69, line: 509, column: 3)
!527 = !DILocation(line: 513, column: 1, scope: !466)
!528 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 531, type: !529, scopeLine: 532, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!529 = !DISubroutineType(types: !530)
!530 = !{!18, !18, !18}
!531 = !DILocalVariable(name: "numerator", arg: 1, scope: !528, file: !69, line: 531, type: !18)
!532 = !DILocation(line: 531, column: 31, scope: !528)
!533 = !DILocalVariable(name: "denominator", arg: 2, scope: !528, file: !69, line: 531, type: !18)
!534 = !DILocation(line: 531, column: 46, scope: !528)
!535 = !DILocalVariable(name: "u32Temp", scope: !528, file: !69, line: 533, type: !428)
!536 = !DILocation(line: 533, column: 6, scope: !528)
!537 = !DILocation(line: 534, column: 5, scope: !538)
!538 = distinct !DILexicalBlock(scope: !528, file: !69, line: 534, column: 5)
!539 = !DILocation(line: 534, column: 17, scope: !538)
!540 = !DILocation(line: 534, column: 5, scope: !528)
!541 = !DILocation(line: 536, column: 3, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !69, line: 535, column: 2)
!543 = !DILocation(line: 540, column: 14, scope: !544)
!544 = distinct !DILexicalBlock(scope: !538, file: !69, line: 539, column: 2)
!545 = !DILocation(line: 540, column: 23, scope: !544)
!546 = !DILocation(line: 540, column: 32, scope: !544)
!547 = !DILocation(line: 540, column: 44, scope: !544)
!548 = !DILocation(line: 540, column: 29, scope: !544)
!549 = !DILocation(line: 540, column: 11, scope: !544)
!550 = !DILocation(line: 541, column: 13, scope: !544)
!551 = !DILocation(line: 541, column: 21, scope: !544)
!552 = !DILocation(line: 541, column: 20, scope: !544)
!553 = !DILocation(line: 541, column: 11, scope: !544)
!554 = !DILocation(line: 542, column: 6, scope: !555)
!555 = distinct !DILexicalBlock(scope: !544, file: !69, line: 542, column: 6)
!556 = !DILocation(line: 542, column: 14, scope: !555)
!557 = !DILocation(line: 542, column: 6, scope: !544)
!558 = !DILocation(line: 544, column: 11, scope: !559)
!559 = distinct !DILexicalBlock(scope: !555, file: !69, line: 543, column: 3)
!560 = !DILocation(line: 544, column: 19, scope: !559)
!561 = !DILocation(line: 544, column: 4, scope: !559)
!562 = !DILocation(line: 548, column: 4, scope: !563)
!563 = distinct !DILexicalBlock(scope: !555, file: !69, line: 547, column: 3)
!564 = !DILocation(line: 552, column: 1, scope: !528)
!565 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 569, type: !566, scopeLine: 570, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!566 = !DISubroutineType(types: !567)
!567 = !{!18, !428, !18}
!568 = !DILocalVariable(name: "x_value", arg: 1, scope: !565, file: !69, line: 569, type: !428)
!569 = !DILocation(line: 569, column: 25, scope: !565)
!570 = !DILocalVariable(name: "y_value", arg: 2, scope: !565, file: !69, line: 569, type: !18)
!571 = !DILocation(line: 569, column: 38, scope: !565)
!572 = !DILocalVariable(name: "u32Temp1", scope: !565, file: !69, line: 571, type: !428)
!573 = !DILocation(line: 571, column: 6, scope: !565)
!574 = !DILocalVariable(name: "u32Temp2", scope: !565, file: !69, line: 571, type: !428)
!575 = !DILocation(line: 571, column: 17, scope: !565)
!576 = !DILocation(line: 572, column: 12, scope: !565)
!577 = !DILocation(line: 572, column: 20, scope: !565)
!578 = !DILocation(line: 572, column: 10, scope: !565)
!579 = !DILocation(line: 573, column: 5, scope: !580)
!580 = distinct !DILexicalBlock(scope: !565, file: !69, line: 573, column: 5)
!581 = !DILocation(line: 573, column: 13, scope: !580)
!582 = !DILocation(line: 573, column: 5, scope: !565)
!583 = !DILocation(line: 575, column: 3, scope: !584)
!584 = distinct !DILexicalBlock(scope: !580, file: !69, line: 574, column: 2)
!585 = !DILocation(line: 579, column: 14, scope: !586)
!586 = distinct !DILexicalBlock(scope: !580, file: !69, line: 578, column: 2)
!587 = !DILocation(line: 579, column: 22, scope: !586)
!588 = !DILocation(line: 579, column: 21, scope: !586)
!589 = !DILocation(line: 579, column: 12, scope: !586)
!590 = !DILocation(line: 580, column: 14, scope: !586)
!591 = !DILocation(line: 580, column: 25, scope: !586)
!592 = !DILocation(line: 580, column: 36, scope: !586)
!593 = !DILocation(line: 580, column: 34, scope: !586)
!594 = !DILocation(line: 580, column: 22, scope: !586)
!595 = !DILocation(line: 580, column: 45, scope: !586)
!596 = !DILocation(line: 580, column: 12, scope: !586)
!597 = !DILocation(line: 581, column: 15, scope: !586)
!598 = !DILocation(line: 581, column: 24, scope: !586)
!599 = !DILocation(line: 581, column: 23, scope: !586)
!600 = !DILocation(line: 581, column: 36, scope: !586)
!601 = !DILocation(line: 581, column: 44, scope: !586)
!602 = !DILocation(line: 581, column: 43, scope: !586)
!603 = !DILocation(line: 581, column: 33, scope: !586)
!604 = !DILocation(line: 581, column: 12, scope: !586)
!605 = !DILocation(line: 582, column: 6, scope: !606)
!606 = distinct !DILexicalBlock(scope: !586, file: !69, line: 582, column: 6)
!607 = !DILocation(line: 582, column: 15, scope: !606)
!608 = !DILocation(line: 582, column: 6, scope: !586)
!609 = !DILocation(line: 584, column: 11, scope: !610)
!610 = distinct !DILexicalBlock(scope: !606, file: !69, line: 583, column: 3)
!611 = !DILocation(line: 584, column: 20, scope: !610)
!612 = !DILocation(line: 584, column: 4, scope: !610)
!613 = !DILocation(line: 588, column: 4, scope: !614)
!614 = distinct !DILexicalBlock(scope: !606, file: !69, line: 587, column: 3)
!615 = !DILocation(line: 592, column: 1, scope: !565)
!616 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 611, type: !617, scopeLine: 612, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!617 = !DISubroutineType(types: !618)
!618 = !{!6, !6, !18, !6}
!619 = !DILocalVariable(name: "factor1", arg: 1, scope: !616, file: !69, line: 611, type: !6)
!620 = !DILocation(line: 611, column: 33, scope: !616)
!621 = !DILocalVariable(name: "factor2", arg: 2, scope: !616, file: !69, line: 611, type: !18)
!622 = !DILocation(line: 611, column: 46, scope: !616)
!623 = !DILocalVariable(name: "denominator", arg: 3, scope: !616, file: !69, line: 611, type: !6)
!624 = !DILocation(line: 611, column: 59, scope: !616)
!625 = !DILocalVariable(name: "s32Result", scope: !616, file: !69, line: 613, type: !25)
!626 = !DILocation(line: 613, column: 6, scope: !616)
!627 = !DILocalVariable(name: "s32Temp1", scope: !616, file: !69, line: 613, type: !25)
!628 = !DILocation(line: 613, column: 21, scope: !616)
!629 = !DILocation(line: 614, column: 14, scope: !616)
!630 = !DILocation(line: 614, column: 24, scope: !616)
!631 = !DILocation(line: 614, column: 22, scope: !616)
!632 = !DILocation(line: 614, column: 12, scope: !616)
!633 = !DILocation(line: 615, column: 5, scope: !634)
!634 = distinct !DILexicalBlock(scope: !616, file: !69, line: 615, column: 5)
!635 = !DILocation(line: 615, column: 17, scope: !634)
!636 = !DILocation(line: 615, column: 5, scope: !616)
!637 = !DILocation(line: 617, column: 6, scope: !638)
!638 = distinct !DILexicalBlock(scope: !639, file: !69, line: 617, column: 6)
!639 = distinct !DILexicalBlock(scope: !634, file: !69, line: 616, column: 2)
!640 = !DILocation(line: 617, column: 16, scope: !638)
!641 = !DILocation(line: 617, column: 6, scope: !639)
!642 = !DILocation(line: 619, column: 4, scope: !643)
!643 = distinct !DILexicalBlock(scope: !638, file: !69, line: 618, column: 3)
!644 = !DILocation(line: 623, column: 4, scope: !645)
!645 = distinct !DILexicalBlock(scope: !638, file: !69, line: 622, column: 3)
!646 = !DILocation(line: 628, column: 14, scope: !647)
!647 = distinct !DILexicalBlock(scope: !634, file: !69, line: 627, column: 2)
!648 = !DILocation(line: 628, column: 27, scope: !647)
!649 = !DILocation(line: 628, column: 37, scope: !647)
!650 = !DILocation(line: 628, column: 36, scope: !647)
!651 = !DILocation(line: 628, column: 50, scope: !647)
!652 = !DILocation(line: 628, column: 49, scope: !647)
!653 = !DILocation(line: 628, column: 24, scope: !647)
!654 = !DILocation(line: 628, column: 12, scope: !647)
!655 = !DILocation(line: 629, column: 14, scope: !647)
!656 = !DILocation(line: 629, column: 23, scope: !647)
!657 = !DILocation(line: 629, column: 12, scope: !647)
!658 = !DILocation(line: 630, column: 16, scope: !647)
!659 = !DILocation(line: 630, column: 25, scope: !647)
!660 = !DILocation(line: 630, column: 24, scope: !647)
!661 = !DILocation(line: 630, column: 41, scope: !647)
!662 = !DILocation(line: 630, column: 51, scope: !647)
!663 = !DILocation(line: 630, column: 50, scope: !647)
!664 = !DILocation(line: 630, column: 38, scope: !647)
!665 = !DILocation(line: 630, column: 13, scope: !647)
!666 = !DILocation(line: 631, column: 6, scope: !667)
!667 = distinct !DILexicalBlock(scope: !647, file: !69, line: 631, column: 6)
!668 = !DILocation(line: 631, column: 16, scope: !667)
!669 = !DILocation(line: 631, column: 6, scope: !647)
!670 = !DILocation(line: 633, column: 7, scope: !671)
!671 = distinct !DILexicalBlock(scope: !672, file: !69, line: 633, column: 7)
!672 = distinct !DILexicalBlock(scope: !667, file: !69, line: 632, column: 3)
!673 = !DILocation(line: 633, column: 17, scope: !671)
!674 = !DILocation(line: 633, column: 7, scope: !672)
!675 = !DILocation(line: 635, column: 17, scope: !676)
!676 = distinct !DILexicalBlock(scope: !671, file: !69, line: 634, column: 4)
!677 = !DILocation(line: 635, column: 12, scope: !676)
!678 = !DILocation(line: 635, column: 5, scope: !676)
!679 = !DILocation(line: 640, column: 5, scope: !680)
!680 = distinct !DILexicalBlock(scope: !671, file: !69, line: 639, column: 4)
!681 = !DILocation(line: 645, column: 4, scope: !682)
!682 = distinct !DILexicalBlock(scope: !667, file: !69, line: 644, column: 3)
!683 = !DILocation(line: 649, column: 1, scope: !616)
!684 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 667, type: !685, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!685 = !DISubroutineType(types: !686)
!686 = !{!6, !18, !6, !18}
!687 = !DILocalVariable(name: "factor1", arg: 1, scope: !684, file: !69, line: 667, type: !18)
!688 = !DILocation(line: 667, column: 33, scope: !684)
!689 = !DILocalVariable(name: "factor2", arg: 2, scope: !684, file: !69, line: 667, type: !6)
!690 = !DILocation(line: 667, column: 46, scope: !684)
!691 = !DILocalVariable(name: "denominator", arg: 3, scope: !684, file: !69, line: 667, type: !18)
!692 = !DILocation(line: 667, column: 59, scope: !684)
!693 = !DILocalVariable(name: "s32Result", scope: !684, file: !69, line: 669, type: !25)
!694 = !DILocation(line: 669, column: 6, scope: !684)
!695 = !DILocalVariable(name: "s32Temp1", scope: !684, file: !69, line: 669, type: !25)
!696 = !DILocation(line: 669, column: 21, scope: !684)
!697 = !DILocation(line: 670, column: 14, scope: !684)
!698 = !DILocation(line: 670, column: 24, scope: !684)
!699 = !DILocation(line: 670, column: 22, scope: !684)
!700 = !DILocation(line: 670, column: 12, scope: !684)
!701 = !DILocation(line: 671, column: 5, scope: !702)
!702 = distinct !DILexicalBlock(scope: !684, file: !69, line: 671, column: 5)
!703 = !DILocation(line: 671, column: 16, scope: !702)
!704 = !DILocation(line: 671, column: 5, scope: !684)
!705 = !DILocation(line: 673, column: 6, scope: !706)
!706 = distinct !DILexicalBlock(scope: !707, file: !69, line: 673, column: 6)
!707 = distinct !DILexicalBlock(scope: !702, file: !69, line: 672, column: 2)
!708 = !DILocation(line: 673, column: 16, scope: !706)
!709 = !DILocation(line: 673, column: 6, scope: !707)
!710 = !DILocation(line: 675, column: 4, scope: !711)
!711 = distinct !DILexicalBlock(scope: !706, file: !69, line: 674, column: 3)
!712 = !DILocation(line: 679, column: 4, scope: !713)
!713 = distinct !DILexicalBlock(scope: !706, file: !69, line: 678, column: 3)
!714 = !DILocation(line: 684, column: 14, scope: !715)
!715 = distinct !DILexicalBlock(scope: !702, file: !69, line: 683, column: 2)
!716 = !DILocation(line: 684, column: 28, scope: !715)
!717 = !DILocation(line: 684, column: 38, scope: !715)
!718 = !DILocation(line: 684, column: 37, scope: !715)
!719 = !DILocation(line: 684, column: 53, scope: !715)
!720 = !DILocation(line: 684, column: 51, scope: !715)
!721 = !DILocation(line: 684, column: 24, scope: !715)
!722 = !DILocation(line: 684, column: 66, scope: !715)
!723 = !DILocation(line: 684, column: 12, scope: !715)
!724 = !DILocation(line: 685, column: 16, scope: !715)
!725 = !DILocation(line: 685, column: 25, scope: !715)
!726 = !DILocation(line: 685, column: 24, scope: !715)
!727 = !DILocation(line: 685, column: 41, scope: !715)
!728 = !DILocation(line: 685, column: 51, scope: !715)
!729 = !DILocation(line: 685, column: 50, scope: !715)
!730 = !DILocation(line: 685, column: 38, scope: !715)
!731 = !DILocation(line: 685, column: 13, scope: !715)
!732 = !DILocation(line: 686, column: 6, scope: !733)
!733 = distinct !DILexicalBlock(scope: !715, file: !69, line: 686, column: 6)
!734 = !DILocation(line: 686, column: 16, scope: !733)
!735 = !DILocation(line: 686, column: 6, scope: !715)
!736 = !DILocation(line: 688, column: 7, scope: !737)
!737 = distinct !DILexicalBlock(scope: !738, file: !69, line: 688, column: 7)
!738 = distinct !DILexicalBlock(scope: !733, file: !69, line: 687, column: 3)
!739 = !DILocation(line: 688, column: 17, scope: !737)
!740 = !DILocation(line: 688, column: 7, scope: !738)
!741 = !DILocation(line: 690, column: 17, scope: !742)
!742 = distinct !DILexicalBlock(scope: !737, file: !69, line: 689, column: 4)
!743 = !DILocation(line: 690, column: 12, scope: !742)
!744 = !DILocation(line: 690, column: 5, scope: !742)
!745 = !DILocation(line: 694, column: 5, scope: !746)
!746 = distinct !DILexicalBlock(scope: !737, file: !69, line: 693, column: 4)
!747 = !DILocation(line: 699, column: 4, scope: !748)
!748 = distinct !DILexicalBlock(scope: !733, file: !69, line: 698, column: 3)
!749 = !DILocation(line: 702, column: 1, scope: !684)
!750 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 721, type: !751, scopeLine: 722, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!751 = !DISubroutineType(types: !752)
!752 = !{!18, !6, !18, !6}
!753 = !DILocalVariable(name: "factor1", arg: 1, scope: !750, file: !69, line: 721, type: !6)
!754 = !DILocation(line: 721, column: 33, scope: !750)
!755 = !DILocalVariable(name: "factor2", arg: 2, scope: !750, file: !69, line: 721, type: !18)
!756 = !DILocation(line: 721, column: 46, scope: !750)
!757 = !DILocalVariable(name: "denominator", arg: 3, scope: !750, file: !69, line: 721, type: !6)
!758 = !DILocation(line: 721, column: 59, scope: !750)
!759 = !DILocalVariable(name: "u32Result", scope: !750, file: !69, line: 723, type: !428)
!760 = !DILocation(line: 723, column: 6, scope: !750)
!761 = !DILocalVariable(name: "u32Temp1", scope: !750, file: !69, line: 723, type: !428)
!762 = !DILocation(line: 723, column: 21, scope: !750)
!763 = !DILocalVariable(name: "s32Result", scope: !750, file: !69, line: 724, type: !25)
!764 = !DILocation(line: 724, column: 6, scope: !750)
!765 = !DILocalVariable(name: "s32Temp1", scope: !750, file: !69, line: 724, type: !25)
!766 = !DILocation(line: 724, column: 21, scope: !750)
!767 = !DILocation(line: 725, column: 14, scope: !750)
!768 = !DILocation(line: 725, column: 24, scope: !750)
!769 = !DILocation(line: 725, column: 22, scope: !750)
!770 = !DILocation(line: 725, column: 12, scope: !750)
!771 = !DILocation(line: 727, column: 5, scope: !772)
!772 = distinct !DILexicalBlock(scope: !750, file: !69, line: 727, column: 5)
!773 = !DILocation(line: 727, column: 17, scope: !772)
!774 = !DILocation(line: 727, column: 5, scope: !750)
!775 = !DILocation(line: 729, column: 6, scope: !776)
!776 = distinct !DILexicalBlock(scope: !777, file: !69, line: 729, column: 6)
!777 = distinct !DILexicalBlock(scope: !772, file: !69, line: 728, column: 2)
!778 = !DILocation(line: 729, column: 16, scope: !776)
!779 = !DILocation(line: 729, column: 6, scope: !777)
!780 = !DILocation(line: 731, column: 4, scope: !781)
!781 = distinct !DILexicalBlock(scope: !776, file: !69, line: 730, column: 3)
!782 = !DILocation(line: 735, column: 4, scope: !783)
!783 = distinct !DILexicalBlock(scope: !776, file: !69, line: 734, column: 3)
!784 = !DILocation(line: 740, column: 15, scope: !785)
!785 = distinct !DILexicalBlock(scope: !772, file: !69, line: 739, column: 2)
!786 = !DILocation(line: 740, column: 29, scope: !785)
!787 = !DILocation(line: 740, column: 39, scope: !785)
!788 = !DILocation(line: 740, column: 38, scope: !785)
!789 = !DILocation(line: 740, column: 54, scope: !785)
!790 = !DILocation(line: 740, column: 52, scope: !785)
!791 = !DILocation(line: 740, column: 25, scope: !785)
!792 = !DILocation(line: 740, column: 68, scope: !785)
!793 = !DILocation(line: 740, column: 12, scope: !785)
!794 = !DILocation(line: 741, column: 16, scope: !785)
!795 = !DILocation(line: 741, column: 25, scope: !785)
!796 = !DILocation(line: 741, column: 24, scope: !785)
!797 = !DILocation(line: 741, column: 41, scope: !785)
!798 = !DILocation(line: 741, column: 51, scope: !785)
!799 = !DILocation(line: 741, column: 50, scope: !785)
!800 = !DILocation(line: 741, column: 38, scope: !785)
!801 = !DILocation(line: 741, column: 13, scope: !785)
!802 = !DILocation(line: 742, column: 6, scope: !803)
!803 = distinct !DILexicalBlock(scope: !785, file: !69, line: 742, column: 6)
!804 = !DILocation(line: 742, column: 16, scope: !803)
!805 = !DILocation(line: 742, column: 6, scope: !785)
!806 = !DILocation(line: 744, column: 7, scope: !807)
!807 = distinct !DILexicalBlock(scope: !808, file: !69, line: 744, column: 7)
!808 = distinct !DILexicalBlock(scope: !803, file: !69, line: 743, column: 3)
!809 = !DILocation(line: 744, column: 17, scope: !807)
!810 = !DILocation(line: 744, column: 7, scope: !808)
!811 = !DILocation(line: 746, column: 17, scope: !812)
!812 = distinct !DILexicalBlock(scope: !807, file: !69, line: 745, column: 4)
!813 = !DILocation(line: 746, column: 12, scope: !812)
!814 = !DILocation(line: 746, column: 5, scope: !812)
!815 = !DILocation(line: 750, column: 5, scope: !816)
!816 = distinct !DILexicalBlock(scope: !807, file: !69, line: 749, column: 4)
!817 = !DILocation(line: 755, column: 4, scope: !818)
!818 = distinct !DILexicalBlock(scope: !803, file: !69, line: 754, column: 3)
!819 = !DILocation(line: 758, column: 1, scope: !750)
!820 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 777, type: !821, scopeLine: 778, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!821 = !DISubroutineType(types: !822)
!822 = !{!18, !6, !18, !18}
!823 = !DILocalVariable(name: "factor1", arg: 1, scope: !820, file: !69, line: 777, type: !6)
!824 = !DILocation(line: 777, column: 33, scope: !820)
!825 = !DILocalVariable(name: "factor2", arg: 2, scope: !820, file: !69, line: 777, type: !18)
!826 = !DILocation(line: 777, column: 46, scope: !820)
!827 = !DILocalVariable(name: "denominator", arg: 3, scope: !820, file: !69, line: 777, type: !18)
!828 = !DILocation(line: 777, column: 59, scope: !820)
!829 = !DILocalVariable(name: "s32Result", scope: !820, file: !69, line: 779, type: !25)
!830 = !DILocation(line: 779, column: 6, scope: !820)
!831 = !DILocalVariable(name: "s32Temp1", scope: !820, file: !69, line: 779, type: !25)
!832 = !DILocation(line: 779, column: 21, scope: !820)
!833 = !DILocation(line: 780, column: 14, scope: !820)
!834 = !DILocation(line: 780, column: 24, scope: !820)
!835 = !DILocation(line: 780, column: 22, scope: !820)
!836 = !DILocation(line: 780, column: 12, scope: !820)
!837 = !DILocation(line: 782, column: 5, scope: !838)
!838 = distinct !DILexicalBlock(scope: !820, file: !69, line: 782, column: 5)
!839 = !DILocation(line: 782, column: 17, scope: !838)
!840 = !DILocation(line: 782, column: 5, scope: !820)
!841 = !DILocation(line: 784, column: 6, scope: !842)
!842 = distinct !DILexicalBlock(scope: !843, file: !69, line: 784, column: 6)
!843 = distinct !DILexicalBlock(scope: !838, file: !69, line: 783, column: 2)
!844 = !DILocation(line: 784, column: 16, scope: !842)
!845 = !DILocation(line: 784, column: 6, scope: !843)
!846 = !DILocation(line: 786, column: 4, scope: !847)
!847 = distinct !DILexicalBlock(scope: !842, file: !69, line: 785, column: 3)
!848 = !DILocation(line: 790, column: 4, scope: !849)
!849 = distinct !DILexicalBlock(scope: !842, file: !69, line: 789, column: 3)
!850 = !DILocation(line: 796, column: 50, scope: !851)
!851 = distinct !DILexicalBlock(scope: !852, file: !69, line: 796, column: 7)
!852 = distinct !DILexicalBlock(scope: !838, file: !69, line: 794, column: 2)
!853 = !DILocation(line: 796, column: 67, scope: !851)
!854 = !DILocation(line: 796, column: 62, scope: !851)
!855 = !DILocation(line: 796, column: 60, scope: !851)
!856 = !DILocation(line: 796, column: 34, scope: !851)
!857 = !DILocation(line: 796, column: 97, scope: !851)
!858 = !DILocation(line: 796, column: 92, scope: !851)
!859 = !DILocation(line: 796, column: 82, scope: !851)
!860 = !DILocation(line: 796, column: 9, scope: !851)
!861 = !DILocation(line: 796, column: 7, scope: !852)
!862 = !DILocation(line: 797, column: 7, scope: !863)
!863 = distinct !DILexicalBlock(scope: !851, file: !69, line: 796, column: 113)
!864 = !DILocation(line: 800, column: 50, scope: !865)
!865 = distinct !DILexicalBlock(scope: !852, file: !69, line: 800, column: 7)
!866 = !DILocation(line: 800, column: 67, scope: !865)
!867 = !DILocation(line: 800, column: 62, scope: !865)
!868 = !DILocation(line: 800, column: 60, scope: !865)
!869 = !DILocation(line: 800, column: 34, scope: !865)
!870 = !DILocation(line: 800, column: 97, scope: !865)
!871 = !DILocation(line: 800, column: 92, scope: !865)
!872 = !DILocation(line: 800, column: 82, scope: !865)
!873 = !DILocation(line: 800, column: 9, scope: !865)
!874 = !DILocation(line: 800, column: 7, scope: !852)
!875 = !DILocation(line: 801, column: 7, scope: !876)
!876 = distinct !DILexicalBlock(scope: !865, file: !69, line: 800, column: 113)
!877 = !DILocation(line: 804, column: 44, scope: !878)
!878 = distinct !DILexicalBlock(scope: !852, file: !69, line: 804, column: 7)
!879 = !DILocation(line: 804, column: 34, scope: !878)
!880 = !DILocation(line: 804, column: 78, scope: !878)
!881 = !DILocation(line: 804, column: 95, scope: !878)
!882 = !DILocation(line: 804, column: 90, scope: !878)
!883 = !DILocation(line: 804, column: 88, scope: !878)
!884 = !DILocation(line: 804, column: 115, scope: !878)
!885 = !DILocation(line: 804, column: 110, scope: !878)
!886 = !DILocation(line: 804, column: 108, scope: !878)
!887 = !DILocation(line: 804, column: 56, scope: !878)
!888 = !DILocation(line: 804, column: 9, scope: !878)
!889 = !DILocation(line: 804, column: 7, scope: !852)
!890 = !DILocation(line: 805, column: 7, scope: !891)
!891 = distinct !DILexicalBlock(scope: !878, file: !69, line: 804, column: 132)
!892 = !DILocation(line: 812, column: 35, scope: !852)
!893 = !DILocation(line: 812, column: 59, scope: !852)
!894 = !DILocation(line: 812, column: 76, scope: !852)
!895 = !DILocation(line: 812, column: 71, scope: !852)
!896 = !DILocation(line: 812, column: 69, scope: !852)
!897 = !DILocation(line: 812, column: 96, scope: !852)
!898 = !DILocation(line: 812, column: 91, scope: !852)
!899 = !DILocation(line: 812, column: 89, scope: !852)
!900 = !DILocation(line: 812, column: 45, scope: !852)
!901 = !DILocation(line: 812, column: 25, scope: !852)
!902 = !DILocation(line: 812, column: 23, scope: !852)
!903 = !DILocation(line: 813, column: 3, scope: !852)
!904 = !DILocation(line: 832, column: 1, scope: !820)
!905 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !30, file: !30, line: 78, type: !906, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!906 = !DISubroutineType(types: !907)
!907 = !{!28, !22, !22}
!908 = !DILocalVariable(name: "left", arg: 1, scope: !905, file: !30, line: 78, type: !22)
!909 = !DILocation(line: 78, column: 38, scope: !905)
!910 = !DILocalVariable(name: "right", arg: 2, scope: !905, file: !30, line: 78, type: !22)
!911 = !DILocation(line: 78, column: 52, scope: !905)
!912 = !DILocation(line: 80, column: 12, scope: !905)
!913 = !DILocation(line: 80, column: 19, scope: !905)
!914 = !DILocation(line: 80, column: 17, scope: !905)
!915 = !DILocation(line: 80, column: 25, scope: !905)
!916 = !DILocation(line: 80, column: 5, scope: !905)
!917 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !30, file: !30, line: 72, type: !906, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!918 = !DILocalVariable(name: "left", arg: 1, scope: !917, file: !30, line: 72, type: !22)
!919 = !DILocation(line: 72, column: 38, scope: !917)
!920 = !DILocalVariable(name: "right", arg: 2, scope: !917, file: !30, line: 72, type: !22)
!921 = !DILocation(line: 72, column: 52, scope: !917)
!922 = !DILocation(line: 74, column: 12, scope: !917)
!923 = !DILocation(line: 74, column: 19, scope: !917)
!924 = !DILocation(line: 74, column: 17, scope: !917)
!925 = !DILocation(line: 74, column: 25, scope: !917)
!926 = !DILocation(line: 74, column: 5, scope: !917)
!927 = distinct !DISubprogram(name: "klee_alarm_s32_sub_lower", scope: !30, file: !30, line: 60, type: !906, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!928 = !DILocalVariable(name: "left", arg: 1, scope: !927, file: !30, line: 60, type: !22)
!929 = !DILocation(line: 60, column: 38, scope: !927)
!930 = !DILocalVariable(name: "right", arg: 2, scope: !927, file: !30, line: 60, type: !22)
!931 = !DILocation(line: 60, column: 52, scope: !927)
!932 = !DILocation(line: 62, column: 12, scope: !927)
!933 = !DILocation(line: 62, column: 19, scope: !927)
!934 = !DILocation(line: 62, column: 17, scope: !927)
!935 = !DILocation(line: 62, column: 25, scope: !927)
!936 = !DILocation(line: 62, column: 5, scope: !927)
!937 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 850, type: !938, scopeLine: 851, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!938 = !DISubroutineType(types: !939)
!939 = !{!18, !18, !18, !18}
!940 = !DILocalVariable(name: "factor1", arg: 1, scope: !937, file: !69, line: 850, type: !18)
!941 = !DILocation(line: 850, column: 33, scope: !937)
!942 = !DILocalVariable(name: "factor2", arg: 2, scope: !937, file: !69, line: 850, type: !18)
!943 = !DILocation(line: 850, column: 46, scope: !937)
!944 = !DILocalVariable(name: "denominator", arg: 3, scope: !937, file: !69, line: 850, type: !18)
!945 = !DILocation(line: 850, column: 59, scope: !937)
!946 = !DILocalVariable(name: "u32Temp1", scope: !937, file: !69, line: 852, type: !428)
!947 = !DILocation(line: 852, column: 6, scope: !937)
!948 = !DILocalVariable(name: "u16TempDenom", scope: !937, file: !69, line: 853, type: !18)
!949 = !DILocation(line: 853, column: 6, scope: !937)
!950 = !DILocation(line: 855, column: 5, scope: !951)
!951 = distinct !DILexicalBlock(scope: !937, file: !69, line: 855, column: 5)
!952 = !DILocation(line: 855, column: 17, scope: !951)
!953 = !DILocation(line: 855, column: 5, scope: !937)
!954 = !DILocation(line: 857, column: 3, scope: !955)
!955 = distinct !DILexicalBlock(scope: !951, file: !69, line: 856, column: 2)
!956 = !DILocation(line: 861, column: 14, scope: !957)
!957 = distinct !DILexicalBlock(scope: !951, file: !69, line: 860, column: 2)
!958 = !DILocation(line: 861, column: 24, scope: !957)
!959 = !DILocation(line: 861, column: 22, scope: !957)
!960 = !DILocation(line: 861, column: 12, scope: !957)
!961 = !DILocation(line: 862, column: 18, scope: !957)
!962 = !DILocation(line: 862, column: 30, scope: !957)
!963 = !DILocation(line: 862, column: 16, scope: !957)
!964 = !DILocation(line: 863, column: 14, scope: !957)
!965 = !DILocation(line: 863, column: 25, scope: !957)
!966 = !DILocation(line: 863, column: 23, scope: !957)
!967 = !DILocation(line: 863, column: 12, scope: !957)
!968 = !DILocation(line: 864, column: 14, scope: !957)
!969 = !DILocation(line: 864, column: 25, scope: !957)
!970 = !DILocation(line: 864, column: 23, scope: !957)
!971 = !DILocation(line: 864, column: 12, scope: !957)
!972 = !DILocation(line: 865, column: 6, scope: !973)
!973 = distinct !DILexicalBlock(scope: !957, file: !69, line: 865, column: 6)
!974 = !DILocation(line: 865, column: 15, scope: !973)
!975 = !DILocation(line: 865, column: 6, scope: !957)
!976 = !DILocation(line: 867, column: 12, scope: !977)
!977 = distinct !DILexicalBlock(scope: !973, file: !69, line: 866, column: 3)
!978 = !DILocation(line: 867, column: 21, scope: !977)
!979 = !DILocation(line: 867, column: 11, scope: !977)
!980 = !DILocation(line: 867, column: 4, scope: !977)
!981 = !DILocation(line: 872, column: 4, scope: !982)
!982 = distinct !DILexicalBlock(scope: !973, file: !69, line: 871, column: 3)
!983 = !DILocation(line: 877, column: 1, scope: !937)
!984 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 894, type: !985, scopeLine: 895, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!985 = !DISubroutineType(types: !986)
!986 = !{!18, !18, !18, !428}
!987 = !DILocalVariable(name: "factor1", arg: 1, scope: !984, file: !69, line: 894, type: !18)
!988 = !DILocation(line: 894, column: 33, scope: !984)
!989 = !DILocalVariable(name: "factor2", arg: 2, scope: !984, file: !69, line: 894, type: !18)
!990 = !DILocation(line: 894, column: 46, scope: !984)
!991 = !DILocalVariable(name: "denominator", arg: 3, scope: !984, file: !69, line: 894, type: !428)
!992 = !DILocation(line: 894, column: 59, scope: !984)
!993 = !DILocalVariable(name: "u32Temp1", scope: !984, file: !69, line: 896, type: !428)
!994 = !DILocation(line: 896, column: 6, scope: !984)
!995 = !DILocation(line: 897, column: 5, scope: !996)
!996 = distinct !DILexicalBlock(scope: !984, file: !69, line: 897, column: 5)
!997 = !DILocation(line: 897, column: 17, scope: !996)
!998 = !DILocation(line: 897, column: 5, scope: !984)
!999 = !DILocation(line: 899, column: 3, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !996, file: !69, line: 898, column: 2)
!1001 = !DILocation(line: 903, column: 15, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !996, file: !69, line: 902, column: 2)
!1003 = !DILocation(line: 903, column: 25, scope: !1002)
!1004 = !DILocation(line: 903, column: 23, scope: !1002)
!1005 = !DILocation(line: 903, column: 36, scope: !1002)
!1006 = !DILocation(line: 903, column: 34, scope: !1002)
!1007 = !DILocation(line: 903, column: 12, scope: !1002)
!1008 = !DILocation(line: 904, column: 8, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !1002, file: !69, line: 904, column: 6)
!1010 = !DILocation(line: 904, column: 18, scope: !1009)
!1011 = !DILocation(line: 904, column: 16, scope: !1009)
!1012 = !DILocation(line: 904, column: 28, scope: !1009)
!1013 = !DILocation(line: 904, column: 40, scope: !1009)
!1014 = !DILocation(line: 904, column: 39, scope: !1009)
!1015 = !DILocation(line: 904, column: 26, scope: !1009)
!1016 = !DILocation(line: 904, column: 53, scope: !1009)
!1017 = !DILocation(line: 904, column: 64, scope: !1009)
!1018 = !DILocation(line: 904, column: 50, scope: !1009)
!1019 = !DILocation(line: 904, column: 6, scope: !1002)
!1020 = !DILocation(line: 906, column: 12, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1009, file: !69, line: 905, column: 3)
!1022 = !DILocation(line: 907, column: 3, scope: !1021)
!1023 = !DILocation(line: 908, column: 6, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1002, file: !69, line: 908, column: 6)
!1025 = !DILocation(line: 908, column: 15, scope: !1024)
!1026 = !DILocation(line: 908, column: 6, scope: !1002)
!1027 = !DILocation(line: 910, column: 12, scope: !1028)
!1028 = distinct !DILexicalBlock(scope: !1024, file: !69, line: 909, column: 3)
!1029 = !DILocation(line: 910, column: 21, scope: !1028)
!1030 = !DILocation(line: 910, column: 11, scope: !1028)
!1031 = !DILocation(line: 910, column: 4, scope: !1028)
!1032 = !DILocation(line: 914, column: 4, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1024, file: !69, line: 913, column: 3)
!1034 = !DILocation(line: 917, column: 1, scope: !984)
!1035 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 934, type: !1036, scopeLine: 935, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1036 = !DISubroutineType(types: !1037)
!1037 = !{!428, !428, !18}
!1038 = !DILocalVariable(name: "x_value", arg: 1, scope: !1035, file: !69, line: 934, type: !428)
!1039 = !DILocation(line: 934, column: 25, scope: !1035)
!1040 = !DILocalVariable(name: "y_value", arg: 2, scope: !1035, file: !69, line: 934, type: !18)
!1041 = !DILocation(line: 934, column: 38, scope: !1035)
!1042 = !DILocalVariable(name: "u32Temp1", scope: !1035, file: !69, line: 936, type: !428)
!1043 = !DILocation(line: 936, column: 6, scope: !1035)
!1044 = !DILocation(line: 937, column: 5, scope: !1045)
!1045 = distinct !DILexicalBlock(scope: !1035, file: !69, line: 937, column: 5)
!1046 = !DILocation(line: 937, column: 13, scope: !1045)
!1047 = !DILocation(line: 937, column: 5, scope: !1035)
!1048 = !DILocation(line: 939, column: 3, scope: !1049)
!1049 = distinct !DILexicalBlock(scope: !1045, file: !69, line: 938, column: 2)
!1050 = !DILocation(line: 943, column: 15, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1045, file: !69, line: 942, column: 2)
!1052 = !DILocation(line: 943, column: 26, scope: !1051)
!1053 = !DILocation(line: 943, column: 34, scope: !1051)
!1054 = !DILocation(line: 943, column: 33, scope: !1051)
!1055 = !DILocation(line: 943, column: 45, scope: !1051)
!1056 = !DILocation(line: 943, column: 43, scope: !1051)
!1057 = !DILocation(line: 943, column: 23, scope: !1051)
!1058 = !DILocation(line: 943, column: 54, scope: !1051)
!1059 = !DILocation(line: 943, column: 12, scope: !1051)
!1060 = !DILocation(line: 944, column: 15, scope: !1051)
!1061 = !DILocation(line: 944, column: 23, scope: !1051)
!1062 = !DILocation(line: 944, column: 22, scope: !1051)
!1063 = !DILocation(line: 944, column: 35, scope: !1051)
!1064 = !DILocation(line: 944, column: 44, scope: !1051)
!1065 = !DILocation(line: 944, column: 43, scope: !1051)
!1066 = !DILocation(line: 944, column: 32, scope: !1051)
!1067 = !DILocation(line: 944, column: 12, scope: !1051)
!1068 = !DILocation(line: 945, column: 10, scope: !1051)
!1069 = !DILocation(line: 945, column: 3, scope: !1051)
!1070 = !DILocation(line: 947, column: 1, scope: !1035)
!1071 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 965, type: !1072, scopeLine: 966, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{!6, !6, !6, !6}
!1074 = !DILocalVariable(name: "fak1", arg: 1, scope: !1071, file: !69, line: 965, type: !6)
!1075 = !DILocation(line: 965, column: 33, scope: !1071)
!1076 = !DILocalVariable(name: "fak2", arg: 2, scope: !1071, file: !69, line: 965, type: !6)
!1077 = !DILocation(line: 965, column: 43, scope: !1071)
!1078 = !DILocalVariable(name: "div", arg: 3, scope: !1071, file: !69, line: 965, type: !6)
!1079 = !DILocation(line: 965, column: 53, scope: !1071)
!1080 = !DILocalVariable(name: "s32Temp1", scope: !1071, file: !69, line: 967, type: !25)
!1081 = !DILocation(line: 967, column: 6, scope: !1071)
!1082 = !DILocalVariable(name: "s32Temp2", scope: !1071, file: !69, line: 967, type: !25)
!1083 = !DILocation(line: 967, column: 20, scope: !1071)
!1084 = !DILocalVariable(name: "s32Temp3", scope: !1071, file: !69, line: 967, type: !25)
!1085 = !DILocation(line: 967, column: 34, scope: !1071)
!1086 = !DILocation(line: 968, column: 13, scope: !1071)
!1087 = !DILocation(line: 968, column: 20, scope: !1071)
!1088 = !DILocation(line: 968, column: 18, scope: !1071)
!1089 = !DILocation(line: 968, column: 11, scope: !1071)
!1090 = !DILocation(line: 969, column: 5, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1071, file: !69, line: 969, column: 5)
!1092 = !DILocation(line: 969, column: 9, scope: !1091)
!1093 = !DILocation(line: 969, column: 5, scope: !1071)
!1094 = !DILocation(line: 971, column: 6, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1096, file: !69, line: 971, column: 6)
!1096 = distinct !DILexicalBlock(scope: !1091, file: !69, line: 970, column: 2)
!1097 = !DILocation(line: 971, column: 15, scope: !1095)
!1098 = !DILocation(line: 971, column: 6, scope: !1096)
!1099 = !DILocation(line: 973, column: 4, scope: !1100)
!1100 = distinct !DILexicalBlock(scope: !1095, file: !69, line: 972, column: 3)
!1101 = !DILocation(line: 977, column: 4, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1095, file: !69, line: 976, column: 3)
!1103 = !DILocation(line: 982, column: 15, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1091, file: !69, line: 981, column: 2)
!1105 = !DILocation(line: 982, column: 28, scope: !1104)
!1106 = !DILocation(line: 982, column: 39, scope: !1104)
!1107 = !DILocation(line: 982, column: 37, scope: !1104)
!1108 = !DILocation(line: 982, column: 46, scope: !1104)
!1109 = !DILocation(line: 982, column: 44, scope: !1104)
!1110 = !DILocation(line: 982, column: 24, scope: !1104)
!1111 = !DILocation(line: 982, column: 52, scope: !1104)
!1112 = !DILocation(line: 982, column: 12, scope: !1104)
!1113 = !DILocation(line: 983, column: 15, scope: !1104)
!1114 = !DILocation(line: 983, column: 24, scope: !1104)
!1115 = !DILocation(line: 983, column: 23, scope: !1104)
!1116 = !DILocation(line: 983, column: 32, scope: !1104)
!1117 = !DILocation(line: 983, column: 41, scope: !1104)
!1118 = !DILocation(line: 983, column: 40, scope: !1104)
!1119 = !DILocation(line: 983, column: 29, scope: !1104)
!1120 = !DILocation(line: 983, column: 12, scope: !1104)
!1121 = !DILocation(line: 984, column: 6, scope: !1122)
!1122 = distinct !DILexicalBlock(scope: !1104, file: !69, line: 984, column: 6)
!1123 = !DILocation(line: 984, column: 15, scope: !1122)
!1124 = !DILocation(line: 984, column: 6, scope: !1104)
!1125 = !DILocation(line: 986, column: 7, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1127, file: !69, line: 986, column: 7)
!1127 = distinct !DILexicalBlock(scope: !1122, file: !69, line: 985, column: 3)
!1128 = !DILocation(line: 986, column: 16, scope: !1126)
!1129 = !DILocation(line: 986, column: 7, scope: !1127)
!1130 = !DILocation(line: 988, column: 17, scope: !1131)
!1131 = distinct !DILexicalBlock(scope: !1126, file: !69, line: 987, column: 4)
!1132 = !DILocation(line: 988, column: 12, scope: !1131)
!1133 = !DILocation(line: 988, column: 5, scope: !1131)
!1134 = !DILocation(line: 992, column: 5, scope: !1135)
!1135 = distinct !DILexicalBlock(scope: !1126, file: !69, line: 991, column: 4)
!1136 = !DILocation(line: 997, column: 4, scope: !1137)
!1137 = distinct !DILexicalBlock(scope: !1122, file: !69, line: 996, column: 3)
!1138 = !DILocation(line: 1000, column: 1, scope: !1071)
!1139 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1018, type: !1140, scopeLine: 1019, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1140 = !DISubroutineType(types: !1141)
!1141 = !{!6, !6, !6, !18}
!1142 = !DILocalVariable(name: "data1", arg: 1, scope: !1139, file: !69, line: 1018, type: !6)
!1143 = !DILocation(line: 1018, column: 33, scope: !1139)
!1144 = !DILocalVariable(name: "data2", arg: 2, scope: !1139, file: !69, line: 1018, type: !6)
!1145 = !DILocation(line: 1018, column: 43, scope: !1139)
!1146 = !DILocalVariable(name: "denominator", arg: 3, scope: !1139, file: !69, line: 1018, type: !18)
!1147 = !DILocation(line: 1018, column: 53, scope: !1139)
!1148 = !DILocalVariable(name: "s32Result", scope: !1139, file: !69, line: 1020, type: !25)
!1149 = !DILocation(line: 1020, column: 6, scope: !1139)
!1150 = !DILocalVariable(name: "s32Temp1", scope: !1139, file: !69, line: 1020, type: !25)
!1151 = !DILocation(line: 1020, column: 21, scope: !1139)
!1152 = !DILocation(line: 1021, column: 14, scope: !1139)
!1153 = !DILocation(line: 1021, column: 22, scope: !1139)
!1154 = !DILocation(line: 1021, column: 20, scope: !1139)
!1155 = !DILocation(line: 1021, column: 12, scope: !1139)
!1156 = !DILocation(line: 1023, column: 5, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1139, file: !69, line: 1023, column: 5)
!1158 = !DILocation(line: 1023, column: 17, scope: !1157)
!1159 = !DILocation(line: 1023, column: 5, scope: !1139)
!1160 = !DILocation(line: 1025, column: 6, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1162, file: !69, line: 1025, column: 6)
!1162 = distinct !DILexicalBlock(scope: !1157, file: !69, line: 1024, column: 2)
!1163 = !DILocation(line: 1025, column: 16, scope: !1161)
!1164 = !DILocation(line: 1025, column: 6, scope: !1162)
!1165 = !DILocation(line: 1027, column: 4, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1161, file: !69, line: 1026, column: 3)
!1167 = !DILocation(line: 1029, column: 11, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1161, file: !69, line: 1029, column: 11)
!1169 = !DILocation(line: 1029, column: 21, scope: !1168)
!1170 = !DILocation(line: 1029, column: 11, scope: !1161)
!1171 = !DILocation(line: 1031, column: 4, scope: !1172)
!1172 = distinct !DILexicalBlock(scope: !1168, file: !69, line: 1030, column: 3)
!1173 = !DILocation(line: 1035, column: 4, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1168, file: !69, line: 1034, column: 3)
!1175 = !DILocation(line: 1040, column: 15, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1157, file: !69, line: 1039, column: 2)
!1177 = !DILocation(line: 1040, column: 28, scope: !1176)
!1178 = !DILocation(line: 1040, column: 38, scope: !1176)
!1179 = !DILocation(line: 1040, column: 37, scope: !1176)
!1180 = !DILocation(line: 1040, column: 51, scope: !1176)
!1181 = !DILocation(line: 1040, column: 50, scope: !1176)
!1182 = !DILocation(line: 1040, column: 25, scope: !1176)
!1183 = !DILocation(line: 1040, column: 64, scope: !1176)
!1184 = !DILocation(line: 1040, column: 12, scope: !1176)
!1185 = !DILocation(line: 1041, column: 16, scope: !1176)
!1186 = !DILocation(line: 1041, column: 25, scope: !1176)
!1187 = !DILocation(line: 1041, column: 24, scope: !1176)
!1188 = !DILocation(line: 1041, column: 41, scope: !1176)
!1189 = !DILocation(line: 1041, column: 51, scope: !1176)
!1190 = !DILocation(line: 1041, column: 50, scope: !1176)
!1191 = !DILocation(line: 1041, column: 38, scope: !1176)
!1192 = !DILocation(line: 1041, column: 13, scope: !1176)
!1193 = !DILocation(line: 1042, column: 6, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1176, file: !69, line: 1042, column: 6)
!1195 = !DILocation(line: 1042, column: 16, scope: !1194)
!1196 = !DILocation(line: 1042, column: 6, scope: !1176)
!1197 = !DILocation(line: 1044, column: 7, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1199, file: !69, line: 1044, column: 7)
!1199 = distinct !DILexicalBlock(scope: !1194, file: !69, line: 1043, column: 3)
!1200 = !DILocation(line: 1044, column: 17, scope: !1198)
!1201 = !DILocation(line: 1044, column: 7, scope: !1199)
!1202 = !DILocation(line: 1046, column: 17, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1198, file: !69, line: 1045, column: 4)
!1204 = !DILocation(line: 1046, column: 12, scope: !1203)
!1205 = !DILocation(line: 1046, column: 5, scope: !1203)
!1206 = !DILocation(line: 1050, column: 5, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1198, file: !69, line: 1049, column: 4)
!1208 = !DILocation(line: 1055, column: 4, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1194, file: !69, line: 1054, column: 3)
!1210 = !DILocation(line: 1059, column: 1, scope: !1139)
!1211 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1076, type: !1212, scopeLine: 1077, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1212 = !DISubroutineType(types: !1213)
!1213 = !{!428, !428, !25}
!1214 = !DILocalVariable(name: "numerator", arg: 1, scope: !1211, file: !69, line: 1076, type: !428)
!1215 = !DILocation(line: 1076, column: 25, scope: !1211)
!1216 = !DILocalVariable(name: "denominator", arg: 2, scope: !1211, file: !69, line: 1076, type: !25)
!1217 = !DILocation(line: 1076, column: 40, scope: !1211)
!1218 = !DILocalVariable(name: "u32Temp1", scope: !1211, file: !69, line: 1078, type: !428)
!1219 = !DILocation(line: 1078, column: 6, scope: !1211)
!1220 = !DILocation(line: 1079, column: 5, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1211, file: !69, line: 1079, column: 5)
!1222 = !DILocation(line: 1079, column: 17, scope: !1221)
!1223 = !DILocation(line: 1079, column: 5, scope: !1211)
!1224 = !DILocation(line: 1081, column: 3, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1221, file: !69, line: 1080, column: 2)
!1226 = !DILocation(line: 1085, column: 6, scope: !1227)
!1227 = distinct !DILexicalBlock(scope: !1228, file: !69, line: 1085, column: 6)
!1228 = distinct !DILexicalBlock(scope: !1221, file: !69, line: 1084, column: 2)
!1229 = !DILocation(line: 1085, column: 18, scope: !1227)
!1230 = !DILocation(line: 1085, column: 6, scope: !1228)
!1231 = !DILocation(line: 1087, column: 4, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1227, file: !69, line: 1086, column: 3)
!1233 = !DILocation(line: 1091, column: 16, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1227, file: !69, line: 1090, column: 3)
!1235 = !DILocation(line: 1091, column: 30, scope: !1234)
!1236 = !DILocation(line: 1091, column: 40, scope: !1234)
!1237 = !DILocation(line: 1091, column: 39, scope: !1234)
!1238 = !DILocation(line: 1091, column: 55, scope: !1234)
!1239 = !DILocation(line: 1091, column: 53, scope: !1234)
!1240 = !DILocation(line: 1091, column: 26, scope: !1234)
!1241 = !DILocation(line: 1091, column: 68, scope: !1234)
!1242 = !DILocation(line: 1091, column: 13, scope: !1234)
!1243 = !DILocation(line: 1092, column: 16, scope: !1234)
!1244 = !DILocation(line: 1092, column: 25, scope: !1234)
!1245 = !DILocation(line: 1092, column: 24, scope: !1234)
!1246 = !DILocation(line: 1092, column: 41, scope: !1234)
!1247 = !DILocation(line: 1092, column: 51, scope: !1234)
!1248 = !DILocation(line: 1092, column: 50, scope: !1234)
!1249 = !DILocation(line: 1092, column: 38, scope: !1234)
!1250 = !DILocation(line: 1092, column: 13, scope: !1234)
!1251 = !DILocation(line: 1093, column: 11, scope: !1234)
!1252 = !DILocation(line: 1093, column: 4, scope: !1234)
!1253 = !DILocation(line: 1096, column: 1, scope: !1211)
!1254 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1113, type: !1255, scopeLine: 1114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1255 = !DISubroutineType(types: !1256)
!1256 = !{!428, !25, !428}
!1257 = !DILocalVariable(name: "numerator", arg: 1, scope: !1254, file: !69, line: 1113, type: !25)
!1258 = !DILocation(line: 1113, column: 25, scope: !1254)
!1259 = !DILocalVariable(name: "denominator", arg: 2, scope: !1254, file: !69, line: 1113, type: !428)
!1260 = !DILocation(line: 1113, column: 40, scope: !1254)
!1261 = !DILocalVariable(name: "s32Temp1", scope: !1254, file: !69, line: 1115, type: !25)
!1262 = !DILocation(line: 1115, column: 6, scope: !1254)
!1263 = !DILocation(line: 1116, column: 5, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1254, file: !69, line: 1116, column: 5)
!1265 = !DILocation(line: 1116, column: 17, scope: !1264)
!1266 = !DILocation(line: 1116, column: 5, scope: !1254)
!1267 = !DILocation(line: 1118, column: 6, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1269, file: !69, line: 1118, column: 6)
!1269 = distinct !DILexicalBlock(scope: !1264, file: !69, line: 1117, column: 2)
!1270 = !DILocation(line: 1118, column: 16, scope: !1268)
!1271 = !DILocation(line: 1118, column: 6, scope: !1269)
!1272 = !DILocation(line: 1120, column: 4, scope: !1273)
!1273 = distinct !DILexicalBlock(scope: !1268, file: !69, line: 1119, column: 3)
!1274 = !DILocation(line: 1124, column: 4, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1268, file: !69, line: 1123, column: 3)
!1276 = !DILocation(line: 1129, column: 6, scope: !1277)
!1277 = distinct !DILexicalBlock(scope: !1278, file: !69, line: 1129, column: 6)
!1278 = distinct !DILexicalBlock(scope: !1264, file: !69, line: 1128, column: 2)
!1279 = !DILocation(line: 1129, column: 16, scope: !1277)
!1280 = !DILocation(line: 1129, column: 6, scope: !1278)
!1281 = !DILocation(line: 1131, column: 17, scope: !1282)
!1282 = distinct !DILexicalBlock(scope: !1277, file: !69, line: 1130, column: 3)
!1283 = !DILocation(line: 1131, column: 31, scope: !1282)
!1284 = !DILocation(line: 1131, column: 41, scope: !1282)
!1285 = !DILocation(line: 1131, column: 40, scope: !1282)
!1286 = !DILocation(line: 1131, column: 56, scope: !1282)
!1287 = !DILocation(line: 1131, column: 54, scope: !1282)
!1288 = !DILocation(line: 1131, column: 27, scope: !1282)
!1289 = !DILocation(line: 1131, column: 69, scope: !1282)
!1290 = !DILocation(line: 1131, column: 13, scope: !1282)
!1291 = !DILocation(line: 1132, column: 13, scope: !1282)
!1292 = !DILocation(line: 1132, column: 23, scope: !1282)
!1293 = !DILocation(line: 1132, column: 22, scope: !1282)
!1294 = !DILocation(line: 1132, column: 39, scope: !1282)
!1295 = !DILocation(line: 1132, column: 48, scope: !1282)
!1296 = !DILocation(line: 1132, column: 47, scope: !1282)
!1297 = !DILocation(line: 1132, column: 36, scope: !1282)
!1298 = !DILocation(line: 1132, column: 4, scope: !1282)
!1299 = !DILocation(line: 1136, column: 4, scope: !1300)
!1300 = distinct !DILexicalBlock(scope: !1277, file: !69, line: 1135, column: 3)
!1301 = !DILocation(line: 1139, column: 1, scope: !1254)
!1302 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1156, type: !1303, scopeLine: 1157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{!428, !25, !25}
!1305 = !DILocalVariable(name: "numerator", arg: 1, scope: !1302, file: !69, line: 1156, type: !25)
!1306 = !DILocation(line: 1156, column: 25, scope: !1302)
!1307 = !DILocalVariable(name: "denominator", arg: 2, scope: !1302, file: !69, line: 1156, type: !25)
!1308 = !DILocation(line: 1156, column: 40, scope: !1302)
!1309 = !DILocalVariable(name: "u32Temp1", scope: !1302, file: !69, line: 1158, type: !428)
!1310 = !DILocation(line: 1158, column: 6, scope: !1302)
!1311 = !DILocalVariable(name: "u32Temp2", scope: !1302, file: !69, line: 1158, type: !428)
!1312 = !DILocation(line: 1158, column: 20, scope: !1302)
!1313 = !DILocation(line: 1159, column: 5, scope: !1314)
!1314 = distinct !DILexicalBlock(scope: !1302, file: !69, line: 1159, column: 5)
!1315 = !DILocation(line: 1159, column: 17, scope: !1314)
!1316 = !DILocation(line: 1159, column: 5, scope: !1302)
!1317 = !DILocation(line: 1161, column: 6, scope: !1318)
!1318 = distinct !DILexicalBlock(scope: !1319, file: !69, line: 1161, column: 6)
!1319 = distinct !DILexicalBlock(scope: !1314, file: !69, line: 1160, column: 2)
!1320 = !DILocation(line: 1161, column: 16, scope: !1318)
!1321 = !DILocation(line: 1161, column: 6, scope: !1319)
!1322 = !DILocation(line: 1163, column: 4, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1318, file: !69, line: 1162, column: 3)
!1324 = !DILocation(line: 1167, column: 4, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1318, file: !69, line: 1166, column: 3)
!1326 = !DILocation(line: 1172, column: 6, scope: !1327)
!1327 = distinct !DILexicalBlock(scope: !1328, file: !69, line: 1172, column: 6)
!1328 = distinct !DILexicalBlock(scope: !1314, file: !69, line: 1171, column: 2)
!1329 = !DILocation(line: 1172, column: 16, scope: !1327)
!1330 = !DILocation(line: 1172, column: 6, scope: !1328)
!1331 = !DILocation(line: 1174, column: 7, scope: !1332)
!1332 = distinct !DILexicalBlock(scope: !1333, file: !69, line: 1174, column: 7)
!1333 = distinct !DILexicalBlock(scope: !1327, file: !69, line: 1173, column: 3)
!1334 = !DILocation(line: 1174, column: 17, scope: !1332)
!1335 = !DILocation(line: 1174, column: 7, scope: !1333)
!1336 = !DILocation(line: 1176, column: 5, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1332, file: !69, line: 1175, column: 4)
!1338 = !DILocation(line: 1180, column: 8, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1340, file: !69, line: 1180, column: 8)
!1340 = distinct !DILexicalBlock(scope: !1332, file: !69, line: 1179, column: 4)
!1341 = !DILocation(line: 1180, column: 20, scope: !1339)
!1342 = !DILocation(line: 1180, column: 8, scope: !1340)
!1343 = !DILocation(line: 1182, column: 6, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1339, file: !69, line: 1181, column: 5)
!1345 = !DILocation(line: 1186, column: 18, scope: !1346)
!1346 = distinct !DILexicalBlock(scope: !1339, file: !69, line: 1185, column: 5)
!1347 = !DILocation(line: 1186, column: 32, scope: !1346)
!1348 = !DILocation(line: 1186, column: 42, scope: !1346)
!1349 = !DILocation(line: 1186, column: 41, scope: !1346)
!1350 = !DILocation(line: 1186, column: 57, scope: !1346)
!1351 = !DILocation(line: 1186, column: 55, scope: !1346)
!1352 = !DILocation(line: 1186, column: 28, scope: !1346)
!1353 = !DILocation(line: 1186, column: 71, scope: !1346)
!1354 = !DILocation(line: 1186, column: 15, scope: !1346)
!1355 = !DILocation(line: 1187, column: 18, scope: !1346)
!1356 = !DILocation(line: 1187, column: 29, scope: !1346)
!1357 = !DILocation(line: 1187, column: 27, scope: !1346)
!1358 = !DILocation(line: 1187, column: 45, scope: !1346)
!1359 = !DILocation(line: 1187, column: 57, scope: !1346)
!1360 = !DILocation(line: 1187, column: 55, scope: !1346)
!1361 = !DILocation(line: 1187, column: 42, scope: !1346)
!1362 = !DILocation(line: 1187, column: 15, scope: !1346)
!1363 = !DILocation(line: 1188, column: 13, scope: !1346)
!1364 = !DILocation(line: 1188, column: 6, scope: !1346)
!1365 = !DILocation(line: 1194, column: 7, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !1367, file: !69, line: 1194, column: 7)
!1367 = distinct !DILexicalBlock(scope: !1327, file: !69, line: 1193, column: 3)
!1368 = !DILocation(line: 1194, column: 19, scope: !1366)
!1369 = !DILocation(line: 1194, column: 7, scope: !1367)
!1370 = !DILocation(line: 1196, column: 5, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1366, file: !69, line: 1195, column: 4)
!1372 = !DILocation(line: 1200, column: 18, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1366, file: !69, line: 1199, column: 4)
!1374 = !DILocation(line: 1200, column: 17, scope: !1373)
!1375 = !DILocation(line: 1200, column: 15, scope: !1373)
!1376 = !DILocation(line: 1201, column: 20, scope: !1373)
!1377 = !DILocation(line: 1201, column: 19, scope: !1373)
!1378 = !DILocation(line: 1201, column: 17, scope: !1373)
!1379 = !DILocation(line: 1202, column: 17, scope: !1373)
!1380 = !DILocation(line: 1202, column: 31, scope: !1373)
!1381 = !DILocation(line: 1202, column: 41, scope: !1373)
!1382 = !DILocation(line: 1202, column: 40, scope: !1373)
!1383 = !DILocation(line: 1202, column: 56, scope: !1373)
!1384 = !DILocation(line: 1202, column: 54, scope: !1373)
!1385 = !DILocation(line: 1202, column: 27, scope: !1373)
!1386 = !DILocation(line: 1202, column: 70, scope: !1373)
!1387 = !DILocation(line: 1202, column: 14, scope: !1373)
!1388 = !DILocation(line: 1203, column: 17, scope: !1373)
!1389 = !DILocation(line: 1203, column: 28, scope: !1373)
!1390 = !DILocation(line: 1203, column: 26, scope: !1373)
!1391 = !DILocation(line: 1203, column: 44, scope: !1373)
!1392 = !DILocation(line: 1203, column: 56, scope: !1373)
!1393 = !DILocation(line: 1203, column: 54, scope: !1373)
!1394 = !DILocation(line: 1203, column: 41, scope: !1373)
!1395 = !DILocation(line: 1203, column: 14, scope: !1373)
!1396 = !DILocation(line: 1204, column: 12, scope: !1373)
!1397 = !DILocation(line: 1204, column: 5, scope: !1373)
!1398 = !DILocation(line: 1209, column: 1, scope: !1302)
!1399 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1226, type: !1400, scopeLine: 1227, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1400 = !DISubroutineType(types: !1401)
!1401 = !{!428, !428, !428}
!1402 = !DILocalVariable(name: "numerator", arg: 1, scope: !1399, file: !69, line: 1226, type: !428)
!1403 = !DILocation(line: 1226, column: 25, scope: !1399)
!1404 = !DILocalVariable(name: "denominator", arg: 2, scope: !1399, file: !69, line: 1226, type: !428)
!1405 = !DILocation(line: 1226, column: 40, scope: !1399)
!1406 = !DILocalVariable(name: "u32Temp1", scope: !1399, file: !69, line: 1229, type: !428)
!1407 = !DILocation(line: 1229, column: 6, scope: !1399)
!1408 = !DILocalVariable(name: "u32Temp2", scope: !1399, file: !69, line: 1229, type: !428)
!1409 = !DILocation(line: 1229, column: 20, scope: !1399)
!1410 = !DILocalVariable(name: "u32Temp3", scope: !1399, file: !69, line: 1229, type: !428)
!1411 = !DILocation(line: 1229, column: 34, scope: !1399)
!1412 = !DILocalVariable(name: "numerator_old", scope: !1399, file: !69, line: 1229, type: !428)
!1413 = !DILocation(line: 1229, column: 48, scope: !1399)
!1414 = !DILocation(line: 1230, column: 5, scope: !1415)
!1415 = distinct !DILexicalBlock(scope: !1399, file: !69, line: 1230, column: 5)
!1416 = !DILocation(line: 1230, column: 16, scope: !1415)
!1417 = !DILocation(line: 1230, column: 5, scope: !1399)
!1418 = !DILocation(line: 1232, column: 3, scope: !1419)
!1419 = distinct !DILexicalBlock(scope: !1415, file: !69, line: 1231, column: 2)
!1420 = !DILocation(line: 1236, column: 14, scope: !1421)
!1421 = distinct !DILexicalBlock(scope: !1415, file: !69, line: 1235, column: 2)
!1422 = !DILocation(line: 1236, column: 26, scope: !1421)
!1423 = !DILocation(line: 1236, column: 41, scope: !1421)
!1424 = !DILocation(line: 1236, column: 51, scope: !1421)
!1425 = !DILocation(line: 1236, column: 50, scope: !1421)
!1426 = !DILocation(line: 1236, column: 38, scope: !1421)
!1427 = !DILocation(line: 1236, column: 24, scope: !1421)
!1428 = !DILocation(line: 1236, column: 12, scope: !1421)
!1429 = !DILocation(line: 1237, column: 7, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1421, file: !69, line: 1237, column: 6)
!1431 = !DILocation(line: 1237, column: 16, scope: !1430)
!1432 = !DILocation(line: 1237, column: 24, scope: !1430)
!1433 = !DILocation(line: 1237, column: 6, scope: !1421)
!1434 = !DILocation(line: 1239, column: 16, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1430, file: !69, line: 1238, column: 3)
!1436 = !DILocation(line: 1239, column: 27, scope: !1435)
!1437 = !DILocation(line: 1239, column: 13, scope: !1435)
!1438 = !DILocation(line: 1240, column: 3, scope: !1435)
!1439 = !DILocation(line: 1243, column: 16, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1430, file: !69, line: 1242, column: 3)
!1441 = !DILocation(line: 1243, column: 27, scope: !1440)
!1442 = !DILocation(line: 1243, column: 32, scope: !1440)
!1443 = !DILocation(line: 1243, column: 13, scope: !1440)
!1444 = !DILocation(line: 1246, column: 6, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1421, file: !69, line: 1246, column: 6)
!1446 = !DILocation(line: 1246, column: 17, scope: !1445)
!1447 = !DILocation(line: 1246, column: 15, scope: !1445)
!1448 = !DILocation(line: 1246, column: 6, scope: !1421)
!1449 = !DILocation(line: 1248, column: 12, scope: !1450)
!1450 = distinct !DILexicalBlock(scope: !1445, file: !69, line: 1247, column: 3)
!1451 = !DILocation(line: 1248, column: 22, scope: !1450)
!1452 = !DILocation(line: 1248, column: 21, scope: !1450)
!1453 = !DILocation(line: 1248, column: 4, scope: !1450)
!1454 = !DILocation(line: 1252, column: 13, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1445, file: !69, line: 1251, column: 3)
!1456 = !DILocation(line: 1252, column: 23, scope: !1455)
!1457 = !DILocation(line: 1252, column: 22, scope: !1455)
!1458 = !DILocation(line: 1252, column: 36, scope: !1455)
!1459 = !DILocation(line: 1252, column: 4, scope: !1455)
!1460 = !DILocation(line: 1257, column: 1, scope: !1399)
!1461 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1274, type: !1462, scopeLine: 1275, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1462 = !DISubroutineType(types: !1463)
!1463 = !{!25, !428, !25}
!1464 = !DILocalVariable(name: "numerator", arg: 1, scope: !1461, file: !69, line: 1274, type: !428)
!1465 = !DILocation(line: 1274, column: 25, scope: !1461)
!1466 = !DILocalVariable(name: "denominator", arg: 2, scope: !1461, file: !69, line: 1274, type: !25)
!1467 = !DILocation(line: 1274, column: 40, scope: !1461)
!1468 = !DILocalVariable(name: "u32Temp1", scope: !1461, file: !69, line: 1276, type: !428)
!1469 = !DILocation(line: 1276, column: 6, scope: !1461)
!1470 = !DILocalVariable(name: "u32Temp2", scope: !1461, file: !69, line: 1276, type: !428)
!1471 = !DILocation(line: 1276, column: 20, scope: !1461)
!1472 = !DILocation(line: 1277, column: 5, scope: !1473)
!1473 = distinct !DILexicalBlock(scope: !1461, file: !69, line: 1277, column: 5)
!1474 = !DILocation(line: 1277, column: 17, scope: !1473)
!1475 = !DILocation(line: 1277, column: 5, scope: !1461)
!1476 = !DILocation(line: 1279, column: 6, scope: !1477)
!1477 = distinct !DILexicalBlock(scope: !1478, file: !69, line: 1279, column: 6)
!1478 = distinct !DILexicalBlock(scope: !1473, file: !69, line: 1278, column: 2)
!1479 = !DILocation(line: 1279, column: 18, scope: !1477)
!1480 = !DILocation(line: 1279, column: 6, scope: !1478)
!1481 = !DILocation(line: 1281, column: 4, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1477, file: !69, line: 1280, column: 3)
!1483 = !DILocation(line: 1285, column: 19, scope: !1484)
!1484 = distinct !DILexicalBlock(scope: !1477, file: !69, line: 1284, column: 3)
!1485 = !DILocation(line: 1285, column: 18, scope: !1484)
!1486 = !DILocation(line: 1285, column: 16, scope: !1484)
!1487 = !DILocation(line: 1286, column: 16, scope: !1484)
!1488 = !DILocation(line: 1286, column: 30, scope: !1484)
!1489 = !DILocation(line: 1286, column: 40, scope: !1484)
!1490 = !DILocation(line: 1286, column: 39, scope: !1484)
!1491 = !DILocation(line: 1286, column: 55, scope: !1484)
!1492 = !DILocation(line: 1286, column: 53, scope: !1484)
!1493 = !DILocation(line: 1286, column: 26, scope: !1484)
!1494 = !DILocation(line: 1286, column: 69, scope: !1484)
!1495 = !DILocation(line: 1286, column: 13, scope: !1484)
!1496 = !DILocation(line: 1287, column: 16, scope: !1484)
!1497 = !DILocation(line: 1287, column: 25, scope: !1484)
!1498 = !DILocation(line: 1287, column: 24, scope: !1484)
!1499 = !DILocation(line: 1287, column: 41, scope: !1484)
!1500 = !DILocation(line: 1287, column: 51, scope: !1484)
!1501 = !DILocation(line: 1287, column: 50, scope: !1484)
!1502 = !DILocation(line: 1287, column: 38, scope: !1484)
!1503 = !DILocation(line: 1287, column: 13, scope: !1484)
!1504 = !DILocation(line: 1288, column: 7, scope: !1505)
!1505 = distinct !DILexicalBlock(scope: !1484, file: !69, line: 1288, column: 7)
!1506 = !DILocation(line: 1288, column: 16, scope: !1505)
!1507 = !DILocation(line: 1288, column: 7, scope: !1484)
!1508 = !DILocation(line: 1290, column: 13, scope: !1509)
!1509 = distinct !DILexicalBlock(scope: !1505, file: !69, line: 1289, column: 4)
!1510 = !DILocation(line: 1290, column: 12, scope: !1509)
!1511 = !DILocation(line: 1290, column: 5, scope: !1509)
!1512 = !DILocation(line: 1294, column: 5, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1505, file: !69, line: 1293, column: 4)
!1514 = !DILocation(line: 1300, column: 15, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1473, file: !69, line: 1299, column: 2)
!1516 = !DILocation(line: 1300, column: 29, scope: !1515)
!1517 = !DILocation(line: 1300, column: 39, scope: !1515)
!1518 = !DILocation(line: 1300, column: 38, scope: !1515)
!1519 = !DILocation(line: 1300, column: 54, scope: !1515)
!1520 = !DILocation(line: 1300, column: 52, scope: !1515)
!1521 = !DILocation(line: 1300, column: 25, scope: !1515)
!1522 = !DILocation(line: 1300, column: 68, scope: !1515)
!1523 = !DILocation(line: 1300, column: 12, scope: !1515)
!1524 = !DILocation(line: 1301, column: 15, scope: !1515)
!1525 = !DILocation(line: 1301, column: 24, scope: !1515)
!1526 = !DILocation(line: 1301, column: 23, scope: !1515)
!1527 = !DILocation(line: 1301, column: 40, scope: !1515)
!1528 = !DILocation(line: 1301, column: 50, scope: !1515)
!1529 = !DILocation(line: 1301, column: 49, scope: !1515)
!1530 = !DILocation(line: 1301, column: 37, scope: !1515)
!1531 = !DILocation(line: 1301, column: 12, scope: !1515)
!1532 = !DILocation(line: 1302, column: 6, scope: !1533)
!1533 = distinct !DILexicalBlock(scope: !1515, file: !69, line: 1302, column: 6)
!1534 = !DILocation(line: 1302, column: 15, scope: !1533)
!1535 = !DILocation(line: 1302, column: 6, scope: !1515)
!1536 = !DILocation(line: 1304, column: 11, scope: !1537)
!1537 = distinct !DILexicalBlock(scope: !1533, file: !69, line: 1303, column: 3)
!1538 = !DILocation(line: 1304, column: 4, scope: !1537)
!1539 = !DILocation(line: 1308, column: 4, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1533, file: !69, line: 1307, column: 3)
!1541 = !DILocation(line: 1311, column: 1, scope: !1461)
!1542 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1329, type: !1543, scopeLine: 1330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1543 = !DISubroutineType(types: !1544)
!1544 = !{!25, !25, !428}
!1545 = !DILocalVariable(name: "numerator", arg: 1, scope: !1542, file: !69, line: 1329, type: !25)
!1546 = !DILocation(line: 1329, column: 25, scope: !1542)
!1547 = !DILocalVariable(name: "denominator", arg: 2, scope: !1542, file: !69, line: 1329, type: !428)
!1548 = !DILocation(line: 1329, column: 40, scope: !1542)
!1549 = !DILocalVariable(name: "s32Temp1", scope: !1542, file: !69, line: 1331, type: !25)
!1550 = !DILocation(line: 1331, column: 6, scope: !1542)
!1551 = !DILocalVariable(name: "s32Temp2", scope: !1542, file: !69, line: 1331, type: !25)
!1552 = !DILocation(line: 1331, column: 20, scope: !1542)
!1553 = !DILocalVariable(name: "u32Temp0", scope: !1542, file: !69, line: 1332, type: !428)
!1554 = !DILocation(line: 1332, column: 6, scope: !1542)
!1555 = !DILocalVariable(name: "u32Temp1", scope: !1542, file: !69, line: 1332, type: !428)
!1556 = !DILocation(line: 1332, column: 20, scope: !1542)
!1557 = !DILocalVariable(name: "u32Temp2", scope: !1542, file: !69, line: 1332, type: !428)
!1558 = !DILocation(line: 1332, column: 34, scope: !1542)
!1559 = !DILocation(line: 1333, column: 5, scope: !1560)
!1560 = distinct !DILexicalBlock(scope: !1542, file: !69, line: 1333, column: 5)
!1561 = !DILocation(line: 1333, column: 17, scope: !1560)
!1562 = !DILocation(line: 1333, column: 5, scope: !1542)
!1563 = !DILocation(line: 1335, column: 6, scope: !1564)
!1564 = distinct !DILexicalBlock(scope: !1565, file: !69, line: 1335, column: 6)
!1565 = distinct !DILexicalBlock(scope: !1560, file: !69, line: 1334, column: 2)
!1566 = !DILocation(line: 1335, column: 16, scope: !1564)
!1567 = !DILocation(line: 1335, column: 6, scope: !1565)
!1568 = !DILocation(line: 1337, column: 4, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1564, file: !69, line: 1336, column: 3)
!1570 = !DILocation(line: 1341, column: 4, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1564, file: !69, line: 1340, column: 3)
!1572 = !DILocation(line: 1346, column: 6, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1574, file: !69, line: 1346, column: 6)
!1574 = distinct !DILexicalBlock(scope: !1560, file: !69, line: 1345, column: 2)
!1575 = !DILocation(line: 1346, column: 16, scope: !1573)
!1576 = !DILocation(line: 1346, column: 6, scope: !1574)
!1577 = !DILocation(line: 1348, column: 16, scope: !1578)
!1578 = distinct !DILexicalBlock(scope: !1573, file: !69, line: 1347, column: 3)
!1579 = !DILocation(line: 1348, column: 15, scope: !1578)
!1580 = !DILocation(line: 1348, column: 13, scope: !1578)
!1581 = !DILocation(line: 1349, column: 16, scope: !1578)
!1582 = !DILocation(line: 1349, column: 25, scope: !1578)
!1583 = !DILocation(line: 1349, column: 24, scope: !1578)
!1584 = !DILocation(line: 1349, column: 13, scope: !1578)
!1585 = !DILocation(line: 1350, column: 15, scope: !1578)
!1586 = !DILocation(line: 1350, column: 28, scope: !1578)
!1587 = !DILocation(line: 1350, column: 37, scope: !1578)
!1588 = !DILocation(line: 1350, column: 36, scope: !1578)
!1589 = !DILocation(line: 1350, column: 52, scope: !1578)
!1590 = !DILocation(line: 1350, column: 50, scope: !1578)
!1591 = !DILocation(line: 1350, column: 24, scope: !1578)
!1592 = !DILocation(line: 1350, column: 13, scope: !1578)
!1593 = !DILocation(line: 1352, column: 8, scope: !1594)
!1594 = distinct !DILexicalBlock(scope: !1578, file: !69, line: 1352, column: 7)
!1595 = !DILocation(line: 1352, column: 20, scope: !1594)
!1596 = !DILocation(line: 1352, column: 27, scope: !1594)
!1597 = !DILocation(line: 1352, column: 7, scope: !1578)
!1598 = !DILocation(line: 1354, column: 20, scope: !1599)
!1599 = distinct !DILexicalBlock(scope: !1594, file: !69, line: 1353, column: 4)
!1600 = !DILocation(line: 1354, column: 32, scope: !1599)
!1601 = !DILocation(line: 1354, column: 17, scope: !1599)
!1602 = !DILocation(line: 1355, column: 4, scope: !1599)
!1603 = !DILocation(line: 1358, column: 20, scope: !1604)
!1604 = distinct !DILexicalBlock(scope: !1594, file: !69, line: 1357, column: 4)
!1605 = !DILocation(line: 1358, column: 32, scope: !1604)
!1606 = !DILocation(line: 1358, column: 38, scope: !1604)
!1607 = !DILocation(line: 1358, column: 17, scope: !1604)
!1608 = !DILocation(line: 1362, column: 7, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1578, file: !69, line: 1362, column: 7)
!1610 = !DILocation(line: 1362, column: 18, scope: !1609)
!1611 = !DILocation(line: 1362, column: 16, scope: !1609)
!1612 = !DILocation(line: 1362, column: 7, scope: !1578)
!1613 = !DILocation(line: 1364, column: 14, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1609, file: !69, line: 1363, column: 4)
!1615 = !DILocation(line: 1364, column: 13, scope: !1614)
!1616 = !DILocation(line: 1364, column: 23, scope: !1614)
!1617 = !DILocation(line: 1364, column: 5, scope: !1614)
!1618 = !DILocation(line: 1368, column: 14, scope: !1619)
!1619 = distinct !DILexicalBlock(scope: !1609, file: !69, line: 1367, column: 4)
!1620 = !DILocation(line: 1368, column: 23, scope: !1619)
!1621 = !DILocation(line: 1368, column: 12, scope: !1619)
!1622 = !DILocation(line: 1368, column: 27, scope: !1619)
!1623 = !DILocation(line: 1368, column: 5, scope: !1619)
!1624 = !DILocation(line: 1375, column: 16, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1573, file: !69, line: 1374, column: 3)
!1626 = !DILocation(line: 1375, column: 30, scope: !1625)
!1627 = !DILocation(line: 1375, column: 40, scope: !1625)
!1628 = !DILocation(line: 1375, column: 39, scope: !1625)
!1629 = !DILocation(line: 1375, column: 55, scope: !1625)
!1630 = !DILocation(line: 1375, column: 53, scope: !1625)
!1631 = !DILocation(line: 1375, column: 26, scope: !1625)
!1632 = !DILocation(line: 1375, column: 69, scope: !1625)
!1633 = !DILocation(line: 1375, column: 13, scope: !1625)
!1634 = !DILocation(line: 1376, column: 16, scope: !1625)
!1635 = !DILocation(line: 1376, column: 26, scope: !1625)
!1636 = !DILocation(line: 1376, column: 25, scope: !1625)
!1637 = !DILocation(line: 1376, column: 42, scope: !1625)
!1638 = !DILocation(line: 1376, column: 51, scope: !1625)
!1639 = !DILocation(line: 1376, column: 50, scope: !1625)
!1640 = !DILocation(line: 1376, column: 39, scope: !1625)
!1641 = !DILocation(line: 1376, column: 13, scope: !1625)
!1642 = !DILocation(line: 1377, column: 11, scope: !1625)
!1643 = !DILocation(line: 1377, column: 4, scope: !1625)
!1644 = !DILocation(line: 1380, column: 1, scope: !1542)
!1645 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1397, type: !1646, scopeLine: 1398, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1646 = !DISubroutineType(types: !1647)
!1647 = !{!25, !25, !25}
!1648 = !DILocalVariable(name: "numerator", arg: 1, scope: !1645, file: !69, line: 1397, type: !25)
!1649 = !DILocation(line: 1397, column: 25, scope: !1645)
!1650 = !DILocalVariable(name: "denominator", arg: 2, scope: !1645, file: !69, line: 1397, type: !25)
!1651 = !DILocation(line: 1397, column: 40, scope: !1645)
!1652 = !DILocalVariable(name: "s32Temp1", scope: !1645, file: !69, line: 1399, type: !25)
!1653 = !DILocation(line: 1399, column: 6, scope: !1645)
!1654 = !DILocalVariable(name: "s32Temp2", scope: !1645, file: !69, line: 1399, type: !25)
!1655 = !DILocation(line: 1399, column: 20, scope: !1645)
!1656 = !DILocalVariable(name: "denominator_prime", scope: !1645, file: !69, line: 1400, type: !428)
!1657 = !DILocation(line: 1400, column: 6, scope: !1645)
!1658 = !DILocalVariable(name: "u32Temp1", scope: !1645, file: !69, line: 1400, type: !428)
!1659 = !DILocation(line: 1400, column: 29, scope: !1645)
!1660 = !DILocalVariable(name: "u32Temp2", scope: !1645, file: !69, line: 1400, type: !428)
!1661 = !DILocation(line: 1400, column: 43, scope: !1645)
!1662 = !DILocalVariable(name: "u32numerator", scope: !1645, file: !69, line: 1401, type: !428)
!1663 = !DILocation(line: 1401, column: 6, scope: !1645)
!1664 = !DILocalVariable(name: "u32denominator", scope: !1645, file: !69, line: 1401, type: !428)
!1665 = !DILocation(line: 1401, column: 23, scope: !1645)
!1666 = !DILocation(line: 1402, column: 5, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1645, file: !69, line: 1402, column: 5)
!1668 = !DILocation(line: 1402, column: 15, scope: !1667)
!1669 = !DILocation(line: 1402, column: 5, scope: !1645)
!1670 = !DILocation(line: 1404, column: 6, scope: !1671)
!1671 = distinct !DILexicalBlock(scope: !1672, file: !69, line: 1404, column: 6)
!1672 = distinct !DILexicalBlock(scope: !1667, file: !69, line: 1403, column: 2)
!1673 = !DILocation(line: 1404, column: 18, scope: !1671)
!1674 = !DILocation(line: 1404, column: 6, scope: !1672)
!1675 = !DILocation(line: 1406, column: 7, scope: !1676)
!1676 = distinct !DILexicalBlock(scope: !1677, file: !69, line: 1406, column: 7)
!1677 = distinct !DILexicalBlock(scope: !1671, file: !69, line: 1405, column: 3)
!1678 = !DILocation(line: 1406, column: 19, scope: !1676)
!1679 = !DILocation(line: 1406, column: 7, scope: !1677)
!1680 = !DILocation(line: 1408, column: 5, scope: !1681)
!1681 = distinct !DILexicalBlock(scope: !1676, file: !69, line: 1407, column: 4)
!1682 = !DILocation(line: 1412, column: 21, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1676, file: !69, line: 1411, column: 4)
!1684 = !DILocation(line: 1412, column: 20, scope: !1683)
!1685 = !DILocation(line: 1412, column: 18, scope: !1683)
!1686 = !DILocation(line: 1413, column: 23, scope: !1683)
!1687 = !DILocation(line: 1413, column: 22, scope: !1683)
!1688 = !DILocation(line: 1413, column: 20, scope: !1683)
!1689 = !DILocation(line: 1414, column: 16, scope: !1683)
!1690 = !DILocation(line: 1414, column: 33, scope: !1683)
!1691 = !DILocation(line: 1414, column: 46, scope: !1683)
!1692 = !DILocation(line: 1414, column: 45, scope: !1683)
!1693 = !DILocation(line: 1414, column: 64, scope: !1683)
!1694 = !DILocation(line: 1414, column: 62, scope: !1683)
!1695 = !DILocation(line: 1414, column: 29, scope: !1683)
!1696 = !DILocation(line: 1414, column: 81, scope: !1683)
!1697 = !DILocation(line: 1414, column: 14, scope: !1683)
!1698 = !DILocation(line: 1415, column: 17, scope: !1683)
!1699 = !DILocation(line: 1415, column: 30, scope: !1683)
!1700 = !DILocation(line: 1415, column: 29, scope: !1683)
!1701 = !DILocation(line: 1415, column: 49, scope: !1683)
!1702 = !DILocation(line: 1415, column: 58, scope: !1683)
!1703 = !DILocation(line: 1415, column: 57, scope: !1683)
!1704 = !DILocation(line: 1415, column: 46, scope: !1683)
!1705 = !DILocation(line: 1415, column: 14, scope: !1683)
!1706 = !DILocation(line: 1416, column: 8, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !1683, file: !69, line: 1416, column: 8)
!1708 = !DILocation(line: 1416, column: 17, scope: !1707)
!1709 = !DILocation(line: 1416, column: 8, scope: !1683)
!1710 = !DILocation(line: 1418, column: 13, scope: !1711)
!1711 = distinct !DILexicalBlock(scope: !1707, file: !69, line: 1417, column: 5)
!1712 = !DILocation(line: 1418, column: 6, scope: !1711)
!1713 = !DILocation(line: 1422, column: 6, scope: !1714)
!1714 = distinct !DILexicalBlock(scope: !1707, file: !69, line: 1421, column: 5)
!1715 = !DILocation(line: 1428, column: 20, scope: !1716)
!1716 = distinct !DILexicalBlock(scope: !1671, file: !69, line: 1427, column: 3)
!1717 = !DILocation(line: 1428, column: 19, scope: !1716)
!1718 = !DILocation(line: 1428, column: 29, scope: !1716)
!1719 = !DILocation(line: 1428, column: 17, scope: !1716)
!1720 = !DILocation(line: 1429, column: 16, scope: !1716)
!1721 = !DILocation(line: 1429, column: 33, scope: !1716)
!1722 = !DILocation(line: 1429, column: 46, scope: !1716)
!1723 = !DILocation(line: 1429, column: 45, scope: !1716)
!1724 = !DILocation(line: 1429, column: 61, scope: !1716)
!1725 = !DILocation(line: 1429, column: 59, scope: !1716)
!1726 = !DILocation(line: 1429, column: 29, scope: !1716)
!1727 = !DILocation(line: 1429, column: 75, scope: !1716)
!1728 = !DILocation(line: 1429, column: 13, scope: !1716)
!1729 = !DILocation(line: 1430, column: 16, scope: !1716)
!1730 = !DILocation(line: 1430, column: 29, scope: !1716)
!1731 = !DILocation(line: 1430, column: 28, scope: !1716)
!1732 = !DILocation(line: 1430, column: 45, scope: !1716)
!1733 = !DILocation(line: 1430, column: 54, scope: !1716)
!1734 = !DILocation(line: 1430, column: 53, scope: !1716)
!1735 = !DILocation(line: 1430, column: 42, scope: !1716)
!1736 = !DILocation(line: 1430, column: 13, scope: !1716)
!1737 = !DILocation(line: 1431, column: 13, scope: !1716)
!1738 = !DILocation(line: 1431, column: 12, scope: !1716)
!1739 = !DILocation(line: 1431, column: 22, scope: !1716)
!1740 = !DILocation(line: 1431, column: 4, scope: !1716)
!1741 = !DILocation(line: 1436, column: 6, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1743, file: !69, line: 1436, column: 6)
!1743 = distinct !DILexicalBlock(scope: !1667, file: !69, line: 1435, column: 2)
!1744 = !DILocation(line: 1436, column: 18, scope: !1742)
!1745 = !DILocation(line: 1436, column: 6, scope: !1743)
!1746 = !DILocation(line: 1438, column: 7, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1748, file: !69, line: 1438, column: 7)
!1748 = distinct !DILexicalBlock(scope: !1742, file: !69, line: 1437, column: 3)
!1749 = !DILocation(line: 1438, column: 19, scope: !1747)
!1750 = !DILocation(line: 1438, column: 7, scope: !1748)
!1751 = !DILocation(line: 1440, column: 5, scope: !1752)
!1752 = distinct !DILexicalBlock(scope: !1747, file: !69, line: 1439, column: 4)
!1753 = !DILocation(line: 1444, column: 23, scope: !1754)
!1754 = distinct !DILexicalBlock(scope: !1747, file: !69, line: 1443, column: 4)
!1755 = !DILocation(line: 1444, column: 22, scope: !1754)
!1756 = !DILocation(line: 1444, column: 35, scope: !1754)
!1757 = !DILocation(line: 1444, column: 20, scope: !1754)
!1758 = !DILocation(line: 1445, column: 17, scope: !1754)
!1759 = !DILocation(line: 1445, column: 31, scope: !1754)
!1760 = !DILocation(line: 1445, column: 41, scope: !1754)
!1761 = !DILocation(line: 1445, column: 40, scope: !1754)
!1762 = !DILocation(line: 1445, column: 59, scope: !1754)
!1763 = !DILocation(line: 1445, column: 57, scope: !1754)
!1764 = !DILocation(line: 1445, column: 27, scope: !1754)
!1765 = !DILocation(line: 1445, column: 76, scope: !1754)
!1766 = !DILocation(line: 1445, column: 14, scope: !1754)
!1767 = !DILocation(line: 1446, column: 17, scope: !1754)
!1768 = !DILocation(line: 1446, column: 27, scope: !1754)
!1769 = !DILocation(line: 1446, column: 26, scope: !1754)
!1770 = !DILocation(line: 1446, column: 46, scope: !1754)
!1771 = !DILocation(line: 1446, column: 55, scope: !1754)
!1772 = !DILocation(line: 1446, column: 54, scope: !1754)
!1773 = !DILocation(line: 1446, column: 43, scope: !1754)
!1774 = !DILocation(line: 1446, column: 14, scope: !1754)
!1775 = !DILocation(line: 1447, column: 14, scope: !1754)
!1776 = !DILocation(line: 1447, column: 13, scope: !1754)
!1777 = !DILocation(line: 1447, column: 23, scope: !1754)
!1778 = !DILocation(line: 1447, column: 5, scope: !1754)
!1779 = !DILocation(line: 1452, column: 16, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1742, file: !69, line: 1451, column: 3)
!1781 = !DILocation(line: 1452, column: 30, scope: !1780)
!1782 = !DILocation(line: 1452, column: 40, scope: !1780)
!1783 = !DILocation(line: 1452, column: 39, scope: !1780)
!1784 = !DILocation(line: 1452, column: 55, scope: !1780)
!1785 = !DILocation(line: 1452, column: 53, scope: !1780)
!1786 = !DILocation(line: 1452, column: 26, scope: !1780)
!1787 = !DILocation(line: 1452, column: 69, scope: !1780)
!1788 = !DILocation(line: 1452, column: 13, scope: !1780)
!1789 = !DILocation(line: 1453, column: 16, scope: !1780)
!1790 = !DILocation(line: 1453, column: 26, scope: !1780)
!1791 = !DILocation(line: 1453, column: 25, scope: !1780)
!1792 = !DILocation(line: 1453, column: 42, scope: !1780)
!1793 = !DILocation(line: 1453, column: 51, scope: !1780)
!1794 = !DILocation(line: 1453, column: 50, scope: !1780)
!1795 = !DILocation(line: 1453, column: 39, scope: !1780)
!1796 = !DILocation(line: 1453, column: 13, scope: !1780)
!1797 = !DILocation(line: 1454, column: 11, scope: !1780)
!1798 = !DILocation(line: 1454, column: 4, scope: !1780)
!1799 = !DILocation(line: 1457, column: 1, scope: !1645)
!1800 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1475, type: !1801, scopeLine: 1476, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1801 = !DISubroutineType(types: !1802)
!1802 = !{!6, !25, !428}
!1803 = !DILocalVariable(name: "numerator", arg: 1, scope: !1800, file: !69, line: 1475, type: !25)
!1804 = !DILocation(line: 1475, column: 25, scope: !1800)
!1805 = !DILocalVariable(name: "denominator", arg: 2, scope: !1800, file: !69, line: 1475, type: !428)
!1806 = !DILocation(line: 1475, column: 40, scope: !1800)
!1807 = !DILocalVariable(name: "numerator_prime", scope: !1800, file: !69, line: 1478, type: !428)
!1808 = !DILocation(line: 1478, column: 6, scope: !1800)
!1809 = !DILocalVariable(name: "u32Temp1", scope: !1800, file: !69, line: 1478, type: !428)
!1810 = !DILocation(line: 1478, column: 27, scope: !1800)
!1811 = !DILocalVariable(name: "u32Temp2", scope: !1800, file: !69, line: 1478, type: !428)
!1812 = !DILocation(line: 1478, column: 41, scope: !1800)
!1813 = !DILocalVariable(name: "u32Temp3", scope: !1800, file: !69, line: 1478, type: !428)
!1814 = !DILocation(line: 1478, column: 55, scope: !1800)
!1815 = !DILocalVariable(name: "s32Temp1", scope: !1800, file: !69, line: 1479, type: !25)
!1816 = !DILocation(line: 1479, column: 6, scope: !1800)
!1817 = !DILocalVariable(name: "s32Temp2", scope: !1800, file: !69, line: 1479, type: !25)
!1818 = !DILocation(line: 1479, column: 20, scope: !1800)
!1819 = !DILocalVariable(name: "s32Temp3", scope: !1800, file: !69, line: 1479, type: !25)
!1820 = !DILocation(line: 1479, column: 34, scope: !1800)
!1821 = !DILocation(line: 1480, column: 5, scope: !1822)
!1822 = distinct !DILexicalBlock(scope: !1800, file: !69, line: 1480, column: 5)
!1823 = !DILocation(line: 1480, column: 17, scope: !1822)
!1824 = !DILocation(line: 1480, column: 5, scope: !1800)
!1825 = !DILocation(line: 1482, column: 6, scope: !1826)
!1826 = distinct !DILexicalBlock(scope: !1827, file: !69, line: 1482, column: 6)
!1827 = distinct !DILexicalBlock(scope: !1822, file: !69, line: 1481, column: 2)
!1828 = !DILocation(line: 1482, column: 15, scope: !1826)
!1829 = !DILocation(line: 1482, column: 6, scope: !1827)
!1830 = !DILocation(line: 1484, column: 4, scope: !1831)
!1831 = distinct !DILexicalBlock(scope: !1826, file: !69, line: 1483, column: 3)
!1832 = !DILocation(line: 1488, column: 4, scope: !1833)
!1833 = distinct !DILexicalBlock(scope: !1826, file: !69, line: 1487, column: 3)
!1834 = !DILocation(line: 1493, column: 6, scope: !1835)
!1835 = distinct !DILexicalBlock(scope: !1836, file: !69, line: 1493, column: 6)
!1836 = distinct !DILexicalBlock(scope: !1822, file: !69, line: 1492, column: 2)
!1837 = !DILocation(line: 1493, column: 16, scope: !1835)
!1838 = !DILocation(line: 1493, column: 6, scope: !1836)
!1839 = !DILocation(line: 1495, column: 23, scope: !1840)
!1840 = distinct !DILexicalBlock(scope: !1835, file: !69, line: 1494, column: 3)
!1841 = !DILocation(line: 1495, column: 22, scope: !1840)
!1842 = !DILocation(line: 1495, column: 20, scope: !1840)
!1843 = !DILocation(line: 1496, column: 16, scope: !1840)
!1844 = !DILocation(line: 1496, column: 32, scope: !1840)
!1845 = !DILocation(line: 1496, column: 31, scope: !1840)
!1846 = !DILocation(line: 1496, column: 13, scope: !1840)
!1847 = !DILocation(line: 1497, column: 15, scope: !1840)
!1848 = !DILocation(line: 1497, column: 34, scope: !1840)
!1849 = !DILocation(line: 1497, column: 45, scope: !1840)
!1850 = !DILocation(line: 1497, column: 43, scope: !1840)
!1851 = !DILocation(line: 1497, column: 31, scope: !1840)
!1852 = !DILocation(line: 1497, column: 13, scope: !1840)
!1853 = !DILocation(line: 1499, column: 8, scope: !1854)
!1854 = distinct !DILexicalBlock(scope: !1840, file: !69, line: 1499, column: 7)
!1855 = !DILocation(line: 1499, column: 20, scope: !1854)
!1856 = !DILocation(line: 1499, column: 27, scope: !1854)
!1857 = !DILocation(line: 1499, column: 7, scope: !1840)
!1858 = !DILocation(line: 1501, column: 19, scope: !1859)
!1859 = distinct !DILexicalBlock(scope: !1854, file: !69, line: 1500, column: 4)
!1860 = !DILocation(line: 1501, column: 31, scope: !1859)
!1861 = !DILocation(line: 1501, column: 17, scope: !1859)
!1862 = !DILocation(line: 1502, column: 4, scope: !1859)
!1863 = !DILocation(line: 1505, column: 20, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1854, file: !69, line: 1504, column: 4)
!1865 = !DILocation(line: 1505, column: 32, scope: !1864)
!1866 = !DILocation(line: 1505, column: 38, scope: !1864)
!1867 = !DILocation(line: 1505, column: 17, scope: !1864)
!1868 = !DILocation(line: 1508, column: 7, scope: !1869)
!1869 = distinct !DILexicalBlock(scope: !1840, file: !69, line: 1508, column: 7)
!1870 = !DILocation(line: 1508, column: 18, scope: !1869)
!1871 = !DILocation(line: 1508, column: 16, scope: !1869)
!1872 = !DILocation(line: 1508, column: 7, scope: !1840)
!1873 = !DILocation(line: 1510, column: 18, scope: !1874)
!1874 = distinct !DILexicalBlock(scope: !1869, file: !69, line: 1509, column: 4)
!1875 = !DILocation(line: 1510, column: 16, scope: !1874)
!1876 = !DILocation(line: 1510, column: 28, scope: !1874)
!1877 = !DILocation(line: 1510, column: 14, scope: !1874)
!1878 = !DILocation(line: 1511, column: 4, scope: !1874)
!1879 = !DILocation(line: 1514, column: 18, scope: !1880)
!1880 = distinct !DILexicalBlock(scope: !1869, file: !69, line: 1513, column: 4)
!1881 = !DILocation(line: 1514, column: 26, scope: !1880)
!1882 = !DILocation(line: 1514, column: 16, scope: !1880)
!1883 = !DILocation(line: 1514, column: 30, scope: !1880)
!1884 = !DILocation(line: 1514, column: 14, scope: !1880)
!1885 = !DILocation(line: 1516, column: 8, scope: !1886)
!1886 = distinct !DILexicalBlock(scope: !1840, file: !69, line: 1516, column: 7)
!1887 = !DILocation(line: 1516, column: 18, scope: !1886)
!1888 = !DILocation(line: 1516, column: 7, scope: !1840)
!1889 = !DILocation(line: 1518, column: 18, scope: !1890)
!1890 = distinct !DILexicalBlock(scope: !1886, file: !69, line: 1517, column: 4)
!1891 = !DILocation(line: 1518, column: 12, scope: !1890)
!1892 = !DILocation(line: 1518, column: 5, scope: !1890)
!1893 = !DILocation(line: 1522, column: 5, scope: !1894)
!1894 = distinct !DILexicalBlock(scope: !1886, file: !69, line: 1521, column: 4)
!1895 = !DILocation(line: 1527, column: 16, scope: !1896)
!1896 = distinct !DILexicalBlock(scope: !1835, file: !69, line: 1526, column: 3)
!1897 = !DILocation(line: 1527, column: 26, scope: !1896)
!1898 = !DILocation(line: 1527, column: 25, scope: !1896)
!1899 = !DILocation(line: 1527, column: 41, scope: !1896)
!1900 = !DILocation(line: 1527, column: 39, scope: !1896)
!1901 = !DILocation(line: 1527, column: 13, scope: !1896)
!1902 = !DILocation(line: 1528, column: 16, scope: !1896)
!1903 = !DILocation(line: 1528, column: 30, scope: !1896)
!1904 = !DILocation(line: 1528, column: 40, scope: !1896)
!1905 = !DILocation(line: 1528, column: 39, scope: !1896)
!1906 = !DILocation(line: 1528, column: 55, scope: !1896)
!1907 = !DILocation(line: 1528, column: 53, scope: !1896)
!1908 = !DILocation(line: 1528, column: 26, scope: !1896)
!1909 = !DILocation(line: 1528, column: 68, scope: !1896)
!1910 = !DILocation(line: 1528, column: 13, scope: !1896)
!1911 = !DILocation(line: 1529, column: 16, scope: !1896)
!1912 = !DILocation(line: 1529, column: 25, scope: !1896)
!1913 = !DILocation(line: 1529, column: 24, scope: !1896)
!1914 = !DILocation(line: 1529, column: 41, scope: !1896)
!1915 = !DILocation(line: 1529, column: 51, scope: !1896)
!1916 = !DILocation(line: 1529, column: 50, scope: !1896)
!1917 = !DILocation(line: 1529, column: 38, scope: !1896)
!1918 = !DILocation(line: 1529, column: 13, scope: !1896)
!1919 = !DILocation(line: 1530, column: 7, scope: !1920)
!1920 = distinct !DILexicalBlock(scope: !1896, file: !69, line: 1530, column: 7)
!1921 = !DILocation(line: 1530, column: 16, scope: !1920)
!1922 = !DILocation(line: 1530, column: 7, scope: !1896)
!1923 = !DILocation(line: 1532, column: 17, scope: !1924)
!1924 = distinct !DILexicalBlock(scope: !1920, file: !69, line: 1531, column: 4)
!1925 = !DILocation(line: 1532, column: 12, scope: !1924)
!1926 = !DILocation(line: 1532, column: 5, scope: !1924)
!1927 = !DILocation(line: 1536, column: 5, scope: !1928)
!1928 = distinct !DILexicalBlock(scope: !1920, file: !69, line: 1535, column: 4)
!1929 = !DILocation(line: 1540, column: 1, scope: !1800)
!1930 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1931, file: !1931, line: 12, type: !1932, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !34, retainedNodes: !1935)
!1931 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1932 = !DISubroutineType(types: !1933)
!1933 = !{null, !1934}
!1934 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1935 = !{!1936}
!1936 = !DILocalVariable(name: "z", arg: 1, scope: !1930, file: !1931, line: 12, type: !1934)
!1937 = !DILocation(line: 0, scope: !1930)
!1938 = !DILocation(line: 13, column: 9, scope: !1939)
!1939 = distinct !DILexicalBlock(scope: !1930, file: !1931, line: 13, column: 7)
!1940 = !DILocation(line: 13, column: 7, scope: !1930)
!1941 = !DILocation(line: 14, column: 5, scope: !1939)
!1942 = !DILocation(line: 15, column: 1, scope: !1930)
