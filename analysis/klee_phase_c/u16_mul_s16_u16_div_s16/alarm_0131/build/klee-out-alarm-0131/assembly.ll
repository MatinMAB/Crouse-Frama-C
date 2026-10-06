; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0131/build/u16_mul_s16_u16_div_s16_alarm_0131.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"factor1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"factor2\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [131 x i8] c"KLEE-ALARM-0131: signed overflow. assert -2147483648 <= s32Result - (s32)((s32)(s32Result / (s32)denominator) * (s32)denominator);\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0131.err\00", align 1
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
  %call = call zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %3, i16 zeroext %4, i16 signext %5), !dbg !64
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
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !784
  %conv8 = sext i16 %4 to i64, !dbg !787
  %call = call i32 @klee_alarm_divisor_nonzero(i64 %conv8), !dbg !788
  %tobool = icmp ne i32 %call, 0, !dbg !788
  br i1 %tobool, label %if.end, label %if.then9, !dbg !789

if.then9:                                         ; preds = %if.else7
  store i16 0, i16* %retval, align 2, !dbg !790
  br label %return, !dbg !790

if.end:                                           ; preds = %if.else7
  %5 = load i32, i32* %s32Result, align 4, !dbg !792
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !794
  %conv10 = sext i16 %6 to i32, !dbg !795
  %int_cast_to_i64 = zext i32 %conv10 to i64, !dbg !796
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !796
  %div = sdiv i32 %5, %conv10, !dbg !796, !klee.check.div !106
  %conv11 = sext i32 %div to i64, !dbg !797
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !798
  %conv12 = sext i16 %7 to i32, !dbg !799
  %conv13 = sext i32 %conv12 to i64, !dbg !800
  %call14 = call i32 @klee_alarm_s32_mul_upper(i64 %conv11, i64 %conv13), !dbg !801
  %tobool15 = icmp ne i32 %call14, 0, !dbg !801
  br i1 %tobool15, label %if.end17, label %if.then16, !dbg !802

if.then16:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !803
  br label %return, !dbg !803

if.end17:                                         ; preds = %if.end
  %8 = load i32, i32* %s32Result, align 4, !dbg !805
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !807
  %conv18 = sext i16 %9 to i32, !dbg !808
  %int_cast_to_i641 = zext i32 %conv18 to i64, !dbg !809
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !809
  %div19 = sdiv i32 %8, %conv18, !dbg !809, !klee.check.div !106
  %conv20 = sext i32 %div19 to i64, !dbg !810
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !811
  %conv21 = sext i16 %10 to i32, !dbg !812
  %conv22 = sext i32 %conv21 to i64, !dbg !813
  %call23 = call i32 @klee_alarm_s32_mul_lower(i64 %conv20, i64 %conv22), !dbg !814
  %tobool24 = icmp ne i32 %call23, 0, !dbg !814
  br i1 %tobool24, label %if.end26, label %if.then25, !dbg !815

if.then25:                                        ; preds = %if.end17
  store i16 0, i16* %retval, align 2, !dbg !816
  br label %return, !dbg !816

if.end26:                                         ; preds = %if.end17
  %11 = load i32, i32* %s32Result, align 4, !dbg !818
  %conv27 = sext i32 %11 to i64, !dbg !820
  %12 = load i32, i32* %s32Result, align 4, !dbg !821
  %13 = load i16, i16* %denominator.addr, align 2, !dbg !822
  %conv28 = sext i16 %13 to i32, !dbg !823
  %int_cast_to_i642 = zext i32 %conv28 to i64, !dbg !824
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !824
  %div29 = sdiv i32 %12, %conv28, !dbg !824, !klee.check.div !106
  %14 = load i16, i16* %denominator.addr, align 2, !dbg !825
  %conv30 = sext i16 %14 to i32, !dbg !826
  %mul31 = mul nsw i32 %div29, %conv30, !dbg !827
  %conv32 = sext i32 %mul31 to i64, !dbg !828
  %call33 = call i32 @klee_alarm_s32_sub_lower(i64 %conv27, i64 %conv32), !dbg !829
  %tobool34 = icmp ne i32 %call33, 0, !dbg !829
  br i1 %tobool34, label %if.end36, label %if.then35, !dbg !830

if.then35:                                        ; preds = %if.end26
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 756, i8* getelementptr inbounds ([131 x i8], [131 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !831
  unreachable, !dbg !831

if.end36:                                         ; preds = %if.end26
  %15 = load i32, i32* %s32Result, align 4, !dbg !833
  %16 = load i32, i32* %s32Result, align 4, !dbg !834
  %17 = load i16, i16* %denominator.addr, align 2, !dbg !835
  %conv37 = sext i16 %17 to i32, !dbg !836
  %int_cast_to_i643 = zext i32 %conv37 to i64, !dbg !837
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !837
  %div38 = sdiv i32 %16, %conv37, !dbg !837, !klee.check.div !106
  %18 = load i16, i16* %denominator.addr, align 2, !dbg !838
  %conv39 = sext i16 %18 to i32, !dbg !839
  %mul40 = mul nsw i32 %div38, %conv39, !dbg !840
  %sub = sub nsw i32 %15, %mul40, !dbg !841
  %conv41 = sext i32 %sub to i64, !dbg !842
  store volatile i64 %conv41, i64* @klee_alarm_sink_s64, align 8, !dbg !843
  store i16 0, i16* %retval, align 2, !dbg !844
  br label %return, !dbg !844

return:                                           ; preds = %if.end36, %if.then25, %if.then16, %if.then9, %if.else, %if.then6
  %19 = load i16, i16* %retval, align 2, !dbg !845
  ret i16 %19, !dbg !845
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !846 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !849, metadata !DIExpression()), !dbg !850
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !851
  %cmp = icmp ne i64 %0, 0, !dbg !852
  %conv = zext i1 %cmp to i32, !dbg !852
  ret i32 %conv, !dbg !853
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !854 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !857, metadata !DIExpression()), !dbg !858
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !859, metadata !DIExpression()), !dbg !860
  %0 = load i64, i64* %left.addr, align 8, !dbg !861
  %1 = load i64, i64* %right.addr, align 8, !dbg !862
  %mul = mul nsw i64 %0, %1, !dbg !863
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !864
  %conv = zext i1 %cmp to i32, !dbg !864
  ret i32 %conv, !dbg !865
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !866 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !867, metadata !DIExpression()), !dbg !868
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !869, metadata !DIExpression()), !dbg !870
  %0 = load i64, i64* %left.addr, align 8, !dbg !871
  %1 = load i64, i64* %right.addr, align 8, !dbg !872
  %mul = mul nsw i64 %0, %1, !dbg !873
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !874
  %conv = zext i1 %cmp to i32, !dbg !874
  ret i32 %conv, !dbg !875
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_sub_lower(i64 %left, i64 %right) #0 !dbg !876 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !877, metadata !DIExpression()), !dbg !878
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !879, metadata !DIExpression()), !dbg !880
  %0 = load i64, i64* %left.addr, align 8, !dbg !881
  %1 = load i64, i64* %right.addr, align 8, !dbg !882
  %sub = sub nsw i64 %0, %1, !dbg !883
  %cmp = icmp sge i64 %sub, -2147483648, !dbg !884
  %conv = zext i1 %cmp to i32, !dbg !884
  ret i32 %conv, !dbg !885
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !886 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !889, metadata !DIExpression()), !dbg !890
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !891, metadata !DIExpression()), !dbg !892
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !893, metadata !DIExpression()), !dbg !894
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !895, metadata !DIExpression()), !dbg !896
  store i32 0, i32* %s32Result, align 4, !dbg !896
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !897, metadata !DIExpression()), !dbg !898
  store i32 0, i32* %s32Temp1, align 4, !dbg !898
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !899
  %conv = sext i16 %0 to i32, !dbg !899
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !900
  %conv1 = zext i16 %1 to i32, !dbg !900
  %mul = mul nsw i32 %conv, %conv1, !dbg !901
  store i32 %mul, i32* %s32Result, align 4, !dbg !902
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !903
  %conv2 = zext i16 %2 to i32, !dbg !903
  %cmp = icmp eq i32 %conv2, 0, !dbg !905
  br i1 %cmp, label %if.then, label %if.else7, !dbg !906

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !907
  %cmp4 = icmp sge i32 %3, 0, !dbg !910
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !911

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !912
  br label %return, !dbg !912

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !914
  br label %return, !dbg !914

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !916
  %5 = load i32, i32* %s32Result, align 4, !dbg !918
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !919
  %conv8 = zext i16 %6 to i32, !dbg !919
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !920
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !920
  %div = sdiv i32 %5, %conv8, !dbg !920, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !921
  %conv9 = zext i16 %7 to i32, !dbg !921
  %mul10 = mul nsw i32 %div, %conv9, !dbg !922
  %sub = sub nsw i32 %4, %mul10, !dbg !923
  %shl = shl i32 %sub, 1, !dbg !924
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !925
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !926
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !927
  %conv11 = zext i16 %9 to i32, !dbg !927
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !928
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !928
  %div12 = sdiv i32 %8, %conv11, !dbg !928, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !929
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !930
  %conv13 = zext i16 %11 to i32, !dbg !930
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !931
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !931
  %div14 = sdiv i32 %10, %conv13, !dbg !931, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !932
  store i32 %add, i32* %s32Result, align 4, !dbg !933
  %12 = load i32, i32* %s32Result, align 4, !dbg !934
  %cmp15 = icmp slt i32 %12, 65535, !dbg !936
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !937

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !938
  %cmp18 = icmp sgt i32 %13, 0, !dbg !941
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !942

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !943
  %conv21 = trunc i32 %14 to i16, !dbg !945
  store i16 %conv21, i16* %retval, align 2, !dbg !946
  br label %return, !dbg !946

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !947
  br label %return, !dbg !947

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !949
  br label %return, !dbg !949

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !951
  ret i16 %15, !dbg !951
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !952 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !955, metadata !DIExpression()), !dbg !956
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !957, metadata !DIExpression()), !dbg !958
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !959, metadata !DIExpression()), !dbg !960
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !961, metadata !DIExpression()), !dbg !962
  store i32 0, i32* %u32Temp1, align 4, !dbg !962
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !963, metadata !DIExpression()), !dbg !964
  store i16 0, i16* %u16TempDenom, align 2, !dbg !964
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !965
  %conv = zext i16 %0 to i32, !dbg !965
  %cmp = icmp eq i32 %conv, 0, !dbg !967
  br i1 %cmp, label %if.then, label %if.else, !dbg !968

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !969
  br label %return, !dbg !969

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !971
  %conv2 = zext i16 %1 to i32, !dbg !971
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !973
  %conv3 = zext i16 %2 to i32, !dbg !973
  %mul = mul nsw i32 %conv2, %conv3, !dbg !974
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !975
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !976
  %conv4 = zext i16 %3 to i32, !dbg !976
  %shr = ashr i32 %conv4, 1, !dbg !977
  %conv5 = trunc i32 %shr to i16, !dbg !976
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !978
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !979
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !980
  %conv6 = zext i16 %5 to i32, !dbg !980
  %add = add i32 %4, %conv6, !dbg !981
  store i32 %add, i32* %u32Temp1, align 4, !dbg !982
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !983
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !984
  %conv7 = zext i16 %7 to i32, !dbg !984
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !985
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !985
  %div = udiv i32 %6, %conv7, !dbg !985, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !986
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !987
  %cmp8 = icmp ult i32 %8, 65535, !dbg !989
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !990

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !991
  %and = and i32 %9, 65535, !dbg !993
  %conv11 = trunc i32 %and to i16, !dbg !994
  store i16 %conv11, i16* %retval, align 2, !dbg !995
  br label %return, !dbg !995

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !996
  br label %return, !dbg !996

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !998
  ret i16 %10, !dbg !998
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !999 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1002, metadata !DIExpression()), !dbg !1003
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1004, metadata !DIExpression()), !dbg !1005
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1006, metadata !DIExpression()), !dbg !1007
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1008, metadata !DIExpression()), !dbg !1009
  store i32 0, i32* %u32Temp1, align 4, !dbg !1009
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1010
  %cmp = icmp eq i32 %0, 0, !dbg !1012
  br i1 %cmp, label %if.then, label %if.else, !dbg !1013

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1014
  br label %return, !dbg !1014

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1016
  %conv = zext i16 %1 to i32, !dbg !1016
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1018
  %conv1 = zext i16 %2 to i32, !dbg !1018
  %mul = mul nsw i32 %conv, %conv1, !dbg !1019
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1020
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1021
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1021
  %div = udiv i32 %mul, %3, !dbg !1021, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1022
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1023
  %conv2 = zext i16 %4 to i32, !dbg !1023
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1025
  %conv3 = zext i16 %5 to i32, !dbg !1025
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1026
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1027
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1028
  %mul5 = mul i32 %6, %7, !dbg !1029
  %sub = sub i32 %mul4, %mul5, !dbg !1030
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1031
  %div6 = udiv i32 %8, 2, !dbg !1032
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1033
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1034

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1035
  %inc = add i32 %9, 1, !dbg !1035
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1035
  br label %if.end, !dbg !1037

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1038
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1040
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1041

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1042
  %and = and i32 %11, 65535, !dbg !1044
  %conv13 = trunc i32 %and to i16, !dbg !1045
  store i16 %conv13, i16* %retval, align 2, !dbg !1046
  br label %return, !dbg !1046

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1047
  br label %return, !dbg !1047

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1049
  ret i16 %12, !dbg !1049
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1050 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1053, metadata !DIExpression()), !dbg !1054
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1055, metadata !DIExpression()), !dbg !1056
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1057, metadata !DIExpression()), !dbg !1058
  store i32 0, i32* %u32Temp1, align 4, !dbg !1058
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1059
  %conv = zext i16 %0 to i32, !dbg !1059
  %cmp = icmp eq i32 %conv, 0, !dbg !1061
  br i1 %cmp, label %if.then, label %if.else, !dbg !1062

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1063
  br label %return, !dbg !1063

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1065
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1067
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1068
  %conv2 = zext i16 %3 to i32, !dbg !1068
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1069
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1069
  %div = udiv i32 %2, %conv2, !dbg !1069, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1070
  %conv3 = zext i16 %4 to i32, !dbg !1070
  %mul = mul i32 %div, %conv3, !dbg !1071
  %sub = sub i32 %1, %mul, !dbg !1072
  %shl = shl i32 %sub, 1, !dbg !1073
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1074
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1075
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1076
  %conv4 = zext i16 %6 to i32, !dbg !1076
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1077
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1077
  %div5 = udiv i32 %5, %conv4, !dbg !1077, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1078
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1079
  %conv6 = zext i16 %8 to i32, !dbg !1079
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1080
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1080
  %div7 = udiv i32 %7, %conv6, !dbg !1080, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1081
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1082
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1083
  store i32 %9, i32* %retval, align 4, !dbg !1084
  br label %return, !dbg !1084

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1085
  ret i32 %10, !dbg !1085
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1086 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1089, metadata !DIExpression()), !dbg !1090
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1091, metadata !DIExpression()), !dbg !1092
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1093, metadata !DIExpression()), !dbg !1094
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1095, metadata !DIExpression()), !dbg !1096
  store i32 0, i32* %s32Temp1, align 4, !dbg !1096
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1097, metadata !DIExpression()), !dbg !1098
  store i32 0, i32* %s32Temp2, align 4, !dbg !1098
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1099, metadata !DIExpression()), !dbg !1100
  store i32 0, i32* %s32Temp3, align 4, !dbg !1100
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1101
  %conv = sext i16 %0 to i32, !dbg !1101
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1102
  %conv1 = sext i16 %1 to i32, !dbg !1102
  %mul = mul nsw i32 %conv, %conv1, !dbg !1103
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1104
  %2 = load i16, i16* %div.addr, align 2, !dbg !1105
  %conv2 = sext i16 %2 to i32, !dbg !1105
  %cmp = icmp eq i32 %conv2, 0, !dbg !1107
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1108

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1109
  %cmp4 = icmp slt i32 %3, 0, !dbg !1112
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1113

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1114
  br label %return, !dbg !1114

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1116
  br label %return, !dbg !1116

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1118
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1120
  %6 = load i16, i16* %div.addr, align 2, !dbg !1121
  %conv8 = sext i16 %6 to i32, !dbg !1121
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1122
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1122
  %div9 = sdiv i32 %5, %conv8, !dbg !1122, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1123
  %conv10 = sext i16 %7 to i32, !dbg !1123
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1124
  %sub = sub nsw i32 %4, %mul11, !dbg !1125
  %shl = shl i32 %sub, 1, !dbg !1126
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1127
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1128
  %9 = load i16, i16* %div.addr, align 2, !dbg !1129
  %conv12 = sext i16 %9 to i32, !dbg !1129
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1130
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1130
  %div13 = sdiv i32 %8, %conv12, !dbg !1130, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1131
  %11 = load i16, i16* %div.addr, align 2, !dbg !1132
  %conv14 = sext i16 %11 to i32, !dbg !1132
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1133
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1133
  %div15 = sdiv i32 %10, %conv14, !dbg !1133, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1134
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1135
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1136
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1138
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1139

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1140
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1143
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1144

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1145
  %conv22 = trunc i32 %14 to i16, !dbg !1147
  store i16 %conv22, i16* %retval, align 2, !dbg !1148
  br label %return, !dbg !1148

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1149
  br label %return, !dbg !1149

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1151
  br label %return, !dbg !1151

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1153
  ret i16 %15, !dbg !1153
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1154 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1157, metadata !DIExpression()), !dbg !1158
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1159, metadata !DIExpression()), !dbg !1160
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1161, metadata !DIExpression()), !dbg !1162
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1163, metadata !DIExpression()), !dbg !1164
  store i32 0, i32* %s32Result, align 4, !dbg !1164
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1165, metadata !DIExpression()), !dbg !1166
  store i32 0, i32* %s32Temp1, align 4, !dbg !1166
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1167
  %conv = sext i16 %0 to i32, !dbg !1167
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1168
  %conv1 = sext i16 %1 to i32, !dbg !1168
  %mul = mul nsw i32 %conv, %conv1, !dbg !1169
  store i32 %mul, i32* %s32Result, align 4, !dbg !1170
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1171
  %conv2 = zext i16 %2 to i32, !dbg !1171
  %cmp = icmp eq i32 %conv2, 0, !dbg !1173
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1174

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1175
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1178
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1179

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1180
  br label %return, !dbg !1180

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1182
  %cmp7 = icmp eq i32 %4, 0, !dbg !1184
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1185

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1186
  br label %return, !dbg !1186

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1188
  br label %return, !dbg !1188

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1190
  %6 = load i32, i32* %s32Result, align 4, !dbg !1192
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1193
  %conv12 = zext i16 %7 to i32, !dbg !1193
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1194
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1194
  %div = sdiv i32 %6, %conv12, !dbg !1194, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1195
  %conv13 = zext i16 %8 to i32, !dbg !1195
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1196
  %sub = sub nsw i32 %5, %mul14, !dbg !1197
  %shl = shl i32 %sub, 1, !dbg !1198
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1199
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1200
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1201
  %conv15 = zext i16 %10 to i32, !dbg !1201
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1202
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1202
  %div16 = sdiv i32 %9, %conv15, !dbg !1202, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1203
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1204
  %conv17 = zext i16 %12 to i32, !dbg !1204
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1205
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1205
  %div18 = sdiv i32 %11, %conv17, !dbg !1205, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1206
  store i32 %add, i32* %s32Result, align 4, !dbg !1207
  %13 = load i32, i32* %s32Result, align 4, !dbg !1208
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1210
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1211

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1212
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1215
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1216

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1217
  %conv25 = trunc i32 %15 to i16, !dbg !1219
  store i16 %conv25, i16* %retval, align 2, !dbg !1220
  br label %return, !dbg !1220

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1221
  br label %return, !dbg !1221

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1223
  br label %return, !dbg !1223

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1225
  ret i16 %16, !dbg !1225
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1226 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1229, metadata !DIExpression()), !dbg !1230
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1231, metadata !DIExpression()), !dbg !1232
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1233, metadata !DIExpression()), !dbg !1234
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1235
  %cmp = icmp eq i32 %0, 0, !dbg !1237
  br i1 %cmp, label %if.then, label %if.else, !dbg !1238

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1239
  br label %return, !dbg !1239

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1241
  %cmp1 = icmp sle i32 %1, 0, !dbg !1244
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1245

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1246
  br label %return, !dbg !1246

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1248
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1250
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1251
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1252
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1252
  %div = udiv i32 %3, %4, !dbg !1252, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1253
  %mul = mul i32 %div, %5, !dbg !1254
  %sub = sub i32 %2, %mul, !dbg !1255
  %shl = shl i32 %sub, 1, !dbg !1256
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1257
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1258
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1259
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1260
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1260
  %div4 = udiv i32 %6, %7, !dbg !1260, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1261
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1262
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1263
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1263
  %div5 = udiv i32 %8, %9, !dbg !1263, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1264
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1265
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1266
  store i32 %10, i32* %retval, align 4, !dbg !1267
  br label %return, !dbg !1267

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1268
  ret i32 %11, !dbg !1268
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1269 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1272, metadata !DIExpression()), !dbg !1273
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1274, metadata !DIExpression()), !dbg !1275
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1276, metadata !DIExpression()), !dbg !1277
  store i32 0, i32* %s32Temp1, align 4, !dbg !1277
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1278
  %cmp = icmp eq i32 %0, 0, !dbg !1280
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1281

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1282
  %cmp1 = icmp sge i32 %1, 0, !dbg !1285
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1286

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1287
  br label %return, !dbg !1287

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1289
  br label %return, !dbg !1289

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1291
  %cmp4 = icmp sge i32 %2, 0, !dbg !1294
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1295

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1296
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1298
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1299
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1300
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1300
  %div = udiv i32 %4, %5, !dbg !1300, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1301
  %mul = mul i32 %div, %6, !dbg !1302
  %sub = sub i32 %3, %mul, !dbg !1303
  %shl = shl i32 %sub, 1, !dbg !1304
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1305
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1306
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1307
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1308
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1308
  %div6 = udiv i32 %7, %8, !dbg !1308, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1309
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1310
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1311
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1311
  %div7 = udiv i32 %9, %10, !dbg !1311, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1312
  store i32 %add, i32* %retval, align 4, !dbg !1313
  br label %return, !dbg !1313

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1314
  br label %return, !dbg !1314

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1316
  ret i32 %11, !dbg !1316
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1317 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1320, metadata !DIExpression()), !dbg !1321
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1322, metadata !DIExpression()), !dbg !1323
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1324, metadata !DIExpression()), !dbg !1325
  store i32 0, i32* %u32Temp1, align 4, !dbg !1325
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1326, metadata !DIExpression()), !dbg !1327
  store i32 0, i32* %u32Temp2, align 4, !dbg !1327
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1328
  %cmp = icmp eq i32 %0, 0, !dbg !1330
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1331

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1332
  %cmp1 = icmp slt i32 %1, 0, !dbg !1335
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1336

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1337
  br label %return, !dbg !1337

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1339
  br label %return, !dbg !1339

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1341
  %cmp4 = icmp sge i32 %2, 0, !dbg !1344
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1345

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1346
  %cmp6 = icmp eq i32 %3, 0, !dbg !1349
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1350

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1351
  br label %return, !dbg !1351

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1353
  %cmp9 = icmp sle i32 %4, 0, !dbg !1356
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1357

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1358
  br label %return, !dbg !1358

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1360
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1362
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1363
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1364
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1364
  %div = sdiv i32 %6, %7, !dbg !1364, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1365
  %mul = mul nsw i32 %div, %8, !dbg !1366
  %sub = sub nsw i32 %5, %mul, !dbg !1367
  %shl = shl i32 %sub, 1, !dbg !1368
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1369
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1370
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1371
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1372
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1372
  %div12 = udiv i32 %9, %10, !dbg !1372, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1373
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1374
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1375
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1375
  %div13 = sdiv i32 %11, %12, !dbg !1375, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1376
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1377
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1378
  store i32 %13, i32* %retval, align 4, !dbg !1379
  br label %return, !dbg !1379

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1380
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1383
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1384

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1385
  br label %return, !dbg !1385

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1387
  %sub18 = sub nsw i32 0, %15, !dbg !1389
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1390
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1391
  %sub19 = sub nsw i32 0, %16, !dbg !1392
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1393
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1394
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1395
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1396
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1397
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1397
  %div20 = sdiv i32 %18, %19, !dbg !1397, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1398
  %mul21 = mul nsw i32 %div20, %20, !dbg !1399
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1400
  %shl23 = shl i32 %sub22, 1, !dbg !1401
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1402
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1403
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1404
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1405
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1405
  %div24 = udiv i32 %21, %22, !dbg !1405, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1406
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1407
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1408
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1408
  %div25 = sdiv i32 %23, %24, !dbg !1408, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1409
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1410
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1411
  store i32 %25, i32* %retval, align 4, !dbg !1412
  br label %return, !dbg !1412

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1413
  ret i32 %26, !dbg !1413
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1414 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1417, metadata !DIExpression()), !dbg !1418
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1419, metadata !DIExpression()), !dbg !1420
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1421, metadata !DIExpression()), !dbg !1422
  store i32 0, i32* %u32Temp1, align 4, !dbg !1422
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1423, metadata !DIExpression()), !dbg !1424
  store i32 0, i32* %u32Temp2, align 4, !dbg !1424
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1425, metadata !DIExpression()), !dbg !1426
  store i32 0, i32* %u32Temp3, align 4, !dbg !1426
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1427, metadata !DIExpression()), !dbg !1428
  store i32 0, i32* %numerator_old, align 4, !dbg !1428
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1429
  %cmp = icmp eq i32 %0, 0, !dbg !1431
  br i1 %cmp, label %if.then, label %if.else, !dbg !1432

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1433
  br label %return, !dbg !1433

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1435
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1437
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1438
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1439
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1440
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1440
  %div = udiv i32 %3, %4, !dbg !1440, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1441
  %sub = sub i32 %1, %mul, !dbg !1442
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1443
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1444
  %and = and i32 %5, 1, !dbg !1446
  %cmp1 = icmp eq i32 %and, 0, !dbg !1447
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1448

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1449
  %shr = lshr i32 %6, 1, !dbg !1451
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1452
  br label %if.end, !dbg !1453

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1454
  %shr4 = lshr i32 %7, 1, !dbg !1456
  %add = add i32 %shr4, 1, !dbg !1457
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1458
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1459
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1461
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1462
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1463

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1464
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1466
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1467
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1467
  %div7 = udiv i32 %10, %11, !dbg !1467, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1468
  br label %return, !dbg !1468

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1469
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1471
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1472
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1472
  %div9 = udiv i32 %12, %13, !dbg !1472, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1473
  store i32 %add10, i32* %retval, align 4, !dbg !1474
  br label %return, !dbg !1474

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1475
  ret i32 %14, !dbg !1475
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1476 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1479, metadata !DIExpression()), !dbg !1480
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1481, metadata !DIExpression()), !dbg !1482
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1483, metadata !DIExpression()), !dbg !1484
  store i32 0, i32* %u32Temp1, align 4, !dbg !1484
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1485, metadata !DIExpression()), !dbg !1486
  store i32 0, i32* %u32Temp2, align 4, !dbg !1486
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1487
  %cmp = icmp sle i32 %0, 0, !dbg !1489
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1490

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1491
  %cmp1 = icmp sge i32 %1, 0, !dbg !1494
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1495

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1496
  br label %return, !dbg !1496

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1498
  %sub = sub nsw i32 0, %2, !dbg !1500
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1501
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1502
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1503
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1504
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1505
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1505
  %div = udiv i32 %4, %5, !dbg !1505, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1506
  %mul = mul i32 %div, %6, !dbg !1507
  %sub3 = sub i32 %3, %mul, !dbg !1508
  %shl = shl i32 %sub3, 1, !dbg !1509
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1510
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1511
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1512
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1513
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1513
  %div4 = udiv i32 %7, %8, !dbg !1513, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1514
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1515
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1516
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1516
  %div5 = udiv i32 %9, %10, !dbg !1516, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1517
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1518
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1519
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1521
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1522

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1523
  %sub8 = sub i32 0, %12, !dbg !1525
  store i32 %sub8, i32* %retval, align 4, !dbg !1526
  br label %return, !dbg !1526

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1527
  br label %return, !dbg !1527

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1529
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1531
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1532
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1533
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1533
  %div11 = udiv i32 %14, %15, !dbg !1533, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1534
  %mul12 = mul i32 %div11, %16, !dbg !1535
  %sub13 = sub i32 %13, %mul12, !dbg !1536
  %shl14 = shl i32 %sub13, 1, !dbg !1537
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1538
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1539
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1540
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1541
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1541
  %div15 = udiv i32 %17, %18, !dbg !1541, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1542
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1543
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1544
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1544
  %div16 = udiv i32 %19, %20, !dbg !1544, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1545
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1546
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1547
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1549
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1550

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1551
  store i32 %22, i32* %retval, align 4, !dbg !1553
  br label %return, !dbg !1553

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1554
  br label %return, !dbg !1554

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1556
  ret i32 %23, !dbg !1556
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1557 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1560, metadata !DIExpression()), !dbg !1561
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1562, metadata !DIExpression()), !dbg !1563
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1564, metadata !DIExpression()), !dbg !1565
  store i32 0, i32* %s32Temp1, align 4, !dbg !1565
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1566, metadata !DIExpression()), !dbg !1567
  store i32 0, i32* %s32Temp2, align 4, !dbg !1567
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1568, metadata !DIExpression()), !dbg !1569
  store i32 0, i32* %u32Temp0, align 4, !dbg !1569
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1570, metadata !DIExpression()), !dbg !1571
  store i32 0, i32* %u32Temp1, align 4, !dbg !1571
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1572, metadata !DIExpression()), !dbg !1573
  store i32 0, i32* %u32Temp2, align 4, !dbg !1573
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1574
  %cmp = icmp eq i32 %0, 0, !dbg !1576
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1577

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1578
  %cmp1 = icmp slt i32 %1, 0, !dbg !1581
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1582

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1583
  br label %return, !dbg !1583

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1585
  br label %return, !dbg !1585

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1587
  %cmp4 = icmp sle i32 %2, 0, !dbg !1590
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1591

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1592
  %sub = sub nsw i32 0, %3, !dbg !1594
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1595
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1596
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1597
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1598
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1598
  %div = udiv i32 %4, %5, !dbg !1598, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1599
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1600
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1601
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1602
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1603
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1603
  %div6 = udiv i32 %7, %8, !dbg !1603, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1604
  %mul = mul i32 %div6, %9, !dbg !1605
  %sub7 = sub i32 %6, %mul, !dbg !1606
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1607
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1608
  %and = and i32 %10, 1, !dbg !1610
  %cmp8 = icmp eq i32 %and, 0, !dbg !1611
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1612

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1613
  %shr = lshr i32 %11, 1, !dbg !1615
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1616
  br label %if.end, !dbg !1617

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1618
  %shr11 = lshr i32 %12, 1, !dbg !1620
  %add = add i32 %shr11, 1, !dbg !1621
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1622
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1623
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1625
  %cmp12 = icmp ult i32 %13, %14, !dbg !1626
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1627

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1628
  %neg = xor i32 %15, -1, !dbg !1630
  %add14 = add i32 %neg, 1, !dbg !1631
  store i32 %add14, i32* %retval, align 4, !dbg !1632
  br label %return, !dbg !1632

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1633
  %add16 = add i32 %16, 1, !dbg !1635
  %neg17 = xor i32 %add16, -1, !dbg !1636
  %add18 = add i32 %neg17, 1, !dbg !1637
  store i32 %add18, i32* %retval, align 4, !dbg !1638
  br label %return, !dbg !1638

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1639
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1641
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1642
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1643
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1643
  %div20 = udiv i32 %18, %19, !dbg !1643, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1644
  %mul21 = mul i32 %div20, %20, !dbg !1645
  %sub22 = sub i32 %17, %mul21, !dbg !1646
  %shl = shl i32 %sub22, 1, !dbg !1647
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1648
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1649
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1650
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1651
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1651
  %div23 = udiv i32 %21, %22, !dbg !1651, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1652
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1653
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1654
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1654
  %div24 = udiv i32 %23, %24, !dbg !1654, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1655
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1656
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1657
  store i32 %25, i32* %retval, align 4, !dbg !1658
  br label %return, !dbg !1658

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1659
  ret i32 %26, !dbg !1659
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1660 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1663, metadata !DIExpression()), !dbg !1664
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1665, metadata !DIExpression()), !dbg !1666
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1667, metadata !DIExpression()), !dbg !1668
  store i32 0, i32* %s32Temp1, align 4, !dbg !1668
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1669, metadata !DIExpression()), !dbg !1670
  store i32 0, i32* %s32Temp2, align 4, !dbg !1670
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1671, metadata !DIExpression()), !dbg !1672
  store i32 0, i32* %denominator_prime, align 4, !dbg !1672
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1673, metadata !DIExpression()), !dbg !1674
  store i32 0, i32* %u32Temp1, align 4, !dbg !1674
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1675, metadata !DIExpression()), !dbg !1676
  store i32 0, i32* %u32Temp2, align 4, !dbg !1676
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1677, metadata !DIExpression()), !dbg !1678
  store i32 0, i32* %u32numerator, align 4, !dbg !1678
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1679, metadata !DIExpression()), !dbg !1680
  store i32 0, i32* %u32denominator, align 4, !dbg !1680
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1681
  %cmp = icmp slt i32 %0, 0, !dbg !1683
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1684

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1685
  %cmp1 = icmp sle i32 %1, 0, !dbg !1688
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1689

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1690
  %cmp3 = icmp sge i32 %2, 0, !dbg !1693
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1694

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1695
  br label %return, !dbg !1695

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1697
  %sub = sub nsw i32 0, %3, !dbg !1699
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1700
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1701
  %sub5 = sub nsw i32 0, %4, !dbg !1702
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1703
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1704
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1705
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1706
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1707
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1707
  %div = udiv i32 %6, %7, !dbg !1707, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1708
  %mul = mul i32 %div, %8, !dbg !1709
  %sub6 = sub i32 %5, %mul, !dbg !1710
  %shl = shl i32 %sub6, 1, !dbg !1711
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1712
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1713
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1714
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1715
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1715
  %div7 = udiv i32 %9, %10, !dbg !1715, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1716
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1717
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1718
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1718
  %div8 = udiv i32 %11, %12, !dbg !1718, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1719
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1720
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1721
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1723
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1724

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1725
  store i32 %14, i32* %retval, align 4, !dbg !1727
  br label %return, !dbg !1727

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1728
  br label %return, !dbg !1728

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1730
  %neg = xor i32 %15, -1, !dbg !1732
  %add13 = add nsw i32 %neg, 1, !dbg !1733
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1734
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1735
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1736
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1737
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1738
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1738
  %div14 = udiv i32 %17, %18, !dbg !1738, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1739
  %mul15 = mul i32 %div14, %19, !dbg !1740
  %sub16 = sub i32 %16, %mul15, !dbg !1741
  %shl17 = shl i32 %sub16, 1, !dbg !1742
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1743
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1744
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1745
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1746
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1746
  %div18 = udiv i32 %20, %21, !dbg !1746, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1747
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1748
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1749
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1749
  %div19 = sdiv i32 %22, %23, !dbg !1749, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1750
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1751
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1752
  %neg21 = xor i32 %24, -1, !dbg !1753
  %add22 = add nsw i32 %neg21, 1, !dbg !1754
  store i32 %add22, i32* %retval, align 4, !dbg !1755
  br label %return, !dbg !1755

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1756
  %cmp24 = icmp sle i32 %25, 0, !dbg !1759
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1760

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1761
  %cmp26 = icmp sge i32 %26, 0, !dbg !1764
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1765

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1766
  br label %return, !dbg !1766

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1768
  %neg29 = xor i32 %27, -1, !dbg !1770
  %add30 = add nsw i32 %neg29, 1, !dbg !1771
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1772
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1773
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1774
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1775
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1776
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1776
  %div31 = udiv i32 %29, %30, !dbg !1776, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1777
  %mul32 = mul i32 %div31, %31, !dbg !1778
  %sub33 = sub i32 %28, %mul32, !dbg !1779
  %shl34 = shl i32 %sub33, 1, !dbg !1780
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1781
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1782
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1783
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1784
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1784
  %div35 = udiv i32 %32, %33, !dbg !1784, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1785
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1786
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1787
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1787
  %div36 = udiv i32 %34, %35, !dbg !1787, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1788
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1789
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1790
  %neg38 = xor i32 %36, -1, !dbg !1791
  %add39 = add nsw i32 %neg38, 1, !dbg !1792
  store i32 %add39, i32* %retval, align 4, !dbg !1793
  br label %return, !dbg !1793

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1794
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1796
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1797
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1798
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1798
  %div41 = sdiv i32 %38, %39, !dbg !1798, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1799
  %mul42 = mul nsw i32 %div41, %40, !dbg !1800
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1801
  %shl44 = shl i32 %sub43, 1, !dbg !1802
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1803
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1804
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1805
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1806
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1806
  %div45 = sdiv i32 %41, %42, !dbg !1806, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1807
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1808
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1809
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1809
  %div46 = udiv i32 %43, %44, !dbg !1809, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1810
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1811
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1812
  store i32 %45, i32* %retval, align 4, !dbg !1813
  br label %return, !dbg !1813

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1814
  ret i32 %46, !dbg !1814
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1815 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1818, metadata !DIExpression()), !dbg !1819
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1820, metadata !DIExpression()), !dbg !1821
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1822, metadata !DIExpression()), !dbg !1823
  store i32 0, i32* %numerator_prime, align 4, !dbg !1823
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1824, metadata !DIExpression()), !dbg !1825
  store i32 0, i32* %u32Temp1, align 4, !dbg !1825
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1826, metadata !DIExpression()), !dbg !1827
  store i32 0, i32* %u32Temp2, align 4, !dbg !1827
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1828, metadata !DIExpression()), !dbg !1829
  store i32 0, i32* %u32Temp3, align 4, !dbg !1829
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1830, metadata !DIExpression()), !dbg !1831
  store i32 0, i32* %s32Temp1, align 4, !dbg !1831
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1832, metadata !DIExpression()), !dbg !1833
  store i32 0, i32* %s32Temp2, align 4, !dbg !1833
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1834, metadata !DIExpression()), !dbg !1835
  store i32 0, i32* %s32Temp3, align 4, !dbg !1835
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1836
  %cmp = icmp eq i32 %0, 0, !dbg !1838
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1839

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1840
  %cmp1 = icmp slt i32 %1, 0, !dbg !1843
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1844

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1845
  br label %return, !dbg !1845

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1847
  br label %return, !dbg !1847

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1849
  %cmp4 = icmp slt i32 %2, 0, !dbg !1852
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1853

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1854
  %sub = sub nsw i32 0, %3, !dbg !1856
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1857
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1858
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1859
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1860
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1860
  %div = udiv i32 %4, %5, !dbg !1860, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1861
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1862
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1863
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1864
  %mul = mul i32 %7, %8, !dbg !1865
  %sub6 = sub i32 %6, %mul, !dbg !1866
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1867
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1868
  %and = and i32 %9, 1, !dbg !1870
  %cmp7 = icmp eq i32 %and, 0, !dbg !1871
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1872

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1873
  %shr = lshr i32 %10, 1, !dbg !1875
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1876
  br label %if.end, !dbg !1877

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1878
  %shr10 = lshr i32 %11, 1, !dbg !1880
  %add = add i32 %shr10, 1, !dbg !1881
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1882
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1883
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1885
  %cmp11 = icmp ult i32 %12, %13, !dbg !1886
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1887

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1888
  %neg = xor i32 %14, -1, !dbg !1890
  %add13 = add i32 %neg, 1, !dbg !1891
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1892
  br label %if.end18, !dbg !1893

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1894
  %add15 = add i32 %15, 1, !dbg !1896
  %neg16 = xor i32 %add15, -1, !dbg !1897
  %add17 = add i32 %neg16, 1, !dbg !1898
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1899
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1900
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1902
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1903

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1904
  %conv = trunc i32 %17 to i16, !dbg !1906
  store i16 %conv, i16* %retval, align 2, !dbg !1907
  br label %return, !dbg !1907

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1908
  br label %return, !dbg !1908

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1910
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1912
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1913
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1913
  %div23 = udiv i32 %18, %19, !dbg !1913, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1914
  %mul24 = mul i32 %div23, %20, !dbg !1915
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1916
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1917
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1918
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1919
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1920
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1920
  %div25 = udiv i32 %22, %23, !dbg !1920, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1921
  %mul26 = mul i32 %div25, %24, !dbg !1922
  %sub27 = sub i32 %21, %mul26, !dbg !1923
  %shl = shl i32 %sub27, 1, !dbg !1924
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1925
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1926
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1927
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1928
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1928
  %div28 = udiv i32 %25, %26, !dbg !1928, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1929
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1930
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1931
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1931
  %div29 = udiv i32 %27, %28, !dbg !1931, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !1932
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1933
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1934
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1936
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1937

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1938
  %conv34 = trunc i32 %30 to i16, !dbg !1940
  store i16 %conv34, i16* %retval, align 2, !dbg !1941
  br label %return, !dbg !1941

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1942
  br label %return, !dbg !1942

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1944
  ret i16 %31, !dbg !1944
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1945 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1951, metadata !DIExpression()), !dbg !1952
  %2 = icmp eq i64 %0, 0, !dbg !1953
  br i1 %2, label %3, label %4, !dbg !1955

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1956
  unreachable, !dbg !1956

4:                                                ; preds = %1
  ret void, !dbg !1957
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0131/div_Ccode_alarm_0131.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0131")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0131")
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
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0131")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0131/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0131")
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
!44 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0131")
!45 = !DISubroutineType(types: !46)
!46 = !{!28}
!47 = !DILocalVariable(name: "factor1", scope: !43, file: !44, line: 9, type: !8)
!48 = !DILocation(line: 9, column: 13, scope: !43)
!49 = !DILocalVariable(name: "factor2", scope: !43, file: !44, line: 10, type: !19)
!50 = !DILocation(line: 10, column: 14, scope: !43)
!51 = !DILocalVariable(name: "denominator", scope: !43, file: !44, line: 11, type: !8)
!52 = !DILocation(line: 11, column: 13, scope: !43)
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0131")
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
!784 = !DILocation(line: 741, column: 46, scope: !785)
!785 = distinct !DILexicalBlock(scope: !786, file: !69, line: 741, column: 7)
!786 = distinct !DILexicalBlock(scope: !772, file: !69, line: 739, column: 2)
!787 = !DILocation(line: 741, column: 36, scope: !785)
!788 = !DILocation(line: 741, column: 9, scope: !785)
!789 = !DILocation(line: 741, column: 7, scope: !786)
!790 = !DILocation(line: 742, column: 7, scope: !791)
!791 = distinct !DILexicalBlock(scope: !785, file: !69, line: 741, column: 62)
!792 = !DILocation(line: 745, column: 50, scope: !793)
!793 = distinct !DILexicalBlock(scope: !786, file: !69, line: 745, column: 7)
!794 = !DILocation(line: 745, column: 67, scope: !793)
!795 = !DILocation(line: 745, column: 62, scope: !793)
!796 = !DILocation(line: 745, column: 60, scope: !793)
!797 = !DILocation(line: 745, column: 34, scope: !793)
!798 = !DILocation(line: 745, column: 97, scope: !793)
!799 = !DILocation(line: 745, column: 92, scope: !793)
!800 = !DILocation(line: 745, column: 82, scope: !793)
!801 = !DILocation(line: 745, column: 9, scope: !793)
!802 = !DILocation(line: 745, column: 7, scope: !786)
!803 = !DILocation(line: 746, column: 7, scope: !804)
!804 = distinct !DILexicalBlock(scope: !793, file: !69, line: 745, column: 113)
!805 = !DILocation(line: 749, column: 50, scope: !806)
!806 = distinct !DILexicalBlock(scope: !786, file: !69, line: 749, column: 7)
!807 = !DILocation(line: 749, column: 67, scope: !806)
!808 = !DILocation(line: 749, column: 62, scope: !806)
!809 = !DILocation(line: 749, column: 60, scope: !806)
!810 = !DILocation(line: 749, column: 34, scope: !806)
!811 = !DILocation(line: 749, column: 97, scope: !806)
!812 = !DILocation(line: 749, column: 92, scope: !806)
!813 = !DILocation(line: 749, column: 82, scope: !806)
!814 = !DILocation(line: 749, column: 9, scope: !806)
!815 = !DILocation(line: 749, column: 7, scope: !786)
!816 = !DILocation(line: 750, column: 7, scope: !817)
!817 = distinct !DILexicalBlock(scope: !806, file: !69, line: 749, column: 113)
!818 = !DILocation(line: 753, column: 44, scope: !819)
!819 = distinct !DILexicalBlock(scope: !786, file: !69, line: 753, column: 7)
!820 = !DILocation(line: 753, column: 34, scope: !819)
!821 = !DILocation(line: 753, column: 78, scope: !819)
!822 = !DILocation(line: 753, column: 95, scope: !819)
!823 = !DILocation(line: 753, column: 90, scope: !819)
!824 = !DILocation(line: 753, column: 88, scope: !819)
!825 = !DILocation(line: 753, column: 115, scope: !819)
!826 = !DILocation(line: 753, column: 110, scope: !819)
!827 = !DILocation(line: 753, column: 108, scope: !819)
!828 = !DILocation(line: 753, column: 56, scope: !819)
!829 = !DILocation(line: 753, column: 9, scope: !819)
!830 = !DILocation(line: 753, column: 7, scope: !786)
!831 = !DILocation(line: 754, column: 7, scope: !832)
!832 = distinct !DILexicalBlock(scope: !819, file: !69, line: 753, column: 132)
!833 = !DILocation(line: 761, column: 35, scope: !786)
!834 = !DILocation(line: 761, column: 59, scope: !786)
!835 = !DILocation(line: 761, column: 76, scope: !786)
!836 = !DILocation(line: 761, column: 71, scope: !786)
!837 = !DILocation(line: 761, column: 69, scope: !786)
!838 = !DILocation(line: 761, column: 96, scope: !786)
!839 = !DILocation(line: 761, column: 91, scope: !786)
!840 = !DILocation(line: 761, column: 89, scope: !786)
!841 = !DILocation(line: 761, column: 45, scope: !786)
!842 = !DILocation(line: 761, column: 25, scope: !786)
!843 = !DILocation(line: 761, column: 23, scope: !786)
!844 = !DILocation(line: 762, column: 3, scope: !786)
!845 = !DILocation(line: 780, column: 1, scope: !750)
!846 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !30, file: !30, line: 24, type: !847, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!847 = !DISubroutineType(types: !848)
!848 = !{!28, !22}
!849 = !DILocalVariable(name: "denominator", arg: 1, scope: !846, file: !30, line: 24, type: !22)
!850 = !DILocation(line: 24, column: 40, scope: !846)
!851 = !DILocation(line: 26, column: 12, scope: !846)
!852 = !DILocation(line: 26, column: 24, scope: !846)
!853 = !DILocation(line: 26, column: 5, scope: !846)
!854 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !30, file: !30, line: 78, type: !855, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!855 = !DISubroutineType(types: !856)
!856 = !{!28, !22, !22}
!857 = !DILocalVariable(name: "left", arg: 1, scope: !854, file: !30, line: 78, type: !22)
!858 = !DILocation(line: 78, column: 38, scope: !854)
!859 = !DILocalVariable(name: "right", arg: 2, scope: !854, file: !30, line: 78, type: !22)
!860 = !DILocation(line: 78, column: 52, scope: !854)
!861 = !DILocation(line: 80, column: 12, scope: !854)
!862 = !DILocation(line: 80, column: 19, scope: !854)
!863 = !DILocation(line: 80, column: 17, scope: !854)
!864 = !DILocation(line: 80, column: 25, scope: !854)
!865 = !DILocation(line: 80, column: 5, scope: !854)
!866 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !30, file: !30, line: 72, type: !855, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!867 = !DILocalVariable(name: "left", arg: 1, scope: !866, file: !30, line: 72, type: !22)
!868 = !DILocation(line: 72, column: 38, scope: !866)
!869 = !DILocalVariable(name: "right", arg: 2, scope: !866, file: !30, line: 72, type: !22)
!870 = !DILocation(line: 72, column: 52, scope: !866)
!871 = !DILocation(line: 74, column: 12, scope: !866)
!872 = !DILocation(line: 74, column: 19, scope: !866)
!873 = !DILocation(line: 74, column: 17, scope: !866)
!874 = !DILocation(line: 74, column: 25, scope: !866)
!875 = !DILocation(line: 74, column: 5, scope: !866)
!876 = distinct !DISubprogram(name: "klee_alarm_s32_sub_lower", scope: !30, file: !30, line: 60, type: !855, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!877 = !DILocalVariable(name: "left", arg: 1, scope: !876, file: !30, line: 60, type: !22)
!878 = !DILocation(line: 60, column: 38, scope: !876)
!879 = !DILocalVariable(name: "right", arg: 2, scope: !876, file: !30, line: 60, type: !22)
!880 = !DILocation(line: 60, column: 52, scope: !876)
!881 = !DILocation(line: 62, column: 12, scope: !876)
!882 = !DILocation(line: 62, column: 19, scope: !876)
!883 = !DILocation(line: 62, column: 17, scope: !876)
!884 = !DILocation(line: 62, column: 25, scope: !876)
!885 = !DILocation(line: 62, column: 5, scope: !876)
!886 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 799, type: !887, scopeLine: 800, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!887 = !DISubroutineType(types: !888)
!888 = !{!18, !6, !18, !18}
!889 = !DILocalVariable(name: "factor1", arg: 1, scope: !886, file: !69, line: 799, type: !6)
!890 = !DILocation(line: 799, column: 33, scope: !886)
!891 = !DILocalVariable(name: "factor2", arg: 2, scope: !886, file: !69, line: 799, type: !18)
!892 = !DILocation(line: 799, column: 46, scope: !886)
!893 = !DILocalVariable(name: "denominator", arg: 3, scope: !886, file: !69, line: 799, type: !18)
!894 = !DILocation(line: 799, column: 59, scope: !886)
!895 = !DILocalVariable(name: "s32Result", scope: !886, file: !69, line: 801, type: !25)
!896 = !DILocation(line: 801, column: 6, scope: !886)
!897 = !DILocalVariable(name: "s32Temp1", scope: !886, file: !69, line: 801, type: !25)
!898 = !DILocation(line: 801, column: 21, scope: !886)
!899 = !DILocation(line: 802, column: 14, scope: !886)
!900 = !DILocation(line: 802, column: 24, scope: !886)
!901 = !DILocation(line: 802, column: 22, scope: !886)
!902 = !DILocation(line: 802, column: 12, scope: !886)
!903 = !DILocation(line: 804, column: 5, scope: !904)
!904 = distinct !DILexicalBlock(scope: !886, file: !69, line: 804, column: 5)
!905 = !DILocation(line: 804, column: 17, scope: !904)
!906 = !DILocation(line: 804, column: 5, scope: !886)
!907 = !DILocation(line: 806, column: 6, scope: !908)
!908 = distinct !DILexicalBlock(scope: !909, file: !69, line: 806, column: 6)
!909 = distinct !DILexicalBlock(scope: !904, file: !69, line: 805, column: 2)
!910 = !DILocation(line: 806, column: 16, scope: !908)
!911 = !DILocation(line: 806, column: 6, scope: !909)
!912 = !DILocation(line: 808, column: 4, scope: !913)
!913 = distinct !DILexicalBlock(scope: !908, file: !69, line: 807, column: 3)
!914 = !DILocation(line: 812, column: 4, scope: !915)
!915 = distinct !DILexicalBlock(scope: !908, file: !69, line: 811, column: 3)
!916 = !DILocation(line: 817, column: 15, scope: !917)
!917 = distinct !DILexicalBlock(scope: !904, file: !69, line: 816, column: 2)
!918 = !DILocation(line: 817, column: 29, scope: !917)
!919 = !DILocation(line: 817, column: 39, scope: !917)
!920 = !DILocation(line: 817, column: 38, scope: !917)
!921 = !DILocation(line: 817, column: 54, scope: !917)
!922 = !DILocation(line: 817, column: 52, scope: !917)
!923 = !DILocation(line: 817, column: 25, scope: !917)
!924 = !DILocation(line: 817, column: 68, scope: !917)
!925 = !DILocation(line: 817, column: 12, scope: !917)
!926 = !DILocation(line: 818, column: 16, scope: !917)
!927 = !DILocation(line: 818, column: 25, scope: !917)
!928 = !DILocation(line: 818, column: 24, scope: !917)
!929 = !DILocation(line: 818, column: 41, scope: !917)
!930 = !DILocation(line: 818, column: 51, scope: !917)
!931 = !DILocation(line: 818, column: 50, scope: !917)
!932 = !DILocation(line: 818, column: 38, scope: !917)
!933 = !DILocation(line: 818, column: 13, scope: !917)
!934 = !DILocation(line: 819, column: 6, scope: !935)
!935 = distinct !DILexicalBlock(scope: !917, file: !69, line: 819, column: 6)
!936 = !DILocation(line: 819, column: 16, scope: !935)
!937 = !DILocation(line: 819, column: 6, scope: !917)
!938 = !DILocation(line: 821, column: 7, scope: !939)
!939 = distinct !DILexicalBlock(scope: !940, file: !69, line: 821, column: 7)
!940 = distinct !DILexicalBlock(scope: !935, file: !69, line: 820, column: 3)
!941 = !DILocation(line: 821, column: 17, scope: !939)
!942 = !DILocation(line: 821, column: 7, scope: !940)
!943 = !DILocation(line: 823, column: 17, scope: !944)
!944 = distinct !DILexicalBlock(scope: !939, file: !69, line: 822, column: 4)
!945 = !DILocation(line: 823, column: 12, scope: !944)
!946 = !DILocation(line: 823, column: 5, scope: !944)
!947 = !DILocation(line: 827, column: 5, scope: !948)
!948 = distinct !DILexicalBlock(scope: !939, file: !69, line: 826, column: 4)
!949 = !DILocation(line: 832, column: 4, scope: !950)
!950 = distinct !DILexicalBlock(scope: !935, file: !69, line: 831, column: 3)
!951 = !DILocation(line: 836, column: 1, scope: !886)
!952 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 854, type: !953, scopeLine: 855, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!953 = !DISubroutineType(types: !954)
!954 = !{!18, !18, !18, !18}
!955 = !DILocalVariable(name: "factor1", arg: 1, scope: !952, file: !69, line: 854, type: !18)
!956 = !DILocation(line: 854, column: 33, scope: !952)
!957 = !DILocalVariable(name: "factor2", arg: 2, scope: !952, file: !69, line: 854, type: !18)
!958 = !DILocation(line: 854, column: 46, scope: !952)
!959 = !DILocalVariable(name: "denominator", arg: 3, scope: !952, file: !69, line: 854, type: !18)
!960 = !DILocation(line: 854, column: 59, scope: !952)
!961 = !DILocalVariable(name: "u32Temp1", scope: !952, file: !69, line: 856, type: !428)
!962 = !DILocation(line: 856, column: 6, scope: !952)
!963 = !DILocalVariable(name: "u16TempDenom", scope: !952, file: !69, line: 857, type: !18)
!964 = !DILocation(line: 857, column: 6, scope: !952)
!965 = !DILocation(line: 859, column: 5, scope: !966)
!966 = distinct !DILexicalBlock(scope: !952, file: !69, line: 859, column: 5)
!967 = !DILocation(line: 859, column: 17, scope: !966)
!968 = !DILocation(line: 859, column: 5, scope: !952)
!969 = !DILocation(line: 861, column: 3, scope: !970)
!970 = distinct !DILexicalBlock(scope: !966, file: !69, line: 860, column: 2)
!971 = !DILocation(line: 865, column: 14, scope: !972)
!972 = distinct !DILexicalBlock(scope: !966, file: !69, line: 864, column: 2)
!973 = !DILocation(line: 865, column: 24, scope: !972)
!974 = !DILocation(line: 865, column: 22, scope: !972)
!975 = !DILocation(line: 865, column: 12, scope: !972)
!976 = !DILocation(line: 866, column: 18, scope: !972)
!977 = !DILocation(line: 866, column: 30, scope: !972)
!978 = !DILocation(line: 866, column: 16, scope: !972)
!979 = !DILocation(line: 867, column: 14, scope: !972)
!980 = !DILocation(line: 867, column: 25, scope: !972)
!981 = !DILocation(line: 867, column: 23, scope: !972)
!982 = !DILocation(line: 867, column: 12, scope: !972)
!983 = !DILocation(line: 868, column: 14, scope: !972)
!984 = !DILocation(line: 868, column: 25, scope: !972)
!985 = !DILocation(line: 868, column: 23, scope: !972)
!986 = !DILocation(line: 868, column: 12, scope: !972)
!987 = !DILocation(line: 869, column: 6, scope: !988)
!988 = distinct !DILexicalBlock(scope: !972, file: !69, line: 869, column: 6)
!989 = !DILocation(line: 869, column: 15, scope: !988)
!990 = !DILocation(line: 869, column: 6, scope: !972)
!991 = !DILocation(line: 871, column: 12, scope: !992)
!992 = distinct !DILexicalBlock(scope: !988, file: !69, line: 870, column: 3)
!993 = !DILocation(line: 871, column: 21, scope: !992)
!994 = !DILocation(line: 871, column: 11, scope: !992)
!995 = !DILocation(line: 871, column: 4, scope: !992)
!996 = !DILocation(line: 876, column: 4, scope: !997)
!997 = distinct !DILexicalBlock(scope: !988, file: !69, line: 875, column: 3)
!998 = !DILocation(line: 881, column: 1, scope: !952)
!999 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 898, type: !1000, scopeLine: 899, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1000 = !DISubroutineType(types: !1001)
!1001 = !{!18, !18, !18, !428}
!1002 = !DILocalVariable(name: "factor1", arg: 1, scope: !999, file: !69, line: 898, type: !18)
!1003 = !DILocation(line: 898, column: 33, scope: !999)
!1004 = !DILocalVariable(name: "factor2", arg: 2, scope: !999, file: !69, line: 898, type: !18)
!1005 = !DILocation(line: 898, column: 46, scope: !999)
!1006 = !DILocalVariable(name: "denominator", arg: 3, scope: !999, file: !69, line: 898, type: !428)
!1007 = !DILocation(line: 898, column: 59, scope: !999)
!1008 = !DILocalVariable(name: "u32Temp1", scope: !999, file: !69, line: 900, type: !428)
!1009 = !DILocation(line: 900, column: 6, scope: !999)
!1010 = !DILocation(line: 901, column: 5, scope: !1011)
!1011 = distinct !DILexicalBlock(scope: !999, file: !69, line: 901, column: 5)
!1012 = !DILocation(line: 901, column: 17, scope: !1011)
!1013 = !DILocation(line: 901, column: 5, scope: !999)
!1014 = !DILocation(line: 903, column: 3, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !1011, file: !69, line: 902, column: 2)
!1016 = !DILocation(line: 907, column: 15, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !1011, file: !69, line: 906, column: 2)
!1018 = !DILocation(line: 907, column: 25, scope: !1017)
!1019 = !DILocation(line: 907, column: 23, scope: !1017)
!1020 = !DILocation(line: 907, column: 36, scope: !1017)
!1021 = !DILocation(line: 907, column: 34, scope: !1017)
!1022 = !DILocation(line: 907, column: 12, scope: !1017)
!1023 = !DILocation(line: 908, column: 8, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1017, file: !69, line: 908, column: 6)
!1025 = !DILocation(line: 908, column: 18, scope: !1024)
!1026 = !DILocation(line: 908, column: 16, scope: !1024)
!1027 = !DILocation(line: 908, column: 28, scope: !1024)
!1028 = !DILocation(line: 908, column: 40, scope: !1024)
!1029 = !DILocation(line: 908, column: 39, scope: !1024)
!1030 = !DILocation(line: 908, column: 26, scope: !1024)
!1031 = !DILocation(line: 908, column: 53, scope: !1024)
!1032 = !DILocation(line: 908, column: 64, scope: !1024)
!1033 = !DILocation(line: 908, column: 50, scope: !1024)
!1034 = !DILocation(line: 908, column: 6, scope: !1017)
!1035 = !DILocation(line: 910, column: 12, scope: !1036)
!1036 = distinct !DILexicalBlock(scope: !1024, file: !69, line: 909, column: 3)
!1037 = !DILocation(line: 911, column: 3, scope: !1036)
!1038 = !DILocation(line: 912, column: 6, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1017, file: !69, line: 912, column: 6)
!1040 = !DILocation(line: 912, column: 15, scope: !1039)
!1041 = !DILocation(line: 912, column: 6, scope: !1017)
!1042 = !DILocation(line: 914, column: 12, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !1039, file: !69, line: 913, column: 3)
!1044 = !DILocation(line: 914, column: 21, scope: !1043)
!1045 = !DILocation(line: 914, column: 11, scope: !1043)
!1046 = !DILocation(line: 914, column: 4, scope: !1043)
!1047 = !DILocation(line: 918, column: 4, scope: !1048)
!1048 = distinct !DILexicalBlock(scope: !1039, file: !69, line: 917, column: 3)
!1049 = !DILocation(line: 921, column: 1, scope: !999)
!1050 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 938, type: !1051, scopeLine: 939, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1051 = !DISubroutineType(types: !1052)
!1052 = !{!428, !428, !18}
!1053 = !DILocalVariable(name: "x_value", arg: 1, scope: !1050, file: !69, line: 938, type: !428)
!1054 = !DILocation(line: 938, column: 25, scope: !1050)
!1055 = !DILocalVariable(name: "y_value", arg: 2, scope: !1050, file: !69, line: 938, type: !18)
!1056 = !DILocation(line: 938, column: 38, scope: !1050)
!1057 = !DILocalVariable(name: "u32Temp1", scope: !1050, file: !69, line: 940, type: !428)
!1058 = !DILocation(line: 940, column: 6, scope: !1050)
!1059 = !DILocation(line: 941, column: 5, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1050, file: !69, line: 941, column: 5)
!1061 = !DILocation(line: 941, column: 13, scope: !1060)
!1062 = !DILocation(line: 941, column: 5, scope: !1050)
!1063 = !DILocation(line: 943, column: 3, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1060, file: !69, line: 942, column: 2)
!1065 = !DILocation(line: 947, column: 15, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1060, file: !69, line: 946, column: 2)
!1067 = !DILocation(line: 947, column: 26, scope: !1066)
!1068 = !DILocation(line: 947, column: 34, scope: !1066)
!1069 = !DILocation(line: 947, column: 33, scope: !1066)
!1070 = !DILocation(line: 947, column: 45, scope: !1066)
!1071 = !DILocation(line: 947, column: 43, scope: !1066)
!1072 = !DILocation(line: 947, column: 23, scope: !1066)
!1073 = !DILocation(line: 947, column: 54, scope: !1066)
!1074 = !DILocation(line: 947, column: 12, scope: !1066)
!1075 = !DILocation(line: 948, column: 15, scope: !1066)
!1076 = !DILocation(line: 948, column: 23, scope: !1066)
!1077 = !DILocation(line: 948, column: 22, scope: !1066)
!1078 = !DILocation(line: 948, column: 35, scope: !1066)
!1079 = !DILocation(line: 948, column: 44, scope: !1066)
!1080 = !DILocation(line: 948, column: 43, scope: !1066)
!1081 = !DILocation(line: 948, column: 32, scope: !1066)
!1082 = !DILocation(line: 948, column: 12, scope: !1066)
!1083 = !DILocation(line: 949, column: 10, scope: !1066)
!1084 = !DILocation(line: 949, column: 3, scope: !1066)
!1085 = !DILocation(line: 951, column: 1, scope: !1050)
!1086 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 969, type: !1087, scopeLine: 970, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1087 = !DISubroutineType(types: !1088)
!1088 = !{!6, !6, !6, !6}
!1089 = !DILocalVariable(name: "fak1", arg: 1, scope: !1086, file: !69, line: 969, type: !6)
!1090 = !DILocation(line: 969, column: 33, scope: !1086)
!1091 = !DILocalVariable(name: "fak2", arg: 2, scope: !1086, file: !69, line: 969, type: !6)
!1092 = !DILocation(line: 969, column: 43, scope: !1086)
!1093 = !DILocalVariable(name: "div", arg: 3, scope: !1086, file: !69, line: 969, type: !6)
!1094 = !DILocation(line: 969, column: 53, scope: !1086)
!1095 = !DILocalVariable(name: "s32Temp1", scope: !1086, file: !69, line: 971, type: !25)
!1096 = !DILocation(line: 971, column: 6, scope: !1086)
!1097 = !DILocalVariable(name: "s32Temp2", scope: !1086, file: !69, line: 971, type: !25)
!1098 = !DILocation(line: 971, column: 20, scope: !1086)
!1099 = !DILocalVariable(name: "s32Temp3", scope: !1086, file: !69, line: 971, type: !25)
!1100 = !DILocation(line: 971, column: 34, scope: !1086)
!1101 = !DILocation(line: 972, column: 13, scope: !1086)
!1102 = !DILocation(line: 972, column: 20, scope: !1086)
!1103 = !DILocation(line: 972, column: 18, scope: !1086)
!1104 = !DILocation(line: 972, column: 11, scope: !1086)
!1105 = !DILocation(line: 973, column: 5, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !1086, file: !69, line: 973, column: 5)
!1107 = !DILocation(line: 973, column: 9, scope: !1106)
!1108 = !DILocation(line: 973, column: 5, scope: !1086)
!1109 = !DILocation(line: 975, column: 6, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1111, file: !69, line: 975, column: 6)
!1111 = distinct !DILexicalBlock(scope: !1106, file: !69, line: 974, column: 2)
!1112 = !DILocation(line: 975, column: 15, scope: !1110)
!1113 = !DILocation(line: 975, column: 6, scope: !1111)
!1114 = !DILocation(line: 977, column: 4, scope: !1115)
!1115 = distinct !DILexicalBlock(scope: !1110, file: !69, line: 976, column: 3)
!1116 = !DILocation(line: 981, column: 4, scope: !1117)
!1117 = distinct !DILexicalBlock(scope: !1110, file: !69, line: 980, column: 3)
!1118 = !DILocation(line: 986, column: 15, scope: !1119)
!1119 = distinct !DILexicalBlock(scope: !1106, file: !69, line: 985, column: 2)
!1120 = !DILocation(line: 986, column: 28, scope: !1119)
!1121 = !DILocation(line: 986, column: 39, scope: !1119)
!1122 = !DILocation(line: 986, column: 37, scope: !1119)
!1123 = !DILocation(line: 986, column: 46, scope: !1119)
!1124 = !DILocation(line: 986, column: 44, scope: !1119)
!1125 = !DILocation(line: 986, column: 24, scope: !1119)
!1126 = !DILocation(line: 986, column: 52, scope: !1119)
!1127 = !DILocation(line: 986, column: 12, scope: !1119)
!1128 = !DILocation(line: 987, column: 15, scope: !1119)
!1129 = !DILocation(line: 987, column: 24, scope: !1119)
!1130 = !DILocation(line: 987, column: 23, scope: !1119)
!1131 = !DILocation(line: 987, column: 32, scope: !1119)
!1132 = !DILocation(line: 987, column: 41, scope: !1119)
!1133 = !DILocation(line: 987, column: 40, scope: !1119)
!1134 = !DILocation(line: 987, column: 29, scope: !1119)
!1135 = !DILocation(line: 987, column: 12, scope: !1119)
!1136 = !DILocation(line: 988, column: 6, scope: !1137)
!1137 = distinct !DILexicalBlock(scope: !1119, file: !69, line: 988, column: 6)
!1138 = !DILocation(line: 988, column: 15, scope: !1137)
!1139 = !DILocation(line: 988, column: 6, scope: !1119)
!1140 = !DILocation(line: 990, column: 7, scope: !1141)
!1141 = distinct !DILexicalBlock(scope: !1142, file: !69, line: 990, column: 7)
!1142 = distinct !DILexicalBlock(scope: !1137, file: !69, line: 989, column: 3)
!1143 = !DILocation(line: 990, column: 16, scope: !1141)
!1144 = !DILocation(line: 990, column: 7, scope: !1142)
!1145 = !DILocation(line: 992, column: 17, scope: !1146)
!1146 = distinct !DILexicalBlock(scope: !1141, file: !69, line: 991, column: 4)
!1147 = !DILocation(line: 992, column: 12, scope: !1146)
!1148 = !DILocation(line: 992, column: 5, scope: !1146)
!1149 = !DILocation(line: 996, column: 5, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1141, file: !69, line: 995, column: 4)
!1151 = !DILocation(line: 1001, column: 4, scope: !1152)
!1152 = distinct !DILexicalBlock(scope: !1137, file: !69, line: 1000, column: 3)
!1153 = !DILocation(line: 1004, column: 1, scope: !1086)
!1154 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1022, type: !1155, scopeLine: 1023, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1155 = !DISubroutineType(types: !1156)
!1156 = !{!6, !6, !6, !18}
!1157 = !DILocalVariable(name: "data1", arg: 1, scope: !1154, file: !69, line: 1022, type: !6)
!1158 = !DILocation(line: 1022, column: 33, scope: !1154)
!1159 = !DILocalVariable(name: "data2", arg: 2, scope: !1154, file: !69, line: 1022, type: !6)
!1160 = !DILocation(line: 1022, column: 43, scope: !1154)
!1161 = !DILocalVariable(name: "denominator", arg: 3, scope: !1154, file: !69, line: 1022, type: !18)
!1162 = !DILocation(line: 1022, column: 53, scope: !1154)
!1163 = !DILocalVariable(name: "s32Result", scope: !1154, file: !69, line: 1024, type: !25)
!1164 = !DILocation(line: 1024, column: 6, scope: !1154)
!1165 = !DILocalVariable(name: "s32Temp1", scope: !1154, file: !69, line: 1024, type: !25)
!1166 = !DILocation(line: 1024, column: 21, scope: !1154)
!1167 = !DILocation(line: 1025, column: 14, scope: !1154)
!1168 = !DILocation(line: 1025, column: 22, scope: !1154)
!1169 = !DILocation(line: 1025, column: 20, scope: !1154)
!1170 = !DILocation(line: 1025, column: 12, scope: !1154)
!1171 = !DILocation(line: 1027, column: 5, scope: !1172)
!1172 = distinct !DILexicalBlock(scope: !1154, file: !69, line: 1027, column: 5)
!1173 = !DILocation(line: 1027, column: 17, scope: !1172)
!1174 = !DILocation(line: 1027, column: 5, scope: !1154)
!1175 = !DILocation(line: 1029, column: 6, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1177, file: !69, line: 1029, column: 6)
!1177 = distinct !DILexicalBlock(scope: !1172, file: !69, line: 1028, column: 2)
!1178 = !DILocation(line: 1029, column: 16, scope: !1176)
!1179 = !DILocation(line: 1029, column: 6, scope: !1177)
!1180 = !DILocation(line: 1031, column: 4, scope: !1181)
!1181 = distinct !DILexicalBlock(scope: !1176, file: !69, line: 1030, column: 3)
!1182 = !DILocation(line: 1033, column: 11, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1176, file: !69, line: 1033, column: 11)
!1184 = !DILocation(line: 1033, column: 21, scope: !1183)
!1185 = !DILocation(line: 1033, column: 11, scope: !1176)
!1186 = !DILocation(line: 1035, column: 4, scope: !1187)
!1187 = distinct !DILexicalBlock(scope: !1183, file: !69, line: 1034, column: 3)
!1188 = !DILocation(line: 1039, column: 4, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1183, file: !69, line: 1038, column: 3)
!1190 = !DILocation(line: 1044, column: 15, scope: !1191)
!1191 = distinct !DILexicalBlock(scope: !1172, file: !69, line: 1043, column: 2)
!1192 = !DILocation(line: 1044, column: 28, scope: !1191)
!1193 = !DILocation(line: 1044, column: 38, scope: !1191)
!1194 = !DILocation(line: 1044, column: 37, scope: !1191)
!1195 = !DILocation(line: 1044, column: 51, scope: !1191)
!1196 = !DILocation(line: 1044, column: 50, scope: !1191)
!1197 = !DILocation(line: 1044, column: 25, scope: !1191)
!1198 = !DILocation(line: 1044, column: 64, scope: !1191)
!1199 = !DILocation(line: 1044, column: 12, scope: !1191)
!1200 = !DILocation(line: 1045, column: 16, scope: !1191)
!1201 = !DILocation(line: 1045, column: 25, scope: !1191)
!1202 = !DILocation(line: 1045, column: 24, scope: !1191)
!1203 = !DILocation(line: 1045, column: 41, scope: !1191)
!1204 = !DILocation(line: 1045, column: 51, scope: !1191)
!1205 = !DILocation(line: 1045, column: 50, scope: !1191)
!1206 = !DILocation(line: 1045, column: 38, scope: !1191)
!1207 = !DILocation(line: 1045, column: 13, scope: !1191)
!1208 = !DILocation(line: 1046, column: 6, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1191, file: !69, line: 1046, column: 6)
!1210 = !DILocation(line: 1046, column: 16, scope: !1209)
!1211 = !DILocation(line: 1046, column: 6, scope: !1191)
!1212 = !DILocation(line: 1048, column: 7, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1214, file: !69, line: 1048, column: 7)
!1214 = distinct !DILexicalBlock(scope: !1209, file: !69, line: 1047, column: 3)
!1215 = !DILocation(line: 1048, column: 17, scope: !1213)
!1216 = !DILocation(line: 1048, column: 7, scope: !1214)
!1217 = !DILocation(line: 1050, column: 17, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1213, file: !69, line: 1049, column: 4)
!1219 = !DILocation(line: 1050, column: 12, scope: !1218)
!1220 = !DILocation(line: 1050, column: 5, scope: !1218)
!1221 = !DILocation(line: 1054, column: 5, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !1213, file: !69, line: 1053, column: 4)
!1223 = !DILocation(line: 1059, column: 4, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1209, file: !69, line: 1058, column: 3)
!1225 = !DILocation(line: 1063, column: 1, scope: !1154)
!1226 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1080, type: !1227, scopeLine: 1081, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1227 = !DISubroutineType(types: !1228)
!1228 = !{!428, !428, !25}
!1229 = !DILocalVariable(name: "numerator", arg: 1, scope: !1226, file: !69, line: 1080, type: !428)
!1230 = !DILocation(line: 1080, column: 25, scope: !1226)
!1231 = !DILocalVariable(name: "denominator", arg: 2, scope: !1226, file: !69, line: 1080, type: !25)
!1232 = !DILocation(line: 1080, column: 40, scope: !1226)
!1233 = !DILocalVariable(name: "u32Temp1", scope: !1226, file: !69, line: 1082, type: !428)
!1234 = !DILocation(line: 1082, column: 6, scope: !1226)
!1235 = !DILocation(line: 1083, column: 5, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1226, file: !69, line: 1083, column: 5)
!1237 = !DILocation(line: 1083, column: 17, scope: !1236)
!1238 = !DILocation(line: 1083, column: 5, scope: !1226)
!1239 = !DILocation(line: 1085, column: 3, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1236, file: !69, line: 1084, column: 2)
!1241 = !DILocation(line: 1089, column: 6, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1243, file: !69, line: 1089, column: 6)
!1243 = distinct !DILexicalBlock(scope: !1236, file: !69, line: 1088, column: 2)
!1244 = !DILocation(line: 1089, column: 18, scope: !1242)
!1245 = !DILocation(line: 1089, column: 6, scope: !1243)
!1246 = !DILocation(line: 1091, column: 4, scope: !1247)
!1247 = distinct !DILexicalBlock(scope: !1242, file: !69, line: 1090, column: 3)
!1248 = !DILocation(line: 1095, column: 16, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1242, file: !69, line: 1094, column: 3)
!1250 = !DILocation(line: 1095, column: 30, scope: !1249)
!1251 = !DILocation(line: 1095, column: 40, scope: !1249)
!1252 = !DILocation(line: 1095, column: 39, scope: !1249)
!1253 = !DILocation(line: 1095, column: 55, scope: !1249)
!1254 = !DILocation(line: 1095, column: 53, scope: !1249)
!1255 = !DILocation(line: 1095, column: 26, scope: !1249)
!1256 = !DILocation(line: 1095, column: 68, scope: !1249)
!1257 = !DILocation(line: 1095, column: 13, scope: !1249)
!1258 = !DILocation(line: 1096, column: 16, scope: !1249)
!1259 = !DILocation(line: 1096, column: 25, scope: !1249)
!1260 = !DILocation(line: 1096, column: 24, scope: !1249)
!1261 = !DILocation(line: 1096, column: 41, scope: !1249)
!1262 = !DILocation(line: 1096, column: 51, scope: !1249)
!1263 = !DILocation(line: 1096, column: 50, scope: !1249)
!1264 = !DILocation(line: 1096, column: 38, scope: !1249)
!1265 = !DILocation(line: 1096, column: 13, scope: !1249)
!1266 = !DILocation(line: 1097, column: 11, scope: !1249)
!1267 = !DILocation(line: 1097, column: 4, scope: !1249)
!1268 = !DILocation(line: 1100, column: 1, scope: !1226)
!1269 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1117, type: !1270, scopeLine: 1118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1270 = !DISubroutineType(types: !1271)
!1271 = !{!428, !25, !428}
!1272 = !DILocalVariable(name: "numerator", arg: 1, scope: !1269, file: !69, line: 1117, type: !25)
!1273 = !DILocation(line: 1117, column: 25, scope: !1269)
!1274 = !DILocalVariable(name: "denominator", arg: 2, scope: !1269, file: !69, line: 1117, type: !428)
!1275 = !DILocation(line: 1117, column: 40, scope: !1269)
!1276 = !DILocalVariable(name: "s32Temp1", scope: !1269, file: !69, line: 1119, type: !25)
!1277 = !DILocation(line: 1119, column: 6, scope: !1269)
!1278 = !DILocation(line: 1120, column: 5, scope: !1279)
!1279 = distinct !DILexicalBlock(scope: !1269, file: !69, line: 1120, column: 5)
!1280 = !DILocation(line: 1120, column: 17, scope: !1279)
!1281 = !DILocation(line: 1120, column: 5, scope: !1269)
!1282 = !DILocation(line: 1122, column: 6, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1284, file: !69, line: 1122, column: 6)
!1284 = distinct !DILexicalBlock(scope: !1279, file: !69, line: 1121, column: 2)
!1285 = !DILocation(line: 1122, column: 16, scope: !1283)
!1286 = !DILocation(line: 1122, column: 6, scope: !1284)
!1287 = !DILocation(line: 1124, column: 4, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1283, file: !69, line: 1123, column: 3)
!1289 = !DILocation(line: 1128, column: 4, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1283, file: !69, line: 1127, column: 3)
!1291 = !DILocation(line: 1133, column: 6, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1293, file: !69, line: 1133, column: 6)
!1293 = distinct !DILexicalBlock(scope: !1279, file: !69, line: 1132, column: 2)
!1294 = !DILocation(line: 1133, column: 16, scope: !1292)
!1295 = !DILocation(line: 1133, column: 6, scope: !1293)
!1296 = !DILocation(line: 1135, column: 17, scope: !1297)
!1297 = distinct !DILexicalBlock(scope: !1292, file: !69, line: 1134, column: 3)
!1298 = !DILocation(line: 1135, column: 31, scope: !1297)
!1299 = !DILocation(line: 1135, column: 41, scope: !1297)
!1300 = !DILocation(line: 1135, column: 40, scope: !1297)
!1301 = !DILocation(line: 1135, column: 56, scope: !1297)
!1302 = !DILocation(line: 1135, column: 54, scope: !1297)
!1303 = !DILocation(line: 1135, column: 27, scope: !1297)
!1304 = !DILocation(line: 1135, column: 69, scope: !1297)
!1305 = !DILocation(line: 1135, column: 13, scope: !1297)
!1306 = !DILocation(line: 1136, column: 13, scope: !1297)
!1307 = !DILocation(line: 1136, column: 23, scope: !1297)
!1308 = !DILocation(line: 1136, column: 22, scope: !1297)
!1309 = !DILocation(line: 1136, column: 39, scope: !1297)
!1310 = !DILocation(line: 1136, column: 48, scope: !1297)
!1311 = !DILocation(line: 1136, column: 47, scope: !1297)
!1312 = !DILocation(line: 1136, column: 36, scope: !1297)
!1313 = !DILocation(line: 1136, column: 4, scope: !1297)
!1314 = !DILocation(line: 1140, column: 4, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1292, file: !69, line: 1139, column: 3)
!1316 = !DILocation(line: 1143, column: 1, scope: !1269)
!1317 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1160, type: !1318, scopeLine: 1161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1318 = !DISubroutineType(types: !1319)
!1319 = !{!428, !25, !25}
!1320 = !DILocalVariable(name: "numerator", arg: 1, scope: !1317, file: !69, line: 1160, type: !25)
!1321 = !DILocation(line: 1160, column: 25, scope: !1317)
!1322 = !DILocalVariable(name: "denominator", arg: 2, scope: !1317, file: !69, line: 1160, type: !25)
!1323 = !DILocation(line: 1160, column: 40, scope: !1317)
!1324 = !DILocalVariable(name: "u32Temp1", scope: !1317, file: !69, line: 1162, type: !428)
!1325 = !DILocation(line: 1162, column: 6, scope: !1317)
!1326 = !DILocalVariable(name: "u32Temp2", scope: !1317, file: !69, line: 1162, type: !428)
!1327 = !DILocation(line: 1162, column: 20, scope: !1317)
!1328 = !DILocation(line: 1163, column: 5, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1317, file: !69, line: 1163, column: 5)
!1330 = !DILocation(line: 1163, column: 17, scope: !1329)
!1331 = !DILocation(line: 1163, column: 5, scope: !1317)
!1332 = !DILocation(line: 1165, column: 6, scope: !1333)
!1333 = distinct !DILexicalBlock(scope: !1334, file: !69, line: 1165, column: 6)
!1334 = distinct !DILexicalBlock(scope: !1329, file: !69, line: 1164, column: 2)
!1335 = !DILocation(line: 1165, column: 16, scope: !1333)
!1336 = !DILocation(line: 1165, column: 6, scope: !1334)
!1337 = !DILocation(line: 1167, column: 4, scope: !1338)
!1338 = distinct !DILexicalBlock(scope: !1333, file: !69, line: 1166, column: 3)
!1339 = !DILocation(line: 1171, column: 4, scope: !1340)
!1340 = distinct !DILexicalBlock(scope: !1333, file: !69, line: 1170, column: 3)
!1341 = !DILocation(line: 1176, column: 6, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1343, file: !69, line: 1176, column: 6)
!1343 = distinct !DILexicalBlock(scope: !1329, file: !69, line: 1175, column: 2)
!1344 = !DILocation(line: 1176, column: 16, scope: !1342)
!1345 = !DILocation(line: 1176, column: 6, scope: !1343)
!1346 = !DILocation(line: 1178, column: 7, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !1348, file: !69, line: 1178, column: 7)
!1348 = distinct !DILexicalBlock(scope: !1342, file: !69, line: 1177, column: 3)
!1349 = !DILocation(line: 1178, column: 17, scope: !1347)
!1350 = !DILocation(line: 1178, column: 7, scope: !1348)
!1351 = !DILocation(line: 1180, column: 5, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1347, file: !69, line: 1179, column: 4)
!1353 = !DILocation(line: 1184, column: 8, scope: !1354)
!1354 = distinct !DILexicalBlock(scope: !1355, file: !69, line: 1184, column: 8)
!1355 = distinct !DILexicalBlock(scope: !1347, file: !69, line: 1183, column: 4)
!1356 = !DILocation(line: 1184, column: 20, scope: !1354)
!1357 = !DILocation(line: 1184, column: 8, scope: !1355)
!1358 = !DILocation(line: 1186, column: 6, scope: !1359)
!1359 = distinct !DILexicalBlock(scope: !1354, file: !69, line: 1185, column: 5)
!1360 = !DILocation(line: 1190, column: 18, scope: !1361)
!1361 = distinct !DILexicalBlock(scope: !1354, file: !69, line: 1189, column: 5)
!1362 = !DILocation(line: 1190, column: 32, scope: !1361)
!1363 = !DILocation(line: 1190, column: 42, scope: !1361)
!1364 = !DILocation(line: 1190, column: 41, scope: !1361)
!1365 = !DILocation(line: 1190, column: 57, scope: !1361)
!1366 = !DILocation(line: 1190, column: 55, scope: !1361)
!1367 = !DILocation(line: 1190, column: 28, scope: !1361)
!1368 = !DILocation(line: 1190, column: 71, scope: !1361)
!1369 = !DILocation(line: 1190, column: 15, scope: !1361)
!1370 = !DILocation(line: 1191, column: 18, scope: !1361)
!1371 = !DILocation(line: 1191, column: 29, scope: !1361)
!1372 = !DILocation(line: 1191, column: 27, scope: !1361)
!1373 = !DILocation(line: 1191, column: 45, scope: !1361)
!1374 = !DILocation(line: 1191, column: 57, scope: !1361)
!1375 = !DILocation(line: 1191, column: 55, scope: !1361)
!1376 = !DILocation(line: 1191, column: 42, scope: !1361)
!1377 = !DILocation(line: 1191, column: 15, scope: !1361)
!1378 = !DILocation(line: 1192, column: 13, scope: !1361)
!1379 = !DILocation(line: 1192, column: 6, scope: !1361)
!1380 = !DILocation(line: 1198, column: 7, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1382, file: !69, line: 1198, column: 7)
!1382 = distinct !DILexicalBlock(scope: !1342, file: !69, line: 1197, column: 3)
!1383 = !DILocation(line: 1198, column: 19, scope: !1381)
!1384 = !DILocation(line: 1198, column: 7, scope: !1382)
!1385 = !DILocation(line: 1200, column: 5, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1381, file: !69, line: 1199, column: 4)
!1387 = !DILocation(line: 1204, column: 18, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1381, file: !69, line: 1203, column: 4)
!1389 = !DILocation(line: 1204, column: 17, scope: !1388)
!1390 = !DILocation(line: 1204, column: 15, scope: !1388)
!1391 = !DILocation(line: 1205, column: 20, scope: !1388)
!1392 = !DILocation(line: 1205, column: 19, scope: !1388)
!1393 = !DILocation(line: 1205, column: 17, scope: !1388)
!1394 = !DILocation(line: 1206, column: 17, scope: !1388)
!1395 = !DILocation(line: 1206, column: 31, scope: !1388)
!1396 = !DILocation(line: 1206, column: 41, scope: !1388)
!1397 = !DILocation(line: 1206, column: 40, scope: !1388)
!1398 = !DILocation(line: 1206, column: 56, scope: !1388)
!1399 = !DILocation(line: 1206, column: 54, scope: !1388)
!1400 = !DILocation(line: 1206, column: 27, scope: !1388)
!1401 = !DILocation(line: 1206, column: 70, scope: !1388)
!1402 = !DILocation(line: 1206, column: 14, scope: !1388)
!1403 = !DILocation(line: 1207, column: 17, scope: !1388)
!1404 = !DILocation(line: 1207, column: 28, scope: !1388)
!1405 = !DILocation(line: 1207, column: 26, scope: !1388)
!1406 = !DILocation(line: 1207, column: 44, scope: !1388)
!1407 = !DILocation(line: 1207, column: 56, scope: !1388)
!1408 = !DILocation(line: 1207, column: 54, scope: !1388)
!1409 = !DILocation(line: 1207, column: 41, scope: !1388)
!1410 = !DILocation(line: 1207, column: 14, scope: !1388)
!1411 = !DILocation(line: 1208, column: 12, scope: !1388)
!1412 = !DILocation(line: 1208, column: 5, scope: !1388)
!1413 = !DILocation(line: 1213, column: 1, scope: !1317)
!1414 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1230, type: !1415, scopeLine: 1231, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1415 = !DISubroutineType(types: !1416)
!1416 = !{!428, !428, !428}
!1417 = !DILocalVariable(name: "numerator", arg: 1, scope: !1414, file: !69, line: 1230, type: !428)
!1418 = !DILocation(line: 1230, column: 25, scope: !1414)
!1419 = !DILocalVariable(name: "denominator", arg: 2, scope: !1414, file: !69, line: 1230, type: !428)
!1420 = !DILocation(line: 1230, column: 40, scope: !1414)
!1421 = !DILocalVariable(name: "u32Temp1", scope: !1414, file: !69, line: 1233, type: !428)
!1422 = !DILocation(line: 1233, column: 6, scope: !1414)
!1423 = !DILocalVariable(name: "u32Temp2", scope: !1414, file: !69, line: 1233, type: !428)
!1424 = !DILocation(line: 1233, column: 20, scope: !1414)
!1425 = !DILocalVariable(name: "u32Temp3", scope: !1414, file: !69, line: 1233, type: !428)
!1426 = !DILocation(line: 1233, column: 34, scope: !1414)
!1427 = !DILocalVariable(name: "numerator_old", scope: !1414, file: !69, line: 1233, type: !428)
!1428 = !DILocation(line: 1233, column: 48, scope: !1414)
!1429 = !DILocation(line: 1234, column: 5, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1414, file: !69, line: 1234, column: 5)
!1431 = !DILocation(line: 1234, column: 16, scope: !1430)
!1432 = !DILocation(line: 1234, column: 5, scope: !1414)
!1433 = !DILocation(line: 1236, column: 3, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1430, file: !69, line: 1235, column: 2)
!1435 = !DILocation(line: 1240, column: 14, scope: !1436)
!1436 = distinct !DILexicalBlock(scope: !1430, file: !69, line: 1239, column: 2)
!1437 = !DILocation(line: 1240, column: 26, scope: !1436)
!1438 = !DILocation(line: 1240, column: 41, scope: !1436)
!1439 = !DILocation(line: 1240, column: 51, scope: !1436)
!1440 = !DILocation(line: 1240, column: 50, scope: !1436)
!1441 = !DILocation(line: 1240, column: 38, scope: !1436)
!1442 = !DILocation(line: 1240, column: 24, scope: !1436)
!1443 = !DILocation(line: 1240, column: 12, scope: !1436)
!1444 = !DILocation(line: 1241, column: 7, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1436, file: !69, line: 1241, column: 6)
!1446 = !DILocation(line: 1241, column: 16, scope: !1445)
!1447 = !DILocation(line: 1241, column: 24, scope: !1445)
!1448 = !DILocation(line: 1241, column: 6, scope: !1436)
!1449 = !DILocation(line: 1243, column: 16, scope: !1450)
!1450 = distinct !DILexicalBlock(scope: !1445, file: !69, line: 1242, column: 3)
!1451 = !DILocation(line: 1243, column: 27, scope: !1450)
!1452 = !DILocation(line: 1243, column: 13, scope: !1450)
!1453 = !DILocation(line: 1244, column: 3, scope: !1450)
!1454 = !DILocation(line: 1247, column: 16, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1445, file: !69, line: 1246, column: 3)
!1456 = !DILocation(line: 1247, column: 27, scope: !1455)
!1457 = !DILocation(line: 1247, column: 32, scope: !1455)
!1458 = !DILocation(line: 1247, column: 13, scope: !1455)
!1459 = !DILocation(line: 1250, column: 6, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1436, file: !69, line: 1250, column: 6)
!1461 = !DILocation(line: 1250, column: 17, scope: !1460)
!1462 = !DILocation(line: 1250, column: 15, scope: !1460)
!1463 = !DILocation(line: 1250, column: 6, scope: !1436)
!1464 = !DILocation(line: 1252, column: 12, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1460, file: !69, line: 1251, column: 3)
!1466 = !DILocation(line: 1252, column: 22, scope: !1465)
!1467 = !DILocation(line: 1252, column: 21, scope: !1465)
!1468 = !DILocation(line: 1252, column: 4, scope: !1465)
!1469 = !DILocation(line: 1256, column: 13, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1460, file: !69, line: 1255, column: 3)
!1471 = !DILocation(line: 1256, column: 23, scope: !1470)
!1472 = !DILocation(line: 1256, column: 22, scope: !1470)
!1473 = !DILocation(line: 1256, column: 36, scope: !1470)
!1474 = !DILocation(line: 1256, column: 4, scope: !1470)
!1475 = !DILocation(line: 1261, column: 1, scope: !1414)
!1476 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1278, type: !1477, scopeLine: 1279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1477 = !DISubroutineType(types: !1478)
!1478 = !{!25, !428, !25}
!1479 = !DILocalVariable(name: "numerator", arg: 1, scope: !1476, file: !69, line: 1278, type: !428)
!1480 = !DILocation(line: 1278, column: 25, scope: !1476)
!1481 = !DILocalVariable(name: "denominator", arg: 2, scope: !1476, file: !69, line: 1278, type: !25)
!1482 = !DILocation(line: 1278, column: 40, scope: !1476)
!1483 = !DILocalVariable(name: "u32Temp1", scope: !1476, file: !69, line: 1280, type: !428)
!1484 = !DILocation(line: 1280, column: 6, scope: !1476)
!1485 = !DILocalVariable(name: "u32Temp2", scope: !1476, file: !69, line: 1280, type: !428)
!1486 = !DILocation(line: 1280, column: 20, scope: !1476)
!1487 = !DILocation(line: 1281, column: 5, scope: !1488)
!1488 = distinct !DILexicalBlock(scope: !1476, file: !69, line: 1281, column: 5)
!1489 = !DILocation(line: 1281, column: 17, scope: !1488)
!1490 = !DILocation(line: 1281, column: 5, scope: !1476)
!1491 = !DILocation(line: 1283, column: 6, scope: !1492)
!1492 = distinct !DILexicalBlock(scope: !1493, file: !69, line: 1283, column: 6)
!1493 = distinct !DILexicalBlock(scope: !1488, file: !69, line: 1282, column: 2)
!1494 = !DILocation(line: 1283, column: 18, scope: !1492)
!1495 = !DILocation(line: 1283, column: 6, scope: !1493)
!1496 = !DILocation(line: 1285, column: 4, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1492, file: !69, line: 1284, column: 3)
!1498 = !DILocation(line: 1289, column: 19, scope: !1499)
!1499 = distinct !DILexicalBlock(scope: !1492, file: !69, line: 1288, column: 3)
!1500 = !DILocation(line: 1289, column: 18, scope: !1499)
!1501 = !DILocation(line: 1289, column: 16, scope: !1499)
!1502 = !DILocation(line: 1290, column: 16, scope: !1499)
!1503 = !DILocation(line: 1290, column: 30, scope: !1499)
!1504 = !DILocation(line: 1290, column: 40, scope: !1499)
!1505 = !DILocation(line: 1290, column: 39, scope: !1499)
!1506 = !DILocation(line: 1290, column: 55, scope: !1499)
!1507 = !DILocation(line: 1290, column: 53, scope: !1499)
!1508 = !DILocation(line: 1290, column: 26, scope: !1499)
!1509 = !DILocation(line: 1290, column: 69, scope: !1499)
!1510 = !DILocation(line: 1290, column: 13, scope: !1499)
!1511 = !DILocation(line: 1291, column: 16, scope: !1499)
!1512 = !DILocation(line: 1291, column: 25, scope: !1499)
!1513 = !DILocation(line: 1291, column: 24, scope: !1499)
!1514 = !DILocation(line: 1291, column: 41, scope: !1499)
!1515 = !DILocation(line: 1291, column: 51, scope: !1499)
!1516 = !DILocation(line: 1291, column: 50, scope: !1499)
!1517 = !DILocation(line: 1291, column: 38, scope: !1499)
!1518 = !DILocation(line: 1291, column: 13, scope: !1499)
!1519 = !DILocation(line: 1292, column: 7, scope: !1520)
!1520 = distinct !DILexicalBlock(scope: !1499, file: !69, line: 1292, column: 7)
!1521 = !DILocation(line: 1292, column: 16, scope: !1520)
!1522 = !DILocation(line: 1292, column: 7, scope: !1499)
!1523 = !DILocation(line: 1294, column: 13, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1520, file: !69, line: 1293, column: 4)
!1525 = !DILocation(line: 1294, column: 12, scope: !1524)
!1526 = !DILocation(line: 1294, column: 5, scope: !1524)
!1527 = !DILocation(line: 1298, column: 5, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1520, file: !69, line: 1297, column: 4)
!1529 = !DILocation(line: 1304, column: 15, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1488, file: !69, line: 1303, column: 2)
!1531 = !DILocation(line: 1304, column: 29, scope: !1530)
!1532 = !DILocation(line: 1304, column: 39, scope: !1530)
!1533 = !DILocation(line: 1304, column: 38, scope: !1530)
!1534 = !DILocation(line: 1304, column: 54, scope: !1530)
!1535 = !DILocation(line: 1304, column: 52, scope: !1530)
!1536 = !DILocation(line: 1304, column: 25, scope: !1530)
!1537 = !DILocation(line: 1304, column: 68, scope: !1530)
!1538 = !DILocation(line: 1304, column: 12, scope: !1530)
!1539 = !DILocation(line: 1305, column: 15, scope: !1530)
!1540 = !DILocation(line: 1305, column: 24, scope: !1530)
!1541 = !DILocation(line: 1305, column: 23, scope: !1530)
!1542 = !DILocation(line: 1305, column: 40, scope: !1530)
!1543 = !DILocation(line: 1305, column: 50, scope: !1530)
!1544 = !DILocation(line: 1305, column: 49, scope: !1530)
!1545 = !DILocation(line: 1305, column: 37, scope: !1530)
!1546 = !DILocation(line: 1305, column: 12, scope: !1530)
!1547 = !DILocation(line: 1306, column: 6, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1530, file: !69, line: 1306, column: 6)
!1549 = !DILocation(line: 1306, column: 15, scope: !1548)
!1550 = !DILocation(line: 1306, column: 6, scope: !1530)
!1551 = !DILocation(line: 1308, column: 11, scope: !1552)
!1552 = distinct !DILexicalBlock(scope: !1548, file: !69, line: 1307, column: 3)
!1553 = !DILocation(line: 1308, column: 4, scope: !1552)
!1554 = !DILocation(line: 1312, column: 4, scope: !1555)
!1555 = distinct !DILexicalBlock(scope: !1548, file: !69, line: 1311, column: 3)
!1556 = !DILocation(line: 1315, column: 1, scope: !1476)
!1557 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1333, type: !1558, scopeLine: 1334, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1558 = !DISubroutineType(types: !1559)
!1559 = !{!25, !25, !428}
!1560 = !DILocalVariable(name: "numerator", arg: 1, scope: !1557, file: !69, line: 1333, type: !25)
!1561 = !DILocation(line: 1333, column: 25, scope: !1557)
!1562 = !DILocalVariable(name: "denominator", arg: 2, scope: !1557, file: !69, line: 1333, type: !428)
!1563 = !DILocation(line: 1333, column: 40, scope: !1557)
!1564 = !DILocalVariable(name: "s32Temp1", scope: !1557, file: !69, line: 1335, type: !25)
!1565 = !DILocation(line: 1335, column: 6, scope: !1557)
!1566 = !DILocalVariable(name: "s32Temp2", scope: !1557, file: !69, line: 1335, type: !25)
!1567 = !DILocation(line: 1335, column: 20, scope: !1557)
!1568 = !DILocalVariable(name: "u32Temp0", scope: !1557, file: !69, line: 1336, type: !428)
!1569 = !DILocation(line: 1336, column: 6, scope: !1557)
!1570 = !DILocalVariable(name: "u32Temp1", scope: !1557, file: !69, line: 1336, type: !428)
!1571 = !DILocation(line: 1336, column: 20, scope: !1557)
!1572 = !DILocalVariable(name: "u32Temp2", scope: !1557, file: !69, line: 1336, type: !428)
!1573 = !DILocation(line: 1336, column: 34, scope: !1557)
!1574 = !DILocation(line: 1337, column: 5, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1557, file: !69, line: 1337, column: 5)
!1576 = !DILocation(line: 1337, column: 17, scope: !1575)
!1577 = !DILocation(line: 1337, column: 5, scope: !1557)
!1578 = !DILocation(line: 1339, column: 6, scope: !1579)
!1579 = distinct !DILexicalBlock(scope: !1580, file: !69, line: 1339, column: 6)
!1580 = distinct !DILexicalBlock(scope: !1575, file: !69, line: 1338, column: 2)
!1581 = !DILocation(line: 1339, column: 16, scope: !1579)
!1582 = !DILocation(line: 1339, column: 6, scope: !1580)
!1583 = !DILocation(line: 1341, column: 4, scope: !1584)
!1584 = distinct !DILexicalBlock(scope: !1579, file: !69, line: 1340, column: 3)
!1585 = !DILocation(line: 1345, column: 4, scope: !1586)
!1586 = distinct !DILexicalBlock(scope: !1579, file: !69, line: 1344, column: 3)
!1587 = !DILocation(line: 1350, column: 6, scope: !1588)
!1588 = distinct !DILexicalBlock(scope: !1589, file: !69, line: 1350, column: 6)
!1589 = distinct !DILexicalBlock(scope: !1575, file: !69, line: 1349, column: 2)
!1590 = !DILocation(line: 1350, column: 16, scope: !1588)
!1591 = !DILocation(line: 1350, column: 6, scope: !1589)
!1592 = !DILocation(line: 1352, column: 16, scope: !1593)
!1593 = distinct !DILexicalBlock(scope: !1588, file: !69, line: 1351, column: 3)
!1594 = !DILocation(line: 1352, column: 15, scope: !1593)
!1595 = !DILocation(line: 1352, column: 13, scope: !1593)
!1596 = !DILocation(line: 1353, column: 16, scope: !1593)
!1597 = !DILocation(line: 1353, column: 25, scope: !1593)
!1598 = !DILocation(line: 1353, column: 24, scope: !1593)
!1599 = !DILocation(line: 1353, column: 13, scope: !1593)
!1600 = !DILocation(line: 1354, column: 15, scope: !1593)
!1601 = !DILocation(line: 1354, column: 28, scope: !1593)
!1602 = !DILocation(line: 1354, column: 37, scope: !1593)
!1603 = !DILocation(line: 1354, column: 36, scope: !1593)
!1604 = !DILocation(line: 1354, column: 52, scope: !1593)
!1605 = !DILocation(line: 1354, column: 50, scope: !1593)
!1606 = !DILocation(line: 1354, column: 24, scope: !1593)
!1607 = !DILocation(line: 1354, column: 13, scope: !1593)
!1608 = !DILocation(line: 1356, column: 8, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1593, file: !69, line: 1356, column: 7)
!1610 = !DILocation(line: 1356, column: 20, scope: !1609)
!1611 = !DILocation(line: 1356, column: 27, scope: !1609)
!1612 = !DILocation(line: 1356, column: 7, scope: !1593)
!1613 = !DILocation(line: 1358, column: 20, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1609, file: !69, line: 1357, column: 4)
!1615 = !DILocation(line: 1358, column: 32, scope: !1614)
!1616 = !DILocation(line: 1358, column: 17, scope: !1614)
!1617 = !DILocation(line: 1359, column: 4, scope: !1614)
!1618 = !DILocation(line: 1362, column: 20, scope: !1619)
!1619 = distinct !DILexicalBlock(scope: !1609, file: !69, line: 1361, column: 4)
!1620 = !DILocation(line: 1362, column: 32, scope: !1619)
!1621 = !DILocation(line: 1362, column: 38, scope: !1619)
!1622 = !DILocation(line: 1362, column: 17, scope: !1619)
!1623 = !DILocation(line: 1366, column: 7, scope: !1624)
!1624 = distinct !DILexicalBlock(scope: !1593, file: !69, line: 1366, column: 7)
!1625 = !DILocation(line: 1366, column: 18, scope: !1624)
!1626 = !DILocation(line: 1366, column: 16, scope: !1624)
!1627 = !DILocation(line: 1366, column: 7, scope: !1593)
!1628 = !DILocation(line: 1368, column: 14, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1624, file: !69, line: 1367, column: 4)
!1630 = !DILocation(line: 1368, column: 13, scope: !1629)
!1631 = !DILocation(line: 1368, column: 23, scope: !1629)
!1632 = !DILocation(line: 1368, column: 5, scope: !1629)
!1633 = !DILocation(line: 1372, column: 14, scope: !1634)
!1634 = distinct !DILexicalBlock(scope: !1624, file: !69, line: 1371, column: 4)
!1635 = !DILocation(line: 1372, column: 23, scope: !1634)
!1636 = !DILocation(line: 1372, column: 12, scope: !1634)
!1637 = !DILocation(line: 1372, column: 27, scope: !1634)
!1638 = !DILocation(line: 1372, column: 5, scope: !1634)
!1639 = !DILocation(line: 1379, column: 16, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1588, file: !69, line: 1378, column: 3)
!1641 = !DILocation(line: 1379, column: 30, scope: !1640)
!1642 = !DILocation(line: 1379, column: 40, scope: !1640)
!1643 = !DILocation(line: 1379, column: 39, scope: !1640)
!1644 = !DILocation(line: 1379, column: 55, scope: !1640)
!1645 = !DILocation(line: 1379, column: 53, scope: !1640)
!1646 = !DILocation(line: 1379, column: 26, scope: !1640)
!1647 = !DILocation(line: 1379, column: 69, scope: !1640)
!1648 = !DILocation(line: 1379, column: 13, scope: !1640)
!1649 = !DILocation(line: 1380, column: 16, scope: !1640)
!1650 = !DILocation(line: 1380, column: 26, scope: !1640)
!1651 = !DILocation(line: 1380, column: 25, scope: !1640)
!1652 = !DILocation(line: 1380, column: 42, scope: !1640)
!1653 = !DILocation(line: 1380, column: 51, scope: !1640)
!1654 = !DILocation(line: 1380, column: 50, scope: !1640)
!1655 = !DILocation(line: 1380, column: 39, scope: !1640)
!1656 = !DILocation(line: 1380, column: 13, scope: !1640)
!1657 = !DILocation(line: 1381, column: 11, scope: !1640)
!1658 = !DILocation(line: 1381, column: 4, scope: !1640)
!1659 = !DILocation(line: 1384, column: 1, scope: !1557)
!1660 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1401, type: !1661, scopeLine: 1402, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1661 = !DISubroutineType(types: !1662)
!1662 = !{!25, !25, !25}
!1663 = !DILocalVariable(name: "numerator", arg: 1, scope: !1660, file: !69, line: 1401, type: !25)
!1664 = !DILocation(line: 1401, column: 25, scope: !1660)
!1665 = !DILocalVariable(name: "denominator", arg: 2, scope: !1660, file: !69, line: 1401, type: !25)
!1666 = !DILocation(line: 1401, column: 40, scope: !1660)
!1667 = !DILocalVariable(name: "s32Temp1", scope: !1660, file: !69, line: 1403, type: !25)
!1668 = !DILocation(line: 1403, column: 6, scope: !1660)
!1669 = !DILocalVariable(name: "s32Temp2", scope: !1660, file: !69, line: 1403, type: !25)
!1670 = !DILocation(line: 1403, column: 20, scope: !1660)
!1671 = !DILocalVariable(name: "denominator_prime", scope: !1660, file: !69, line: 1404, type: !428)
!1672 = !DILocation(line: 1404, column: 6, scope: !1660)
!1673 = !DILocalVariable(name: "u32Temp1", scope: !1660, file: !69, line: 1404, type: !428)
!1674 = !DILocation(line: 1404, column: 29, scope: !1660)
!1675 = !DILocalVariable(name: "u32Temp2", scope: !1660, file: !69, line: 1404, type: !428)
!1676 = !DILocation(line: 1404, column: 43, scope: !1660)
!1677 = !DILocalVariable(name: "u32numerator", scope: !1660, file: !69, line: 1405, type: !428)
!1678 = !DILocation(line: 1405, column: 6, scope: !1660)
!1679 = !DILocalVariable(name: "u32denominator", scope: !1660, file: !69, line: 1405, type: !428)
!1680 = !DILocation(line: 1405, column: 23, scope: !1660)
!1681 = !DILocation(line: 1406, column: 5, scope: !1682)
!1682 = distinct !DILexicalBlock(scope: !1660, file: !69, line: 1406, column: 5)
!1683 = !DILocation(line: 1406, column: 15, scope: !1682)
!1684 = !DILocation(line: 1406, column: 5, scope: !1660)
!1685 = !DILocation(line: 1408, column: 6, scope: !1686)
!1686 = distinct !DILexicalBlock(scope: !1687, file: !69, line: 1408, column: 6)
!1687 = distinct !DILexicalBlock(scope: !1682, file: !69, line: 1407, column: 2)
!1688 = !DILocation(line: 1408, column: 18, scope: !1686)
!1689 = !DILocation(line: 1408, column: 6, scope: !1687)
!1690 = !DILocation(line: 1410, column: 7, scope: !1691)
!1691 = distinct !DILexicalBlock(scope: !1692, file: !69, line: 1410, column: 7)
!1692 = distinct !DILexicalBlock(scope: !1686, file: !69, line: 1409, column: 3)
!1693 = !DILocation(line: 1410, column: 19, scope: !1691)
!1694 = !DILocation(line: 1410, column: 7, scope: !1692)
!1695 = !DILocation(line: 1412, column: 5, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1691, file: !69, line: 1411, column: 4)
!1697 = !DILocation(line: 1416, column: 21, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1691, file: !69, line: 1415, column: 4)
!1699 = !DILocation(line: 1416, column: 20, scope: !1698)
!1700 = !DILocation(line: 1416, column: 18, scope: !1698)
!1701 = !DILocation(line: 1417, column: 23, scope: !1698)
!1702 = !DILocation(line: 1417, column: 22, scope: !1698)
!1703 = !DILocation(line: 1417, column: 20, scope: !1698)
!1704 = !DILocation(line: 1418, column: 16, scope: !1698)
!1705 = !DILocation(line: 1418, column: 33, scope: !1698)
!1706 = !DILocation(line: 1418, column: 46, scope: !1698)
!1707 = !DILocation(line: 1418, column: 45, scope: !1698)
!1708 = !DILocation(line: 1418, column: 64, scope: !1698)
!1709 = !DILocation(line: 1418, column: 62, scope: !1698)
!1710 = !DILocation(line: 1418, column: 29, scope: !1698)
!1711 = !DILocation(line: 1418, column: 81, scope: !1698)
!1712 = !DILocation(line: 1418, column: 14, scope: !1698)
!1713 = !DILocation(line: 1419, column: 17, scope: !1698)
!1714 = !DILocation(line: 1419, column: 30, scope: !1698)
!1715 = !DILocation(line: 1419, column: 29, scope: !1698)
!1716 = !DILocation(line: 1419, column: 49, scope: !1698)
!1717 = !DILocation(line: 1419, column: 58, scope: !1698)
!1718 = !DILocation(line: 1419, column: 57, scope: !1698)
!1719 = !DILocation(line: 1419, column: 46, scope: !1698)
!1720 = !DILocation(line: 1419, column: 14, scope: !1698)
!1721 = !DILocation(line: 1420, column: 8, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1698, file: !69, line: 1420, column: 8)
!1723 = !DILocation(line: 1420, column: 17, scope: !1722)
!1724 = !DILocation(line: 1420, column: 8, scope: !1698)
!1725 = !DILocation(line: 1422, column: 13, scope: !1726)
!1726 = distinct !DILexicalBlock(scope: !1722, file: !69, line: 1421, column: 5)
!1727 = !DILocation(line: 1422, column: 6, scope: !1726)
!1728 = !DILocation(line: 1426, column: 6, scope: !1729)
!1729 = distinct !DILexicalBlock(scope: !1722, file: !69, line: 1425, column: 5)
!1730 = !DILocation(line: 1432, column: 20, scope: !1731)
!1731 = distinct !DILexicalBlock(scope: !1686, file: !69, line: 1431, column: 3)
!1732 = !DILocation(line: 1432, column: 19, scope: !1731)
!1733 = !DILocation(line: 1432, column: 29, scope: !1731)
!1734 = !DILocation(line: 1432, column: 17, scope: !1731)
!1735 = !DILocation(line: 1433, column: 16, scope: !1731)
!1736 = !DILocation(line: 1433, column: 33, scope: !1731)
!1737 = !DILocation(line: 1433, column: 46, scope: !1731)
!1738 = !DILocation(line: 1433, column: 45, scope: !1731)
!1739 = !DILocation(line: 1433, column: 61, scope: !1731)
!1740 = !DILocation(line: 1433, column: 59, scope: !1731)
!1741 = !DILocation(line: 1433, column: 29, scope: !1731)
!1742 = !DILocation(line: 1433, column: 75, scope: !1731)
!1743 = !DILocation(line: 1433, column: 13, scope: !1731)
!1744 = !DILocation(line: 1434, column: 16, scope: !1731)
!1745 = !DILocation(line: 1434, column: 29, scope: !1731)
!1746 = !DILocation(line: 1434, column: 28, scope: !1731)
!1747 = !DILocation(line: 1434, column: 45, scope: !1731)
!1748 = !DILocation(line: 1434, column: 54, scope: !1731)
!1749 = !DILocation(line: 1434, column: 53, scope: !1731)
!1750 = !DILocation(line: 1434, column: 42, scope: !1731)
!1751 = !DILocation(line: 1434, column: 13, scope: !1731)
!1752 = !DILocation(line: 1435, column: 13, scope: !1731)
!1753 = !DILocation(line: 1435, column: 12, scope: !1731)
!1754 = !DILocation(line: 1435, column: 22, scope: !1731)
!1755 = !DILocation(line: 1435, column: 4, scope: !1731)
!1756 = !DILocation(line: 1440, column: 6, scope: !1757)
!1757 = distinct !DILexicalBlock(scope: !1758, file: !69, line: 1440, column: 6)
!1758 = distinct !DILexicalBlock(scope: !1682, file: !69, line: 1439, column: 2)
!1759 = !DILocation(line: 1440, column: 18, scope: !1757)
!1760 = !DILocation(line: 1440, column: 6, scope: !1758)
!1761 = !DILocation(line: 1442, column: 7, scope: !1762)
!1762 = distinct !DILexicalBlock(scope: !1763, file: !69, line: 1442, column: 7)
!1763 = distinct !DILexicalBlock(scope: !1757, file: !69, line: 1441, column: 3)
!1764 = !DILocation(line: 1442, column: 19, scope: !1762)
!1765 = !DILocation(line: 1442, column: 7, scope: !1763)
!1766 = !DILocation(line: 1444, column: 5, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1762, file: !69, line: 1443, column: 4)
!1768 = !DILocation(line: 1448, column: 23, scope: !1769)
!1769 = distinct !DILexicalBlock(scope: !1762, file: !69, line: 1447, column: 4)
!1770 = !DILocation(line: 1448, column: 22, scope: !1769)
!1771 = !DILocation(line: 1448, column: 35, scope: !1769)
!1772 = !DILocation(line: 1448, column: 20, scope: !1769)
!1773 = !DILocation(line: 1449, column: 17, scope: !1769)
!1774 = !DILocation(line: 1449, column: 31, scope: !1769)
!1775 = !DILocation(line: 1449, column: 41, scope: !1769)
!1776 = !DILocation(line: 1449, column: 40, scope: !1769)
!1777 = !DILocation(line: 1449, column: 59, scope: !1769)
!1778 = !DILocation(line: 1449, column: 57, scope: !1769)
!1779 = !DILocation(line: 1449, column: 27, scope: !1769)
!1780 = !DILocation(line: 1449, column: 76, scope: !1769)
!1781 = !DILocation(line: 1449, column: 14, scope: !1769)
!1782 = !DILocation(line: 1450, column: 17, scope: !1769)
!1783 = !DILocation(line: 1450, column: 27, scope: !1769)
!1784 = !DILocation(line: 1450, column: 26, scope: !1769)
!1785 = !DILocation(line: 1450, column: 46, scope: !1769)
!1786 = !DILocation(line: 1450, column: 55, scope: !1769)
!1787 = !DILocation(line: 1450, column: 54, scope: !1769)
!1788 = !DILocation(line: 1450, column: 43, scope: !1769)
!1789 = !DILocation(line: 1450, column: 14, scope: !1769)
!1790 = !DILocation(line: 1451, column: 14, scope: !1769)
!1791 = !DILocation(line: 1451, column: 13, scope: !1769)
!1792 = !DILocation(line: 1451, column: 23, scope: !1769)
!1793 = !DILocation(line: 1451, column: 5, scope: !1769)
!1794 = !DILocation(line: 1456, column: 16, scope: !1795)
!1795 = distinct !DILexicalBlock(scope: !1757, file: !69, line: 1455, column: 3)
!1796 = !DILocation(line: 1456, column: 30, scope: !1795)
!1797 = !DILocation(line: 1456, column: 40, scope: !1795)
!1798 = !DILocation(line: 1456, column: 39, scope: !1795)
!1799 = !DILocation(line: 1456, column: 55, scope: !1795)
!1800 = !DILocation(line: 1456, column: 53, scope: !1795)
!1801 = !DILocation(line: 1456, column: 26, scope: !1795)
!1802 = !DILocation(line: 1456, column: 69, scope: !1795)
!1803 = !DILocation(line: 1456, column: 13, scope: !1795)
!1804 = !DILocation(line: 1457, column: 16, scope: !1795)
!1805 = !DILocation(line: 1457, column: 26, scope: !1795)
!1806 = !DILocation(line: 1457, column: 25, scope: !1795)
!1807 = !DILocation(line: 1457, column: 42, scope: !1795)
!1808 = !DILocation(line: 1457, column: 51, scope: !1795)
!1809 = !DILocation(line: 1457, column: 50, scope: !1795)
!1810 = !DILocation(line: 1457, column: 39, scope: !1795)
!1811 = !DILocation(line: 1457, column: 13, scope: !1795)
!1812 = !DILocation(line: 1458, column: 11, scope: !1795)
!1813 = !DILocation(line: 1458, column: 4, scope: !1795)
!1814 = !DILocation(line: 1461, column: 1, scope: !1660)
!1815 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1479, type: !1816, scopeLine: 1480, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1816 = !DISubroutineType(types: !1817)
!1817 = !{!6, !25, !428}
!1818 = !DILocalVariable(name: "numerator", arg: 1, scope: !1815, file: !69, line: 1479, type: !25)
!1819 = !DILocation(line: 1479, column: 25, scope: !1815)
!1820 = !DILocalVariable(name: "denominator", arg: 2, scope: !1815, file: !69, line: 1479, type: !428)
!1821 = !DILocation(line: 1479, column: 40, scope: !1815)
!1822 = !DILocalVariable(name: "numerator_prime", scope: !1815, file: !69, line: 1482, type: !428)
!1823 = !DILocation(line: 1482, column: 6, scope: !1815)
!1824 = !DILocalVariable(name: "u32Temp1", scope: !1815, file: !69, line: 1482, type: !428)
!1825 = !DILocation(line: 1482, column: 27, scope: !1815)
!1826 = !DILocalVariable(name: "u32Temp2", scope: !1815, file: !69, line: 1482, type: !428)
!1827 = !DILocation(line: 1482, column: 41, scope: !1815)
!1828 = !DILocalVariable(name: "u32Temp3", scope: !1815, file: !69, line: 1482, type: !428)
!1829 = !DILocation(line: 1482, column: 55, scope: !1815)
!1830 = !DILocalVariable(name: "s32Temp1", scope: !1815, file: !69, line: 1483, type: !25)
!1831 = !DILocation(line: 1483, column: 6, scope: !1815)
!1832 = !DILocalVariable(name: "s32Temp2", scope: !1815, file: !69, line: 1483, type: !25)
!1833 = !DILocation(line: 1483, column: 20, scope: !1815)
!1834 = !DILocalVariable(name: "s32Temp3", scope: !1815, file: !69, line: 1483, type: !25)
!1835 = !DILocation(line: 1483, column: 34, scope: !1815)
!1836 = !DILocation(line: 1484, column: 5, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1815, file: !69, line: 1484, column: 5)
!1838 = !DILocation(line: 1484, column: 17, scope: !1837)
!1839 = !DILocation(line: 1484, column: 5, scope: !1815)
!1840 = !DILocation(line: 1486, column: 6, scope: !1841)
!1841 = distinct !DILexicalBlock(scope: !1842, file: !69, line: 1486, column: 6)
!1842 = distinct !DILexicalBlock(scope: !1837, file: !69, line: 1485, column: 2)
!1843 = !DILocation(line: 1486, column: 15, scope: !1841)
!1844 = !DILocation(line: 1486, column: 6, scope: !1842)
!1845 = !DILocation(line: 1488, column: 4, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1841, file: !69, line: 1487, column: 3)
!1847 = !DILocation(line: 1492, column: 4, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1841, file: !69, line: 1491, column: 3)
!1849 = !DILocation(line: 1497, column: 6, scope: !1850)
!1850 = distinct !DILexicalBlock(scope: !1851, file: !69, line: 1497, column: 6)
!1851 = distinct !DILexicalBlock(scope: !1837, file: !69, line: 1496, column: 2)
!1852 = !DILocation(line: 1497, column: 16, scope: !1850)
!1853 = !DILocation(line: 1497, column: 6, scope: !1851)
!1854 = !DILocation(line: 1499, column: 23, scope: !1855)
!1855 = distinct !DILexicalBlock(scope: !1850, file: !69, line: 1498, column: 3)
!1856 = !DILocation(line: 1499, column: 22, scope: !1855)
!1857 = !DILocation(line: 1499, column: 20, scope: !1855)
!1858 = !DILocation(line: 1500, column: 16, scope: !1855)
!1859 = !DILocation(line: 1500, column: 32, scope: !1855)
!1860 = !DILocation(line: 1500, column: 31, scope: !1855)
!1861 = !DILocation(line: 1500, column: 13, scope: !1855)
!1862 = !DILocation(line: 1501, column: 15, scope: !1855)
!1863 = !DILocation(line: 1501, column: 34, scope: !1855)
!1864 = !DILocation(line: 1501, column: 45, scope: !1855)
!1865 = !DILocation(line: 1501, column: 43, scope: !1855)
!1866 = !DILocation(line: 1501, column: 31, scope: !1855)
!1867 = !DILocation(line: 1501, column: 13, scope: !1855)
!1868 = !DILocation(line: 1503, column: 8, scope: !1869)
!1869 = distinct !DILexicalBlock(scope: !1855, file: !69, line: 1503, column: 7)
!1870 = !DILocation(line: 1503, column: 20, scope: !1869)
!1871 = !DILocation(line: 1503, column: 27, scope: !1869)
!1872 = !DILocation(line: 1503, column: 7, scope: !1855)
!1873 = !DILocation(line: 1505, column: 19, scope: !1874)
!1874 = distinct !DILexicalBlock(scope: !1869, file: !69, line: 1504, column: 4)
!1875 = !DILocation(line: 1505, column: 31, scope: !1874)
!1876 = !DILocation(line: 1505, column: 17, scope: !1874)
!1877 = !DILocation(line: 1506, column: 4, scope: !1874)
!1878 = !DILocation(line: 1509, column: 20, scope: !1879)
!1879 = distinct !DILexicalBlock(scope: !1869, file: !69, line: 1508, column: 4)
!1880 = !DILocation(line: 1509, column: 32, scope: !1879)
!1881 = !DILocation(line: 1509, column: 38, scope: !1879)
!1882 = !DILocation(line: 1509, column: 17, scope: !1879)
!1883 = !DILocation(line: 1512, column: 7, scope: !1884)
!1884 = distinct !DILexicalBlock(scope: !1855, file: !69, line: 1512, column: 7)
!1885 = !DILocation(line: 1512, column: 18, scope: !1884)
!1886 = !DILocation(line: 1512, column: 16, scope: !1884)
!1887 = !DILocation(line: 1512, column: 7, scope: !1855)
!1888 = !DILocation(line: 1514, column: 18, scope: !1889)
!1889 = distinct !DILexicalBlock(scope: !1884, file: !69, line: 1513, column: 4)
!1890 = !DILocation(line: 1514, column: 16, scope: !1889)
!1891 = !DILocation(line: 1514, column: 28, scope: !1889)
!1892 = !DILocation(line: 1514, column: 14, scope: !1889)
!1893 = !DILocation(line: 1515, column: 4, scope: !1889)
!1894 = !DILocation(line: 1518, column: 18, scope: !1895)
!1895 = distinct !DILexicalBlock(scope: !1884, file: !69, line: 1517, column: 4)
!1896 = !DILocation(line: 1518, column: 26, scope: !1895)
!1897 = !DILocation(line: 1518, column: 16, scope: !1895)
!1898 = !DILocation(line: 1518, column: 30, scope: !1895)
!1899 = !DILocation(line: 1518, column: 14, scope: !1895)
!1900 = !DILocation(line: 1520, column: 8, scope: !1901)
!1901 = distinct !DILexicalBlock(scope: !1855, file: !69, line: 1520, column: 7)
!1902 = !DILocation(line: 1520, column: 18, scope: !1901)
!1903 = !DILocation(line: 1520, column: 7, scope: !1855)
!1904 = !DILocation(line: 1522, column: 18, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1901, file: !69, line: 1521, column: 4)
!1906 = !DILocation(line: 1522, column: 12, scope: !1905)
!1907 = !DILocation(line: 1522, column: 5, scope: !1905)
!1908 = !DILocation(line: 1526, column: 5, scope: !1909)
!1909 = distinct !DILexicalBlock(scope: !1901, file: !69, line: 1525, column: 4)
!1910 = !DILocation(line: 1531, column: 16, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1850, file: !69, line: 1530, column: 3)
!1912 = !DILocation(line: 1531, column: 26, scope: !1911)
!1913 = !DILocation(line: 1531, column: 25, scope: !1911)
!1914 = !DILocation(line: 1531, column: 41, scope: !1911)
!1915 = !DILocation(line: 1531, column: 39, scope: !1911)
!1916 = !DILocation(line: 1531, column: 13, scope: !1911)
!1917 = !DILocation(line: 1532, column: 16, scope: !1911)
!1918 = !DILocation(line: 1532, column: 30, scope: !1911)
!1919 = !DILocation(line: 1532, column: 40, scope: !1911)
!1920 = !DILocation(line: 1532, column: 39, scope: !1911)
!1921 = !DILocation(line: 1532, column: 55, scope: !1911)
!1922 = !DILocation(line: 1532, column: 53, scope: !1911)
!1923 = !DILocation(line: 1532, column: 26, scope: !1911)
!1924 = !DILocation(line: 1532, column: 68, scope: !1911)
!1925 = !DILocation(line: 1532, column: 13, scope: !1911)
!1926 = !DILocation(line: 1533, column: 16, scope: !1911)
!1927 = !DILocation(line: 1533, column: 25, scope: !1911)
!1928 = !DILocation(line: 1533, column: 24, scope: !1911)
!1929 = !DILocation(line: 1533, column: 41, scope: !1911)
!1930 = !DILocation(line: 1533, column: 51, scope: !1911)
!1931 = !DILocation(line: 1533, column: 50, scope: !1911)
!1932 = !DILocation(line: 1533, column: 38, scope: !1911)
!1933 = !DILocation(line: 1533, column: 13, scope: !1911)
!1934 = !DILocation(line: 1534, column: 7, scope: !1935)
!1935 = distinct !DILexicalBlock(scope: !1911, file: !69, line: 1534, column: 7)
!1936 = !DILocation(line: 1534, column: 16, scope: !1935)
!1937 = !DILocation(line: 1534, column: 7, scope: !1911)
!1938 = !DILocation(line: 1536, column: 17, scope: !1939)
!1939 = distinct !DILexicalBlock(scope: !1935, file: !69, line: 1535, column: 4)
!1940 = !DILocation(line: 1536, column: 12, scope: !1939)
!1941 = !DILocation(line: 1536, column: 5, scope: !1939)
!1942 = !DILocation(line: 1540, column: 5, scope: !1943)
!1943 = distinct !DILexicalBlock(scope: !1935, file: !69, line: 1539, column: 4)
!1944 = !DILocation(line: 1544, column: 1, scope: !1815)
!1945 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1946, file: !1946, line: 12, type: !1947, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !34, retainedNodes: !1950)
!1946 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1947 = !DISubroutineType(types: !1948)
!1948 = !{null, !1949}
!1949 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1950 = !{!1951}
!1951 = !DILocalVariable(name: "z", arg: 1, scope: !1945, file: !1946, line: 12, type: !1949)
!1952 = !DILocation(line: 0, scope: !1945)
!1953 = !DILocation(line: 13, column: 9, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1945, file: !1946, line: 13, column: 7)
!1955 = !DILocation(line: 13, column: 7, scope: !1945)
!1956 = !DILocation(line: 14, column: 5, scope: !1954)
!1957 = !DILocation(line: 15, column: 1, scope: !1945)
