; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0138/build/u16_mul_s16_u16_div_u16_alarm_0138.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"factor1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"factor2\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [112 x i8] c"KLEE-ALARM-0138: signed overflow. assert -2147483648 <= (s32)(s32Result / (s32)denominator) * (s32)denominator;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0138.err\00", align 1
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
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 803, i8* getelementptr inbounds ([112 x i8], [112 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !875
  unreachable, !dbg !875

if.end21:                                         ; preds = %if.end
  %10 = load i32, i32* %s32Result, align 4, !dbg !877
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !878
  %conv22 = zext i16 %11 to i32, !dbg !879
  %int_cast_to_i642 = zext i32 %conv22 to i64, !dbg !880
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !880
  %div23 = sdiv i32 %10, %conv22, !dbg !880, !klee.check.div !106
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !881
  %conv24 = zext i16 %12 to i32, !dbg !882
  %mul25 = mul nsw i32 %div23, %conv24, !dbg !883
  %conv26 = sext i32 %mul25 to i64, !dbg !884
  store volatile i64 %conv26, i64* @klee_alarm_sink_s64, align 8, !dbg !885
  store i16 0, i16* %retval, align 2, !dbg !886
  br label %return, !dbg !886

return:                                           ; preds = %if.end21, %if.then12, %if.else, %if.then6
  %13 = load i16, i16* %retval, align 2, !dbg !887
  ret i16 %13, !dbg !887
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !888 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !891, metadata !DIExpression()), !dbg !892
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !893, metadata !DIExpression()), !dbg !894
  %0 = load i64, i64* %left.addr, align 8, !dbg !895
  %1 = load i64, i64* %right.addr, align 8, !dbg !896
  %mul = mul nsw i64 %0, %1, !dbg !897
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !898
  %conv = zext i1 %cmp to i32, !dbg !898
  ret i32 %conv, !dbg !899
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !900 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !901, metadata !DIExpression()), !dbg !902
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !903, metadata !DIExpression()), !dbg !904
  %0 = load i64, i64* %left.addr, align 8, !dbg !905
  %1 = load i64, i64* %right.addr, align 8, !dbg !906
  %mul = mul nsw i64 %0, %1, !dbg !907
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !908
  %conv = zext i1 %cmp to i32, !dbg !908
  ret i32 %conv, !dbg !909
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !910 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !913, metadata !DIExpression()), !dbg !914
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !915, metadata !DIExpression()), !dbg !916
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !917, metadata !DIExpression()), !dbg !918
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !919, metadata !DIExpression()), !dbg !920
  store i32 0, i32* %u32Temp1, align 4, !dbg !920
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !921, metadata !DIExpression()), !dbg !922
  store i16 0, i16* %u16TempDenom, align 2, !dbg !922
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !923
  %conv = zext i16 %0 to i32, !dbg !923
  %cmp = icmp eq i32 %conv, 0, !dbg !925
  br i1 %cmp, label %if.then, label %if.else, !dbg !926

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !927
  br label %return, !dbg !927

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !929
  %conv2 = zext i16 %1 to i32, !dbg !929
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !931
  %conv3 = zext i16 %2 to i32, !dbg !931
  %mul = mul nsw i32 %conv2, %conv3, !dbg !932
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !933
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !934
  %conv4 = zext i16 %3 to i32, !dbg !934
  %shr = ashr i32 %conv4, 1, !dbg !935
  %conv5 = trunc i32 %shr to i16, !dbg !934
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !936
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !937
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !938
  %conv6 = zext i16 %5 to i32, !dbg !938
  %add = add i32 %4, %conv6, !dbg !939
  store i32 %add, i32* %u32Temp1, align 4, !dbg !940
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !941
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !942
  %conv7 = zext i16 %7 to i32, !dbg !942
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !943
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !943
  %div = udiv i32 %6, %conv7, !dbg !943, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !944
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !945
  %cmp8 = icmp ult i32 %8, 65535, !dbg !947
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !948

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !949
  %and = and i32 %9, 65535, !dbg !951
  %conv11 = trunc i32 %and to i16, !dbg !952
  store i16 %conv11, i16* %retval, align 2, !dbg !953
  br label %return, !dbg !953

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !954
  br label %return, !dbg !954

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !956
  ret i16 %10, !dbg !956
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !957 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !960, metadata !DIExpression()), !dbg !961
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !962, metadata !DIExpression()), !dbg !963
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !964, metadata !DIExpression()), !dbg !965
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !966, metadata !DIExpression()), !dbg !967
  store i32 0, i32* %u32Temp1, align 4, !dbg !967
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !968
  %cmp = icmp eq i32 %0, 0, !dbg !970
  br i1 %cmp, label %if.then, label %if.else, !dbg !971

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !972
  br label %return, !dbg !972

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !974
  %conv = zext i16 %1 to i32, !dbg !974
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !976
  %conv1 = zext i16 %2 to i32, !dbg !976
  %mul = mul nsw i32 %conv, %conv1, !dbg !977
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !978
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !979
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !979
  %div = udiv i32 %mul, %3, !dbg !979, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !980
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !981
  %conv2 = zext i16 %4 to i32, !dbg !981
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !983
  %conv3 = zext i16 %5 to i32, !dbg !983
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !984
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !985
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !986
  %mul5 = mul i32 %6, %7, !dbg !987
  %sub = sub i32 %mul4, %mul5, !dbg !988
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !989
  %div6 = udiv i32 %8, 2, !dbg !990
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !991
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !992

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !993
  %inc = add i32 %9, 1, !dbg !993
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !993
  br label %if.end, !dbg !995

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !996
  %cmp10 = icmp ult i32 %10, 65535, !dbg !998
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !999

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1000
  %and = and i32 %11, 65535, !dbg !1002
  %conv13 = trunc i32 %and to i16, !dbg !1003
  store i16 %conv13, i16* %retval, align 2, !dbg !1004
  br label %return, !dbg !1004

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1005
  br label %return, !dbg !1005

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1007
  ret i16 %12, !dbg !1007
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1008 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1011, metadata !DIExpression()), !dbg !1012
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1013, metadata !DIExpression()), !dbg !1014
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1015, metadata !DIExpression()), !dbg !1016
  store i32 0, i32* %u32Temp1, align 4, !dbg !1016
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1017
  %conv = zext i16 %0 to i32, !dbg !1017
  %cmp = icmp eq i32 %conv, 0, !dbg !1019
  br i1 %cmp, label %if.then, label %if.else, !dbg !1020

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1021
  br label %return, !dbg !1021

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1023
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1025
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1026
  %conv2 = zext i16 %3 to i32, !dbg !1026
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1027
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1027
  %div = udiv i32 %2, %conv2, !dbg !1027, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1028
  %conv3 = zext i16 %4 to i32, !dbg !1028
  %mul = mul i32 %div, %conv3, !dbg !1029
  %sub = sub i32 %1, %mul, !dbg !1030
  %shl = shl i32 %sub, 1, !dbg !1031
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1032
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1033
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1034
  %conv4 = zext i16 %6 to i32, !dbg !1034
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1035
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1035
  %div5 = udiv i32 %5, %conv4, !dbg !1035, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1036
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1037
  %conv6 = zext i16 %8 to i32, !dbg !1037
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1038
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1038
  %div7 = udiv i32 %7, %conv6, !dbg !1038, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1039
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1040
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1041
  store i32 %9, i32* %retval, align 4, !dbg !1042
  br label %return, !dbg !1042

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1043
  ret i32 %10, !dbg !1043
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1044 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1047, metadata !DIExpression()), !dbg !1048
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1049, metadata !DIExpression()), !dbg !1050
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1051, metadata !DIExpression()), !dbg !1052
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1053, metadata !DIExpression()), !dbg !1054
  store i32 0, i32* %s32Temp1, align 4, !dbg !1054
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1055, metadata !DIExpression()), !dbg !1056
  store i32 0, i32* %s32Temp2, align 4, !dbg !1056
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1057, metadata !DIExpression()), !dbg !1058
  store i32 0, i32* %s32Temp3, align 4, !dbg !1058
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1059
  %conv = sext i16 %0 to i32, !dbg !1059
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1060
  %conv1 = sext i16 %1 to i32, !dbg !1060
  %mul = mul nsw i32 %conv, %conv1, !dbg !1061
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1062
  %2 = load i16, i16* %div.addr, align 2, !dbg !1063
  %conv2 = sext i16 %2 to i32, !dbg !1063
  %cmp = icmp eq i32 %conv2, 0, !dbg !1065
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1066

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1067
  %cmp4 = icmp slt i32 %3, 0, !dbg !1070
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1071

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1072
  br label %return, !dbg !1072

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1074
  br label %return, !dbg !1074

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1076
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1078
  %6 = load i16, i16* %div.addr, align 2, !dbg !1079
  %conv8 = sext i16 %6 to i32, !dbg !1079
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1080
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1080
  %div9 = sdiv i32 %5, %conv8, !dbg !1080, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1081
  %conv10 = sext i16 %7 to i32, !dbg !1081
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1082
  %sub = sub nsw i32 %4, %mul11, !dbg !1083
  %shl = shl i32 %sub, 1, !dbg !1084
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1085
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1086
  %9 = load i16, i16* %div.addr, align 2, !dbg !1087
  %conv12 = sext i16 %9 to i32, !dbg !1087
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1088
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1088
  %div13 = sdiv i32 %8, %conv12, !dbg !1088, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1089
  %11 = load i16, i16* %div.addr, align 2, !dbg !1090
  %conv14 = sext i16 %11 to i32, !dbg !1090
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1091
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1091
  %div15 = sdiv i32 %10, %conv14, !dbg !1091, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1092
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1093
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1094
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1096
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1097

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1098
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1101
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1102

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1103
  %conv22 = trunc i32 %14 to i16, !dbg !1105
  store i16 %conv22, i16* %retval, align 2, !dbg !1106
  br label %return, !dbg !1106

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1107
  br label %return, !dbg !1107

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1109
  br label %return, !dbg !1109

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1111
  ret i16 %15, !dbg !1111
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1112 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1115, metadata !DIExpression()), !dbg !1116
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1117, metadata !DIExpression()), !dbg !1118
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1119, metadata !DIExpression()), !dbg !1120
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1121, metadata !DIExpression()), !dbg !1122
  store i32 0, i32* %s32Result, align 4, !dbg !1122
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1123, metadata !DIExpression()), !dbg !1124
  store i32 0, i32* %s32Temp1, align 4, !dbg !1124
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1125
  %conv = sext i16 %0 to i32, !dbg !1125
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1126
  %conv1 = sext i16 %1 to i32, !dbg !1126
  %mul = mul nsw i32 %conv, %conv1, !dbg !1127
  store i32 %mul, i32* %s32Result, align 4, !dbg !1128
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1129
  %conv2 = zext i16 %2 to i32, !dbg !1129
  %cmp = icmp eq i32 %conv2, 0, !dbg !1131
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1132

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1133
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1136
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1137

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1138
  br label %return, !dbg !1138

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1140
  %cmp7 = icmp eq i32 %4, 0, !dbg !1142
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1143

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1144
  br label %return, !dbg !1144

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1146
  br label %return, !dbg !1146

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1148
  %6 = load i32, i32* %s32Result, align 4, !dbg !1150
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1151
  %conv12 = zext i16 %7 to i32, !dbg !1151
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1152
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1152
  %div = sdiv i32 %6, %conv12, !dbg !1152, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1153
  %conv13 = zext i16 %8 to i32, !dbg !1153
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1154
  %sub = sub nsw i32 %5, %mul14, !dbg !1155
  %shl = shl i32 %sub, 1, !dbg !1156
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1157
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1158
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1159
  %conv15 = zext i16 %10 to i32, !dbg !1159
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1160
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1160
  %div16 = sdiv i32 %9, %conv15, !dbg !1160, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1161
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1162
  %conv17 = zext i16 %12 to i32, !dbg !1162
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1163
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1163
  %div18 = sdiv i32 %11, %conv17, !dbg !1163, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1164
  store i32 %add, i32* %s32Result, align 4, !dbg !1165
  %13 = load i32, i32* %s32Result, align 4, !dbg !1166
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1168
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1169

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1170
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1173
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1174

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1175
  %conv25 = trunc i32 %15 to i16, !dbg !1177
  store i16 %conv25, i16* %retval, align 2, !dbg !1178
  br label %return, !dbg !1178

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1179
  br label %return, !dbg !1179

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1181
  br label %return, !dbg !1181

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1183
  ret i16 %16, !dbg !1183
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1184 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1187, metadata !DIExpression()), !dbg !1188
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1189, metadata !DIExpression()), !dbg !1190
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1191, metadata !DIExpression()), !dbg !1192
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1193
  %cmp = icmp eq i32 %0, 0, !dbg !1195
  br i1 %cmp, label %if.then, label %if.else, !dbg !1196

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1197
  br label %return, !dbg !1197

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1199
  %cmp1 = icmp sle i32 %1, 0, !dbg !1202
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1203

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1204
  br label %return, !dbg !1204

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1206
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1208
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1209
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1210
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1210
  %div = udiv i32 %3, %4, !dbg !1210, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1211
  %mul = mul i32 %div, %5, !dbg !1212
  %sub = sub i32 %2, %mul, !dbg !1213
  %shl = shl i32 %sub, 1, !dbg !1214
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1215
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1216
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1217
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1218
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1218
  %div4 = udiv i32 %6, %7, !dbg !1218, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1219
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1220
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1221
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1221
  %div5 = udiv i32 %8, %9, !dbg !1221, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1222
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1223
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1224
  store i32 %10, i32* %retval, align 4, !dbg !1225
  br label %return, !dbg !1225

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1226
  ret i32 %11, !dbg !1226
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1227 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1230, metadata !DIExpression()), !dbg !1231
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1232, metadata !DIExpression()), !dbg !1233
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1234, metadata !DIExpression()), !dbg !1235
  store i32 0, i32* %s32Temp1, align 4, !dbg !1235
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1236
  %cmp = icmp eq i32 %0, 0, !dbg !1238
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1239

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1240
  %cmp1 = icmp sge i32 %1, 0, !dbg !1243
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1244

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1245
  br label %return, !dbg !1245

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1247
  br label %return, !dbg !1247

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1249
  %cmp4 = icmp sge i32 %2, 0, !dbg !1252
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1253

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1254
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1256
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1257
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1258
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1258
  %div = udiv i32 %4, %5, !dbg !1258, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1259
  %mul = mul i32 %div, %6, !dbg !1260
  %sub = sub i32 %3, %mul, !dbg !1261
  %shl = shl i32 %sub, 1, !dbg !1262
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1263
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1264
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1265
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1266
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1266
  %div6 = udiv i32 %7, %8, !dbg !1266, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1267
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1268
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1269
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1269
  %div7 = udiv i32 %9, %10, !dbg !1269, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1270
  store i32 %add, i32* %retval, align 4, !dbg !1271
  br label %return, !dbg !1271

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1272
  br label %return, !dbg !1272

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1274
  ret i32 %11, !dbg !1274
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1275 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1278, metadata !DIExpression()), !dbg !1279
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1280, metadata !DIExpression()), !dbg !1281
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1282, metadata !DIExpression()), !dbg !1283
  store i32 0, i32* %u32Temp1, align 4, !dbg !1283
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1284, metadata !DIExpression()), !dbg !1285
  store i32 0, i32* %u32Temp2, align 4, !dbg !1285
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1286
  %cmp = icmp eq i32 %0, 0, !dbg !1288
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1289

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1290
  %cmp1 = icmp slt i32 %1, 0, !dbg !1293
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1294

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1295
  br label %return, !dbg !1295

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1297
  br label %return, !dbg !1297

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1299
  %cmp4 = icmp sge i32 %2, 0, !dbg !1302
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1303

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1304
  %cmp6 = icmp eq i32 %3, 0, !dbg !1307
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1308

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1309
  br label %return, !dbg !1309

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1311
  %cmp9 = icmp sle i32 %4, 0, !dbg !1314
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1315

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1316
  br label %return, !dbg !1316

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1318
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1320
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1321
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1322
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1322
  %div = sdiv i32 %6, %7, !dbg !1322, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1323
  %mul = mul nsw i32 %div, %8, !dbg !1324
  %sub = sub nsw i32 %5, %mul, !dbg !1325
  %shl = shl i32 %sub, 1, !dbg !1326
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1327
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1328
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1329
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1330
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1330
  %div12 = udiv i32 %9, %10, !dbg !1330, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1331
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1332
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1333
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1333
  %div13 = sdiv i32 %11, %12, !dbg !1333, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1334
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1335
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1336
  store i32 %13, i32* %retval, align 4, !dbg !1337
  br label %return, !dbg !1337

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1338
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1341
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1342

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1343
  br label %return, !dbg !1343

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1345
  %sub18 = sub nsw i32 0, %15, !dbg !1347
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1348
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1349
  %sub19 = sub nsw i32 0, %16, !dbg !1350
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1351
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1352
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1353
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1354
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1355
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1355
  %div20 = sdiv i32 %18, %19, !dbg !1355, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1356
  %mul21 = mul nsw i32 %div20, %20, !dbg !1357
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1358
  %shl23 = shl i32 %sub22, 1, !dbg !1359
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1360
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1361
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1362
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1363
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1363
  %div24 = udiv i32 %21, %22, !dbg !1363, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1364
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1365
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1366
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1366
  %div25 = sdiv i32 %23, %24, !dbg !1366, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1367
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1368
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1369
  store i32 %25, i32* %retval, align 4, !dbg !1370
  br label %return, !dbg !1370

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1371
  ret i32 %26, !dbg !1371
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1372 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1375, metadata !DIExpression()), !dbg !1376
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1377, metadata !DIExpression()), !dbg !1378
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1379, metadata !DIExpression()), !dbg !1380
  store i32 0, i32* %u32Temp1, align 4, !dbg !1380
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1381, metadata !DIExpression()), !dbg !1382
  store i32 0, i32* %u32Temp2, align 4, !dbg !1382
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1383, metadata !DIExpression()), !dbg !1384
  store i32 0, i32* %u32Temp3, align 4, !dbg !1384
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1385, metadata !DIExpression()), !dbg !1386
  store i32 0, i32* %numerator_old, align 4, !dbg !1386
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1387
  %cmp = icmp eq i32 %0, 0, !dbg !1389
  br i1 %cmp, label %if.then, label %if.else, !dbg !1390

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1391
  br label %return, !dbg !1391

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1393
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1395
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1396
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1397
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1398
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1398
  %div = udiv i32 %3, %4, !dbg !1398, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1399
  %sub = sub i32 %1, %mul, !dbg !1400
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1401
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1402
  %and = and i32 %5, 1, !dbg !1404
  %cmp1 = icmp eq i32 %and, 0, !dbg !1405
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1406

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1407
  %shr = lshr i32 %6, 1, !dbg !1409
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1410
  br label %if.end, !dbg !1411

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1412
  %shr4 = lshr i32 %7, 1, !dbg !1414
  %add = add i32 %shr4, 1, !dbg !1415
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1416
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1417
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1419
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1420
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1421

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1422
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1424
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1425
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1425
  %div7 = udiv i32 %10, %11, !dbg !1425, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1426
  br label %return, !dbg !1426

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1427
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1429
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1430
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1430
  %div9 = udiv i32 %12, %13, !dbg !1430, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1431
  store i32 %add10, i32* %retval, align 4, !dbg !1432
  br label %return, !dbg !1432

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1433
  ret i32 %14, !dbg !1433
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1434 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1437, metadata !DIExpression()), !dbg !1438
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1439, metadata !DIExpression()), !dbg !1440
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1441, metadata !DIExpression()), !dbg !1442
  store i32 0, i32* %u32Temp1, align 4, !dbg !1442
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1443, metadata !DIExpression()), !dbg !1444
  store i32 0, i32* %u32Temp2, align 4, !dbg !1444
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1445
  %cmp = icmp sle i32 %0, 0, !dbg !1447
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1448

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1449
  %cmp1 = icmp sge i32 %1, 0, !dbg !1452
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1453

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1454
  br label %return, !dbg !1454

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1456
  %sub = sub nsw i32 0, %2, !dbg !1458
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1459
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1460
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1461
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1462
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1463
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1463
  %div = udiv i32 %4, %5, !dbg !1463, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1464
  %mul = mul i32 %div, %6, !dbg !1465
  %sub3 = sub i32 %3, %mul, !dbg !1466
  %shl = shl i32 %sub3, 1, !dbg !1467
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1468
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1469
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1470
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1471
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1471
  %div4 = udiv i32 %7, %8, !dbg !1471, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1472
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1473
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1474
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1474
  %div5 = udiv i32 %9, %10, !dbg !1474, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1475
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1476
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1477
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1479
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1480

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1481
  %sub8 = sub i32 0, %12, !dbg !1483
  store i32 %sub8, i32* %retval, align 4, !dbg !1484
  br label %return, !dbg !1484

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1485
  br label %return, !dbg !1485

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1487
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1489
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1490
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1491
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1491
  %div11 = udiv i32 %14, %15, !dbg !1491, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1492
  %mul12 = mul i32 %div11, %16, !dbg !1493
  %sub13 = sub i32 %13, %mul12, !dbg !1494
  %shl14 = shl i32 %sub13, 1, !dbg !1495
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1496
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1497
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1498
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1499
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1499
  %div15 = udiv i32 %17, %18, !dbg !1499, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1500
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1501
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1502
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1502
  %div16 = udiv i32 %19, %20, !dbg !1502, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1503
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1504
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1505
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1507
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1508

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1509
  store i32 %22, i32* %retval, align 4, !dbg !1511
  br label %return, !dbg !1511

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1512
  br label %return, !dbg !1512

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1514
  ret i32 %23, !dbg !1514
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1515 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1518, metadata !DIExpression()), !dbg !1519
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1520, metadata !DIExpression()), !dbg !1521
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1522, metadata !DIExpression()), !dbg !1523
  store i32 0, i32* %s32Temp1, align 4, !dbg !1523
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1524, metadata !DIExpression()), !dbg !1525
  store i32 0, i32* %s32Temp2, align 4, !dbg !1525
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1526, metadata !DIExpression()), !dbg !1527
  store i32 0, i32* %u32Temp0, align 4, !dbg !1527
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1528, metadata !DIExpression()), !dbg !1529
  store i32 0, i32* %u32Temp1, align 4, !dbg !1529
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1530, metadata !DIExpression()), !dbg !1531
  store i32 0, i32* %u32Temp2, align 4, !dbg !1531
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1532
  %cmp = icmp eq i32 %0, 0, !dbg !1534
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1535

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1536
  %cmp1 = icmp slt i32 %1, 0, !dbg !1539
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1540

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1541
  br label %return, !dbg !1541

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1543
  br label %return, !dbg !1543

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1545
  %cmp4 = icmp sle i32 %2, 0, !dbg !1548
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1549

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1550
  %sub = sub nsw i32 0, %3, !dbg !1552
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1553
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1554
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1555
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1556
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1556
  %div = udiv i32 %4, %5, !dbg !1556, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1557
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1558
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1559
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1560
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1561
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1561
  %div6 = udiv i32 %7, %8, !dbg !1561, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1562
  %mul = mul i32 %div6, %9, !dbg !1563
  %sub7 = sub i32 %6, %mul, !dbg !1564
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1565
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1566
  %and = and i32 %10, 1, !dbg !1568
  %cmp8 = icmp eq i32 %and, 0, !dbg !1569
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1570

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1571
  %shr = lshr i32 %11, 1, !dbg !1573
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1574
  br label %if.end, !dbg !1575

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1576
  %shr11 = lshr i32 %12, 1, !dbg !1578
  %add = add i32 %shr11, 1, !dbg !1579
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1580
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1581
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1583
  %cmp12 = icmp ult i32 %13, %14, !dbg !1584
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1585

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1586
  %neg = xor i32 %15, -1, !dbg !1588
  %add14 = add i32 %neg, 1, !dbg !1589
  store i32 %add14, i32* %retval, align 4, !dbg !1590
  br label %return, !dbg !1590

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1591
  %add16 = add i32 %16, 1, !dbg !1593
  %neg17 = xor i32 %add16, -1, !dbg !1594
  %add18 = add i32 %neg17, 1, !dbg !1595
  store i32 %add18, i32* %retval, align 4, !dbg !1596
  br label %return, !dbg !1596

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1597
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1599
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1600
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1601
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1601
  %div20 = udiv i32 %18, %19, !dbg !1601, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1602
  %mul21 = mul i32 %div20, %20, !dbg !1603
  %sub22 = sub i32 %17, %mul21, !dbg !1604
  %shl = shl i32 %sub22, 1, !dbg !1605
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1606
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1607
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1608
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1609
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1609
  %div23 = udiv i32 %21, %22, !dbg !1609, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1610
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1611
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1612
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1612
  %div24 = udiv i32 %23, %24, !dbg !1612, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1613
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1614
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1615
  store i32 %25, i32* %retval, align 4, !dbg !1616
  br label %return, !dbg !1616

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1617
  ret i32 %26, !dbg !1617
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1618 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1621, metadata !DIExpression()), !dbg !1622
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1623, metadata !DIExpression()), !dbg !1624
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1625, metadata !DIExpression()), !dbg !1626
  store i32 0, i32* %s32Temp1, align 4, !dbg !1626
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1627, metadata !DIExpression()), !dbg !1628
  store i32 0, i32* %s32Temp2, align 4, !dbg !1628
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1629, metadata !DIExpression()), !dbg !1630
  store i32 0, i32* %denominator_prime, align 4, !dbg !1630
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1631, metadata !DIExpression()), !dbg !1632
  store i32 0, i32* %u32Temp1, align 4, !dbg !1632
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1633, metadata !DIExpression()), !dbg !1634
  store i32 0, i32* %u32Temp2, align 4, !dbg !1634
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1635, metadata !DIExpression()), !dbg !1636
  store i32 0, i32* %u32numerator, align 4, !dbg !1636
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1637, metadata !DIExpression()), !dbg !1638
  store i32 0, i32* %u32denominator, align 4, !dbg !1638
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1639
  %cmp = icmp slt i32 %0, 0, !dbg !1641
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1642

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1643
  %cmp1 = icmp sle i32 %1, 0, !dbg !1646
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1647

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1648
  %cmp3 = icmp sge i32 %2, 0, !dbg !1651
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1652

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1653
  br label %return, !dbg !1653

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1655
  %sub = sub nsw i32 0, %3, !dbg !1657
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1658
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1659
  %sub5 = sub nsw i32 0, %4, !dbg !1660
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1661
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1662
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1663
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1664
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1665
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1665
  %div = udiv i32 %6, %7, !dbg !1665, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1666
  %mul = mul i32 %div, %8, !dbg !1667
  %sub6 = sub i32 %5, %mul, !dbg !1668
  %shl = shl i32 %sub6, 1, !dbg !1669
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1670
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1671
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1672
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1673
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1673
  %div7 = udiv i32 %9, %10, !dbg !1673, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1674
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1675
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1676
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1676
  %div8 = udiv i32 %11, %12, !dbg !1676, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1677
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1678
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1679
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1681
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1682

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1683
  store i32 %14, i32* %retval, align 4, !dbg !1685
  br label %return, !dbg !1685

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1686
  br label %return, !dbg !1686

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1688
  %neg = xor i32 %15, -1, !dbg !1690
  %add13 = add nsw i32 %neg, 1, !dbg !1691
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1692
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1693
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1694
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1695
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1696
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1696
  %div14 = udiv i32 %17, %18, !dbg !1696, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1697
  %mul15 = mul i32 %div14, %19, !dbg !1698
  %sub16 = sub i32 %16, %mul15, !dbg !1699
  %shl17 = shl i32 %sub16, 1, !dbg !1700
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1701
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1702
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1703
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1704
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1704
  %div18 = udiv i32 %20, %21, !dbg !1704, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1705
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1706
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1707
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1707
  %div19 = sdiv i32 %22, %23, !dbg !1707, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1708
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1709
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1710
  %neg21 = xor i32 %24, -1, !dbg !1711
  %add22 = add nsw i32 %neg21, 1, !dbg !1712
  store i32 %add22, i32* %retval, align 4, !dbg !1713
  br label %return, !dbg !1713

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1714
  %cmp24 = icmp sle i32 %25, 0, !dbg !1717
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1718

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1719
  %cmp26 = icmp sge i32 %26, 0, !dbg !1722
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1723

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1724
  br label %return, !dbg !1724

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1726
  %neg29 = xor i32 %27, -1, !dbg !1728
  %add30 = add nsw i32 %neg29, 1, !dbg !1729
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1730
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1731
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1732
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1733
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1734
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1734
  %div31 = udiv i32 %29, %30, !dbg !1734, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1735
  %mul32 = mul i32 %div31, %31, !dbg !1736
  %sub33 = sub i32 %28, %mul32, !dbg !1737
  %shl34 = shl i32 %sub33, 1, !dbg !1738
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1739
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1740
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1741
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1742
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1742
  %div35 = udiv i32 %32, %33, !dbg !1742, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1743
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1744
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1745
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1745
  %div36 = udiv i32 %34, %35, !dbg !1745, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1746
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1747
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1748
  %neg38 = xor i32 %36, -1, !dbg !1749
  %add39 = add nsw i32 %neg38, 1, !dbg !1750
  store i32 %add39, i32* %retval, align 4, !dbg !1751
  br label %return, !dbg !1751

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1752
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1754
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1755
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1756
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1756
  %div41 = sdiv i32 %38, %39, !dbg !1756, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1757
  %mul42 = mul nsw i32 %div41, %40, !dbg !1758
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1759
  %shl44 = shl i32 %sub43, 1, !dbg !1760
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1761
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1762
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1763
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1764
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1764
  %div45 = sdiv i32 %41, %42, !dbg !1764, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1765
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1766
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1767
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1767
  %div46 = udiv i32 %43, %44, !dbg !1767, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1768
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1769
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1770
  store i32 %45, i32* %retval, align 4, !dbg !1771
  br label %return, !dbg !1771

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1772
  ret i32 %46, !dbg !1772
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1773 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1776, metadata !DIExpression()), !dbg !1777
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1778, metadata !DIExpression()), !dbg !1779
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1780, metadata !DIExpression()), !dbg !1781
  store i32 0, i32* %numerator_prime, align 4, !dbg !1781
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1782, metadata !DIExpression()), !dbg !1783
  store i32 0, i32* %u32Temp1, align 4, !dbg !1783
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1784, metadata !DIExpression()), !dbg !1785
  store i32 0, i32* %u32Temp2, align 4, !dbg !1785
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1786, metadata !DIExpression()), !dbg !1787
  store i32 0, i32* %u32Temp3, align 4, !dbg !1787
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1788, metadata !DIExpression()), !dbg !1789
  store i32 0, i32* %s32Temp1, align 4, !dbg !1789
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1790, metadata !DIExpression()), !dbg !1791
  store i32 0, i32* %s32Temp2, align 4, !dbg !1791
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1792, metadata !DIExpression()), !dbg !1793
  store i32 0, i32* %s32Temp3, align 4, !dbg !1793
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1794
  %cmp = icmp eq i32 %0, 0, !dbg !1796
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1797

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1798
  %cmp1 = icmp slt i32 %1, 0, !dbg !1801
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1802

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1803
  br label %return, !dbg !1803

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1805
  br label %return, !dbg !1805

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1807
  %cmp4 = icmp slt i32 %2, 0, !dbg !1810
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1811

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1812
  %sub = sub nsw i32 0, %3, !dbg !1814
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1815
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1816
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1817
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1818
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1818
  %div = udiv i32 %4, %5, !dbg !1818, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1819
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1820
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1821
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1822
  %mul = mul i32 %7, %8, !dbg !1823
  %sub6 = sub i32 %6, %mul, !dbg !1824
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1825
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1826
  %and = and i32 %9, 1, !dbg !1828
  %cmp7 = icmp eq i32 %and, 0, !dbg !1829
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1830

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1831
  %shr = lshr i32 %10, 1, !dbg !1833
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1834
  br label %if.end, !dbg !1835

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1836
  %shr10 = lshr i32 %11, 1, !dbg !1838
  %add = add i32 %shr10, 1, !dbg !1839
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1840
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1841
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1843
  %cmp11 = icmp ult i32 %12, %13, !dbg !1844
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1845

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1846
  %neg = xor i32 %14, -1, !dbg !1848
  %add13 = add i32 %neg, 1, !dbg !1849
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1850
  br label %if.end18, !dbg !1851

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1852
  %add15 = add i32 %15, 1, !dbg !1854
  %neg16 = xor i32 %add15, -1, !dbg !1855
  %add17 = add i32 %neg16, 1, !dbg !1856
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1857
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1858
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1860
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1861

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1862
  %conv = trunc i32 %17 to i16, !dbg !1864
  store i16 %conv, i16* %retval, align 2, !dbg !1865
  br label %return, !dbg !1865

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1866
  br label %return, !dbg !1866

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1868
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1870
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1871
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1871
  %div23 = udiv i32 %18, %19, !dbg !1871, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1872
  %mul24 = mul i32 %div23, %20, !dbg !1873
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1874
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1875
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1876
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1877
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1878
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1878
  %div25 = udiv i32 %22, %23, !dbg !1878, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1879
  %mul26 = mul i32 %div25, %24, !dbg !1880
  %sub27 = sub i32 %21, %mul26, !dbg !1881
  %shl = shl i32 %sub27, 1, !dbg !1882
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1883
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1884
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1885
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1886
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1886
  %div28 = udiv i32 %25, %26, !dbg !1886, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1887
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1888
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1889
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1889
  %div29 = udiv i32 %27, %28, !dbg !1889, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !1890
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1891
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1892
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1894
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1895

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1896
  %conv34 = trunc i32 %30 to i16, !dbg !1898
  store i16 %conv34, i16* %retval, align 2, !dbg !1899
  br label %return, !dbg !1899

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1900
  br label %return, !dbg !1900

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1902
  ret i16 %31, !dbg !1902
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1903 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1909, metadata !DIExpression()), !dbg !1910
  %2 = icmp eq i64 %0, 0, !dbg !1911
  br i1 %2, label %3, label %4, !dbg !1913

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1914
  unreachable, !dbg !1914

4:                                                ; preds = %1
  ret void, !dbg !1915
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0138/div_Ccode_alarm_0138.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0138")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0138")
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
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0138")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0138/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0138")
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
!44 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0138")
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_u16/alarm_0138")
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
!877 = !DILocation(line: 808, column: 41, scope: !852)
!878 = !DILocation(line: 808, column: 58, scope: !852)
!879 = !DILocation(line: 808, column: 53, scope: !852)
!880 = !DILocation(line: 808, column: 51, scope: !852)
!881 = !DILocation(line: 808, column: 78, scope: !852)
!882 = !DILocation(line: 808, column: 73, scope: !852)
!883 = !DILocation(line: 808, column: 71, scope: !852)
!884 = !DILocation(line: 808, column: 25, scope: !852)
!885 = !DILocation(line: 808, column: 23, scope: !852)
!886 = !DILocation(line: 809, column: 3, scope: !852)
!887 = !DILocation(line: 828, column: 1, scope: !820)
!888 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !30, file: !30, line: 78, type: !889, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!889 = !DISubroutineType(types: !890)
!890 = !{!28, !22, !22}
!891 = !DILocalVariable(name: "left", arg: 1, scope: !888, file: !30, line: 78, type: !22)
!892 = !DILocation(line: 78, column: 38, scope: !888)
!893 = !DILocalVariable(name: "right", arg: 2, scope: !888, file: !30, line: 78, type: !22)
!894 = !DILocation(line: 78, column: 52, scope: !888)
!895 = !DILocation(line: 80, column: 12, scope: !888)
!896 = !DILocation(line: 80, column: 19, scope: !888)
!897 = !DILocation(line: 80, column: 17, scope: !888)
!898 = !DILocation(line: 80, column: 25, scope: !888)
!899 = !DILocation(line: 80, column: 5, scope: !888)
!900 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !30, file: !30, line: 72, type: !889, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!901 = !DILocalVariable(name: "left", arg: 1, scope: !900, file: !30, line: 72, type: !22)
!902 = !DILocation(line: 72, column: 38, scope: !900)
!903 = !DILocalVariable(name: "right", arg: 2, scope: !900, file: !30, line: 72, type: !22)
!904 = !DILocation(line: 72, column: 52, scope: !900)
!905 = !DILocation(line: 74, column: 12, scope: !900)
!906 = !DILocation(line: 74, column: 19, scope: !900)
!907 = !DILocation(line: 74, column: 17, scope: !900)
!908 = !DILocation(line: 74, column: 25, scope: !900)
!909 = !DILocation(line: 74, column: 5, scope: !900)
!910 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 846, type: !911, scopeLine: 847, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!911 = !DISubroutineType(types: !912)
!912 = !{!18, !18, !18, !18}
!913 = !DILocalVariable(name: "factor1", arg: 1, scope: !910, file: !69, line: 846, type: !18)
!914 = !DILocation(line: 846, column: 33, scope: !910)
!915 = !DILocalVariable(name: "factor2", arg: 2, scope: !910, file: !69, line: 846, type: !18)
!916 = !DILocation(line: 846, column: 46, scope: !910)
!917 = !DILocalVariable(name: "denominator", arg: 3, scope: !910, file: !69, line: 846, type: !18)
!918 = !DILocation(line: 846, column: 59, scope: !910)
!919 = !DILocalVariable(name: "u32Temp1", scope: !910, file: !69, line: 848, type: !428)
!920 = !DILocation(line: 848, column: 6, scope: !910)
!921 = !DILocalVariable(name: "u16TempDenom", scope: !910, file: !69, line: 849, type: !18)
!922 = !DILocation(line: 849, column: 6, scope: !910)
!923 = !DILocation(line: 851, column: 5, scope: !924)
!924 = distinct !DILexicalBlock(scope: !910, file: !69, line: 851, column: 5)
!925 = !DILocation(line: 851, column: 17, scope: !924)
!926 = !DILocation(line: 851, column: 5, scope: !910)
!927 = !DILocation(line: 853, column: 3, scope: !928)
!928 = distinct !DILexicalBlock(scope: !924, file: !69, line: 852, column: 2)
!929 = !DILocation(line: 857, column: 14, scope: !930)
!930 = distinct !DILexicalBlock(scope: !924, file: !69, line: 856, column: 2)
!931 = !DILocation(line: 857, column: 24, scope: !930)
!932 = !DILocation(line: 857, column: 22, scope: !930)
!933 = !DILocation(line: 857, column: 12, scope: !930)
!934 = !DILocation(line: 858, column: 18, scope: !930)
!935 = !DILocation(line: 858, column: 30, scope: !930)
!936 = !DILocation(line: 858, column: 16, scope: !930)
!937 = !DILocation(line: 859, column: 14, scope: !930)
!938 = !DILocation(line: 859, column: 25, scope: !930)
!939 = !DILocation(line: 859, column: 23, scope: !930)
!940 = !DILocation(line: 859, column: 12, scope: !930)
!941 = !DILocation(line: 860, column: 14, scope: !930)
!942 = !DILocation(line: 860, column: 25, scope: !930)
!943 = !DILocation(line: 860, column: 23, scope: !930)
!944 = !DILocation(line: 860, column: 12, scope: !930)
!945 = !DILocation(line: 861, column: 6, scope: !946)
!946 = distinct !DILexicalBlock(scope: !930, file: !69, line: 861, column: 6)
!947 = !DILocation(line: 861, column: 15, scope: !946)
!948 = !DILocation(line: 861, column: 6, scope: !930)
!949 = !DILocation(line: 863, column: 12, scope: !950)
!950 = distinct !DILexicalBlock(scope: !946, file: !69, line: 862, column: 3)
!951 = !DILocation(line: 863, column: 21, scope: !950)
!952 = !DILocation(line: 863, column: 11, scope: !950)
!953 = !DILocation(line: 863, column: 4, scope: !950)
!954 = !DILocation(line: 868, column: 4, scope: !955)
!955 = distinct !DILexicalBlock(scope: !946, file: !69, line: 867, column: 3)
!956 = !DILocation(line: 873, column: 1, scope: !910)
!957 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 890, type: !958, scopeLine: 891, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!958 = !DISubroutineType(types: !959)
!959 = !{!18, !18, !18, !428}
!960 = !DILocalVariable(name: "factor1", arg: 1, scope: !957, file: !69, line: 890, type: !18)
!961 = !DILocation(line: 890, column: 33, scope: !957)
!962 = !DILocalVariable(name: "factor2", arg: 2, scope: !957, file: !69, line: 890, type: !18)
!963 = !DILocation(line: 890, column: 46, scope: !957)
!964 = !DILocalVariable(name: "denominator", arg: 3, scope: !957, file: !69, line: 890, type: !428)
!965 = !DILocation(line: 890, column: 59, scope: !957)
!966 = !DILocalVariable(name: "u32Temp1", scope: !957, file: !69, line: 892, type: !428)
!967 = !DILocation(line: 892, column: 6, scope: !957)
!968 = !DILocation(line: 893, column: 5, scope: !969)
!969 = distinct !DILexicalBlock(scope: !957, file: !69, line: 893, column: 5)
!970 = !DILocation(line: 893, column: 17, scope: !969)
!971 = !DILocation(line: 893, column: 5, scope: !957)
!972 = !DILocation(line: 895, column: 3, scope: !973)
!973 = distinct !DILexicalBlock(scope: !969, file: !69, line: 894, column: 2)
!974 = !DILocation(line: 899, column: 15, scope: !975)
!975 = distinct !DILexicalBlock(scope: !969, file: !69, line: 898, column: 2)
!976 = !DILocation(line: 899, column: 25, scope: !975)
!977 = !DILocation(line: 899, column: 23, scope: !975)
!978 = !DILocation(line: 899, column: 36, scope: !975)
!979 = !DILocation(line: 899, column: 34, scope: !975)
!980 = !DILocation(line: 899, column: 12, scope: !975)
!981 = !DILocation(line: 900, column: 8, scope: !982)
!982 = distinct !DILexicalBlock(scope: !975, file: !69, line: 900, column: 6)
!983 = !DILocation(line: 900, column: 18, scope: !982)
!984 = !DILocation(line: 900, column: 16, scope: !982)
!985 = !DILocation(line: 900, column: 28, scope: !982)
!986 = !DILocation(line: 900, column: 40, scope: !982)
!987 = !DILocation(line: 900, column: 39, scope: !982)
!988 = !DILocation(line: 900, column: 26, scope: !982)
!989 = !DILocation(line: 900, column: 53, scope: !982)
!990 = !DILocation(line: 900, column: 64, scope: !982)
!991 = !DILocation(line: 900, column: 50, scope: !982)
!992 = !DILocation(line: 900, column: 6, scope: !975)
!993 = !DILocation(line: 902, column: 12, scope: !994)
!994 = distinct !DILexicalBlock(scope: !982, file: !69, line: 901, column: 3)
!995 = !DILocation(line: 903, column: 3, scope: !994)
!996 = !DILocation(line: 904, column: 6, scope: !997)
!997 = distinct !DILexicalBlock(scope: !975, file: !69, line: 904, column: 6)
!998 = !DILocation(line: 904, column: 15, scope: !997)
!999 = !DILocation(line: 904, column: 6, scope: !975)
!1000 = !DILocation(line: 906, column: 12, scope: !1001)
!1001 = distinct !DILexicalBlock(scope: !997, file: !69, line: 905, column: 3)
!1002 = !DILocation(line: 906, column: 21, scope: !1001)
!1003 = !DILocation(line: 906, column: 11, scope: !1001)
!1004 = !DILocation(line: 906, column: 4, scope: !1001)
!1005 = !DILocation(line: 910, column: 4, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !997, file: !69, line: 909, column: 3)
!1007 = !DILocation(line: 913, column: 1, scope: !957)
!1008 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 930, type: !1009, scopeLine: 931, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1009 = !DISubroutineType(types: !1010)
!1010 = !{!428, !428, !18}
!1011 = !DILocalVariable(name: "x_value", arg: 1, scope: !1008, file: !69, line: 930, type: !428)
!1012 = !DILocation(line: 930, column: 25, scope: !1008)
!1013 = !DILocalVariable(name: "y_value", arg: 2, scope: !1008, file: !69, line: 930, type: !18)
!1014 = !DILocation(line: 930, column: 38, scope: !1008)
!1015 = !DILocalVariable(name: "u32Temp1", scope: !1008, file: !69, line: 932, type: !428)
!1016 = !DILocation(line: 932, column: 6, scope: !1008)
!1017 = !DILocation(line: 933, column: 5, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !1008, file: !69, line: 933, column: 5)
!1019 = !DILocation(line: 933, column: 13, scope: !1018)
!1020 = !DILocation(line: 933, column: 5, scope: !1008)
!1021 = !DILocation(line: 935, column: 3, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1018, file: !69, line: 934, column: 2)
!1023 = !DILocation(line: 939, column: 15, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1018, file: !69, line: 938, column: 2)
!1025 = !DILocation(line: 939, column: 26, scope: !1024)
!1026 = !DILocation(line: 939, column: 34, scope: !1024)
!1027 = !DILocation(line: 939, column: 33, scope: !1024)
!1028 = !DILocation(line: 939, column: 45, scope: !1024)
!1029 = !DILocation(line: 939, column: 43, scope: !1024)
!1030 = !DILocation(line: 939, column: 23, scope: !1024)
!1031 = !DILocation(line: 939, column: 54, scope: !1024)
!1032 = !DILocation(line: 939, column: 12, scope: !1024)
!1033 = !DILocation(line: 940, column: 15, scope: !1024)
!1034 = !DILocation(line: 940, column: 23, scope: !1024)
!1035 = !DILocation(line: 940, column: 22, scope: !1024)
!1036 = !DILocation(line: 940, column: 35, scope: !1024)
!1037 = !DILocation(line: 940, column: 44, scope: !1024)
!1038 = !DILocation(line: 940, column: 43, scope: !1024)
!1039 = !DILocation(line: 940, column: 32, scope: !1024)
!1040 = !DILocation(line: 940, column: 12, scope: !1024)
!1041 = !DILocation(line: 941, column: 10, scope: !1024)
!1042 = !DILocation(line: 941, column: 3, scope: !1024)
!1043 = !DILocation(line: 943, column: 1, scope: !1008)
!1044 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 961, type: !1045, scopeLine: 962, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1045 = !DISubroutineType(types: !1046)
!1046 = !{!6, !6, !6, !6}
!1047 = !DILocalVariable(name: "fak1", arg: 1, scope: !1044, file: !69, line: 961, type: !6)
!1048 = !DILocation(line: 961, column: 33, scope: !1044)
!1049 = !DILocalVariable(name: "fak2", arg: 2, scope: !1044, file: !69, line: 961, type: !6)
!1050 = !DILocation(line: 961, column: 43, scope: !1044)
!1051 = !DILocalVariable(name: "div", arg: 3, scope: !1044, file: !69, line: 961, type: !6)
!1052 = !DILocation(line: 961, column: 53, scope: !1044)
!1053 = !DILocalVariable(name: "s32Temp1", scope: !1044, file: !69, line: 963, type: !25)
!1054 = !DILocation(line: 963, column: 6, scope: !1044)
!1055 = !DILocalVariable(name: "s32Temp2", scope: !1044, file: !69, line: 963, type: !25)
!1056 = !DILocation(line: 963, column: 20, scope: !1044)
!1057 = !DILocalVariable(name: "s32Temp3", scope: !1044, file: !69, line: 963, type: !25)
!1058 = !DILocation(line: 963, column: 34, scope: !1044)
!1059 = !DILocation(line: 964, column: 13, scope: !1044)
!1060 = !DILocation(line: 964, column: 20, scope: !1044)
!1061 = !DILocation(line: 964, column: 18, scope: !1044)
!1062 = !DILocation(line: 964, column: 11, scope: !1044)
!1063 = !DILocation(line: 965, column: 5, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1044, file: !69, line: 965, column: 5)
!1065 = !DILocation(line: 965, column: 9, scope: !1064)
!1066 = !DILocation(line: 965, column: 5, scope: !1044)
!1067 = !DILocation(line: 967, column: 6, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1069, file: !69, line: 967, column: 6)
!1069 = distinct !DILexicalBlock(scope: !1064, file: !69, line: 966, column: 2)
!1070 = !DILocation(line: 967, column: 15, scope: !1068)
!1071 = !DILocation(line: 967, column: 6, scope: !1069)
!1072 = !DILocation(line: 969, column: 4, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1068, file: !69, line: 968, column: 3)
!1074 = !DILocation(line: 973, column: 4, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1068, file: !69, line: 972, column: 3)
!1076 = !DILocation(line: 978, column: 15, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1064, file: !69, line: 977, column: 2)
!1078 = !DILocation(line: 978, column: 28, scope: !1077)
!1079 = !DILocation(line: 978, column: 39, scope: !1077)
!1080 = !DILocation(line: 978, column: 37, scope: !1077)
!1081 = !DILocation(line: 978, column: 46, scope: !1077)
!1082 = !DILocation(line: 978, column: 44, scope: !1077)
!1083 = !DILocation(line: 978, column: 24, scope: !1077)
!1084 = !DILocation(line: 978, column: 52, scope: !1077)
!1085 = !DILocation(line: 978, column: 12, scope: !1077)
!1086 = !DILocation(line: 979, column: 15, scope: !1077)
!1087 = !DILocation(line: 979, column: 24, scope: !1077)
!1088 = !DILocation(line: 979, column: 23, scope: !1077)
!1089 = !DILocation(line: 979, column: 32, scope: !1077)
!1090 = !DILocation(line: 979, column: 41, scope: !1077)
!1091 = !DILocation(line: 979, column: 40, scope: !1077)
!1092 = !DILocation(line: 979, column: 29, scope: !1077)
!1093 = !DILocation(line: 979, column: 12, scope: !1077)
!1094 = !DILocation(line: 980, column: 6, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1077, file: !69, line: 980, column: 6)
!1096 = !DILocation(line: 980, column: 15, scope: !1095)
!1097 = !DILocation(line: 980, column: 6, scope: !1077)
!1098 = !DILocation(line: 982, column: 7, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1100, file: !69, line: 982, column: 7)
!1100 = distinct !DILexicalBlock(scope: !1095, file: !69, line: 981, column: 3)
!1101 = !DILocation(line: 982, column: 16, scope: !1099)
!1102 = !DILocation(line: 982, column: 7, scope: !1100)
!1103 = !DILocation(line: 984, column: 17, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1099, file: !69, line: 983, column: 4)
!1105 = !DILocation(line: 984, column: 12, scope: !1104)
!1106 = !DILocation(line: 984, column: 5, scope: !1104)
!1107 = !DILocation(line: 988, column: 5, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1099, file: !69, line: 987, column: 4)
!1109 = !DILocation(line: 993, column: 4, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1095, file: !69, line: 992, column: 3)
!1111 = !DILocation(line: 996, column: 1, scope: !1044)
!1112 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1014, type: !1113, scopeLine: 1015, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1113 = !DISubroutineType(types: !1114)
!1114 = !{!6, !6, !6, !18}
!1115 = !DILocalVariable(name: "data1", arg: 1, scope: !1112, file: !69, line: 1014, type: !6)
!1116 = !DILocation(line: 1014, column: 33, scope: !1112)
!1117 = !DILocalVariable(name: "data2", arg: 2, scope: !1112, file: !69, line: 1014, type: !6)
!1118 = !DILocation(line: 1014, column: 43, scope: !1112)
!1119 = !DILocalVariable(name: "denominator", arg: 3, scope: !1112, file: !69, line: 1014, type: !18)
!1120 = !DILocation(line: 1014, column: 53, scope: !1112)
!1121 = !DILocalVariable(name: "s32Result", scope: !1112, file: !69, line: 1016, type: !25)
!1122 = !DILocation(line: 1016, column: 6, scope: !1112)
!1123 = !DILocalVariable(name: "s32Temp1", scope: !1112, file: !69, line: 1016, type: !25)
!1124 = !DILocation(line: 1016, column: 21, scope: !1112)
!1125 = !DILocation(line: 1017, column: 14, scope: !1112)
!1126 = !DILocation(line: 1017, column: 22, scope: !1112)
!1127 = !DILocation(line: 1017, column: 20, scope: !1112)
!1128 = !DILocation(line: 1017, column: 12, scope: !1112)
!1129 = !DILocation(line: 1019, column: 5, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1112, file: !69, line: 1019, column: 5)
!1131 = !DILocation(line: 1019, column: 17, scope: !1130)
!1132 = !DILocation(line: 1019, column: 5, scope: !1112)
!1133 = !DILocation(line: 1021, column: 6, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1135, file: !69, line: 1021, column: 6)
!1135 = distinct !DILexicalBlock(scope: !1130, file: !69, line: 1020, column: 2)
!1136 = !DILocation(line: 1021, column: 16, scope: !1134)
!1137 = !DILocation(line: 1021, column: 6, scope: !1135)
!1138 = !DILocation(line: 1023, column: 4, scope: !1139)
!1139 = distinct !DILexicalBlock(scope: !1134, file: !69, line: 1022, column: 3)
!1140 = !DILocation(line: 1025, column: 11, scope: !1141)
!1141 = distinct !DILexicalBlock(scope: !1134, file: !69, line: 1025, column: 11)
!1142 = !DILocation(line: 1025, column: 21, scope: !1141)
!1143 = !DILocation(line: 1025, column: 11, scope: !1134)
!1144 = !DILocation(line: 1027, column: 4, scope: !1145)
!1145 = distinct !DILexicalBlock(scope: !1141, file: !69, line: 1026, column: 3)
!1146 = !DILocation(line: 1031, column: 4, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !1141, file: !69, line: 1030, column: 3)
!1148 = !DILocation(line: 1036, column: 15, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1130, file: !69, line: 1035, column: 2)
!1150 = !DILocation(line: 1036, column: 28, scope: !1149)
!1151 = !DILocation(line: 1036, column: 38, scope: !1149)
!1152 = !DILocation(line: 1036, column: 37, scope: !1149)
!1153 = !DILocation(line: 1036, column: 51, scope: !1149)
!1154 = !DILocation(line: 1036, column: 50, scope: !1149)
!1155 = !DILocation(line: 1036, column: 25, scope: !1149)
!1156 = !DILocation(line: 1036, column: 64, scope: !1149)
!1157 = !DILocation(line: 1036, column: 12, scope: !1149)
!1158 = !DILocation(line: 1037, column: 16, scope: !1149)
!1159 = !DILocation(line: 1037, column: 25, scope: !1149)
!1160 = !DILocation(line: 1037, column: 24, scope: !1149)
!1161 = !DILocation(line: 1037, column: 41, scope: !1149)
!1162 = !DILocation(line: 1037, column: 51, scope: !1149)
!1163 = !DILocation(line: 1037, column: 50, scope: !1149)
!1164 = !DILocation(line: 1037, column: 38, scope: !1149)
!1165 = !DILocation(line: 1037, column: 13, scope: !1149)
!1166 = !DILocation(line: 1038, column: 6, scope: !1167)
!1167 = distinct !DILexicalBlock(scope: !1149, file: !69, line: 1038, column: 6)
!1168 = !DILocation(line: 1038, column: 16, scope: !1167)
!1169 = !DILocation(line: 1038, column: 6, scope: !1149)
!1170 = !DILocation(line: 1040, column: 7, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1172, file: !69, line: 1040, column: 7)
!1172 = distinct !DILexicalBlock(scope: !1167, file: !69, line: 1039, column: 3)
!1173 = !DILocation(line: 1040, column: 17, scope: !1171)
!1174 = !DILocation(line: 1040, column: 7, scope: !1172)
!1175 = !DILocation(line: 1042, column: 17, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1171, file: !69, line: 1041, column: 4)
!1177 = !DILocation(line: 1042, column: 12, scope: !1176)
!1178 = !DILocation(line: 1042, column: 5, scope: !1176)
!1179 = !DILocation(line: 1046, column: 5, scope: !1180)
!1180 = distinct !DILexicalBlock(scope: !1171, file: !69, line: 1045, column: 4)
!1181 = !DILocation(line: 1051, column: 4, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1167, file: !69, line: 1050, column: 3)
!1183 = !DILocation(line: 1055, column: 1, scope: !1112)
!1184 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1072, type: !1185, scopeLine: 1073, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1185 = !DISubroutineType(types: !1186)
!1186 = !{!428, !428, !25}
!1187 = !DILocalVariable(name: "numerator", arg: 1, scope: !1184, file: !69, line: 1072, type: !428)
!1188 = !DILocation(line: 1072, column: 25, scope: !1184)
!1189 = !DILocalVariable(name: "denominator", arg: 2, scope: !1184, file: !69, line: 1072, type: !25)
!1190 = !DILocation(line: 1072, column: 40, scope: !1184)
!1191 = !DILocalVariable(name: "u32Temp1", scope: !1184, file: !69, line: 1074, type: !428)
!1192 = !DILocation(line: 1074, column: 6, scope: !1184)
!1193 = !DILocation(line: 1075, column: 5, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1184, file: !69, line: 1075, column: 5)
!1195 = !DILocation(line: 1075, column: 17, scope: !1194)
!1196 = !DILocation(line: 1075, column: 5, scope: !1184)
!1197 = !DILocation(line: 1077, column: 3, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1194, file: !69, line: 1076, column: 2)
!1199 = !DILocation(line: 1081, column: 6, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1201, file: !69, line: 1081, column: 6)
!1201 = distinct !DILexicalBlock(scope: !1194, file: !69, line: 1080, column: 2)
!1202 = !DILocation(line: 1081, column: 18, scope: !1200)
!1203 = !DILocation(line: 1081, column: 6, scope: !1201)
!1204 = !DILocation(line: 1083, column: 4, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1200, file: !69, line: 1082, column: 3)
!1206 = !DILocation(line: 1087, column: 16, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1200, file: !69, line: 1086, column: 3)
!1208 = !DILocation(line: 1087, column: 30, scope: !1207)
!1209 = !DILocation(line: 1087, column: 40, scope: !1207)
!1210 = !DILocation(line: 1087, column: 39, scope: !1207)
!1211 = !DILocation(line: 1087, column: 55, scope: !1207)
!1212 = !DILocation(line: 1087, column: 53, scope: !1207)
!1213 = !DILocation(line: 1087, column: 26, scope: !1207)
!1214 = !DILocation(line: 1087, column: 68, scope: !1207)
!1215 = !DILocation(line: 1087, column: 13, scope: !1207)
!1216 = !DILocation(line: 1088, column: 16, scope: !1207)
!1217 = !DILocation(line: 1088, column: 25, scope: !1207)
!1218 = !DILocation(line: 1088, column: 24, scope: !1207)
!1219 = !DILocation(line: 1088, column: 41, scope: !1207)
!1220 = !DILocation(line: 1088, column: 51, scope: !1207)
!1221 = !DILocation(line: 1088, column: 50, scope: !1207)
!1222 = !DILocation(line: 1088, column: 38, scope: !1207)
!1223 = !DILocation(line: 1088, column: 13, scope: !1207)
!1224 = !DILocation(line: 1089, column: 11, scope: !1207)
!1225 = !DILocation(line: 1089, column: 4, scope: !1207)
!1226 = !DILocation(line: 1092, column: 1, scope: !1184)
!1227 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1109, type: !1228, scopeLine: 1110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1228 = !DISubroutineType(types: !1229)
!1229 = !{!428, !25, !428}
!1230 = !DILocalVariable(name: "numerator", arg: 1, scope: !1227, file: !69, line: 1109, type: !25)
!1231 = !DILocation(line: 1109, column: 25, scope: !1227)
!1232 = !DILocalVariable(name: "denominator", arg: 2, scope: !1227, file: !69, line: 1109, type: !428)
!1233 = !DILocation(line: 1109, column: 40, scope: !1227)
!1234 = !DILocalVariable(name: "s32Temp1", scope: !1227, file: !69, line: 1111, type: !25)
!1235 = !DILocation(line: 1111, column: 6, scope: !1227)
!1236 = !DILocation(line: 1112, column: 5, scope: !1237)
!1237 = distinct !DILexicalBlock(scope: !1227, file: !69, line: 1112, column: 5)
!1238 = !DILocation(line: 1112, column: 17, scope: !1237)
!1239 = !DILocation(line: 1112, column: 5, scope: !1227)
!1240 = !DILocation(line: 1114, column: 6, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1242, file: !69, line: 1114, column: 6)
!1242 = distinct !DILexicalBlock(scope: !1237, file: !69, line: 1113, column: 2)
!1243 = !DILocation(line: 1114, column: 16, scope: !1241)
!1244 = !DILocation(line: 1114, column: 6, scope: !1242)
!1245 = !DILocation(line: 1116, column: 4, scope: !1246)
!1246 = distinct !DILexicalBlock(scope: !1241, file: !69, line: 1115, column: 3)
!1247 = !DILocation(line: 1120, column: 4, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1241, file: !69, line: 1119, column: 3)
!1249 = !DILocation(line: 1125, column: 6, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1251, file: !69, line: 1125, column: 6)
!1251 = distinct !DILexicalBlock(scope: !1237, file: !69, line: 1124, column: 2)
!1252 = !DILocation(line: 1125, column: 16, scope: !1250)
!1253 = !DILocation(line: 1125, column: 6, scope: !1251)
!1254 = !DILocation(line: 1127, column: 17, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1250, file: !69, line: 1126, column: 3)
!1256 = !DILocation(line: 1127, column: 31, scope: !1255)
!1257 = !DILocation(line: 1127, column: 41, scope: !1255)
!1258 = !DILocation(line: 1127, column: 40, scope: !1255)
!1259 = !DILocation(line: 1127, column: 56, scope: !1255)
!1260 = !DILocation(line: 1127, column: 54, scope: !1255)
!1261 = !DILocation(line: 1127, column: 27, scope: !1255)
!1262 = !DILocation(line: 1127, column: 69, scope: !1255)
!1263 = !DILocation(line: 1127, column: 13, scope: !1255)
!1264 = !DILocation(line: 1128, column: 13, scope: !1255)
!1265 = !DILocation(line: 1128, column: 23, scope: !1255)
!1266 = !DILocation(line: 1128, column: 22, scope: !1255)
!1267 = !DILocation(line: 1128, column: 39, scope: !1255)
!1268 = !DILocation(line: 1128, column: 48, scope: !1255)
!1269 = !DILocation(line: 1128, column: 47, scope: !1255)
!1270 = !DILocation(line: 1128, column: 36, scope: !1255)
!1271 = !DILocation(line: 1128, column: 4, scope: !1255)
!1272 = !DILocation(line: 1132, column: 4, scope: !1273)
!1273 = distinct !DILexicalBlock(scope: !1250, file: !69, line: 1131, column: 3)
!1274 = !DILocation(line: 1135, column: 1, scope: !1227)
!1275 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1152, type: !1276, scopeLine: 1153, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1276 = !DISubroutineType(types: !1277)
!1277 = !{!428, !25, !25}
!1278 = !DILocalVariable(name: "numerator", arg: 1, scope: !1275, file: !69, line: 1152, type: !25)
!1279 = !DILocation(line: 1152, column: 25, scope: !1275)
!1280 = !DILocalVariable(name: "denominator", arg: 2, scope: !1275, file: !69, line: 1152, type: !25)
!1281 = !DILocation(line: 1152, column: 40, scope: !1275)
!1282 = !DILocalVariable(name: "u32Temp1", scope: !1275, file: !69, line: 1154, type: !428)
!1283 = !DILocation(line: 1154, column: 6, scope: !1275)
!1284 = !DILocalVariable(name: "u32Temp2", scope: !1275, file: !69, line: 1154, type: !428)
!1285 = !DILocation(line: 1154, column: 20, scope: !1275)
!1286 = !DILocation(line: 1155, column: 5, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1275, file: !69, line: 1155, column: 5)
!1288 = !DILocation(line: 1155, column: 17, scope: !1287)
!1289 = !DILocation(line: 1155, column: 5, scope: !1275)
!1290 = !DILocation(line: 1157, column: 6, scope: !1291)
!1291 = distinct !DILexicalBlock(scope: !1292, file: !69, line: 1157, column: 6)
!1292 = distinct !DILexicalBlock(scope: !1287, file: !69, line: 1156, column: 2)
!1293 = !DILocation(line: 1157, column: 16, scope: !1291)
!1294 = !DILocation(line: 1157, column: 6, scope: !1292)
!1295 = !DILocation(line: 1159, column: 4, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1291, file: !69, line: 1158, column: 3)
!1297 = !DILocation(line: 1163, column: 4, scope: !1298)
!1298 = distinct !DILexicalBlock(scope: !1291, file: !69, line: 1162, column: 3)
!1299 = !DILocation(line: 1168, column: 6, scope: !1300)
!1300 = distinct !DILexicalBlock(scope: !1301, file: !69, line: 1168, column: 6)
!1301 = distinct !DILexicalBlock(scope: !1287, file: !69, line: 1167, column: 2)
!1302 = !DILocation(line: 1168, column: 16, scope: !1300)
!1303 = !DILocation(line: 1168, column: 6, scope: !1301)
!1304 = !DILocation(line: 1170, column: 7, scope: !1305)
!1305 = distinct !DILexicalBlock(scope: !1306, file: !69, line: 1170, column: 7)
!1306 = distinct !DILexicalBlock(scope: !1300, file: !69, line: 1169, column: 3)
!1307 = !DILocation(line: 1170, column: 17, scope: !1305)
!1308 = !DILocation(line: 1170, column: 7, scope: !1306)
!1309 = !DILocation(line: 1172, column: 5, scope: !1310)
!1310 = distinct !DILexicalBlock(scope: !1305, file: !69, line: 1171, column: 4)
!1311 = !DILocation(line: 1176, column: 8, scope: !1312)
!1312 = distinct !DILexicalBlock(scope: !1313, file: !69, line: 1176, column: 8)
!1313 = distinct !DILexicalBlock(scope: !1305, file: !69, line: 1175, column: 4)
!1314 = !DILocation(line: 1176, column: 20, scope: !1312)
!1315 = !DILocation(line: 1176, column: 8, scope: !1313)
!1316 = !DILocation(line: 1178, column: 6, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1312, file: !69, line: 1177, column: 5)
!1318 = !DILocation(line: 1182, column: 18, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1312, file: !69, line: 1181, column: 5)
!1320 = !DILocation(line: 1182, column: 32, scope: !1319)
!1321 = !DILocation(line: 1182, column: 42, scope: !1319)
!1322 = !DILocation(line: 1182, column: 41, scope: !1319)
!1323 = !DILocation(line: 1182, column: 57, scope: !1319)
!1324 = !DILocation(line: 1182, column: 55, scope: !1319)
!1325 = !DILocation(line: 1182, column: 28, scope: !1319)
!1326 = !DILocation(line: 1182, column: 71, scope: !1319)
!1327 = !DILocation(line: 1182, column: 15, scope: !1319)
!1328 = !DILocation(line: 1183, column: 18, scope: !1319)
!1329 = !DILocation(line: 1183, column: 29, scope: !1319)
!1330 = !DILocation(line: 1183, column: 27, scope: !1319)
!1331 = !DILocation(line: 1183, column: 45, scope: !1319)
!1332 = !DILocation(line: 1183, column: 57, scope: !1319)
!1333 = !DILocation(line: 1183, column: 55, scope: !1319)
!1334 = !DILocation(line: 1183, column: 42, scope: !1319)
!1335 = !DILocation(line: 1183, column: 15, scope: !1319)
!1336 = !DILocation(line: 1184, column: 13, scope: !1319)
!1337 = !DILocation(line: 1184, column: 6, scope: !1319)
!1338 = !DILocation(line: 1190, column: 7, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1340, file: !69, line: 1190, column: 7)
!1340 = distinct !DILexicalBlock(scope: !1300, file: !69, line: 1189, column: 3)
!1341 = !DILocation(line: 1190, column: 19, scope: !1339)
!1342 = !DILocation(line: 1190, column: 7, scope: !1340)
!1343 = !DILocation(line: 1192, column: 5, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1339, file: !69, line: 1191, column: 4)
!1345 = !DILocation(line: 1196, column: 18, scope: !1346)
!1346 = distinct !DILexicalBlock(scope: !1339, file: !69, line: 1195, column: 4)
!1347 = !DILocation(line: 1196, column: 17, scope: !1346)
!1348 = !DILocation(line: 1196, column: 15, scope: !1346)
!1349 = !DILocation(line: 1197, column: 20, scope: !1346)
!1350 = !DILocation(line: 1197, column: 19, scope: !1346)
!1351 = !DILocation(line: 1197, column: 17, scope: !1346)
!1352 = !DILocation(line: 1198, column: 17, scope: !1346)
!1353 = !DILocation(line: 1198, column: 31, scope: !1346)
!1354 = !DILocation(line: 1198, column: 41, scope: !1346)
!1355 = !DILocation(line: 1198, column: 40, scope: !1346)
!1356 = !DILocation(line: 1198, column: 56, scope: !1346)
!1357 = !DILocation(line: 1198, column: 54, scope: !1346)
!1358 = !DILocation(line: 1198, column: 27, scope: !1346)
!1359 = !DILocation(line: 1198, column: 70, scope: !1346)
!1360 = !DILocation(line: 1198, column: 14, scope: !1346)
!1361 = !DILocation(line: 1199, column: 17, scope: !1346)
!1362 = !DILocation(line: 1199, column: 28, scope: !1346)
!1363 = !DILocation(line: 1199, column: 26, scope: !1346)
!1364 = !DILocation(line: 1199, column: 44, scope: !1346)
!1365 = !DILocation(line: 1199, column: 56, scope: !1346)
!1366 = !DILocation(line: 1199, column: 54, scope: !1346)
!1367 = !DILocation(line: 1199, column: 41, scope: !1346)
!1368 = !DILocation(line: 1199, column: 14, scope: !1346)
!1369 = !DILocation(line: 1200, column: 12, scope: !1346)
!1370 = !DILocation(line: 1200, column: 5, scope: !1346)
!1371 = !DILocation(line: 1205, column: 1, scope: !1275)
!1372 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1222, type: !1373, scopeLine: 1223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1373 = !DISubroutineType(types: !1374)
!1374 = !{!428, !428, !428}
!1375 = !DILocalVariable(name: "numerator", arg: 1, scope: !1372, file: !69, line: 1222, type: !428)
!1376 = !DILocation(line: 1222, column: 25, scope: !1372)
!1377 = !DILocalVariable(name: "denominator", arg: 2, scope: !1372, file: !69, line: 1222, type: !428)
!1378 = !DILocation(line: 1222, column: 40, scope: !1372)
!1379 = !DILocalVariable(name: "u32Temp1", scope: !1372, file: !69, line: 1225, type: !428)
!1380 = !DILocation(line: 1225, column: 6, scope: !1372)
!1381 = !DILocalVariable(name: "u32Temp2", scope: !1372, file: !69, line: 1225, type: !428)
!1382 = !DILocation(line: 1225, column: 20, scope: !1372)
!1383 = !DILocalVariable(name: "u32Temp3", scope: !1372, file: !69, line: 1225, type: !428)
!1384 = !DILocation(line: 1225, column: 34, scope: !1372)
!1385 = !DILocalVariable(name: "numerator_old", scope: !1372, file: !69, line: 1225, type: !428)
!1386 = !DILocation(line: 1225, column: 48, scope: !1372)
!1387 = !DILocation(line: 1226, column: 5, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1372, file: !69, line: 1226, column: 5)
!1389 = !DILocation(line: 1226, column: 16, scope: !1388)
!1390 = !DILocation(line: 1226, column: 5, scope: !1372)
!1391 = !DILocation(line: 1228, column: 3, scope: !1392)
!1392 = distinct !DILexicalBlock(scope: !1388, file: !69, line: 1227, column: 2)
!1393 = !DILocation(line: 1232, column: 14, scope: !1394)
!1394 = distinct !DILexicalBlock(scope: !1388, file: !69, line: 1231, column: 2)
!1395 = !DILocation(line: 1232, column: 26, scope: !1394)
!1396 = !DILocation(line: 1232, column: 41, scope: !1394)
!1397 = !DILocation(line: 1232, column: 51, scope: !1394)
!1398 = !DILocation(line: 1232, column: 50, scope: !1394)
!1399 = !DILocation(line: 1232, column: 38, scope: !1394)
!1400 = !DILocation(line: 1232, column: 24, scope: !1394)
!1401 = !DILocation(line: 1232, column: 12, scope: !1394)
!1402 = !DILocation(line: 1233, column: 7, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1394, file: !69, line: 1233, column: 6)
!1404 = !DILocation(line: 1233, column: 16, scope: !1403)
!1405 = !DILocation(line: 1233, column: 24, scope: !1403)
!1406 = !DILocation(line: 1233, column: 6, scope: !1394)
!1407 = !DILocation(line: 1235, column: 16, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1403, file: !69, line: 1234, column: 3)
!1409 = !DILocation(line: 1235, column: 27, scope: !1408)
!1410 = !DILocation(line: 1235, column: 13, scope: !1408)
!1411 = !DILocation(line: 1236, column: 3, scope: !1408)
!1412 = !DILocation(line: 1239, column: 16, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !1403, file: !69, line: 1238, column: 3)
!1414 = !DILocation(line: 1239, column: 27, scope: !1413)
!1415 = !DILocation(line: 1239, column: 32, scope: !1413)
!1416 = !DILocation(line: 1239, column: 13, scope: !1413)
!1417 = !DILocation(line: 1242, column: 6, scope: !1418)
!1418 = distinct !DILexicalBlock(scope: !1394, file: !69, line: 1242, column: 6)
!1419 = !DILocation(line: 1242, column: 17, scope: !1418)
!1420 = !DILocation(line: 1242, column: 15, scope: !1418)
!1421 = !DILocation(line: 1242, column: 6, scope: !1394)
!1422 = !DILocation(line: 1244, column: 12, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1418, file: !69, line: 1243, column: 3)
!1424 = !DILocation(line: 1244, column: 22, scope: !1423)
!1425 = !DILocation(line: 1244, column: 21, scope: !1423)
!1426 = !DILocation(line: 1244, column: 4, scope: !1423)
!1427 = !DILocation(line: 1248, column: 13, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1418, file: !69, line: 1247, column: 3)
!1429 = !DILocation(line: 1248, column: 23, scope: !1428)
!1430 = !DILocation(line: 1248, column: 22, scope: !1428)
!1431 = !DILocation(line: 1248, column: 36, scope: !1428)
!1432 = !DILocation(line: 1248, column: 4, scope: !1428)
!1433 = !DILocation(line: 1253, column: 1, scope: !1372)
!1434 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1270, type: !1435, scopeLine: 1271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1435 = !DISubroutineType(types: !1436)
!1436 = !{!25, !428, !25}
!1437 = !DILocalVariable(name: "numerator", arg: 1, scope: !1434, file: !69, line: 1270, type: !428)
!1438 = !DILocation(line: 1270, column: 25, scope: !1434)
!1439 = !DILocalVariable(name: "denominator", arg: 2, scope: !1434, file: !69, line: 1270, type: !25)
!1440 = !DILocation(line: 1270, column: 40, scope: !1434)
!1441 = !DILocalVariable(name: "u32Temp1", scope: !1434, file: !69, line: 1272, type: !428)
!1442 = !DILocation(line: 1272, column: 6, scope: !1434)
!1443 = !DILocalVariable(name: "u32Temp2", scope: !1434, file: !69, line: 1272, type: !428)
!1444 = !DILocation(line: 1272, column: 20, scope: !1434)
!1445 = !DILocation(line: 1273, column: 5, scope: !1446)
!1446 = distinct !DILexicalBlock(scope: !1434, file: !69, line: 1273, column: 5)
!1447 = !DILocation(line: 1273, column: 17, scope: !1446)
!1448 = !DILocation(line: 1273, column: 5, scope: !1434)
!1449 = !DILocation(line: 1275, column: 6, scope: !1450)
!1450 = distinct !DILexicalBlock(scope: !1451, file: !69, line: 1275, column: 6)
!1451 = distinct !DILexicalBlock(scope: !1446, file: !69, line: 1274, column: 2)
!1452 = !DILocation(line: 1275, column: 18, scope: !1450)
!1453 = !DILocation(line: 1275, column: 6, scope: !1451)
!1454 = !DILocation(line: 1277, column: 4, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1450, file: !69, line: 1276, column: 3)
!1456 = !DILocation(line: 1281, column: 19, scope: !1457)
!1457 = distinct !DILexicalBlock(scope: !1450, file: !69, line: 1280, column: 3)
!1458 = !DILocation(line: 1281, column: 18, scope: !1457)
!1459 = !DILocation(line: 1281, column: 16, scope: !1457)
!1460 = !DILocation(line: 1282, column: 16, scope: !1457)
!1461 = !DILocation(line: 1282, column: 30, scope: !1457)
!1462 = !DILocation(line: 1282, column: 40, scope: !1457)
!1463 = !DILocation(line: 1282, column: 39, scope: !1457)
!1464 = !DILocation(line: 1282, column: 55, scope: !1457)
!1465 = !DILocation(line: 1282, column: 53, scope: !1457)
!1466 = !DILocation(line: 1282, column: 26, scope: !1457)
!1467 = !DILocation(line: 1282, column: 69, scope: !1457)
!1468 = !DILocation(line: 1282, column: 13, scope: !1457)
!1469 = !DILocation(line: 1283, column: 16, scope: !1457)
!1470 = !DILocation(line: 1283, column: 25, scope: !1457)
!1471 = !DILocation(line: 1283, column: 24, scope: !1457)
!1472 = !DILocation(line: 1283, column: 41, scope: !1457)
!1473 = !DILocation(line: 1283, column: 51, scope: !1457)
!1474 = !DILocation(line: 1283, column: 50, scope: !1457)
!1475 = !DILocation(line: 1283, column: 38, scope: !1457)
!1476 = !DILocation(line: 1283, column: 13, scope: !1457)
!1477 = !DILocation(line: 1284, column: 7, scope: !1478)
!1478 = distinct !DILexicalBlock(scope: !1457, file: !69, line: 1284, column: 7)
!1479 = !DILocation(line: 1284, column: 16, scope: !1478)
!1480 = !DILocation(line: 1284, column: 7, scope: !1457)
!1481 = !DILocation(line: 1286, column: 13, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1478, file: !69, line: 1285, column: 4)
!1483 = !DILocation(line: 1286, column: 12, scope: !1482)
!1484 = !DILocation(line: 1286, column: 5, scope: !1482)
!1485 = !DILocation(line: 1290, column: 5, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1478, file: !69, line: 1289, column: 4)
!1487 = !DILocation(line: 1296, column: 15, scope: !1488)
!1488 = distinct !DILexicalBlock(scope: !1446, file: !69, line: 1295, column: 2)
!1489 = !DILocation(line: 1296, column: 29, scope: !1488)
!1490 = !DILocation(line: 1296, column: 39, scope: !1488)
!1491 = !DILocation(line: 1296, column: 38, scope: !1488)
!1492 = !DILocation(line: 1296, column: 54, scope: !1488)
!1493 = !DILocation(line: 1296, column: 52, scope: !1488)
!1494 = !DILocation(line: 1296, column: 25, scope: !1488)
!1495 = !DILocation(line: 1296, column: 68, scope: !1488)
!1496 = !DILocation(line: 1296, column: 12, scope: !1488)
!1497 = !DILocation(line: 1297, column: 15, scope: !1488)
!1498 = !DILocation(line: 1297, column: 24, scope: !1488)
!1499 = !DILocation(line: 1297, column: 23, scope: !1488)
!1500 = !DILocation(line: 1297, column: 40, scope: !1488)
!1501 = !DILocation(line: 1297, column: 50, scope: !1488)
!1502 = !DILocation(line: 1297, column: 49, scope: !1488)
!1503 = !DILocation(line: 1297, column: 37, scope: !1488)
!1504 = !DILocation(line: 1297, column: 12, scope: !1488)
!1505 = !DILocation(line: 1298, column: 6, scope: !1506)
!1506 = distinct !DILexicalBlock(scope: !1488, file: !69, line: 1298, column: 6)
!1507 = !DILocation(line: 1298, column: 15, scope: !1506)
!1508 = !DILocation(line: 1298, column: 6, scope: !1488)
!1509 = !DILocation(line: 1300, column: 11, scope: !1510)
!1510 = distinct !DILexicalBlock(scope: !1506, file: !69, line: 1299, column: 3)
!1511 = !DILocation(line: 1300, column: 4, scope: !1510)
!1512 = !DILocation(line: 1304, column: 4, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1506, file: !69, line: 1303, column: 3)
!1514 = !DILocation(line: 1307, column: 1, scope: !1434)
!1515 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1325, type: !1516, scopeLine: 1326, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1516 = !DISubroutineType(types: !1517)
!1517 = !{!25, !25, !428}
!1518 = !DILocalVariable(name: "numerator", arg: 1, scope: !1515, file: !69, line: 1325, type: !25)
!1519 = !DILocation(line: 1325, column: 25, scope: !1515)
!1520 = !DILocalVariable(name: "denominator", arg: 2, scope: !1515, file: !69, line: 1325, type: !428)
!1521 = !DILocation(line: 1325, column: 40, scope: !1515)
!1522 = !DILocalVariable(name: "s32Temp1", scope: !1515, file: !69, line: 1327, type: !25)
!1523 = !DILocation(line: 1327, column: 6, scope: !1515)
!1524 = !DILocalVariable(name: "s32Temp2", scope: !1515, file: !69, line: 1327, type: !25)
!1525 = !DILocation(line: 1327, column: 20, scope: !1515)
!1526 = !DILocalVariable(name: "u32Temp0", scope: !1515, file: !69, line: 1328, type: !428)
!1527 = !DILocation(line: 1328, column: 6, scope: !1515)
!1528 = !DILocalVariable(name: "u32Temp1", scope: !1515, file: !69, line: 1328, type: !428)
!1529 = !DILocation(line: 1328, column: 20, scope: !1515)
!1530 = !DILocalVariable(name: "u32Temp2", scope: !1515, file: !69, line: 1328, type: !428)
!1531 = !DILocation(line: 1328, column: 34, scope: !1515)
!1532 = !DILocation(line: 1329, column: 5, scope: !1533)
!1533 = distinct !DILexicalBlock(scope: !1515, file: !69, line: 1329, column: 5)
!1534 = !DILocation(line: 1329, column: 17, scope: !1533)
!1535 = !DILocation(line: 1329, column: 5, scope: !1515)
!1536 = !DILocation(line: 1331, column: 6, scope: !1537)
!1537 = distinct !DILexicalBlock(scope: !1538, file: !69, line: 1331, column: 6)
!1538 = distinct !DILexicalBlock(scope: !1533, file: !69, line: 1330, column: 2)
!1539 = !DILocation(line: 1331, column: 16, scope: !1537)
!1540 = !DILocation(line: 1331, column: 6, scope: !1538)
!1541 = !DILocation(line: 1333, column: 4, scope: !1542)
!1542 = distinct !DILexicalBlock(scope: !1537, file: !69, line: 1332, column: 3)
!1543 = !DILocation(line: 1337, column: 4, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1537, file: !69, line: 1336, column: 3)
!1545 = !DILocation(line: 1342, column: 6, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1547, file: !69, line: 1342, column: 6)
!1547 = distinct !DILexicalBlock(scope: !1533, file: !69, line: 1341, column: 2)
!1548 = !DILocation(line: 1342, column: 16, scope: !1546)
!1549 = !DILocation(line: 1342, column: 6, scope: !1547)
!1550 = !DILocation(line: 1344, column: 16, scope: !1551)
!1551 = distinct !DILexicalBlock(scope: !1546, file: !69, line: 1343, column: 3)
!1552 = !DILocation(line: 1344, column: 15, scope: !1551)
!1553 = !DILocation(line: 1344, column: 13, scope: !1551)
!1554 = !DILocation(line: 1345, column: 16, scope: !1551)
!1555 = !DILocation(line: 1345, column: 25, scope: !1551)
!1556 = !DILocation(line: 1345, column: 24, scope: !1551)
!1557 = !DILocation(line: 1345, column: 13, scope: !1551)
!1558 = !DILocation(line: 1346, column: 15, scope: !1551)
!1559 = !DILocation(line: 1346, column: 28, scope: !1551)
!1560 = !DILocation(line: 1346, column: 37, scope: !1551)
!1561 = !DILocation(line: 1346, column: 36, scope: !1551)
!1562 = !DILocation(line: 1346, column: 52, scope: !1551)
!1563 = !DILocation(line: 1346, column: 50, scope: !1551)
!1564 = !DILocation(line: 1346, column: 24, scope: !1551)
!1565 = !DILocation(line: 1346, column: 13, scope: !1551)
!1566 = !DILocation(line: 1348, column: 8, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1551, file: !69, line: 1348, column: 7)
!1568 = !DILocation(line: 1348, column: 20, scope: !1567)
!1569 = !DILocation(line: 1348, column: 27, scope: !1567)
!1570 = !DILocation(line: 1348, column: 7, scope: !1551)
!1571 = !DILocation(line: 1350, column: 20, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1567, file: !69, line: 1349, column: 4)
!1573 = !DILocation(line: 1350, column: 32, scope: !1572)
!1574 = !DILocation(line: 1350, column: 17, scope: !1572)
!1575 = !DILocation(line: 1351, column: 4, scope: !1572)
!1576 = !DILocation(line: 1354, column: 20, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1567, file: !69, line: 1353, column: 4)
!1578 = !DILocation(line: 1354, column: 32, scope: !1577)
!1579 = !DILocation(line: 1354, column: 38, scope: !1577)
!1580 = !DILocation(line: 1354, column: 17, scope: !1577)
!1581 = !DILocation(line: 1358, column: 7, scope: !1582)
!1582 = distinct !DILexicalBlock(scope: !1551, file: !69, line: 1358, column: 7)
!1583 = !DILocation(line: 1358, column: 18, scope: !1582)
!1584 = !DILocation(line: 1358, column: 16, scope: !1582)
!1585 = !DILocation(line: 1358, column: 7, scope: !1551)
!1586 = !DILocation(line: 1360, column: 14, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1582, file: !69, line: 1359, column: 4)
!1588 = !DILocation(line: 1360, column: 13, scope: !1587)
!1589 = !DILocation(line: 1360, column: 23, scope: !1587)
!1590 = !DILocation(line: 1360, column: 5, scope: !1587)
!1591 = !DILocation(line: 1364, column: 14, scope: !1592)
!1592 = distinct !DILexicalBlock(scope: !1582, file: !69, line: 1363, column: 4)
!1593 = !DILocation(line: 1364, column: 23, scope: !1592)
!1594 = !DILocation(line: 1364, column: 12, scope: !1592)
!1595 = !DILocation(line: 1364, column: 27, scope: !1592)
!1596 = !DILocation(line: 1364, column: 5, scope: !1592)
!1597 = !DILocation(line: 1371, column: 16, scope: !1598)
!1598 = distinct !DILexicalBlock(scope: !1546, file: !69, line: 1370, column: 3)
!1599 = !DILocation(line: 1371, column: 30, scope: !1598)
!1600 = !DILocation(line: 1371, column: 40, scope: !1598)
!1601 = !DILocation(line: 1371, column: 39, scope: !1598)
!1602 = !DILocation(line: 1371, column: 55, scope: !1598)
!1603 = !DILocation(line: 1371, column: 53, scope: !1598)
!1604 = !DILocation(line: 1371, column: 26, scope: !1598)
!1605 = !DILocation(line: 1371, column: 69, scope: !1598)
!1606 = !DILocation(line: 1371, column: 13, scope: !1598)
!1607 = !DILocation(line: 1372, column: 16, scope: !1598)
!1608 = !DILocation(line: 1372, column: 26, scope: !1598)
!1609 = !DILocation(line: 1372, column: 25, scope: !1598)
!1610 = !DILocation(line: 1372, column: 42, scope: !1598)
!1611 = !DILocation(line: 1372, column: 51, scope: !1598)
!1612 = !DILocation(line: 1372, column: 50, scope: !1598)
!1613 = !DILocation(line: 1372, column: 39, scope: !1598)
!1614 = !DILocation(line: 1372, column: 13, scope: !1598)
!1615 = !DILocation(line: 1373, column: 11, scope: !1598)
!1616 = !DILocation(line: 1373, column: 4, scope: !1598)
!1617 = !DILocation(line: 1376, column: 1, scope: !1515)
!1618 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1393, type: !1619, scopeLine: 1394, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1619 = !DISubroutineType(types: !1620)
!1620 = !{!25, !25, !25}
!1621 = !DILocalVariable(name: "numerator", arg: 1, scope: !1618, file: !69, line: 1393, type: !25)
!1622 = !DILocation(line: 1393, column: 25, scope: !1618)
!1623 = !DILocalVariable(name: "denominator", arg: 2, scope: !1618, file: !69, line: 1393, type: !25)
!1624 = !DILocation(line: 1393, column: 40, scope: !1618)
!1625 = !DILocalVariable(name: "s32Temp1", scope: !1618, file: !69, line: 1395, type: !25)
!1626 = !DILocation(line: 1395, column: 6, scope: !1618)
!1627 = !DILocalVariable(name: "s32Temp2", scope: !1618, file: !69, line: 1395, type: !25)
!1628 = !DILocation(line: 1395, column: 20, scope: !1618)
!1629 = !DILocalVariable(name: "denominator_prime", scope: !1618, file: !69, line: 1396, type: !428)
!1630 = !DILocation(line: 1396, column: 6, scope: !1618)
!1631 = !DILocalVariable(name: "u32Temp1", scope: !1618, file: !69, line: 1396, type: !428)
!1632 = !DILocation(line: 1396, column: 29, scope: !1618)
!1633 = !DILocalVariable(name: "u32Temp2", scope: !1618, file: !69, line: 1396, type: !428)
!1634 = !DILocation(line: 1396, column: 43, scope: !1618)
!1635 = !DILocalVariable(name: "u32numerator", scope: !1618, file: !69, line: 1397, type: !428)
!1636 = !DILocation(line: 1397, column: 6, scope: !1618)
!1637 = !DILocalVariable(name: "u32denominator", scope: !1618, file: !69, line: 1397, type: !428)
!1638 = !DILocation(line: 1397, column: 23, scope: !1618)
!1639 = !DILocation(line: 1398, column: 5, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1618, file: !69, line: 1398, column: 5)
!1641 = !DILocation(line: 1398, column: 15, scope: !1640)
!1642 = !DILocation(line: 1398, column: 5, scope: !1618)
!1643 = !DILocation(line: 1400, column: 6, scope: !1644)
!1644 = distinct !DILexicalBlock(scope: !1645, file: !69, line: 1400, column: 6)
!1645 = distinct !DILexicalBlock(scope: !1640, file: !69, line: 1399, column: 2)
!1646 = !DILocation(line: 1400, column: 18, scope: !1644)
!1647 = !DILocation(line: 1400, column: 6, scope: !1645)
!1648 = !DILocation(line: 1402, column: 7, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1650, file: !69, line: 1402, column: 7)
!1650 = distinct !DILexicalBlock(scope: !1644, file: !69, line: 1401, column: 3)
!1651 = !DILocation(line: 1402, column: 19, scope: !1649)
!1652 = !DILocation(line: 1402, column: 7, scope: !1650)
!1653 = !DILocation(line: 1404, column: 5, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1649, file: !69, line: 1403, column: 4)
!1655 = !DILocation(line: 1408, column: 21, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1649, file: !69, line: 1407, column: 4)
!1657 = !DILocation(line: 1408, column: 20, scope: !1656)
!1658 = !DILocation(line: 1408, column: 18, scope: !1656)
!1659 = !DILocation(line: 1409, column: 23, scope: !1656)
!1660 = !DILocation(line: 1409, column: 22, scope: !1656)
!1661 = !DILocation(line: 1409, column: 20, scope: !1656)
!1662 = !DILocation(line: 1410, column: 16, scope: !1656)
!1663 = !DILocation(line: 1410, column: 33, scope: !1656)
!1664 = !DILocation(line: 1410, column: 46, scope: !1656)
!1665 = !DILocation(line: 1410, column: 45, scope: !1656)
!1666 = !DILocation(line: 1410, column: 64, scope: !1656)
!1667 = !DILocation(line: 1410, column: 62, scope: !1656)
!1668 = !DILocation(line: 1410, column: 29, scope: !1656)
!1669 = !DILocation(line: 1410, column: 81, scope: !1656)
!1670 = !DILocation(line: 1410, column: 14, scope: !1656)
!1671 = !DILocation(line: 1411, column: 17, scope: !1656)
!1672 = !DILocation(line: 1411, column: 30, scope: !1656)
!1673 = !DILocation(line: 1411, column: 29, scope: !1656)
!1674 = !DILocation(line: 1411, column: 49, scope: !1656)
!1675 = !DILocation(line: 1411, column: 58, scope: !1656)
!1676 = !DILocation(line: 1411, column: 57, scope: !1656)
!1677 = !DILocation(line: 1411, column: 46, scope: !1656)
!1678 = !DILocation(line: 1411, column: 14, scope: !1656)
!1679 = !DILocation(line: 1412, column: 8, scope: !1680)
!1680 = distinct !DILexicalBlock(scope: !1656, file: !69, line: 1412, column: 8)
!1681 = !DILocation(line: 1412, column: 17, scope: !1680)
!1682 = !DILocation(line: 1412, column: 8, scope: !1656)
!1683 = !DILocation(line: 1414, column: 13, scope: !1684)
!1684 = distinct !DILexicalBlock(scope: !1680, file: !69, line: 1413, column: 5)
!1685 = !DILocation(line: 1414, column: 6, scope: !1684)
!1686 = !DILocation(line: 1418, column: 6, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1680, file: !69, line: 1417, column: 5)
!1688 = !DILocation(line: 1424, column: 20, scope: !1689)
!1689 = distinct !DILexicalBlock(scope: !1644, file: !69, line: 1423, column: 3)
!1690 = !DILocation(line: 1424, column: 19, scope: !1689)
!1691 = !DILocation(line: 1424, column: 29, scope: !1689)
!1692 = !DILocation(line: 1424, column: 17, scope: !1689)
!1693 = !DILocation(line: 1425, column: 16, scope: !1689)
!1694 = !DILocation(line: 1425, column: 33, scope: !1689)
!1695 = !DILocation(line: 1425, column: 46, scope: !1689)
!1696 = !DILocation(line: 1425, column: 45, scope: !1689)
!1697 = !DILocation(line: 1425, column: 61, scope: !1689)
!1698 = !DILocation(line: 1425, column: 59, scope: !1689)
!1699 = !DILocation(line: 1425, column: 29, scope: !1689)
!1700 = !DILocation(line: 1425, column: 75, scope: !1689)
!1701 = !DILocation(line: 1425, column: 13, scope: !1689)
!1702 = !DILocation(line: 1426, column: 16, scope: !1689)
!1703 = !DILocation(line: 1426, column: 29, scope: !1689)
!1704 = !DILocation(line: 1426, column: 28, scope: !1689)
!1705 = !DILocation(line: 1426, column: 45, scope: !1689)
!1706 = !DILocation(line: 1426, column: 54, scope: !1689)
!1707 = !DILocation(line: 1426, column: 53, scope: !1689)
!1708 = !DILocation(line: 1426, column: 42, scope: !1689)
!1709 = !DILocation(line: 1426, column: 13, scope: !1689)
!1710 = !DILocation(line: 1427, column: 13, scope: !1689)
!1711 = !DILocation(line: 1427, column: 12, scope: !1689)
!1712 = !DILocation(line: 1427, column: 22, scope: !1689)
!1713 = !DILocation(line: 1427, column: 4, scope: !1689)
!1714 = !DILocation(line: 1432, column: 6, scope: !1715)
!1715 = distinct !DILexicalBlock(scope: !1716, file: !69, line: 1432, column: 6)
!1716 = distinct !DILexicalBlock(scope: !1640, file: !69, line: 1431, column: 2)
!1717 = !DILocation(line: 1432, column: 18, scope: !1715)
!1718 = !DILocation(line: 1432, column: 6, scope: !1716)
!1719 = !DILocation(line: 1434, column: 7, scope: !1720)
!1720 = distinct !DILexicalBlock(scope: !1721, file: !69, line: 1434, column: 7)
!1721 = distinct !DILexicalBlock(scope: !1715, file: !69, line: 1433, column: 3)
!1722 = !DILocation(line: 1434, column: 19, scope: !1720)
!1723 = !DILocation(line: 1434, column: 7, scope: !1721)
!1724 = !DILocation(line: 1436, column: 5, scope: !1725)
!1725 = distinct !DILexicalBlock(scope: !1720, file: !69, line: 1435, column: 4)
!1726 = !DILocation(line: 1440, column: 23, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1720, file: !69, line: 1439, column: 4)
!1728 = !DILocation(line: 1440, column: 22, scope: !1727)
!1729 = !DILocation(line: 1440, column: 35, scope: !1727)
!1730 = !DILocation(line: 1440, column: 20, scope: !1727)
!1731 = !DILocation(line: 1441, column: 17, scope: !1727)
!1732 = !DILocation(line: 1441, column: 31, scope: !1727)
!1733 = !DILocation(line: 1441, column: 41, scope: !1727)
!1734 = !DILocation(line: 1441, column: 40, scope: !1727)
!1735 = !DILocation(line: 1441, column: 59, scope: !1727)
!1736 = !DILocation(line: 1441, column: 57, scope: !1727)
!1737 = !DILocation(line: 1441, column: 27, scope: !1727)
!1738 = !DILocation(line: 1441, column: 76, scope: !1727)
!1739 = !DILocation(line: 1441, column: 14, scope: !1727)
!1740 = !DILocation(line: 1442, column: 17, scope: !1727)
!1741 = !DILocation(line: 1442, column: 27, scope: !1727)
!1742 = !DILocation(line: 1442, column: 26, scope: !1727)
!1743 = !DILocation(line: 1442, column: 46, scope: !1727)
!1744 = !DILocation(line: 1442, column: 55, scope: !1727)
!1745 = !DILocation(line: 1442, column: 54, scope: !1727)
!1746 = !DILocation(line: 1442, column: 43, scope: !1727)
!1747 = !DILocation(line: 1442, column: 14, scope: !1727)
!1748 = !DILocation(line: 1443, column: 14, scope: !1727)
!1749 = !DILocation(line: 1443, column: 13, scope: !1727)
!1750 = !DILocation(line: 1443, column: 23, scope: !1727)
!1751 = !DILocation(line: 1443, column: 5, scope: !1727)
!1752 = !DILocation(line: 1448, column: 16, scope: !1753)
!1753 = distinct !DILexicalBlock(scope: !1715, file: !69, line: 1447, column: 3)
!1754 = !DILocation(line: 1448, column: 30, scope: !1753)
!1755 = !DILocation(line: 1448, column: 40, scope: !1753)
!1756 = !DILocation(line: 1448, column: 39, scope: !1753)
!1757 = !DILocation(line: 1448, column: 55, scope: !1753)
!1758 = !DILocation(line: 1448, column: 53, scope: !1753)
!1759 = !DILocation(line: 1448, column: 26, scope: !1753)
!1760 = !DILocation(line: 1448, column: 69, scope: !1753)
!1761 = !DILocation(line: 1448, column: 13, scope: !1753)
!1762 = !DILocation(line: 1449, column: 16, scope: !1753)
!1763 = !DILocation(line: 1449, column: 26, scope: !1753)
!1764 = !DILocation(line: 1449, column: 25, scope: !1753)
!1765 = !DILocation(line: 1449, column: 42, scope: !1753)
!1766 = !DILocation(line: 1449, column: 51, scope: !1753)
!1767 = !DILocation(line: 1449, column: 50, scope: !1753)
!1768 = !DILocation(line: 1449, column: 39, scope: !1753)
!1769 = !DILocation(line: 1449, column: 13, scope: !1753)
!1770 = !DILocation(line: 1450, column: 11, scope: !1753)
!1771 = !DILocation(line: 1450, column: 4, scope: !1753)
!1772 = !DILocation(line: 1453, column: 1, scope: !1618)
!1773 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1471, type: !1774, scopeLine: 1472, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1774 = !DISubroutineType(types: !1775)
!1775 = !{!6, !25, !428}
!1776 = !DILocalVariable(name: "numerator", arg: 1, scope: !1773, file: !69, line: 1471, type: !25)
!1777 = !DILocation(line: 1471, column: 25, scope: !1773)
!1778 = !DILocalVariable(name: "denominator", arg: 2, scope: !1773, file: !69, line: 1471, type: !428)
!1779 = !DILocation(line: 1471, column: 40, scope: !1773)
!1780 = !DILocalVariable(name: "numerator_prime", scope: !1773, file: !69, line: 1474, type: !428)
!1781 = !DILocation(line: 1474, column: 6, scope: !1773)
!1782 = !DILocalVariable(name: "u32Temp1", scope: !1773, file: !69, line: 1474, type: !428)
!1783 = !DILocation(line: 1474, column: 27, scope: !1773)
!1784 = !DILocalVariable(name: "u32Temp2", scope: !1773, file: !69, line: 1474, type: !428)
!1785 = !DILocation(line: 1474, column: 41, scope: !1773)
!1786 = !DILocalVariable(name: "u32Temp3", scope: !1773, file: !69, line: 1474, type: !428)
!1787 = !DILocation(line: 1474, column: 55, scope: !1773)
!1788 = !DILocalVariable(name: "s32Temp1", scope: !1773, file: !69, line: 1475, type: !25)
!1789 = !DILocation(line: 1475, column: 6, scope: !1773)
!1790 = !DILocalVariable(name: "s32Temp2", scope: !1773, file: !69, line: 1475, type: !25)
!1791 = !DILocation(line: 1475, column: 20, scope: !1773)
!1792 = !DILocalVariable(name: "s32Temp3", scope: !1773, file: !69, line: 1475, type: !25)
!1793 = !DILocation(line: 1475, column: 34, scope: !1773)
!1794 = !DILocation(line: 1476, column: 5, scope: !1795)
!1795 = distinct !DILexicalBlock(scope: !1773, file: !69, line: 1476, column: 5)
!1796 = !DILocation(line: 1476, column: 17, scope: !1795)
!1797 = !DILocation(line: 1476, column: 5, scope: !1773)
!1798 = !DILocation(line: 1478, column: 6, scope: !1799)
!1799 = distinct !DILexicalBlock(scope: !1800, file: !69, line: 1478, column: 6)
!1800 = distinct !DILexicalBlock(scope: !1795, file: !69, line: 1477, column: 2)
!1801 = !DILocation(line: 1478, column: 15, scope: !1799)
!1802 = !DILocation(line: 1478, column: 6, scope: !1800)
!1803 = !DILocation(line: 1480, column: 4, scope: !1804)
!1804 = distinct !DILexicalBlock(scope: !1799, file: !69, line: 1479, column: 3)
!1805 = !DILocation(line: 1484, column: 4, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1799, file: !69, line: 1483, column: 3)
!1807 = !DILocation(line: 1489, column: 6, scope: !1808)
!1808 = distinct !DILexicalBlock(scope: !1809, file: !69, line: 1489, column: 6)
!1809 = distinct !DILexicalBlock(scope: !1795, file: !69, line: 1488, column: 2)
!1810 = !DILocation(line: 1489, column: 16, scope: !1808)
!1811 = !DILocation(line: 1489, column: 6, scope: !1809)
!1812 = !DILocation(line: 1491, column: 23, scope: !1813)
!1813 = distinct !DILexicalBlock(scope: !1808, file: !69, line: 1490, column: 3)
!1814 = !DILocation(line: 1491, column: 22, scope: !1813)
!1815 = !DILocation(line: 1491, column: 20, scope: !1813)
!1816 = !DILocation(line: 1492, column: 16, scope: !1813)
!1817 = !DILocation(line: 1492, column: 32, scope: !1813)
!1818 = !DILocation(line: 1492, column: 31, scope: !1813)
!1819 = !DILocation(line: 1492, column: 13, scope: !1813)
!1820 = !DILocation(line: 1493, column: 15, scope: !1813)
!1821 = !DILocation(line: 1493, column: 34, scope: !1813)
!1822 = !DILocation(line: 1493, column: 45, scope: !1813)
!1823 = !DILocation(line: 1493, column: 43, scope: !1813)
!1824 = !DILocation(line: 1493, column: 31, scope: !1813)
!1825 = !DILocation(line: 1493, column: 13, scope: !1813)
!1826 = !DILocation(line: 1495, column: 8, scope: !1827)
!1827 = distinct !DILexicalBlock(scope: !1813, file: !69, line: 1495, column: 7)
!1828 = !DILocation(line: 1495, column: 20, scope: !1827)
!1829 = !DILocation(line: 1495, column: 27, scope: !1827)
!1830 = !DILocation(line: 1495, column: 7, scope: !1813)
!1831 = !DILocation(line: 1497, column: 19, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !1827, file: !69, line: 1496, column: 4)
!1833 = !DILocation(line: 1497, column: 31, scope: !1832)
!1834 = !DILocation(line: 1497, column: 17, scope: !1832)
!1835 = !DILocation(line: 1498, column: 4, scope: !1832)
!1836 = !DILocation(line: 1501, column: 20, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1827, file: !69, line: 1500, column: 4)
!1838 = !DILocation(line: 1501, column: 32, scope: !1837)
!1839 = !DILocation(line: 1501, column: 38, scope: !1837)
!1840 = !DILocation(line: 1501, column: 17, scope: !1837)
!1841 = !DILocation(line: 1504, column: 7, scope: !1842)
!1842 = distinct !DILexicalBlock(scope: !1813, file: !69, line: 1504, column: 7)
!1843 = !DILocation(line: 1504, column: 18, scope: !1842)
!1844 = !DILocation(line: 1504, column: 16, scope: !1842)
!1845 = !DILocation(line: 1504, column: 7, scope: !1813)
!1846 = !DILocation(line: 1506, column: 18, scope: !1847)
!1847 = distinct !DILexicalBlock(scope: !1842, file: !69, line: 1505, column: 4)
!1848 = !DILocation(line: 1506, column: 16, scope: !1847)
!1849 = !DILocation(line: 1506, column: 28, scope: !1847)
!1850 = !DILocation(line: 1506, column: 14, scope: !1847)
!1851 = !DILocation(line: 1507, column: 4, scope: !1847)
!1852 = !DILocation(line: 1510, column: 18, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1842, file: !69, line: 1509, column: 4)
!1854 = !DILocation(line: 1510, column: 26, scope: !1853)
!1855 = !DILocation(line: 1510, column: 16, scope: !1853)
!1856 = !DILocation(line: 1510, column: 30, scope: !1853)
!1857 = !DILocation(line: 1510, column: 14, scope: !1853)
!1858 = !DILocation(line: 1512, column: 8, scope: !1859)
!1859 = distinct !DILexicalBlock(scope: !1813, file: !69, line: 1512, column: 7)
!1860 = !DILocation(line: 1512, column: 18, scope: !1859)
!1861 = !DILocation(line: 1512, column: 7, scope: !1813)
!1862 = !DILocation(line: 1514, column: 18, scope: !1863)
!1863 = distinct !DILexicalBlock(scope: !1859, file: !69, line: 1513, column: 4)
!1864 = !DILocation(line: 1514, column: 12, scope: !1863)
!1865 = !DILocation(line: 1514, column: 5, scope: !1863)
!1866 = !DILocation(line: 1518, column: 5, scope: !1867)
!1867 = distinct !DILexicalBlock(scope: !1859, file: !69, line: 1517, column: 4)
!1868 = !DILocation(line: 1523, column: 16, scope: !1869)
!1869 = distinct !DILexicalBlock(scope: !1808, file: !69, line: 1522, column: 3)
!1870 = !DILocation(line: 1523, column: 26, scope: !1869)
!1871 = !DILocation(line: 1523, column: 25, scope: !1869)
!1872 = !DILocation(line: 1523, column: 41, scope: !1869)
!1873 = !DILocation(line: 1523, column: 39, scope: !1869)
!1874 = !DILocation(line: 1523, column: 13, scope: !1869)
!1875 = !DILocation(line: 1524, column: 16, scope: !1869)
!1876 = !DILocation(line: 1524, column: 30, scope: !1869)
!1877 = !DILocation(line: 1524, column: 40, scope: !1869)
!1878 = !DILocation(line: 1524, column: 39, scope: !1869)
!1879 = !DILocation(line: 1524, column: 55, scope: !1869)
!1880 = !DILocation(line: 1524, column: 53, scope: !1869)
!1881 = !DILocation(line: 1524, column: 26, scope: !1869)
!1882 = !DILocation(line: 1524, column: 68, scope: !1869)
!1883 = !DILocation(line: 1524, column: 13, scope: !1869)
!1884 = !DILocation(line: 1525, column: 16, scope: !1869)
!1885 = !DILocation(line: 1525, column: 25, scope: !1869)
!1886 = !DILocation(line: 1525, column: 24, scope: !1869)
!1887 = !DILocation(line: 1525, column: 41, scope: !1869)
!1888 = !DILocation(line: 1525, column: 51, scope: !1869)
!1889 = !DILocation(line: 1525, column: 50, scope: !1869)
!1890 = !DILocation(line: 1525, column: 38, scope: !1869)
!1891 = !DILocation(line: 1525, column: 13, scope: !1869)
!1892 = !DILocation(line: 1526, column: 7, scope: !1893)
!1893 = distinct !DILexicalBlock(scope: !1869, file: !69, line: 1526, column: 7)
!1894 = !DILocation(line: 1526, column: 16, scope: !1893)
!1895 = !DILocation(line: 1526, column: 7, scope: !1869)
!1896 = !DILocation(line: 1528, column: 17, scope: !1897)
!1897 = distinct !DILexicalBlock(scope: !1893, file: !69, line: 1527, column: 4)
!1898 = !DILocation(line: 1528, column: 12, scope: !1897)
!1899 = !DILocation(line: 1528, column: 5, scope: !1897)
!1900 = !DILocation(line: 1532, column: 5, scope: !1901)
!1901 = distinct !DILexicalBlock(scope: !1893, file: !69, line: 1531, column: 4)
!1902 = !DILocation(line: 1536, column: 1, scope: !1773)
!1903 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1904, file: !1904, line: 12, type: !1905, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !34, retainedNodes: !1908)
!1904 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1905 = !DISubroutineType(types: !1906)
!1906 = !{null, !1907}
!1907 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1908 = !{!1909}
!1909 = !DILocalVariable(name: "z", arg: 1, scope: !1903, file: !1904, line: 12, type: !1907)
!1910 = !DILocation(line: 0, scope: !1903)
!1911 = !DILocation(line: 13, column: 9, scope: !1912)
!1912 = distinct !DILexicalBlock(scope: !1903, file: !1904, line: 13, column: 7)
!1913 = !DILocation(line: 13, column: 7, scope: !1903)
!1914 = !DILocation(line: 14, column: 5, scope: !1912)
!1915 = !DILocation(line: 15, column: 1, scope: !1903)
