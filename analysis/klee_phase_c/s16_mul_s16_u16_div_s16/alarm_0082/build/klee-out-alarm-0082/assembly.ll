; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0082/build/s16_mul_s16_u16_div_s16_alarm_0082.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"factor1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"factor2\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [111 x i8] c"KLEE-ALARM-0082: signed overflow. assert (s32)(s32Result / (s32)denominator) * (s32)denominator <= 2147483647;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0082.err\00", align 1
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
  %call = call signext i16 @s16_mul_s16_u16_div_s16(i16 signext %3, i16 zeroext %4, i16 signext %5), !dbg !64
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
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !646
  %conv8 = sext i16 %4 to i64, !dbg !649
  %call = call i32 @klee_alarm_divisor_nonzero(i64 %conv8), !dbg !650
  %tobool = icmp ne i32 %call, 0, !dbg !650
  br i1 %tobool, label %if.end, label %if.then9, !dbg !651

if.then9:                                         ; preds = %if.else7
  store i16 0, i16* %retval, align 2, !dbg !652
  br label %return, !dbg !652

if.end:                                           ; preds = %if.else7
  %5 = load i32, i32* %s32Result, align 4, !dbg !654
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !656
  %conv10 = sext i16 %6 to i32, !dbg !657
  %int_cast_to_i64 = zext i32 %conv10 to i64, !dbg !658
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !658
  %div = sdiv i32 %5, %conv10, !dbg !658, !klee.check.div !106
  %conv11 = sext i32 %div to i64, !dbg !659
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !660
  %conv12 = sext i16 %7 to i32, !dbg !661
  %conv13 = sext i32 %conv12 to i64, !dbg !662
  %call14 = call i32 @klee_alarm_s32_mul_lower(i64 %conv11, i64 %conv13), !dbg !663
  %tobool15 = icmp ne i32 %call14, 0, !dbg !663
  br i1 %tobool15, label %if.end17, label %if.then16, !dbg !664

if.then16:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !665
  br label %return, !dbg !665

if.end17:                                         ; preds = %if.end
  %8 = load i32, i32* %s32Result, align 4, !dbg !667
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !669
  %conv18 = sext i16 %9 to i32, !dbg !670
  %int_cast_to_i641 = zext i32 %conv18 to i64, !dbg !671
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !671
  %div19 = sdiv i32 %8, %conv18, !dbg !671, !klee.check.div !106
  %conv20 = sext i32 %div19 to i64, !dbg !672
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !673
  %conv21 = sext i16 %10 to i32, !dbg !674
  %conv22 = sext i32 %conv21 to i64, !dbg !675
  %call23 = call i32 @klee_alarm_s32_mul_upper(i64 %conv20, i64 %conv22), !dbg !676
  %tobool24 = icmp ne i32 %call23, 0, !dbg !676
  br i1 %tobool24, label %if.end26, label %if.then25, !dbg !677

if.then25:                                        ; preds = %if.end17
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 640, i8* getelementptr inbounds ([111 x i8], [111 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !678
  unreachable, !dbg !678

if.end26:                                         ; preds = %if.end17
  %11 = load i32, i32* %s32Result, align 4, !dbg !680
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !681
  %conv27 = sext i16 %12 to i32, !dbg !682
  %int_cast_to_i642 = zext i32 %conv27 to i64, !dbg !683
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !683
  %div28 = sdiv i32 %11, %conv27, !dbg !683, !klee.check.div !106
  %13 = load i16, i16* %denominator.addr, align 2, !dbg !684
  %conv29 = sext i16 %13 to i32, !dbg !685
  %mul30 = mul nsw i32 %div28, %conv29, !dbg !686
  %conv31 = sext i32 %mul30 to i64, !dbg !687
  store volatile i64 %conv31, i64* @klee_alarm_sink_s64, align 8, !dbg !688
  store i16 0, i16* %retval, align 2, !dbg !689
  br label %return, !dbg !689

return:                                           ; preds = %if.end26, %if.then16, %if.then9, %if.else, %if.then6
  %14 = load i16, i16* %retval, align 2, !dbg !690
  ret i16 %14, !dbg !690
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !691 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !694, metadata !DIExpression()), !dbg !695
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !696
  %cmp = icmp ne i64 %0, 0, !dbg !697
  %conv = zext i1 %cmp to i32, !dbg !697
  ret i32 %conv, !dbg !698
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !699 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !702, metadata !DIExpression()), !dbg !703
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !704, metadata !DIExpression()), !dbg !705
  %0 = load i64, i64* %left.addr, align 8, !dbg !706
  %1 = load i64, i64* %right.addr, align 8, !dbg !707
  %mul = mul nsw i64 %0, %1, !dbg !708
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !709
  %conv = zext i1 %cmp to i32, !dbg !709
  ret i32 %conv, !dbg !710
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !711 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !712, metadata !DIExpression()), !dbg !713
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !714, metadata !DIExpression()), !dbg !715
  %0 = load i64, i64* %left.addr, align 8, !dbg !716
  %1 = load i64, i64* %right.addr, align 8, !dbg !717
  %mul = mul nsw i64 %0, %1, !dbg !718
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !719
  %conv = zext i1 %cmp to i32, !dbg !719
  ret i32 %conv, !dbg !720
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !721 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !724, metadata !DIExpression()), !dbg !725
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !726, metadata !DIExpression()), !dbg !727
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !728, metadata !DIExpression()), !dbg !729
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !730, metadata !DIExpression()), !dbg !731
  store i32 0, i32* %s32Result, align 4, !dbg !731
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !732, metadata !DIExpression()), !dbg !733
  store i32 0, i32* %s32Temp1, align 4, !dbg !733
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !734
  %conv = zext i16 %0 to i32, !dbg !734
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !735
  %conv1 = sext i16 %1 to i32, !dbg !735
  %mul = mul nsw i32 %conv, %conv1, !dbg !736
  store i32 %mul, i32* %s32Result, align 4, !dbg !737
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !738
  %conv2 = zext i16 %2 to i32, !dbg !738
  %cmp = icmp eq i32 %conv2, 0, !dbg !740
  br i1 %cmp, label %if.then, label %if.else7, !dbg !741

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !742
  %cmp4 = icmp slt i32 %3, 0, !dbg !745
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !746

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !747
  br label %return, !dbg !747

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !749
  br label %return, !dbg !749

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !751
  %5 = load i32, i32* %s32Result, align 4, !dbg !753
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !754
  %conv8 = zext i16 %6 to i32, !dbg !754
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !755
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !755
  %div = sdiv i32 %5, %conv8, !dbg !755, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !756
  %conv9 = zext i16 %7 to i32, !dbg !756
  %mul10 = mul nsw i32 %div, %conv9, !dbg !757
  %sub = sub nsw i32 %4, %mul10, !dbg !758
  %shl = shl i32 %sub, 1, !dbg !759
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !760
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !761
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !762
  %conv11 = zext i16 %9 to i32, !dbg !762
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !763
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !763
  %div12 = sdiv i32 %8, %conv11, !dbg !763, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !764
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !765
  %conv13 = zext i16 %11 to i32, !dbg !765
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !766
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !766
  %div14 = sdiv i32 %10, %conv13, !dbg !766, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !767
  store i32 %add, i32* %s32Result, align 4, !dbg !768
  %12 = load i32, i32* %s32Result, align 4, !dbg !769
  %cmp15 = icmp slt i32 %12, 32767, !dbg !771
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !772

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !773
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !776
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !777

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !778
  %conv21 = trunc i32 %14 to i16, !dbg !780
  store i16 %conv21, i16* %retval, align 2, !dbg !781
  br label %return, !dbg !781

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !782
  br label %return, !dbg !782

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !784
  br label %return, !dbg !784

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !786
  ret i16 %15, !dbg !786
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !787 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !790, metadata !DIExpression()), !dbg !791
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !792, metadata !DIExpression()), !dbg !793
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !794, metadata !DIExpression()), !dbg !795
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !796, metadata !DIExpression()), !dbg !797
  store i32 0, i32* %u32Result, align 4, !dbg !797
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !798, metadata !DIExpression()), !dbg !799
  store i32 0, i32* %u32Temp1, align 4, !dbg !799
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !800, metadata !DIExpression()), !dbg !801
  store i32 0, i32* %s32Result, align 4, !dbg !801
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !802, metadata !DIExpression()), !dbg !803
  store i32 0, i32* %s32Temp1, align 4, !dbg !803
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !804
  %conv = sext i16 %0 to i32, !dbg !804
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !805
  %conv1 = zext i16 %1 to i32, !dbg !805
  %mul = mul nsw i32 %conv, %conv1, !dbg !806
  store i32 %mul, i32* %s32Result, align 4, !dbg !807
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !808
  %conv2 = sext i16 %2 to i32, !dbg !808
  %cmp = icmp eq i32 %conv2, 0, !dbg !810
  br i1 %cmp, label %if.then, label %if.else7, !dbg !811

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !812
  %cmp4 = icmp sge i32 %3, 0, !dbg !815
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !816

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !817
  br label %return, !dbg !817

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !819
  br label %return, !dbg !819

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !821
  %5 = load i32, i32* %s32Result, align 4, !dbg !823
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !824
  %conv8 = sext i16 %6 to i32, !dbg !824
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !825
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !825
  %div = sdiv i32 %5, %conv8, !dbg !825, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !826
  %conv9 = sext i16 %7 to i32, !dbg !826
  %mul10 = mul nsw i32 %div, %conv9, !dbg !827
  %sub = sub nsw i32 %4, %mul10, !dbg !828
  %shl = shl i32 %sub, 1, !dbg !829
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !830
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !831
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !832
  %conv11 = sext i16 %9 to i32, !dbg !832
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !833
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !833
  %div12 = sdiv i32 %8, %conv11, !dbg !833, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !834
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !835
  %conv13 = sext i16 %11 to i32, !dbg !835
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !836
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !836
  %div14 = sdiv i32 %10, %conv13, !dbg !836, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !837
  store i32 %add, i32* %s32Result, align 4, !dbg !838
  %12 = load i32, i32* %s32Result, align 4, !dbg !839
  %cmp15 = icmp slt i32 %12, 65535, !dbg !841
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !842

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !843
  %cmp18 = icmp sgt i32 %13, 0, !dbg !846
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !847

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !848
  %conv21 = trunc i32 %14 to i16, !dbg !850
  store i16 %conv21, i16* %retval, align 2, !dbg !851
  br label %return, !dbg !851

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !852
  br label %return, !dbg !852

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !854
  br label %return, !dbg !854

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !856
  ret i16 %15, !dbg !856
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !857 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !860, metadata !DIExpression()), !dbg !861
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !862, metadata !DIExpression()), !dbg !863
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !864, metadata !DIExpression()), !dbg !865
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !866, metadata !DIExpression()), !dbg !867
  store i32 0, i32* %s32Result, align 4, !dbg !867
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !868, metadata !DIExpression()), !dbg !869
  store i32 0, i32* %s32Temp1, align 4, !dbg !869
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !870
  %conv = sext i16 %0 to i32, !dbg !870
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !871
  %conv1 = zext i16 %1 to i32, !dbg !871
  %mul = mul nsw i32 %conv, %conv1, !dbg !872
  store i32 %mul, i32* %s32Result, align 4, !dbg !873
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !874
  %conv2 = zext i16 %2 to i32, !dbg !874
  %cmp = icmp eq i32 %conv2, 0, !dbg !876
  br i1 %cmp, label %if.then, label %if.else7, !dbg !877

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !878
  %cmp4 = icmp sge i32 %3, 0, !dbg !881
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !882

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !883
  br label %return, !dbg !883

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !885
  br label %return, !dbg !885

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !887
  %5 = load i32, i32* %s32Result, align 4, !dbg !889
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !890
  %conv8 = zext i16 %6 to i32, !dbg !890
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !891
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !891
  %div = sdiv i32 %5, %conv8, !dbg !891, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !892
  %conv9 = zext i16 %7 to i32, !dbg !892
  %mul10 = mul nsw i32 %div, %conv9, !dbg !893
  %sub = sub nsw i32 %4, %mul10, !dbg !894
  %shl = shl i32 %sub, 1, !dbg !895
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !896
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !897
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !898
  %conv11 = zext i16 %9 to i32, !dbg !898
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !899
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !899
  %div12 = sdiv i32 %8, %conv11, !dbg !899, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !900
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !901
  %conv13 = zext i16 %11 to i32, !dbg !901
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !902
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !902
  %div14 = sdiv i32 %10, %conv13, !dbg !902, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !903
  store i32 %add, i32* %s32Result, align 4, !dbg !904
  %12 = load i32, i32* %s32Result, align 4, !dbg !905
  %cmp15 = icmp slt i32 %12, 65535, !dbg !907
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !908

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !909
  %cmp18 = icmp sgt i32 %13, 0, !dbg !912
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !913

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !914
  %conv21 = trunc i32 %14 to i16, !dbg !916
  store i16 %conv21, i16* %retval, align 2, !dbg !917
  br label %return, !dbg !917

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !918
  br label %return, !dbg !918

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !920
  br label %return, !dbg !920

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !922
  ret i16 %15, !dbg !922
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !923 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !926, metadata !DIExpression()), !dbg !927
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !928, metadata !DIExpression()), !dbg !929
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !930, metadata !DIExpression()), !dbg !931
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !932, metadata !DIExpression()), !dbg !933
  store i32 0, i32* %u32Temp1, align 4, !dbg !933
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !934, metadata !DIExpression()), !dbg !935
  store i16 0, i16* %u16TempDenom, align 2, !dbg !935
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !936
  %conv = zext i16 %0 to i32, !dbg !936
  %cmp = icmp eq i32 %conv, 0, !dbg !938
  br i1 %cmp, label %if.then, label %if.else, !dbg !939

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !940
  br label %return, !dbg !940

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !942
  %conv2 = zext i16 %1 to i32, !dbg !942
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !944
  %conv3 = zext i16 %2 to i32, !dbg !944
  %mul = mul nsw i32 %conv2, %conv3, !dbg !945
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !946
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !947
  %conv4 = zext i16 %3 to i32, !dbg !947
  %shr = ashr i32 %conv4, 1, !dbg !948
  %conv5 = trunc i32 %shr to i16, !dbg !947
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !949
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !950
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !951
  %conv6 = zext i16 %5 to i32, !dbg !951
  %add = add i32 %4, %conv6, !dbg !952
  store i32 %add, i32* %u32Temp1, align 4, !dbg !953
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !954
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !955
  %conv7 = zext i16 %7 to i32, !dbg !955
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !956
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !956
  %div = udiv i32 %6, %conv7, !dbg !956, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !957
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !958
  %cmp8 = icmp ult i32 %8, 65535, !dbg !960
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !961

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !962
  %and = and i32 %9, 65535, !dbg !964
  %conv11 = trunc i32 %and to i16, !dbg !965
  store i16 %conv11, i16* %retval, align 2, !dbg !966
  br label %return, !dbg !966

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !967
  br label %return, !dbg !967

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !969
  ret i16 %10, !dbg !969
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !970 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !973, metadata !DIExpression()), !dbg !974
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !975, metadata !DIExpression()), !dbg !976
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !977, metadata !DIExpression()), !dbg !978
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !979, metadata !DIExpression()), !dbg !980
  store i32 0, i32* %u32Temp1, align 4, !dbg !980
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !981
  %cmp = icmp eq i32 %0, 0, !dbg !983
  br i1 %cmp, label %if.then, label %if.else, !dbg !984

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !985
  br label %return, !dbg !985

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !987
  %conv = zext i16 %1 to i32, !dbg !987
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !989
  %conv1 = zext i16 %2 to i32, !dbg !989
  %mul = mul nsw i32 %conv, %conv1, !dbg !990
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !991
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !992
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !992
  %div = udiv i32 %mul, %3, !dbg !992, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !993
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !994
  %conv2 = zext i16 %4 to i32, !dbg !994
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !996
  %conv3 = zext i16 %5 to i32, !dbg !996
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !997
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !998
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !999
  %mul5 = mul i32 %6, %7, !dbg !1000
  %sub = sub i32 %mul4, %mul5, !dbg !1001
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1002
  %div6 = udiv i32 %8, 2, !dbg !1003
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1004
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1005

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1006
  %inc = add i32 %9, 1, !dbg !1006
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1006
  br label %if.end, !dbg !1008

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1009
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1011
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1012

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1013
  %and = and i32 %11, 65535, !dbg !1015
  %conv13 = trunc i32 %and to i16, !dbg !1016
  store i16 %conv13, i16* %retval, align 2, !dbg !1017
  br label %return, !dbg !1017

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1018
  br label %return, !dbg !1018

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1020
  ret i16 %12, !dbg !1020
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1021 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1024, metadata !DIExpression()), !dbg !1025
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1026, metadata !DIExpression()), !dbg !1027
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1028, metadata !DIExpression()), !dbg !1029
  store i32 0, i32* %u32Temp1, align 4, !dbg !1029
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1030
  %conv = zext i16 %0 to i32, !dbg !1030
  %cmp = icmp eq i32 %conv, 0, !dbg !1032
  br i1 %cmp, label %if.then, label %if.else, !dbg !1033

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1034
  br label %return, !dbg !1034

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1036
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1038
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1039
  %conv2 = zext i16 %3 to i32, !dbg !1039
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1040
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1040
  %div = udiv i32 %2, %conv2, !dbg !1040, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1041
  %conv3 = zext i16 %4 to i32, !dbg !1041
  %mul = mul i32 %div, %conv3, !dbg !1042
  %sub = sub i32 %1, %mul, !dbg !1043
  %shl = shl i32 %sub, 1, !dbg !1044
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1045
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1046
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1047
  %conv4 = zext i16 %6 to i32, !dbg !1047
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1048
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1048
  %div5 = udiv i32 %5, %conv4, !dbg !1048, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1049
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1050
  %conv6 = zext i16 %8 to i32, !dbg !1050
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1051
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1051
  %div7 = udiv i32 %7, %conv6, !dbg !1051, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1052
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1053
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1054
  store i32 %9, i32* %retval, align 4, !dbg !1055
  br label %return, !dbg !1055

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1056
  ret i32 %10, !dbg !1056
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1057 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1060, metadata !DIExpression()), !dbg !1061
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1062, metadata !DIExpression()), !dbg !1063
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1064, metadata !DIExpression()), !dbg !1065
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1066, metadata !DIExpression()), !dbg !1067
  store i32 0, i32* %s32Temp1, align 4, !dbg !1067
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1068, metadata !DIExpression()), !dbg !1069
  store i32 0, i32* %s32Temp2, align 4, !dbg !1069
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1070, metadata !DIExpression()), !dbg !1071
  store i32 0, i32* %s32Temp3, align 4, !dbg !1071
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1072
  %conv = sext i16 %0 to i32, !dbg !1072
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1073
  %conv1 = sext i16 %1 to i32, !dbg !1073
  %mul = mul nsw i32 %conv, %conv1, !dbg !1074
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1075
  %2 = load i16, i16* %div.addr, align 2, !dbg !1076
  %conv2 = sext i16 %2 to i32, !dbg !1076
  %cmp = icmp eq i32 %conv2, 0, !dbg !1078
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1079

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1080
  %cmp4 = icmp slt i32 %3, 0, !dbg !1083
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1084

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1085
  br label %return, !dbg !1085

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1087
  br label %return, !dbg !1087

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1089
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1091
  %6 = load i16, i16* %div.addr, align 2, !dbg !1092
  %conv8 = sext i16 %6 to i32, !dbg !1092
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1093
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1093
  %div9 = sdiv i32 %5, %conv8, !dbg !1093, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1094
  %conv10 = sext i16 %7 to i32, !dbg !1094
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1095
  %sub = sub nsw i32 %4, %mul11, !dbg !1096
  %shl = shl i32 %sub, 1, !dbg !1097
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1098
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1099
  %9 = load i16, i16* %div.addr, align 2, !dbg !1100
  %conv12 = sext i16 %9 to i32, !dbg !1100
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1101
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1101
  %div13 = sdiv i32 %8, %conv12, !dbg !1101, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1102
  %11 = load i16, i16* %div.addr, align 2, !dbg !1103
  %conv14 = sext i16 %11 to i32, !dbg !1103
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1104
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1104
  %div15 = sdiv i32 %10, %conv14, !dbg !1104, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1105
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1106
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1107
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1109
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1110

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1111
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1114
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1115

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1116
  %conv22 = trunc i32 %14 to i16, !dbg !1118
  store i16 %conv22, i16* %retval, align 2, !dbg !1119
  br label %return, !dbg !1119

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1120
  br label %return, !dbg !1120

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1122
  br label %return, !dbg !1122

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1124
  ret i16 %15, !dbg !1124
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1125 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1128, metadata !DIExpression()), !dbg !1129
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1130, metadata !DIExpression()), !dbg !1131
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1132, metadata !DIExpression()), !dbg !1133
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1134, metadata !DIExpression()), !dbg !1135
  store i32 0, i32* %s32Result, align 4, !dbg !1135
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1136, metadata !DIExpression()), !dbg !1137
  store i32 0, i32* %s32Temp1, align 4, !dbg !1137
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1138
  %conv = sext i16 %0 to i32, !dbg !1138
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1139
  %conv1 = sext i16 %1 to i32, !dbg !1139
  %mul = mul nsw i32 %conv, %conv1, !dbg !1140
  store i32 %mul, i32* %s32Result, align 4, !dbg !1141
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1142
  %conv2 = zext i16 %2 to i32, !dbg !1142
  %cmp = icmp eq i32 %conv2, 0, !dbg !1144
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1145

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1146
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1149
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1150

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1151
  br label %return, !dbg !1151

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1153
  %cmp7 = icmp eq i32 %4, 0, !dbg !1155
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1156

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1157
  br label %return, !dbg !1157

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1159
  br label %return, !dbg !1159

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1161
  %6 = load i32, i32* %s32Result, align 4, !dbg !1163
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1164
  %conv12 = zext i16 %7 to i32, !dbg !1164
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1165
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1165
  %div = sdiv i32 %6, %conv12, !dbg !1165, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1166
  %conv13 = zext i16 %8 to i32, !dbg !1166
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1167
  %sub = sub nsw i32 %5, %mul14, !dbg !1168
  %shl = shl i32 %sub, 1, !dbg !1169
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1170
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1171
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1172
  %conv15 = zext i16 %10 to i32, !dbg !1172
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1173
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1173
  %div16 = sdiv i32 %9, %conv15, !dbg !1173, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1174
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1175
  %conv17 = zext i16 %12 to i32, !dbg !1175
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1176
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1176
  %div18 = sdiv i32 %11, %conv17, !dbg !1176, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1177
  store i32 %add, i32* %s32Result, align 4, !dbg !1178
  %13 = load i32, i32* %s32Result, align 4, !dbg !1179
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1181
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1182

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1183
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1186
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1187

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1188
  %conv25 = trunc i32 %15 to i16, !dbg !1190
  store i16 %conv25, i16* %retval, align 2, !dbg !1191
  br label %return, !dbg !1191

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1192
  br label %return, !dbg !1192

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1194
  br label %return, !dbg !1194

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1196
  ret i16 %16, !dbg !1196
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1197 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1200, metadata !DIExpression()), !dbg !1201
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1202, metadata !DIExpression()), !dbg !1203
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1204, metadata !DIExpression()), !dbg !1205
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1206
  %cmp = icmp eq i32 %0, 0, !dbg !1208
  br i1 %cmp, label %if.then, label %if.else, !dbg !1209

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1210
  br label %return, !dbg !1210

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1212
  %cmp1 = icmp sle i32 %1, 0, !dbg !1215
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1216

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1217
  br label %return, !dbg !1217

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1219
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1221
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1222
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1223
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1223
  %div = udiv i32 %3, %4, !dbg !1223, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1224
  %mul = mul i32 %div, %5, !dbg !1225
  %sub = sub i32 %2, %mul, !dbg !1226
  %shl = shl i32 %sub, 1, !dbg !1227
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1228
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1229
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1230
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1231
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1231
  %div4 = udiv i32 %6, %7, !dbg !1231, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1232
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1233
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1234
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1234
  %div5 = udiv i32 %8, %9, !dbg !1234, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1235
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1236
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1237
  store i32 %10, i32* %retval, align 4, !dbg !1238
  br label %return, !dbg !1238

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1239
  ret i32 %11, !dbg !1239
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1240 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1243, metadata !DIExpression()), !dbg !1244
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1245, metadata !DIExpression()), !dbg !1246
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1247, metadata !DIExpression()), !dbg !1248
  store i32 0, i32* %s32Temp1, align 4, !dbg !1248
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1249
  %cmp = icmp eq i32 %0, 0, !dbg !1251
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1252

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1253
  %cmp1 = icmp sge i32 %1, 0, !dbg !1256
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1257

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1258
  br label %return, !dbg !1258

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1260
  br label %return, !dbg !1260

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1262
  %cmp4 = icmp sge i32 %2, 0, !dbg !1265
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1266

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1267
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1269
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1270
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1271
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1271
  %div = udiv i32 %4, %5, !dbg !1271, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1272
  %mul = mul i32 %div, %6, !dbg !1273
  %sub = sub i32 %3, %mul, !dbg !1274
  %shl = shl i32 %sub, 1, !dbg !1275
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1276
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1277
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1278
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1279
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1279
  %div6 = udiv i32 %7, %8, !dbg !1279, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1280
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1281
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1282
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1282
  %div7 = udiv i32 %9, %10, !dbg !1282, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1283
  store i32 %add, i32* %retval, align 4, !dbg !1284
  br label %return, !dbg !1284

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1285
  br label %return, !dbg !1285

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1287
  ret i32 %11, !dbg !1287
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1288 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1291, metadata !DIExpression()), !dbg !1292
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1293, metadata !DIExpression()), !dbg !1294
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1295, metadata !DIExpression()), !dbg !1296
  store i32 0, i32* %u32Temp1, align 4, !dbg !1296
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1297, metadata !DIExpression()), !dbg !1298
  store i32 0, i32* %u32Temp2, align 4, !dbg !1298
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1299
  %cmp = icmp eq i32 %0, 0, !dbg !1301
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1302

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1303
  %cmp1 = icmp slt i32 %1, 0, !dbg !1306
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1307

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1308
  br label %return, !dbg !1308

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1310
  br label %return, !dbg !1310

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1312
  %cmp4 = icmp sge i32 %2, 0, !dbg !1315
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1316

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1317
  %cmp6 = icmp eq i32 %3, 0, !dbg !1320
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1321

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1322
  br label %return, !dbg !1322

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1324
  %cmp9 = icmp sle i32 %4, 0, !dbg !1327
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1328

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1329
  br label %return, !dbg !1329

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1331
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1333
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1334
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1335
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1335
  %div = sdiv i32 %6, %7, !dbg !1335, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1336
  %mul = mul nsw i32 %div, %8, !dbg !1337
  %sub = sub nsw i32 %5, %mul, !dbg !1338
  %shl = shl i32 %sub, 1, !dbg !1339
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1340
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1341
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1342
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1343
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1343
  %div12 = udiv i32 %9, %10, !dbg !1343, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1344
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1345
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1346
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1346
  %div13 = sdiv i32 %11, %12, !dbg !1346, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1347
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1348
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1349
  store i32 %13, i32* %retval, align 4, !dbg !1350
  br label %return, !dbg !1350

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1351
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1354
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1355

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1356
  br label %return, !dbg !1356

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1358
  %sub18 = sub nsw i32 0, %15, !dbg !1360
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1361
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1362
  %sub19 = sub nsw i32 0, %16, !dbg !1363
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1364
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1365
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1366
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1367
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1368
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1368
  %div20 = sdiv i32 %18, %19, !dbg !1368, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1369
  %mul21 = mul nsw i32 %div20, %20, !dbg !1370
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1371
  %shl23 = shl i32 %sub22, 1, !dbg !1372
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1373
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1374
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1375
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1376
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1376
  %div24 = udiv i32 %21, %22, !dbg !1376, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1377
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1378
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1379
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1379
  %div25 = sdiv i32 %23, %24, !dbg !1379, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1380
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1381
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1382
  store i32 %25, i32* %retval, align 4, !dbg !1383
  br label %return, !dbg !1383

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1384
  ret i32 %26, !dbg !1384
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1385 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1388, metadata !DIExpression()), !dbg !1389
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1390, metadata !DIExpression()), !dbg !1391
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1392, metadata !DIExpression()), !dbg !1393
  store i32 0, i32* %u32Temp1, align 4, !dbg !1393
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1394, metadata !DIExpression()), !dbg !1395
  store i32 0, i32* %u32Temp2, align 4, !dbg !1395
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1396, metadata !DIExpression()), !dbg !1397
  store i32 0, i32* %u32Temp3, align 4, !dbg !1397
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1398, metadata !DIExpression()), !dbg !1399
  store i32 0, i32* %numerator_old, align 4, !dbg !1399
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1400
  %cmp = icmp eq i32 %0, 0, !dbg !1402
  br i1 %cmp, label %if.then, label %if.else, !dbg !1403

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1404
  br label %return, !dbg !1404

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1406
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1408
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1409
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1410
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1411
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1411
  %div = udiv i32 %3, %4, !dbg !1411, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1412
  %sub = sub i32 %1, %mul, !dbg !1413
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1414
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1415
  %and = and i32 %5, 1, !dbg !1417
  %cmp1 = icmp eq i32 %and, 0, !dbg !1418
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1419

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1420
  %shr = lshr i32 %6, 1, !dbg !1422
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1423
  br label %if.end, !dbg !1424

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1425
  %shr4 = lshr i32 %7, 1, !dbg !1427
  %add = add i32 %shr4, 1, !dbg !1428
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1429
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1430
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1432
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1433
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1434

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1435
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1437
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1438
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1438
  %div7 = udiv i32 %10, %11, !dbg !1438, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1439
  br label %return, !dbg !1439

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1440
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1442
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1443
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1443
  %div9 = udiv i32 %12, %13, !dbg !1443, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1444
  store i32 %add10, i32* %retval, align 4, !dbg !1445
  br label %return, !dbg !1445

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1446
  ret i32 %14, !dbg !1446
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1447 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1450, metadata !DIExpression()), !dbg !1451
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1452, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1454, metadata !DIExpression()), !dbg !1455
  store i32 0, i32* %u32Temp1, align 4, !dbg !1455
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1456, metadata !DIExpression()), !dbg !1457
  store i32 0, i32* %u32Temp2, align 4, !dbg !1457
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1458
  %cmp = icmp sle i32 %0, 0, !dbg !1460
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1461

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1462
  %cmp1 = icmp sge i32 %1, 0, !dbg !1465
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1466

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1467
  br label %return, !dbg !1467

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1469
  %sub = sub nsw i32 0, %2, !dbg !1471
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1472
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1473
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1474
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1475
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1476
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1476
  %div = udiv i32 %4, %5, !dbg !1476, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1477
  %mul = mul i32 %div, %6, !dbg !1478
  %sub3 = sub i32 %3, %mul, !dbg !1479
  %shl = shl i32 %sub3, 1, !dbg !1480
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1481
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1482
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1483
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1484
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1484
  %div4 = udiv i32 %7, %8, !dbg !1484, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1485
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1486
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1487
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1487
  %div5 = udiv i32 %9, %10, !dbg !1487, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1488
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1489
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1490
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1492
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1493

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1494
  %sub8 = sub i32 0, %12, !dbg !1496
  store i32 %sub8, i32* %retval, align 4, !dbg !1497
  br label %return, !dbg !1497

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1498
  br label %return, !dbg !1498

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1500
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1502
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1503
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1504
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1504
  %div11 = udiv i32 %14, %15, !dbg !1504, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1505
  %mul12 = mul i32 %div11, %16, !dbg !1506
  %sub13 = sub i32 %13, %mul12, !dbg !1507
  %shl14 = shl i32 %sub13, 1, !dbg !1508
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1509
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1510
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1511
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1512
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1512
  %div15 = udiv i32 %17, %18, !dbg !1512, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1513
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1514
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1515
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1515
  %div16 = udiv i32 %19, %20, !dbg !1515, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1516
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1517
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1518
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1520
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1521

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1522
  store i32 %22, i32* %retval, align 4, !dbg !1524
  br label %return, !dbg !1524

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1525
  br label %return, !dbg !1525

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1527
  ret i32 %23, !dbg !1527
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1528 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1531, metadata !DIExpression()), !dbg !1532
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1533, metadata !DIExpression()), !dbg !1534
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1535, metadata !DIExpression()), !dbg !1536
  store i32 0, i32* %s32Temp1, align 4, !dbg !1536
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1537, metadata !DIExpression()), !dbg !1538
  store i32 0, i32* %s32Temp2, align 4, !dbg !1538
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1539, metadata !DIExpression()), !dbg !1540
  store i32 0, i32* %u32Temp0, align 4, !dbg !1540
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1541, metadata !DIExpression()), !dbg !1542
  store i32 0, i32* %u32Temp1, align 4, !dbg !1542
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1543, metadata !DIExpression()), !dbg !1544
  store i32 0, i32* %u32Temp2, align 4, !dbg !1544
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1545
  %cmp = icmp eq i32 %0, 0, !dbg !1547
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1548

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1549
  %cmp1 = icmp slt i32 %1, 0, !dbg !1552
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1553

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1554
  br label %return, !dbg !1554

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1556
  br label %return, !dbg !1556

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1558
  %cmp4 = icmp sle i32 %2, 0, !dbg !1561
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1562

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1563
  %sub = sub nsw i32 0, %3, !dbg !1565
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1566
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1567
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1568
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1569
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1569
  %div = udiv i32 %4, %5, !dbg !1569, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1570
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1571
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1572
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1573
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1574
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1574
  %div6 = udiv i32 %7, %8, !dbg !1574, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1575
  %mul = mul i32 %div6, %9, !dbg !1576
  %sub7 = sub i32 %6, %mul, !dbg !1577
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1578
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1579
  %and = and i32 %10, 1, !dbg !1581
  %cmp8 = icmp eq i32 %and, 0, !dbg !1582
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1583

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1584
  %shr = lshr i32 %11, 1, !dbg !1586
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1587
  br label %if.end, !dbg !1588

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1589
  %shr11 = lshr i32 %12, 1, !dbg !1591
  %add = add i32 %shr11, 1, !dbg !1592
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1593
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1594
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1596
  %cmp12 = icmp ult i32 %13, %14, !dbg !1597
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1598

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1599
  %neg = xor i32 %15, -1, !dbg !1601
  %add14 = add i32 %neg, 1, !dbg !1602
  store i32 %add14, i32* %retval, align 4, !dbg !1603
  br label %return, !dbg !1603

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1604
  %add16 = add i32 %16, 1, !dbg !1606
  %neg17 = xor i32 %add16, -1, !dbg !1607
  %add18 = add i32 %neg17, 1, !dbg !1608
  store i32 %add18, i32* %retval, align 4, !dbg !1609
  br label %return, !dbg !1609

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1610
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1612
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1613
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1614
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1614
  %div20 = udiv i32 %18, %19, !dbg !1614, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1615
  %mul21 = mul i32 %div20, %20, !dbg !1616
  %sub22 = sub i32 %17, %mul21, !dbg !1617
  %shl = shl i32 %sub22, 1, !dbg !1618
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1619
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1620
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1621
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1622
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1622
  %div23 = udiv i32 %21, %22, !dbg !1622, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1623
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1624
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1625
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1625
  %div24 = udiv i32 %23, %24, !dbg !1625, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1626
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1627
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1628
  store i32 %25, i32* %retval, align 4, !dbg !1629
  br label %return, !dbg !1629

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1630
  ret i32 %26, !dbg !1630
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1631 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1634, metadata !DIExpression()), !dbg !1635
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1636, metadata !DIExpression()), !dbg !1637
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1638, metadata !DIExpression()), !dbg !1639
  store i32 0, i32* %s32Temp1, align 4, !dbg !1639
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1640, metadata !DIExpression()), !dbg !1641
  store i32 0, i32* %s32Temp2, align 4, !dbg !1641
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1642, metadata !DIExpression()), !dbg !1643
  store i32 0, i32* %denominator_prime, align 4, !dbg !1643
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1644, metadata !DIExpression()), !dbg !1645
  store i32 0, i32* %u32Temp1, align 4, !dbg !1645
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1646, metadata !DIExpression()), !dbg !1647
  store i32 0, i32* %u32Temp2, align 4, !dbg !1647
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1648, metadata !DIExpression()), !dbg !1649
  store i32 0, i32* %u32numerator, align 4, !dbg !1649
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1650, metadata !DIExpression()), !dbg !1651
  store i32 0, i32* %u32denominator, align 4, !dbg !1651
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1652
  %cmp = icmp slt i32 %0, 0, !dbg !1654
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1655

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1656
  %cmp1 = icmp sle i32 %1, 0, !dbg !1659
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1660

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1661
  %cmp3 = icmp sge i32 %2, 0, !dbg !1664
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1665

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1666
  br label %return, !dbg !1666

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1668
  %sub = sub nsw i32 0, %3, !dbg !1670
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1671
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1672
  %sub5 = sub nsw i32 0, %4, !dbg !1673
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1674
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1675
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1676
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1677
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1678
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1678
  %div = udiv i32 %6, %7, !dbg !1678, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1679
  %mul = mul i32 %div, %8, !dbg !1680
  %sub6 = sub i32 %5, %mul, !dbg !1681
  %shl = shl i32 %sub6, 1, !dbg !1682
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1683
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1684
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1685
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1686
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1686
  %div7 = udiv i32 %9, %10, !dbg !1686, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1687
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1688
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1689
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1689
  %div8 = udiv i32 %11, %12, !dbg !1689, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1690
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1691
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1692
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1694
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1695

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1696
  store i32 %14, i32* %retval, align 4, !dbg !1698
  br label %return, !dbg !1698

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1699
  br label %return, !dbg !1699

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1701
  %neg = xor i32 %15, -1, !dbg !1703
  %add13 = add nsw i32 %neg, 1, !dbg !1704
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1705
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1706
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1707
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1708
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1709
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1709
  %div14 = udiv i32 %17, %18, !dbg !1709, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1710
  %mul15 = mul i32 %div14, %19, !dbg !1711
  %sub16 = sub i32 %16, %mul15, !dbg !1712
  %shl17 = shl i32 %sub16, 1, !dbg !1713
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1714
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1715
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1716
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1717
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1717
  %div18 = udiv i32 %20, %21, !dbg !1717, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1718
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1719
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1720
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1720
  %div19 = sdiv i32 %22, %23, !dbg !1720, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1721
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1722
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1723
  %neg21 = xor i32 %24, -1, !dbg !1724
  %add22 = add nsw i32 %neg21, 1, !dbg !1725
  store i32 %add22, i32* %retval, align 4, !dbg !1726
  br label %return, !dbg !1726

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1727
  %cmp24 = icmp sle i32 %25, 0, !dbg !1730
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1731

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1732
  %cmp26 = icmp sge i32 %26, 0, !dbg !1735
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1736

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1737
  br label %return, !dbg !1737

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1739
  %neg29 = xor i32 %27, -1, !dbg !1741
  %add30 = add nsw i32 %neg29, 1, !dbg !1742
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1743
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1744
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1745
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1746
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1747
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1747
  %div31 = udiv i32 %29, %30, !dbg !1747, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1748
  %mul32 = mul i32 %div31, %31, !dbg !1749
  %sub33 = sub i32 %28, %mul32, !dbg !1750
  %shl34 = shl i32 %sub33, 1, !dbg !1751
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1752
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1753
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1754
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1755
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1755
  %div35 = udiv i32 %32, %33, !dbg !1755, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1756
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1757
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1758
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1758
  %div36 = udiv i32 %34, %35, !dbg !1758, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1759
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1760
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1761
  %neg38 = xor i32 %36, -1, !dbg !1762
  %add39 = add nsw i32 %neg38, 1, !dbg !1763
  store i32 %add39, i32* %retval, align 4, !dbg !1764
  br label %return, !dbg !1764

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1765
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1767
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1768
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1769
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1769
  %div41 = sdiv i32 %38, %39, !dbg !1769, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1770
  %mul42 = mul nsw i32 %div41, %40, !dbg !1771
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1772
  %shl44 = shl i32 %sub43, 1, !dbg !1773
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1774
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1775
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1776
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1777
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1777
  %div45 = sdiv i32 %41, %42, !dbg !1777, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1778
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1779
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1780
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1780
  %div46 = udiv i32 %43, %44, !dbg !1780, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1781
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1782
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1783
  store i32 %45, i32* %retval, align 4, !dbg !1784
  br label %return, !dbg !1784

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1785
  ret i32 %46, !dbg !1785
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1786 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1789, metadata !DIExpression()), !dbg !1790
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1791, metadata !DIExpression()), !dbg !1792
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1793, metadata !DIExpression()), !dbg !1794
  store i32 0, i32* %numerator_prime, align 4, !dbg !1794
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1795, metadata !DIExpression()), !dbg !1796
  store i32 0, i32* %u32Temp1, align 4, !dbg !1796
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1797, metadata !DIExpression()), !dbg !1798
  store i32 0, i32* %u32Temp2, align 4, !dbg !1798
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1799, metadata !DIExpression()), !dbg !1800
  store i32 0, i32* %u32Temp3, align 4, !dbg !1800
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1801, metadata !DIExpression()), !dbg !1802
  store i32 0, i32* %s32Temp1, align 4, !dbg !1802
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1803, metadata !DIExpression()), !dbg !1804
  store i32 0, i32* %s32Temp2, align 4, !dbg !1804
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1805, metadata !DIExpression()), !dbg !1806
  store i32 0, i32* %s32Temp3, align 4, !dbg !1806
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1807
  %cmp = icmp eq i32 %0, 0, !dbg !1809
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1810

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1811
  %cmp1 = icmp slt i32 %1, 0, !dbg !1814
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1815

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1816
  br label %return, !dbg !1816

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1818
  br label %return, !dbg !1818

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1820
  %cmp4 = icmp slt i32 %2, 0, !dbg !1823
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1824

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1825
  %sub = sub nsw i32 0, %3, !dbg !1827
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1828
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1829
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1830
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1831
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1831
  %div = udiv i32 %4, %5, !dbg !1831, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1832
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1833
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1834
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1835
  %mul = mul i32 %7, %8, !dbg !1836
  %sub6 = sub i32 %6, %mul, !dbg !1837
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1838
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1839
  %and = and i32 %9, 1, !dbg !1841
  %cmp7 = icmp eq i32 %and, 0, !dbg !1842
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1843

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1844
  %shr = lshr i32 %10, 1, !dbg !1846
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1847
  br label %if.end, !dbg !1848

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1849
  %shr10 = lshr i32 %11, 1, !dbg !1851
  %add = add i32 %shr10, 1, !dbg !1852
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1853
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1854
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1856
  %cmp11 = icmp ult i32 %12, %13, !dbg !1857
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1858

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1859
  %neg = xor i32 %14, -1, !dbg !1861
  %add13 = add i32 %neg, 1, !dbg !1862
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1863
  br label %if.end18, !dbg !1864

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1865
  %add15 = add i32 %15, 1, !dbg !1867
  %neg16 = xor i32 %add15, -1, !dbg !1868
  %add17 = add i32 %neg16, 1, !dbg !1869
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1870
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1871
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1873
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1874

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1875
  %conv = trunc i32 %17 to i16, !dbg !1877
  store i16 %conv, i16* %retval, align 2, !dbg !1878
  br label %return, !dbg !1878

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1879
  br label %return, !dbg !1879

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1881
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1883
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1884
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1884
  %div23 = udiv i32 %18, %19, !dbg !1884, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1885
  %mul24 = mul i32 %div23, %20, !dbg !1886
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1887
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1888
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1889
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1890
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1891
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1891
  %div25 = udiv i32 %22, %23, !dbg !1891, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1892
  %mul26 = mul i32 %div25, %24, !dbg !1893
  %sub27 = sub i32 %21, %mul26, !dbg !1894
  %shl = shl i32 %sub27, 1, !dbg !1895
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1896
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1897
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1898
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1899
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1899
  %div28 = udiv i32 %25, %26, !dbg !1899, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1900
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1901
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1902
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1902
  %div29 = udiv i32 %27, %28, !dbg !1902, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !1903
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1904
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1905
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1907
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1908

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1909
  %conv34 = trunc i32 %30 to i16, !dbg !1911
  store i16 %conv34, i16* %retval, align 2, !dbg !1912
  br label %return, !dbg !1912

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1913
  br label %return, !dbg !1913

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1915
  ret i16 %31, !dbg !1915
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1916 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1922, metadata !DIExpression()), !dbg !1923
  %2 = icmp eq i64 %0, 0, !dbg !1924
  br i1 %2, label %3, label %4, !dbg !1926

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1927
  unreachable, !dbg !1927

4:                                                ; preds = %1
  ret void, !dbg !1928
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0082/div_Ccode_alarm_0082.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0082")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0082")
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
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0082")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0082/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0082")
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
!44 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0082")
!45 = !DISubroutineType(types: !46)
!46 = !{!28}
!47 = !DILocalVariable(name: "factor1", scope: !43, file: !44, line: 9, type: !8)
!48 = !DILocation(line: 9, column: 13, scope: !43)
!49 = !DILocalVariable(name: "factor2", scope: !43, file: !44, line: 10, type: !19)
!50 = !DILocation(line: 10, column: 14, scope: !43)
!51 = !DILocalVariable(name: "denominator", scope: !43, file: !44, line: 11, type: !8)
!52 = !DILocation(line: 11, column: 13, scope: !43)
!53 = !DILocalVariable(name: "result", scope: !43, file: !44, line: 12, type: !8)
!54 = !DILocation(line: 12, column: 13, scope: !43)
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_mul_s16_u16_div_s16/alarm_0082")
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
!646 = !DILocation(line: 629, column: 46, scope: !647)
!647 = distinct !DILexicalBlock(scope: !648, file: !69, line: 629, column: 7)
!648 = distinct !DILexicalBlock(scope: !634, file: !69, line: 627, column: 2)
!649 = !DILocation(line: 629, column: 36, scope: !647)
!650 = !DILocation(line: 629, column: 9, scope: !647)
!651 = !DILocation(line: 629, column: 7, scope: !648)
!652 = !DILocation(line: 630, column: 7, scope: !653)
!653 = distinct !DILexicalBlock(scope: !647, file: !69, line: 629, column: 62)
!654 = !DILocation(line: 633, column: 50, scope: !655)
!655 = distinct !DILexicalBlock(scope: !648, file: !69, line: 633, column: 7)
!656 = !DILocation(line: 633, column: 67, scope: !655)
!657 = !DILocation(line: 633, column: 62, scope: !655)
!658 = !DILocation(line: 633, column: 60, scope: !655)
!659 = !DILocation(line: 633, column: 34, scope: !655)
!660 = !DILocation(line: 633, column: 97, scope: !655)
!661 = !DILocation(line: 633, column: 92, scope: !655)
!662 = !DILocation(line: 633, column: 82, scope: !655)
!663 = !DILocation(line: 633, column: 9, scope: !655)
!664 = !DILocation(line: 633, column: 7, scope: !648)
!665 = !DILocation(line: 634, column: 7, scope: !666)
!666 = distinct !DILexicalBlock(scope: !655, file: !69, line: 633, column: 113)
!667 = !DILocation(line: 637, column: 50, scope: !668)
!668 = distinct !DILexicalBlock(scope: !648, file: !69, line: 637, column: 7)
!669 = !DILocation(line: 637, column: 67, scope: !668)
!670 = !DILocation(line: 637, column: 62, scope: !668)
!671 = !DILocation(line: 637, column: 60, scope: !668)
!672 = !DILocation(line: 637, column: 34, scope: !668)
!673 = !DILocation(line: 637, column: 97, scope: !668)
!674 = !DILocation(line: 637, column: 92, scope: !668)
!675 = !DILocation(line: 637, column: 82, scope: !668)
!676 = !DILocation(line: 637, column: 9, scope: !668)
!677 = !DILocation(line: 637, column: 7, scope: !648)
!678 = !DILocation(line: 638, column: 7, scope: !679)
!679 = distinct !DILexicalBlock(scope: !668, file: !69, line: 637, column: 113)
!680 = !DILocation(line: 645, column: 41, scope: !648)
!681 = !DILocation(line: 645, column: 58, scope: !648)
!682 = !DILocation(line: 645, column: 53, scope: !648)
!683 = !DILocation(line: 645, column: 51, scope: !648)
!684 = !DILocation(line: 645, column: 78, scope: !648)
!685 = !DILocation(line: 645, column: 73, scope: !648)
!686 = !DILocation(line: 645, column: 71, scope: !648)
!687 = !DILocation(line: 645, column: 25, scope: !648)
!688 = !DILocation(line: 645, column: 23, scope: !648)
!689 = !DILocation(line: 646, column: 3, scope: !648)
!690 = !DILocation(line: 667, column: 1, scope: !616)
!691 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !30, file: !30, line: 24, type: !692, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!692 = !DISubroutineType(types: !693)
!693 = !{!28, !22}
!694 = !DILocalVariable(name: "denominator", arg: 1, scope: !691, file: !30, line: 24, type: !22)
!695 = !DILocation(line: 24, column: 40, scope: !691)
!696 = !DILocation(line: 26, column: 12, scope: !691)
!697 = !DILocation(line: 26, column: 24, scope: !691)
!698 = !DILocation(line: 26, column: 5, scope: !691)
!699 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !30, file: !30, line: 72, type: !700, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!700 = !DISubroutineType(types: !701)
!701 = !{!28, !22, !22}
!702 = !DILocalVariable(name: "left", arg: 1, scope: !699, file: !30, line: 72, type: !22)
!703 = !DILocation(line: 72, column: 38, scope: !699)
!704 = !DILocalVariable(name: "right", arg: 2, scope: !699, file: !30, line: 72, type: !22)
!705 = !DILocation(line: 72, column: 52, scope: !699)
!706 = !DILocation(line: 74, column: 12, scope: !699)
!707 = !DILocation(line: 74, column: 19, scope: !699)
!708 = !DILocation(line: 74, column: 17, scope: !699)
!709 = !DILocation(line: 74, column: 25, scope: !699)
!710 = !DILocation(line: 74, column: 5, scope: !699)
!711 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !30, file: !30, line: 78, type: !700, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!712 = !DILocalVariable(name: "left", arg: 1, scope: !711, file: !30, line: 78, type: !22)
!713 = !DILocation(line: 78, column: 38, scope: !711)
!714 = !DILocalVariable(name: "right", arg: 2, scope: !711, file: !30, line: 78, type: !22)
!715 = !DILocation(line: 78, column: 52, scope: !711)
!716 = !DILocation(line: 80, column: 12, scope: !711)
!717 = !DILocation(line: 80, column: 19, scope: !711)
!718 = !DILocation(line: 80, column: 17, scope: !711)
!719 = !DILocation(line: 80, column: 25, scope: !711)
!720 = !DILocation(line: 80, column: 5, scope: !711)
!721 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 685, type: !722, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!722 = !DISubroutineType(types: !723)
!723 = !{!6, !18, !6, !18}
!724 = !DILocalVariable(name: "factor1", arg: 1, scope: !721, file: !69, line: 685, type: !18)
!725 = !DILocation(line: 685, column: 33, scope: !721)
!726 = !DILocalVariable(name: "factor2", arg: 2, scope: !721, file: !69, line: 685, type: !6)
!727 = !DILocation(line: 685, column: 46, scope: !721)
!728 = !DILocalVariable(name: "denominator", arg: 3, scope: !721, file: !69, line: 685, type: !18)
!729 = !DILocation(line: 685, column: 59, scope: !721)
!730 = !DILocalVariable(name: "s32Result", scope: !721, file: !69, line: 687, type: !25)
!731 = !DILocation(line: 687, column: 6, scope: !721)
!732 = !DILocalVariable(name: "s32Temp1", scope: !721, file: !69, line: 687, type: !25)
!733 = !DILocation(line: 687, column: 21, scope: !721)
!734 = !DILocation(line: 688, column: 14, scope: !721)
!735 = !DILocation(line: 688, column: 24, scope: !721)
!736 = !DILocation(line: 688, column: 22, scope: !721)
!737 = !DILocation(line: 688, column: 12, scope: !721)
!738 = !DILocation(line: 689, column: 5, scope: !739)
!739 = distinct !DILexicalBlock(scope: !721, file: !69, line: 689, column: 5)
!740 = !DILocation(line: 689, column: 16, scope: !739)
!741 = !DILocation(line: 689, column: 5, scope: !721)
!742 = !DILocation(line: 691, column: 6, scope: !743)
!743 = distinct !DILexicalBlock(scope: !744, file: !69, line: 691, column: 6)
!744 = distinct !DILexicalBlock(scope: !739, file: !69, line: 690, column: 2)
!745 = !DILocation(line: 691, column: 16, scope: !743)
!746 = !DILocation(line: 691, column: 6, scope: !744)
!747 = !DILocation(line: 693, column: 4, scope: !748)
!748 = distinct !DILexicalBlock(scope: !743, file: !69, line: 692, column: 3)
!749 = !DILocation(line: 697, column: 4, scope: !750)
!750 = distinct !DILexicalBlock(scope: !743, file: !69, line: 696, column: 3)
!751 = !DILocation(line: 702, column: 14, scope: !752)
!752 = distinct !DILexicalBlock(scope: !739, file: !69, line: 701, column: 2)
!753 = !DILocation(line: 702, column: 28, scope: !752)
!754 = !DILocation(line: 702, column: 38, scope: !752)
!755 = !DILocation(line: 702, column: 37, scope: !752)
!756 = !DILocation(line: 702, column: 53, scope: !752)
!757 = !DILocation(line: 702, column: 51, scope: !752)
!758 = !DILocation(line: 702, column: 24, scope: !752)
!759 = !DILocation(line: 702, column: 66, scope: !752)
!760 = !DILocation(line: 702, column: 12, scope: !752)
!761 = !DILocation(line: 703, column: 16, scope: !752)
!762 = !DILocation(line: 703, column: 25, scope: !752)
!763 = !DILocation(line: 703, column: 24, scope: !752)
!764 = !DILocation(line: 703, column: 41, scope: !752)
!765 = !DILocation(line: 703, column: 51, scope: !752)
!766 = !DILocation(line: 703, column: 50, scope: !752)
!767 = !DILocation(line: 703, column: 38, scope: !752)
!768 = !DILocation(line: 703, column: 13, scope: !752)
!769 = !DILocation(line: 704, column: 6, scope: !770)
!770 = distinct !DILexicalBlock(scope: !752, file: !69, line: 704, column: 6)
!771 = !DILocation(line: 704, column: 16, scope: !770)
!772 = !DILocation(line: 704, column: 6, scope: !752)
!773 = !DILocation(line: 706, column: 7, scope: !774)
!774 = distinct !DILexicalBlock(scope: !775, file: !69, line: 706, column: 7)
!775 = distinct !DILexicalBlock(scope: !770, file: !69, line: 705, column: 3)
!776 = !DILocation(line: 706, column: 17, scope: !774)
!777 = !DILocation(line: 706, column: 7, scope: !775)
!778 = !DILocation(line: 708, column: 17, scope: !779)
!779 = distinct !DILexicalBlock(scope: !774, file: !69, line: 707, column: 4)
!780 = !DILocation(line: 708, column: 12, scope: !779)
!781 = !DILocation(line: 708, column: 5, scope: !779)
!782 = !DILocation(line: 712, column: 5, scope: !783)
!783 = distinct !DILexicalBlock(scope: !774, file: !69, line: 711, column: 4)
!784 = !DILocation(line: 717, column: 4, scope: !785)
!785 = distinct !DILexicalBlock(scope: !770, file: !69, line: 716, column: 3)
!786 = !DILocation(line: 720, column: 1, scope: !721)
!787 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 739, type: !788, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!788 = !DISubroutineType(types: !789)
!789 = !{!18, !6, !18, !6}
!790 = !DILocalVariable(name: "factor1", arg: 1, scope: !787, file: !69, line: 739, type: !6)
!791 = !DILocation(line: 739, column: 33, scope: !787)
!792 = !DILocalVariable(name: "factor2", arg: 2, scope: !787, file: !69, line: 739, type: !18)
!793 = !DILocation(line: 739, column: 46, scope: !787)
!794 = !DILocalVariable(name: "denominator", arg: 3, scope: !787, file: !69, line: 739, type: !6)
!795 = !DILocation(line: 739, column: 59, scope: !787)
!796 = !DILocalVariable(name: "u32Result", scope: !787, file: !69, line: 741, type: !428)
!797 = !DILocation(line: 741, column: 6, scope: !787)
!798 = !DILocalVariable(name: "u32Temp1", scope: !787, file: !69, line: 741, type: !428)
!799 = !DILocation(line: 741, column: 21, scope: !787)
!800 = !DILocalVariable(name: "s32Result", scope: !787, file: !69, line: 742, type: !25)
!801 = !DILocation(line: 742, column: 6, scope: !787)
!802 = !DILocalVariable(name: "s32Temp1", scope: !787, file: !69, line: 742, type: !25)
!803 = !DILocation(line: 742, column: 21, scope: !787)
!804 = !DILocation(line: 743, column: 14, scope: !787)
!805 = !DILocation(line: 743, column: 24, scope: !787)
!806 = !DILocation(line: 743, column: 22, scope: !787)
!807 = !DILocation(line: 743, column: 12, scope: !787)
!808 = !DILocation(line: 745, column: 5, scope: !809)
!809 = distinct !DILexicalBlock(scope: !787, file: !69, line: 745, column: 5)
!810 = !DILocation(line: 745, column: 17, scope: !809)
!811 = !DILocation(line: 745, column: 5, scope: !787)
!812 = !DILocation(line: 747, column: 6, scope: !813)
!813 = distinct !DILexicalBlock(scope: !814, file: !69, line: 747, column: 6)
!814 = distinct !DILexicalBlock(scope: !809, file: !69, line: 746, column: 2)
!815 = !DILocation(line: 747, column: 16, scope: !813)
!816 = !DILocation(line: 747, column: 6, scope: !814)
!817 = !DILocation(line: 749, column: 4, scope: !818)
!818 = distinct !DILexicalBlock(scope: !813, file: !69, line: 748, column: 3)
!819 = !DILocation(line: 753, column: 4, scope: !820)
!820 = distinct !DILexicalBlock(scope: !813, file: !69, line: 752, column: 3)
!821 = !DILocation(line: 758, column: 15, scope: !822)
!822 = distinct !DILexicalBlock(scope: !809, file: !69, line: 757, column: 2)
!823 = !DILocation(line: 758, column: 29, scope: !822)
!824 = !DILocation(line: 758, column: 39, scope: !822)
!825 = !DILocation(line: 758, column: 38, scope: !822)
!826 = !DILocation(line: 758, column: 54, scope: !822)
!827 = !DILocation(line: 758, column: 52, scope: !822)
!828 = !DILocation(line: 758, column: 25, scope: !822)
!829 = !DILocation(line: 758, column: 68, scope: !822)
!830 = !DILocation(line: 758, column: 12, scope: !822)
!831 = !DILocation(line: 759, column: 16, scope: !822)
!832 = !DILocation(line: 759, column: 25, scope: !822)
!833 = !DILocation(line: 759, column: 24, scope: !822)
!834 = !DILocation(line: 759, column: 41, scope: !822)
!835 = !DILocation(line: 759, column: 51, scope: !822)
!836 = !DILocation(line: 759, column: 50, scope: !822)
!837 = !DILocation(line: 759, column: 38, scope: !822)
!838 = !DILocation(line: 759, column: 13, scope: !822)
!839 = !DILocation(line: 760, column: 6, scope: !840)
!840 = distinct !DILexicalBlock(scope: !822, file: !69, line: 760, column: 6)
!841 = !DILocation(line: 760, column: 16, scope: !840)
!842 = !DILocation(line: 760, column: 6, scope: !822)
!843 = !DILocation(line: 762, column: 7, scope: !844)
!844 = distinct !DILexicalBlock(scope: !845, file: !69, line: 762, column: 7)
!845 = distinct !DILexicalBlock(scope: !840, file: !69, line: 761, column: 3)
!846 = !DILocation(line: 762, column: 17, scope: !844)
!847 = !DILocation(line: 762, column: 7, scope: !845)
!848 = !DILocation(line: 764, column: 17, scope: !849)
!849 = distinct !DILexicalBlock(scope: !844, file: !69, line: 763, column: 4)
!850 = !DILocation(line: 764, column: 12, scope: !849)
!851 = !DILocation(line: 764, column: 5, scope: !849)
!852 = !DILocation(line: 768, column: 5, scope: !853)
!853 = distinct !DILexicalBlock(scope: !844, file: !69, line: 767, column: 4)
!854 = !DILocation(line: 773, column: 4, scope: !855)
!855 = distinct !DILexicalBlock(scope: !840, file: !69, line: 772, column: 3)
!856 = !DILocation(line: 776, column: 1, scope: !787)
!857 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 795, type: !858, scopeLine: 796, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!858 = !DISubroutineType(types: !859)
!859 = !{!18, !6, !18, !18}
!860 = !DILocalVariable(name: "factor1", arg: 1, scope: !857, file: !69, line: 795, type: !6)
!861 = !DILocation(line: 795, column: 33, scope: !857)
!862 = !DILocalVariable(name: "factor2", arg: 2, scope: !857, file: !69, line: 795, type: !18)
!863 = !DILocation(line: 795, column: 46, scope: !857)
!864 = !DILocalVariable(name: "denominator", arg: 3, scope: !857, file: !69, line: 795, type: !18)
!865 = !DILocation(line: 795, column: 59, scope: !857)
!866 = !DILocalVariable(name: "s32Result", scope: !857, file: !69, line: 797, type: !25)
!867 = !DILocation(line: 797, column: 6, scope: !857)
!868 = !DILocalVariable(name: "s32Temp1", scope: !857, file: !69, line: 797, type: !25)
!869 = !DILocation(line: 797, column: 21, scope: !857)
!870 = !DILocation(line: 798, column: 14, scope: !857)
!871 = !DILocation(line: 798, column: 24, scope: !857)
!872 = !DILocation(line: 798, column: 22, scope: !857)
!873 = !DILocation(line: 798, column: 12, scope: !857)
!874 = !DILocation(line: 800, column: 5, scope: !875)
!875 = distinct !DILexicalBlock(scope: !857, file: !69, line: 800, column: 5)
!876 = !DILocation(line: 800, column: 17, scope: !875)
!877 = !DILocation(line: 800, column: 5, scope: !857)
!878 = !DILocation(line: 802, column: 6, scope: !879)
!879 = distinct !DILexicalBlock(scope: !880, file: !69, line: 802, column: 6)
!880 = distinct !DILexicalBlock(scope: !875, file: !69, line: 801, column: 2)
!881 = !DILocation(line: 802, column: 16, scope: !879)
!882 = !DILocation(line: 802, column: 6, scope: !880)
!883 = !DILocation(line: 804, column: 4, scope: !884)
!884 = distinct !DILexicalBlock(scope: !879, file: !69, line: 803, column: 3)
!885 = !DILocation(line: 808, column: 4, scope: !886)
!886 = distinct !DILexicalBlock(scope: !879, file: !69, line: 807, column: 3)
!887 = !DILocation(line: 813, column: 15, scope: !888)
!888 = distinct !DILexicalBlock(scope: !875, file: !69, line: 812, column: 2)
!889 = !DILocation(line: 813, column: 29, scope: !888)
!890 = !DILocation(line: 813, column: 39, scope: !888)
!891 = !DILocation(line: 813, column: 38, scope: !888)
!892 = !DILocation(line: 813, column: 54, scope: !888)
!893 = !DILocation(line: 813, column: 52, scope: !888)
!894 = !DILocation(line: 813, column: 25, scope: !888)
!895 = !DILocation(line: 813, column: 68, scope: !888)
!896 = !DILocation(line: 813, column: 12, scope: !888)
!897 = !DILocation(line: 814, column: 16, scope: !888)
!898 = !DILocation(line: 814, column: 25, scope: !888)
!899 = !DILocation(line: 814, column: 24, scope: !888)
!900 = !DILocation(line: 814, column: 41, scope: !888)
!901 = !DILocation(line: 814, column: 51, scope: !888)
!902 = !DILocation(line: 814, column: 50, scope: !888)
!903 = !DILocation(line: 814, column: 38, scope: !888)
!904 = !DILocation(line: 814, column: 13, scope: !888)
!905 = !DILocation(line: 815, column: 6, scope: !906)
!906 = distinct !DILexicalBlock(scope: !888, file: !69, line: 815, column: 6)
!907 = !DILocation(line: 815, column: 16, scope: !906)
!908 = !DILocation(line: 815, column: 6, scope: !888)
!909 = !DILocation(line: 817, column: 7, scope: !910)
!910 = distinct !DILexicalBlock(scope: !911, file: !69, line: 817, column: 7)
!911 = distinct !DILexicalBlock(scope: !906, file: !69, line: 816, column: 3)
!912 = !DILocation(line: 817, column: 17, scope: !910)
!913 = !DILocation(line: 817, column: 7, scope: !911)
!914 = !DILocation(line: 819, column: 17, scope: !915)
!915 = distinct !DILexicalBlock(scope: !910, file: !69, line: 818, column: 4)
!916 = !DILocation(line: 819, column: 12, scope: !915)
!917 = !DILocation(line: 819, column: 5, scope: !915)
!918 = !DILocation(line: 823, column: 5, scope: !919)
!919 = distinct !DILexicalBlock(scope: !910, file: !69, line: 822, column: 4)
!920 = !DILocation(line: 828, column: 4, scope: !921)
!921 = distinct !DILexicalBlock(scope: !906, file: !69, line: 827, column: 3)
!922 = !DILocation(line: 832, column: 1, scope: !857)
!923 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 850, type: !924, scopeLine: 851, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!924 = !DISubroutineType(types: !925)
!925 = !{!18, !18, !18, !18}
!926 = !DILocalVariable(name: "factor1", arg: 1, scope: !923, file: !69, line: 850, type: !18)
!927 = !DILocation(line: 850, column: 33, scope: !923)
!928 = !DILocalVariable(name: "factor2", arg: 2, scope: !923, file: !69, line: 850, type: !18)
!929 = !DILocation(line: 850, column: 46, scope: !923)
!930 = !DILocalVariable(name: "denominator", arg: 3, scope: !923, file: !69, line: 850, type: !18)
!931 = !DILocation(line: 850, column: 59, scope: !923)
!932 = !DILocalVariable(name: "u32Temp1", scope: !923, file: !69, line: 852, type: !428)
!933 = !DILocation(line: 852, column: 6, scope: !923)
!934 = !DILocalVariable(name: "u16TempDenom", scope: !923, file: !69, line: 853, type: !18)
!935 = !DILocation(line: 853, column: 6, scope: !923)
!936 = !DILocation(line: 855, column: 5, scope: !937)
!937 = distinct !DILexicalBlock(scope: !923, file: !69, line: 855, column: 5)
!938 = !DILocation(line: 855, column: 17, scope: !937)
!939 = !DILocation(line: 855, column: 5, scope: !923)
!940 = !DILocation(line: 857, column: 3, scope: !941)
!941 = distinct !DILexicalBlock(scope: !937, file: !69, line: 856, column: 2)
!942 = !DILocation(line: 861, column: 14, scope: !943)
!943 = distinct !DILexicalBlock(scope: !937, file: !69, line: 860, column: 2)
!944 = !DILocation(line: 861, column: 24, scope: !943)
!945 = !DILocation(line: 861, column: 22, scope: !943)
!946 = !DILocation(line: 861, column: 12, scope: !943)
!947 = !DILocation(line: 862, column: 18, scope: !943)
!948 = !DILocation(line: 862, column: 30, scope: !943)
!949 = !DILocation(line: 862, column: 16, scope: !943)
!950 = !DILocation(line: 863, column: 14, scope: !943)
!951 = !DILocation(line: 863, column: 25, scope: !943)
!952 = !DILocation(line: 863, column: 23, scope: !943)
!953 = !DILocation(line: 863, column: 12, scope: !943)
!954 = !DILocation(line: 864, column: 14, scope: !943)
!955 = !DILocation(line: 864, column: 25, scope: !943)
!956 = !DILocation(line: 864, column: 23, scope: !943)
!957 = !DILocation(line: 864, column: 12, scope: !943)
!958 = !DILocation(line: 865, column: 6, scope: !959)
!959 = distinct !DILexicalBlock(scope: !943, file: !69, line: 865, column: 6)
!960 = !DILocation(line: 865, column: 15, scope: !959)
!961 = !DILocation(line: 865, column: 6, scope: !943)
!962 = !DILocation(line: 867, column: 12, scope: !963)
!963 = distinct !DILexicalBlock(scope: !959, file: !69, line: 866, column: 3)
!964 = !DILocation(line: 867, column: 21, scope: !963)
!965 = !DILocation(line: 867, column: 11, scope: !963)
!966 = !DILocation(line: 867, column: 4, scope: !963)
!967 = !DILocation(line: 872, column: 4, scope: !968)
!968 = distinct !DILexicalBlock(scope: !959, file: !69, line: 871, column: 3)
!969 = !DILocation(line: 877, column: 1, scope: !923)
!970 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 894, type: !971, scopeLine: 895, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!971 = !DISubroutineType(types: !972)
!972 = !{!18, !18, !18, !428}
!973 = !DILocalVariable(name: "factor1", arg: 1, scope: !970, file: !69, line: 894, type: !18)
!974 = !DILocation(line: 894, column: 33, scope: !970)
!975 = !DILocalVariable(name: "factor2", arg: 2, scope: !970, file: !69, line: 894, type: !18)
!976 = !DILocation(line: 894, column: 46, scope: !970)
!977 = !DILocalVariable(name: "denominator", arg: 3, scope: !970, file: !69, line: 894, type: !428)
!978 = !DILocation(line: 894, column: 59, scope: !970)
!979 = !DILocalVariable(name: "u32Temp1", scope: !970, file: !69, line: 896, type: !428)
!980 = !DILocation(line: 896, column: 6, scope: !970)
!981 = !DILocation(line: 897, column: 5, scope: !982)
!982 = distinct !DILexicalBlock(scope: !970, file: !69, line: 897, column: 5)
!983 = !DILocation(line: 897, column: 17, scope: !982)
!984 = !DILocation(line: 897, column: 5, scope: !970)
!985 = !DILocation(line: 899, column: 3, scope: !986)
!986 = distinct !DILexicalBlock(scope: !982, file: !69, line: 898, column: 2)
!987 = !DILocation(line: 903, column: 15, scope: !988)
!988 = distinct !DILexicalBlock(scope: !982, file: !69, line: 902, column: 2)
!989 = !DILocation(line: 903, column: 25, scope: !988)
!990 = !DILocation(line: 903, column: 23, scope: !988)
!991 = !DILocation(line: 903, column: 36, scope: !988)
!992 = !DILocation(line: 903, column: 34, scope: !988)
!993 = !DILocation(line: 903, column: 12, scope: !988)
!994 = !DILocation(line: 904, column: 8, scope: !995)
!995 = distinct !DILexicalBlock(scope: !988, file: !69, line: 904, column: 6)
!996 = !DILocation(line: 904, column: 18, scope: !995)
!997 = !DILocation(line: 904, column: 16, scope: !995)
!998 = !DILocation(line: 904, column: 28, scope: !995)
!999 = !DILocation(line: 904, column: 40, scope: !995)
!1000 = !DILocation(line: 904, column: 39, scope: !995)
!1001 = !DILocation(line: 904, column: 26, scope: !995)
!1002 = !DILocation(line: 904, column: 53, scope: !995)
!1003 = !DILocation(line: 904, column: 64, scope: !995)
!1004 = !DILocation(line: 904, column: 50, scope: !995)
!1005 = !DILocation(line: 904, column: 6, scope: !988)
!1006 = !DILocation(line: 906, column: 12, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !995, file: !69, line: 905, column: 3)
!1008 = !DILocation(line: 907, column: 3, scope: !1007)
!1009 = !DILocation(line: 908, column: 6, scope: !1010)
!1010 = distinct !DILexicalBlock(scope: !988, file: !69, line: 908, column: 6)
!1011 = !DILocation(line: 908, column: 15, scope: !1010)
!1012 = !DILocation(line: 908, column: 6, scope: !988)
!1013 = !DILocation(line: 910, column: 12, scope: !1014)
!1014 = distinct !DILexicalBlock(scope: !1010, file: !69, line: 909, column: 3)
!1015 = !DILocation(line: 910, column: 21, scope: !1014)
!1016 = !DILocation(line: 910, column: 11, scope: !1014)
!1017 = !DILocation(line: 910, column: 4, scope: !1014)
!1018 = !DILocation(line: 914, column: 4, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1010, file: !69, line: 913, column: 3)
!1020 = !DILocation(line: 917, column: 1, scope: !970)
!1021 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 934, type: !1022, scopeLine: 935, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1022 = !DISubroutineType(types: !1023)
!1023 = !{!428, !428, !18}
!1024 = !DILocalVariable(name: "x_value", arg: 1, scope: !1021, file: !69, line: 934, type: !428)
!1025 = !DILocation(line: 934, column: 25, scope: !1021)
!1026 = !DILocalVariable(name: "y_value", arg: 2, scope: !1021, file: !69, line: 934, type: !18)
!1027 = !DILocation(line: 934, column: 38, scope: !1021)
!1028 = !DILocalVariable(name: "u32Temp1", scope: !1021, file: !69, line: 936, type: !428)
!1029 = !DILocation(line: 936, column: 6, scope: !1021)
!1030 = !DILocation(line: 937, column: 5, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1021, file: !69, line: 937, column: 5)
!1032 = !DILocation(line: 937, column: 13, scope: !1031)
!1033 = !DILocation(line: 937, column: 5, scope: !1021)
!1034 = !DILocation(line: 939, column: 3, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1031, file: !69, line: 938, column: 2)
!1036 = !DILocation(line: 943, column: 15, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1031, file: !69, line: 942, column: 2)
!1038 = !DILocation(line: 943, column: 26, scope: !1037)
!1039 = !DILocation(line: 943, column: 34, scope: !1037)
!1040 = !DILocation(line: 943, column: 33, scope: !1037)
!1041 = !DILocation(line: 943, column: 45, scope: !1037)
!1042 = !DILocation(line: 943, column: 43, scope: !1037)
!1043 = !DILocation(line: 943, column: 23, scope: !1037)
!1044 = !DILocation(line: 943, column: 54, scope: !1037)
!1045 = !DILocation(line: 943, column: 12, scope: !1037)
!1046 = !DILocation(line: 944, column: 15, scope: !1037)
!1047 = !DILocation(line: 944, column: 23, scope: !1037)
!1048 = !DILocation(line: 944, column: 22, scope: !1037)
!1049 = !DILocation(line: 944, column: 35, scope: !1037)
!1050 = !DILocation(line: 944, column: 44, scope: !1037)
!1051 = !DILocation(line: 944, column: 43, scope: !1037)
!1052 = !DILocation(line: 944, column: 32, scope: !1037)
!1053 = !DILocation(line: 944, column: 12, scope: !1037)
!1054 = !DILocation(line: 945, column: 10, scope: !1037)
!1055 = !DILocation(line: 945, column: 3, scope: !1037)
!1056 = !DILocation(line: 947, column: 1, scope: !1021)
!1057 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 965, type: !1058, scopeLine: 966, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1058 = !DISubroutineType(types: !1059)
!1059 = !{!6, !6, !6, !6}
!1060 = !DILocalVariable(name: "fak1", arg: 1, scope: !1057, file: !69, line: 965, type: !6)
!1061 = !DILocation(line: 965, column: 33, scope: !1057)
!1062 = !DILocalVariable(name: "fak2", arg: 2, scope: !1057, file: !69, line: 965, type: !6)
!1063 = !DILocation(line: 965, column: 43, scope: !1057)
!1064 = !DILocalVariable(name: "div", arg: 3, scope: !1057, file: !69, line: 965, type: !6)
!1065 = !DILocation(line: 965, column: 53, scope: !1057)
!1066 = !DILocalVariable(name: "s32Temp1", scope: !1057, file: !69, line: 967, type: !25)
!1067 = !DILocation(line: 967, column: 6, scope: !1057)
!1068 = !DILocalVariable(name: "s32Temp2", scope: !1057, file: !69, line: 967, type: !25)
!1069 = !DILocation(line: 967, column: 20, scope: !1057)
!1070 = !DILocalVariable(name: "s32Temp3", scope: !1057, file: !69, line: 967, type: !25)
!1071 = !DILocation(line: 967, column: 34, scope: !1057)
!1072 = !DILocation(line: 968, column: 13, scope: !1057)
!1073 = !DILocation(line: 968, column: 20, scope: !1057)
!1074 = !DILocation(line: 968, column: 18, scope: !1057)
!1075 = !DILocation(line: 968, column: 11, scope: !1057)
!1076 = !DILocation(line: 969, column: 5, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1057, file: !69, line: 969, column: 5)
!1078 = !DILocation(line: 969, column: 9, scope: !1077)
!1079 = !DILocation(line: 969, column: 5, scope: !1057)
!1080 = !DILocation(line: 971, column: 6, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1082, file: !69, line: 971, column: 6)
!1082 = distinct !DILexicalBlock(scope: !1077, file: !69, line: 970, column: 2)
!1083 = !DILocation(line: 971, column: 15, scope: !1081)
!1084 = !DILocation(line: 971, column: 6, scope: !1082)
!1085 = !DILocation(line: 973, column: 4, scope: !1086)
!1086 = distinct !DILexicalBlock(scope: !1081, file: !69, line: 972, column: 3)
!1087 = !DILocation(line: 977, column: 4, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1081, file: !69, line: 976, column: 3)
!1089 = !DILocation(line: 982, column: 15, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1077, file: !69, line: 981, column: 2)
!1091 = !DILocation(line: 982, column: 28, scope: !1090)
!1092 = !DILocation(line: 982, column: 39, scope: !1090)
!1093 = !DILocation(line: 982, column: 37, scope: !1090)
!1094 = !DILocation(line: 982, column: 46, scope: !1090)
!1095 = !DILocation(line: 982, column: 44, scope: !1090)
!1096 = !DILocation(line: 982, column: 24, scope: !1090)
!1097 = !DILocation(line: 982, column: 52, scope: !1090)
!1098 = !DILocation(line: 982, column: 12, scope: !1090)
!1099 = !DILocation(line: 983, column: 15, scope: !1090)
!1100 = !DILocation(line: 983, column: 24, scope: !1090)
!1101 = !DILocation(line: 983, column: 23, scope: !1090)
!1102 = !DILocation(line: 983, column: 32, scope: !1090)
!1103 = !DILocation(line: 983, column: 41, scope: !1090)
!1104 = !DILocation(line: 983, column: 40, scope: !1090)
!1105 = !DILocation(line: 983, column: 29, scope: !1090)
!1106 = !DILocation(line: 983, column: 12, scope: !1090)
!1107 = !DILocation(line: 984, column: 6, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1090, file: !69, line: 984, column: 6)
!1109 = !DILocation(line: 984, column: 15, scope: !1108)
!1110 = !DILocation(line: 984, column: 6, scope: !1090)
!1111 = !DILocation(line: 986, column: 7, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1113, file: !69, line: 986, column: 7)
!1113 = distinct !DILexicalBlock(scope: !1108, file: !69, line: 985, column: 3)
!1114 = !DILocation(line: 986, column: 16, scope: !1112)
!1115 = !DILocation(line: 986, column: 7, scope: !1113)
!1116 = !DILocation(line: 988, column: 17, scope: !1117)
!1117 = distinct !DILexicalBlock(scope: !1112, file: !69, line: 987, column: 4)
!1118 = !DILocation(line: 988, column: 12, scope: !1117)
!1119 = !DILocation(line: 988, column: 5, scope: !1117)
!1120 = !DILocation(line: 992, column: 5, scope: !1121)
!1121 = distinct !DILexicalBlock(scope: !1112, file: !69, line: 991, column: 4)
!1122 = !DILocation(line: 997, column: 4, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1108, file: !69, line: 996, column: 3)
!1124 = !DILocation(line: 1000, column: 1, scope: !1057)
!1125 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1018, type: !1126, scopeLine: 1019, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1126 = !DISubroutineType(types: !1127)
!1127 = !{!6, !6, !6, !18}
!1128 = !DILocalVariable(name: "data1", arg: 1, scope: !1125, file: !69, line: 1018, type: !6)
!1129 = !DILocation(line: 1018, column: 33, scope: !1125)
!1130 = !DILocalVariable(name: "data2", arg: 2, scope: !1125, file: !69, line: 1018, type: !6)
!1131 = !DILocation(line: 1018, column: 43, scope: !1125)
!1132 = !DILocalVariable(name: "denominator", arg: 3, scope: !1125, file: !69, line: 1018, type: !18)
!1133 = !DILocation(line: 1018, column: 53, scope: !1125)
!1134 = !DILocalVariable(name: "s32Result", scope: !1125, file: !69, line: 1020, type: !25)
!1135 = !DILocation(line: 1020, column: 6, scope: !1125)
!1136 = !DILocalVariable(name: "s32Temp1", scope: !1125, file: !69, line: 1020, type: !25)
!1137 = !DILocation(line: 1020, column: 21, scope: !1125)
!1138 = !DILocation(line: 1021, column: 14, scope: !1125)
!1139 = !DILocation(line: 1021, column: 22, scope: !1125)
!1140 = !DILocation(line: 1021, column: 20, scope: !1125)
!1141 = !DILocation(line: 1021, column: 12, scope: !1125)
!1142 = !DILocation(line: 1023, column: 5, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1125, file: !69, line: 1023, column: 5)
!1144 = !DILocation(line: 1023, column: 17, scope: !1143)
!1145 = !DILocation(line: 1023, column: 5, scope: !1125)
!1146 = !DILocation(line: 1025, column: 6, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !1148, file: !69, line: 1025, column: 6)
!1148 = distinct !DILexicalBlock(scope: !1143, file: !69, line: 1024, column: 2)
!1149 = !DILocation(line: 1025, column: 16, scope: !1147)
!1150 = !DILocation(line: 1025, column: 6, scope: !1148)
!1151 = !DILocation(line: 1027, column: 4, scope: !1152)
!1152 = distinct !DILexicalBlock(scope: !1147, file: !69, line: 1026, column: 3)
!1153 = !DILocation(line: 1029, column: 11, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1147, file: !69, line: 1029, column: 11)
!1155 = !DILocation(line: 1029, column: 21, scope: !1154)
!1156 = !DILocation(line: 1029, column: 11, scope: !1147)
!1157 = !DILocation(line: 1031, column: 4, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1154, file: !69, line: 1030, column: 3)
!1159 = !DILocation(line: 1035, column: 4, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1154, file: !69, line: 1034, column: 3)
!1161 = !DILocation(line: 1040, column: 15, scope: !1162)
!1162 = distinct !DILexicalBlock(scope: !1143, file: !69, line: 1039, column: 2)
!1163 = !DILocation(line: 1040, column: 28, scope: !1162)
!1164 = !DILocation(line: 1040, column: 38, scope: !1162)
!1165 = !DILocation(line: 1040, column: 37, scope: !1162)
!1166 = !DILocation(line: 1040, column: 51, scope: !1162)
!1167 = !DILocation(line: 1040, column: 50, scope: !1162)
!1168 = !DILocation(line: 1040, column: 25, scope: !1162)
!1169 = !DILocation(line: 1040, column: 64, scope: !1162)
!1170 = !DILocation(line: 1040, column: 12, scope: !1162)
!1171 = !DILocation(line: 1041, column: 16, scope: !1162)
!1172 = !DILocation(line: 1041, column: 25, scope: !1162)
!1173 = !DILocation(line: 1041, column: 24, scope: !1162)
!1174 = !DILocation(line: 1041, column: 41, scope: !1162)
!1175 = !DILocation(line: 1041, column: 51, scope: !1162)
!1176 = !DILocation(line: 1041, column: 50, scope: !1162)
!1177 = !DILocation(line: 1041, column: 38, scope: !1162)
!1178 = !DILocation(line: 1041, column: 13, scope: !1162)
!1179 = !DILocation(line: 1042, column: 6, scope: !1180)
!1180 = distinct !DILexicalBlock(scope: !1162, file: !69, line: 1042, column: 6)
!1181 = !DILocation(line: 1042, column: 16, scope: !1180)
!1182 = !DILocation(line: 1042, column: 6, scope: !1162)
!1183 = !DILocation(line: 1044, column: 7, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1185, file: !69, line: 1044, column: 7)
!1185 = distinct !DILexicalBlock(scope: !1180, file: !69, line: 1043, column: 3)
!1186 = !DILocation(line: 1044, column: 17, scope: !1184)
!1187 = !DILocation(line: 1044, column: 7, scope: !1185)
!1188 = !DILocation(line: 1046, column: 17, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1184, file: !69, line: 1045, column: 4)
!1190 = !DILocation(line: 1046, column: 12, scope: !1189)
!1191 = !DILocation(line: 1046, column: 5, scope: !1189)
!1192 = !DILocation(line: 1050, column: 5, scope: !1193)
!1193 = distinct !DILexicalBlock(scope: !1184, file: !69, line: 1049, column: 4)
!1194 = !DILocation(line: 1055, column: 4, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1180, file: !69, line: 1054, column: 3)
!1196 = !DILocation(line: 1059, column: 1, scope: !1125)
!1197 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1076, type: !1198, scopeLine: 1077, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1198 = !DISubroutineType(types: !1199)
!1199 = !{!428, !428, !25}
!1200 = !DILocalVariable(name: "numerator", arg: 1, scope: !1197, file: !69, line: 1076, type: !428)
!1201 = !DILocation(line: 1076, column: 25, scope: !1197)
!1202 = !DILocalVariable(name: "denominator", arg: 2, scope: !1197, file: !69, line: 1076, type: !25)
!1203 = !DILocation(line: 1076, column: 40, scope: !1197)
!1204 = !DILocalVariable(name: "u32Temp1", scope: !1197, file: !69, line: 1078, type: !428)
!1205 = !DILocation(line: 1078, column: 6, scope: !1197)
!1206 = !DILocation(line: 1079, column: 5, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1197, file: !69, line: 1079, column: 5)
!1208 = !DILocation(line: 1079, column: 17, scope: !1207)
!1209 = !DILocation(line: 1079, column: 5, scope: !1197)
!1210 = !DILocation(line: 1081, column: 3, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1207, file: !69, line: 1080, column: 2)
!1212 = !DILocation(line: 1085, column: 6, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1214, file: !69, line: 1085, column: 6)
!1214 = distinct !DILexicalBlock(scope: !1207, file: !69, line: 1084, column: 2)
!1215 = !DILocation(line: 1085, column: 18, scope: !1213)
!1216 = !DILocation(line: 1085, column: 6, scope: !1214)
!1217 = !DILocation(line: 1087, column: 4, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1213, file: !69, line: 1086, column: 3)
!1219 = !DILocation(line: 1091, column: 16, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1213, file: !69, line: 1090, column: 3)
!1221 = !DILocation(line: 1091, column: 30, scope: !1220)
!1222 = !DILocation(line: 1091, column: 40, scope: !1220)
!1223 = !DILocation(line: 1091, column: 39, scope: !1220)
!1224 = !DILocation(line: 1091, column: 55, scope: !1220)
!1225 = !DILocation(line: 1091, column: 53, scope: !1220)
!1226 = !DILocation(line: 1091, column: 26, scope: !1220)
!1227 = !DILocation(line: 1091, column: 68, scope: !1220)
!1228 = !DILocation(line: 1091, column: 13, scope: !1220)
!1229 = !DILocation(line: 1092, column: 16, scope: !1220)
!1230 = !DILocation(line: 1092, column: 25, scope: !1220)
!1231 = !DILocation(line: 1092, column: 24, scope: !1220)
!1232 = !DILocation(line: 1092, column: 41, scope: !1220)
!1233 = !DILocation(line: 1092, column: 51, scope: !1220)
!1234 = !DILocation(line: 1092, column: 50, scope: !1220)
!1235 = !DILocation(line: 1092, column: 38, scope: !1220)
!1236 = !DILocation(line: 1092, column: 13, scope: !1220)
!1237 = !DILocation(line: 1093, column: 11, scope: !1220)
!1238 = !DILocation(line: 1093, column: 4, scope: !1220)
!1239 = !DILocation(line: 1096, column: 1, scope: !1197)
!1240 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1113, type: !1241, scopeLine: 1114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1241 = !DISubroutineType(types: !1242)
!1242 = !{!428, !25, !428}
!1243 = !DILocalVariable(name: "numerator", arg: 1, scope: !1240, file: !69, line: 1113, type: !25)
!1244 = !DILocation(line: 1113, column: 25, scope: !1240)
!1245 = !DILocalVariable(name: "denominator", arg: 2, scope: !1240, file: !69, line: 1113, type: !428)
!1246 = !DILocation(line: 1113, column: 40, scope: !1240)
!1247 = !DILocalVariable(name: "s32Temp1", scope: !1240, file: !69, line: 1115, type: !25)
!1248 = !DILocation(line: 1115, column: 6, scope: !1240)
!1249 = !DILocation(line: 1116, column: 5, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1240, file: !69, line: 1116, column: 5)
!1251 = !DILocation(line: 1116, column: 17, scope: !1250)
!1252 = !DILocation(line: 1116, column: 5, scope: !1240)
!1253 = !DILocation(line: 1118, column: 6, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1255, file: !69, line: 1118, column: 6)
!1255 = distinct !DILexicalBlock(scope: !1250, file: !69, line: 1117, column: 2)
!1256 = !DILocation(line: 1118, column: 16, scope: !1254)
!1257 = !DILocation(line: 1118, column: 6, scope: !1255)
!1258 = !DILocation(line: 1120, column: 4, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1254, file: !69, line: 1119, column: 3)
!1260 = !DILocation(line: 1124, column: 4, scope: !1261)
!1261 = distinct !DILexicalBlock(scope: !1254, file: !69, line: 1123, column: 3)
!1262 = !DILocation(line: 1129, column: 6, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1264, file: !69, line: 1129, column: 6)
!1264 = distinct !DILexicalBlock(scope: !1250, file: !69, line: 1128, column: 2)
!1265 = !DILocation(line: 1129, column: 16, scope: !1263)
!1266 = !DILocation(line: 1129, column: 6, scope: !1264)
!1267 = !DILocation(line: 1131, column: 17, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1263, file: !69, line: 1130, column: 3)
!1269 = !DILocation(line: 1131, column: 31, scope: !1268)
!1270 = !DILocation(line: 1131, column: 41, scope: !1268)
!1271 = !DILocation(line: 1131, column: 40, scope: !1268)
!1272 = !DILocation(line: 1131, column: 56, scope: !1268)
!1273 = !DILocation(line: 1131, column: 54, scope: !1268)
!1274 = !DILocation(line: 1131, column: 27, scope: !1268)
!1275 = !DILocation(line: 1131, column: 69, scope: !1268)
!1276 = !DILocation(line: 1131, column: 13, scope: !1268)
!1277 = !DILocation(line: 1132, column: 13, scope: !1268)
!1278 = !DILocation(line: 1132, column: 23, scope: !1268)
!1279 = !DILocation(line: 1132, column: 22, scope: !1268)
!1280 = !DILocation(line: 1132, column: 39, scope: !1268)
!1281 = !DILocation(line: 1132, column: 48, scope: !1268)
!1282 = !DILocation(line: 1132, column: 47, scope: !1268)
!1283 = !DILocation(line: 1132, column: 36, scope: !1268)
!1284 = !DILocation(line: 1132, column: 4, scope: !1268)
!1285 = !DILocation(line: 1136, column: 4, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1263, file: !69, line: 1135, column: 3)
!1287 = !DILocation(line: 1139, column: 1, scope: !1240)
!1288 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1156, type: !1289, scopeLine: 1157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1289 = !DISubroutineType(types: !1290)
!1290 = !{!428, !25, !25}
!1291 = !DILocalVariable(name: "numerator", arg: 1, scope: !1288, file: !69, line: 1156, type: !25)
!1292 = !DILocation(line: 1156, column: 25, scope: !1288)
!1293 = !DILocalVariable(name: "denominator", arg: 2, scope: !1288, file: !69, line: 1156, type: !25)
!1294 = !DILocation(line: 1156, column: 40, scope: !1288)
!1295 = !DILocalVariable(name: "u32Temp1", scope: !1288, file: !69, line: 1158, type: !428)
!1296 = !DILocation(line: 1158, column: 6, scope: !1288)
!1297 = !DILocalVariable(name: "u32Temp2", scope: !1288, file: !69, line: 1158, type: !428)
!1298 = !DILocation(line: 1158, column: 20, scope: !1288)
!1299 = !DILocation(line: 1159, column: 5, scope: !1300)
!1300 = distinct !DILexicalBlock(scope: !1288, file: !69, line: 1159, column: 5)
!1301 = !DILocation(line: 1159, column: 17, scope: !1300)
!1302 = !DILocation(line: 1159, column: 5, scope: !1288)
!1303 = !DILocation(line: 1161, column: 6, scope: !1304)
!1304 = distinct !DILexicalBlock(scope: !1305, file: !69, line: 1161, column: 6)
!1305 = distinct !DILexicalBlock(scope: !1300, file: !69, line: 1160, column: 2)
!1306 = !DILocation(line: 1161, column: 16, scope: !1304)
!1307 = !DILocation(line: 1161, column: 6, scope: !1305)
!1308 = !DILocation(line: 1163, column: 4, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1304, file: !69, line: 1162, column: 3)
!1310 = !DILocation(line: 1167, column: 4, scope: !1311)
!1311 = distinct !DILexicalBlock(scope: !1304, file: !69, line: 1166, column: 3)
!1312 = !DILocation(line: 1172, column: 6, scope: !1313)
!1313 = distinct !DILexicalBlock(scope: !1314, file: !69, line: 1172, column: 6)
!1314 = distinct !DILexicalBlock(scope: !1300, file: !69, line: 1171, column: 2)
!1315 = !DILocation(line: 1172, column: 16, scope: !1313)
!1316 = !DILocation(line: 1172, column: 6, scope: !1314)
!1317 = !DILocation(line: 1174, column: 7, scope: !1318)
!1318 = distinct !DILexicalBlock(scope: !1319, file: !69, line: 1174, column: 7)
!1319 = distinct !DILexicalBlock(scope: !1313, file: !69, line: 1173, column: 3)
!1320 = !DILocation(line: 1174, column: 17, scope: !1318)
!1321 = !DILocation(line: 1174, column: 7, scope: !1319)
!1322 = !DILocation(line: 1176, column: 5, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1318, file: !69, line: 1175, column: 4)
!1324 = !DILocation(line: 1180, column: 8, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1326, file: !69, line: 1180, column: 8)
!1326 = distinct !DILexicalBlock(scope: !1318, file: !69, line: 1179, column: 4)
!1327 = !DILocation(line: 1180, column: 20, scope: !1325)
!1328 = !DILocation(line: 1180, column: 8, scope: !1326)
!1329 = !DILocation(line: 1182, column: 6, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1325, file: !69, line: 1181, column: 5)
!1331 = !DILocation(line: 1186, column: 18, scope: !1332)
!1332 = distinct !DILexicalBlock(scope: !1325, file: !69, line: 1185, column: 5)
!1333 = !DILocation(line: 1186, column: 32, scope: !1332)
!1334 = !DILocation(line: 1186, column: 42, scope: !1332)
!1335 = !DILocation(line: 1186, column: 41, scope: !1332)
!1336 = !DILocation(line: 1186, column: 57, scope: !1332)
!1337 = !DILocation(line: 1186, column: 55, scope: !1332)
!1338 = !DILocation(line: 1186, column: 28, scope: !1332)
!1339 = !DILocation(line: 1186, column: 71, scope: !1332)
!1340 = !DILocation(line: 1186, column: 15, scope: !1332)
!1341 = !DILocation(line: 1187, column: 18, scope: !1332)
!1342 = !DILocation(line: 1187, column: 29, scope: !1332)
!1343 = !DILocation(line: 1187, column: 27, scope: !1332)
!1344 = !DILocation(line: 1187, column: 45, scope: !1332)
!1345 = !DILocation(line: 1187, column: 57, scope: !1332)
!1346 = !DILocation(line: 1187, column: 55, scope: !1332)
!1347 = !DILocation(line: 1187, column: 42, scope: !1332)
!1348 = !DILocation(line: 1187, column: 15, scope: !1332)
!1349 = !DILocation(line: 1188, column: 13, scope: !1332)
!1350 = !DILocation(line: 1188, column: 6, scope: !1332)
!1351 = !DILocation(line: 1194, column: 7, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1353, file: !69, line: 1194, column: 7)
!1353 = distinct !DILexicalBlock(scope: !1313, file: !69, line: 1193, column: 3)
!1354 = !DILocation(line: 1194, column: 19, scope: !1352)
!1355 = !DILocation(line: 1194, column: 7, scope: !1353)
!1356 = !DILocation(line: 1196, column: 5, scope: !1357)
!1357 = distinct !DILexicalBlock(scope: !1352, file: !69, line: 1195, column: 4)
!1358 = !DILocation(line: 1200, column: 18, scope: !1359)
!1359 = distinct !DILexicalBlock(scope: !1352, file: !69, line: 1199, column: 4)
!1360 = !DILocation(line: 1200, column: 17, scope: !1359)
!1361 = !DILocation(line: 1200, column: 15, scope: !1359)
!1362 = !DILocation(line: 1201, column: 20, scope: !1359)
!1363 = !DILocation(line: 1201, column: 19, scope: !1359)
!1364 = !DILocation(line: 1201, column: 17, scope: !1359)
!1365 = !DILocation(line: 1202, column: 17, scope: !1359)
!1366 = !DILocation(line: 1202, column: 31, scope: !1359)
!1367 = !DILocation(line: 1202, column: 41, scope: !1359)
!1368 = !DILocation(line: 1202, column: 40, scope: !1359)
!1369 = !DILocation(line: 1202, column: 56, scope: !1359)
!1370 = !DILocation(line: 1202, column: 54, scope: !1359)
!1371 = !DILocation(line: 1202, column: 27, scope: !1359)
!1372 = !DILocation(line: 1202, column: 70, scope: !1359)
!1373 = !DILocation(line: 1202, column: 14, scope: !1359)
!1374 = !DILocation(line: 1203, column: 17, scope: !1359)
!1375 = !DILocation(line: 1203, column: 28, scope: !1359)
!1376 = !DILocation(line: 1203, column: 26, scope: !1359)
!1377 = !DILocation(line: 1203, column: 44, scope: !1359)
!1378 = !DILocation(line: 1203, column: 56, scope: !1359)
!1379 = !DILocation(line: 1203, column: 54, scope: !1359)
!1380 = !DILocation(line: 1203, column: 41, scope: !1359)
!1381 = !DILocation(line: 1203, column: 14, scope: !1359)
!1382 = !DILocation(line: 1204, column: 12, scope: !1359)
!1383 = !DILocation(line: 1204, column: 5, scope: !1359)
!1384 = !DILocation(line: 1209, column: 1, scope: !1288)
!1385 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1226, type: !1386, scopeLine: 1227, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1386 = !DISubroutineType(types: !1387)
!1387 = !{!428, !428, !428}
!1388 = !DILocalVariable(name: "numerator", arg: 1, scope: !1385, file: !69, line: 1226, type: !428)
!1389 = !DILocation(line: 1226, column: 25, scope: !1385)
!1390 = !DILocalVariable(name: "denominator", arg: 2, scope: !1385, file: !69, line: 1226, type: !428)
!1391 = !DILocation(line: 1226, column: 40, scope: !1385)
!1392 = !DILocalVariable(name: "u32Temp1", scope: !1385, file: !69, line: 1229, type: !428)
!1393 = !DILocation(line: 1229, column: 6, scope: !1385)
!1394 = !DILocalVariable(name: "u32Temp2", scope: !1385, file: !69, line: 1229, type: !428)
!1395 = !DILocation(line: 1229, column: 20, scope: !1385)
!1396 = !DILocalVariable(name: "u32Temp3", scope: !1385, file: !69, line: 1229, type: !428)
!1397 = !DILocation(line: 1229, column: 34, scope: !1385)
!1398 = !DILocalVariable(name: "numerator_old", scope: !1385, file: !69, line: 1229, type: !428)
!1399 = !DILocation(line: 1229, column: 48, scope: !1385)
!1400 = !DILocation(line: 1230, column: 5, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1385, file: !69, line: 1230, column: 5)
!1402 = !DILocation(line: 1230, column: 16, scope: !1401)
!1403 = !DILocation(line: 1230, column: 5, scope: !1385)
!1404 = !DILocation(line: 1232, column: 3, scope: !1405)
!1405 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1231, column: 2)
!1406 = !DILocation(line: 1236, column: 14, scope: !1407)
!1407 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1235, column: 2)
!1408 = !DILocation(line: 1236, column: 26, scope: !1407)
!1409 = !DILocation(line: 1236, column: 41, scope: !1407)
!1410 = !DILocation(line: 1236, column: 51, scope: !1407)
!1411 = !DILocation(line: 1236, column: 50, scope: !1407)
!1412 = !DILocation(line: 1236, column: 38, scope: !1407)
!1413 = !DILocation(line: 1236, column: 24, scope: !1407)
!1414 = !DILocation(line: 1236, column: 12, scope: !1407)
!1415 = !DILocation(line: 1237, column: 7, scope: !1416)
!1416 = distinct !DILexicalBlock(scope: !1407, file: !69, line: 1237, column: 6)
!1417 = !DILocation(line: 1237, column: 16, scope: !1416)
!1418 = !DILocation(line: 1237, column: 24, scope: !1416)
!1419 = !DILocation(line: 1237, column: 6, scope: !1407)
!1420 = !DILocation(line: 1239, column: 16, scope: !1421)
!1421 = distinct !DILexicalBlock(scope: !1416, file: !69, line: 1238, column: 3)
!1422 = !DILocation(line: 1239, column: 27, scope: !1421)
!1423 = !DILocation(line: 1239, column: 13, scope: !1421)
!1424 = !DILocation(line: 1240, column: 3, scope: !1421)
!1425 = !DILocation(line: 1243, column: 16, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1416, file: !69, line: 1242, column: 3)
!1427 = !DILocation(line: 1243, column: 27, scope: !1426)
!1428 = !DILocation(line: 1243, column: 32, scope: !1426)
!1429 = !DILocation(line: 1243, column: 13, scope: !1426)
!1430 = !DILocation(line: 1246, column: 6, scope: !1431)
!1431 = distinct !DILexicalBlock(scope: !1407, file: !69, line: 1246, column: 6)
!1432 = !DILocation(line: 1246, column: 17, scope: !1431)
!1433 = !DILocation(line: 1246, column: 15, scope: !1431)
!1434 = !DILocation(line: 1246, column: 6, scope: !1407)
!1435 = !DILocation(line: 1248, column: 12, scope: !1436)
!1436 = distinct !DILexicalBlock(scope: !1431, file: !69, line: 1247, column: 3)
!1437 = !DILocation(line: 1248, column: 22, scope: !1436)
!1438 = !DILocation(line: 1248, column: 21, scope: !1436)
!1439 = !DILocation(line: 1248, column: 4, scope: !1436)
!1440 = !DILocation(line: 1252, column: 13, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1431, file: !69, line: 1251, column: 3)
!1442 = !DILocation(line: 1252, column: 23, scope: !1441)
!1443 = !DILocation(line: 1252, column: 22, scope: !1441)
!1444 = !DILocation(line: 1252, column: 36, scope: !1441)
!1445 = !DILocation(line: 1252, column: 4, scope: !1441)
!1446 = !DILocation(line: 1257, column: 1, scope: !1385)
!1447 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1274, type: !1448, scopeLine: 1275, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1448 = !DISubroutineType(types: !1449)
!1449 = !{!25, !428, !25}
!1450 = !DILocalVariable(name: "numerator", arg: 1, scope: !1447, file: !69, line: 1274, type: !428)
!1451 = !DILocation(line: 1274, column: 25, scope: !1447)
!1452 = !DILocalVariable(name: "denominator", arg: 2, scope: !1447, file: !69, line: 1274, type: !25)
!1453 = !DILocation(line: 1274, column: 40, scope: !1447)
!1454 = !DILocalVariable(name: "u32Temp1", scope: !1447, file: !69, line: 1276, type: !428)
!1455 = !DILocation(line: 1276, column: 6, scope: !1447)
!1456 = !DILocalVariable(name: "u32Temp2", scope: !1447, file: !69, line: 1276, type: !428)
!1457 = !DILocation(line: 1276, column: 20, scope: !1447)
!1458 = !DILocation(line: 1277, column: 5, scope: !1459)
!1459 = distinct !DILexicalBlock(scope: !1447, file: !69, line: 1277, column: 5)
!1460 = !DILocation(line: 1277, column: 17, scope: !1459)
!1461 = !DILocation(line: 1277, column: 5, scope: !1447)
!1462 = !DILocation(line: 1279, column: 6, scope: !1463)
!1463 = distinct !DILexicalBlock(scope: !1464, file: !69, line: 1279, column: 6)
!1464 = distinct !DILexicalBlock(scope: !1459, file: !69, line: 1278, column: 2)
!1465 = !DILocation(line: 1279, column: 18, scope: !1463)
!1466 = !DILocation(line: 1279, column: 6, scope: !1464)
!1467 = !DILocation(line: 1281, column: 4, scope: !1468)
!1468 = distinct !DILexicalBlock(scope: !1463, file: !69, line: 1280, column: 3)
!1469 = !DILocation(line: 1285, column: 19, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1463, file: !69, line: 1284, column: 3)
!1471 = !DILocation(line: 1285, column: 18, scope: !1470)
!1472 = !DILocation(line: 1285, column: 16, scope: !1470)
!1473 = !DILocation(line: 1286, column: 16, scope: !1470)
!1474 = !DILocation(line: 1286, column: 30, scope: !1470)
!1475 = !DILocation(line: 1286, column: 40, scope: !1470)
!1476 = !DILocation(line: 1286, column: 39, scope: !1470)
!1477 = !DILocation(line: 1286, column: 55, scope: !1470)
!1478 = !DILocation(line: 1286, column: 53, scope: !1470)
!1479 = !DILocation(line: 1286, column: 26, scope: !1470)
!1480 = !DILocation(line: 1286, column: 69, scope: !1470)
!1481 = !DILocation(line: 1286, column: 13, scope: !1470)
!1482 = !DILocation(line: 1287, column: 16, scope: !1470)
!1483 = !DILocation(line: 1287, column: 25, scope: !1470)
!1484 = !DILocation(line: 1287, column: 24, scope: !1470)
!1485 = !DILocation(line: 1287, column: 41, scope: !1470)
!1486 = !DILocation(line: 1287, column: 51, scope: !1470)
!1487 = !DILocation(line: 1287, column: 50, scope: !1470)
!1488 = !DILocation(line: 1287, column: 38, scope: !1470)
!1489 = !DILocation(line: 1287, column: 13, scope: !1470)
!1490 = !DILocation(line: 1288, column: 7, scope: !1491)
!1491 = distinct !DILexicalBlock(scope: !1470, file: !69, line: 1288, column: 7)
!1492 = !DILocation(line: 1288, column: 16, scope: !1491)
!1493 = !DILocation(line: 1288, column: 7, scope: !1470)
!1494 = !DILocation(line: 1290, column: 13, scope: !1495)
!1495 = distinct !DILexicalBlock(scope: !1491, file: !69, line: 1289, column: 4)
!1496 = !DILocation(line: 1290, column: 12, scope: !1495)
!1497 = !DILocation(line: 1290, column: 5, scope: !1495)
!1498 = !DILocation(line: 1294, column: 5, scope: !1499)
!1499 = distinct !DILexicalBlock(scope: !1491, file: !69, line: 1293, column: 4)
!1500 = !DILocation(line: 1300, column: 15, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1459, file: !69, line: 1299, column: 2)
!1502 = !DILocation(line: 1300, column: 29, scope: !1501)
!1503 = !DILocation(line: 1300, column: 39, scope: !1501)
!1504 = !DILocation(line: 1300, column: 38, scope: !1501)
!1505 = !DILocation(line: 1300, column: 54, scope: !1501)
!1506 = !DILocation(line: 1300, column: 52, scope: !1501)
!1507 = !DILocation(line: 1300, column: 25, scope: !1501)
!1508 = !DILocation(line: 1300, column: 68, scope: !1501)
!1509 = !DILocation(line: 1300, column: 12, scope: !1501)
!1510 = !DILocation(line: 1301, column: 15, scope: !1501)
!1511 = !DILocation(line: 1301, column: 24, scope: !1501)
!1512 = !DILocation(line: 1301, column: 23, scope: !1501)
!1513 = !DILocation(line: 1301, column: 40, scope: !1501)
!1514 = !DILocation(line: 1301, column: 50, scope: !1501)
!1515 = !DILocation(line: 1301, column: 49, scope: !1501)
!1516 = !DILocation(line: 1301, column: 37, scope: !1501)
!1517 = !DILocation(line: 1301, column: 12, scope: !1501)
!1518 = !DILocation(line: 1302, column: 6, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1501, file: !69, line: 1302, column: 6)
!1520 = !DILocation(line: 1302, column: 15, scope: !1519)
!1521 = !DILocation(line: 1302, column: 6, scope: !1501)
!1522 = !DILocation(line: 1304, column: 11, scope: !1523)
!1523 = distinct !DILexicalBlock(scope: !1519, file: !69, line: 1303, column: 3)
!1524 = !DILocation(line: 1304, column: 4, scope: !1523)
!1525 = !DILocation(line: 1308, column: 4, scope: !1526)
!1526 = distinct !DILexicalBlock(scope: !1519, file: !69, line: 1307, column: 3)
!1527 = !DILocation(line: 1311, column: 1, scope: !1447)
!1528 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1329, type: !1529, scopeLine: 1330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1529 = !DISubroutineType(types: !1530)
!1530 = !{!25, !25, !428}
!1531 = !DILocalVariable(name: "numerator", arg: 1, scope: !1528, file: !69, line: 1329, type: !25)
!1532 = !DILocation(line: 1329, column: 25, scope: !1528)
!1533 = !DILocalVariable(name: "denominator", arg: 2, scope: !1528, file: !69, line: 1329, type: !428)
!1534 = !DILocation(line: 1329, column: 40, scope: !1528)
!1535 = !DILocalVariable(name: "s32Temp1", scope: !1528, file: !69, line: 1331, type: !25)
!1536 = !DILocation(line: 1331, column: 6, scope: !1528)
!1537 = !DILocalVariable(name: "s32Temp2", scope: !1528, file: !69, line: 1331, type: !25)
!1538 = !DILocation(line: 1331, column: 20, scope: !1528)
!1539 = !DILocalVariable(name: "u32Temp0", scope: !1528, file: !69, line: 1332, type: !428)
!1540 = !DILocation(line: 1332, column: 6, scope: !1528)
!1541 = !DILocalVariable(name: "u32Temp1", scope: !1528, file: !69, line: 1332, type: !428)
!1542 = !DILocation(line: 1332, column: 20, scope: !1528)
!1543 = !DILocalVariable(name: "u32Temp2", scope: !1528, file: !69, line: 1332, type: !428)
!1544 = !DILocation(line: 1332, column: 34, scope: !1528)
!1545 = !DILocation(line: 1333, column: 5, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1528, file: !69, line: 1333, column: 5)
!1547 = !DILocation(line: 1333, column: 17, scope: !1546)
!1548 = !DILocation(line: 1333, column: 5, scope: !1528)
!1549 = !DILocation(line: 1335, column: 6, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1551, file: !69, line: 1335, column: 6)
!1551 = distinct !DILexicalBlock(scope: !1546, file: !69, line: 1334, column: 2)
!1552 = !DILocation(line: 1335, column: 16, scope: !1550)
!1553 = !DILocation(line: 1335, column: 6, scope: !1551)
!1554 = !DILocation(line: 1337, column: 4, scope: !1555)
!1555 = distinct !DILexicalBlock(scope: !1550, file: !69, line: 1336, column: 3)
!1556 = !DILocation(line: 1341, column: 4, scope: !1557)
!1557 = distinct !DILexicalBlock(scope: !1550, file: !69, line: 1340, column: 3)
!1558 = !DILocation(line: 1346, column: 6, scope: !1559)
!1559 = distinct !DILexicalBlock(scope: !1560, file: !69, line: 1346, column: 6)
!1560 = distinct !DILexicalBlock(scope: !1546, file: !69, line: 1345, column: 2)
!1561 = !DILocation(line: 1346, column: 16, scope: !1559)
!1562 = !DILocation(line: 1346, column: 6, scope: !1560)
!1563 = !DILocation(line: 1348, column: 16, scope: !1564)
!1564 = distinct !DILexicalBlock(scope: !1559, file: !69, line: 1347, column: 3)
!1565 = !DILocation(line: 1348, column: 15, scope: !1564)
!1566 = !DILocation(line: 1348, column: 13, scope: !1564)
!1567 = !DILocation(line: 1349, column: 16, scope: !1564)
!1568 = !DILocation(line: 1349, column: 25, scope: !1564)
!1569 = !DILocation(line: 1349, column: 24, scope: !1564)
!1570 = !DILocation(line: 1349, column: 13, scope: !1564)
!1571 = !DILocation(line: 1350, column: 15, scope: !1564)
!1572 = !DILocation(line: 1350, column: 28, scope: !1564)
!1573 = !DILocation(line: 1350, column: 37, scope: !1564)
!1574 = !DILocation(line: 1350, column: 36, scope: !1564)
!1575 = !DILocation(line: 1350, column: 52, scope: !1564)
!1576 = !DILocation(line: 1350, column: 50, scope: !1564)
!1577 = !DILocation(line: 1350, column: 24, scope: !1564)
!1578 = !DILocation(line: 1350, column: 13, scope: !1564)
!1579 = !DILocation(line: 1352, column: 8, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1564, file: !69, line: 1352, column: 7)
!1581 = !DILocation(line: 1352, column: 20, scope: !1580)
!1582 = !DILocation(line: 1352, column: 27, scope: !1580)
!1583 = !DILocation(line: 1352, column: 7, scope: !1564)
!1584 = !DILocation(line: 1354, column: 20, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !1580, file: !69, line: 1353, column: 4)
!1586 = !DILocation(line: 1354, column: 32, scope: !1585)
!1587 = !DILocation(line: 1354, column: 17, scope: !1585)
!1588 = !DILocation(line: 1355, column: 4, scope: !1585)
!1589 = !DILocation(line: 1358, column: 20, scope: !1590)
!1590 = distinct !DILexicalBlock(scope: !1580, file: !69, line: 1357, column: 4)
!1591 = !DILocation(line: 1358, column: 32, scope: !1590)
!1592 = !DILocation(line: 1358, column: 38, scope: !1590)
!1593 = !DILocation(line: 1358, column: 17, scope: !1590)
!1594 = !DILocation(line: 1362, column: 7, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1564, file: !69, line: 1362, column: 7)
!1596 = !DILocation(line: 1362, column: 18, scope: !1595)
!1597 = !DILocation(line: 1362, column: 16, scope: !1595)
!1598 = !DILocation(line: 1362, column: 7, scope: !1564)
!1599 = !DILocation(line: 1364, column: 14, scope: !1600)
!1600 = distinct !DILexicalBlock(scope: !1595, file: !69, line: 1363, column: 4)
!1601 = !DILocation(line: 1364, column: 13, scope: !1600)
!1602 = !DILocation(line: 1364, column: 23, scope: !1600)
!1603 = !DILocation(line: 1364, column: 5, scope: !1600)
!1604 = !DILocation(line: 1368, column: 14, scope: !1605)
!1605 = distinct !DILexicalBlock(scope: !1595, file: !69, line: 1367, column: 4)
!1606 = !DILocation(line: 1368, column: 23, scope: !1605)
!1607 = !DILocation(line: 1368, column: 12, scope: !1605)
!1608 = !DILocation(line: 1368, column: 27, scope: !1605)
!1609 = !DILocation(line: 1368, column: 5, scope: !1605)
!1610 = !DILocation(line: 1375, column: 16, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1559, file: !69, line: 1374, column: 3)
!1612 = !DILocation(line: 1375, column: 30, scope: !1611)
!1613 = !DILocation(line: 1375, column: 40, scope: !1611)
!1614 = !DILocation(line: 1375, column: 39, scope: !1611)
!1615 = !DILocation(line: 1375, column: 55, scope: !1611)
!1616 = !DILocation(line: 1375, column: 53, scope: !1611)
!1617 = !DILocation(line: 1375, column: 26, scope: !1611)
!1618 = !DILocation(line: 1375, column: 69, scope: !1611)
!1619 = !DILocation(line: 1375, column: 13, scope: !1611)
!1620 = !DILocation(line: 1376, column: 16, scope: !1611)
!1621 = !DILocation(line: 1376, column: 26, scope: !1611)
!1622 = !DILocation(line: 1376, column: 25, scope: !1611)
!1623 = !DILocation(line: 1376, column: 42, scope: !1611)
!1624 = !DILocation(line: 1376, column: 51, scope: !1611)
!1625 = !DILocation(line: 1376, column: 50, scope: !1611)
!1626 = !DILocation(line: 1376, column: 39, scope: !1611)
!1627 = !DILocation(line: 1376, column: 13, scope: !1611)
!1628 = !DILocation(line: 1377, column: 11, scope: !1611)
!1629 = !DILocation(line: 1377, column: 4, scope: !1611)
!1630 = !DILocation(line: 1380, column: 1, scope: !1528)
!1631 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1397, type: !1632, scopeLine: 1398, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1632 = !DISubroutineType(types: !1633)
!1633 = !{!25, !25, !25}
!1634 = !DILocalVariable(name: "numerator", arg: 1, scope: !1631, file: !69, line: 1397, type: !25)
!1635 = !DILocation(line: 1397, column: 25, scope: !1631)
!1636 = !DILocalVariable(name: "denominator", arg: 2, scope: !1631, file: !69, line: 1397, type: !25)
!1637 = !DILocation(line: 1397, column: 40, scope: !1631)
!1638 = !DILocalVariable(name: "s32Temp1", scope: !1631, file: !69, line: 1399, type: !25)
!1639 = !DILocation(line: 1399, column: 6, scope: !1631)
!1640 = !DILocalVariable(name: "s32Temp2", scope: !1631, file: !69, line: 1399, type: !25)
!1641 = !DILocation(line: 1399, column: 20, scope: !1631)
!1642 = !DILocalVariable(name: "denominator_prime", scope: !1631, file: !69, line: 1400, type: !428)
!1643 = !DILocation(line: 1400, column: 6, scope: !1631)
!1644 = !DILocalVariable(name: "u32Temp1", scope: !1631, file: !69, line: 1400, type: !428)
!1645 = !DILocation(line: 1400, column: 29, scope: !1631)
!1646 = !DILocalVariable(name: "u32Temp2", scope: !1631, file: !69, line: 1400, type: !428)
!1647 = !DILocation(line: 1400, column: 43, scope: !1631)
!1648 = !DILocalVariable(name: "u32numerator", scope: !1631, file: !69, line: 1401, type: !428)
!1649 = !DILocation(line: 1401, column: 6, scope: !1631)
!1650 = !DILocalVariable(name: "u32denominator", scope: !1631, file: !69, line: 1401, type: !428)
!1651 = !DILocation(line: 1401, column: 23, scope: !1631)
!1652 = !DILocation(line: 1402, column: 5, scope: !1653)
!1653 = distinct !DILexicalBlock(scope: !1631, file: !69, line: 1402, column: 5)
!1654 = !DILocation(line: 1402, column: 15, scope: !1653)
!1655 = !DILocation(line: 1402, column: 5, scope: !1631)
!1656 = !DILocation(line: 1404, column: 6, scope: !1657)
!1657 = distinct !DILexicalBlock(scope: !1658, file: !69, line: 1404, column: 6)
!1658 = distinct !DILexicalBlock(scope: !1653, file: !69, line: 1403, column: 2)
!1659 = !DILocation(line: 1404, column: 18, scope: !1657)
!1660 = !DILocation(line: 1404, column: 6, scope: !1658)
!1661 = !DILocation(line: 1406, column: 7, scope: !1662)
!1662 = distinct !DILexicalBlock(scope: !1663, file: !69, line: 1406, column: 7)
!1663 = distinct !DILexicalBlock(scope: !1657, file: !69, line: 1405, column: 3)
!1664 = !DILocation(line: 1406, column: 19, scope: !1662)
!1665 = !DILocation(line: 1406, column: 7, scope: !1663)
!1666 = !DILocation(line: 1408, column: 5, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1662, file: !69, line: 1407, column: 4)
!1668 = !DILocation(line: 1412, column: 21, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1662, file: !69, line: 1411, column: 4)
!1670 = !DILocation(line: 1412, column: 20, scope: !1669)
!1671 = !DILocation(line: 1412, column: 18, scope: !1669)
!1672 = !DILocation(line: 1413, column: 23, scope: !1669)
!1673 = !DILocation(line: 1413, column: 22, scope: !1669)
!1674 = !DILocation(line: 1413, column: 20, scope: !1669)
!1675 = !DILocation(line: 1414, column: 16, scope: !1669)
!1676 = !DILocation(line: 1414, column: 33, scope: !1669)
!1677 = !DILocation(line: 1414, column: 46, scope: !1669)
!1678 = !DILocation(line: 1414, column: 45, scope: !1669)
!1679 = !DILocation(line: 1414, column: 64, scope: !1669)
!1680 = !DILocation(line: 1414, column: 62, scope: !1669)
!1681 = !DILocation(line: 1414, column: 29, scope: !1669)
!1682 = !DILocation(line: 1414, column: 81, scope: !1669)
!1683 = !DILocation(line: 1414, column: 14, scope: !1669)
!1684 = !DILocation(line: 1415, column: 17, scope: !1669)
!1685 = !DILocation(line: 1415, column: 30, scope: !1669)
!1686 = !DILocation(line: 1415, column: 29, scope: !1669)
!1687 = !DILocation(line: 1415, column: 49, scope: !1669)
!1688 = !DILocation(line: 1415, column: 58, scope: !1669)
!1689 = !DILocation(line: 1415, column: 57, scope: !1669)
!1690 = !DILocation(line: 1415, column: 46, scope: !1669)
!1691 = !DILocation(line: 1415, column: 14, scope: !1669)
!1692 = !DILocation(line: 1416, column: 8, scope: !1693)
!1693 = distinct !DILexicalBlock(scope: !1669, file: !69, line: 1416, column: 8)
!1694 = !DILocation(line: 1416, column: 17, scope: !1693)
!1695 = !DILocation(line: 1416, column: 8, scope: !1669)
!1696 = !DILocation(line: 1418, column: 13, scope: !1697)
!1697 = distinct !DILexicalBlock(scope: !1693, file: !69, line: 1417, column: 5)
!1698 = !DILocation(line: 1418, column: 6, scope: !1697)
!1699 = !DILocation(line: 1422, column: 6, scope: !1700)
!1700 = distinct !DILexicalBlock(scope: !1693, file: !69, line: 1421, column: 5)
!1701 = !DILocation(line: 1428, column: 20, scope: !1702)
!1702 = distinct !DILexicalBlock(scope: !1657, file: !69, line: 1427, column: 3)
!1703 = !DILocation(line: 1428, column: 19, scope: !1702)
!1704 = !DILocation(line: 1428, column: 29, scope: !1702)
!1705 = !DILocation(line: 1428, column: 17, scope: !1702)
!1706 = !DILocation(line: 1429, column: 16, scope: !1702)
!1707 = !DILocation(line: 1429, column: 33, scope: !1702)
!1708 = !DILocation(line: 1429, column: 46, scope: !1702)
!1709 = !DILocation(line: 1429, column: 45, scope: !1702)
!1710 = !DILocation(line: 1429, column: 61, scope: !1702)
!1711 = !DILocation(line: 1429, column: 59, scope: !1702)
!1712 = !DILocation(line: 1429, column: 29, scope: !1702)
!1713 = !DILocation(line: 1429, column: 75, scope: !1702)
!1714 = !DILocation(line: 1429, column: 13, scope: !1702)
!1715 = !DILocation(line: 1430, column: 16, scope: !1702)
!1716 = !DILocation(line: 1430, column: 29, scope: !1702)
!1717 = !DILocation(line: 1430, column: 28, scope: !1702)
!1718 = !DILocation(line: 1430, column: 45, scope: !1702)
!1719 = !DILocation(line: 1430, column: 54, scope: !1702)
!1720 = !DILocation(line: 1430, column: 53, scope: !1702)
!1721 = !DILocation(line: 1430, column: 42, scope: !1702)
!1722 = !DILocation(line: 1430, column: 13, scope: !1702)
!1723 = !DILocation(line: 1431, column: 13, scope: !1702)
!1724 = !DILocation(line: 1431, column: 12, scope: !1702)
!1725 = !DILocation(line: 1431, column: 22, scope: !1702)
!1726 = !DILocation(line: 1431, column: 4, scope: !1702)
!1727 = !DILocation(line: 1436, column: 6, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1729, file: !69, line: 1436, column: 6)
!1729 = distinct !DILexicalBlock(scope: !1653, file: !69, line: 1435, column: 2)
!1730 = !DILocation(line: 1436, column: 18, scope: !1728)
!1731 = !DILocation(line: 1436, column: 6, scope: !1729)
!1732 = !DILocation(line: 1438, column: 7, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1734, file: !69, line: 1438, column: 7)
!1734 = distinct !DILexicalBlock(scope: !1728, file: !69, line: 1437, column: 3)
!1735 = !DILocation(line: 1438, column: 19, scope: !1733)
!1736 = !DILocation(line: 1438, column: 7, scope: !1734)
!1737 = !DILocation(line: 1440, column: 5, scope: !1738)
!1738 = distinct !DILexicalBlock(scope: !1733, file: !69, line: 1439, column: 4)
!1739 = !DILocation(line: 1444, column: 23, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1733, file: !69, line: 1443, column: 4)
!1741 = !DILocation(line: 1444, column: 22, scope: !1740)
!1742 = !DILocation(line: 1444, column: 35, scope: !1740)
!1743 = !DILocation(line: 1444, column: 20, scope: !1740)
!1744 = !DILocation(line: 1445, column: 17, scope: !1740)
!1745 = !DILocation(line: 1445, column: 31, scope: !1740)
!1746 = !DILocation(line: 1445, column: 41, scope: !1740)
!1747 = !DILocation(line: 1445, column: 40, scope: !1740)
!1748 = !DILocation(line: 1445, column: 59, scope: !1740)
!1749 = !DILocation(line: 1445, column: 57, scope: !1740)
!1750 = !DILocation(line: 1445, column: 27, scope: !1740)
!1751 = !DILocation(line: 1445, column: 76, scope: !1740)
!1752 = !DILocation(line: 1445, column: 14, scope: !1740)
!1753 = !DILocation(line: 1446, column: 17, scope: !1740)
!1754 = !DILocation(line: 1446, column: 27, scope: !1740)
!1755 = !DILocation(line: 1446, column: 26, scope: !1740)
!1756 = !DILocation(line: 1446, column: 46, scope: !1740)
!1757 = !DILocation(line: 1446, column: 55, scope: !1740)
!1758 = !DILocation(line: 1446, column: 54, scope: !1740)
!1759 = !DILocation(line: 1446, column: 43, scope: !1740)
!1760 = !DILocation(line: 1446, column: 14, scope: !1740)
!1761 = !DILocation(line: 1447, column: 14, scope: !1740)
!1762 = !DILocation(line: 1447, column: 13, scope: !1740)
!1763 = !DILocation(line: 1447, column: 23, scope: !1740)
!1764 = !DILocation(line: 1447, column: 5, scope: !1740)
!1765 = !DILocation(line: 1452, column: 16, scope: !1766)
!1766 = distinct !DILexicalBlock(scope: !1728, file: !69, line: 1451, column: 3)
!1767 = !DILocation(line: 1452, column: 30, scope: !1766)
!1768 = !DILocation(line: 1452, column: 40, scope: !1766)
!1769 = !DILocation(line: 1452, column: 39, scope: !1766)
!1770 = !DILocation(line: 1452, column: 55, scope: !1766)
!1771 = !DILocation(line: 1452, column: 53, scope: !1766)
!1772 = !DILocation(line: 1452, column: 26, scope: !1766)
!1773 = !DILocation(line: 1452, column: 69, scope: !1766)
!1774 = !DILocation(line: 1452, column: 13, scope: !1766)
!1775 = !DILocation(line: 1453, column: 16, scope: !1766)
!1776 = !DILocation(line: 1453, column: 26, scope: !1766)
!1777 = !DILocation(line: 1453, column: 25, scope: !1766)
!1778 = !DILocation(line: 1453, column: 42, scope: !1766)
!1779 = !DILocation(line: 1453, column: 51, scope: !1766)
!1780 = !DILocation(line: 1453, column: 50, scope: !1766)
!1781 = !DILocation(line: 1453, column: 39, scope: !1766)
!1782 = !DILocation(line: 1453, column: 13, scope: !1766)
!1783 = !DILocation(line: 1454, column: 11, scope: !1766)
!1784 = !DILocation(line: 1454, column: 4, scope: !1766)
!1785 = !DILocation(line: 1457, column: 1, scope: !1631)
!1786 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1475, type: !1787, scopeLine: 1476, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1787 = !DISubroutineType(types: !1788)
!1788 = !{!6, !25, !428}
!1789 = !DILocalVariable(name: "numerator", arg: 1, scope: !1786, file: !69, line: 1475, type: !25)
!1790 = !DILocation(line: 1475, column: 25, scope: !1786)
!1791 = !DILocalVariable(name: "denominator", arg: 2, scope: !1786, file: !69, line: 1475, type: !428)
!1792 = !DILocation(line: 1475, column: 40, scope: !1786)
!1793 = !DILocalVariable(name: "numerator_prime", scope: !1786, file: !69, line: 1478, type: !428)
!1794 = !DILocation(line: 1478, column: 6, scope: !1786)
!1795 = !DILocalVariable(name: "u32Temp1", scope: !1786, file: !69, line: 1478, type: !428)
!1796 = !DILocation(line: 1478, column: 27, scope: !1786)
!1797 = !DILocalVariable(name: "u32Temp2", scope: !1786, file: !69, line: 1478, type: !428)
!1798 = !DILocation(line: 1478, column: 41, scope: !1786)
!1799 = !DILocalVariable(name: "u32Temp3", scope: !1786, file: !69, line: 1478, type: !428)
!1800 = !DILocation(line: 1478, column: 55, scope: !1786)
!1801 = !DILocalVariable(name: "s32Temp1", scope: !1786, file: !69, line: 1479, type: !25)
!1802 = !DILocation(line: 1479, column: 6, scope: !1786)
!1803 = !DILocalVariable(name: "s32Temp2", scope: !1786, file: !69, line: 1479, type: !25)
!1804 = !DILocation(line: 1479, column: 20, scope: !1786)
!1805 = !DILocalVariable(name: "s32Temp3", scope: !1786, file: !69, line: 1479, type: !25)
!1806 = !DILocation(line: 1479, column: 34, scope: !1786)
!1807 = !DILocation(line: 1480, column: 5, scope: !1808)
!1808 = distinct !DILexicalBlock(scope: !1786, file: !69, line: 1480, column: 5)
!1809 = !DILocation(line: 1480, column: 17, scope: !1808)
!1810 = !DILocation(line: 1480, column: 5, scope: !1786)
!1811 = !DILocation(line: 1482, column: 6, scope: !1812)
!1812 = distinct !DILexicalBlock(scope: !1813, file: !69, line: 1482, column: 6)
!1813 = distinct !DILexicalBlock(scope: !1808, file: !69, line: 1481, column: 2)
!1814 = !DILocation(line: 1482, column: 15, scope: !1812)
!1815 = !DILocation(line: 1482, column: 6, scope: !1813)
!1816 = !DILocation(line: 1484, column: 4, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1812, file: !69, line: 1483, column: 3)
!1818 = !DILocation(line: 1488, column: 4, scope: !1819)
!1819 = distinct !DILexicalBlock(scope: !1812, file: !69, line: 1487, column: 3)
!1820 = !DILocation(line: 1493, column: 6, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1822, file: !69, line: 1493, column: 6)
!1822 = distinct !DILexicalBlock(scope: !1808, file: !69, line: 1492, column: 2)
!1823 = !DILocation(line: 1493, column: 16, scope: !1821)
!1824 = !DILocation(line: 1493, column: 6, scope: !1822)
!1825 = !DILocation(line: 1495, column: 23, scope: !1826)
!1826 = distinct !DILexicalBlock(scope: !1821, file: !69, line: 1494, column: 3)
!1827 = !DILocation(line: 1495, column: 22, scope: !1826)
!1828 = !DILocation(line: 1495, column: 20, scope: !1826)
!1829 = !DILocation(line: 1496, column: 16, scope: !1826)
!1830 = !DILocation(line: 1496, column: 32, scope: !1826)
!1831 = !DILocation(line: 1496, column: 31, scope: !1826)
!1832 = !DILocation(line: 1496, column: 13, scope: !1826)
!1833 = !DILocation(line: 1497, column: 15, scope: !1826)
!1834 = !DILocation(line: 1497, column: 34, scope: !1826)
!1835 = !DILocation(line: 1497, column: 45, scope: !1826)
!1836 = !DILocation(line: 1497, column: 43, scope: !1826)
!1837 = !DILocation(line: 1497, column: 31, scope: !1826)
!1838 = !DILocation(line: 1497, column: 13, scope: !1826)
!1839 = !DILocation(line: 1499, column: 8, scope: !1840)
!1840 = distinct !DILexicalBlock(scope: !1826, file: !69, line: 1499, column: 7)
!1841 = !DILocation(line: 1499, column: 20, scope: !1840)
!1842 = !DILocation(line: 1499, column: 27, scope: !1840)
!1843 = !DILocation(line: 1499, column: 7, scope: !1826)
!1844 = !DILocation(line: 1501, column: 19, scope: !1845)
!1845 = distinct !DILexicalBlock(scope: !1840, file: !69, line: 1500, column: 4)
!1846 = !DILocation(line: 1501, column: 31, scope: !1845)
!1847 = !DILocation(line: 1501, column: 17, scope: !1845)
!1848 = !DILocation(line: 1502, column: 4, scope: !1845)
!1849 = !DILocation(line: 1505, column: 20, scope: !1850)
!1850 = distinct !DILexicalBlock(scope: !1840, file: !69, line: 1504, column: 4)
!1851 = !DILocation(line: 1505, column: 32, scope: !1850)
!1852 = !DILocation(line: 1505, column: 38, scope: !1850)
!1853 = !DILocation(line: 1505, column: 17, scope: !1850)
!1854 = !DILocation(line: 1508, column: 7, scope: !1855)
!1855 = distinct !DILexicalBlock(scope: !1826, file: !69, line: 1508, column: 7)
!1856 = !DILocation(line: 1508, column: 18, scope: !1855)
!1857 = !DILocation(line: 1508, column: 16, scope: !1855)
!1858 = !DILocation(line: 1508, column: 7, scope: !1826)
!1859 = !DILocation(line: 1510, column: 18, scope: !1860)
!1860 = distinct !DILexicalBlock(scope: !1855, file: !69, line: 1509, column: 4)
!1861 = !DILocation(line: 1510, column: 16, scope: !1860)
!1862 = !DILocation(line: 1510, column: 28, scope: !1860)
!1863 = !DILocation(line: 1510, column: 14, scope: !1860)
!1864 = !DILocation(line: 1511, column: 4, scope: !1860)
!1865 = !DILocation(line: 1514, column: 18, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1855, file: !69, line: 1513, column: 4)
!1867 = !DILocation(line: 1514, column: 26, scope: !1866)
!1868 = !DILocation(line: 1514, column: 16, scope: !1866)
!1869 = !DILocation(line: 1514, column: 30, scope: !1866)
!1870 = !DILocation(line: 1514, column: 14, scope: !1866)
!1871 = !DILocation(line: 1516, column: 8, scope: !1872)
!1872 = distinct !DILexicalBlock(scope: !1826, file: !69, line: 1516, column: 7)
!1873 = !DILocation(line: 1516, column: 18, scope: !1872)
!1874 = !DILocation(line: 1516, column: 7, scope: !1826)
!1875 = !DILocation(line: 1518, column: 18, scope: !1876)
!1876 = distinct !DILexicalBlock(scope: !1872, file: !69, line: 1517, column: 4)
!1877 = !DILocation(line: 1518, column: 12, scope: !1876)
!1878 = !DILocation(line: 1518, column: 5, scope: !1876)
!1879 = !DILocation(line: 1522, column: 5, scope: !1880)
!1880 = distinct !DILexicalBlock(scope: !1872, file: !69, line: 1521, column: 4)
!1881 = !DILocation(line: 1527, column: 16, scope: !1882)
!1882 = distinct !DILexicalBlock(scope: !1821, file: !69, line: 1526, column: 3)
!1883 = !DILocation(line: 1527, column: 26, scope: !1882)
!1884 = !DILocation(line: 1527, column: 25, scope: !1882)
!1885 = !DILocation(line: 1527, column: 41, scope: !1882)
!1886 = !DILocation(line: 1527, column: 39, scope: !1882)
!1887 = !DILocation(line: 1527, column: 13, scope: !1882)
!1888 = !DILocation(line: 1528, column: 16, scope: !1882)
!1889 = !DILocation(line: 1528, column: 30, scope: !1882)
!1890 = !DILocation(line: 1528, column: 40, scope: !1882)
!1891 = !DILocation(line: 1528, column: 39, scope: !1882)
!1892 = !DILocation(line: 1528, column: 55, scope: !1882)
!1893 = !DILocation(line: 1528, column: 53, scope: !1882)
!1894 = !DILocation(line: 1528, column: 26, scope: !1882)
!1895 = !DILocation(line: 1528, column: 68, scope: !1882)
!1896 = !DILocation(line: 1528, column: 13, scope: !1882)
!1897 = !DILocation(line: 1529, column: 16, scope: !1882)
!1898 = !DILocation(line: 1529, column: 25, scope: !1882)
!1899 = !DILocation(line: 1529, column: 24, scope: !1882)
!1900 = !DILocation(line: 1529, column: 41, scope: !1882)
!1901 = !DILocation(line: 1529, column: 51, scope: !1882)
!1902 = !DILocation(line: 1529, column: 50, scope: !1882)
!1903 = !DILocation(line: 1529, column: 38, scope: !1882)
!1904 = !DILocation(line: 1529, column: 13, scope: !1882)
!1905 = !DILocation(line: 1530, column: 7, scope: !1906)
!1906 = distinct !DILexicalBlock(scope: !1882, file: !69, line: 1530, column: 7)
!1907 = !DILocation(line: 1530, column: 16, scope: !1906)
!1908 = !DILocation(line: 1530, column: 7, scope: !1882)
!1909 = !DILocation(line: 1532, column: 17, scope: !1910)
!1910 = distinct !DILexicalBlock(scope: !1906, file: !69, line: 1531, column: 4)
!1911 = !DILocation(line: 1532, column: 12, scope: !1910)
!1912 = !DILocation(line: 1532, column: 5, scope: !1910)
!1913 = !DILocation(line: 1536, column: 5, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1906, file: !69, line: 1535, column: 4)
!1915 = !DILocation(line: 1540, column: 1, scope: !1786)
!1916 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1917, file: !1917, line: 12, type: !1918, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !34, retainedNodes: !1921)
!1917 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1918 = !DISubroutineType(types: !1919)
!1919 = !{null, !1920}
!1920 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1921 = !{!1922}
!1922 = !DILocalVariable(name: "z", arg: 1, scope: !1916, file: !1917, line: 12, type: !1920)
!1923 = !DILocation(line: 0, scope: !1916)
!1924 = !DILocation(line: 13, column: 9, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1916, file: !1917, line: 13, column: 7)
!1926 = !DILocation(line: 13, column: 7, scope: !1916)
!1927 = !DILocation(line: 14, column: 5, scope: !1925)
!1928 = !DILocation(line: 15, column: 1, scope: !1916)
