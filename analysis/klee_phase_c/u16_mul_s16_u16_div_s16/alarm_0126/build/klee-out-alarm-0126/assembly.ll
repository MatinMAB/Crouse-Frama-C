; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0126/build/u16_mul_s16_u16_div_s16_alarm_0126.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"factor1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"factor2\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [65 x i8] c"KLEE-ALARM-0126: division by zero. assert (s32)denominator != 0;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0126.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  %factor1 = alloca i16, align 2
  %factor2 = alloca i16, align 2
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %factor1, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i16* %factor2, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i16* %result, metadata !50, metadata !DIExpression()), !dbg !51
  %0 = bitcast i16* %factor1 to i8*, !dbg !52
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !53
  %1 = bitcast i16* %factor2 to i8*, !dbg !54
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  %2 = bitcast i16* %denominator to i8*, !dbg !56
  call void @klee_make_symbolic(i8* %2, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  %3 = load i16, i16* %factor1, align 2, !dbg !58
  %4 = load i16, i16* %factor2, align 2, !dbg !59
  %5 = load i16, i16* %denominator, align 2, !dbg !60
  %call = call zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %3, i16 zeroext %4, i16 signext %5), !dbg !61
  store i16 %call, i16* %result, align 2, !dbg !62
  %6 = load i16, i16* %result, align 2, !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_s16(i16 signext %numerator, i16 signext %denominator) #0 !dbg !65 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !73, metadata !DIExpression()), !dbg !77
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
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 744, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !790
  unreachable, !dbg !790

if.end:                                           ; preds = %if.else7
  %5 = load i32, i32* %s32Result, align 4, !dbg !792
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !793
  %conv10 = sext i16 %6 to i32, !dbg !793
  %int_cast_to_i64 = zext i32 %conv10 to i64, !dbg !794
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !794
  %div = sdiv i32 %5, %conv10, !dbg !794, !klee.check.div !106
  %conv11 = sext i32 %div to i64, !dbg !795
  store volatile i64 %conv11, i64* @klee_alarm_sink_s64, align 8, !dbg !796
  store i16 0, i16* %retval, align 2, !dbg !797
  br label %return, !dbg !797

return:                                           ; preds = %if.end, %if.else, %if.then6
  %7 = load i16, i16* %retval, align 2, !dbg !798
  ret i16 %7, !dbg !798
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !799 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !802, metadata !DIExpression()), !dbg !803
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !804
  %cmp = icmp ne i64 %0, 0, !dbg !805
  %conv = zext i1 %cmp to i32, !dbg !805
  ret i32 %conv, !dbg !806
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !807 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !810, metadata !DIExpression()), !dbg !811
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !812, metadata !DIExpression()), !dbg !813
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !814, metadata !DIExpression()), !dbg !815
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !816, metadata !DIExpression()), !dbg !817
  store i32 0, i32* %s32Result, align 4, !dbg !817
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !818, metadata !DIExpression()), !dbg !819
  store i32 0, i32* %s32Temp1, align 4, !dbg !819
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !820
  %conv = sext i16 %0 to i32, !dbg !820
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !821
  %conv1 = zext i16 %1 to i32, !dbg !821
  %mul = mul nsw i32 %conv, %conv1, !dbg !822
  store i32 %mul, i32* %s32Result, align 4, !dbg !823
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !824
  %conv2 = zext i16 %2 to i32, !dbg !824
  %cmp = icmp eq i32 %conv2, 0, !dbg !826
  br i1 %cmp, label %if.then, label %if.else7, !dbg !827

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !828
  %cmp4 = icmp sge i32 %3, 0, !dbg !831
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !832

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !833
  br label %return, !dbg !833

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !835
  br label %return, !dbg !835

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !837
  %5 = load i32, i32* %s32Result, align 4, !dbg !839
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !840
  %conv8 = zext i16 %6 to i32, !dbg !840
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !841
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !841
  %div = sdiv i32 %5, %conv8, !dbg !841, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !842
  %conv9 = zext i16 %7 to i32, !dbg !842
  %mul10 = mul nsw i32 %div, %conv9, !dbg !843
  %sub = sub nsw i32 %4, %mul10, !dbg !844
  %shl = shl i32 %sub, 1, !dbg !845
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !846
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !847
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !848
  %conv11 = zext i16 %9 to i32, !dbg !848
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !849
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !849
  %div12 = sdiv i32 %8, %conv11, !dbg !849, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !850
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !851
  %conv13 = zext i16 %11 to i32, !dbg !851
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !852
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !852
  %div14 = sdiv i32 %10, %conv13, !dbg !852, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !853
  store i32 %add, i32* %s32Result, align 4, !dbg !854
  %12 = load i32, i32* %s32Result, align 4, !dbg !855
  %cmp15 = icmp slt i32 %12, 65535, !dbg !857
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !858

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !859
  %cmp18 = icmp sgt i32 %13, 0, !dbg !862
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !863

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !864
  %conv21 = trunc i32 %14 to i16, !dbg !866
  store i16 %conv21, i16* %retval, align 2, !dbg !867
  br label %return, !dbg !867

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !868
  br label %return, !dbg !868

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !870
  br label %return, !dbg !870

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !872
  ret i16 %15, !dbg !872
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !873 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !876, metadata !DIExpression()), !dbg !877
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !878, metadata !DIExpression()), !dbg !879
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !880, metadata !DIExpression()), !dbg !881
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !882, metadata !DIExpression()), !dbg !883
  store i32 0, i32* %u32Temp1, align 4, !dbg !883
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !884, metadata !DIExpression()), !dbg !885
  store i16 0, i16* %u16TempDenom, align 2, !dbg !885
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !886
  %conv = zext i16 %0 to i32, !dbg !886
  %cmp = icmp eq i32 %conv, 0, !dbg !888
  br i1 %cmp, label %if.then, label %if.else, !dbg !889

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !890
  br label %return, !dbg !890

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !892
  %conv2 = zext i16 %1 to i32, !dbg !892
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !894
  %conv3 = zext i16 %2 to i32, !dbg !894
  %mul = mul nsw i32 %conv2, %conv3, !dbg !895
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !896
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !897
  %conv4 = zext i16 %3 to i32, !dbg !897
  %shr = ashr i32 %conv4, 1, !dbg !898
  %conv5 = trunc i32 %shr to i16, !dbg !897
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !899
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !900
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !901
  %conv6 = zext i16 %5 to i32, !dbg !901
  %add = add i32 %4, %conv6, !dbg !902
  store i32 %add, i32* %u32Temp1, align 4, !dbg !903
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !904
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !905
  %conv7 = zext i16 %7 to i32, !dbg !905
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !906
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !906
  %div = udiv i32 %6, %conv7, !dbg !906, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !907
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !908
  %cmp8 = icmp ult i32 %8, 65535, !dbg !910
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !911

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !912
  %and = and i32 %9, 65535, !dbg !914
  %conv11 = trunc i32 %and to i16, !dbg !915
  store i16 %conv11, i16* %retval, align 2, !dbg !916
  br label %return, !dbg !916

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !917
  br label %return, !dbg !917

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !919
  ret i16 %10, !dbg !919
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !920 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !923, metadata !DIExpression()), !dbg !924
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !925, metadata !DIExpression()), !dbg !926
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !927, metadata !DIExpression()), !dbg !928
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !929, metadata !DIExpression()), !dbg !930
  store i32 0, i32* %u32Temp1, align 4, !dbg !930
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !931
  %cmp = icmp eq i32 %0, 0, !dbg !933
  br i1 %cmp, label %if.then, label %if.else, !dbg !934

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !935
  br label %return, !dbg !935

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !937
  %conv = zext i16 %1 to i32, !dbg !937
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !939
  %conv1 = zext i16 %2 to i32, !dbg !939
  %mul = mul nsw i32 %conv, %conv1, !dbg !940
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !941
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !942
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !942
  %div = udiv i32 %mul, %3, !dbg !942, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !943
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !944
  %conv2 = zext i16 %4 to i32, !dbg !944
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !946
  %conv3 = zext i16 %5 to i32, !dbg !946
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !947
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !948
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !949
  %mul5 = mul i32 %6, %7, !dbg !950
  %sub = sub i32 %mul4, %mul5, !dbg !951
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !952
  %div6 = udiv i32 %8, 2, !dbg !953
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !954
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !955

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !956
  %inc = add i32 %9, 1, !dbg !956
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !956
  br label %if.end, !dbg !958

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !959
  %cmp10 = icmp ult i32 %10, 65535, !dbg !961
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !962

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !963
  %and = and i32 %11, 65535, !dbg !965
  %conv13 = trunc i32 %and to i16, !dbg !966
  store i16 %conv13, i16* %retval, align 2, !dbg !967
  br label %return, !dbg !967

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !968
  br label %return, !dbg !968

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !970
  ret i16 %12, !dbg !970
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !971 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !974, metadata !DIExpression()), !dbg !975
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !976, metadata !DIExpression()), !dbg !977
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !978, metadata !DIExpression()), !dbg !979
  store i32 0, i32* %u32Temp1, align 4, !dbg !979
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !980
  %conv = zext i16 %0 to i32, !dbg !980
  %cmp = icmp eq i32 %conv, 0, !dbg !982
  br i1 %cmp, label %if.then, label %if.else, !dbg !983

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !984
  br label %return, !dbg !984

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !986
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !988
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !989
  %conv2 = zext i16 %3 to i32, !dbg !989
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !990
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !990
  %div = udiv i32 %2, %conv2, !dbg !990, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !991
  %conv3 = zext i16 %4 to i32, !dbg !991
  %mul = mul i32 %div, %conv3, !dbg !992
  %sub = sub i32 %1, %mul, !dbg !993
  %shl = shl i32 %sub, 1, !dbg !994
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !995
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !996
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !997
  %conv4 = zext i16 %6 to i32, !dbg !997
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !998
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !998
  %div5 = udiv i32 %5, %conv4, !dbg !998, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !999
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1000
  %conv6 = zext i16 %8 to i32, !dbg !1000
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1001
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1001
  %div7 = udiv i32 %7, %conv6, !dbg !1001, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1002
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1003
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1004
  store i32 %9, i32* %retval, align 4, !dbg !1005
  br label %return, !dbg !1005

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1006
  ret i32 %10, !dbg !1006
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1007 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1010, metadata !DIExpression()), !dbg !1011
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1012, metadata !DIExpression()), !dbg !1013
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1014, metadata !DIExpression()), !dbg !1015
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1016, metadata !DIExpression()), !dbg !1017
  store i32 0, i32* %s32Temp1, align 4, !dbg !1017
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1018, metadata !DIExpression()), !dbg !1019
  store i32 0, i32* %s32Temp2, align 4, !dbg !1019
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1020, metadata !DIExpression()), !dbg !1021
  store i32 0, i32* %s32Temp3, align 4, !dbg !1021
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1022
  %conv = sext i16 %0 to i32, !dbg !1022
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1023
  %conv1 = sext i16 %1 to i32, !dbg !1023
  %mul = mul nsw i32 %conv, %conv1, !dbg !1024
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1025
  %2 = load i16, i16* %div.addr, align 2, !dbg !1026
  %conv2 = sext i16 %2 to i32, !dbg !1026
  %cmp = icmp eq i32 %conv2, 0, !dbg !1028
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1029

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1030
  %cmp4 = icmp slt i32 %3, 0, !dbg !1033
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1034

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1035
  br label %return, !dbg !1035

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1037
  br label %return, !dbg !1037

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1039
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1041
  %6 = load i16, i16* %div.addr, align 2, !dbg !1042
  %conv8 = sext i16 %6 to i32, !dbg !1042
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1043
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1043
  %div9 = sdiv i32 %5, %conv8, !dbg !1043, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1044
  %conv10 = sext i16 %7 to i32, !dbg !1044
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1045
  %sub = sub nsw i32 %4, %mul11, !dbg !1046
  %shl = shl i32 %sub, 1, !dbg !1047
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1048
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1049
  %9 = load i16, i16* %div.addr, align 2, !dbg !1050
  %conv12 = sext i16 %9 to i32, !dbg !1050
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1051
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1051
  %div13 = sdiv i32 %8, %conv12, !dbg !1051, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1052
  %11 = load i16, i16* %div.addr, align 2, !dbg !1053
  %conv14 = sext i16 %11 to i32, !dbg !1053
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1054
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1054
  %div15 = sdiv i32 %10, %conv14, !dbg !1054, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1055
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1056
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1057
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1059
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1060

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1061
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1064
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1065

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1066
  %conv22 = trunc i32 %14 to i16, !dbg !1068
  store i16 %conv22, i16* %retval, align 2, !dbg !1069
  br label %return, !dbg !1069

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1070
  br label %return, !dbg !1070

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1072
  br label %return, !dbg !1072

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1074
  ret i16 %15, !dbg !1074
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1075 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1078, metadata !DIExpression()), !dbg !1079
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1080, metadata !DIExpression()), !dbg !1081
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1082, metadata !DIExpression()), !dbg !1083
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1084, metadata !DIExpression()), !dbg !1085
  store i32 0, i32* %s32Result, align 4, !dbg !1085
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1086, metadata !DIExpression()), !dbg !1087
  store i32 0, i32* %s32Temp1, align 4, !dbg !1087
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1088
  %conv = sext i16 %0 to i32, !dbg !1088
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1089
  %conv1 = sext i16 %1 to i32, !dbg !1089
  %mul = mul nsw i32 %conv, %conv1, !dbg !1090
  store i32 %mul, i32* %s32Result, align 4, !dbg !1091
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1092
  %conv2 = zext i16 %2 to i32, !dbg !1092
  %cmp = icmp eq i32 %conv2, 0, !dbg !1094
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1095

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1096
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1099
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1100

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1101
  br label %return, !dbg !1101

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1103
  %cmp7 = icmp eq i32 %4, 0, !dbg !1105
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1106

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1107
  br label %return, !dbg !1107

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1109
  br label %return, !dbg !1109

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1111
  %6 = load i32, i32* %s32Result, align 4, !dbg !1113
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1114
  %conv12 = zext i16 %7 to i32, !dbg !1114
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1115
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1115
  %div = sdiv i32 %6, %conv12, !dbg !1115, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1116
  %conv13 = zext i16 %8 to i32, !dbg !1116
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1117
  %sub = sub nsw i32 %5, %mul14, !dbg !1118
  %shl = shl i32 %sub, 1, !dbg !1119
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1120
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1121
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1122
  %conv15 = zext i16 %10 to i32, !dbg !1122
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1123
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1123
  %div16 = sdiv i32 %9, %conv15, !dbg !1123, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1124
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1125
  %conv17 = zext i16 %12 to i32, !dbg !1125
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1126
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1126
  %div18 = sdiv i32 %11, %conv17, !dbg !1126, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1127
  store i32 %add, i32* %s32Result, align 4, !dbg !1128
  %13 = load i32, i32* %s32Result, align 4, !dbg !1129
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1131
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1132

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1133
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1136
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1137

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1138
  %conv25 = trunc i32 %15 to i16, !dbg !1140
  store i16 %conv25, i16* %retval, align 2, !dbg !1141
  br label %return, !dbg !1141

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1142
  br label %return, !dbg !1142

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1144
  br label %return, !dbg !1144

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1146
  ret i16 %16, !dbg !1146
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1147 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1150, metadata !DIExpression()), !dbg !1151
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1152, metadata !DIExpression()), !dbg !1153
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1154, metadata !DIExpression()), !dbg !1155
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1156
  %cmp = icmp eq i32 %0, 0, !dbg !1158
  br i1 %cmp, label %if.then, label %if.else, !dbg !1159

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1160
  br label %return, !dbg !1160

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1162
  %cmp1 = icmp sle i32 %1, 0, !dbg !1165
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1166

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1167
  br label %return, !dbg !1167

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1169
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1171
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1172
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1173
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1173
  %div = udiv i32 %3, %4, !dbg !1173, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1174
  %mul = mul i32 %div, %5, !dbg !1175
  %sub = sub i32 %2, %mul, !dbg !1176
  %shl = shl i32 %sub, 1, !dbg !1177
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1178
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1179
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1180
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1181
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1181
  %div4 = udiv i32 %6, %7, !dbg !1181, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1182
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1183
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1184
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1184
  %div5 = udiv i32 %8, %9, !dbg !1184, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1185
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1186
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1187
  store i32 %10, i32* %retval, align 4, !dbg !1188
  br label %return, !dbg !1188

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1189
  ret i32 %11, !dbg !1189
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1190 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1193, metadata !DIExpression()), !dbg !1194
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1195, metadata !DIExpression()), !dbg !1196
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1197, metadata !DIExpression()), !dbg !1198
  store i32 0, i32* %s32Temp1, align 4, !dbg !1198
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1199
  %cmp = icmp eq i32 %0, 0, !dbg !1201
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1202

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1203
  %cmp1 = icmp sge i32 %1, 0, !dbg !1206
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1207

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1208
  br label %return, !dbg !1208

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1210
  br label %return, !dbg !1210

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1212
  %cmp4 = icmp sge i32 %2, 0, !dbg !1215
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1216

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1217
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1219
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1220
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1221
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1221
  %div = udiv i32 %4, %5, !dbg !1221, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1222
  %mul = mul i32 %div, %6, !dbg !1223
  %sub = sub i32 %3, %mul, !dbg !1224
  %shl = shl i32 %sub, 1, !dbg !1225
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1226
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1227
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1228
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1229
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1229
  %div6 = udiv i32 %7, %8, !dbg !1229, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1230
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1231
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1232
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1232
  %div7 = udiv i32 %9, %10, !dbg !1232, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1233
  store i32 %add, i32* %retval, align 4, !dbg !1234
  br label %return, !dbg !1234

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1235
  br label %return, !dbg !1235

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1237
  ret i32 %11, !dbg !1237
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1238 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1241, metadata !DIExpression()), !dbg !1242
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1243, metadata !DIExpression()), !dbg !1244
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1245, metadata !DIExpression()), !dbg !1246
  store i32 0, i32* %u32Temp1, align 4, !dbg !1246
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1247, metadata !DIExpression()), !dbg !1248
  store i32 0, i32* %u32Temp2, align 4, !dbg !1248
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1249
  %cmp = icmp eq i32 %0, 0, !dbg !1251
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1252

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1253
  %cmp1 = icmp slt i32 %1, 0, !dbg !1256
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1257

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1258
  br label %return, !dbg !1258

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1260
  br label %return, !dbg !1260

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1262
  %cmp4 = icmp sge i32 %2, 0, !dbg !1265
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1266

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1267
  %cmp6 = icmp eq i32 %3, 0, !dbg !1270
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1271

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1272
  br label %return, !dbg !1272

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1274
  %cmp9 = icmp sle i32 %4, 0, !dbg !1277
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1278

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1279
  br label %return, !dbg !1279

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1281
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1283
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1284
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1285
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1285
  %div = sdiv i32 %6, %7, !dbg !1285, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1286
  %mul = mul nsw i32 %div, %8, !dbg !1287
  %sub = sub nsw i32 %5, %mul, !dbg !1288
  %shl = shl i32 %sub, 1, !dbg !1289
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1290
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1291
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1292
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1293
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1293
  %div12 = udiv i32 %9, %10, !dbg !1293, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1294
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1295
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1296
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1296
  %div13 = sdiv i32 %11, %12, !dbg !1296, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1297
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1298
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1299
  store i32 %13, i32* %retval, align 4, !dbg !1300
  br label %return, !dbg !1300

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1301
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1304
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1305

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1306
  br label %return, !dbg !1306

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1308
  %sub18 = sub nsw i32 0, %15, !dbg !1310
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1311
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1312
  %sub19 = sub nsw i32 0, %16, !dbg !1313
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1314
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1315
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1316
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1317
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1318
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1318
  %div20 = sdiv i32 %18, %19, !dbg !1318, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1319
  %mul21 = mul nsw i32 %div20, %20, !dbg !1320
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1321
  %shl23 = shl i32 %sub22, 1, !dbg !1322
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1323
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1324
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1325
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1326
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1326
  %div24 = udiv i32 %21, %22, !dbg !1326, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1327
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1328
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1329
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1329
  %div25 = sdiv i32 %23, %24, !dbg !1329, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1330
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1331
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1332
  store i32 %25, i32* %retval, align 4, !dbg !1333
  br label %return, !dbg !1333

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1334
  ret i32 %26, !dbg !1334
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1335 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1338, metadata !DIExpression()), !dbg !1339
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1340, metadata !DIExpression()), !dbg !1341
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1342, metadata !DIExpression()), !dbg !1343
  store i32 0, i32* %u32Temp1, align 4, !dbg !1343
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1344, metadata !DIExpression()), !dbg !1345
  store i32 0, i32* %u32Temp2, align 4, !dbg !1345
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1346, metadata !DIExpression()), !dbg !1347
  store i32 0, i32* %u32Temp3, align 4, !dbg !1347
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1348, metadata !DIExpression()), !dbg !1349
  store i32 0, i32* %numerator_old, align 4, !dbg !1349
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1350
  %cmp = icmp eq i32 %0, 0, !dbg !1352
  br i1 %cmp, label %if.then, label %if.else, !dbg !1353

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1354
  br label %return, !dbg !1354

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1356
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1358
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1359
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1360
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1361
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1361
  %div = udiv i32 %3, %4, !dbg !1361, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1362
  %sub = sub i32 %1, %mul, !dbg !1363
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1364
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1365
  %and = and i32 %5, 1, !dbg !1367
  %cmp1 = icmp eq i32 %and, 0, !dbg !1368
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1369

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1370
  %shr = lshr i32 %6, 1, !dbg !1372
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1373
  br label %if.end, !dbg !1374

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1375
  %shr4 = lshr i32 %7, 1, !dbg !1377
  %add = add i32 %shr4, 1, !dbg !1378
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1379
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1380
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1382
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1383
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1384

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1385
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1387
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1388
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1388
  %div7 = udiv i32 %10, %11, !dbg !1388, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1389
  br label %return, !dbg !1389

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1390
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1392
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1393
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1393
  %div9 = udiv i32 %12, %13, !dbg !1393, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1394
  store i32 %add10, i32* %retval, align 4, !dbg !1395
  br label %return, !dbg !1395

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1396
  ret i32 %14, !dbg !1396
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1397 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1400, metadata !DIExpression()), !dbg !1401
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1402, metadata !DIExpression()), !dbg !1403
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1404, metadata !DIExpression()), !dbg !1405
  store i32 0, i32* %u32Temp1, align 4, !dbg !1405
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1406, metadata !DIExpression()), !dbg !1407
  store i32 0, i32* %u32Temp2, align 4, !dbg !1407
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1408
  %cmp = icmp sle i32 %0, 0, !dbg !1410
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1411

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1412
  %cmp1 = icmp sge i32 %1, 0, !dbg !1415
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1416

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1417
  br label %return, !dbg !1417

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1419
  %sub = sub nsw i32 0, %2, !dbg !1421
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1422
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1423
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1424
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1425
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1426
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1426
  %div = udiv i32 %4, %5, !dbg !1426, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1427
  %mul = mul i32 %div, %6, !dbg !1428
  %sub3 = sub i32 %3, %mul, !dbg !1429
  %shl = shl i32 %sub3, 1, !dbg !1430
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1431
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1432
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1433
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1434
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1434
  %div4 = udiv i32 %7, %8, !dbg !1434, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1435
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1436
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1437
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1437
  %div5 = udiv i32 %9, %10, !dbg !1437, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1438
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1439
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1440
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1442
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1443

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1444
  %sub8 = sub i32 0, %12, !dbg !1446
  store i32 %sub8, i32* %retval, align 4, !dbg !1447
  br label %return, !dbg !1447

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1448
  br label %return, !dbg !1448

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1450
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1452
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1453
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1454
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1454
  %div11 = udiv i32 %14, %15, !dbg !1454, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1455
  %mul12 = mul i32 %div11, %16, !dbg !1456
  %sub13 = sub i32 %13, %mul12, !dbg !1457
  %shl14 = shl i32 %sub13, 1, !dbg !1458
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1459
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1460
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1461
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1462
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1462
  %div15 = udiv i32 %17, %18, !dbg !1462, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1463
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1464
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1465
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1465
  %div16 = udiv i32 %19, %20, !dbg !1465, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1466
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1467
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1468
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1470
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1471

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1472
  store i32 %22, i32* %retval, align 4, !dbg !1474
  br label %return, !dbg !1474

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1475
  br label %return, !dbg !1475

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1477
  ret i32 %23, !dbg !1477
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1478 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1481, metadata !DIExpression()), !dbg !1482
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1483, metadata !DIExpression()), !dbg !1484
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1485, metadata !DIExpression()), !dbg !1486
  store i32 0, i32* %s32Temp1, align 4, !dbg !1486
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1487, metadata !DIExpression()), !dbg !1488
  store i32 0, i32* %s32Temp2, align 4, !dbg !1488
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1489, metadata !DIExpression()), !dbg !1490
  store i32 0, i32* %u32Temp0, align 4, !dbg !1490
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1491, metadata !DIExpression()), !dbg !1492
  store i32 0, i32* %u32Temp1, align 4, !dbg !1492
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1493, metadata !DIExpression()), !dbg !1494
  store i32 0, i32* %u32Temp2, align 4, !dbg !1494
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1495
  %cmp = icmp eq i32 %0, 0, !dbg !1497
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1498

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1499
  %cmp1 = icmp slt i32 %1, 0, !dbg !1502
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1503

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1504
  br label %return, !dbg !1504

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1506
  br label %return, !dbg !1506

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1508
  %cmp4 = icmp sle i32 %2, 0, !dbg !1511
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1512

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1513
  %sub = sub nsw i32 0, %3, !dbg !1515
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1516
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1517
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1518
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1519
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1519
  %div = udiv i32 %4, %5, !dbg !1519, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1520
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1521
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1522
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1523
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1524
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1524
  %div6 = udiv i32 %7, %8, !dbg !1524, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1525
  %mul = mul i32 %div6, %9, !dbg !1526
  %sub7 = sub i32 %6, %mul, !dbg !1527
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1528
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1529
  %and = and i32 %10, 1, !dbg !1531
  %cmp8 = icmp eq i32 %and, 0, !dbg !1532
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1533

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1534
  %shr = lshr i32 %11, 1, !dbg !1536
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1537
  br label %if.end, !dbg !1538

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1539
  %shr11 = lshr i32 %12, 1, !dbg !1541
  %add = add i32 %shr11, 1, !dbg !1542
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1543
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1544
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1546
  %cmp12 = icmp ult i32 %13, %14, !dbg !1547
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1548

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1549
  %neg = xor i32 %15, -1, !dbg !1551
  %add14 = add i32 %neg, 1, !dbg !1552
  store i32 %add14, i32* %retval, align 4, !dbg !1553
  br label %return, !dbg !1553

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1554
  %add16 = add i32 %16, 1, !dbg !1556
  %neg17 = xor i32 %add16, -1, !dbg !1557
  %add18 = add i32 %neg17, 1, !dbg !1558
  store i32 %add18, i32* %retval, align 4, !dbg !1559
  br label %return, !dbg !1559

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1560
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1562
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1563
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1564
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1564
  %div20 = udiv i32 %18, %19, !dbg !1564, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1565
  %mul21 = mul i32 %div20, %20, !dbg !1566
  %sub22 = sub i32 %17, %mul21, !dbg !1567
  %shl = shl i32 %sub22, 1, !dbg !1568
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1569
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1570
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1571
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1572
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1572
  %div23 = udiv i32 %21, %22, !dbg !1572, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1573
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1574
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1575
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1575
  %div24 = udiv i32 %23, %24, !dbg !1575, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1576
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1577
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1578
  store i32 %25, i32* %retval, align 4, !dbg !1579
  br label %return, !dbg !1579

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1580
  ret i32 %26, !dbg !1580
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1581 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1584, metadata !DIExpression()), !dbg !1585
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1586, metadata !DIExpression()), !dbg !1587
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1588, metadata !DIExpression()), !dbg !1589
  store i32 0, i32* %s32Temp1, align 4, !dbg !1589
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1590, metadata !DIExpression()), !dbg !1591
  store i32 0, i32* %s32Temp2, align 4, !dbg !1591
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1592, metadata !DIExpression()), !dbg !1593
  store i32 0, i32* %denominator_prime, align 4, !dbg !1593
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1594, metadata !DIExpression()), !dbg !1595
  store i32 0, i32* %u32Temp1, align 4, !dbg !1595
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1596, metadata !DIExpression()), !dbg !1597
  store i32 0, i32* %u32Temp2, align 4, !dbg !1597
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1598, metadata !DIExpression()), !dbg !1599
  store i32 0, i32* %u32numerator, align 4, !dbg !1599
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1600, metadata !DIExpression()), !dbg !1601
  store i32 0, i32* %u32denominator, align 4, !dbg !1601
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1602
  %cmp = icmp slt i32 %0, 0, !dbg !1604
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1605

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1606
  %cmp1 = icmp sle i32 %1, 0, !dbg !1609
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1610

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1611
  %cmp3 = icmp sge i32 %2, 0, !dbg !1614
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1615

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1616
  br label %return, !dbg !1616

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1618
  %sub = sub nsw i32 0, %3, !dbg !1620
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1621
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1622
  %sub5 = sub nsw i32 0, %4, !dbg !1623
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1624
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1625
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1626
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1627
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1628
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1628
  %div = udiv i32 %6, %7, !dbg !1628, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1629
  %mul = mul i32 %div, %8, !dbg !1630
  %sub6 = sub i32 %5, %mul, !dbg !1631
  %shl = shl i32 %sub6, 1, !dbg !1632
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1633
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1634
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1635
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1636
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1636
  %div7 = udiv i32 %9, %10, !dbg !1636, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1637
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1638
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1639
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1639
  %div8 = udiv i32 %11, %12, !dbg !1639, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1640
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1641
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1642
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1644
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1645

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1646
  store i32 %14, i32* %retval, align 4, !dbg !1648
  br label %return, !dbg !1648

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1649
  br label %return, !dbg !1649

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1651
  %neg = xor i32 %15, -1, !dbg !1653
  %add13 = add nsw i32 %neg, 1, !dbg !1654
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1655
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1656
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1657
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1658
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1659
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1659
  %div14 = udiv i32 %17, %18, !dbg !1659, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1660
  %mul15 = mul i32 %div14, %19, !dbg !1661
  %sub16 = sub i32 %16, %mul15, !dbg !1662
  %shl17 = shl i32 %sub16, 1, !dbg !1663
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1664
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1665
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1666
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1667
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1667
  %div18 = udiv i32 %20, %21, !dbg !1667, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1668
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1669
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1670
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1670
  %div19 = sdiv i32 %22, %23, !dbg !1670, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1671
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1672
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1673
  %neg21 = xor i32 %24, -1, !dbg !1674
  %add22 = add nsw i32 %neg21, 1, !dbg !1675
  store i32 %add22, i32* %retval, align 4, !dbg !1676
  br label %return, !dbg !1676

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1677
  %cmp24 = icmp sle i32 %25, 0, !dbg !1680
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1681

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1682
  %cmp26 = icmp sge i32 %26, 0, !dbg !1685
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1686

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1687
  br label %return, !dbg !1687

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1689
  %neg29 = xor i32 %27, -1, !dbg !1691
  %add30 = add nsw i32 %neg29, 1, !dbg !1692
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1693
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1694
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1695
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1696
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1697
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1697
  %div31 = udiv i32 %29, %30, !dbg !1697, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1698
  %mul32 = mul i32 %div31, %31, !dbg !1699
  %sub33 = sub i32 %28, %mul32, !dbg !1700
  %shl34 = shl i32 %sub33, 1, !dbg !1701
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1702
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1703
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1704
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1705
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1705
  %div35 = udiv i32 %32, %33, !dbg !1705, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1706
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1707
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1708
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1708
  %div36 = udiv i32 %34, %35, !dbg !1708, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1709
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1710
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1711
  %neg38 = xor i32 %36, -1, !dbg !1712
  %add39 = add nsw i32 %neg38, 1, !dbg !1713
  store i32 %add39, i32* %retval, align 4, !dbg !1714
  br label %return, !dbg !1714

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1715
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1717
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1718
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1719
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1719
  %div41 = sdiv i32 %38, %39, !dbg !1719, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1720
  %mul42 = mul nsw i32 %div41, %40, !dbg !1721
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1722
  %shl44 = shl i32 %sub43, 1, !dbg !1723
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1724
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1725
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1726
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1727
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1727
  %div45 = sdiv i32 %41, %42, !dbg !1727, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1728
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1729
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1730
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1730
  %div46 = udiv i32 %43, %44, !dbg !1730, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1731
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1732
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1733
  store i32 %45, i32* %retval, align 4, !dbg !1734
  br label %return, !dbg !1734

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1735
  ret i32 %46, !dbg !1735
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1736 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1739, metadata !DIExpression()), !dbg !1740
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1741, metadata !DIExpression()), !dbg !1742
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1743, metadata !DIExpression()), !dbg !1744
  store i32 0, i32* %numerator_prime, align 4, !dbg !1744
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1745, metadata !DIExpression()), !dbg !1746
  store i32 0, i32* %u32Temp1, align 4, !dbg !1746
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1747, metadata !DIExpression()), !dbg !1748
  store i32 0, i32* %u32Temp2, align 4, !dbg !1748
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1749, metadata !DIExpression()), !dbg !1750
  store i32 0, i32* %u32Temp3, align 4, !dbg !1750
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1751, metadata !DIExpression()), !dbg !1752
  store i32 0, i32* %s32Temp1, align 4, !dbg !1752
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1753, metadata !DIExpression()), !dbg !1754
  store i32 0, i32* %s32Temp2, align 4, !dbg !1754
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1755, metadata !DIExpression()), !dbg !1756
  store i32 0, i32* %s32Temp3, align 4, !dbg !1756
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1757
  %cmp = icmp eq i32 %0, 0, !dbg !1759
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1760

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1761
  %cmp1 = icmp slt i32 %1, 0, !dbg !1764
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1765

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1766
  br label %return, !dbg !1766

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1768
  br label %return, !dbg !1768

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1770
  %cmp4 = icmp slt i32 %2, 0, !dbg !1773
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1774

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1775
  %sub = sub nsw i32 0, %3, !dbg !1777
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1778
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1779
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1780
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1781
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1781
  %div = udiv i32 %4, %5, !dbg !1781, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1782
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1783
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1784
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1785
  %mul = mul i32 %7, %8, !dbg !1786
  %sub6 = sub i32 %6, %mul, !dbg !1787
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1788
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1789
  %and = and i32 %9, 1, !dbg !1791
  %cmp7 = icmp eq i32 %and, 0, !dbg !1792
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1793

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1794
  %shr = lshr i32 %10, 1, !dbg !1796
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1797
  br label %if.end, !dbg !1798

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1799
  %shr10 = lshr i32 %11, 1, !dbg !1801
  %add = add i32 %shr10, 1, !dbg !1802
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1803
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1804
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1806
  %cmp11 = icmp ult i32 %12, %13, !dbg !1807
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1808

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1809
  %neg = xor i32 %14, -1, !dbg !1811
  %add13 = add i32 %neg, 1, !dbg !1812
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1813
  br label %if.end18, !dbg !1814

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1815
  %add15 = add i32 %15, 1, !dbg !1817
  %neg16 = xor i32 %add15, -1, !dbg !1818
  %add17 = add i32 %neg16, 1, !dbg !1819
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1820
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1821
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1823
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1824

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1825
  %conv = trunc i32 %17 to i16, !dbg !1827
  store i16 %conv, i16* %retval, align 2, !dbg !1828
  br label %return, !dbg !1828

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1829
  br label %return, !dbg !1829

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1831
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1833
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1834
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1834
  %div23 = udiv i32 %18, %19, !dbg !1834, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1835
  %mul24 = mul i32 %div23, %20, !dbg !1836
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1837
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1838
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1839
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1840
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1841
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1841
  %div25 = udiv i32 %22, %23, !dbg !1841, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1842
  %mul26 = mul i32 %div25, %24, !dbg !1843
  %sub27 = sub i32 %21, %mul26, !dbg !1844
  %shl = shl i32 %sub27, 1, !dbg !1845
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1846
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1847
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1848
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1849
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1849
  %div28 = udiv i32 %25, %26, !dbg !1849, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1850
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1851
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1852
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1852
  %div29 = udiv i32 %27, %28, !dbg !1852, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !1853
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1854
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1855
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1857
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1858

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1859
  %conv34 = trunc i32 %30 to i16, !dbg !1861
  store i16 %conv34, i16* %retval, align 2, !dbg !1862
  br label %return, !dbg !1862

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1863
  br label %return, !dbg !1863

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1865
  ret i16 %31, !dbg !1865
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1866 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1872, metadata !DIExpression()), !dbg !1873
  %2 = icmp eq i64 %0, 0, !dbg !1874
  br i1 %2, label %3, label %4, !dbg !1876

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1877
  unreachable, !dbg !1877

4:                                                ; preds = %1
  ret void, !dbg !1878
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

!llvm.dbg.cu = !{!28, !2, !30}
!llvm.ident = !{!32, !32, !33}
!llvm.module.flags = !{!34, !35, !36, !37, !38}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !26, line: 21, type: !27, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !25, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0126/div_Ccode_alarm_0126.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0126")
!4 = !{}
!5 = !{!6, !13, !18, !22}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0126")
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
!25 = !{!0}
!26 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0126")
!27 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!28 = distinct !DICompileUnit(language: DW_LANG_C99, file: !29, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!29 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0126/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0126")
!30 = distinct !DICompileUnit(language: DW_LANG_C89, file: !31, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!31 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!32 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!33 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!34 = !{i32 7, !"Dwarf Version", i32 4}
!35 = !{i32 2, !"Debug Info Version", i32 3}
!36 = !{i32 1, !"wchar_size", i32 4}
!37 = !{i32 7, !"uwtable", i32 1}
!38 = !{i32 7, !"frame-pointer", i32 2}
!39 = distinct !DISubprogram(name: "main", scope: !40, file: !40, line: 7, type: !41, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !4)
!40 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0126")
!41 = !DISubroutineType(types: !42)
!42 = !{!43}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DILocalVariable(name: "factor1", scope: !39, file: !40, line: 9, type: !8)
!45 = !DILocation(line: 9, column: 13, scope: !39)
!46 = !DILocalVariable(name: "factor2", scope: !39, file: !40, line: 10, type: !19)
!47 = !DILocation(line: 10, column: 14, scope: !39)
!48 = !DILocalVariable(name: "denominator", scope: !39, file: !40, line: 11, type: !8)
!49 = !DILocation(line: 11, column: 13, scope: !39)
!50 = !DILocalVariable(name: "result", scope: !39, file: !40, line: 12, type: !19)
!51 = !DILocation(line: 12, column: 14, scope: !39)
!52 = !DILocation(line: 14, column: 24, scope: !39)
!53 = !DILocation(line: 14, column: 5, scope: !39)
!54 = !DILocation(line: 15, column: 24, scope: !39)
!55 = !DILocation(line: 15, column: 5, scope: !39)
!56 = !DILocation(line: 16, column: 24, scope: !39)
!57 = !DILocation(line: 16, column: 5, scope: !39)
!58 = !DILocation(line: 18, column: 38, scope: !39)
!59 = !DILocation(line: 18, column: 47, scope: !39)
!60 = !DILocation(line: 18, column: 56, scope: !39)
!61 = !DILocation(line: 18, column: 14, scope: !39)
!62 = !DILocation(line: 18, column: 12, scope: !39)
!63 = !DILocation(line: 20, column: 11, scope: !39)
!64 = !DILocation(line: 21, column: 5, scope: !39)
!65 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !66, file: !66, line: 170, type: !67, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mul_s16_u16_div_s16/alarm_0126")
!67 = !DISubroutineType(types: !68)
!68 = !{!6, !6, !6}
!69 = !DILocalVariable(name: "numerator", arg: 1, scope: !65, file: !66, line: 170, type: !6)
!70 = !DILocation(line: 170, column: 31, scope: !65)
!71 = !DILocalVariable(name: "denominator", arg: 2, scope: !65, file: !66, line: 170, type: !6)
!72 = !DILocation(line: 170, column: 47, scope: !65)
!73 = !DILocalVariable(name: "s32Temp1", scope: !65, file: !66, line: 172, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !75)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !76)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !43)
!77 = !DILocation(line: 172, column: 6, scope: !65)
!78 = !DILocalVariable(name: "s32Temp2", scope: !65, file: !66, line: 172, type: !74)
!79 = !DILocation(line: 172, column: 15, scope: !65)
!80 = !DILocation(line: 173, column: 13, scope: !65)
!81 = !DILocation(line: 173, column: 22, scope: !65)
!82 = !DILocation(line: 173, column: 11, scope: !65)
!83 = !DILocation(line: 175, column: 6, scope: !84)
!84 = distinct !DILexicalBlock(scope: !65, file: !66, line: 175, column: 6)
!85 = !DILocation(line: 175, column: 18, scope: !84)
!86 = !DILocation(line: 175, column: 6, scope: !65)
!87 = !DILocation(line: 177, column: 7, scope: !88)
!88 = distinct !DILexicalBlock(scope: !89, file: !66, line: 177, column: 7)
!89 = distinct !DILexicalBlock(scope: !84, file: !66, line: 176, column: 2)
!90 = !DILocation(line: 177, column: 17, scope: !88)
!91 = !DILocation(line: 177, column: 7, scope: !89)
!92 = !DILocation(line: 179, column: 4, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !66, line: 178, column: 3)
!94 = !DILocation(line: 183, column: 4, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !66, line: 182, column: 3)
!96 = !DILocation(line: 188, column: 7, scope: !97)
!97 = distinct !DILexicalBlock(scope: !98, file: !66, line: 188, column: 7)
!98 = distinct !DILexicalBlock(scope: !84, file: !66, line: 187, column: 2)
!99 = !DILocation(line: 188, column: 16, scope: !97)
!100 = !DILocation(line: 188, column: 7, scope: !98)
!101 = !DILocation(line: 190, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !66, line: 189, column: 3)
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
!124 = distinct !DILexicalBlock(scope: !102, file: !66, line: 193, column: 7)
!125 = !DILocation(line: 193, column: 16, scope: !124)
!126 = !DILocation(line: 193, column: 7, scope: !102)
!127 = !DILocation(line: 195, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !129, file: !66, line: 195, column: 8)
!129 = distinct !DILexicalBlock(scope: !124, file: !66, line: 194, column: 4)
!130 = !DILocation(line: 195, column: 17, scope: !128)
!131 = !DILocation(line: 195, column: 8, scope: !129)
!132 = !DILocation(line: 197, column: 18, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !66, line: 196, column: 5)
!134 = !DILocation(line: 197, column: 13, scope: !133)
!135 = !DILocation(line: 197, column: 6, scope: !133)
!136 = !DILocation(line: 201, column: 6, scope: !137)
!137 = distinct !DILexicalBlock(scope: !128, file: !66, line: 200, column: 5)
!138 = !DILocation(line: 206, column: 5, scope: !139)
!139 = distinct !DILexicalBlock(scope: !124, file: !66, line: 205, column: 4)
!140 = !DILocation(line: 211, column: 7, scope: !141)
!141 = distinct !DILexicalBlock(scope: !142, file: !66, line: 211, column: 7)
!142 = distinct !DILexicalBlock(scope: !97, file: !66, line: 210, column: 3)
!143 = !DILocation(line: 211, column: 19, scope: !141)
!144 = !DILocation(line: 211, column: 7, scope: !142)
!145 = !DILocation(line: 213, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !66, line: 212, column: 4)
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
!167 = distinct !DILexicalBlock(scope: !146, file: !66, line: 216, column: 8)
!168 = !DILocation(line: 216, column: 17, scope: !167)
!169 = !DILocation(line: 216, column: 8, scope: !146)
!170 = !DILocation(line: 218, column: 9, scope: !171)
!171 = distinct !DILexicalBlock(scope: !172, file: !66, line: 218, column: 9)
!172 = distinct !DILexicalBlock(scope: !167, file: !66, line: 217, column: 5)
!173 = !DILocation(line: 218, column: 18, scope: !171)
!174 = !DILocation(line: 218, column: 9, scope: !172)
!175 = !DILocation(line: 220, column: 19, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !66, line: 219, column: 6)
!177 = !DILocation(line: 220, column: 14, scope: !176)
!178 = !DILocation(line: 220, column: 7, scope: !176)
!179 = !DILocation(line: 224, column: 7, scope: !180)
!180 = distinct !DILexicalBlock(scope: !171, file: !66, line: 223, column: 6)
!181 = !DILocation(line: 229, column: 6, scope: !182)
!182 = distinct !DILexicalBlock(scope: !167, file: !66, line: 228, column: 5)
!183 = !DILocation(line: 234, column: 5, scope: !184)
!184 = distinct !DILexicalBlock(scope: !141, file: !66, line: 233, column: 4)
!185 = !DILocation(line: 238, column: 1, scope: !65)
!186 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !66, file: !66, line: 255, type: !187, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!187 = !DISubroutineType(types: !188)
!188 = !{!6, !74, !6}
!189 = !DILocalVariable(name: "numerator", arg: 1, scope: !186, file: !66, line: 255, type: !74)
!190 = !DILocation(line: 255, column: 25, scope: !186)
!191 = !DILocalVariable(name: "denominator", arg: 2, scope: !186, file: !66, line: 255, type: !6)
!192 = !DILocation(line: 255, column: 41, scope: !186)
!193 = !DILocalVariable(name: "s32Temp1", scope: !186, file: !66, line: 257, type: !74)
!194 = !DILocation(line: 257, column: 6, scope: !186)
!195 = !DILocalVariable(name: "s32Temp2", scope: !186, file: !66, line: 257, type: !74)
!196 = !DILocation(line: 257, column: 17, scope: !186)
!197 = !DILocation(line: 258, column: 13, scope: !186)
!198 = !DILocation(line: 258, column: 11, scope: !186)
!199 = !DILocation(line: 259, column: 5, scope: !200)
!200 = distinct !DILexicalBlock(scope: !186, file: !66, line: 259, column: 5)
!201 = !DILocation(line: 259, column: 17, scope: !200)
!202 = !DILocation(line: 259, column: 5, scope: !186)
!203 = !DILocation(line: 261, column: 7, scope: !204)
!204 = distinct !DILexicalBlock(scope: !205, file: !66, line: 261, column: 7)
!205 = distinct !DILexicalBlock(scope: !200, file: !66, line: 260, column: 2)
!206 = !DILocation(line: 261, column: 17, scope: !204)
!207 = !DILocation(line: 261, column: 7, scope: !205)
!208 = !DILocation(line: 263, column: 4, scope: !209)
!209 = distinct !DILexicalBlock(scope: !204, file: !66, line: 262, column: 3)
!210 = !DILocation(line: 267, column: 4, scope: !211)
!211 = distinct !DILexicalBlock(scope: !204, file: !66, line: 266, column: 3)
!212 = !DILocation(line: 272, column: 6, scope: !213)
!213 = distinct !DILexicalBlock(scope: !214, file: !66, line: 272, column: 6)
!214 = distinct !DILexicalBlock(scope: !200, file: !66, line: 271, column: 2)
!215 = !DILocation(line: 272, column: 16, scope: !213)
!216 = !DILocation(line: 272, column: 6, scope: !214)
!217 = !DILocation(line: 274, column: 16, scope: !218)
!218 = distinct !DILexicalBlock(scope: !213, file: !66, line: 273, column: 3)
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
!238 = distinct !DILexicalBlock(scope: !218, file: !66, line: 277, column: 7)
!239 = !DILocation(line: 277, column: 16, scope: !238)
!240 = !DILocation(line: 277, column: 7, scope: !218)
!241 = !DILocation(line: 279, column: 8, scope: !242)
!242 = distinct !DILexicalBlock(scope: !243, file: !66, line: 279, column: 8)
!243 = distinct !DILexicalBlock(scope: !238, file: !66, line: 278, column: 4)
!244 = !DILocation(line: 279, column: 17, scope: !242)
!245 = !DILocation(line: 279, column: 8, scope: !243)
!246 = !DILocation(line: 281, column: 18, scope: !247)
!247 = distinct !DILexicalBlock(scope: !242, file: !66, line: 280, column: 5)
!248 = !DILocation(line: 281, column: 13, scope: !247)
!249 = !DILocation(line: 281, column: 6, scope: !247)
!250 = !DILocation(line: 285, column: 6, scope: !251)
!251 = distinct !DILexicalBlock(scope: !242, file: !66, line: 284, column: 5)
!252 = !DILocation(line: 290, column: 5, scope: !253)
!253 = distinct !DILexicalBlock(scope: !238, file: !66, line: 289, column: 4)
!254 = !DILocation(line: 295, column: 7, scope: !255)
!255 = distinct !DILexicalBlock(scope: !256, file: !66, line: 295, column: 7)
!256 = distinct !DILexicalBlock(scope: !213, file: !66, line: 294, column: 3)
!257 = !DILocation(line: 295, column: 19, scope: !255)
!258 = !DILocation(line: 295, column: 7, scope: !256)
!259 = !DILocation(line: 297, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !255, file: !66, line: 296, column: 4)
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
!280 = distinct !DILexicalBlock(scope: !260, file: !66, line: 300, column: 8)
!281 = !DILocation(line: 300, column: 17, scope: !280)
!282 = !DILocation(line: 300, column: 8, scope: !260)
!283 = !DILocation(line: 302, column: 9, scope: !284)
!284 = distinct !DILexicalBlock(scope: !285, file: !66, line: 302, column: 9)
!285 = distinct !DILexicalBlock(scope: !280, file: !66, line: 301, column: 5)
!286 = !DILocation(line: 302, column: 18, scope: !284)
!287 = !DILocation(line: 302, column: 9, scope: !285)
!288 = !DILocation(line: 304, column: 19, scope: !289)
!289 = distinct !DILexicalBlock(scope: !284, file: !66, line: 303, column: 6)
!290 = !DILocation(line: 304, column: 14, scope: !289)
!291 = !DILocation(line: 304, column: 7, scope: !289)
!292 = !DILocation(line: 308, column: 7, scope: !293)
!293 = distinct !DILexicalBlock(scope: !284, file: !66, line: 307, column: 6)
!294 = !DILocation(line: 313, column: 6, scope: !295)
!295 = distinct !DILexicalBlock(scope: !280, file: !66, line: 312, column: 5)
!296 = !DILocation(line: 319, column: 5, scope: !297)
!297 = distinct !DILexicalBlock(scope: !255, file: !66, line: 318, column: 4)
!298 = !DILocation(line: 325, column: 1, scope: !186)
!299 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !66, file: !66, line: 343, type: !300, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!300 = !DISubroutineType(types: !301)
!301 = !{!6, !6, !18}
!302 = !DILocalVariable(name: "numerator", arg: 1, scope: !299, file: !66, line: 343, type: !6)
!303 = !DILocation(line: 343, column: 31, scope: !299)
!304 = !DILocalVariable(name: "denominator", arg: 2, scope: !299, file: !66, line: 343, type: !18)
!305 = !DILocation(line: 343, column: 47, scope: !299)
!306 = !DILocalVariable(name: "u16Temp1", scope: !299, file: !66, line: 345, type: !18)
!307 = !DILocation(line: 345, column: 6, scope: !299)
!308 = !DILocalVariable(name: "s32Temp1", scope: !299, file: !66, line: 346, type: !74)
!309 = !DILocation(line: 346, column: 6, scope: !299)
!310 = !DILocalVariable(name: "s32Temp2", scope: !299, file: !66, line: 346, type: !74)
!311 = !DILocation(line: 346, column: 15, scope: !299)
!312 = !DILocation(line: 347, column: 13, scope: !299)
!313 = !DILocation(line: 347, column: 25, scope: !299)
!314 = !DILocation(line: 347, column: 11, scope: !299)
!315 = !DILocation(line: 348, column: 13, scope: !299)
!316 = !DILocation(line: 348, column: 22, scope: !299)
!317 = !DILocation(line: 348, column: 11, scope: !299)
!318 = !DILocation(line: 349, column: 5, scope: !319)
!319 = distinct !DILexicalBlock(scope: !299, file: !66, line: 349, column: 5)
!320 = !DILocation(line: 349, column: 14, scope: !319)
!321 = !DILocation(line: 349, column: 5, scope: !299)
!322 = !DILocation(line: 351, column: 7, scope: !323)
!323 = distinct !DILexicalBlock(scope: !324, file: !66, line: 351, column: 7)
!324 = distinct !DILexicalBlock(scope: !319, file: !66, line: 350, column: 2)
!325 = !DILocation(line: 351, column: 17, scope: !323)
!326 = !DILocation(line: 351, column: 7, scope: !324)
!327 = !DILocation(line: 353, column: 4, scope: !328)
!328 = distinct !DILexicalBlock(scope: !323, file: !66, line: 352, column: 3)
!329 = !DILocation(line: 357, column: 4, scope: !330)
!330 = distinct !DILexicalBlock(scope: !323, file: !66, line: 356, column: 3)
!331 = !DILocation(line: 362, column: 15, scope: !332)
!332 = distinct !DILexicalBlock(scope: !319, file: !66, line: 361, column: 2)
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
!357 = distinct !DILexicalBlock(scope: !332, file: !66, line: 366, column: 6)
!358 = !DILocation(line: 366, column: 15, scope: !357)
!359 = !DILocation(line: 366, column: 6, scope: !332)
!360 = !DILocation(line: 368, column: 7, scope: !361)
!361 = distinct !DILexicalBlock(scope: !362, file: !66, line: 368, column: 7)
!362 = distinct !DILexicalBlock(scope: !357, file: !66, line: 367, column: 3)
!363 = !DILocation(line: 368, column: 16, scope: !361)
!364 = !DILocation(line: 368, column: 7, scope: !362)
!365 = !DILocation(line: 370, column: 17, scope: !366)
!366 = distinct !DILexicalBlock(scope: !361, file: !66, line: 369, column: 4)
!367 = !DILocation(line: 370, column: 12, scope: !366)
!368 = !DILocation(line: 370, column: 5, scope: !366)
!369 = !DILocation(line: 374, column: 5, scope: !370)
!370 = distinct !DILexicalBlock(scope: !361, file: !66, line: 373, column: 4)
!371 = !DILocation(line: 379, column: 4, scope: !372)
!372 = distinct !DILexicalBlock(scope: !357, file: !66, line: 378, column: 3)
!373 = !DILocation(line: 382, column: 1, scope: !299)
!374 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !66, file: !66, line: 399, type: !300, scopeLine: 400, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!375 = !DILocalVariable(name: "numerator", arg: 1, scope: !374, file: !66, line: 399, type: !6)
!376 = !DILocation(line: 399, column: 30, scope: !374)
!377 = !DILocalVariable(name: "denominator", arg: 2, scope: !374, file: !66, line: 399, type: !18)
!378 = !DILocation(line: 399, column: 45, scope: !374)
!379 = !DILocalVariable(name: "u16Temp1", scope: !374, file: !66, line: 401, type: !18)
!380 = !DILocation(line: 401, column: 6, scope: !374)
!381 = !DILocalVariable(name: "s32Temp1", scope: !374, file: !66, line: 402, type: !74)
!382 = !DILocation(line: 402, column: 6, scope: !374)
!383 = !DILocation(line: 403, column: 13, scope: !374)
!384 = !DILocation(line: 403, column: 25, scope: !374)
!385 = !DILocation(line: 403, column: 11, scope: !374)
!386 = !DILocation(line: 404, column: 5, scope: !387)
!387 = distinct !DILexicalBlock(scope: !374, file: !66, line: 404, column: 5)
!388 = !DILocation(line: 404, column: 13, scope: !387)
!389 = !DILocation(line: 404, column: 5, scope: !374)
!390 = !DILocation(line: 406, column: 6, scope: !391)
!391 = distinct !DILexicalBlock(scope: !392, file: !66, line: 406, column: 6)
!392 = distinct !DILexicalBlock(scope: !387, file: !66, line: 405, column: 2)
!393 = !DILocation(line: 406, column: 15, scope: !391)
!394 = !DILocation(line: 406, column: 6, scope: !392)
!395 = !DILocation(line: 408, column: 4, scope: !396)
!396 = distinct !DILexicalBlock(scope: !391, file: !66, line: 407, column: 3)
!397 = !DILocation(line: 412, column: 4, scope: !398)
!398 = distinct !DILexicalBlock(scope: !391, file: !66, line: 411, column: 3)
!399 = !DILocation(line: 418, column: 15, scope: !400)
!400 = distinct !DILexicalBlock(scope: !387, file: !66, line: 417, column: 2)
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
!420 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !66, file: !66, line: 440, type: !421, scopeLine: 441, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!421 = !DISubroutineType(types: !422)
!422 = !{!13, !18, !18}
!423 = !DILocalVariable(name: "numerator", arg: 1, scope: !420, file: !66, line: 440, type: !18)
!424 = !DILocation(line: 440, column: 28, scope: !420)
!425 = !DILocalVariable(name: "denominator", arg: 2, scope: !420, file: !66, line: 440, type: !18)
!426 = !DILocation(line: 440, column: 43, scope: !420)
!427 = !DILocalVariable(name: "u32Temp1", scope: !420, file: !66, line: 442, type: !428)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !429)
!429 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !15, line: 26, baseType: !430)
!430 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !431)
!431 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!432 = !DILocation(line: 442, column: 6, scope: !420)
!433 = !DILocalVariable(name: "u32Temp2", scope: !420, file: !66, line: 442, type: !428)
!434 = !DILocation(line: 442, column: 20, scope: !420)
!435 = !DILocalVariable(name: "u32Temp3", scope: !420, file: !66, line: 442, type: !428)
!436 = !DILocation(line: 442, column: 33, scope: !420)
!437 = !DILocation(line: 443, column: 5, scope: !438)
!438 = distinct !DILexicalBlock(scope: !420, file: !66, line: 443, column: 5)
!439 = !DILocation(line: 443, column: 16, scope: !438)
!440 = !DILocation(line: 443, column: 5, scope: !420)
!441 = !DILocation(line: 445, column: 3, scope: !442)
!442 = distinct !DILexicalBlock(scope: !438, file: !66, line: 444, column: 2)
!443 = !DILocation(line: 449, column: 15, scope: !444)
!444 = distinct !DILexicalBlock(scope: !438, file: !66, line: 448, column: 2)
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
!456 = distinct !DILexicalBlock(scope: !444, file: !66, line: 452, column: 6)
!457 = !DILocation(line: 452, column: 15, scope: !456)
!458 = !DILocation(line: 452, column: 6, scope: !444)
!459 = !DILocation(line: 454, column: 15, scope: !460)
!460 = distinct !DILexicalBlock(scope: !456, file: !66, line: 453, column: 3)
!461 = !DILocation(line: 454, column: 11, scope: !460)
!462 = !DILocation(line: 454, column: 4, scope: !460)
!463 = !DILocation(line: 458, column: 4, scope: !464)
!464 = distinct !DILexicalBlock(scope: !456, file: !66, line: 457, column: 3)
!465 = !DILocation(line: 461, column: 1, scope: !420)
!466 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !66, file: !66, line: 478, type: !467, scopeLine: 479, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!467 = !DISubroutineType(types: !468)
!468 = !{!18, !74, !18}
!469 = !DILocalVariable(name: "x_value", arg: 1, scope: !466, file: !66, line: 478, type: !74)
!470 = !DILocation(line: 478, column: 25, scope: !466)
!471 = !DILocalVariable(name: "y_value", arg: 2, scope: !466, file: !66, line: 478, type: !18)
!472 = !DILocation(line: 478, column: 38, scope: !466)
!473 = !DILocalVariable(name: "s32Temp1", scope: !466, file: !66, line: 480, type: !74)
!474 = !DILocation(line: 480, column: 6, scope: !466)
!475 = !DILocation(line: 481, column: 12, scope: !466)
!476 = !DILocation(line: 481, column: 20, scope: !466)
!477 = !DILocation(line: 481, column: 10, scope: !466)
!478 = !DILocation(line: 482, column: 6, scope: !479)
!479 = distinct !DILexicalBlock(scope: !466, file: !66, line: 482, column: 5)
!480 = !DILocation(line: 482, column: 14, scope: !479)
!481 = !DILocation(line: 482, column: 24, scope: !479)
!482 = !DILocation(line: 482, column: 5, scope: !466)
!483 = !DILocation(line: 484, column: 6, scope: !484)
!484 = distinct !DILexicalBlock(scope: !485, file: !66, line: 484, column: 6)
!485 = distinct !DILexicalBlock(scope: !479, file: !66, line: 483, column: 2)
!486 = !DILocation(line: 484, column: 14, scope: !484)
!487 = !DILocation(line: 484, column: 6, scope: !485)
!488 = !DILocation(line: 486, column: 4, scope: !489)
!489 = distinct !DILexicalBlock(scope: !484, file: !66, line: 485, column: 3)
!490 = !DILocation(line: 490, column: 4, scope: !491)
!491 = distinct !DILexicalBlock(scope: !484, file: !66, line: 489, column: 3)
!492 = !DILocation(line: 495, column: 15, scope: !493)
!493 = distinct !DILexicalBlock(scope: !479, file: !66, line: 494, column: 2)
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
!511 = distinct !DILexicalBlock(scope: !493, file: !66, line: 497, column: 6)
!512 = !DILocation(line: 497, column: 15, scope: !511)
!513 = !DILocation(line: 497, column: 6, scope: !493)
!514 = !DILocation(line: 499, column: 7, scope: !515)
!515 = distinct !DILexicalBlock(scope: !516, file: !66, line: 499, column: 7)
!516 = distinct !DILexicalBlock(scope: !511, file: !66, line: 498, column: 3)
!517 = !DILocation(line: 499, column: 16, scope: !515)
!518 = !DILocation(line: 499, column: 7, scope: !516)
!519 = !DILocation(line: 501, column: 17, scope: !520)
!520 = distinct !DILexicalBlock(scope: !515, file: !66, line: 500, column: 4)
!521 = !DILocation(line: 501, column: 12, scope: !520)
!522 = !DILocation(line: 501, column: 5, scope: !520)
!523 = !DILocation(line: 505, column: 5, scope: !524)
!524 = distinct !DILexicalBlock(scope: !515, file: !66, line: 504, column: 4)
!525 = !DILocation(line: 510, column: 4, scope: !526)
!526 = distinct !DILexicalBlock(scope: !511, file: !66, line: 509, column: 3)
!527 = !DILocation(line: 513, column: 1, scope: !466)
!528 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !66, file: !66, line: 531, type: !529, scopeLine: 532, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!529 = !DISubroutineType(types: !530)
!530 = !{!18, !18, !18}
!531 = !DILocalVariable(name: "numerator", arg: 1, scope: !528, file: !66, line: 531, type: !18)
!532 = !DILocation(line: 531, column: 31, scope: !528)
!533 = !DILocalVariable(name: "denominator", arg: 2, scope: !528, file: !66, line: 531, type: !18)
!534 = !DILocation(line: 531, column: 46, scope: !528)
!535 = !DILocalVariable(name: "u32Temp", scope: !528, file: !66, line: 533, type: !428)
!536 = !DILocation(line: 533, column: 6, scope: !528)
!537 = !DILocation(line: 534, column: 5, scope: !538)
!538 = distinct !DILexicalBlock(scope: !528, file: !66, line: 534, column: 5)
!539 = !DILocation(line: 534, column: 17, scope: !538)
!540 = !DILocation(line: 534, column: 5, scope: !528)
!541 = !DILocation(line: 536, column: 3, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !66, line: 535, column: 2)
!543 = !DILocation(line: 540, column: 14, scope: !544)
!544 = distinct !DILexicalBlock(scope: !538, file: !66, line: 539, column: 2)
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
!555 = distinct !DILexicalBlock(scope: !544, file: !66, line: 542, column: 6)
!556 = !DILocation(line: 542, column: 14, scope: !555)
!557 = !DILocation(line: 542, column: 6, scope: !544)
!558 = !DILocation(line: 544, column: 11, scope: !559)
!559 = distinct !DILexicalBlock(scope: !555, file: !66, line: 543, column: 3)
!560 = !DILocation(line: 544, column: 19, scope: !559)
!561 = !DILocation(line: 544, column: 4, scope: !559)
!562 = !DILocation(line: 548, column: 4, scope: !563)
!563 = distinct !DILexicalBlock(scope: !555, file: !66, line: 547, column: 3)
!564 = !DILocation(line: 552, column: 1, scope: !528)
!565 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !66, file: !66, line: 569, type: !566, scopeLine: 570, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!566 = !DISubroutineType(types: !567)
!567 = !{!18, !428, !18}
!568 = !DILocalVariable(name: "x_value", arg: 1, scope: !565, file: !66, line: 569, type: !428)
!569 = !DILocation(line: 569, column: 25, scope: !565)
!570 = !DILocalVariable(name: "y_value", arg: 2, scope: !565, file: !66, line: 569, type: !18)
!571 = !DILocation(line: 569, column: 38, scope: !565)
!572 = !DILocalVariable(name: "u32Temp1", scope: !565, file: !66, line: 571, type: !428)
!573 = !DILocation(line: 571, column: 6, scope: !565)
!574 = !DILocalVariable(name: "u32Temp2", scope: !565, file: !66, line: 571, type: !428)
!575 = !DILocation(line: 571, column: 17, scope: !565)
!576 = !DILocation(line: 572, column: 12, scope: !565)
!577 = !DILocation(line: 572, column: 20, scope: !565)
!578 = !DILocation(line: 572, column: 10, scope: !565)
!579 = !DILocation(line: 573, column: 5, scope: !580)
!580 = distinct !DILexicalBlock(scope: !565, file: !66, line: 573, column: 5)
!581 = !DILocation(line: 573, column: 13, scope: !580)
!582 = !DILocation(line: 573, column: 5, scope: !565)
!583 = !DILocation(line: 575, column: 3, scope: !584)
!584 = distinct !DILexicalBlock(scope: !580, file: !66, line: 574, column: 2)
!585 = !DILocation(line: 579, column: 14, scope: !586)
!586 = distinct !DILexicalBlock(scope: !580, file: !66, line: 578, column: 2)
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
!606 = distinct !DILexicalBlock(scope: !586, file: !66, line: 582, column: 6)
!607 = !DILocation(line: 582, column: 15, scope: !606)
!608 = !DILocation(line: 582, column: 6, scope: !586)
!609 = !DILocation(line: 584, column: 11, scope: !610)
!610 = distinct !DILexicalBlock(scope: !606, file: !66, line: 583, column: 3)
!611 = !DILocation(line: 584, column: 20, scope: !610)
!612 = !DILocation(line: 584, column: 4, scope: !610)
!613 = !DILocation(line: 588, column: 4, scope: !614)
!614 = distinct !DILexicalBlock(scope: !606, file: !66, line: 587, column: 3)
!615 = !DILocation(line: 592, column: 1, scope: !565)
!616 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !66, file: !66, line: 611, type: !617, scopeLine: 612, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!617 = !DISubroutineType(types: !618)
!618 = !{!6, !6, !18, !6}
!619 = !DILocalVariable(name: "factor1", arg: 1, scope: !616, file: !66, line: 611, type: !6)
!620 = !DILocation(line: 611, column: 33, scope: !616)
!621 = !DILocalVariable(name: "factor2", arg: 2, scope: !616, file: !66, line: 611, type: !18)
!622 = !DILocation(line: 611, column: 46, scope: !616)
!623 = !DILocalVariable(name: "denominator", arg: 3, scope: !616, file: !66, line: 611, type: !6)
!624 = !DILocation(line: 611, column: 59, scope: !616)
!625 = !DILocalVariable(name: "s32Result", scope: !616, file: !66, line: 613, type: !74)
!626 = !DILocation(line: 613, column: 6, scope: !616)
!627 = !DILocalVariable(name: "s32Temp1", scope: !616, file: !66, line: 613, type: !74)
!628 = !DILocation(line: 613, column: 21, scope: !616)
!629 = !DILocation(line: 614, column: 14, scope: !616)
!630 = !DILocation(line: 614, column: 24, scope: !616)
!631 = !DILocation(line: 614, column: 22, scope: !616)
!632 = !DILocation(line: 614, column: 12, scope: !616)
!633 = !DILocation(line: 615, column: 5, scope: !634)
!634 = distinct !DILexicalBlock(scope: !616, file: !66, line: 615, column: 5)
!635 = !DILocation(line: 615, column: 17, scope: !634)
!636 = !DILocation(line: 615, column: 5, scope: !616)
!637 = !DILocation(line: 617, column: 6, scope: !638)
!638 = distinct !DILexicalBlock(scope: !639, file: !66, line: 617, column: 6)
!639 = distinct !DILexicalBlock(scope: !634, file: !66, line: 616, column: 2)
!640 = !DILocation(line: 617, column: 16, scope: !638)
!641 = !DILocation(line: 617, column: 6, scope: !639)
!642 = !DILocation(line: 619, column: 4, scope: !643)
!643 = distinct !DILexicalBlock(scope: !638, file: !66, line: 618, column: 3)
!644 = !DILocation(line: 623, column: 4, scope: !645)
!645 = distinct !DILexicalBlock(scope: !638, file: !66, line: 622, column: 3)
!646 = !DILocation(line: 628, column: 14, scope: !647)
!647 = distinct !DILexicalBlock(scope: !634, file: !66, line: 627, column: 2)
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
!667 = distinct !DILexicalBlock(scope: !647, file: !66, line: 631, column: 6)
!668 = !DILocation(line: 631, column: 16, scope: !667)
!669 = !DILocation(line: 631, column: 6, scope: !647)
!670 = !DILocation(line: 633, column: 7, scope: !671)
!671 = distinct !DILexicalBlock(scope: !672, file: !66, line: 633, column: 7)
!672 = distinct !DILexicalBlock(scope: !667, file: !66, line: 632, column: 3)
!673 = !DILocation(line: 633, column: 17, scope: !671)
!674 = !DILocation(line: 633, column: 7, scope: !672)
!675 = !DILocation(line: 635, column: 17, scope: !676)
!676 = distinct !DILexicalBlock(scope: !671, file: !66, line: 634, column: 4)
!677 = !DILocation(line: 635, column: 12, scope: !676)
!678 = !DILocation(line: 635, column: 5, scope: !676)
!679 = !DILocation(line: 640, column: 5, scope: !680)
!680 = distinct !DILexicalBlock(scope: !671, file: !66, line: 639, column: 4)
!681 = !DILocation(line: 645, column: 4, scope: !682)
!682 = distinct !DILexicalBlock(scope: !667, file: !66, line: 644, column: 3)
!683 = !DILocation(line: 649, column: 1, scope: !616)
!684 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !66, file: !66, line: 667, type: !685, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!685 = !DISubroutineType(types: !686)
!686 = !{!6, !18, !6, !18}
!687 = !DILocalVariable(name: "factor1", arg: 1, scope: !684, file: !66, line: 667, type: !18)
!688 = !DILocation(line: 667, column: 33, scope: !684)
!689 = !DILocalVariable(name: "factor2", arg: 2, scope: !684, file: !66, line: 667, type: !6)
!690 = !DILocation(line: 667, column: 46, scope: !684)
!691 = !DILocalVariable(name: "denominator", arg: 3, scope: !684, file: !66, line: 667, type: !18)
!692 = !DILocation(line: 667, column: 59, scope: !684)
!693 = !DILocalVariable(name: "s32Result", scope: !684, file: !66, line: 669, type: !74)
!694 = !DILocation(line: 669, column: 6, scope: !684)
!695 = !DILocalVariable(name: "s32Temp1", scope: !684, file: !66, line: 669, type: !74)
!696 = !DILocation(line: 669, column: 21, scope: !684)
!697 = !DILocation(line: 670, column: 14, scope: !684)
!698 = !DILocation(line: 670, column: 24, scope: !684)
!699 = !DILocation(line: 670, column: 22, scope: !684)
!700 = !DILocation(line: 670, column: 12, scope: !684)
!701 = !DILocation(line: 671, column: 5, scope: !702)
!702 = distinct !DILexicalBlock(scope: !684, file: !66, line: 671, column: 5)
!703 = !DILocation(line: 671, column: 16, scope: !702)
!704 = !DILocation(line: 671, column: 5, scope: !684)
!705 = !DILocation(line: 673, column: 6, scope: !706)
!706 = distinct !DILexicalBlock(scope: !707, file: !66, line: 673, column: 6)
!707 = distinct !DILexicalBlock(scope: !702, file: !66, line: 672, column: 2)
!708 = !DILocation(line: 673, column: 16, scope: !706)
!709 = !DILocation(line: 673, column: 6, scope: !707)
!710 = !DILocation(line: 675, column: 4, scope: !711)
!711 = distinct !DILexicalBlock(scope: !706, file: !66, line: 674, column: 3)
!712 = !DILocation(line: 679, column: 4, scope: !713)
!713 = distinct !DILexicalBlock(scope: !706, file: !66, line: 678, column: 3)
!714 = !DILocation(line: 684, column: 14, scope: !715)
!715 = distinct !DILexicalBlock(scope: !702, file: !66, line: 683, column: 2)
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
!733 = distinct !DILexicalBlock(scope: !715, file: !66, line: 686, column: 6)
!734 = !DILocation(line: 686, column: 16, scope: !733)
!735 = !DILocation(line: 686, column: 6, scope: !715)
!736 = !DILocation(line: 688, column: 7, scope: !737)
!737 = distinct !DILexicalBlock(scope: !738, file: !66, line: 688, column: 7)
!738 = distinct !DILexicalBlock(scope: !733, file: !66, line: 687, column: 3)
!739 = !DILocation(line: 688, column: 17, scope: !737)
!740 = !DILocation(line: 688, column: 7, scope: !738)
!741 = !DILocation(line: 690, column: 17, scope: !742)
!742 = distinct !DILexicalBlock(scope: !737, file: !66, line: 689, column: 4)
!743 = !DILocation(line: 690, column: 12, scope: !742)
!744 = !DILocation(line: 690, column: 5, scope: !742)
!745 = !DILocation(line: 694, column: 5, scope: !746)
!746 = distinct !DILexicalBlock(scope: !737, file: !66, line: 693, column: 4)
!747 = !DILocation(line: 699, column: 4, scope: !748)
!748 = distinct !DILexicalBlock(scope: !733, file: !66, line: 698, column: 3)
!749 = !DILocation(line: 702, column: 1, scope: !684)
!750 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !66, file: !66, line: 721, type: !751, scopeLine: 722, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!751 = !DISubroutineType(types: !752)
!752 = !{!18, !6, !18, !6}
!753 = !DILocalVariable(name: "factor1", arg: 1, scope: !750, file: !66, line: 721, type: !6)
!754 = !DILocation(line: 721, column: 33, scope: !750)
!755 = !DILocalVariable(name: "factor2", arg: 2, scope: !750, file: !66, line: 721, type: !18)
!756 = !DILocation(line: 721, column: 46, scope: !750)
!757 = !DILocalVariable(name: "denominator", arg: 3, scope: !750, file: !66, line: 721, type: !6)
!758 = !DILocation(line: 721, column: 59, scope: !750)
!759 = !DILocalVariable(name: "u32Result", scope: !750, file: !66, line: 723, type: !428)
!760 = !DILocation(line: 723, column: 6, scope: !750)
!761 = !DILocalVariable(name: "u32Temp1", scope: !750, file: !66, line: 723, type: !428)
!762 = !DILocation(line: 723, column: 21, scope: !750)
!763 = !DILocalVariable(name: "s32Result", scope: !750, file: !66, line: 724, type: !74)
!764 = !DILocation(line: 724, column: 6, scope: !750)
!765 = !DILocalVariable(name: "s32Temp1", scope: !750, file: !66, line: 724, type: !74)
!766 = !DILocation(line: 724, column: 21, scope: !750)
!767 = !DILocation(line: 725, column: 14, scope: !750)
!768 = !DILocation(line: 725, column: 24, scope: !750)
!769 = !DILocation(line: 725, column: 22, scope: !750)
!770 = !DILocation(line: 725, column: 12, scope: !750)
!771 = !DILocation(line: 727, column: 5, scope: !772)
!772 = distinct !DILexicalBlock(scope: !750, file: !66, line: 727, column: 5)
!773 = !DILocation(line: 727, column: 17, scope: !772)
!774 = !DILocation(line: 727, column: 5, scope: !750)
!775 = !DILocation(line: 729, column: 6, scope: !776)
!776 = distinct !DILexicalBlock(scope: !777, file: !66, line: 729, column: 6)
!777 = distinct !DILexicalBlock(scope: !772, file: !66, line: 728, column: 2)
!778 = !DILocation(line: 729, column: 16, scope: !776)
!779 = !DILocation(line: 729, column: 6, scope: !777)
!780 = !DILocation(line: 731, column: 4, scope: !781)
!781 = distinct !DILexicalBlock(scope: !776, file: !66, line: 730, column: 3)
!782 = !DILocation(line: 735, column: 4, scope: !783)
!783 = distinct !DILexicalBlock(scope: !776, file: !66, line: 734, column: 3)
!784 = !DILocation(line: 741, column: 46, scope: !785)
!785 = distinct !DILexicalBlock(scope: !786, file: !66, line: 741, column: 7)
!786 = distinct !DILexicalBlock(scope: !772, file: !66, line: 739, column: 2)
!787 = !DILocation(line: 741, column: 36, scope: !785)
!788 = !DILocation(line: 741, column: 9, scope: !785)
!789 = !DILocation(line: 741, column: 7, scope: !786)
!790 = !DILocation(line: 742, column: 7, scope: !791)
!791 = distinct !DILexicalBlock(scope: !785, file: !66, line: 741, column: 62)
!792 = !DILocation(line: 749, column: 35, scope: !786)
!793 = !DILocation(line: 749, column: 47, scope: !786)
!794 = !DILocation(line: 749, column: 45, scope: !786)
!795 = !DILocation(line: 749, column: 25, scope: !786)
!796 = !DILocation(line: 749, column: 23, scope: !786)
!797 = !DILocation(line: 750, column: 3, scope: !786)
!798 = !DILocation(line: 768, column: 1, scope: !750)
!799 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !26, file: !26, line: 24, type: !800, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!800 = !DISubroutineType(types: !801)
!801 = !{!43, !22}
!802 = !DILocalVariable(name: "denominator", arg: 1, scope: !799, file: !26, line: 24, type: !22)
!803 = !DILocation(line: 24, column: 40, scope: !799)
!804 = !DILocation(line: 26, column: 12, scope: !799)
!805 = !DILocation(line: 26, column: 24, scope: !799)
!806 = !DILocation(line: 26, column: 5, scope: !799)
!807 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !66, file: !66, line: 787, type: !808, scopeLine: 788, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!808 = !DISubroutineType(types: !809)
!809 = !{!18, !6, !18, !18}
!810 = !DILocalVariable(name: "factor1", arg: 1, scope: !807, file: !66, line: 787, type: !6)
!811 = !DILocation(line: 787, column: 33, scope: !807)
!812 = !DILocalVariable(name: "factor2", arg: 2, scope: !807, file: !66, line: 787, type: !18)
!813 = !DILocation(line: 787, column: 46, scope: !807)
!814 = !DILocalVariable(name: "denominator", arg: 3, scope: !807, file: !66, line: 787, type: !18)
!815 = !DILocation(line: 787, column: 59, scope: !807)
!816 = !DILocalVariable(name: "s32Result", scope: !807, file: !66, line: 789, type: !74)
!817 = !DILocation(line: 789, column: 6, scope: !807)
!818 = !DILocalVariable(name: "s32Temp1", scope: !807, file: !66, line: 789, type: !74)
!819 = !DILocation(line: 789, column: 21, scope: !807)
!820 = !DILocation(line: 790, column: 14, scope: !807)
!821 = !DILocation(line: 790, column: 24, scope: !807)
!822 = !DILocation(line: 790, column: 22, scope: !807)
!823 = !DILocation(line: 790, column: 12, scope: !807)
!824 = !DILocation(line: 792, column: 5, scope: !825)
!825 = distinct !DILexicalBlock(scope: !807, file: !66, line: 792, column: 5)
!826 = !DILocation(line: 792, column: 17, scope: !825)
!827 = !DILocation(line: 792, column: 5, scope: !807)
!828 = !DILocation(line: 794, column: 6, scope: !829)
!829 = distinct !DILexicalBlock(scope: !830, file: !66, line: 794, column: 6)
!830 = distinct !DILexicalBlock(scope: !825, file: !66, line: 793, column: 2)
!831 = !DILocation(line: 794, column: 16, scope: !829)
!832 = !DILocation(line: 794, column: 6, scope: !830)
!833 = !DILocation(line: 796, column: 4, scope: !834)
!834 = distinct !DILexicalBlock(scope: !829, file: !66, line: 795, column: 3)
!835 = !DILocation(line: 800, column: 4, scope: !836)
!836 = distinct !DILexicalBlock(scope: !829, file: !66, line: 799, column: 3)
!837 = !DILocation(line: 805, column: 15, scope: !838)
!838 = distinct !DILexicalBlock(scope: !825, file: !66, line: 804, column: 2)
!839 = !DILocation(line: 805, column: 29, scope: !838)
!840 = !DILocation(line: 805, column: 39, scope: !838)
!841 = !DILocation(line: 805, column: 38, scope: !838)
!842 = !DILocation(line: 805, column: 54, scope: !838)
!843 = !DILocation(line: 805, column: 52, scope: !838)
!844 = !DILocation(line: 805, column: 25, scope: !838)
!845 = !DILocation(line: 805, column: 68, scope: !838)
!846 = !DILocation(line: 805, column: 12, scope: !838)
!847 = !DILocation(line: 806, column: 16, scope: !838)
!848 = !DILocation(line: 806, column: 25, scope: !838)
!849 = !DILocation(line: 806, column: 24, scope: !838)
!850 = !DILocation(line: 806, column: 41, scope: !838)
!851 = !DILocation(line: 806, column: 51, scope: !838)
!852 = !DILocation(line: 806, column: 50, scope: !838)
!853 = !DILocation(line: 806, column: 38, scope: !838)
!854 = !DILocation(line: 806, column: 13, scope: !838)
!855 = !DILocation(line: 807, column: 6, scope: !856)
!856 = distinct !DILexicalBlock(scope: !838, file: !66, line: 807, column: 6)
!857 = !DILocation(line: 807, column: 16, scope: !856)
!858 = !DILocation(line: 807, column: 6, scope: !838)
!859 = !DILocation(line: 809, column: 7, scope: !860)
!860 = distinct !DILexicalBlock(scope: !861, file: !66, line: 809, column: 7)
!861 = distinct !DILexicalBlock(scope: !856, file: !66, line: 808, column: 3)
!862 = !DILocation(line: 809, column: 17, scope: !860)
!863 = !DILocation(line: 809, column: 7, scope: !861)
!864 = !DILocation(line: 811, column: 17, scope: !865)
!865 = distinct !DILexicalBlock(scope: !860, file: !66, line: 810, column: 4)
!866 = !DILocation(line: 811, column: 12, scope: !865)
!867 = !DILocation(line: 811, column: 5, scope: !865)
!868 = !DILocation(line: 815, column: 5, scope: !869)
!869 = distinct !DILexicalBlock(scope: !860, file: !66, line: 814, column: 4)
!870 = !DILocation(line: 820, column: 4, scope: !871)
!871 = distinct !DILexicalBlock(scope: !856, file: !66, line: 819, column: 3)
!872 = !DILocation(line: 824, column: 1, scope: !807)
!873 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !66, file: !66, line: 842, type: !874, scopeLine: 843, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!874 = !DISubroutineType(types: !875)
!875 = !{!18, !18, !18, !18}
!876 = !DILocalVariable(name: "factor1", arg: 1, scope: !873, file: !66, line: 842, type: !18)
!877 = !DILocation(line: 842, column: 33, scope: !873)
!878 = !DILocalVariable(name: "factor2", arg: 2, scope: !873, file: !66, line: 842, type: !18)
!879 = !DILocation(line: 842, column: 46, scope: !873)
!880 = !DILocalVariable(name: "denominator", arg: 3, scope: !873, file: !66, line: 842, type: !18)
!881 = !DILocation(line: 842, column: 59, scope: !873)
!882 = !DILocalVariable(name: "u32Temp1", scope: !873, file: !66, line: 844, type: !428)
!883 = !DILocation(line: 844, column: 6, scope: !873)
!884 = !DILocalVariable(name: "u16TempDenom", scope: !873, file: !66, line: 845, type: !18)
!885 = !DILocation(line: 845, column: 6, scope: !873)
!886 = !DILocation(line: 847, column: 5, scope: !887)
!887 = distinct !DILexicalBlock(scope: !873, file: !66, line: 847, column: 5)
!888 = !DILocation(line: 847, column: 17, scope: !887)
!889 = !DILocation(line: 847, column: 5, scope: !873)
!890 = !DILocation(line: 849, column: 3, scope: !891)
!891 = distinct !DILexicalBlock(scope: !887, file: !66, line: 848, column: 2)
!892 = !DILocation(line: 853, column: 14, scope: !893)
!893 = distinct !DILexicalBlock(scope: !887, file: !66, line: 852, column: 2)
!894 = !DILocation(line: 853, column: 24, scope: !893)
!895 = !DILocation(line: 853, column: 22, scope: !893)
!896 = !DILocation(line: 853, column: 12, scope: !893)
!897 = !DILocation(line: 854, column: 18, scope: !893)
!898 = !DILocation(line: 854, column: 30, scope: !893)
!899 = !DILocation(line: 854, column: 16, scope: !893)
!900 = !DILocation(line: 855, column: 14, scope: !893)
!901 = !DILocation(line: 855, column: 25, scope: !893)
!902 = !DILocation(line: 855, column: 23, scope: !893)
!903 = !DILocation(line: 855, column: 12, scope: !893)
!904 = !DILocation(line: 856, column: 14, scope: !893)
!905 = !DILocation(line: 856, column: 25, scope: !893)
!906 = !DILocation(line: 856, column: 23, scope: !893)
!907 = !DILocation(line: 856, column: 12, scope: !893)
!908 = !DILocation(line: 857, column: 6, scope: !909)
!909 = distinct !DILexicalBlock(scope: !893, file: !66, line: 857, column: 6)
!910 = !DILocation(line: 857, column: 15, scope: !909)
!911 = !DILocation(line: 857, column: 6, scope: !893)
!912 = !DILocation(line: 859, column: 12, scope: !913)
!913 = distinct !DILexicalBlock(scope: !909, file: !66, line: 858, column: 3)
!914 = !DILocation(line: 859, column: 21, scope: !913)
!915 = !DILocation(line: 859, column: 11, scope: !913)
!916 = !DILocation(line: 859, column: 4, scope: !913)
!917 = !DILocation(line: 864, column: 4, scope: !918)
!918 = distinct !DILexicalBlock(scope: !909, file: !66, line: 863, column: 3)
!919 = !DILocation(line: 869, column: 1, scope: !873)
!920 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !66, file: !66, line: 886, type: !921, scopeLine: 887, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!921 = !DISubroutineType(types: !922)
!922 = !{!18, !18, !18, !428}
!923 = !DILocalVariable(name: "factor1", arg: 1, scope: !920, file: !66, line: 886, type: !18)
!924 = !DILocation(line: 886, column: 33, scope: !920)
!925 = !DILocalVariable(name: "factor2", arg: 2, scope: !920, file: !66, line: 886, type: !18)
!926 = !DILocation(line: 886, column: 46, scope: !920)
!927 = !DILocalVariable(name: "denominator", arg: 3, scope: !920, file: !66, line: 886, type: !428)
!928 = !DILocation(line: 886, column: 59, scope: !920)
!929 = !DILocalVariable(name: "u32Temp1", scope: !920, file: !66, line: 888, type: !428)
!930 = !DILocation(line: 888, column: 6, scope: !920)
!931 = !DILocation(line: 889, column: 5, scope: !932)
!932 = distinct !DILexicalBlock(scope: !920, file: !66, line: 889, column: 5)
!933 = !DILocation(line: 889, column: 17, scope: !932)
!934 = !DILocation(line: 889, column: 5, scope: !920)
!935 = !DILocation(line: 891, column: 3, scope: !936)
!936 = distinct !DILexicalBlock(scope: !932, file: !66, line: 890, column: 2)
!937 = !DILocation(line: 895, column: 15, scope: !938)
!938 = distinct !DILexicalBlock(scope: !932, file: !66, line: 894, column: 2)
!939 = !DILocation(line: 895, column: 25, scope: !938)
!940 = !DILocation(line: 895, column: 23, scope: !938)
!941 = !DILocation(line: 895, column: 36, scope: !938)
!942 = !DILocation(line: 895, column: 34, scope: !938)
!943 = !DILocation(line: 895, column: 12, scope: !938)
!944 = !DILocation(line: 896, column: 8, scope: !945)
!945 = distinct !DILexicalBlock(scope: !938, file: !66, line: 896, column: 6)
!946 = !DILocation(line: 896, column: 18, scope: !945)
!947 = !DILocation(line: 896, column: 16, scope: !945)
!948 = !DILocation(line: 896, column: 28, scope: !945)
!949 = !DILocation(line: 896, column: 40, scope: !945)
!950 = !DILocation(line: 896, column: 39, scope: !945)
!951 = !DILocation(line: 896, column: 26, scope: !945)
!952 = !DILocation(line: 896, column: 53, scope: !945)
!953 = !DILocation(line: 896, column: 64, scope: !945)
!954 = !DILocation(line: 896, column: 50, scope: !945)
!955 = !DILocation(line: 896, column: 6, scope: !938)
!956 = !DILocation(line: 898, column: 12, scope: !957)
!957 = distinct !DILexicalBlock(scope: !945, file: !66, line: 897, column: 3)
!958 = !DILocation(line: 899, column: 3, scope: !957)
!959 = !DILocation(line: 900, column: 6, scope: !960)
!960 = distinct !DILexicalBlock(scope: !938, file: !66, line: 900, column: 6)
!961 = !DILocation(line: 900, column: 15, scope: !960)
!962 = !DILocation(line: 900, column: 6, scope: !938)
!963 = !DILocation(line: 902, column: 12, scope: !964)
!964 = distinct !DILexicalBlock(scope: !960, file: !66, line: 901, column: 3)
!965 = !DILocation(line: 902, column: 21, scope: !964)
!966 = !DILocation(line: 902, column: 11, scope: !964)
!967 = !DILocation(line: 902, column: 4, scope: !964)
!968 = !DILocation(line: 906, column: 4, scope: !969)
!969 = distinct !DILexicalBlock(scope: !960, file: !66, line: 905, column: 3)
!970 = !DILocation(line: 909, column: 1, scope: !920)
!971 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !66, file: !66, line: 926, type: !972, scopeLine: 927, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!972 = !DISubroutineType(types: !973)
!973 = !{!428, !428, !18}
!974 = !DILocalVariable(name: "x_value", arg: 1, scope: !971, file: !66, line: 926, type: !428)
!975 = !DILocation(line: 926, column: 25, scope: !971)
!976 = !DILocalVariable(name: "y_value", arg: 2, scope: !971, file: !66, line: 926, type: !18)
!977 = !DILocation(line: 926, column: 38, scope: !971)
!978 = !DILocalVariable(name: "u32Temp1", scope: !971, file: !66, line: 928, type: !428)
!979 = !DILocation(line: 928, column: 6, scope: !971)
!980 = !DILocation(line: 929, column: 5, scope: !981)
!981 = distinct !DILexicalBlock(scope: !971, file: !66, line: 929, column: 5)
!982 = !DILocation(line: 929, column: 13, scope: !981)
!983 = !DILocation(line: 929, column: 5, scope: !971)
!984 = !DILocation(line: 931, column: 3, scope: !985)
!985 = distinct !DILexicalBlock(scope: !981, file: !66, line: 930, column: 2)
!986 = !DILocation(line: 935, column: 15, scope: !987)
!987 = distinct !DILexicalBlock(scope: !981, file: !66, line: 934, column: 2)
!988 = !DILocation(line: 935, column: 26, scope: !987)
!989 = !DILocation(line: 935, column: 34, scope: !987)
!990 = !DILocation(line: 935, column: 33, scope: !987)
!991 = !DILocation(line: 935, column: 45, scope: !987)
!992 = !DILocation(line: 935, column: 43, scope: !987)
!993 = !DILocation(line: 935, column: 23, scope: !987)
!994 = !DILocation(line: 935, column: 54, scope: !987)
!995 = !DILocation(line: 935, column: 12, scope: !987)
!996 = !DILocation(line: 936, column: 15, scope: !987)
!997 = !DILocation(line: 936, column: 23, scope: !987)
!998 = !DILocation(line: 936, column: 22, scope: !987)
!999 = !DILocation(line: 936, column: 35, scope: !987)
!1000 = !DILocation(line: 936, column: 44, scope: !987)
!1001 = !DILocation(line: 936, column: 43, scope: !987)
!1002 = !DILocation(line: 936, column: 32, scope: !987)
!1003 = !DILocation(line: 936, column: 12, scope: !987)
!1004 = !DILocation(line: 937, column: 10, scope: !987)
!1005 = !DILocation(line: 937, column: 3, scope: !987)
!1006 = !DILocation(line: 939, column: 1, scope: !971)
!1007 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !66, file: !66, line: 957, type: !1008, scopeLine: 958, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1008 = !DISubroutineType(types: !1009)
!1009 = !{!6, !6, !6, !6}
!1010 = !DILocalVariable(name: "fak1", arg: 1, scope: !1007, file: !66, line: 957, type: !6)
!1011 = !DILocation(line: 957, column: 33, scope: !1007)
!1012 = !DILocalVariable(name: "fak2", arg: 2, scope: !1007, file: !66, line: 957, type: !6)
!1013 = !DILocation(line: 957, column: 43, scope: !1007)
!1014 = !DILocalVariable(name: "div", arg: 3, scope: !1007, file: !66, line: 957, type: !6)
!1015 = !DILocation(line: 957, column: 53, scope: !1007)
!1016 = !DILocalVariable(name: "s32Temp1", scope: !1007, file: !66, line: 959, type: !74)
!1017 = !DILocation(line: 959, column: 6, scope: !1007)
!1018 = !DILocalVariable(name: "s32Temp2", scope: !1007, file: !66, line: 959, type: !74)
!1019 = !DILocation(line: 959, column: 20, scope: !1007)
!1020 = !DILocalVariable(name: "s32Temp3", scope: !1007, file: !66, line: 959, type: !74)
!1021 = !DILocation(line: 959, column: 34, scope: !1007)
!1022 = !DILocation(line: 960, column: 13, scope: !1007)
!1023 = !DILocation(line: 960, column: 20, scope: !1007)
!1024 = !DILocation(line: 960, column: 18, scope: !1007)
!1025 = !DILocation(line: 960, column: 11, scope: !1007)
!1026 = !DILocation(line: 961, column: 5, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !1007, file: !66, line: 961, column: 5)
!1028 = !DILocation(line: 961, column: 9, scope: !1027)
!1029 = !DILocation(line: 961, column: 5, scope: !1007)
!1030 = !DILocation(line: 963, column: 6, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1032, file: !66, line: 963, column: 6)
!1032 = distinct !DILexicalBlock(scope: !1027, file: !66, line: 962, column: 2)
!1033 = !DILocation(line: 963, column: 15, scope: !1031)
!1034 = !DILocation(line: 963, column: 6, scope: !1032)
!1035 = !DILocation(line: 965, column: 4, scope: !1036)
!1036 = distinct !DILexicalBlock(scope: !1031, file: !66, line: 964, column: 3)
!1037 = !DILocation(line: 969, column: 4, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1031, file: !66, line: 968, column: 3)
!1039 = !DILocation(line: 974, column: 15, scope: !1040)
!1040 = distinct !DILexicalBlock(scope: !1027, file: !66, line: 973, column: 2)
!1041 = !DILocation(line: 974, column: 28, scope: !1040)
!1042 = !DILocation(line: 974, column: 39, scope: !1040)
!1043 = !DILocation(line: 974, column: 37, scope: !1040)
!1044 = !DILocation(line: 974, column: 46, scope: !1040)
!1045 = !DILocation(line: 974, column: 44, scope: !1040)
!1046 = !DILocation(line: 974, column: 24, scope: !1040)
!1047 = !DILocation(line: 974, column: 52, scope: !1040)
!1048 = !DILocation(line: 974, column: 12, scope: !1040)
!1049 = !DILocation(line: 975, column: 15, scope: !1040)
!1050 = !DILocation(line: 975, column: 24, scope: !1040)
!1051 = !DILocation(line: 975, column: 23, scope: !1040)
!1052 = !DILocation(line: 975, column: 32, scope: !1040)
!1053 = !DILocation(line: 975, column: 41, scope: !1040)
!1054 = !DILocation(line: 975, column: 40, scope: !1040)
!1055 = !DILocation(line: 975, column: 29, scope: !1040)
!1056 = !DILocation(line: 975, column: 12, scope: !1040)
!1057 = !DILocation(line: 976, column: 6, scope: !1058)
!1058 = distinct !DILexicalBlock(scope: !1040, file: !66, line: 976, column: 6)
!1059 = !DILocation(line: 976, column: 15, scope: !1058)
!1060 = !DILocation(line: 976, column: 6, scope: !1040)
!1061 = !DILocation(line: 978, column: 7, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1063, file: !66, line: 978, column: 7)
!1063 = distinct !DILexicalBlock(scope: !1058, file: !66, line: 977, column: 3)
!1064 = !DILocation(line: 978, column: 16, scope: !1062)
!1065 = !DILocation(line: 978, column: 7, scope: !1063)
!1066 = !DILocation(line: 980, column: 17, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !1062, file: !66, line: 979, column: 4)
!1068 = !DILocation(line: 980, column: 12, scope: !1067)
!1069 = !DILocation(line: 980, column: 5, scope: !1067)
!1070 = !DILocation(line: 984, column: 5, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1062, file: !66, line: 983, column: 4)
!1072 = !DILocation(line: 989, column: 4, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1058, file: !66, line: 988, column: 3)
!1074 = !DILocation(line: 992, column: 1, scope: !1007)
!1075 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !66, file: !66, line: 1010, type: !1076, scopeLine: 1011, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1076 = !DISubroutineType(types: !1077)
!1077 = !{!6, !6, !6, !18}
!1078 = !DILocalVariable(name: "data1", arg: 1, scope: !1075, file: !66, line: 1010, type: !6)
!1079 = !DILocation(line: 1010, column: 33, scope: !1075)
!1080 = !DILocalVariable(name: "data2", arg: 2, scope: !1075, file: !66, line: 1010, type: !6)
!1081 = !DILocation(line: 1010, column: 43, scope: !1075)
!1082 = !DILocalVariable(name: "denominator", arg: 3, scope: !1075, file: !66, line: 1010, type: !18)
!1083 = !DILocation(line: 1010, column: 53, scope: !1075)
!1084 = !DILocalVariable(name: "s32Result", scope: !1075, file: !66, line: 1012, type: !74)
!1085 = !DILocation(line: 1012, column: 6, scope: !1075)
!1086 = !DILocalVariable(name: "s32Temp1", scope: !1075, file: !66, line: 1012, type: !74)
!1087 = !DILocation(line: 1012, column: 21, scope: !1075)
!1088 = !DILocation(line: 1013, column: 14, scope: !1075)
!1089 = !DILocation(line: 1013, column: 22, scope: !1075)
!1090 = !DILocation(line: 1013, column: 20, scope: !1075)
!1091 = !DILocation(line: 1013, column: 12, scope: !1075)
!1092 = !DILocation(line: 1015, column: 5, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1075, file: !66, line: 1015, column: 5)
!1094 = !DILocation(line: 1015, column: 17, scope: !1093)
!1095 = !DILocation(line: 1015, column: 5, scope: !1075)
!1096 = !DILocation(line: 1017, column: 6, scope: !1097)
!1097 = distinct !DILexicalBlock(scope: !1098, file: !66, line: 1017, column: 6)
!1098 = distinct !DILexicalBlock(scope: !1093, file: !66, line: 1016, column: 2)
!1099 = !DILocation(line: 1017, column: 16, scope: !1097)
!1100 = !DILocation(line: 1017, column: 6, scope: !1098)
!1101 = !DILocation(line: 1019, column: 4, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1097, file: !66, line: 1018, column: 3)
!1103 = !DILocation(line: 1021, column: 11, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1097, file: !66, line: 1021, column: 11)
!1105 = !DILocation(line: 1021, column: 21, scope: !1104)
!1106 = !DILocation(line: 1021, column: 11, scope: !1097)
!1107 = !DILocation(line: 1023, column: 4, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1104, file: !66, line: 1022, column: 3)
!1109 = !DILocation(line: 1027, column: 4, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1104, file: !66, line: 1026, column: 3)
!1111 = !DILocation(line: 1032, column: 15, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1093, file: !66, line: 1031, column: 2)
!1113 = !DILocation(line: 1032, column: 28, scope: !1112)
!1114 = !DILocation(line: 1032, column: 38, scope: !1112)
!1115 = !DILocation(line: 1032, column: 37, scope: !1112)
!1116 = !DILocation(line: 1032, column: 51, scope: !1112)
!1117 = !DILocation(line: 1032, column: 50, scope: !1112)
!1118 = !DILocation(line: 1032, column: 25, scope: !1112)
!1119 = !DILocation(line: 1032, column: 64, scope: !1112)
!1120 = !DILocation(line: 1032, column: 12, scope: !1112)
!1121 = !DILocation(line: 1033, column: 16, scope: !1112)
!1122 = !DILocation(line: 1033, column: 25, scope: !1112)
!1123 = !DILocation(line: 1033, column: 24, scope: !1112)
!1124 = !DILocation(line: 1033, column: 41, scope: !1112)
!1125 = !DILocation(line: 1033, column: 51, scope: !1112)
!1126 = !DILocation(line: 1033, column: 50, scope: !1112)
!1127 = !DILocation(line: 1033, column: 38, scope: !1112)
!1128 = !DILocation(line: 1033, column: 13, scope: !1112)
!1129 = !DILocation(line: 1034, column: 6, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1112, file: !66, line: 1034, column: 6)
!1131 = !DILocation(line: 1034, column: 16, scope: !1130)
!1132 = !DILocation(line: 1034, column: 6, scope: !1112)
!1133 = !DILocation(line: 1036, column: 7, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1135, file: !66, line: 1036, column: 7)
!1135 = distinct !DILexicalBlock(scope: !1130, file: !66, line: 1035, column: 3)
!1136 = !DILocation(line: 1036, column: 17, scope: !1134)
!1137 = !DILocation(line: 1036, column: 7, scope: !1135)
!1138 = !DILocation(line: 1038, column: 17, scope: !1139)
!1139 = distinct !DILexicalBlock(scope: !1134, file: !66, line: 1037, column: 4)
!1140 = !DILocation(line: 1038, column: 12, scope: !1139)
!1141 = !DILocation(line: 1038, column: 5, scope: !1139)
!1142 = !DILocation(line: 1042, column: 5, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1134, file: !66, line: 1041, column: 4)
!1144 = !DILocation(line: 1047, column: 4, scope: !1145)
!1145 = distinct !DILexicalBlock(scope: !1130, file: !66, line: 1046, column: 3)
!1146 = !DILocation(line: 1051, column: 1, scope: !1075)
!1147 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !66, file: !66, line: 1068, type: !1148, scopeLine: 1069, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1148 = !DISubroutineType(types: !1149)
!1149 = !{!428, !428, !74}
!1150 = !DILocalVariable(name: "numerator", arg: 1, scope: !1147, file: !66, line: 1068, type: !428)
!1151 = !DILocation(line: 1068, column: 25, scope: !1147)
!1152 = !DILocalVariable(name: "denominator", arg: 2, scope: !1147, file: !66, line: 1068, type: !74)
!1153 = !DILocation(line: 1068, column: 40, scope: !1147)
!1154 = !DILocalVariable(name: "u32Temp1", scope: !1147, file: !66, line: 1070, type: !428)
!1155 = !DILocation(line: 1070, column: 6, scope: !1147)
!1156 = !DILocation(line: 1071, column: 5, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1147, file: !66, line: 1071, column: 5)
!1158 = !DILocation(line: 1071, column: 17, scope: !1157)
!1159 = !DILocation(line: 1071, column: 5, scope: !1147)
!1160 = !DILocation(line: 1073, column: 3, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1157, file: !66, line: 1072, column: 2)
!1162 = !DILocation(line: 1077, column: 6, scope: !1163)
!1163 = distinct !DILexicalBlock(scope: !1164, file: !66, line: 1077, column: 6)
!1164 = distinct !DILexicalBlock(scope: !1157, file: !66, line: 1076, column: 2)
!1165 = !DILocation(line: 1077, column: 18, scope: !1163)
!1166 = !DILocation(line: 1077, column: 6, scope: !1164)
!1167 = !DILocation(line: 1079, column: 4, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1163, file: !66, line: 1078, column: 3)
!1169 = !DILocation(line: 1083, column: 16, scope: !1170)
!1170 = distinct !DILexicalBlock(scope: !1163, file: !66, line: 1082, column: 3)
!1171 = !DILocation(line: 1083, column: 30, scope: !1170)
!1172 = !DILocation(line: 1083, column: 40, scope: !1170)
!1173 = !DILocation(line: 1083, column: 39, scope: !1170)
!1174 = !DILocation(line: 1083, column: 55, scope: !1170)
!1175 = !DILocation(line: 1083, column: 53, scope: !1170)
!1176 = !DILocation(line: 1083, column: 26, scope: !1170)
!1177 = !DILocation(line: 1083, column: 68, scope: !1170)
!1178 = !DILocation(line: 1083, column: 13, scope: !1170)
!1179 = !DILocation(line: 1084, column: 16, scope: !1170)
!1180 = !DILocation(line: 1084, column: 25, scope: !1170)
!1181 = !DILocation(line: 1084, column: 24, scope: !1170)
!1182 = !DILocation(line: 1084, column: 41, scope: !1170)
!1183 = !DILocation(line: 1084, column: 51, scope: !1170)
!1184 = !DILocation(line: 1084, column: 50, scope: !1170)
!1185 = !DILocation(line: 1084, column: 38, scope: !1170)
!1186 = !DILocation(line: 1084, column: 13, scope: !1170)
!1187 = !DILocation(line: 1085, column: 11, scope: !1170)
!1188 = !DILocation(line: 1085, column: 4, scope: !1170)
!1189 = !DILocation(line: 1088, column: 1, scope: !1147)
!1190 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !66, file: !66, line: 1105, type: !1191, scopeLine: 1106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1191 = !DISubroutineType(types: !1192)
!1192 = !{!428, !74, !428}
!1193 = !DILocalVariable(name: "numerator", arg: 1, scope: !1190, file: !66, line: 1105, type: !74)
!1194 = !DILocation(line: 1105, column: 25, scope: !1190)
!1195 = !DILocalVariable(name: "denominator", arg: 2, scope: !1190, file: !66, line: 1105, type: !428)
!1196 = !DILocation(line: 1105, column: 40, scope: !1190)
!1197 = !DILocalVariable(name: "s32Temp1", scope: !1190, file: !66, line: 1107, type: !74)
!1198 = !DILocation(line: 1107, column: 6, scope: !1190)
!1199 = !DILocation(line: 1108, column: 5, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1190, file: !66, line: 1108, column: 5)
!1201 = !DILocation(line: 1108, column: 17, scope: !1200)
!1202 = !DILocation(line: 1108, column: 5, scope: !1190)
!1203 = !DILocation(line: 1110, column: 6, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1205, file: !66, line: 1110, column: 6)
!1205 = distinct !DILexicalBlock(scope: !1200, file: !66, line: 1109, column: 2)
!1206 = !DILocation(line: 1110, column: 16, scope: !1204)
!1207 = !DILocation(line: 1110, column: 6, scope: !1205)
!1208 = !DILocation(line: 1112, column: 4, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1204, file: !66, line: 1111, column: 3)
!1210 = !DILocation(line: 1116, column: 4, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1204, file: !66, line: 1115, column: 3)
!1212 = !DILocation(line: 1121, column: 6, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1214, file: !66, line: 1121, column: 6)
!1214 = distinct !DILexicalBlock(scope: !1200, file: !66, line: 1120, column: 2)
!1215 = !DILocation(line: 1121, column: 16, scope: !1213)
!1216 = !DILocation(line: 1121, column: 6, scope: !1214)
!1217 = !DILocation(line: 1123, column: 17, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1213, file: !66, line: 1122, column: 3)
!1219 = !DILocation(line: 1123, column: 31, scope: !1218)
!1220 = !DILocation(line: 1123, column: 41, scope: !1218)
!1221 = !DILocation(line: 1123, column: 40, scope: !1218)
!1222 = !DILocation(line: 1123, column: 56, scope: !1218)
!1223 = !DILocation(line: 1123, column: 54, scope: !1218)
!1224 = !DILocation(line: 1123, column: 27, scope: !1218)
!1225 = !DILocation(line: 1123, column: 69, scope: !1218)
!1226 = !DILocation(line: 1123, column: 13, scope: !1218)
!1227 = !DILocation(line: 1124, column: 13, scope: !1218)
!1228 = !DILocation(line: 1124, column: 23, scope: !1218)
!1229 = !DILocation(line: 1124, column: 22, scope: !1218)
!1230 = !DILocation(line: 1124, column: 39, scope: !1218)
!1231 = !DILocation(line: 1124, column: 48, scope: !1218)
!1232 = !DILocation(line: 1124, column: 47, scope: !1218)
!1233 = !DILocation(line: 1124, column: 36, scope: !1218)
!1234 = !DILocation(line: 1124, column: 4, scope: !1218)
!1235 = !DILocation(line: 1128, column: 4, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1213, file: !66, line: 1127, column: 3)
!1237 = !DILocation(line: 1131, column: 1, scope: !1190)
!1238 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !66, file: !66, line: 1148, type: !1239, scopeLine: 1149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1239 = !DISubroutineType(types: !1240)
!1240 = !{!428, !74, !74}
!1241 = !DILocalVariable(name: "numerator", arg: 1, scope: !1238, file: !66, line: 1148, type: !74)
!1242 = !DILocation(line: 1148, column: 25, scope: !1238)
!1243 = !DILocalVariable(name: "denominator", arg: 2, scope: !1238, file: !66, line: 1148, type: !74)
!1244 = !DILocation(line: 1148, column: 40, scope: !1238)
!1245 = !DILocalVariable(name: "u32Temp1", scope: !1238, file: !66, line: 1150, type: !428)
!1246 = !DILocation(line: 1150, column: 6, scope: !1238)
!1247 = !DILocalVariable(name: "u32Temp2", scope: !1238, file: !66, line: 1150, type: !428)
!1248 = !DILocation(line: 1150, column: 20, scope: !1238)
!1249 = !DILocation(line: 1151, column: 5, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1238, file: !66, line: 1151, column: 5)
!1251 = !DILocation(line: 1151, column: 17, scope: !1250)
!1252 = !DILocation(line: 1151, column: 5, scope: !1238)
!1253 = !DILocation(line: 1153, column: 6, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1255, file: !66, line: 1153, column: 6)
!1255 = distinct !DILexicalBlock(scope: !1250, file: !66, line: 1152, column: 2)
!1256 = !DILocation(line: 1153, column: 16, scope: !1254)
!1257 = !DILocation(line: 1153, column: 6, scope: !1255)
!1258 = !DILocation(line: 1155, column: 4, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1254, file: !66, line: 1154, column: 3)
!1260 = !DILocation(line: 1159, column: 4, scope: !1261)
!1261 = distinct !DILexicalBlock(scope: !1254, file: !66, line: 1158, column: 3)
!1262 = !DILocation(line: 1164, column: 6, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1264, file: !66, line: 1164, column: 6)
!1264 = distinct !DILexicalBlock(scope: !1250, file: !66, line: 1163, column: 2)
!1265 = !DILocation(line: 1164, column: 16, scope: !1263)
!1266 = !DILocation(line: 1164, column: 6, scope: !1264)
!1267 = !DILocation(line: 1166, column: 7, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1269, file: !66, line: 1166, column: 7)
!1269 = distinct !DILexicalBlock(scope: !1263, file: !66, line: 1165, column: 3)
!1270 = !DILocation(line: 1166, column: 17, scope: !1268)
!1271 = !DILocation(line: 1166, column: 7, scope: !1269)
!1272 = !DILocation(line: 1168, column: 5, scope: !1273)
!1273 = distinct !DILexicalBlock(scope: !1268, file: !66, line: 1167, column: 4)
!1274 = !DILocation(line: 1172, column: 8, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1276, file: !66, line: 1172, column: 8)
!1276 = distinct !DILexicalBlock(scope: !1268, file: !66, line: 1171, column: 4)
!1277 = !DILocation(line: 1172, column: 20, scope: !1275)
!1278 = !DILocation(line: 1172, column: 8, scope: !1276)
!1279 = !DILocation(line: 1174, column: 6, scope: !1280)
!1280 = distinct !DILexicalBlock(scope: !1275, file: !66, line: 1173, column: 5)
!1281 = !DILocation(line: 1178, column: 18, scope: !1282)
!1282 = distinct !DILexicalBlock(scope: !1275, file: !66, line: 1177, column: 5)
!1283 = !DILocation(line: 1178, column: 32, scope: !1282)
!1284 = !DILocation(line: 1178, column: 42, scope: !1282)
!1285 = !DILocation(line: 1178, column: 41, scope: !1282)
!1286 = !DILocation(line: 1178, column: 57, scope: !1282)
!1287 = !DILocation(line: 1178, column: 55, scope: !1282)
!1288 = !DILocation(line: 1178, column: 28, scope: !1282)
!1289 = !DILocation(line: 1178, column: 71, scope: !1282)
!1290 = !DILocation(line: 1178, column: 15, scope: !1282)
!1291 = !DILocation(line: 1179, column: 18, scope: !1282)
!1292 = !DILocation(line: 1179, column: 29, scope: !1282)
!1293 = !DILocation(line: 1179, column: 27, scope: !1282)
!1294 = !DILocation(line: 1179, column: 45, scope: !1282)
!1295 = !DILocation(line: 1179, column: 57, scope: !1282)
!1296 = !DILocation(line: 1179, column: 55, scope: !1282)
!1297 = !DILocation(line: 1179, column: 42, scope: !1282)
!1298 = !DILocation(line: 1179, column: 15, scope: !1282)
!1299 = !DILocation(line: 1180, column: 13, scope: !1282)
!1300 = !DILocation(line: 1180, column: 6, scope: !1282)
!1301 = !DILocation(line: 1186, column: 7, scope: !1302)
!1302 = distinct !DILexicalBlock(scope: !1303, file: !66, line: 1186, column: 7)
!1303 = distinct !DILexicalBlock(scope: !1263, file: !66, line: 1185, column: 3)
!1304 = !DILocation(line: 1186, column: 19, scope: !1302)
!1305 = !DILocation(line: 1186, column: 7, scope: !1303)
!1306 = !DILocation(line: 1188, column: 5, scope: !1307)
!1307 = distinct !DILexicalBlock(scope: !1302, file: !66, line: 1187, column: 4)
!1308 = !DILocation(line: 1192, column: 18, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1302, file: !66, line: 1191, column: 4)
!1310 = !DILocation(line: 1192, column: 17, scope: !1309)
!1311 = !DILocation(line: 1192, column: 15, scope: !1309)
!1312 = !DILocation(line: 1193, column: 20, scope: !1309)
!1313 = !DILocation(line: 1193, column: 19, scope: !1309)
!1314 = !DILocation(line: 1193, column: 17, scope: !1309)
!1315 = !DILocation(line: 1194, column: 17, scope: !1309)
!1316 = !DILocation(line: 1194, column: 31, scope: !1309)
!1317 = !DILocation(line: 1194, column: 41, scope: !1309)
!1318 = !DILocation(line: 1194, column: 40, scope: !1309)
!1319 = !DILocation(line: 1194, column: 56, scope: !1309)
!1320 = !DILocation(line: 1194, column: 54, scope: !1309)
!1321 = !DILocation(line: 1194, column: 27, scope: !1309)
!1322 = !DILocation(line: 1194, column: 70, scope: !1309)
!1323 = !DILocation(line: 1194, column: 14, scope: !1309)
!1324 = !DILocation(line: 1195, column: 17, scope: !1309)
!1325 = !DILocation(line: 1195, column: 28, scope: !1309)
!1326 = !DILocation(line: 1195, column: 26, scope: !1309)
!1327 = !DILocation(line: 1195, column: 44, scope: !1309)
!1328 = !DILocation(line: 1195, column: 56, scope: !1309)
!1329 = !DILocation(line: 1195, column: 54, scope: !1309)
!1330 = !DILocation(line: 1195, column: 41, scope: !1309)
!1331 = !DILocation(line: 1195, column: 14, scope: !1309)
!1332 = !DILocation(line: 1196, column: 12, scope: !1309)
!1333 = !DILocation(line: 1196, column: 5, scope: !1309)
!1334 = !DILocation(line: 1201, column: 1, scope: !1238)
!1335 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !66, file: !66, line: 1218, type: !1336, scopeLine: 1219, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1336 = !DISubroutineType(types: !1337)
!1337 = !{!428, !428, !428}
!1338 = !DILocalVariable(name: "numerator", arg: 1, scope: !1335, file: !66, line: 1218, type: !428)
!1339 = !DILocation(line: 1218, column: 25, scope: !1335)
!1340 = !DILocalVariable(name: "denominator", arg: 2, scope: !1335, file: !66, line: 1218, type: !428)
!1341 = !DILocation(line: 1218, column: 40, scope: !1335)
!1342 = !DILocalVariable(name: "u32Temp1", scope: !1335, file: !66, line: 1221, type: !428)
!1343 = !DILocation(line: 1221, column: 6, scope: !1335)
!1344 = !DILocalVariable(name: "u32Temp2", scope: !1335, file: !66, line: 1221, type: !428)
!1345 = !DILocation(line: 1221, column: 20, scope: !1335)
!1346 = !DILocalVariable(name: "u32Temp3", scope: !1335, file: !66, line: 1221, type: !428)
!1347 = !DILocation(line: 1221, column: 34, scope: !1335)
!1348 = !DILocalVariable(name: "numerator_old", scope: !1335, file: !66, line: 1221, type: !428)
!1349 = !DILocation(line: 1221, column: 48, scope: !1335)
!1350 = !DILocation(line: 1222, column: 5, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1335, file: !66, line: 1222, column: 5)
!1352 = !DILocation(line: 1222, column: 16, scope: !1351)
!1353 = !DILocation(line: 1222, column: 5, scope: !1335)
!1354 = !DILocation(line: 1224, column: 3, scope: !1355)
!1355 = distinct !DILexicalBlock(scope: !1351, file: !66, line: 1223, column: 2)
!1356 = !DILocation(line: 1228, column: 14, scope: !1357)
!1357 = distinct !DILexicalBlock(scope: !1351, file: !66, line: 1227, column: 2)
!1358 = !DILocation(line: 1228, column: 26, scope: !1357)
!1359 = !DILocation(line: 1228, column: 41, scope: !1357)
!1360 = !DILocation(line: 1228, column: 51, scope: !1357)
!1361 = !DILocation(line: 1228, column: 50, scope: !1357)
!1362 = !DILocation(line: 1228, column: 38, scope: !1357)
!1363 = !DILocation(line: 1228, column: 24, scope: !1357)
!1364 = !DILocation(line: 1228, column: 12, scope: !1357)
!1365 = !DILocation(line: 1229, column: 7, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !1357, file: !66, line: 1229, column: 6)
!1367 = !DILocation(line: 1229, column: 16, scope: !1366)
!1368 = !DILocation(line: 1229, column: 24, scope: !1366)
!1369 = !DILocation(line: 1229, column: 6, scope: !1357)
!1370 = !DILocation(line: 1231, column: 16, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1366, file: !66, line: 1230, column: 3)
!1372 = !DILocation(line: 1231, column: 27, scope: !1371)
!1373 = !DILocation(line: 1231, column: 13, scope: !1371)
!1374 = !DILocation(line: 1232, column: 3, scope: !1371)
!1375 = !DILocation(line: 1235, column: 16, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1366, file: !66, line: 1234, column: 3)
!1377 = !DILocation(line: 1235, column: 27, scope: !1376)
!1378 = !DILocation(line: 1235, column: 32, scope: !1376)
!1379 = !DILocation(line: 1235, column: 13, scope: !1376)
!1380 = !DILocation(line: 1238, column: 6, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1357, file: !66, line: 1238, column: 6)
!1382 = !DILocation(line: 1238, column: 17, scope: !1381)
!1383 = !DILocation(line: 1238, column: 15, scope: !1381)
!1384 = !DILocation(line: 1238, column: 6, scope: !1357)
!1385 = !DILocation(line: 1240, column: 12, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1381, file: !66, line: 1239, column: 3)
!1387 = !DILocation(line: 1240, column: 22, scope: !1386)
!1388 = !DILocation(line: 1240, column: 21, scope: !1386)
!1389 = !DILocation(line: 1240, column: 4, scope: !1386)
!1390 = !DILocation(line: 1244, column: 13, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1381, file: !66, line: 1243, column: 3)
!1392 = !DILocation(line: 1244, column: 23, scope: !1391)
!1393 = !DILocation(line: 1244, column: 22, scope: !1391)
!1394 = !DILocation(line: 1244, column: 36, scope: !1391)
!1395 = !DILocation(line: 1244, column: 4, scope: !1391)
!1396 = !DILocation(line: 1249, column: 1, scope: !1335)
!1397 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !66, file: !66, line: 1266, type: !1398, scopeLine: 1267, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1398 = !DISubroutineType(types: !1399)
!1399 = !{!74, !428, !74}
!1400 = !DILocalVariable(name: "numerator", arg: 1, scope: !1397, file: !66, line: 1266, type: !428)
!1401 = !DILocation(line: 1266, column: 25, scope: !1397)
!1402 = !DILocalVariable(name: "denominator", arg: 2, scope: !1397, file: !66, line: 1266, type: !74)
!1403 = !DILocation(line: 1266, column: 40, scope: !1397)
!1404 = !DILocalVariable(name: "u32Temp1", scope: !1397, file: !66, line: 1268, type: !428)
!1405 = !DILocation(line: 1268, column: 6, scope: !1397)
!1406 = !DILocalVariable(name: "u32Temp2", scope: !1397, file: !66, line: 1268, type: !428)
!1407 = !DILocation(line: 1268, column: 20, scope: !1397)
!1408 = !DILocation(line: 1269, column: 5, scope: !1409)
!1409 = distinct !DILexicalBlock(scope: !1397, file: !66, line: 1269, column: 5)
!1410 = !DILocation(line: 1269, column: 17, scope: !1409)
!1411 = !DILocation(line: 1269, column: 5, scope: !1397)
!1412 = !DILocation(line: 1271, column: 6, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !1414, file: !66, line: 1271, column: 6)
!1414 = distinct !DILexicalBlock(scope: !1409, file: !66, line: 1270, column: 2)
!1415 = !DILocation(line: 1271, column: 18, scope: !1413)
!1416 = !DILocation(line: 1271, column: 6, scope: !1414)
!1417 = !DILocation(line: 1273, column: 4, scope: !1418)
!1418 = distinct !DILexicalBlock(scope: !1413, file: !66, line: 1272, column: 3)
!1419 = !DILocation(line: 1277, column: 19, scope: !1420)
!1420 = distinct !DILexicalBlock(scope: !1413, file: !66, line: 1276, column: 3)
!1421 = !DILocation(line: 1277, column: 18, scope: !1420)
!1422 = !DILocation(line: 1277, column: 16, scope: !1420)
!1423 = !DILocation(line: 1278, column: 16, scope: !1420)
!1424 = !DILocation(line: 1278, column: 30, scope: !1420)
!1425 = !DILocation(line: 1278, column: 40, scope: !1420)
!1426 = !DILocation(line: 1278, column: 39, scope: !1420)
!1427 = !DILocation(line: 1278, column: 55, scope: !1420)
!1428 = !DILocation(line: 1278, column: 53, scope: !1420)
!1429 = !DILocation(line: 1278, column: 26, scope: !1420)
!1430 = !DILocation(line: 1278, column: 69, scope: !1420)
!1431 = !DILocation(line: 1278, column: 13, scope: !1420)
!1432 = !DILocation(line: 1279, column: 16, scope: !1420)
!1433 = !DILocation(line: 1279, column: 25, scope: !1420)
!1434 = !DILocation(line: 1279, column: 24, scope: !1420)
!1435 = !DILocation(line: 1279, column: 41, scope: !1420)
!1436 = !DILocation(line: 1279, column: 51, scope: !1420)
!1437 = !DILocation(line: 1279, column: 50, scope: !1420)
!1438 = !DILocation(line: 1279, column: 38, scope: !1420)
!1439 = !DILocation(line: 1279, column: 13, scope: !1420)
!1440 = !DILocation(line: 1280, column: 7, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1420, file: !66, line: 1280, column: 7)
!1442 = !DILocation(line: 1280, column: 16, scope: !1441)
!1443 = !DILocation(line: 1280, column: 7, scope: !1420)
!1444 = !DILocation(line: 1282, column: 13, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1441, file: !66, line: 1281, column: 4)
!1446 = !DILocation(line: 1282, column: 12, scope: !1445)
!1447 = !DILocation(line: 1282, column: 5, scope: !1445)
!1448 = !DILocation(line: 1286, column: 5, scope: !1449)
!1449 = distinct !DILexicalBlock(scope: !1441, file: !66, line: 1285, column: 4)
!1450 = !DILocation(line: 1292, column: 15, scope: !1451)
!1451 = distinct !DILexicalBlock(scope: !1409, file: !66, line: 1291, column: 2)
!1452 = !DILocation(line: 1292, column: 29, scope: !1451)
!1453 = !DILocation(line: 1292, column: 39, scope: !1451)
!1454 = !DILocation(line: 1292, column: 38, scope: !1451)
!1455 = !DILocation(line: 1292, column: 54, scope: !1451)
!1456 = !DILocation(line: 1292, column: 52, scope: !1451)
!1457 = !DILocation(line: 1292, column: 25, scope: !1451)
!1458 = !DILocation(line: 1292, column: 68, scope: !1451)
!1459 = !DILocation(line: 1292, column: 12, scope: !1451)
!1460 = !DILocation(line: 1293, column: 15, scope: !1451)
!1461 = !DILocation(line: 1293, column: 24, scope: !1451)
!1462 = !DILocation(line: 1293, column: 23, scope: !1451)
!1463 = !DILocation(line: 1293, column: 40, scope: !1451)
!1464 = !DILocation(line: 1293, column: 50, scope: !1451)
!1465 = !DILocation(line: 1293, column: 49, scope: !1451)
!1466 = !DILocation(line: 1293, column: 37, scope: !1451)
!1467 = !DILocation(line: 1293, column: 12, scope: !1451)
!1468 = !DILocation(line: 1294, column: 6, scope: !1469)
!1469 = distinct !DILexicalBlock(scope: !1451, file: !66, line: 1294, column: 6)
!1470 = !DILocation(line: 1294, column: 15, scope: !1469)
!1471 = !DILocation(line: 1294, column: 6, scope: !1451)
!1472 = !DILocation(line: 1296, column: 11, scope: !1473)
!1473 = distinct !DILexicalBlock(scope: !1469, file: !66, line: 1295, column: 3)
!1474 = !DILocation(line: 1296, column: 4, scope: !1473)
!1475 = !DILocation(line: 1300, column: 4, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1469, file: !66, line: 1299, column: 3)
!1477 = !DILocation(line: 1303, column: 1, scope: !1397)
!1478 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !66, file: !66, line: 1321, type: !1479, scopeLine: 1322, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1479 = !DISubroutineType(types: !1480)
!1480 = !{!74, !74, !428}
!1481 = !DILocalVariable(name: "numerator", arg: 1, scope: !1478, file: !66, line: 1321, type: !74)
!1482 = !DILocation(line: 1321, column: 25, scope: !1478)
!1483 = !DILocalVariable(name: "denominator", arg: 2, scope: !1478, file: !66, line: 1321, type: !428)
!1484 = !DILocation(line: 1321, column: 40, scope: !1478)
!1485 = !DILocalVariable(name: "s32Temp1", scope: !1478, file: !66, line: 1323, type: !74)
!1486 = !DILocation(line: 1323, column: 6, scope: !1478)
!1487 = !DILocalVariable(name: "s32Temp2", scope: !1478, file: !66, line: 1323, type: !74)
!1488 = !DILocation(line: 1323, column: 20, scope: !1478)
!1489 = !DILocalVariable(name: "u32Temp0", scope: !1478, file: !66, line: 1324, type: !428)
!1490 = !DILocation(line: 1324, column: 6, scope: !1478)
!1491 = !DILocalVariable(name: "u32Temp1", scope: !1478, file: !66, line: 1324, type: !428)
!1492 = !DILocation(line: 1324, column: 20, scope: !1478)
!1493 = !DILocalVariable(name: "u32Temp2", scope: !1478, file: !66, line: 1324, type: !428)
!1494 = !DILocation(line: 1324, column: 34, scope: !1478)
!1495 = !DILocation(line: 1325, column: 5, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1478, file: !66, line: 1325, column: 5)
!1497 = !DILocation(line: 1325, column: 17, scope: !1496)
!1498 = !DILocation(line: 1325, column: 5, scope: !1478)
!1499 = !DILocation(line: 1327, column: 6, scope: !1500)
!1500 = distinct !DILexicalBlock(scope: !1501, file: !66, line: 1327, column: 6)
!1501 = distinct !DILexicalBlock(scope: !1496, file: !66, line: 1326, column: 2)
!1502 = !DILocation(line: 1327, column: 16, scope: !1500)
!1503 = !DILocation(line: 1327, column: 6, scope: !1501)
!1504 = !DILocation(line: 1329, column: 4, scope: !1505)
!1505 = distinct !DILexicalBlock(scope: !1500, file: !66, line: 1328, column: 3)
!1506 = !DILocation(line: 1333, column: 4, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1500, file: !66, line: 1332, column: 3)
!1508 = !DILocation(line: 1338, column: 6, scope: !1509)
!1509 = distinct !DILexicalBlock(scope: !1510, file: !66, line: 1338, column: 6)
!1510 = distinct !DILexicalBlock(scope: !1496, file: !66, line: 1337, column: 2)
!1511 = !DILocation(line: 1338, column: 16, scope: !1509)
!1512 = !DILocation(line: 1338, column: 6, scope: !1510)
!1513 = !DILocation(line: 1340, column: 16, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1509, file: !66, line: 1339, column: 3)
!1515 = !DILocation(line: 1340, column: 15, scope: !1514)
!1516 = !DILocation(line: 1340, column: 13, scope: !1514)
!1517 = !DILocation(line: 1341, column: 16, scope: !1514)
!1518 = !DILocation(line: 1341, column: 25, scope: !1514)
!1519 = !DILocation(line: 1341, column: 24, scope: !1514)
!1520 = !DILocation(line: 1341, column: 13, scope: !1514)
!1521 = !DILocation(line: 1342, column: 15, scope: !1514)
!1522 = !DILocation(line: 1342, column: 28, scope: !1514)
!1523 = !DILocation(line: 1342, column: 37, scope: !1514)
!1524 = !DILocation(line: 1342, column: 36, scope: !1514)
!1525 = !DILocation(line: 1342, column: 52, scope: !1514)
!1526 = !DILocation(line: 1342, column: 50, scope: !1514)
!1527 = !DILocation(line: 1342, column: 24, scope: !1514)
!1528 = !DILocation(line: 1342, column: 13, scope: !1514)
!1529 = !DILocation(line: 1344, column: 8, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1514, file: !66, line: 1344, column: 7)
!1531 = !DILocation(line: 1344, column: 20, scope: !1530)
!1532 = !DILocation(line: 1344, column: 27, scope: !1530)
!1533 = !DILocation(line: 1344, column: 7, scope: !1514)
!1534 = !DILocation(line: 1346, column: 20, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1530, file: !66, line: 1345, column: 4)
!1536 = !DILocation(line: 1346, column: 32, scope: !1535)
!1537 = !DILocation(line: 1346, column: 17, scope: !1535)
!1538 = !DILocation(line: 1347, column: 4, scope: !1535)
!1539 = !DILocation(line: 1350, column: 20, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1530, file: !66, line: 1349, column: 4)
!1541 = !DILocation(line: 1350, column: 32, scope: !1540)
!1542 = !DILocation(line: 1350, column: 38, scope: !1540)
!1543 = !DILocation(line: 1350, column: 17, scope: !1540)
!1544 = !DILocation(line: 1354, column: 7, scope: !1545)
!1545 = distinct !DILexicalBlock(scope: !1514, file: !66, line: 1354, column: 7)
!1546 = !DILocation(line: 1354, column: 18, scope: !1545)
!1547 = !DILocation(line: 1354, column: 16, scope: !1545)
!1548 = !DILocation(line: 1354, column: 7, scope: !1514)
!1549 = !DILocation(line: 1356, column: 14, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1545, file: !66, line: 1355, column: 4)
!1551 = !DILocation(line: 1356, column: 13, scope: !1550)
!1552 = !DILocation(line: 1356, column: 23, scope: !1550)
!1553 = !DILocation(line: 1356, column: 5, scope: !1550)
!1554 = !DILocation(line: 1360, column: 14, scope: !1555)
!1555 = distinct !DILexicalBlock(scope: !1545, file: !66, line: 1359, column: 4)
!1556 = !DILocation(line: 1360, column: 23, scope: !1555)
!1557 = !DILocation(line: 1360, column: 12, scope: !1555)
!1558 = !DILocation(line: 1360, column: 27, scope: !1555)
!1559 = !DILocation(line: 1360, column: 5, scope: !1555)
!1560 = !DILocation(line: 1367, column: 16, scope: !1561)
!1561 = distinct !DILexicalBlock(scope: !1509, file: !66, line: 1366, column: 3)
!1562 = !DILocation(line: 1367, column: 30, scope: !1561)
!1563 = !DILocation(line: 1367, column: 40, scope: !1561)
!1564 = !DILocation(line: 1367, column: 39, scope: !1561)
!1565 = !DILocation(line: 1367, column: 55, scope: !1561)
!1566 = !DILocation(line: 1367, column: 53, scope: !1561)
!1567 = !DILocation(line: 1367, column: 26, scope: !1561)
!1568 = !DILocation(line: 1367, column: 69, scope: !1561)
!1569 = !DILocation(line: 1367, column: 13, scope: !1561)
!1570 = !DILocation(line: 1368, column: 16, scope: !1561)
!1571 = !DILocation(line: 1368, column: 26, scope: !1561)
!1572 = !DILocation(line: 1368, column: 25, scope: !1561)
!1573 = !DILocation(line: 1368, column: 42, scope: !1561)
!1574 = !DILocation(line: 1368, column: 51, scope: !1561)
!1575 = !DILocation(line: 1368, column: 50, scope: !1561)
!1576 = !DILocation(line: 1368, column: 39, scope: !1561)
!1577 = !DILocation(line: 1368, column: 13, scope: !1561)
!1578 = !DILocation(line: 1369, column: 11, scope: !1561)
!1579 = !DILocation(line: 1369, column: 4, scope: !1561)
!1580 = !DILocation(line: 1372, column: 1, scope: !1478)
!1581 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !66, file: !66, line: 1389, type: !1582, scopeLine: 1390, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1582 = !DISubroutineType(types: !1583)
!1583 = !{!74, !74, !74}
!1584 = !DILocalVariable(name: "numerator", arg: 1, scope: !1581, file: !66, line: 1389, type: !74)
!1585 = !DILocation(line: 1389, column: 25, scope: !1581)
!1586 = !DILocalVariable(name: "denominator", arg: 2, scope: !1581, file: !66, line: 1389, type: !74)
!1587 = !DILocation(line: 1389, column: 40, scope: !1581)
!1588 = !DILocalVariable(name: "s32Temp1", scope: !1581, file: !66, line: 1391, type: !74)
!1589 = !DILocation(line: 1391, column: 6, scope: !1581)
!1590 = !DILocalVariable(name: "s32Temp2", scope: !1581, file: !66, line: 1391, type: !74)
!1591 = !DILocation(line: 1391, column: 20, scope: !1581)
!1592 = !DILocalVariable(name: "denominator_prime", scope: !1581, file: !66, line: 1392, type: !428)
!1593 = !DILocation(line: 1392, column: 6, scope: !1581)
!1594 = !DILocalVariable(name: "u32Temp1", scope: !1581, file: !66, line: 1392, type: !428)
!1595 = !DILocation(line: 1392, column: 29, scope: !1581)
!1596 = !DILocalVariable(name: "u32Temp2", scope: !1581, file: !66, line: 1392, type: !428)
!1597 = !DILocation(line: 1392, column: 43, scope: !1581)
!1598 = !DILocalVariable(name: "u32numerator", scope: !1581, file: !66, line: 1393, type: !428)
!1599 = !DILocation(line: 1393, column: 6, scope: !1581)
!1600 = !DILocalVariable(name: "u32denominator", scope: !1581, file: !66, line: 1393, type: !428)
!1601 = !DILocation(line: 1393, column: 23, scope: !1581)
!1602 = !DILocation(line: 1394, column: 5, scope: !1603)
!1603 = distinct !DILexicalBlock(scope: !1581, file: !66, line: 1394, column: 5)
!1604 = !DILocation(line: 1394, column: 15, scope: !1603)
!1605 = !DILocation(line: 1394, column: 5, scope: !1581)
!1606 = !DILocation(line: 1396, column: 6, scope: !1607)
!1607 = distinct !DILexicalBlock(scope: !1608, file: !66, line: 1396, column: 6)
!1608 = distinct !DILexicalBlock(scope: !1603, file: !66, line: 1395, column: 2)
!1609 = !DILocation(line: 1396, column: 18, scope: !1607)
!1610 = !DILocation(line: 1396, column: 6, scope: !1608)
!1611 = !DILocation(line: 1398, column: 7, scope: !1612)
!1612 = distinct !DILexicalBlock(scope: !1613, file: !66, line: 1398, column: 7)
!1613 = distinct !DILexicalBlock(scope: !1607, file: !66, line: 1397, column: 3)
!1614 = !DILocation(line: 1398, column: 19, scope: !1612)
!1615 = !DILocation(line: 1398, column: 7, scope: !1613)
!1616 = !DILocation(line: 1400, column: 5, scope: !1617)
!1617 = distinct !DILexicalBlock(scope: !1612, file: !66, line: 1399, column: 4)
!1618 = !DILocation(line: 1404, column: 21, scope: !1619)
!1619 = distinct !DILexicalBlock(scope: !1612, file: !66, line: 1403, column: 4)
!1620 = !DILocation(line: 1404, column: 20, scope: !1619)
!1621 = !DILocation(line: 1404, column: 18, scope: !1619)
!1622 = !DILocation(line: 1405, column: 23, scope: !1619)
!1623 = !DILocation(line: 1405, column: 22, scope: !1619)
!1624 = !DILocation(line: 1405, column: 20, scope: !1619)
!1625 = !DILocation(line: 1406, column: 16, scope: !1619)
!1626 = !DILocation(line: 1406, column: 33, scope: !1619)
!1627 = !DILocation(line: 1406, column: 46, scope: !1619)
!1628 = !DILocation(line: 1406, column: 45, scope: !1619)
!1629 = !DILocation(line: 1406, column: 64, scope: !1619)
!1630 = !DILocation(line: 1406, column: 62, scope: !1619)
!1631 = !DILocation(line: 1406, column: 29, scope: !1619)
!1632 = !DILocation(line: 1406, column: 81, scope: !1619)
!1633 = !DILocation(line: 1406, column: 14, scope: !1619)
!1634 = !DILocation(line: 1407, column: 17, scope: !1619)
!1635 = !DILocation(line: 1407, column: 30, scope: !1619)
!1636 = !DILocation(line: 1407, column: 29, scope: !1619)
!1637 = !DILocation(line: 1407, column: 49, scope: !1619)
!1638 = !DILocation(line: 1407, column: 58, scope: !1619)
!1639 = !DILocation(line: 1407, column: 57, scope: !1619)
!1640 = !DILocation(line: 1407, column: 46, scope: !1619)
!1641 = !DILocation(line: 1407, column: 14, scope: !1619)
!1642 = !DILocation(line: 1408, column: 8, scope: !1643)
!1643 = distinct !DILexicalBlock(scope: !1619, file: !66, line: 1408, column: 8)
!1644 = !DILocation(line: 1408, column: 17, scope: !1643)
!1645 = !DILocation(line: 1408, column: 8, scope: !1619)
!1646 = !DILocation(line: 1410, column: 13, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1643, file: !66, line: 1409, column: 5)
!1648 = !DILocation(line: 1410, column: 6, scope: !1647)
!1649 = !DILocation(line: 1414, column: 6, scope: !1650)
!1650 = distinct !DILexicalBlock(scope: !1643, file: !66, line: 1413, column: 5)
!1651 = !DILocation(line: 1420, column: 20, scope: !1652)
!1652 = distinct !DILexicalBlock(scope: !1607, file: !66, line: 1419, column: 3)
!1653 = !DILocation(line: 1420, column: 19, scope: !1652)
!1654 = !DILocation(line: 1420, column: 29, scope: !1652)
!1655 = !DILocation(line: 1420, column: 17, scope: !1652)
!1656 = !DILocation(line: 1421, column: 16, scope: !1652)
!1657 = !DILocation(line: 1421, column: 33, scope: !1652)
!1658 = !DILocation(line: 1421, column: 46, scope: !1652)
!1659 = !DILocation(line: 1421, column: 45, scope: !1652)
!1660 = !DILocation(line: 1421, column: 61, scope: !1652)
!1661 = !DILocation(line: 1421, column: 59, scope: !1652)
!1662 = !DILocation(line: 1421, column: 29, scope: !1652)
!1663 = !DILocation(line: 1421, column: 75, scope: !1652)
!1664 = !DILocation(line: 1421, column: 13, scope: !1652)
!1665 = !DILocation(line: 1422, column: 16, scope: !1652)
!1666 = !DILocation(line: 1422, column: 29, scope: !1652)
!1667 = !DILocation(line: 1422, column: 28, scope: !1652)
!1668 = !DILocation(line: 1422, column: 45, scope: !1652)
!1669 = !DILocation(line: 1422, column: 54, scope: !1652)
!1670 = !DILocation(line: 1422, column: 53, scope: !1652)
!1671 = !DILocation(line: 1422, column: 42, scope: !1652)
!1672 = !DILocation(line: 1422, column: 13, scope: !1652)
!1673 = !DILocation(line: 1423, column: 13, scope: !1652)
!1674 = !DILocation(line: 1423, column: 12, scope: !1652)
!1675 = !DILocation(line: 1423, column: 22, scope: !1652)
!1676 = !DILocation(line: 1423, column: 4, scope: !1652)
!1677 = !DILocation(line: 1428, column: 6, scope: !1678)
!1678 = distinct !DILexicalBlock(scope: !1679, file: !66, line: 1428, column: 6)
!1679 = distinct !DILexicalBlock(scope: !1603, file: !66, line: 1427, column: 2)
!1680 = !DILocation(line: 1428, column: 18, scope: !1678)
!1681 = !DILocation(line: 1428, column: 6, scope: !1679)
!1682 = !DILocation(line: 1430, column: 7, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1684, file: !66, line: 1430, column: 7)
!1684 = distinct !DILexicalBlock(scope: !1678, file: !66, line: 1429, column: 3)
!1685 = !DILocation(line: 1430, column: 19, scope: !1683)
!1686 = !DILocation(line: 1430, column: 7, scope: !1684)
!1687 = !DILocation(line: 1432, column: 5, scope: !1688)
!1688 = distinct !DILexicalBlock(scope: !1683, file: !66, line: 1431, column: 4)
!1689 = !DILocation(line: 1436, column: 23, scope: !1690)
!1690 = distinct !DILexicalBlock(scope: !1683, file: !66, line: 1435, column: 4)
!1691 = !DILocation(line: 1436, column: 22, scope: !1690)
!1692 = !DILocation(line: 1436, column: 35, scope: !1690)
!1693 = !DILocation(line: 1436, column: 20, scope: !1690)
!1694 = !DILocation(line: 1437, column: 17, scope: !1690)
!1695 = !DILocation(line: 1437, column: 31, scope: !1690)
!1696 = !DILocation(line: 1437, column: 41, scope: !1690)
!1697 = !DILocation(line: 1437, column: 40, scope: !1690)
!1698 = !DILocation(line: 1437, column: 59, scope: !1690)
!1699 = !DILocation(line: 1437, column: 57, scope: !1690)
!1700 = !DILocation(line: 1437, column: 27, scope: !1690)
!1701 = !DILocation(line: 1437, column: 76, scope: !1690)
!1702 = !DILocation(line: 1437, column: 14, scope: !1690)
!1703 = !DILocation(line: 1438, column: 17, scope: !1690)
!1704 = !DILocation(line: 1438, column: 27, scope: !1690)
!1705 = !DILocation(line: 1438, column: 26, scope: !1690)
!1706 = !DILocation(line: 1438, column: 46, scope: !1690)
!1707 = !DILocation(line: 1438, column: 55, scope: !1690)
!1708 = !DILocation(line: 1438, column: 54, scope: !1690)
!1709 = !DILocation(line: 1438, column: 43, scope: !1690)
!1710 = !DILocation(line: 1438, column: 14, scope: !1690)
!1711 = !DILocation(line: 1439, column: 14, scope: !1690)
!1712 = !DILocation(line: 1439, column: 13, scope: !1690)
!1713 = !DILocation(line: 1439, column: 23, scope: !1690)
!1714 = !DILocation(line: 1439, column: 5, scope: !1690)
!1715 = !DILocation(line: 1444, column: 16, scope: !1716)
!1716 = distinct !DILexicalBlock(scope: !1678, file: !66, line: 1443, column: 3)
!1717 = !DILocation(line: 1444, column: 30, scope: !1716)
!1718 = !DILocation(line: 1444, column: 40, scope: !1716)
!1719 = !DILocation(line: 1444, column: 39, scope: !1716)
!1720 = !DILocation(line: 1444, column: 55, scope: !1716)
!1721 = !DILocation(line: 1444, column: 53, scope: !1716)
!1722 = !DILocation(line: 1444, column: 26, scope: !1716)
!1723 = !DILocation(line: 1444, column: 69, scope: !1716)
!1724 = !DILocation(line: 1444, column: 13, scope: !1716)
!1725 = !DILocation(line: 1445, column: 16, scope: !1716)
!1726 = !DILocation(line: 1445, column: 26, scope: !1716)
!1727 = !DILocation(line: 1445, column: 25, scope: !1716)
!1728 = !DILocation(line: 1445, column: 42, scope: !1716)
!1729 = !DILocation(line: 1445, column: 51, scope: !1716)
!1730 = !DILocation(line: 1445, column: 50, scope: !1716)
!1731 = !DILocation(line: 1445, column: 39, scope: !1716)
!1732 = !DILocation(line: 1445, column: 13, scope: !1716)
!1733 = !DILocation(line: 1446, column: 11, scope: !1716)
!1734 = !DILocation(line: 1446, column: 4, scope: !1716)
!1735 = !DILocation(line: 1449, column: 1, scope: !1581)
!1736 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !66, file: !66, line: 1467, type: !1737, scopeLine: 1468, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1737 = !DISubroutineType(types: !1738)
!1738 = !{!6, !74, !428}
!1739 = !DILocalVariable(name: "numerator", arg: 1, scope: !1736, file: !66, line: 1467, type: !74)
!1740 = !DILocation(line: 1467, column: 25, scope: !1736)
!1741 = !DILocalVariable(name: "denominator", arg: 2, scope: !1736, file: !66, line: 1467, type: !428)
!1742 = !DILocation(line: 1467, column: 40, scope: !1736)
!1743 = !DILocalVariable(name: "numerator_prime", scope: !1736, file: !66, line: 1470, type: !428)
!1744 = !DILocation(line: 1470, column: 6, scope: !1736)
!1745 = !DILocalVariable(name: "u32Temp1", scope: !1736, file: !66, line: 1470, type: !428)
!1746 = !DILocation(line: 1470, column: 27, scope: !1736)
!1747 = !DILocalVariable(name: "u32Temp2", scope: !1736, file: !66, line: 1470, type: !428)
!1748 = !DILocation(line: 1470, column: 41, scope: !1736)
!1749 = !DILocalVariable(name: "u32Temp3", scope: !1736, file: !66, line: 1470, type: !428)
!1750 = !DILocation(line: 1470, column: 55, scope: !1736)
!1751 = !DILocalVariable(name: "s32Temp1", scope: !1736, file: !66, line: 1471, type: !74)
!1752 = !DILocation(line: 1471, column: 6, scope: !1736)
!1753 = !DILocalVariable(name: "s32Temp2", scope: !1736, file: !66, line: 1471, type: !74)
!1754 = !DILocation(line: 1471, column: 20, scope: !1736)
!1755 = !DILocalVariable(name: "s32Temp3", scope: !1736, file: !66, line: 1471, type: !74)
!1756 = !DILocation(line: 1471, column: 34, scope: !1736)
!1757 = !DILocation(line: 1472, column: 5, scope: !1758)
!1758 = distinct !DILexicalBlock(scope: !1736, file: !66, line: 1472, column: 5)
!1759 = !DILocation(line: 1472, column: 17, scope: !1758)
!1760 = !DILocation(line: 1472, column: 5, scope: !1736)
!1761 = !DILocation(line: 1474, column: 6, scope: !1762)
!1762 = distinct !DILexicalBlock(scope: !1763, file: !66, line: 1474, column: 6)
!1763 = distinct !DILexicalBlock(scope: !1758, file: !66, line: 1473, column: 2)
!1764 = !DILocation(line: 1474, column: 15, scope: !1762)
!1765 = !DILocation(line: 1474, column: 6, scope: !1763)
!1766 = !DILocation(line: 1476, column: 4, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1762, file: !66, line: 1475, column: 3)
!1768 = !DILocation(line: 1480, column: 4, scope: !1769)
!1769 = distinct !DILexicalBlock(scope: !1762, file: !66, line: 1479, column: 3)
!1770 = !DILocation(line: 1485, column: 6, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1772, file: !66, line: 1485, column: 6)
!1772 = distinct !DILexicalBlock(scope: !1758, file: !66, line: 1484, column: 2)
!1773 = !DILocation(line: 1485, column: 16, scope: !1771)
!1774 = !DILocation(line: 1485, column: 6, scope: !1772)
!1775 = !DILocation(line: 1487, column: 23, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1771, file: !66, line: 1486, column: 3)
!1777 = !DILocation(line: 1487, column: 22, scope: !1776)
!1778 = !DILocation(line: 1487, column: 20, scope: !1776)
!1779 = !DILocation(line: 1488, column: 16, scope: !1776)
!1780 = !DILocation(line: 1488, column: 32, scope: !1776)
!1781 = !DILocation(line: 1488, column: 31, scope: !1776)
!1782 = !DILocation(line: 1488, column: 13, scope: !1776)
!1783 = !DILocation(line: 1489, column: 15, scope: !1776)
!1784 = !DILocation(line: 1489, column: 34, scope: !1776)
!1785 = !DILocation(line: 1489, column: 45, scope: !1776)
!1786 = !DILocation(line: 1489, column: 43, scope: !1776)
!1787 = !DILocation(line: 1489, column: 31, scope: !1776)
!1788 = !DILocation(line: 1489, column: 13, scope: !1776)
!1789 = !DILocation(line: 1491, column: 8, scope: !1790)
!1790 = distinct !DILexicalBlock(scope: !1776, file: !66, line: 1491, column: 7)
!1791 = !DILocation(line: 1491, column: 20, scope: !1790)
!1792 = !DILocation(line: 1491, column: 27, scope: !1790)
!1793 = !DILocation(line: 1491, column: 7, scope: !1776)
!1794 = !DILocation(line: 1493, column: 19, scope: !1795)
!1795 = distinct !DILexicalBlock(scope: !1790, file: !66, line: 1492, column: 4)
!1796 = !DILocation(line: 1493, column: 31, scope: !1795)
!1797 = !DILocation(line: 1493, column: 17, scope: !1795)
!1798 = !DILocation(line: 1494, column: 4, scope: !1795)
!1799 = !DILocation(line: 1497, column: 20, scope: !1800)
!1800 = distinct !DILexicalBlock(scope: !1790, file: !66, line: 1496, column: 4)
!1801 = !DILocation(line: 1497, column: 32, scope: !1800)
!1802 = !DILocation(line: 1497, column: 38, scope: !1800)
!1803 = !DILocation(line: 1497, column: 17, scope: !1800)
!1804 = !DILocation(line: 1500, column: 7, scope: !1805)
!1805 = distinct !DILexicalBlock(scope: !1776, file: !66, line: 1500, column: 7)
!1806 = !DILocation(line: 1500, column: 18, scope: !1805)
!1807 = !DILocation(line: 1500, column: 16, scope: !1805)
!1808 = !DILocation(line: 1500, column: 7, scope: !1776)
!1809 = !DILocation(line: 1502, column: 18, scope: !1810)
!1810 = distinct !DILexicalBlock(scope: !1805, file: !66, line: 1501, column: 4)
!1811 = !DILocation(line: 1502, column: 16, scope: !1810)
!1812 = !DILocation(line: 1502, column: 28, scope: !1810)
!1813 = !DILocation(line: 1502, column: 14, scope: !1810)
!1814 = !DILocation(line: 1503, column: 4, scope: !1810)
!1815 = !DILocation(line: 1506, column: 18, scope: !1816)
!1816 = distinct !DILexicalBlock(scope: !1805, file: !66, line: 1505, column: 4)
!1817 = !DILocation(line: 1506, column: 26, scope: !1816)
!1818 = !DILocation(line: 1506, column: 16, scope: !1816)
!1819 = !DILocation(line: 1506, column: 30, scope: !1816)
!1820 = !DILocation(line: 1506, column: 14, scope: !1816)
!1821 = !DILocation(line: 1508, column: 8, scope: !1822)
!1822 = distinct !DILexicalBlock(scope: !1776, file: !66, line: 1508, column: 7)
!1823 = !DILocation(line: 1508, column: 18, scope: !1822)
!1824 = !DILocation(line: 1508, column: 7, scope: !1776)
!1825 = !DILocation(line: 1510, column: 18, scope: !1826)
!1826 = distinct !DILexicalBlock(scope: !1822, file: !66, line: 1509, column: 4)
!1827 = !DILocation(line: 1510, column: 12, scope: !1826)
!1828 = !DILocation(line: 1510, column: 5, scope: !1826)
!1829 = !DILocation(line: 1514, column: 5, scope: !1830)
!1830 = distinct !DILexicalBlock(scope: !1822, file: !66, line: 1513, column: 4)
!1831 = !DILocation(line: 1519, column: 16, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !1771, file: !66, line: 1518, column: 3)
!1833 = !DILocation(line: 1519, column: 26, scope: !1832)
!1834 = !DILocation(line: 1519, column: 25, scope: !1832)
!1835 = !DILocation(line: 1519, column: 41, scope: !1832)
!1836 = !DILocation(line: 1519, column: 39, scope: !1832)
!1837 = !DILocation(line: 1519, column: 13, scope: !1832)
!1838 = !DILocation(line: 1520, column: 16, scope: !1832)
!1839 = !DILocation(line: 1520, column: 30, scope: !1832)
!1840 = !DILocation(line: 1520, column: 40, scope: !1832)
!1841 = !DILocation(line: 1520, column: 39, scope: !1832)
!1842 = !DILocation(line: 1520, column: 55, scope: !1832)
!1843 = !DILocation(line: 1520, column: 53, scope: !1832)
!1844 = !DILocation(line: 1520, column: 26, scope: !1832)
!1845 = !DILocation(line: 1520, column: 68, scope: !1832)
!1846 = !DILocation(line: 1520, column: 13, scope: !1832)
!1847 = !DILocation(line: 1521, column: 16, scope: !1832)
!1848 = !DILocation(line: 1521, column: 25, scope: !1832)
!1849 = !DILocation(line: 1521, column: 24, scope: !1832)
!1850 = !DILocation(line: 1521, column: 41, scope: !1832)
!1851 = !DILocation(line: 1521, column: 51, scope: !1832)
!1852 = !DILocation(line: 1521, column: 50, scope: !1832)
!1853 = !DILocation(line: 1521, column: 38, scope: !1832)
!1854 = !DILocation(line: 1521, column: 13, scope: !1832)
!1855 = !DILocation(line: 1522, column: 7, scope: !1856)
!1856 = distinct !DILexicalBlock(scope: !1832, file: !66, line: 1522, column: 7)
!1857 = !DILocation(line: 1522, column: 16, scope: !1856)
!1858 = !DILocation(line: 1522, column: 7, scope: !1832)
!1859 = !DILocation(line: 1524, column: 17, scope: !1860)
!1860 = distinct !DILexicalBlock(scope: !1856, file: !66, line: 1523, column: 4)
!1861 = !DILocation(line: 1524, column: 12, scope: !1860)
!1862 = !DILocation(line: 1524, column: 5, scope: !1860)
!1863 = !DILocation(line: 1528, column: 5, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1856, file: !66, line: 1527, column: 4)
!1865 = !DILocation(line: 1532, column: 1, scope: !1736)
!1866 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1867, file: !1867, line: 12, type: !1868, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !30, retainedNodes: !1871)
!1867 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1868 = !DISubroutineType(types: !1869)
!1869 = !{null, !1870}
!1870 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1871 = !{!1872}
!1872 = !DILocalVariable(name: "z", arg: 1, scope: !1866, file: !1867, line: 12, type: !1870)
!1873 = !DILocation(line: 0, scope: !1866)
!1874 = !DILocation(line: 13, column: 9, scope: !1875)
!1875 = distinct !DILexicalBlock(scope: !1866, file: !1867, line: 13, column: 7)
!1876 = !DILocation(line: 13, column: 7, scope: !1866)
!1877 = !DILocation(line: 14, column: 5, scope: !1875)
!1878 = !DILocation(line: 15, column: 1, scope: !1866)
