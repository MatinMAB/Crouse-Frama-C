; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0057/build/s16_fac05_div_s16_u16_alarm_0057.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [125 x i8] c"KLEE-ALARM-0057: signed overflow. assert (s32)((int)((int)((int)numerator << 16) / (int)u16Temp1)) + s32Temp1 <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0057.err\00", align 1
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
  %numerator = alloca i16, align 2
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %numerator, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i16* %result, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = bitcast i16* %numerator to i8*, !dbg !58
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !59
  %1 = bitcast i16* %denominator to i8*, !dbg !60
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  %2 = load i16, i16* %numerator, align 2, !dbg !62
  %3 = load i16, i16* %denominator, align 2, !dbg !63
  %call = call signext i16 @s16_fac05_div_s16_u16(i16 signext %2, i16 zeroext %3), !dbg !64
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
  %conv2 = sext i16 %1 to i32, !dbg !317
  %conv3 = sext i32 %conv2 to i64, !dbg !318
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv3), !dbg !319
  %tobool = icmp ne i32 %call, 0, !dbg !319
  br i1 %tobool, label %if.end, label %if.then, !dbg !320

if.then:                                          ; preds = %entry
  store i16 0, i16* %retval, align 2, !dbg !321
  br label %return, !dbg !321

if.end:                                           ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !323
  %conv4 = sext i16 %2 to i32, !dbg !323
  %shl = shl i32 %conv4, 16, !dbg !324
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !325
  %3 = load i16, i16* %u16Temp1, align 2, !dbg !326
  %conv5 = zext i16 %3 to i32, !dbg !326
  %cmp = icmp eq i32 %conv5, 0, !dbg !328
  br i1 %cmp, label %if.then7, label %if.else12, !dbg !329

if.then7:                                         ; preds = %if.end
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !330
  %conv8 = sext i16 %4 to i32, !dbg !330
  %cmp9 = icmp slt i32 %conv8, 0, !dbg !333
  br i1 %cmp9, label %if.then11, label %if.else, !dbg !334

if.then11:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !335
  br label %return, !dbg !335

if.else:                                          ; preds = %if.then7
  store i16 32767, i16* %retval, align 2, !dbg !337
  br label %return, !dbg !337

if.else12:                                        ; preds = %if.end
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !339
  %conv13 = sext i16 %5 to i32, !dbg !342
  %shl14 = shl i32 %conv13, 16, !dbg !343
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !344
  %conv15 = zext i16 %6 to i32, !dbg !345
  %int_cast_to_i64 = zext i32 %conv15 to i64, !dbg !346
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !346
  %div = sdiv i32 %shl14, %conv15, !dbg !346, !klee.check.div !106
  %conv16 = sext i32 %div to i64, !dbg !347
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !348
  %conv17 = zext i16 %7 to i32, !dbg !349
  %conv18 = sext i32 %conv17 to i64, !dbg !350
  %call19 = call i32 @klee_alarm_s32_mul_upper(i64 %conv16, i64 %conv18), !dbg !351
  %tobool20 = icmp ne i32 %call19, 0, !dbg !351
  br i1 %tobool20, label %if.end22, label %if.then21, !dbg !352

if.then21:                                        ; preds = %if.else12
  store i16 0, i16* %retval, align 2, !dbg !353
  br label %return, !dbg !353

if.end22:                                         ; preds = %if.else12
  %8 = load i16, i16* %numerator.addr, align 2, !dbg !355
  %conv23 = sext i16 %8 to i32, !dbg !355
  %shl24 = shl i32 %conv23, 16, !dbg !356
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !357
  %conv25 = sext i16 %9 to i32, !dbg !357
  %shl26 = shl i32 %conv25, 16, !dbg !358
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !359
  %conv27 = zext i16 %10 to i32, !dbg !359
  %int_cast_to_i641 = zext i32 %conv27 to i64, !dbg !360
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !360
  %div28 = sdiv i32 %shl26, %conv27, !dbg !360, !klee.check.div !106
  %11 = load i16, i16* %u16Temp1, align 2, !dbg !361
  %conv29 = zext i16 %11 to i32, !dbg !361
  %mul = mul nsw i32 %div28, %conv29, !dbg !362
  %sub = sub nsw i32 %shl24, %mul, !dbg !363
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !364
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !365
  %conv30 = sext i32 %12 to i64, !dbg !367
  %call31 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv30), !dbg !368
  %tobool32 = icmp ne i32 %call31, 0, !dbg !368
  br i1 %tobool32, label %if.end34, label %if.then33, !dbg !369

if.then33:                                        ; preds = %if.end22
  store i16 0, i16* %retval, align 2, !dbg !370
  br label %return, !dbg !370

if.end34:                                         ; preds = %if.end22
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !372
  %conv35 = sext i32 %13 to i64, !dbg !374
  %call36 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv35, i32 1), !dbg !375
  %tobool37 = icmp ne i32 %call36, 0, !dbg !375
  br i1 %tobool37, label %if.end39, label %if.then38, !dbg !376

if.then38:                                        ; preds = %if.end34
  store i16 0, i16* %retval, align 2, !dbg !377
  br label %return, !dbg !377

if.end39:                                         ; preds = %if.end34
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !379
  %shl40 = shl i32 %14, 1, !dbg !380
  store i32 %shl40, i32* %s32Temp2, align 4, !dbg !381
  %15 = load i32, i32* %s32Temp2, align 4, !dbg !382
  %16 = load i16, i16* %u16Temp1, align 2, !dbg !383
  %conv41 = zext i16 %16 to i32, !dbg !383
  %int_cast_to_i642 = zext i32 %conv41 to i64, !dbg !384
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !384
  %div42 = sdiv i32 %15, %conv41, !dbg !384, !klee.check.div !106
  store i32 %div42, i32* %s32Temp1, align 4, !dbg !385
  %17 = load i16, i16* %numerator.addr, align 2, !dbg !386
  %conv43 = sext i16 %17 to i32, !dbg !388
  %shl44 = shl i32 %conv43, 16, !dbg !389
  %18 = load i16, i16* %u16Temp1, align 2, !dbg !390
  %conv45 = zext i16 %18 to i32, !dbg !391
  %int_cast_to_i643 = zext i32 %conv45 to i64, !dbg !392
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !392
  %div46 = sdiv i32 %shl44, %conv45, !dbg !392, !klee.check.div !106
  %conv47 = sext i32 %div46 to i64, !dbg !393
  %19 = load i32, i32* %s32Temp1, align 4, !dbg !394
  %conv48 = sext i32 %19 to i64, !dbg !395
  %call49 = call i32 @klee_alarm_s32_add_upper(i64 %conv47, i64 %conv48), !dbg !396
  %tobool50 = icmp ne i32 %call49, 0, !dbg !396
  br i1 %tobool50, label %if.end52, label %if.then51, !dbg !397

if.then51:                                        ; preds = %if.end39
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 385, i8* getelementptr inbounds ([125 x i8], [125 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !398
  unreachable, !dbg !398

if.end52:                                         ; preds = %if.end39
  %20 = load i16, i16* %numerator.addr, align 2, !dbg !400
  %conv53 = sext i16 %20 to i32, !dbg !401
  %shl54 = shl i32 %conv53, 16, !dbg !402
  %21 = load i16, i16* %u16Temp1, align 2, !dbg !403
  %conv55 = zext i16 %21 to i32, !dbg !404
  %int_cast_to_i644 = zext i32 %conv55 to i64, !dbg !405
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !405
  %div56 = sdiv i32 %shl54, %conv55, !dbg !405, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !406
  %add = add nsw i32 %div56, %22, !dbg !407
  %conv57 = sext i32 %add to i64, !dbg !408
  store volatile i64 %conv57, i64* @klee_alarm_sink_s64, align 8, !dbg !409
  store i16 0, i16* %retval, align 2, !dbg !410
  br label %return, !dbg !410

return:                                           ; preds = %if.end52, %if.then38, %if.then33, %if.then21, %if.else, %if.then11, %if.then
  %23 = load i16, i16* %retval, align 2, !dbg !411
  ret i16 %23, !dbg !411
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !412 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !415, metadata !DIExpression()), !dbg !416
  %0 = load i64, i64* %left.addr, align 8, !dbg !417
  %cmp = icmp sge i64 %0, 0, !dbg !418
  %conv = zext i1 %cmp to i32, !dbg !418
  ret i32 %conv, !dbg !419
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
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !432 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !435, metadata !DIExpression()), !dbg !436
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !437, metadata !DIExpression()), !dbg !438
  %0 = load i32, i32* %count.addr, align 4, !dbg !439
  %cmp = icmp uge i32 %0, 63, !dbg !441
  br i1 %cmp, label %if.then, label %if.end, !dbg !442

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !443
  br label %return, !dbg !443

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !445
  %2 = load i32, i32* %count.addr, align 4, !dbg !446
  %sh_prom = zext i32 %2 to i64, !dbg !447
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !447
  %shl = shl i64 1, %sh_prom, !dbg !447, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !448
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !449
  %conv = zext i1 %cmp1 to i32, !dbg !449
  store i32 %conv, i32* %retval, align 4, !dbg !450
  br label %return, !dbg !450

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !451
  ret i32 %3, !dbg !451
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !452 {
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
  %cmp = icmp sle i64 %add, 2147483647, !dbg !460
  %conv = zext i1 %cmp to i32, !dbg !460
  ret i32 %conv, !dbg !461
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !462 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !463, metadata !DIExpression()), !dbg !464
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !465, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !467, metadata !DIExpression()), !dbg !468
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !469, metadata !DIExpression()), !dbg !470
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !471
  %conv = zext i16 %0 to i32, !dbg !471
  %and = and i32 %conv, 65535, !dbg !472
  %conv1 = trunc i32 %and to i16, !dbg !471
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !473
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !474
  %conv2 = zext i16 %1 to i32, !dbg !474
  %cmp = icmp eq i32 %conv2, 0, !dbg !476
  br i1 %cmp, label %if.then, label %if.else8, !dbg !477

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !478
  %conv4 = sext i16 %2 to i32, !dbg !478
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !481
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !482

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !483
  br label %return, !dbg !483

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !485
  br label %return, !dbg !485

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !487
  %conv9 = sext i16 %3 to i32, !dbg !487
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !489
  %conv10 = sext i16 %4 to i32, !dbg !489
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !490
  %conv11 = zext i16 %5 to i32, !dbg !490
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !491
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !491
  %div = sdiv i32 %conv10, %conv11, !dbg !491, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !492
  %conv12 = zext i16 %6 to i32, !dbg !492
  %mul = mul nsw i32 %div, %conv12, !dbg !493
  %sub = sub nsw i32 %conv9, %mul, !dbg !494
  %shl = shl i32 %sub, 1, !dbg !495
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !496
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !497
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !498
  %conv13 = zext i16 %8 to i32, !dbg !498
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !499
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !499
  %div14 = sdiv i32 %7, %conv13, !dbg !499, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !500
  %conv15 = sext i16 %9 to i32, !dbg !500
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !501
  %conv16 = zext i16 %10 to i32, !dbg !501
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !502
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !502
  %div17 = sdiv i32 %conv15, %conv16, !dbg !502, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !503
  store i32 %add, i32* %s32Temp1, align 4, !dbg !504
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !505
  %conv18 = trunc i32 %11 to i16, !dbg !505
  store i16 %conv18, i16* %retval, align 2, !dbg !506
  br label %return, !dbg !506

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !507
  ret i16 %12, !dbg !507
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !508 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !511, metadata !DIExpression()), !dbg !512
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !513, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !515, metadata !DIExpression()), !dbg !517
  store i32 0, i32* %u32Temp1, align 4, !dbg !517
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !518, metadata !DIExpression()), !dbg !519
  store i32 0, i32* %u32Temp2, align 4, !dbg !519
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !520, metadata !DIExpression()), !dbg !521
  store i32 0, i32* %u32Temp3, align 4, !dbg !521
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !522
  %conv = zext i16 %0 to i32, !dbg !522
  %cmp = icmp eq i32 %conv, 0, !dbg !524
  br i1 %cmp, label %if.then, label %if.else, !dbg !525

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !526
  br label %return, !dbg !526

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !528
  %conv2 = zext i16 %1 to i32, !dbg !528
  %shl = shl i32 %conv2, 16, !dbg !530
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !531
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !532
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !533
  %conv3 = zext i16 %3 to i32, !dbg !533
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !534
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !534
  %div = udiv i32 %2, %conv3, !dbg !534, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !535
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !536
  %add = add i32 %4, 128, !dbg !537
  %shr = lshr i32 %add, 8, !dbg !538
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !539
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !540
  %cmp4 = icmp ult i32 %5, 255, !dbg !542
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !543

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !544
  %conv7 = trunc i32 %6 to i8, !dbg !546
  store i8 %conv7, i8* %retval, align 1, !dbg !547
  br label %return, !dbg !547

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !548
  br label %return, !dbg !548

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !550
  ret i8 %7, !dbg !550
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !551 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !554, metadata !DIExpression()), !dbg !555
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !556, metadata !DIExpression()), !dbg !557
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !558, metadata !DIExpression()), !dbg !559
  store i32 0, i32* %s32Temp1, align 4, !dbg !559
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !560
  %conv = zext i16 %0 to i32, !dbg !560
  %and = and i32 %conv, 65535, !dbg !561
  %conv1 = trunc i32 %and to i16, !dbg !560
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !562
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !563
  %conv2 = zext i16 %1 to i32, !dbg !563
  %and3 = and i32 %conv2, 65535, !dbg !565
  %cmp = icmp eq i32 %and3, 0, !dbg !566
  br i1 %cmp, label %if.then, label %if.else8, !dbg !567

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !568
  %cmp5 = icmp sge i32 %2, 0, !dbg !571
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !572

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !573
  br label %return, !dbg !573

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !575
  br label %return, !dbg !575

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !577
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !579
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !580
  %conv9 = zext i16 %5 to i32, !dbg !580
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !581
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !581
  %div = sdiv i32 %4, %conv9, !dbg !581, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !582
  %conv10 = zext i16 %6 to i32, !dbg !582
  %mul = mul nsw i32 %div, %conv10, !dbg !583
  %sub = sub nsw i32 %3, %mul, !dbg !584
  %shl = shl i32 %sub, 1, !dbg !585
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !586
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !587
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !588
  %conv11 = zext i16 %8 to i32, !dbg !588
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !589
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !589
  %div12 = sdiv i32 %7, %conv11, !dbg !589, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !590
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !591
  %conv13 = zext i16 %10 to i32, !dbg !591
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !592
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !592
  %div14 = sdiv i32 %9, %conv13, !dbg !592, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !593
  store i32 %add, i32* %s32Temp1, align 4, !dbg !594
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !595
  %cmp15 = icmp slt i32 %11, 65535, !dbg !597
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !598

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !599
  %cmp18 = icmp sgt i32 %12, 0, !dbg !602
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !603

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !604
  %conv21 = trunc i32 %13 to i16, !dbg !606
  store i16 %conv21, i16* %retval, align 2, !dbg !607
  br label %return, !dbg !607

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !608
  br label %return, !dbg !608

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !610
  br label %return, !dbg !610

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !612
  ret i16 %14, !dbg !612
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !613 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !616, metadata !DIExpression()), !dbg !617
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !618, metadata !DIExpression()), !dbg !619
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !620, metadata !DIExpression()), !dbg !621
  store i32 0, i32* %u32Temp, align 4, !dbg !621
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !622
  %conv = zext i16 %0 to i32, !dbg !622
  %cmp = icmp eq i32 %conv, 0, !dbg !624
  br i1 %cmp, label %if.then, label %if.else, !dbg !625

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !626
  br label %return, !dbg !626

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !628
  %conv2 = zext i16 %1 to i32, !dbg !628
  %shl = shl i32 %conv2, 16, !dbg !630
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !631
  %conv3 = zext i16 %2 to i32, !dbg !631
  %shr = ashr i32 %conv3, 1, !dbg !632
  %add = add nsw i32 %shl, %shr, !dbg !633
  store i32 %add, i32* %u32Temp, align 4, !dbg !634
  %3 = load i32, i32* %u32Temp, align 4, !dbg !635
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !636
  %conv4 = zext i16 %4 to i32, !dbg !636
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !637
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !637
  %div = udiv i32 %3, %conv4, !dbg !637, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !638
  %5 = load i32, i32* %u32Temp, align 4, !dbg !639
  %cmp5 = icmp ult i32 %5, 65535, !dbg !641
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !642

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !643
  %and = and i32 %6, 65535, !dbg !645
  %conv8 = trunc i32 %and to i16, !dbg !643
  store i16 %conv8, i16* %retval, align 2, !dbg !646
  br label %return, !dbg !646

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !647
  br label %return, !dbg !647

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !649
  ret i16 %7, !dbg !649
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !650 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !653, metadata !DIExpression()), !dbg !654
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !655, metadata !DIExpression()), !dbg !656
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !657, metadata !DIExpression()), !dbg !658
  store i32 0, i32* %u32Temp1, align 4, !dbg !658
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !659, metadata !DIExpression()), !dbg !660
  store i32 0, i32* %u32Temp2, align 4, !dbg !660
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !661
  %conv = zext i16 %0 to i32, !dbg !661
  %and = and i32 %conv, 65535, !dbg !662
  %conv1 = trunc i32 %and to i16, !dbg !661
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !663
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !664
  %conv2 = zext i16 %1 to i32, !dbg !664
  %cmp = icmp eq i32 %conv2, 0, !dbg !666
  br i1 %cmp, label %if.then, label %if.else, !dbg !667

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !668
  br label %return, !dbg !668

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !670
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !672
  %conv4 = zext i16 %3 to i32, !dbg !672
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !673
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !673
  %div = udiv i32 %2, %conv4, !dbg !673, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !674
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !675
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !676
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !677
  %conv5 = zext i16 %6 to i32, !dbg !677
  %mul = mul i32 %5, %conv5, !dbg !678
  %sub = sub i32 %4, %mul, !dbg !679
  %shl = shl i32 %sub, 1, !dbg !680
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !681
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !682
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !683
  %conv6 = zext i16 %8 to i32, !dbg !683
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !684
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !684
  %div7 = udiv i32 %7, %conv6, !dbg !684, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !685
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !686
  %conv8 = zext i16 %10 to i32, !dbg !686
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !687
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !687
  %div9 = udiv i32 %9, %conv8, !dbg !687, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !688
  store i32 %add, i32* %u32Temp2, align 4, !dbg !689
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !690
  %cmp10 = icmp ult i32 %11, 65535, !dbg !692
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !693

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !694
  %and13 = and i32 %12, 65535, !dbg !696
  %conv14 = trunc i32 %and13 to i16, !dbg !694
  store i16 %conv14, i16* %retval, align 2, !dbg !697
  br label %return, !dbg !697

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !698
  br label %return, !dbg !698

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !700
  ret i16 %13, !dbg !700
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !701 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !704, metadata !DIExpression()), !dbg !705
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !706, metadata !DIExpression()), !dbg !707
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !708, metadata !DIExpression()), !dbg !709
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !710, metadata !DIExpression()), !dbg !711
  store i32 0, i32* %s32Result, align 4, !dbg !711
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !712, metadata !DIExpression()), !dbg !713
  store i32 0, i32* %s32Temp1, align 4, !dbg !713
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !714
  %conv = sext i16 %0 to i32, !dbg !714
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !715
  %conv1 = zext i16 %1 to i32, !dbg !715
  %mul = mul nsw i32 %conv, %conv1, !dbg !716
  store i32 %mul, i32* %s32Result, align 4, !dbg !717
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !718
  %conv2 = sext i16 %2 to i32, !dbg !718
  %cmp = icmp eq i32 %conv2, 0, !dbg !720
  br i1 %cmp, label %if.then, label %if.else7, !dbg !721

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !722
  %cmp4 = icmp slt i32 %3, 0, !dbg !725
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !726

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !727
  br label %return, !dbg !727

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !729
  br label %return, !dbg !729

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !731
  %5 = load i32, i32* %s32Result, align 4, !dbg !733
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !734
  %conv8 = sext i16 %6 to i32, !dbg !734
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !735
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !735
  %div = sdiv i32 %5, %conv8, !dbg !735, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !736
  %conv9 = sext i16 %7 to i32, !dbg !736
  %mul10 = mul nsw i32 %div, %conv9, !dbg !737
  %sub = sub nsw i32 %4, %mul10, !dbg !738
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !739
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !740
  %shl = shl i32 %8, 1, !dbg !741
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !742
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !743
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !744
  %conv11 = sext i16 %10 to i32, !dbg !744
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !745
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !745
  %div12 = sdiv i32 %9, %conv11, !dbg !745, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !746
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !747
  %conv13 = sext i16 %12 to i32, !dbg !747
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !748
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !748
  %div14 = sdiv i32 %11, %conv13, !dbg !748, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !749
  store i32 %add, i32* %s32Result, align 4, !dbg !750
  %13 = load i32, i32* %s32Result, align 4, !dbg !751
  %cmp15 = icmp slt i32 %13, 32767, !dbg !753
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !754

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !755
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !758
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !759

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !760
  %conv21 = trunc i32 %15 to i16, !dbg !762
  store i16 %conv21, i16* %retval, align 2, !dbg !763
  br label %return, !dbg !763

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !764
  br label %return, !dbg !764

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !766
  br label %return, !dbg !766

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !768
  ret i16 %16, !dbg !768
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !769 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !772, metadata !DIExpression()), !dbg !773
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !774, metadata !DIExpression()), !dbg !775
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !776, metadata !DIExpression()), !dbg !777
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !778, metadata !DIExpression()), !dbg !779
  store i32 0, i32* %s32Result, align 4, !dbg !779
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !780, metadata !DIExpression()), !dbg !781
  store i32 0, i32* %s32Temp1, align 4, !dbg !781
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !782
  %conv = zext i16 %0 to i32, !dbg !782
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !783
  %conv1 = sext i16 %1 to i32, !dbg !783
  %mul = mul nsw i32 %conv, %conv1, !dbg !784
  store i32 %mul, i32* %s32Result, align 4, !dbg !785
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !786
  %conv2 = zext i16 %2 to i32, !dbg !786
  %cmp = icmp eq i32 %conv2, 0, !dbg !788
  br i1 %cmp, label %if.then, label %if.else7, !dbg !789

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !790
  %cmp4 = icmp slt i32 %3, 0, !dbg !793
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !794

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !795
  br label %return, !dbg !795

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !797
  br label %return, !dbg !797

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !799
  %5 = load i32, i32* %s32Result, align 4, !dbg !801
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !802
  %conv8 = zext i16 %6 to i32, !dbg !802
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !803
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !803
  %div = sdiv i32 %5, %conv8, !dbg !803, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !804
  %conv9 = zext i16 %7 to i32, !dbg !804
  %mul10 = mul nsw i32 %div, %conv9, !dbg !805
  %sub = sub nsw i32 %4, %mul10, !dbg !806
  %shl = shl i32 %sub, 1, !dbg !807
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !808
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !809
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !810
  %conv11 = zext i16 %9 to i32, !dbg !810
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !811
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !811
  %div12 = sdiv i32 %8, %conv11, !dbg !811, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !812
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !813
  %conv13 = zext i16 %11 to i32, !dbg !813
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !814
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !814
  %div14 = sdiv i32 %10, %conv13, !dbg !814, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !815
  store i32 %add, i32* %s32Result, align 4, !dbg !816
  %12 = load i32, i32* %s32Result, align 4, !dbg !817
  %cmp15 = icmp slt i32 %12, 32767, !dbg !819
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !820

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !821
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !824
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !825

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !826
  %conv21 = trunc i32 %14 to i16, !dbg !828
  store i16 %conv21, i16* %retval, align 2, !dbg !829
  br label %return, !dbg !829

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !830
  br label %return, !dbg !830

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !832
  br label %return, !dbg !832

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !834
  ret i16 %15, !dbg !834
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !835 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !838, metadata !DIExpression()), !dbg !839
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !840, metadata !DIExpression()), !dbg !841
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !842, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !844, metadata !DIExpression()), !dbg !845
  store i32 0, i32* %u32Result, align 4, !dbg !845
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !846, metadata !DIExpression()), !dbg !847
  store i32 0, i32* %u32Temp1, align 4, !dbg !847
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !848, metadata !DIExpression()), !dbg !849
  store i32 0, i32* %s32Result, align 4, !dbg !849
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !850, metadata !DIExpression()), !dbg !851
  store i32 0, i32* %s32Temp1, align 4, !dbg !851
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !852
  %conv = sext i16 %0 to i32, !dbg !852
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !853
  %conv1 = zext i16 %1 to i32, !dbg !853
  %mul = mul nsw i32 %conv, %conv1, !dbg !854
  store i32 %mul, i32* %s32Result, align 4, !dbg !855
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !856
  %conv2 = sext i16 %2 to i32, !dbg !856
  %cmp = icmp eq i32 %conv2, 0, !dbg !858
  br i1 %cmp, label %if.then, label %if.else7, !dbg !859

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !860
  %cmp4 = icmp sge i32 %3, 0, !dbg !863
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !864

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !865
  br label %return, !dbg !865

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !867
  br label %return, !dbg !867

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !869
  %5 = load i32, i32* %s32Result, align 4, !dbg !871
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !872
  %conv8 = sext i16 %6 to i32, !dbg !872
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !873
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !873
  %div = sdiv i32 %5, %conv8, !dbg !873, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !874
  %conv9 = sext i16 %7 to i32, !dbg !874
  %mul10 = mul nsw i32 %div, %conv9, !dbg !875
  %sub = sub nsw i32 %4, %mul10, !dbg !876
  %shl = shl i32 %sub, 1, !dbg !877
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !878
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !879
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !880
  %conv11 = sext i16 %9 to i32, !dbg !880
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !881
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !881
  %div12 = sdiv i32 %8, %conv11, !dbg !881, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !882
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !883
  %conv13 = sext i16 %11 to i32, !dbg !883
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !884
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !884
  %div14 = sdiv i32 %10, %conv13, !dbg !884, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !885
  store i32 %add, i32* %s32Result, align 4, !dbg !886
  %12 = load i32, i32* %s32Result, align 4, !dbg !887
  %cmp15 = icmp slt i32 %12, 65535, !dbg !889
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !890

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !891
  %cmp18 = icmp sgt i32 %13, 0, !dbg !894
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !895

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !896
  %conv21 = trunc i32 %14 to i16, !dbg !898
  store i16 %conv21, i16* %retval, align 2, !dbg !899
  br label %return, !dbg !899

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !900
  br label %return, !dbg !900

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !902
  br label %return, !dbg !902

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !904
  ret i16 %15, !dbg !904
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !905 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !908, metadata !DIExpression()), !dbg !909
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !910, metadata !DIExpression()), !dbg !911
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !912, metadata !DIExpression()), !dbg !913
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
  %conv2 = zext i16 %2 to i32, !dbg !922
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
  %conv8 = zext i16 %6 to i32, !dbg !938
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !939
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !939
  %div = sdiv i32 %5, %conv8, !dbg !939, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !940
  %conv9 = zext i16 %7 to i32, !dbg !940
  %mul10 = mul nsw i32 %div, %conv9, !dbg !941
  %sub = sub nsw i32 %4, %mul10, !dbg !942
  %shl = shl i32 %sub, 1, !dbg !943
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !944
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !945
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !946
  %conv11 = zext i16 %9 to i32, !dbg !946
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !947
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !947
  %div12 = sdiv i32 %8, %conv11, !dbg !947, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !948
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !949
  %conv13 = zext i16 %11 to i32, !dbg !949
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
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !971 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !974, metadata !DIExpression()), !dbg !975
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !976, metadata !DIExpression()), !dbg !977
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !978, metadata !DIExpression()), !dbg !979
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !980, metadata !DIExpression()), !dbg !981
  store i32 0, i32* %u32Temp1, align 4, !dbg !981
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !982, metadata !DIExpression()), !dbg !983
  store i16 0, i16* %u16TempDenom, align 2, !dbg !983
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !984
  %conv = zext i16 %0 to i32, !dbg !984
  %cmp = icmp eq i32 %conv, 0, !dbg !986
  br i1 %cmp, label %if.then, label %if.else, !dbg !987

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !988
  br label %return, !dbg !988

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !990
  %conv2 = zext i16 %1 to i32, !dbg !990
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !992
  %conv3 = zext i16 %2 to i32, !dbg !992
  %mul = mul nsw i32 %conv2, %conv3, !dbg !993
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !994
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !995
  %conv4 = zext i16 %3 to i32, !dbg !995
  %shr = ashr i32 %conv4, 1, !dbg !996
  %conv5 = trunc i32 %shr to i16, !dbg !995
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !997
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !998
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !999
  %conv6 = zext i16 %5 to i32, !dbg !999
  %add = add i32 %4, %conv6, !dbg !1000
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1001
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1002
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1003
  %conv7 = zext i16 %7 to i32, !dbg !1003
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1004
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1004
  %div = udiv i32 %6, %conv7, !dbg !1004, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1005
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1006
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1008
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1009

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1010
  %and = and i32 %9, 65535, !dbg !1012
  %conv11 = trunc i32 %and to i16, !dbg !1013
  store i16 %conv11, i16* %retval, align 2, !dbg !1014
  br label %return, !dbg !1014

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1015
  br label %return, !dbg !1015

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1017
  ret i16 %10, !dbg !1017
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1018 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1021, metadata !DIExpression()), !dbg !1022
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1023, metadata !DIExpression()), !dbg !1024
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1025, metadata !DIExpression()), !dbg !1026
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1027, metadata !DIExpression()), !dbg !1028
  store i32 0, i32* %u32Temp1, align 4, !dbg !1028
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1029
  %cmp = icmp eq i32 %0, 0, !dbg !1031
  br i1 %cmp, label %if.then, label %if.else, !dbg !1032

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1033
  br label %return, !dbg !1033

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1035
  %conv = zext i16 %1 to i32, !dbg !1035
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1037
  %conv1 = zext i16 %2 to i32, !dbg !1037
  %mul = mul nsw i32 %conv, %conv1, !dbg !1038
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1039
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1040
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1040
  %div = udiv i32 %mul, %3, !dbg !1040, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1041
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1042
  %conv2 = zext i16 %4 to i32, !dbg !1042
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1044
  %conv3 = zext i16 %5 to i32, !dbg !1044
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1045
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1046
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1047
  %mul5 = mul i32 %6, %7, !dbg !1048
  %sub = sub i32 %mul4, %mul5, !dbg !1049
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1050
  %div6 = udiv i32 %8, 2, !dbg !1051
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1052
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1053

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1054
  %inc = add i32 %9, 1, !dbg !1054
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1054
  br label %if.end, !dbg !1056

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1057
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1059
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1060

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1061
  %and = and i32 %11, 65535, !dbg !1063
  %conv13 = trunc i32 %and to i16, !dbg !1064
  store i16 %conv13, i16* %retval, align 2, !dbg !1065
  br label %return, !dbg !1065

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1066
  br label %return, !dbg !1066

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1068
  ret i16 %12, !dbg !1068
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1069 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1072, metadata !DIExpression()), !dbg !1073
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1074, metadata !DIExpression()), !dbg !1075
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1076, metadata !DIExpression()), !dbg !1077
  store i32 0, i32* %u32Temp1, align 4, !dbg !1077
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1078
  %conv = zext i16 %0 to i32, !dbg !1078
  %cmp = icmp eq i32 %conv, 0, !dbg !1080
  br i1 %cmp, label %if.then, label %if.else, !dbg !1081

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1082
  br label %return, !dbg !1082

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1084
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1086
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1087
  %conv2 = zext i16 %3 to i32, !dbg !1087
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1088
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1088
  %div = udiv i32 %2, %conv2, !dbg !1088, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1089
  %conv3 = zext i16 %4 to i32, !dbg !1089
  %mul = mul i32 %div, %conv3, !dbg !1090
  %sub = sub i32 %1, %mul, !dbg !1091
  %shl = shl i32 %sub, 1, !dbg !1092
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1093
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1094
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1095
  %conv4 = zext i16 %6 to i32, !dbg !1095
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1096
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1096
  %div5 = udiv i32 %5, %conv4, !dbg !1096, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1097
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1098
  %conv6 = zext i16 %8 to i32, !dbg !1098
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1099
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1099
  %div7 = udiv i32 %7, %conv6, !dbg !1099, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1100
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1101
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1102
  store i32 %9, i32* %retval, align 4, !dbg !1103
  br label %return, !dbg !1103

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1104
  ret i32 %10, !dbg !1104
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1105 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1108, metadata !DIExpression()), !dbg !1109
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1110, metadata !DIExpression()), !dbg !1111
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1112, metadata !DIExpression()), !dbg !1113
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1114, metadata !DIExpression()), !dbg !1115
  store i32 0, i32* %s32Temp1, align 4, !dbg !1115
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1116, metadata !DIExpression()), !dbg !1117
  store i32 0, i32* %s32Temp2, align 4, !dbg !1117
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1118, metadata !DIExpression()), !dbg !1119
  store i32 0, i32* %s32Temp3, align 4, !dbg !1119
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1120
  %conv = sext i16 %0 to i32, !dbg !1120
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1121
  %conv1 = sext i16 %1 to i32, !dbg !1121
  %mul = mul nsw i32 %conv, %conv1, !dbg !1122
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1123
  %2 = load i16, i16* %div.addr, align 2, !dbg !1124
  %conv2 = sext i16 %2 to i32, !dbg !1124
  %cmp = icmp eq i32 %conv2, 0, !dbg !1126
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1127

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1128
  %cmp4 = icmp slt i32 %3, 0, !dbg !1131
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1132

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1133
  br label %return, !dbg !1133

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1135
  br label %return, !dbg !1135

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1137
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1139
  %6 = load i16, i16* %div.addr, align 2, !dbg !1140
  %conv8 = sext i16 %6 to i32, !dbg !1140
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1141
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1141
  %div9 = sdiv i32 %5, %conv8, !dbg !1141, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1142
  %conv10 = sext i16 %7 to i32, !dbg !1142
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1143
  %sub = sub nsw i32 %4, %mul11, !dbg !1144
  %shl = shl i32 %sub, 1, !dbg !1145
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1146
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1147
  %9 = load i16, i16* %div.addr, align 2, !dbg !1148
  %conv12 = sext i16 %9 to i32, !dbg !1148
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1149
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1149
  %div13 = sdiv i32 %8, %conv12, !dbg !1149, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1150
  %11 = load i16, i16* %div.addr, align 2, !dbg !1151
  %conv14 = sext i16 %11 to i32, !dbg !1151
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1152
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1152
  %div15 = sdiv i32 %10, %conv14, !dbg !1152, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1153
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1154
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1155
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1157
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1158

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1159
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1162
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1163

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1164
  %conv22 = trunc i32 %14 to i16, !dbg !1166
  store i16 %conv22, i16* %retval, align 2, !dbg !1167
  br label %return, !dbg !1167

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1168
  br label %return, !dbg !1168

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1170
  br label %return, !dbg !1170

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1172
  ret i16 %15, !dbg !1172
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1173 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1176, metadata !DIExpression()), !dbg !1177
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1178, metadata !DIExpression()), !dbg !1179
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1180, metadata !DIExpression()), !dbg !1181
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1182, metadata !DIExpression()), !dbg !1183
  store i32 0, i32* %s32Result, align 4, !dbg !1183
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1184, metadata !DIExpression()), !dbg !1185
  store i32 0, i32* %s32Temp1, align 4, !dbg !1185
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1186
  %conv = sext i16 %0 to i32, !dbg !1186
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1187
  %conv1 = sext i16 %1 to i32, !dbg !1187
  %mul = mul nsw i32 %conv, %conv1, !dbg !1188
  store i32 %mul, i32* %s32Result, align 4, !dbg !1189
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1190
  %conv2 = zext i16 %2 to i32, !dbg !1190
  %cmp = icmp eq i32 %conv2, 0, !dbg !1192
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1193

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1194
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1197
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1198

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1199
  br label %return, !dbg !1199

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1201
  %cmp7 = icmp eq i32 %4, 0, !dbg !1203
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1204

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1205
  br label %return, !dbg !1205

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1207
  br label %return, !dbg !1207

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1209
  %6 = load i32, i32* %s32Result, align 4, !dbg !1211
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1212
  %conv12 = zext i16 %7 to i32, !dbg !1212
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1213
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1213
  %div = sdiv i32 %6, %conv12, !dbg !1213, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1214
  %conv13 = zext i16 %8 to i32, !dbg !1214
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1215
  %sub = sub nsw i32 %5, %mul14, !dbg !1216
  %shl = shl i32 %sub, 1, !dbg !1217
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1218
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1219
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1220
  %conv15 = zext i16 %10 to i32, !dbg !1220
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1221
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1221
  %div16 = sdiv i32 %9, %conv15, !dbg !1221, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1222
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1223
  %conv17 = zext i16 %12 to i32, !dbg !1223
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1224
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1224
  %div18 = sdiv i32 %11, %conv17, !dbg !1224, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1225
  store i32 %add, i32* %s32Result, align 4, !dbg !1226
  %13 = load i32, i32* %s32Result, align 4, !dbg !1227
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1229
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1230

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1231
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1234
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1235

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1236
  %conv25 = trunc i32 %15 to i16, !dbg !1238
  store i16 %conv25, i16* %retval, align 2, !dbg !1239
  br label %return, !dbg !1239

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1240
  br label %return, !dbg !1240

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1242
  br label %return, !dbg !1242

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1244
  ret i16 %16, !dbg !1244
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1245 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1248, metadata !DIExpression()), !dbg !1249
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1250, metadata !DIExpression()), !dbg !1251
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1252, metadata !DIExpression()), !dbg !1253
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1254
  %cmp = icmp eq i32 %0, 0, !dbg !1256
  br i1 %cmp, label %if.then, label %if.else, !dbg !1257

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1258
  br label %return, !dbg !1258

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1260
  %cmp1 = icmp sle i32 %1, 0, !dbg !1263
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1264

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1265
  br label %return, !dbg !1265

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1267
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1269
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1270
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1271
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1271
  %div = udiv i32 %3, %4, !dbg !1271, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1272
  %mul = mul i32 %div, %5, !dbg !1273
  %sub = sub i32 %2, %mul, !dbg !1274
  %shl = shl i32 %sub, 1, !dbg !1275
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1276
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1277
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1278
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1279
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1279
  %div4 = udiv i32 %6, %7, !dbg !1279, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1280
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1281
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1282
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1282
  %div5 = udiv i32 %8, %9, !dbg !1282, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1283
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1284
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1285
  store i32 %10, i32* %retval, align 4, !dbg !1286
  br label %return, !dbg !1286

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1287
  ret i32 %11, !dbg !1287
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1288 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1291, metadata !DIExpression()), !dbg !1292
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1293, metadata !DIExpression()), !dbg !1294
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1295, metadata !DIExpression()), !dbg !1296
  store i32 0, i32* %s32Temp1, align 4, !dbg !1296
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1297
  %cmp = icmp eq i32 %0, 0, !dbg !1299
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1300

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1301
  %cmp1 = icmp sge i32 %1, 0, !dbg !1304
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1305

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1306
  br label %return, !dbg !1306

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1308
  br label %return, !dbg !1308

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1310
  %cmp4 = icmp sge i32 %2, 0, !dbg !1313
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1314

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1315
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1317
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1318
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1319
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1319
  %div = udiv i32 %4, %5, !dbg !1319, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1320
  %mul = mul i32 %div, %6, !dbg !1321
  %sub = sub i32 %3, %mul, !dbg !1322
  %shl = shl i32 %sub, 1, !dbg !1323
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1324
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1325
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1326
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1327
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1327
  %div6 = udiv i32 %7, %8, !dbg !1327, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1328
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1329
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1330
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1330
  %div7 = udiv i32 %9, %10, !dbg !1330, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1331
  store i32 %add, i32* %retval, align 4, !dbg !1332
  br label %return, !dbg !1332

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1333
  br label %return, !dbg !1333

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1335
  ret i32 %11, !dbg !1335
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1336 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1339, metadata !DIExpression()), !dbg !1340
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1341, metadata !DIExpression()), !dbg !1342
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1343, metadata !DIExpression()), !dbg !1344
  store i32 0, i32* %u32Temp1, align 4, !dbg !1344
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1345, metadata !DIExpression()), !dbg !1346
  store i32 0, i32* %u32Temp2, align 4, !dbg !1346
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1347
  %cmp = icmp eq i32 %0, 0, !dbg !1349
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1350

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1351
  %cmp1 = icmp slt i32 %1, 0, !dbg !1354
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1355

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1356
  br label %return, !dbg !1356

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1358
  br label %return, !dbg !1358

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1360
  %cmp4 = icmp sge i32 %2, 0, !dbg !1363
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1364

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1365
  %cmp6 = icmp eq i32 %3, 0, !dbg !1368
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1369

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1370
  br label %return, !dbg !1370

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1372
  %cmp9 = icmp sle i32 %4, 0, !dbg !1375
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1376

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1377
  br label %return, !dbg !1377

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1379
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1381
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1382
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1383
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1383
  %div = sdiv i32 %6, %7, !dbg !1383, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1384
  %mul = mul nsw i32 %div, %8, !dbg !1385
  %sub = sub nsw i32 %5, %mul, !dbg !1386
  %shl = shl i32 %sub, 1, !dbg !1387
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1388
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1389
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1390
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1391
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1391
  %div12 = udiv i32 %9, %10, !dbg !1391, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1392
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1393
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1394
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1394
  %div13 = sdiv i32 %11, %12, !dbg !1394, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1395
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1396
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1397
  store i32 %13, i32* %retval, align 4, !dbg !1398
  br label %return, !dbg !1398

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1399
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1402
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1403

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1404
  br label %return, !dbg !1404

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1406
  %sub18 = sub nsw i32 0, %15, !dbg !1408
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1409
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1410
  %sub19 = sub nsw i32 0, %16, !dbg !1411
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1412
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1413
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1414
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1415
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1416
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1416
  %div20 = sdiv i32 %18, %19, !dbg !1416, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1417
  %mul21 = mul nsw i32 %div20, %20, !dbg !1418
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1419
  %shl23 = shl i32 %sub22, 1, !dbg !1420
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1421
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1422
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1423
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1424
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1424
  %div24 = udiv i32 %21, %22, !dbg !1424, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1425
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1426
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1427
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1427
  %div25 = sdiv i32 %23, %24, !dbg !1427, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1428
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1429
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1430
  store i32 %25, i32* %retval, align 4, !dbg !1431
  br label %return, !dbg !1431

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1432
  ret i32 %26, !dbg !1432
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1433 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1436, metadata !DIExpression()), !dbg !1437
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1438, metadata !DIExpression()), !dbg !1439
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1440, metadata !DIExpression()), !dbg !1441
  store i32 0, i32* %u32Temp1, align 4, !dbg !1441
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1442, metadata !DIExpression()), !dbg !1443
  store i32 0, i32* %u32Temp2, align 4, !dbg !1443
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1444, metadata !DIExpression()), !dbg !1445
  store i32 0, i32* %u32Temp3, align 4, !dbg !1445
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1446, metadata !DIExpression()), !dbg !1447
  store i32 0, i32* %numerator_old, align 4, !dbg !1447
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1448
  %cmp = icmp eq i32 %0, 0, !dbg !1450
  br i1 %cmp, label %if.then, label %if.else, !dbg !1451

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1452
  br label %return, !dbg !1452

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1454
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1456
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1457
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1458
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1459
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1459
  %div = udiv i32 %3, %4, !dbg !1459, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1460
  %sub = sub i32 %1, %mul, !dbg !1461
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1462
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1463
  %and = and i32 %5, 1, !dbg !1465
  %cmp1 = icmp eq i32 %and, 0, !dbg !1466
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1467

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1468
  %shr = lshr i32 %6, 1, !dbg !1470
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1471
  br label %if.end, !dbg !1472

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1473
  %shr4 = lshr i32 %7, 1, !dbg !1475
  %add = add i32 %shr4, 1, !dbg !1476
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1477
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1478
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1480
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1481
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1482

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1483
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1485
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1486
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1486
  %div7 = udiv i32 %10, %11, !dbg !1486, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1487
  br label %return, !dbg !1487

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1488
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1490
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1491
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1491
  %div9 = udiv i32 %12, %13, !dbg !1491, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1492
  store i32 %add10, i32* %retval, align 4, !dbg !1493
  br label %return, !dbg !1493

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1494
  ret i32 %14, !dbg !1494
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1495 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1498, metadata !DIExpression()), !dbg !1499
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1500, metadata !DIExpression()), !dbg !1501
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1502, metadata !DIExpression()), !dbg !1503
  store i32 0, i32* %u32Temp1, align 4, !dbg !1503
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1504, metadata !DIExpression()), !dbg !1505
  store i32 0, i32* %u32Temp2, align 4, !dbg !1505
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1506
  %cmp = icmp sle i32 %0, 0, !dbg !1508
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1509

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1510
  %cmp1 = icmp sge i32 %1, 0, !dbg !1513
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1514

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1515
  br label %return, !dbg !1515

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1517
  %sub = sub nsw i32 0, %2, !dbg !1519
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1520
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1521
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1522
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1523
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1524
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1524
  %div = udiv i32 %4, %5, !dbg !1524, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1525
  %mul = mul i32 %div, %6, !dbg !1526
  %sub3 = sub i32 %3, %mul, !dbg !1527
  %shl = shl i32 %sub3, 1, !dbg !1528
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1529
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1530
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1531
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1532
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1532
  %div4 = udiv i32 %7, %8, !dbg !1532, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1533
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1534
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1535
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1535
  %div5 = udiv i32 %9, %10, !dbg !1535, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1536
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1537
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1538
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1540
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1541

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1542
  %sub8 = sub i32 0, %12, !dbg !1544
  store i32 %sub8, i32* %retval, align 4, !dbg !1545
  br label %return, !dbg !1545

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1546
  br label %return, !dbg !1546

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1548
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1550
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1551
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1552
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1552
  %div11 = udiv i32 %14, %15, !dbg !1552, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1553
  %mul12 = mul i32 %div11, %16, !dbg !1554
  %sub13 = sub i32 %13, %mul12, !dbg !1555
  %shl14 = shl i32 %sub13, 1, !dbg !1556
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1557
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1558
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1559
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1560
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1560
  %div15 = udiv i32 %17, %18, !dbg !1560, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1561
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1562
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1563
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1563
  %div16 = udiv i32 %19, %20, !dbg !1563, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1564
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1565
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1566
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1568
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1569

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1570
  store i32 %22, i32* %retval, align 4, !dbg !1572
  br label %return, !dbg !1572

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1573
  br label %return, !dbg !1573

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1575
  ret i32 %23, !dbg !1575
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1576 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1579, metadata !DIExpression()), !dbg !1580
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1581, metadata !DIExpression()), !dbg !1582
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1583, metadata !DIExpression()), !dbg !1584
  store i32 0, i32* %s32Temp1, align 4, !dbg !1584
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1585, metadata !DIExpression()), !dbg !1586
  store i32 0, i32* %s32Temp2, align 4, !dbg !1586
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1587, metadata !DIExpression()), !dbg !1588
  store i32 0, i32* %u32Temp0, align 4, !dbg !1588
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1589, metadata !DIExpression()), !dbg !1590
  store i32 0, i32* %u32Temp1, align 4, !dbg !1590
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1591, metadata !DIExpression()), !dbg !1592
  store i32 0, i32* %u32Temp2, align 4, !dbg !1592
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1593
  %cmp = icmp eq i32 %0, 0, !dbg !1595
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1596

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1597
  %cmp1 = icmp slt i32 %1, 0, !dbg !1600
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1601

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1602
  br label %return, !dbg !1602

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1604
  br label %return, !dbg !1604

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1606
  %cmp4 = icmp sle i32 %2, 0, !dbg !1609
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1610

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1611
  %sub = sub nsw i32 0, %3, !dbg !1613
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1614
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1615
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1616
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1617
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1617
  %div = udiv i32 %4, %5, !dbg !1617, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1618
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1619
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1620
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1621
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1622
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1622
  %div6 = udiv i32 %7, %8, !dbg !1622, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1623
  %mul = mul i32 %div6, %9, !dbg !1624
  %sub7 = sub i32 %6, %mul, !dbg !1625
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1626
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1627
  %and = and i32 %10, 1, !dbg !1629
  %cmp8 = icmp eq i32 %and, 0, !dbg !1630
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1631

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1632
  %shr = lshr i32 %11, 1, !dbg !1634
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1635
  br label %if.end, !dbg !1636

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1637
  %shr11 = lshr i32 %12, 1, !dbg !1639
  %add = add i32 %shr11, 1, !dbg !1640
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1641
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1642
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1644
  %cmp12 = icmp ult i32 %13, %14, !dbg !1645
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1646

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1647
  %neg = xor i32 %15, -1, !dbg !1649
  %add14 = add i32 %neg, 1, !dbg !1650
  store i32 %add14, i32* %retval, align 4, !dbg !1651
  br label %return, !dbg !1651

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1652
  %add16 = add i32 %16, 1, !dbg !1654
  %neg17 = xor i32 %add16, -1, !dbg !1655
  %add18 = add i32 %neg17, 1, !dbg !1656
  store i32 %add18, i32* %retval, align 4, !dbg !1657
  br label %return, !dbg !1657

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1658
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1660
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1661
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1662
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1662
  %div20 = udiv i32 %18, %19, !dbg !1662, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1663
  %mul21 = mul i32 %div20, %20, !dbg !1664
  %sub22 = sub i32 %17, %mul21, !dbg !1665
  %shl = shl i32 %sub22, 1, !dbg !1666
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1667
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1668
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1669
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1670
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1670
  %div23 = udiv i32 %21, %22, !dbg !1670, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1671
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1672
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1673
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1673
  %div24 = udiv i32 %23, %24, !dbg !1673, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1674
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1675
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1676
  store i32 %25, i32* %retval, align 4, !dbg !1677
  br label %return, !dbg !1677

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1678
  ret i32 %26, !dbg !1678
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1679 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1682, metadata !DIExpression()), !dbg !1683
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1684, metadata !DIExpression()), !dbg !1685
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1686, metadata !DIExpression()), !dbg !1687
  store i32 0, i32* %s32Temp1, align 4, !dbg !1687
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1688, metadata !DIExpression()), !dbg !1689
  store i32 0, i32* %s32Temp2, align 4, !dbg !1689
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1690, metadata !DIExpression()), !dbg !1691
  store i32 0, i32* %denominator_prime, align 4, !dbg !1691
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1692, metadata !DIExpression()), !dbg !1693
  store i32 0, i32* %u32Temp1, align 4, !dbg !1693
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1694, metadata !DIExpression()), !dbg !1695
  store i32 0, i32* %u32Temp2, align 4, !dbg !1695
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1696, metadata !DIExpression()), !dbg !1697
  store i32 0, i32* %u32numerator, align 4, !dbg !1697
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1698, metadata !DIExpression()), !dbg !1699
  store i32 0, i32* %u32denominator, align 4, !dbg !1699
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1700
  %cmp = icmp slt i32 %0, 0, !dbg !1702
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1703

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1704
  %cmp1 = icmp sle i32 %1, 0, !dbg !1707
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1708

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1709
  %cmp3 = icmp sge i32 %2, 0, !dbg !1712
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1713

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1714
  br label %return, !dbg !1714

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1716
  %sub = sub nsw i32 0, %3, !dbg !1718
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1719
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1720
  %sub5 = sub nsw i32 0, %4, !dbg !1721
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1722
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1723
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1724
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1725
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1726
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1726
  %div = udiv i32 %6, %7, !dbg !1726, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1727
  %mul = mul i32 %div, %8, !dbg !1728
  %sub6 = sub i32 %5, %mul, !dbg !1729
  %shl = shl i32 %sub6, 1, !dbg !1730
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1731
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1732
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1733
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1734
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1734
  %div7 = udiv i32 %9, %10, !dbg !1734, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1735
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1736
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1737
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1737
  %div8 = udiv i32 %11, %12, !dbg !1737, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1738
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1739
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1740
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1742
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1743

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1744
  store i32 %14, i32* %retval, align 4, !dbg !1746
  br label %return, !dbg !1746

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1747
  br label %return, !dbg !1747

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1749
  %neg = xor i32 %15, -1, !dbg !1751
  %add13 = add nsw i32 %neg, 1, !dbg !1752
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1753
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1754
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1755
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1756
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1757
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1757
  %div14 = udiv i32 %17, %18, !dbg !1757, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1758
  %mul15 = mul i32 %div14, %19, !dbg !1759
  %sub16 = sub i32 %16, %mul15, !dbg !1760
  %shl17 = shl i32 %sub16, 1, !dbg !1761
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1762
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1763
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1764
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1765
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1765
  %div18 = udiv i32 %20, %21, !dbg !1765, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1766
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1767
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1768
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1768
  %div19 = sdiv i32 %22, %23, !dbg !1768, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1769
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1770
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1771
  %neg21 = xor i32 %24, -1, !dbg !1772
  %add22 = add nsw i32 %neg21, 1, !dbg !1773
  store i32 %add22, i32* %retval, align 4, !dbg !1774
  br label %return, !dbg !1774

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1775
  %cmp24 = icmp sle i32 %25, 0, !dbg !1778
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1779

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1780
  %cmp26 = icmp sge i32 %26, 0, !dbg !1783
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1784

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1785
  br label %return, !dbg !1785

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1787
  %neg29 = xor i32 %27, -1, !dbg !1789
  %add30 = add nsw i32 %neg29, 1, !dbg !1790
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1791
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1792
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1793
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1794
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1795
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1795
  %div31 = udiv i32 %29, %30, !dbg !1795, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1796
  %mul32 = mul i32 %div31, %31, !dbg !1797
  %sub33 = sub i32 %28, %mul32, !dbg !1798
  %shl34 = shl i32 %sub33, 1, !dbg !1799
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1800
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1801
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1802
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1803
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1803
  %div35 = udiv i32 %32, %33, !dbg !1803, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1804
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1805
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1806
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1806
  %div36 = udiv i32 %34, %35, !dbg !1806, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1807
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1808
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1809
  %neg38 = xor i32 %36, -1, !dbg !1810
  %add39 = add nsw i32 %neg38, 1, !dbg !1811
  store i32 %add39, i32* %retval, align 4, !dbg !1812
  br label %return, !dbg !1812

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1813
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1815
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1816
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1817
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1817
  %div41 = sdiv i32 %38, %39, !dbg !1817, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1818
  %mul42 = mul nsw i32 %div41, %40, !dbg !1819
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1820
  %shl44 = shl i32 %sub43, 1, !dbg !1821
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1822
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1823
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1824
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1825
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1825
  %div45 = sdiv i32 %41, %42, !dbg !1825, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1826
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1827
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1828
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1828
  %div46 = udiv i32 %43, %44, !dbg !1828, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1829
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1830
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1831
  store i32 %45, i32* %retval, align 4, !dbg !1832
  br label %return, !dbg !1832

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1833
  ret i32 %46, !dbg !1833
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1834 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1837, metadata !DIExpression()), !dbg !1838
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1839, metadata !DIExpression()), !dbg !1840
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1841, metadata !DIExpression()), !dbg !1842
  store i32 0, i32* %numerator_prime, align 4, !dbg !1842
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1843, metadata !DIExpression()), !dbg !1844
  store i32 0, i32* %u32Temp1, align 4, !dbg !1844
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1845, metadata !DIExpression()), !dbg !1846
  store i32 0, i32* %u32Temp2, align 4, !dbg !1846
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1847, metadata !DIExpression()), !dbg !1848
  store i32 0, i32* %u32Temp3, align 4, !dbg !1848
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1849, metadata !DIExpression()), !dbg !1850
  store i32 0, i32* %s32Temp1, align 4, !dbg !1850
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1851, metadata !DIExpression()), !dbg !1852
  store i32 0, i32* %s32Temp2, align 4, !dbg !1852
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1853, metadata !DIExpression()), !dbg !1854
  store i32 0, i32* %s32Temp3, align 4, !dbg !1854
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1855
  %cmp = icmp eq i32 %0, 0, !dbg !1857
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1858

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1859
  %cmp1 = icmp slt i32 %1, 0, !dbg !1862
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1863

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1864
  br label %return, !dbg !1864

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1866
  br label %return, !dbg !1866

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1868
  %cmp4 = icmp slt i32 %2, 0, !dbg !1871
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1872

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1873
  %sub = sub nsw i32 0, %3, !dbg !1875
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1876
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1877
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1878
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1879
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1879
  %div = udiv i32 %4, %5, !dbg !1879, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1880
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1881
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1882
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1883
  %mul = mul i32 %7, %8, !dbg !1884
  %sub6 = sub i32 %6, %mul, !dbg !1885
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1886
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1887
  %and = and i32 %9, 1, !dbg !1889
  %cmp7 = icmp eq i32 %and, 0, !dbg !1890
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1891

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1892
  %shr = lshr i32 %10, 1, !dbg !1894
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1895
  br label %if.end, !dbg !1896

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1897
  %shr10 = lshr i32 %11, 1, !dbg !1899
  %add = add i32 %shr10, 1, !dbg !1900
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1901
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1902
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1904
  %cmp11 = icmp ult i32 %12, %13, !dbg !1905
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1906

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1907
  %neg = xor i32 %14, -1, !dbg !1909
  %add13 = add i32 %neg, 1, !dbg !1910
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1911
  br label %if.end18, !dbg !1912

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1913
  %add15 = add i32 %15, 1, !dbg !1915
  %neg16 = xor i32 %add15, -1, !dbg !1916
  %add17 = add i32 %neg16, 1, !dbg !1917
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1918
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1919
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1921
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1922

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1923
  %conv = trunc i32 %17 to i16, !dbg !1925
  store i16 %conv, i16* %retval, align 2, !dbg !1926
  br label %return, !dbg !1926

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1927
  br label %return, !dbg !1927

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1929
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1931
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1932
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1932
  %div23 = udiv i32 %18, %19, !dbg !1932, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1933
  %mul24 = mul i32 %div23, %20, !dbg !1934
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1935
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1936
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1937
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1938
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1939
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1939
  %div25 = udiv i32 %22, %23, !dbg !1939, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1940
  %mul26 = mul i32 %div25, %24, !dbg !1941
  %sub27 = sub i32 %21, %mul26, !dbg !1942
  %shl = shl i32 %sub27, 1, !dbg !1943
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1944
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1945
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1946
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1947
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1947
  %div28 = udiv i32 %25, %26, !dbg !1947, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1948
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1949
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1950
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1950
  %div29 = udiv i32 %27, %28, !dbg !1950, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !1951
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1952
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1953
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1955
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1956

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1957
  %conv34 = trunc i32 %30 to i16, !dbg !1959
  store i16 %conv34, i16* %retval, align 2, !dbg !1960
  br label %return, !dbg !1960

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1961
  br label %return, !dbg !1961

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1963
  ret i16 %31, !dbg !1963
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1964 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1970, metadata !DIExpression()), !dbg !1971
  %2 = icmp eq i64 %0, 0, !dbg !1972
  br i1 %2, label %3, label %4, !dbg !1974

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1975
  unreachable, !dbg !1975

4:                                                ; preds = %1
  ret void, !dbg !1976
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !1977 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1983, metadata !DIExpression()), !dbg !1985
  call void @llvm.dbg.value(metadata i64 %1, metadata !1984, metadata !DIExpression()), !dbg !1985
  %3 = icmp ult i64 %1, %0, !dbg !1986
  br i1 %3, label %5, label %4, !dbg !1988

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !1989
  unreachable, !dbg !1989

5:                                                ; preds = %2
  ret void, !dbg !1991
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0057/div_Ccode_alarm_0057.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0057")
!4 = !{}
!5 = !{!6, !13, !16, !17, !21, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0057")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !9, line: 25, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !11, line: 39, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !15)
!15 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !18, line: 26, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !20)
!20 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !16)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !7, line: 6, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !18, line: 24, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 38, baseType: !27)
!27 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !7, line: 8, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !18, line: 25, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 40, baseType: !31)
!31 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!32 = !{!0}
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0057")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0057/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0057")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0057")
!50 = !DISubroutineType(types: !51)
!51 = !{!16}
!52 = !DILocalVariable(name: "numerator", scope: !48, file: !49, line: 9, type: !8)
!53 = !DILocation(line: 9, column: 13, scope: !48)
!54 = !DILocalVariable(name: "denominator", scope: !48, file: !49, line: 10, type: !29)
!55 = !DILocation(line: 10, column: 14, scope: !48)
!56 = !DILocalVariable(name: "result", scope: !48, file: !49, line: 11, type: !8)
!57 = !DILocation(line: 11, column: 13, scope: !48)
!58 = !DILocation(line: 13, column: 24, scope: !48)
!59 = !DILocation(line: 13, column: 5, scope: !48)
!60 = !DILocation(line: 14, column: 24, scope: !48)
!61 = !DILocation(line: 14, column: 5, scope: !48)
!62 = !DILocation(line: 16, column: 36, scope: !48)
!63 = !DILocation(line: 16, column: 47, scope: !48)
!64 = !DILocation(line: 16, column: 14, scope: !48)
!65 = !DILocation(line: 16, column: 12, scope: !48)
!66 = !DILocation(line: 18, column: 11, scope: !48)
!67 = !DILocation(line: 19, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !69, file: !69, line: 170, type: !70, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0057")
!70 = !DISubroutineType(types: !71)
!71 = !{!6, !6, !6}
!72 = !DILocalVariable(name: "numerator", arg: 1, scope: !68, file: !69, line: 170, type: !6)
!73 = !DILocation(line: 170, column: 31, scope: !68)
!74 = !DILocalVariable(name: "denominator", arg: 2, scope: !68, file: !69, line: 170, type: !6)
!75 = !DILocation(line: 170, column: 47, scope: !68)
!76 = !DILocalVariable(name: "s32Temp1", scope: !68, file: !69, line: 172, type: !21)
!77 = !DILocation(line: 172, column: 6, scope: !68)
!78 = !DILocalVariable(name: "s32Temp2", scope: !68, file: !69, line: 172, type: !21)
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
!188 = !{!6, !21, !6}
!189 = !DILocalVariable(name: "numerator", arg: 1, scope: !186, file: !69, line: 255, type: !21)
!190 = !DILocation(line: 255, column: 25, scope: !186)
!191 = !DILocalVariable(name: "denominator", arg: 2, scope: !186, file: !69, line: 255, type: !6)
!192 = !DILocation(line: 255, column: 41, scope: !186)
!193 = !DILocalVariable(name: "s32Temp1", scope: !186, file: !69, line: 257, type: !21)
!194 = !DILocation(line: 257, column: 6, scope: !186)
!195 = !DILocalVariable(name: "s32Temp2", scope: !186, file: !69, line: 257, type: !21)
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
!301 = !{!6, !6, !28}
!302 = !DILocalVariable(name: "numerator", arg: 1, scope: !299, file: !69, line: 343, type: !6)
!303 = !DILocation(line: 343, column: 31, scope: !299)
!304 = !DILocalVariable(name: "denominator", arg: 2, scope: !299, file: !69, line: 343, type: !28)
!305 = !DILocation(line: 343, column: 47, scope: !299)
!306 = !DILocalVariable(name: "u16Temp1", scope: !299, file: !69, line: 345, type: !28)
!307 = !DILocation(line: 345, column: 6, scope: !299)
!308 = !DILocalVariable(name: "s32Temp1", scope: !299, file: !69, line: 346, type: !21)
!309 = !DILocation(line: 346, column: 6, scope: !299)
!310 = !DILocalVariable(name: "s32Temp2", scope: !299, file: !69, line: 346, type: !21)
!311 = !DILocation(line: 346, column: 15, scope: !299)
!312 = !DILocation(line: 347, column: 13, scope: !299)
!313 = !DILocation(line: 347, column: 25, scope: !299)
!314 = !DILocation(line: 347, column: 11, scope: !299)
!315 = !DILocation(line: 349, column: 61, scope: !316)
!316 = distinct !DILexicalBlock(scope: !299, file: !69, line: 349, column: 6)
!317 = !DILocation(line: 349, column: 56, scope: !316)
!318 = !DILocation(line: 349, column: 46, scope: !316)
!319 = !DILocation(line: 349, column: 8, scope: !316)
!320 = !DILocation(line: 349, column: 6, scope: !299)
!321 = !DILocation(line: 350, column: 6, scope: !322)
!322 = distinct !DILexicalBlock(scope: !316, file: !69, line: 349, column: 75)
!323 = !DILocation(line: 352, column: 13, scope: !299)
!324 = !DILocation(line: 352, column: 22, scope: !299)
!325 = !DILocation(line: 352, column: 11, scope: !299)
!326 = !DILocation(line: 353, column: 5, scope: !327)
!327 = distinct !DILexicalBlock(scope: !299, file: !69, line: 353, column: 5)
!328 = !DILocation(line: 353, column: 14, scope: !327)
!329 = !DILocation(line: 353, column: 5, scope: !299)
!330 = !DILocation(line: 355, column: 7, scope: !331)
!331 = distinct !DILexicalBlock(scope: !332, file: !69, line: 355, column: 7)
!332 = distinct !DILexicalBlock(scope: !327, file: !69, line: 354, column: 2)
!333 = !DILocation(line: 355, column: 17, scope: !331)
!334 = !DILocation(line: 355, column: 7, scope: !332)
!335 = !DILocation(line: 357, column: 4, scope: !336)
!336 = distinct !DILexicalBlock(scope: !331, file: !69, line: 356, column: 3)
!337 = !DILocation(line: 361, column: 4, scope: !338)
!338 = distinct !DILexicalBlock(scope: !331, file: !69, line: 360, column: 3)
!339 = !DILocation(line: 367, column: 61, scope: !340)
!340 = distinct !DILexicalBlock(scope: !341, file: !69, line: 367, column: 7)
!341 = distinct !DILexicalBlock(scope: !327, file: !69, line: 365, column: 2)
!342 = !DILocation(line: 367, column: 56, scope: !340)
!343 = !DILocation(line: 367, column: 71, scope: !340)
!344 = !DILocation(line: 367, column: 85, scope: !340)
!345 = !DILocation(line: 367, column: 80, scope: !340)
!346 = !DILocation(line: 367, column: 78, scope: !340)
!347 = !DILocation(line: 367, column: 34, scope: !340)
!348 = !DILocation(line: 367, column: 112, scope: !340)
!349 = !DILocation(line: 367, column: 107, scope: !340)
!350 = !DILocation(line: 367, column: 97, scope: !340)
!351 = !DILocation(line: 367, column: 9, scope: !340)
!352 = !DILocation(line: 367, column: 7, scope: !341)
!353 = !DILocation(line: 368, column: 7, scope: !354)
!354 = distinct !DILexicalBlock(scope: !340, file: !69, line: 367, column: 125)
!355 = !DILocation(line: 370, column: 15, scope: !341)
!356 = !DILocation(line: 370, column: 24, scope: !341)
!357 = !DILocation(line: 370, column: 32, scope: !341)
!358 = !DILocation(line: 370, column: 41, scope: !341)
!359 = !DILocation(line: 370, column: 47, scope: !341)
!360 = !DILocation(line: 370, column: 46, scope: !341)
!361 = !DILocation(line: 370, column: 57, scope: !341)
!362 = !DILocation(line: 370, column: 56, scope: !341)
!363 = !DILocation(line: 370, column: 29, scope: !341)
!364 = !DILocation(line: 370, column: 12, scope: !341)
!365 = !DILocation(line: 372, column: 57, scope: !366)
!366 = distinct !DILexicalBlock(scope: !341, file: !69, line: 372, column: 7)
!367 = !DILocation(line: 372, column: 47, scope: !366)
!368 = !DILocation(line: 372, column: 9, scope: !366)
!369 = !DILocation(line: 372, column: 7, scope: !341)
!370 = !DILocation(line: 373, column: 7, scope: !371)
!371 = distinct !DILexicalBlock(scope: !366, file: !69, line: 372, column: 70)
!372 = !DILocation(line: 376, column: 47, scope: !373)
!373 = distinct !DILexicalBlock(scope: !341, file: !69, line: 376, column: 7)
!374 = !DILocation(line: 376, column: 37, scope: !373)
!375 = !DILocation(line: 376, column: 9, scope: !373)
!376 = !DILocation(line: 376, column: 7, scope: !341)
!377 = !DILocation(line: 377, column: 7, scope: !378)
!378 = distinct !DILexicalBlock(scope: !373, file: !69, line: 376, column: 75)
!379 = !DILocation(line: 379, column: 14, scope: !341)
!380 = !DILocation(line: 379, column: 22, scope: !341)
!381 = !DILocation(line: 379, column: 12, scope: !341)
!382 = !DILocation(line: 380, column: 14, scope: !341)
!383 = !DILocation(line: 380, column: 23, scope: !341)
!384 = !DILocation(line: 380, column: 22, scope: !341)
!385 = !DILocation(line: 380, column: 12, scope: !341)
!386 = !DILocation(line: 382, column: 67, scope: !387)
!387 = distinct !DILexicalBlock(scope: !341, file: !69, line: 382, column: 7)
!388 = !DILocation(line: 382, column: 62, scope: !387)
!389 = !DILocation(line: 382, column: 77, scope: !387)
!390 = !DILocation(line: 382, column: 91, scope: !387)
!391 = !DILocation(line: 382, column: 86, scope: !387)
!392 = !DILocation(line: 382, column: 84, scope: !387)
!393 = !DILocation(line: 382, column: 34, scope: !387)
!394 = !DILocation(line: 382, column: 114, scope: !387)
!395 = !DILocation(line: 382, column: 104, scope: !387)
!396 = !DILocation(line: 382, column: 9, scope: !387)
!397 = !DILocation(line: 382, column: 7, scope: !341)
!398 = !DILocation(line: 383, column: 7, scope: !399)
!399 = distinct !DILexicalBlock(scope: !387, file: !69, line: 382, column: 127)
!400 = !DILocation(line: 390, column: 58, scope: !341)
!401 = !DILocation(line: 390, column: 53, scope: !341)
!402 = !DILocation(line: 390, column: 68, scope: !341)
!403 = !DILocation(line: 390, column: 82, scope: !341)
!404 = !DILocation(line: 390, column: 77, scope: !341)
!405 = !DILocation(line: 390, column: 75, scope: !341)
!406 = !DILocation(line: 390, column: 95, scope: !341)
!407 = !DILocation(line: 390, column: 93, scope: !341)
!408 = !DILocation(line: 390, column: 25, scope: !341)
!409 = !DILocation(line: 390, column: 23, scope: !341)
!410 = !DILocation(line: 391, column: 3, scope: !341)
!411 = !DILocation(line: 408, column: 1, scope: !299)
!412 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !413, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!413 = !DISubroutineType(types: !414)
!414 = !{!16, !13}
!415 = !DILocalVariable(name: "left", arg: 1, scope: !412, file: !33, line: 84, type: !13)
!416 = !DILocation(line: 84, column: 51, scope: !412)
!417 = !DILocation(line: 86, column: 12, scope: !412)
!418 = !DILocation(line: 86, column: 17, scope: !412)
!419 = !DILocation(line: 86, column: 5, scope: !412)
!420 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !421, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!421 = !DISubroutineType(types: !422)
!422 = !{!16, !13, !13}
!423 = !DILocalVariable(name: "left", arg: 1, scope: !420, file: !33, line: 78, type: !13)
!424 = !DILocation(line: 78, column: 38, scope: !420)
!425 = !DILocalVariable(name: "right", arg: 2, scope: !420, file: !33, line: 78, type: !13)
!426 = !DILocation(line: 78, column: 52, scope: !420)
!427 = !DILocation(line: 80, column: 12, scope: !420)
!428 = !DILocation(line: 80, column: 19, scope: !420)
!429 = !DILocation(line: 80, column: 17, scope: !420)
!430 = !DILocation(line: 80, column: 25, scope: !420)
!431 = !DILocation(line: 80, column: 5, scope: !420)
!432 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !433, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!433 = !DISubroutineType(types: !434)
!434 = !{!16, !13, !17}
!435 = !DILocalVariable(name: "left", arg: 1, scope: !432, file: !33, line: 90, type: !13)
!436 = !DILocation(line: 90, column: 41, scope: !432)
!437 = !DILocalVariable(name: "count", arg: 2, scope: !432, file: !33, line: 90, type: !17)
!438 = !DILocation(line: 90, column: 56, scope: !432)
!439 = !DILocation(line: 92, column: 9, scope: !440)
!440 = distinct !DILexicalBlock(scope: !432, file: !33, line: 92, column: 9)
!441 = !DILocation(line: 92, column: 15, scope: !440)
!442 = !DILocation(line: 92, column: 9, scope: !432)
!443 = !DILocation(line: 93, column: 9, scope: !444)
!444 = distinct !DILexicalBlock(scope: !440, file: !33, line: 92, column: 32)
!445 = !DILocation(line: 95, column: 12, scope: !432)
!446 = !DILocation(line: 95, column: 34, scope: !432)
!447 = !DILocation(line: 95, column: 31, scope: !432)
!448 = !DILocation(line: 95, column: 17, scope: !432)
!449 = !DILocation(line: 95, column: 41, scope: !432)
!450 = !DILocation(line: 95, column: 5, scope: !432)
!451 = !DILocation(line: 96, column: 1, scope: !432)
!452 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !421, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!453 = !DILocalVariable(name: "left", arg: 1, scope: !452, file: !33, line: 54, type: !13)
!454 = !DILocation(line: 54, column: 38, scope: !452)
!455 = !DILocalVariable(name: "right", arg: 2, scope: !452, file: !33, line: 54, type: !13)
!456 = !DILocation(line: 54, column: 52, scope: !452)
!457 = !DILocation(line: 56, column: 12, scope: !452)
!458 = !DILocation(line: 56, column: 19, scope: !452)
!459 = !DILocation(line: 56, column: 17, scope: !452)
!460 = !DILocation(line: 56, column: 25, scope: !452)
!461 = !DILocation(line: 56, column: 5, scope: !452)
!462 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 425, type: !300, scopeLine: 426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!463 = !DILocalVariable(name: "numerator", arg: 1, scope: !462, file: !69, line: 425, type: !6)
!464 = !DILocation(line: 425, column: 30, scope: !462)
!465 = !DILocalVariable(name: "denominator", arg: 2, scope: !462, file: !69, line: 425, type: !28)
!466 = !DILocation(line: 425, column: 45, scope: !462)
!467 = !DILocalVariable(name: "u16Temp1", scope: !462, file: !69, line: 427, type: !28)
!468 = !DILocation(line: 427, column: 6, scope: !462)
!469 = !DILocalVariable(name: "s32Temp1", scope: !462, file: !69, line: 428, type: !21)
!470 = !DILocation(line: 428, column: 6, scope: !462)
!471 = !DILocation(line: 429, column: 13, scope: !462)
!472 = !DILocation(line: 429, column: 25, scope: !462)
!473 = !DILocation(line: 429, column: 11, scope: !462)
!474 = !DILocation(line: 430, column: 5, scope: !475)
!475 = distinct !DILexicalBlock(scope: !462, file: !69, line: 430, column: 5)
!476 = !DILocation(line: 430, column: 13, scope: !475)
!477 = !DILocation(line: 430, column: 5, scope: !462)
!478 = !DILocation(line: 432, column: 6, scope: !479)
!479 = distinct !DILexicalBlock(scope: !480, file: !69, line: 432, column: 6)
!480 = distinct !DILexicalBlock(scope: !475, file: !69, line: 431, column: 2)
!481 = !DILocation(line: 432, column: 15, scope: !479)
!482 = !DILocation(line: 432, column: 6, scope: !480)
!483 = !DILocation(line: 434, column: 4, scope: !484)
!484 = distinct !DILexicalBlock(scope: !479, file: !69, line: 433, column: 3)
!485 = !DILocation(line: 438, column: 4, scope: !486)
!486 = distinct !DILexicalBlock(scope: !479, file: !69, line: 437, column: 3)
!487 = !DILocation(line: 444, column: 15, scope: !488)
!488 = distinct !DILexicalBlock(scope: !475, file: !69, line: 443, column: 2)
!489 = !DILocation(line: 444, column: 27, scope: !488)
!490 = !DILocation(line: 444, column: 37, scope: !488)
!491 = !DILocation(line: 444, column: 36, scope: !488)
!492 = !DILocation(line: 444, column: 49, scope: !488)
!493 = !DILocation(line: 444, column: 47, scope: !488)
!494 = !DILocation(line: 444, column: 25, scope: !488)
!495 = !DILocation(line: 444, column: 59, scope: !488)
!496 = !DILocation(line: 444, column: 12, scope: !488)
!497 = !DILocation(line: 445, column: 15, scope: !488)
!498 = !DILocation(line: 445, column: 24, scope: !488)
!499 = !DILocation(line: 445, column: 23, scope: !488)
!500 = !DILocation(line: 445, column: 37, scope: !488)
!501 = !DILocation(line: 445, column: 47, scope: !488)
!502 = !DILocation(line: 445, column: 46, scope: !488)
!503 = !DILocation(line: 445, column: 34, scope: !488)
!504 = !DILocation(line: 445, column: 12, scope: !488)
!505 = !DILocation(line: 446, column: 10, scope: !488)
!506 = !DILocation(line: 446, column: 3, scope: !488)
!507 = !DILocation(line: 448, column: 1, scope: !462)
!508 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 466, type: !509, scopeLine: 467, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!509 = !DISubroutineType(types: !510)
!510 = !{!24, !28, !28}
!511 = !DILocalVariable(name: "numerator", arg: 1, scope: !508, file: !69, line: 466, type: !28)
!512 = !DILocation(line: 466, column: 28, scope: !508)
!513 = !DILocalVariable(name: "denominator", arg: 2, scope: !508, file: !69, line: 466, type: !28)
!514 = !DILocation(line: 466, column: 43, scope: !508)
!515 = !DILocalVariable(name: "u32Temp1", scope: !508, file: !69, line: 468, type: !516)
!516 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !17)
!517 = !DILocation(line: 468, column: 6, scope: !508)
!518 = !DILocalVariable(name: "u32Temp2", scope: !508, file: !69, line: 468, type: !516)
!519 = !DILocation(line: 468, column: 20, scope: !508)
!520 = !DILocalVariable(name: "u32Temp3", scope: !508, file: !69, line: 468, type: !516)
!521 = !DILocation(line: 468, column: 33, scope: !508)
!522 = !DILocation(line: 469, column: 5, scope: !523)
!523 = distinct !DILexicalBlock(scope: !508, file: !69, line: 469, column: 5)
!524 = !DILocation(line: 469, column: 16, scope: !523)
!525 = !DILocation(line: 469, column: 5, scope: !508)
!526 = !DILocation(line: 471, column: 3, scope: !527)
!527 = distinct !DILexicalBlock(scope: !523, file: !69, line: 470, column: 2)
!528 = !DILocation(line: 475, column: 15, scope: !529)
!529 = distinct !DILexicalBlock(scope: !523, file: !69, line: 474, column: 2)
!530 = !DILocation(line: 475, column: 24, scope: !529)
!531 = !DILocation(line: 475, column: 12, scope: !529)
!532 = !DILocation(line: 476, column: 14, scope: !529)
!533 = !DILocation(line: 476, column: 25, scope: !529)
!534 = !DILocation(line: 476, column: 23, scope: !529)
!535 = !DILocation(line: 476, column: 12, scope: !529)
!536 = !DILocation(line: 477, column: 15, scope: !529)
!537 = !DILocation(line: 477, column: 24, scope: !529)
!538 = !DILocation(line: 477, column: 32, scope: !529)
!539 = !DILocation(line: 477, column: 12, scope: !529)
!540 = !DILocation(line: 478, column: 6, scope: !541)
!541 = distinct !DILexicalBlock(scope: !529, file: !69, line: 478, column: 6)
!542 = !DILocation(line: 478, column: 15, scope: !541)
!543 = !DILocation(line: 478, column: 6, scope: !529)
!544 = !DILocation(line: 480, column: 15, scope: !545)
!545 = distinct !DILexicalBlock(scope: !541, file: !69, line: 479, column: 3)
!546 = !DILocation(line: 480, column: 11, scope: !545)
!547 = !DILocation(line: 480, column: 4, scope: !545)
!548 = !DILocation(line: 484, column: 4, scope: !549)
!549 = distinct !DILexicalBlock(scope: !541, file: !69, line: 483, column: 3)
!550 = !DILocation(line: 487, column: 1, scope: !508)
!551 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 504, type: !552, scopeLine: 505, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!552 = !DISubroutineType(types: !553)
!553 = !{!28, !21, !28}
!554 = !DILocalVariable(name: "x_value", arg: 1, scope: !551, file: !69, line: 504, type: !21)
!555 = !DILocation(line: 504, column: 25, scope: !551)
!556 = !DILocalVariable(name: "y_value", arg: 2, scope: !551, file: !69, line: 504, type: !28)
!557 = !DILocation(line: 504, column: 38, scope: !551)
!558 = !DILocalVariable(name: "s32Temp1", scope: !551, file: !69, line: 506, type: !21)
!559 = !DILocation(line: 506, column: 6, scope: !551)
!560 = !DILocation(line: 507, column: 12, scope: !551)
!561 = !DILocation(line: 507, column: 20, scope: !551)
!562 = !DILocation(line: 507, column: 10, scope: !551)
!563 = !DILocation(line: 508, column: 6, scope: !564)
!564 = distinct !DILexicalBlock(scope: !551, file: !69, line: 508, column: 5)
!565 = !DILocation(line: 508, column: 14, scope: !564)
!566 = !DILocation(line: 508, column: 24, scope: !564)
!567 = !DILocation(line: 508, column: 5, scope: !551)
!568 = !DILocation(line: 510, column: 6, scope: !569)
!569 = distinct !DILexicalBlock(scope: !570, file: !69, line: 510, column: 6)
!570 = distinct !DILexicalBlock(scope: !564, file: !69, line: 509, column: 2)
!571 = !DILocation(line: 510, column: 14, scope: !569)
!572 = !DILocation(line: 510, column: 6, scope: !570)
!573 = !DILocation(line: 512, column: 4, scope: !574)
!574 = distinct !DILexicalBlock(scope: !569, file: !69, line: 511, column: 3)
!575 = !DILocation(line: 516, column: 4, scope: !576)
!576 = distinct !DILexicalBlock(scope: !569, file: !69, line: 515, column: 3)
!577 = !DILocation(line: 521, column: 15, scope: !578)
!578 = distinct !DILexicalBlock(scope: !564, file: !69, line: 520, column: 2)
!579 = !DILocation(line: 521, column: 27, scope: !578)
!580 = !DILocation(line: 521, column: 35, scope: !578)
!581 = !DILocation(line: 521, column: 34, scope: !578)
!582 = !DILocation(line: 521, column: 46, scope: !578)
!583 = !DILocation(line: 521, column: 44, scope: !578)
!584 = !DILocation(line: 521, column: 23, scope: !578)
!585 = !DILocation(line: 521, column: 56, scope: !578)
!586 = !DILocation(line: 521, column: 12, scope: !578)
!587 = !DILocation(line: 522, column: 15, scope: !578)
!588 = !DILocation(line: 522, column: 24, scope: !578)
!589 = !DILocation(line: 522, column: 23, scope: !578)
!590 = !DILocation(line: 522, column: 36, scope: !578)
!591 = !DILocation(line: 522, column: 44, scope: !578)
!592 = !DILocation(line: 522, column: 43, scope: !578)
!593 = !DILocation(line: 522, column: 33, scope: !578)
!594 = !DILocation(line: 522, column: 12, scope: !578)
!595 = !DILocation(line: 523, column: 6, scope: !596)
!596 = distinct !DILexicalBlock(scope: !578, file: !69, line: 523, column: 6)
!597 = !DILocation(line: 523, column: 15, scope: !596)
!598 = !DILocation(line: 523, column: 6, scope: !578)
!599 = !DILocation(line: 525, column: 7, scope: !600)
!600 = distinct !DILexicalBlock(scope: !601, file: !69, line: 525, column: 7)
!601 = distinct !DILexicalBlock(scope: !596, file: !69, line: 524, column: 3)
!602 = !DILocation(line: 525, column: 16, scope: !600)
!603 = !DILocation(line: 525, column: 7, scope: !601)
!604 = !DILocation(line: 527, column: 17, scope: !605)
!605 = distinct !DILexicalBlock(scope: !600, file: !69, line: 526, column: 4)
!606 = !DILocation(line: 527, column: 12, scope: !605)
!607 = !DILocation(line: 527, column: 5, scope: !605)
!608 = !DILocation(line: 531, column: 5, scope: !609)
!609 = distinct !DILexicalBlock(scope: !600, file: !69, line: 530, column: 4)
!610 = !DILocation(line: 536, column: 4, scope: !611)
!611 = distinct !DILexicalBlock(scope: !596, file: !69, line: 535, column: 3)
!612 = !DILocation(line: 539, column: 1, scope: !551)
!613 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 557, type: !614, scopeLine: 558, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!614 = !DISubroutineType(types: !615)
!615 = !{!28, !28, !28}
!616 = !DILocalVariable(name: "numerator", arg: 1, scope: !613, file: !69, line: 557, type: !28)
!617 = !DILocation(line: 557, column: 31, scope: !613)
!618 = !DILocalVariable(name: "denominator", arg: 2, scope: !613, file: !69, line: 557, type: !28)
!619 = !DILocation(line: 557, column: 46, scope: !613)
!620 = !DILocalVariable(name: "u32Temp", scope: !613, file: !69, line: 559, type: !516)
!621 = !DILocation(line: 559, column: 6, scope: !613)
!622 = !DILocation(line: 560, column: 5, scope: !623)
!623 = distinct !DILexicalBlock(scope: !613, file: !69, line: 560, column: 5)
!624 = !DILocation(line: 560, column: 17, scope: !623)
!625 = !DILocation(line: 560, column: 5, scope: !613)
!626 = !DILocation(line: 562, column: 3, scope: !627)
!627 = distinct !DILexicalBlock(scope: !623, file: !69, line: 561, column: 2)
!628 = !DILocation(line: 566, column: 14, scope: !629)
!629 = distinct !DILexicalBlock(scope: !623, file: !69, line: 565, column: 2)
!630 = !DILocation(line: 566, column: 23, scope: !629)
!631 = !DILocation(line: 566, column: 32, scope: !629)
!632 = !DILocation(line: 566, column: 44, scope: !629)
!633 = !DILocation(line: 566, column: 29, scope: !629)
!634 = !DILocation(line: 566, column: 11, scope: !629)
!635 = !DILocation(line: 567, column: 13, scope: !629)
!636 = !DILocation(line: 567, column: 21, scope: !629)
!637 = !DILocation(line: 567, column: 20, scope: !629)
!638 = !DILocation(line: 567, column: 11, scope: !629)
!639 = !DILocation(line: 568, column: 6, scope: !640)
!640 = distinct !DILexicalBlock(scope: !629, file: !69, line: 568, column: 6)
!641 = !DILocation(line: 568, column: 14, scope: !640)
!642 = !DILocation(line: 568, column: 6, scope: !629)
!643 = !DILocation(line: 570, column: 11, scope: !644)
!644 = distinct !DILexicalBlock(scope: !640, file: !69, line: 569, column: 3)
!645 = !DILocation(line: 570, column: 19, scope: !644)
!646 = !DILocation(line: 570, column: 4, scope: !644)
!647 = !DILocation(line: 574, column: 4, scope: !648)
!648 = distinct !DILexicalBlock(scope: !640, file: !69, line: 573, column: 3)
!649 = !DILocation(line: 578, column: 1, scope: !613)
!650 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 595, type: !651, scopeLine: 596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!651 = !DISubroutineType(types: !652)
!652 = !{!28, !516, !28}
!653 = !DILocalVariable(name: "x_value", arg: 1, scope: !650, file: !69, line: 595, type: !516)
!654 = !DILocation(line: 595, column: 25, scope: !650)
!655 = !DILocalVariable(name: "y_value", arg: 2, scope: !650, file: !69, line: 595, type: !28)
!656 = !DILocation(line: 595, column: 38, scope: !650)
!657 = !DILocalVariable(name: "u32Temp1", scope: !650, file: !69, line: 597, type: !516)
!658 = !DILocation(line: 597, column: 6, scope: !650)
!659 = !DILocalVariable(name: "u32Temp2", scope: !650, file: !69, line: 597, type: !516)
!660 = !DILocation(line: 597, column: 17, scope: !650)
!661 = !DILocation(line: 598, column: 12, scope: !650)
!662 = !DILocation(line: 598, column: 20, scope: !650)
!663 = !DILocation(line: 598, column: 10, scope: !650)
!664 = !DILocation(line: 599, column: 5, scope: !665)
!665 = distinct !DILexicalBlock(scope: !650, file: !69, line: 599, column: 5)
!666 = !DILocation(line: 599, column: 13, scope: !665)
!667 = !DILocation(line: 599, column: 5, scope: !650)
!668 = !DILocation(line: 601, column: 3, scope: !669)
!669 = distinct !DILexicalBlock(scope: !665, file: !69, line: 600, column: 2)
!670 = !DILocation(line: 605, column: 14, scope: !671)
!671 = distinct !DILexicalBlock(scope: !665, file: !69, line: 604, column: 2)
!672 = !DILocation(line: 605, column: 22, scope: !671)
!673 = !DILocation(line: 605, column: 21, scope: !671)
!674 = !DILocation(line: 605, column: 12, scope: !671)
!675 = !DILocation(line: 606, column: 14, scope: !671)
!676 = !DILocation(line: 606, column: 25, scope: !671)
!677 = !DILocation(line: 606, column: 36, scope: !671)
!678 = !DILocation(line: 606, column: 34, scope: !671)
!679 = !DILocation(line: 606, column: 22, scope: !671)
!680 = !DILocation(line: 606, column: 45, scope: !671)
!681 = !DILocation(line: 606, column: 12, scope: !671)
!682 = !DILocation(line: 607, column: 15, scope: !671)
!683 = !DILocation(line: 607, column: 24, scope: !671)
!684 = !DILocation(line: 607, column: 23, scope: !671)
!685 = !DILocation(line: 607, column: 36, scope: !671)
!686 = !DILocation(line: 607, column: 44, scope: !671)
!687 = !DILocation(line: 607, column: 43, scope: !671)
!688 = !DILocation(line: 607, column: 33, scope: !671)
!689 = !DILocation(line: 607, column: 12, scope: !671)
!690 = !DILocation(line: 608, column: 6, scope: !691)
!691 = distinct !DILexicalBlock(scope: !671, file: !69, line: 608, column: 6)
!692 = !DILocation(line: 608, column: 15, scope: !691)
!693 = !DILocation(line: 608, column: 6, scope: !671)
!694 = !DILocation(line: 610, column: 11, scope: !695)
!695 = distinct !DILexicalBlock(scope: !691, file: !69, line: 609, column: 3)
!696 = !DILocation(line: 610, column: 20, scope: !695)
!697 = !DILocation(line: 610, column: 4, scope: !695)
!698 = !DILocation(line: 614, column: 4, scope: !699)
!699 = distinct !DILexicalBlock(scope: !691, file: !69, line: 613, column: 3)
!700 = !DILocation(line: 618, column: 1, scope: !650)
!701 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 637, type: !702, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!702 = !DISubroutineType(types: !703)
!703 = !{!6, !6, !28, !6}
!704 = !DILocalVariable(name: "factor1", arg: 1, scope: !701, file: !69, line: 637, type: !6)
!705 = !DILocation(line: 637, column: 33, scope: !701)
!706 = !DILocalVariable(name: "factor2", arg: 2, scope: !701, file: !69, line: 637, type: !28)
!707 = !DILocation(line: 637, column: 46, scope: !701)
!708 = !DILocalVariable(name: "denominator", arg: 3, scope: !701, file: !69, line: 637, type: !6)
!709 = !DILocation(line: 637, column: 59, scope: !701)
!710 = !DILocalVariable(name: "s32Result", scope: !701, file: !69, line: 639, type: !21)
!711 = !DILocation(line: 639, column: 6, scope: !701)
!712 = !DILocalVariable(name: "s32Temp1", scope: !701, file: !69, line: 639, type: !21)
!713 = !DILocation(line: 639, column: 21, scope: !701)
!714 = !DILocation(line: 640, column: 14, scope: !701)
!715 = !DILocation(line: 640, column: 24, scope: !701)
!716 = !DILocation(line: 640, column: 22, scope: !701)
!717 = !DILocation(line: 640, column: 12, scope: !701)
!718 = !DILocation(line: 641, column: 5, scope: !719)
!719 = distinct !DILexicalBlock(scope: !701, file: !69, line: 641, column: 5)
!720 = !DILocation(line: 641, column: 17, scope: !719)
!721 = !DILocation(line: 641, column: 5, scope: !701)
!722 = !DILocation(line: 643, column: 6, scope: !723)
!723 = distinct !DILexicalBlock(scope: !724, file: !69, line: 643, column: 6)
!724 = distinct !DILexicalBlock(scope: !719, file: !69, line: 642, column: 2)
!725 = !DILocation(line: 643, column: 16, scope: !723)
!726 = !DILocation(line: 643, column: 6, scope: !724)
!727 = !DILocation(line: 645, column: 4, scope: !728)
!728 = distinct !DILexicalBlock(scope: !723, file: !69, line: 644, column: 3)
!729 = !DILocation(line: 649, column: 4, scope: !730)
!730 = distinct !DILexicalBlock(scope: !723, file: !69, line: 648, column: 3)
!731 = !DILocation(line: 654, column: 14, scope: !732)
!732 = distinct !DILexicalBlock(scope: !719, file: !69, line: 653, column: 2)
!733 = !DILocation(line: 654, column: 27, scope: !732)
!734 = !DILocation(line: 654, column: 37, scope: !732)
!735 = !DILocation(line: 654, column: 36, scope: !732)
!736 = !DILocation(line: 654, column: 50, scope: !732)
!737 = !DILocation(line: 654, column: 49, scope: !732)
!738 = !DILocation(line: 654, column: 24, scope: !732)
!739 = !DILocation(line: 654, column: 12, scope: !732)
!740 = !DILocation(line: 655, column: 14, scope: !732)
!741 = !DILocation(line: 655, column: 23, scope: !732)
!742 = !DILocation(line: 655, column: 12, scope: !732)
!743 = !DILocation(line: 656, column: 16, scope: !732)
!744 = !DILocation(line: 656, column: 25, scope: !732)
!745 = !DILocation(line: 656, column: 24, scope: !732)
!746 = !DILocation(line: 656, column: 41, scope: !732)
!747 = !DILocation(line: 656, column: 51, scope: !732)
!748 = !DILocation(line: 656, column: 50, scope: !732)
!749 = !DILocation(line: 656, column: 38, scope: !732)
!750 = !DILocation(line: 656, column: 13, scope: !732)
!751 = !DILocation(line: 657, column: 6, scope: !752)
!752 = distinct !DILexicalBlock(scope: !732, file: !69, line: 657, column: 6)
!753 = !DILocation(line: 657, column: 16, scope: !752)
!754 = !DILocation(line: 657, column: 6, scope: !732)
!755 = !DILocation(line: 659, column: 7, scope: !756)
!756 = distinct !DILexicalBlock(scope: !757, file: !69, line: 659, column: 7)
!757 = distinct !DILexicalBlock(scope: !752, file: !69, line: 658, column: 3)
!758 = !DILocation(line: 659, column: 17, scope: !756)
!759 = !DILocation(line: 659, column: 7, scope: !757)
!760 = !DILocation(line: 661, column: 17, scope: !761)
!761 = distinct !DILexicalBlock(scope: !756, file: !69, line: 660, column: 4)
!762 = !DILocation(line: 661, column: 12, scope: !761)
!763 = !DILocation(line: 661, column: 5, scope: !761)
!764 = !DILocation(line: 666, column: 5, scope: !765)
!765 = distinct !DILexicalBlock(scope: !756, file: !69, line: 665, column: 4)
!766 = !DILocation(line: 671, column: 4, scope: !767)
!767 = distinct !DILexicalBlock(scope: !752, file: !69, line: 670, column: 3)
!768 = !DILocation(line: 675, column: 1, scope: !701)
!769 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 693, type: !770, scopeLine: 694, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!770 = !DISubroutineType(types: !771)
!771 = !{!6, !28, !6, !28}
!772 = !DILocalVariable(name: "factor1", arg: 1, scope: !769, file: !69, line: 693, type: !28)
!773 = !DILocation(line: 693, column: 33, scope: !769)
!774 = !DILocalVariable(name: "factor2", arg: 2, scope: !769, file: !69, line: 693, type: !6)
!775 = !DILocation(line: 693, column: 46, scope: !769)
!776 = !DILocalVariable(name: "denominator", arg: 3, scope: !769, file: !69, line: 693, type: !28)
!777 = !DILocation(line: 693, column: 59, scope: !769)
!778 = !DILocalVariable(name: "s32Result", scope: !769, file: !69, line: 695, type: !21)
!779 = !DILocation(line: 695, column: 6, scope: !769)
!780 = !DILocalVariable(name: "s32Temp1", scope: !769, file: !69, line: 695, type: !21)
!781 = !DILocation(line: 695, column: 21, scope: !769)
!782 = !DILocation(line: 696, column: 14, scope: !769)
!783 = !DILocation(line: 696, column: 24, scope: !769)
!784 = !DILocation(line: 696, column: 22, scope: !769)
!785 = !DILocation(line: 696, column: 12, scope: !769)
!786 = !DILocation(line: 697, column: 5, scope: !787)
!787 = distinct !DILexicalBlock(scope: !769, file: !69, line: 697, column: 5)
!788 = !DILocation(line: 697, column: 16, scope: !787)
!789 = !DILocation(line: 697, column: 5, scope: !769)
!790 = !DILocation(line: 699, column: 6, scope: !791)
!791 = distinct !DILexicalBlock(scope: !792, file: !69, line: 699, column: 6)
!792 = distinct !DILexicalBlock(scope: !787, file: !69, line: 698, column: 2)
!793 = !DILocation(line: 699, column: 16, scope: !791)
!794 = !DILocation(line: 699, column: 6, scope: !792)
!795 = !DILocation(line: 701, column: 4, scope: !796)
!796 = distinct !DILexicalBlock(scope: !791, file: !69, line: 700, column: 3)
!797 = !DILocation(line: 705, column: 4, scope: !798)
!798 = distinct !DILexicalBlock(scope: !791, file: !69, line: 704, column: 3)
!799 = !DILocation(line: 710, column: 14, scope: !800)
!800 = distinct !DILexicalBlock(scope: !787, file: !69, line: 709, column: 2)
!801 = !DILocation(line: 710, column: 28, scope: !800)
!802 = !DILocation(line: 710, column: 38, scope: !800)
!803 = !DILocation(line: 710, column: 37, scope: !800)
!804 = !DILocation(line: 710, column: 53, scope: !800)
!805 = !DILocation(line: 710, column: 51, scope: !800)
!806 = !DILocation(line: 710, column: 24, scope: !800)
!807 = !DILocation(line: 710, column: 66, scope: !800)
!808 = !DILocation(line: 710, column: 12, scope: !800)
!809 = !DILocation(line: 711, column: 16, scope: !800)
!810 = !DILocation(line: 711, column: 25, scope: !800)
!811 = !DILocation(line: 711, column: 24, scope: !800)
!812 = !DILocation(line: 711, column: 41, scope: !800)
!813 = !DILocation(line: 711, column: 51, scope: !800)
!814 = !DILocation(line: 711, column: 50, scope: !800)
!815 = !DILocation(line: 711, column: 38, scope: !800)
!816 = !DILocation(line: 711, column: 13, scope: !800)
!817 = !DILocation(line: 712, column: 6, scope: !818)
!818 = distinct !DILexicalBlock(scope: !800, file: !69, line: 712, column: 6)
!819 = !DILocation(line: 712, column: 16, scope: !818)
!820 = !DILocation(line: 712, column: 6, scope: !800)
!821 = !DILocation(line: 714, column: 7, scope: !822)
!822 = distinct !DILexicalBlock(scope: !823, file: !69, line: 714, column: 7)
!823 = distinct !DILexicalBlock(scope: !818, file: !69, line: 713, column: 3)
!824 = !DILocation(line: 714, column: 17, scope: !822)
!825 = !DILocation(line: 714, column: 7, scope: !823)
!826 = !DILocation(line: 716, column: 17, scope: !827)
!827 = distinct !DILexicalBlock(scope: !822, file: !69, line: 715, column: 4)
!828 = !DILocation(line: 716, column: 12, scope: !827)
!829 = !DILocation(line: 716, column: 5, scope: !827)
!830 = !DILocation(line: 720, column: 5, scope: !831)
!831 = distinct !DILexicalBlock(scope: !822, file: !69, line: 719, column: 4)
!832 = !DILocation(line: 725, column: 4, scope: !833)
!833 = distinct !DILexicalBlock(scope: !818, file: !69, line: 724, column: 3)
!834 = !DILocation(line: 728, column: 1, scope: !769)
!835 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 747, type: !836, scopeLine: 748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!836 = !DISubroutineType(types: !837)
!837 = !{!28, !6, !28, !6}
!838 = !DILocalVariable(name: "factor1", arg: 1, scope: !835, file: !69, line: 747, type: !6)
!839 = !DILocation(line: 747, column: 33, scope: !835)
!840 = !DILocalVariable(name: "factor2", arg: 2, scope: !835, file: !69, line: 747, type: !28)
!841 = !DILocation(line: 747, column: 46, scope: !835)
!842 = !DILocalVariable(name: "denominator", arg: 3, scope: !835, file: !69, line: 747, type: !6)
!843 = !DILocation(line: 747, column: 59, scope: !835)
!844 = !DILocalVariable(name: "u32Result", scope: !835, file: !69, line: 749, type: !516)
!845 = !DILocation(line: 749, column: 6, scope: !835)
!846 = !DILocalVariable(name: "u32Temp1", scope: !835, file: !69, line: 749, type: !516)
!847 = !DILocation(line: 749, column: 21, scope: !835)
!848 = !DILocalVariable(name: "s32Result", scope: !835, file: !69, line: 750, type: !21)
!849 = !DILocation(line: 750, column: 6, scope: !835)
!850 = !DILocalVariable(name: "s32Temp1", scope: !835, file: !69, line: 750, type: !21)
!851 = !DILocation(line: 750, column: 21, scope: !835)
!852 = !DILocation(line: 751, column: 14, scope: !835)
!853 = !DILocation(line: 751, column: 24, scope: !835)
!854 = !DILocation(line: 751, column: 22, scope: !835)
!855 = !DILocation(line: 751, column: 12, scope: !835)
!856 = !DILocation(line: 753, column: 5, scope: !857)
!857 = distinct !DILexicalBlock(scope: !835, file: !69, line: 753, column: 5)
!858 = !DILocation(line: 753, column: 17, scope: !857)
!859 = !DILocation(line: 753, column: 5, scope: !835)
!860 = !DILocation(line: 755, column: 6, scope: !861)
!861 = distinct !DILexicalBlock(scope: !862, file: !69, line: 755, column: 6)
!862 = distinct !DILexicalBlock(scope: !857, file: !69, line: 754, column: 2)
!863 = !DILocation(line: 755, column: 16, scope: !861)
!864 = !DILocation(line: 755, column: 6, scope: !862)
!865 = !DILocation(line: 757, column: 4, scope: !866)
!866 = distinct !DILexicalBlock(scope: !861, file: !69, line: 756, column: 3)
!867 = !DILocation(line: 761, column: 4, scope: !868)
!868 = distinct !DILexicalBlock(scope: !861, file: !69, line: 760, column: 3)
!869 = !DILocation(line: 766, column: 15, scope: !870)
!870 = distinct !DILexicalBlock(scope: !857, file: !69, line: 765, column: 2)
!871 = !DILocation(line: 766, column: 29, scope: !870)
!872 = !DILocation(line: 766, column: 39, scope: !870)
!873 = !DILocation(line: 766, column: 38, scope: !870)
!874 = !DILocation(line: 766, column: 54, scope: !870)
!875 = !DILocation(line: 766, column: 52, scope: !870)
!876 = !DILocation(line: 766, column: 25, scope: !870)
!877 = !DILocation(line: 766, column: 68, scope: !870)
!878 = !DILocation(line: 766, column: 12, scope: !870)
!879 = !DILocation(line: 767, column: 16, scope: !870)
!880 = !DILocation(line: 767, column: 25, scope: !870)
!881 = !DILocation(line: 767, column: 24, scope: !870)
!882 = !DILocation(line: 767, column: 41, scope: !870)
!883 = !DILocation(line: 767, column: 51, scope: !870)
!884 = !DILocation(line: 767, column: 50, scope: !870)
!885 = !DILocation(line: 767, column: 38, scope: !870)
!886 = !DILocation(line: 767, column: 13, scope: !870)
!887 = !DILocation(line: 768, column: 6, scope: !888)
!888 = distinct !DILexicalBlock(scope: !870, file: !69, line: 768, column: 6)
!889 = !DILocation(line: 768, column: 16, scope: !888)
!890 = !DILocation(line: 768, column: 6, scope: !870)
!891 = !DILocation(line: 770, column: 7, scope: !892)
!892 = distinct !DILexicalBlock(scope: !893, file: !69, line: 770, column: 7)
!893 = distinct !DILexicalBlock(scope: !888, file: !69, line: 769, column: 3)
!894 = !DILocation(line: 770, column: 17, scope: !892)
!895 = !DILocation(line: 770, column: 7, scope: !893)
!896 = !DILocation(line: 772, column: 17, scope: !897)
!897 = distinct !DILexicalBlock(scope: !892, file: !69, line: 771, column: 4)
!898 = !DILocation(line: 772, column: 12, scope: !897)
!899 = !DILocation(line: 772, column: 5, scope: !897)
!900 = !DILocation(line: 776, column: 5, scope: !901)
!901 = distinct !DILexicalBlock(scope: !892, file: !69, line: 775, column: 4)
!902 = !DILocation(line: 781, column: 4, scope: !903)
!903 = distinct !DILexicalBlock(scope: !888, file: !69, line: 780, column: 3)
!904 = !DILocation(line: 784, column: 1, scope: !835)
!905 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 803, type: !906, scopeLine: 804, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!906 = !DISubroutineType(types: !907)
!907 = !{!28, !6, !28, !28}
!908 = !DILocalVariable(name: "factor1", arg: 1, scope: !905, file: !69, line: 803, type: !6)
!909 = !DILocation(line: 803, column: 33, scope: !905)
!910 = !DILocalVariable(name: "factor2", arg: 2, scope: !905, file: !69, line: 803, type: !28)
!911 = !DILocation(line: 803, column: 46, scope: !905)
!912 = !DILocalVariable(name: "denominator", arg: 3, scope: !905, file: !69, line: 803, type: !28)
!913 = !DILocation(line: 803, column: 59, scope: !905)
!914 = !DILocalVariable(name: "s32Result", scope: !905, file: !69, line: 805, type: !21)
!915 = !DILocation(line: 805, column: 6, scope: !905)
!916 = !DILocalVariable(name: "s32Temp1", scope: !905, file: !69, line: 805, type: !21)
!917 = !DILocation(line: 805, column: 21, scope: !905)
!918 = !DILocation(line: 806, column: 14, scope: !905)
!919 = !DILocation(line: 806, column: 24, scope: !905)
!920 = !DILocation(line: 806, column: 22, scope: !905)
!921 = !DILocation(line: 806, column: 12, scope: !905)
!922 = !DILocation(line: 808, column: 5, scope: !923)
!923 = distinct !DILexicalBlock(scope: !905, file: !69, line: 808, column: 5)
!924 = !DILocation(line: 808, column: 17, scope: !923)
!925 = !DILocation(line: 808, column: 5, scope: !905)
!926 = !DILocation(line: 810, column: 6, scope: !927)
!927 = distinct !DILexicalBlock(scope: !928, file: !69, line: 810, column: 6)
!928 = distinct !DILexicalBlock(scope: !923, file: !69, line: 809, column: 2)
!929 = !DILocation(line: 810, column: 16, scope: !927)
!930 = !DILocation(line: 810, column: 6, scope: !928)
!931 = !DILocation(line: 812, column: 4, scope: !932)
!932 = distinct !DILexicalBlock(scope: !927, file: !69, line: 811, column: 3)
!933 = !DILocation(line: 816, column: 4, scope: !934)
!934 = distinct !DILexicalBlock(scope: !927, file: !69, line: 815, column: 3)
!935 = !DILocation(line: 821, column: 15, scope: !936)
!936 = distinct !DILexicalBlock(scope: !923, file: !69, line: 820, column: 2)
!937 = !DILocation(line: 821, column: 29, scope: !936)
!938 = !DILocation(line: 821, column: 39, scope: !936)
!939 = !DILocation(line: 821, column: 38, scope: !936)
!940 = !DILocation(line: 821, column: 54, scope: !936)
!941 = !DILocation(line: 821, column: 52, scope: !936)
!942 = !DILocation(line: 821, column: 25, scope: !936)
!943 = !DILocation(line: 821, column: 68, scope: !936)
!944 = !DILocation(line: 821, column: 12, scope: !936)
!945 = !DILocation(line: 822, column: 16, scope: !936)
!946 = !DILocation(line: 822, column: 25, scope: !936)
!947 = !DILocation(line: 822, column: 24, scope: !936)
!948 = !DILocation(line: 822, column: 41, scope: !936)
!949 = !DILocation(line: 822, column: 51, scope: !936)
!950 = !DILocation(line: 822, column: 50, scope: !936)
!951 = !DILocation(line: 822, column: 38, scope: !936)
!952 = !DILocation(line: 822, column: 13, scope: !936)
!953 = !DILocation(line: 823, column: 6, scope: !954)
!954 = distinct !DILexicalBlock(scope: !936, file: !69, line: 823, column: 6)
!955 = !DILocation(line: 823, column: 16, scope: !954)
!956 = !DILocation(line: 823, column: 6, scope: !936)
!957 = !DILocation(line: 825, column: 7, scope: !958)
!958 = distinct !DILexicalBlock(scope: !959, file: !69, line: 825, column: 7)
!959 = distinct !DILexicalBlock(scope: !954, file: !69, line: 824, column: 3)
!960 = !DILocation(line: 825, column: 17, scope: !958)
!961 = !DILocation(line: 825, column: 7, scope: !959)
!962 = !DILocation(line: 827, column: 17, scope: !963)
!963 = distinct !DILexicalBlock(scope: !958, file: !69, line: 826, column: 4)
!964 = !DILocation(line: 827, column: 12, scope: !963)
!965 = !DILocation(line: 827, column: 5, scope: !963)
!966 = !DILocation(line: 831, column: 5, scope: !967)
!967 = distinct !DILexicalBlock(scope: !958, file: !69, line: 830, column: 4)
!968 = !DILocation(line: 836, column: 4, scope: !969)
!969 = distinct !DILexicalBlock(scope: !954, file: !69, line: 835, column: 3)
!970 = !DILocation(line: 840, column: 1, scope: !905)
!971 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 858, type: !972, scopeLine: 859, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!972 = !DISubroutineType(types: !973)
!973 = !{!28, !28, !28, !28}
!974 = !DILocalVariable(name: "factor1", arg: 1, scope: !971, file: !69, line: 858, type: !28)
!975 = !DILocation(line: 858, column: 33, scope: !971)
!976 = !DILocalVariable(name: "factor2", arg: 2, scope: !971, file: !69, line: 858, type: !28)
!977 = !DILocation(line: 858, column: 46, scope: !971)
!978 = !DILocalVariable(name: "denominator", arg: 3, scope: !971, file: !69, line: 858, type: !28)
!979 = !DILocation(line: 858, column: 59, scope: !971)
!980 = !DILocalVariable(name: "u32Temp1", scope: !971, file: !69, line: 860, type: !516)
!981 = !DILocation(line: 860, column: 6, scope: !971)
!982 = !DILocalVariable(name: "u16TempDenom", scope: !971, file: !69, line: 861, type: !28)
!983 = !DILocation(line: 861, column: 6, scope: !971)
!984 = !DILocation(line: 863, column: 5, scope: !985)
!985 = distinct !DILexicalBlock(scope: !971, file: !69, line: 863, column: 5)
!986 = !DILocation(line: 863, column: 17, scope: !985)
!987 = !DILocation(line: 863, column: 5, scope: !971)
!988 = !DILocation(line: 865, column: 3, scope: !989)
!989 = distinct !DILexicalBlock(scope: !985, file: !69, line: 864, column: 2)
!990 = !DILocation(line: 869, column: 14, scope: !991)
!991 = distinct !DILexicalBlock(scope: !985, file: !69, line: 868, column: 2)
!992 = !DILocation(line: 869, column: 24, scope: !991)
!993 = !DILocation(line: 869, column: 22, scope: !991)
!994 = !DILocation(line: 869, column: 12, scope: !991)
!995 = !DILocation(line: 870, column: 18, scope: !991)
!996 = !DILocation(line: 870, column: 30, scope: !991)
!997 = !DILocation(line: 870, column: 16, scope: !991)
!998 = !DILocation(line: 871, column: 14, scope: !991)
!999 = !DILocation(line: 871, column: 25, scope: !991)
!1000 = !DILocation(line: 871, column: 23, scope: !991)
!1001 = !DILocation(line: 871, column: 12, scope: !991)
!1002 = !DILocation(line: 872, column: 14, scope: !991)
!1003 = !DILocation(line: 872, column: 25, scope: !991)
!1004 = !DILocation(line: 872, column: 23, scope: !991)
!1005 = !DILocation(line: 872, column: 12, scope: !991)
!1006 = !DILocation(line: 873, column: 6, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !991, file: !69, line: 873, column: 6)
!1008 = !DILocation(line: 873, column: 15, scope: !1007)
!1009 = !DILocation(line: 873, column: 6, scope: !991)
!1010 = !DILocation(line: 875, column: 12, scope: !1011)
!1011 = distinct !DILexicalBlock(scope: !1007, file: !69, line: 874, column: 3)
!1012 = !DILocation(line: 875, column: 21, scope: !1011)
!1013 = !DILocation(line: 875, column: 11, scope: !1011)
!1014 = !DILocation(line: 875, column: 4, scope: !1011)
!1015 = !DILocation(line: 880, column: 4, scope: !1016)
!1016 = distinct !DILexicalBlock(scope: !1007, file: !69, line: 879, column: 3)
!1017 = !DILocation(line: 885, column: 1, scope: !971)
!1018 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 902, type: !1019, scopeLine: 903, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!28, !28, !28, !516}
!1021 = !DILocalVariable(name: "factor1", arg: 1, scope: !1018, file: !69, line: 902, type: !28)
!1022 = !DILocation(line: 902, column: 33, scope: !1018)
!1023 = !DILocalVariable(name: "factor2", arg: 2, scope: !1018, file: !69, line: 902, type: !28)
!1024 = !DILocation(line: 902, column: 46, scope: !1018)
!1025 = !DILocalVariable(name: "denominator", arg: 3, scope: !1018, file: !69, line: 902, type: !516)
!1026 = !DILocation(line: 902, column: 59, scope: !1018)
!1027 = !DILocalVariable(name: "u32Temp1", scope: !1018, file: !69, line: 904, type: !516)
!1028 = !DILocation(line: 904, column: 6, scope: !1018)
!1029 = !DILocation(line: 905, column: 5, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1018, file: !69, line: 905, column: 5)
!1031 = !DILocation(line: 905, column: 17, scope: !1030)
!1032 = !DILocation(line: 905, column: 5, scope: !1018)
!1033 = !DILocation(line: 907, column: 3, scope: !1034)
!1034 = distinct !DILexicalBlock(scope: !1030, file: !69, line: 906, column: 2)
!1035 = !DILocation(line: 911, column: 15, scope: !1036)
!1036 = distinct !DILexicalBlock(scope: !1030, file: !69, line: 910, column: 2)
!1037 = !DILocation(line: 911, column: 25, scope: !1036)
!1038 = !DILocation(line: 911, column: 23, scope: !1036)
!1039 = !DILocation(line: 911, column: 36, scope: !1036)
!1040 = !DILocation(line: 911, column: 34, scope: !1036)
!1041 = !DILocation(line: 911, column: 12, scope: !1036)
!1042 = !DILocation(line: 912, column: 8, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !1036, file: !69, line: 912, column: 6)
!1044 = !DILocation(line: 912, column: 18, scope: !1043)
!1045 = !DILocation(line: 912, column: 16, scope: !1043)
!1046 = !DILocation(line: 912, column: 28, scope: !1043)
!1047 = !DILocation(line: 912, column: 40, scope: !1043)
!1048 = !DILocation(line: 912, column: 39, scope: !1043)
!1049 = !DILocation(line: 912, column: 26, scope: !1043)
!1050 = !DILocation(line: 912, column: 53, scope: !1043)
!1051 = !DILocation(line: 912, column: 64, scope: !1043)
!1052 = !DILocation(line: 912, column: 50, scope: !1043)
!1053 = !DILocation(line: 912, column: 6, scope: !1036)
!1054 = !DILocation(line: 914, column: 12, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1043, file: !69, line: 913, column: 3)
!1056 = !DILocation(line: 915, column: 3, scope: !1055)
!1057 = !DILocation(line: 916, column: 6, scope: !1058)
!1058 = distinct !DILexicalBlock(scope: !1036, file: !69, line: 916, column: 6)
!1059 = !DILocation(line: 916, column: 15, scope: !1058)
!1060 = !DILocation(line: 916, column: 6, scope: !1036)
!1061 = !DILocation(line: 918, column: 12, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1058, file: !69, line: 917, column: 3)
!1063 = !DILocation(line: 918, column: 21, scope: !1062)
!1064 = !DILocation(line: 918, column: 11, scope: !1062)
!1065 = !DILocation(line: 918, column: 4, scope: !1062)
!1066 = !DILocation(line: 922, column: 4, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !1058, file: !69, line: 921, column: 3)
!1068 = !DILocation(line: 925, column: 1, scope: !1018)
!1069 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 942, type: !1070, scopeLine: 943, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1070 = !DISubroutineType(types: !1071)
!1071 = !{!516, !516, !28}
!1072 = !DILocalVariable(name: "x_value", arg: 1, scope: !1069, file: !69, line: 942, type: !516)
!1073 = !DILocation(line: 942, column: 25, scope: !1069)
!1074 = !DILocalVariable(name: "y_value", arg: 2, scope: !1069, file: !69, line: 942, type: !28)
!1075 = !DILocation(line: 942, column: 38, scope: !1069)
!1076 = !DILocalVariable(name: "u32Temp1", scope: !1069, file: !69, line: 944, type: !516)
!1077 = !DILocation(line: 944, column: 6, scope: !1069)
!1078 = !DILocation(line: 945, column: 5, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1069, file: !69, line: 945, column: 5)
!1080 = !DILocation(line: 945, column: 13, scope: !1079)
!1081 = !DILocation(line: 945, column: 5, scope: !1069)
!1082 = !DILocation(line: 947, column: 3, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1079, file: !69, line: 946, column: 2)
!1084 = !DILocation(line: 951, column: 15, scope: !1085)
!1085 = distinct !DILexicalBlock(scope: !1079, file: !69, line: 950, column: 2)
!1086 = !DILocation(line: 951, column: 26, scope: !1085)
!1087 = !DILocation(line: 951, column: 34, scope: !1085)
!1088 = !DILocation(line: 951, column: 33, scope: !1085)
!1089 = !DILocation(line: 951, column: 45, scope: !1085)
!1090 = !DILocation(line: 951, column: 43, scope: !1085)
!1091 = !DILocation(line: 951, column: 23, scope: !1085)
!1092 = !DILocation(line: 951, column: 54, scope: !1085)
!1093 = !DILocation(line: 951, column: 12, scope: !1085)
!1094 = !DILocation(line: 952, column: 15, scope: !1085)
!1095 = !DILocation(line: 952, column: 23, scope: !1085)
!1096 = !DILocation(line: 952, column: 22, scope: !1085)
!1097 = !DILocation(line: 952, column: 35, scope: !1085)
!1098 = !DILocation(line: 952, column: 44, scope: !1085)
!1099 = !DILocation(line: 952, column: 43, scope: !1085)
!1100 = !DILocation(line: 952, column: 32, scope: !1085)
!1101 = !DILocation(line: 952, column: 12, scope: !1085)
!1102 = !DILocation(line: 953, column: 10, scope: !1085)
!1103 = !DILocation(line: 953, column: 3, scope: !1085)
!1104 = !DILocation(line: 955, column: 1, scope: !1069)
!1105 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 973, type: !1106, scopeLine: 974, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1106 = !DISubroutineType(types: !1107)
!1107 = !{!6, !6, !6, !6}
!1108 = !DILocalVariable(name: "fak1", arg: 1, scope: !1105, file: !69, line: 973, type: !6)
!1109 = !DILocation(line: 973, column: 33, scope: !1105)
!1110 = !DILocalVariable(name: "fak2", arg: 2, scope: !1105, file: !69, line: 973, type: !6)
!1111 = !DILocation(line: 973, column: 43, scope: !1105)
!1112 = !DILocalVariable(name: "div", arg: 3, scope: !1105, file: !69, line: 973, type: !6)
!1113 = !DILocation(line: 973, column: 53, scope: !1105)
!1114 = !DILocalVariable(name: "s32Temp1", scope: !1105, file: !69, line: 975, type: !21)
!1115 = !DILocation(line: 975, column: 6, scope: !1105)
!1116 = !DILocalVariable(name: "s32Temp2", scope: !1105, file: !69, line: 975, type: !21)
!1117 = !DILocation(line: 975, column: 20, scope: !1105)
!1118 = !DILocalVariable(name: "s32Temp3", scope: !1105, file: !69, line: 975, type: !21)
!1119 = !DILocation(line: 975, column: 34, scope: !1105)
!1120 = !DILocation(line: 976, column: 13, scope: !1105)
!1121 = !DILocation(line: 976, column: 20, scope: !1105)
!1122 = !DILocation(line: 976, column: 18, scope: !1105)
!1123 = !DILocation(line: 976, column: 11, scope: !1105)
!1124 = !DILocation(line: 977, column: 5, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1105, file: !69, line: 977, column: 5)
!1126 = !DILocation(line: 977, column: 9, scope: !1125)
!1127 = !DILocation(line: 977, column: 5, scope: !1105)
!1128 = !DILocation(line: 979, column: 6, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1130, file: !69, line: 979, column: 6)
!1130 = distinct !DILexicalBlock(scope: !1125, file: !69, line: 978, column: 2)
!1131 = !DILocation(line: 979, column: 15, scope: !1129)
!1132 = !DILocation(line: 979, column: 6, scope: !1130)
!1133 = !DILocation(line: 981, column: 4, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1129, file: !69, line: 980, column: 3)
!1135 = !DILocation(line: 985, column: 4, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1129, file: !69, line: 984, column: 3)
!1137 = !DILocation(line: 990, column: 15, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1125, file: !69, line: 989, column: 2)
!1139 = !DILocation(line: 990, column: 28, scope: !1138)
!1140 = !DILocation(line: 990, column: 39, scope: !1138)
!1141 = !DILocation(line: 990, column: 37, scope: !1138)
!1142 = !DILocation(line: 990, column: 46, scope: !1138)
!1143 = !DILocation(line: 990, column: 44, scope: !1138)
!1144 = !DILocation(line: 990, column: 24, scope: !1138)
!1145 = !DILocation(line: 990, column: 52, scope: !1138)
!1146 = !DILocation(line: 990, column: 12, scope: !1138)
!1147 = !DILocation(line: 991, column: 15, scope: !1138)
!1148 = !DILocation(line: 991, column: 24, scope: !1138)
!1149 = !DILocation(line: 991, column: 23, scope: !1138)
!1150 = !DILocation(line: 991, column: 32, scope: !1138)
!1151 = !DILocation(line: 991, column: 41, scope: !1138)
!1152 = !DILocation(line: 991, column: 40, scope: !1138)
!1153 = !DILocation(line: 991, column: 29, scope: !1138)
!1154 = !DILocation(line: 991, column: 12, scope: !1138)
!1155 = !DILocation(line: 992, column: 6, scope: !1156)
!1156 = distinct !DILexicalBlock(scope: !1138, file: !69, line: 992, column: 6)
!1157 = !DILocation(line: 992, column: 15, scope: !1156)
!1158 = !DILocation(line: 992, column: 6, scope: !1138)
!1159 = !DILocation(line: 994, column: 7, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1161, file: !69, line: 994, column: 7)
!1161 = distinct !DILexicalBlock(scope: !1156, file: !69, line: 993, column: 3)
!1162 = !DILocation(line: 994, column: 16, scope: !1160)
!1163 = !DILocation(line: 994, column: 7, scope: !1161)
!1164 = !DILocation(line: 996, column: 17, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1160, file: !69, line: 995, column: 4)
!1166 = !DILocation(line: 996, column: 12, scope: !1165)
!1167 = !DILocation(line: 996, column: 5, scope: !1165)
!1168 = !DILocation(line: 1000, column: 5, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1160, file: !69, line: 999, column: 4)
!1170 = !DILocation(line: 1005, column: 4, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1156, file: !69, line: 1004, column: 3)
!1172 = !DILocation(line: 1008, column: 1, scope: !1105)
!1173 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1026, type: !1174, scopeLine: 1027, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1174 = !DISubroutineType(types: !1175)
!1175 = !{!6, !6, !6, !28}
!1176 = !DILocalVariable(name: "data1", arg: 1, scope: !1173, file: !69, line: 1026, type: !6)
!1177 = !DILocation(line: 1026, column: 33, scope: !1173)
!1178 = !DILocalVariable(name: "data2", arg: 2, scope: !1173, file: !69, line: 1026, type: !6)
!1179 = !DILocation(line: 1026, column: 43, scope: !1173)
!1180 = !DILocalVariable(name: "denominator", arg: 3, scope: !1173, file: !69, line: 1026, type: !28)
!1181 = !DILocation(line: 1026, column: 53, scope: !1173)
!1182 = !DILocalVariable(name: "s32Result", scope: !1173, file: !69, line: 1028, type: !21)
!1183 = !DILocation(line: 1028, column: 6, scope: !1173)
!1184 = !DILocalVariable(name: "s32Temp1", scope: !1173, file: !69, line: 1028, type: !21)
!1185 = !DILocation(line: 1028, column: 21, scope: !1173)
!1186 = !DILocation(line: 1029, column: 14, scope: !1173)
!1187 = !DILocation(line: 1029, column: 22, scope: !1173)
!1188 = !DILocation(line: 1029, column: 20, scope: !1173)
!1189 = !DILocation(line: 1029, column: 12, scope: !1173)
!1190 = !DILocation(line: 1031, column: 5, scope: !1191)
!1191 = distinct !DILexicalBlock(scope: !1173, file: !69, line: 1031, column: 5)
!1192 = !DILocation(line: 1031, column: 17, scope: !1191)
!1193 = !DILocation(line: 1031, column: 5, scope: !1173)
!1194 = !DILocation(line: 1033, column: 6, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1196, file: !69, line: 1033, column: 6)
!1196 = distinct !DILexicalBlock(scope: !1191, file: !69, line: 1032, column: 2)
!1197 = !DILocation(line: 1033, column: 16, scope: !1195)
!1198 = !DILocation(line: 1033, column: 6, scope: !1196)
!1199 = !DILocation(line: 1035, column: 4, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1195, file: !69, line: 1034, column: 3)
!1201 = !DILocation(line: 1037, column: 11, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1195, file: !69, line: 1037, column: 11)
!1203 = !DILocation(line: 1037, column: 21, scope: !1202)
!1204 = !DILocation(line: 1037, column: 11, scope: !1195)
!1205 = !DILocation(line: 1039, column: 4, scope: !1206)
!1206 = distinct !DILexicalBlock(scope: !1202, file: !69, line: 1038, column: 3)
!1207 = !DILocation(line: 1043, column: 4, scope: !1208)
!1208 = distinct !DILexicalBlock(scope: !1202, file: !69, line: 1042, column: 3)
!1209 = !DILocation(line: 1048, column: 15, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1191, file: !69, line: 1047, column: 2)
!1211 = !DILocation(line: 1048, column: 28, scope: !1210)
!1212 = !DILocation(line: 1048, column: 38, scope: !1210)
!1213 = !DILocation(line: 1048, column: 37, scope: !1210)
!1214 = !DILocation(line: 1048, column: 51, scope: !1210)
!1215 = !DILocation(line: 1048, column: 50, scope: !1210)
!1216 = !DILocation(line: 1048, column: 25, scope: !1210)
!1217 = !DILocation(line: 1048, column: 64, scope: !1210)
!1218 = !DILocation(line: 1048, column: 12, scope: !1210)
!1219 = !DILocation(line: 1049, column: 16, scope: !1210)
!1220 = !DILocation(line: 1049, column: 25, scope: !1210)
!1221 = !DILocation(line: 1049, column: 24, scope: !1210)
!1222 = !DILocation(line: 1049, column: 41, scope: !1210)
!1223 = !DILocation(line: 1049, column: 51, scope: !1210)
!1224 = !DILocation(line: 1049, column: 50, scope: !1210)
!1225 = !DILocation(line: 1049, column: 38, scope: !1210)
!1226 = !DILocation(line: 1049, column: 13, scope: !1210)
!1227 = !DILocation(line: 1050, column: 6, scope: !1228)
!1228 = distinct !DILexicalBlock(scope: !1210, file: !69, line: 1050, column: 6)
!1229 = !DILocation(line: 1050, column: 16, scope: !1228)
!1230 = !DILocation(line: 1050, column: 6, scope: !1210)
!1231 = !DILocation(line: 1052, column: 7, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1233, file: !69, line: 1052, column: 7)
!1233 = distinct !DILexicalBlock(scope: !1228, file: !69, line: 1051, column: 3)
!1234 = !DILocation(line: 1052, column: 17, scope: !1232)
!1235 = !DILocation(line: 1052, column: 7, scope: !1233)
!1236 = !DILocation(line: 1054, column: 17, scope: !1237)
!1237 = distinct !DILexicalBlock(scope: !1232, file: !69, line: 1053, column: 4)
!1238 = !DILocation(line: 1054, column: 12, scope: !1237)
!1239 = !DILocation(line: 1054, column: 5, scope: !1237)
!1240 = !DILocation(line: 1058, column: 5, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1232, file: !69, line: 1057, column: 4)
!1242 = !DILocation(line: 1063, column: 4, scope: !1243)
!1243 = distinct !DILexicalBlock(scope: !1228, file: !69, line: 1062, column: 3)
!1244 = !DILocation(line: 1067, column: 1, scope: !1173)
!1245 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1084, type: !1246, scopeLine: 1085, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1246 = !DISubroutineType(types: !1247)
!1247 = !{!516, !516, !21}
!1248 = !DILocalVariable(name: "numerator", arg: 1, scope: !1245, file: !69, line: 1084, type: !516)
!1249 = !DILocation(line: 1084, column: 25, scope: !1245)
!1250 = !DILocalVariable(name: "denominator", arg: 2, scope: !1245, file: !69, line: 1084, type: !21)
!1251 = !DILocation(line: 1084, column: 40, scope: !1245)
!1252 = !DILocalVariable(name: "u32Temp1", scope: !1245, file: !69, line: 1086, type: !516)
!1253 = !DILocation(line: 1086, column: 6, scope: !1245)
!1254 = !DILocation(line: 1087, column: 5, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1245, file: !69, line: 1087, column: 5)
!1256 = !DILocation(line: 1087, column: 17, scope: !1255)
!1257 = !DILocation(line: 1087, column: 5, scope: !1245)
!1258 = !DILocation(line: 1089, column: 3, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1255, file: !69, line: 1088, column: 2)
!1260 = !DILocation(line: 1093, column: 6, scope: !1261)
!1261 = distinct !DILexicalBlock(scope: !1262, file: !69, line: 1093, column: 6)
!1262 = distinct !DILexicalBlock(scope: !1255, file: !69, line: 1092, column: 2)
!1263 = !DILocation(line: 1093, column: 18, scope: !1261)
!1264 = !DILocation(line: 1093, column: 6, scope: !1262)
!1265 = !DILocation(line: 1095, column: 4, scope: !1266)
!1266 = distinct !DILexicalBlock(scope: !1261, file: !69, line: 1094, column: 3)
!1267 = !DILocation(line: 1099, column: 16, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1261, file: !69, line: 1098, column: 3)
!1269 = !DILocation(line: 1099, column: 30, scope: !1268)
!1270 = !DILocation(line: 1099, column: 40, scope: !1268)
!1271 = !DILocation(line: 1099, column: 39, scope: !1268)
!1272 = !DILocation(line: 1099, column: 55, scope: !1268)
!1273 = !DILocation(line: 1099, column: 53, scope: !1268)
!1274 = !DILocation(line: 1099, column: 26, scope: !1268)
!1275 = !DILocation(line: 1099, column: 68, scope: !1268)
!1276 = !DILocation(line: 1099, column: 13, scope: !1268)
!1277 = !DILocation(line: 1100, column: 16, scope: !1268)
!1278 = !DILocation(line: 1100, column: 25, scope: !1268)
!1279 = !DILocation(line: 1100, column: 24, scope: !1268)
!1280 = !DILocation(line: 1100, column: 41, scope: !1268)
!1281 = !DILocation(line: 1100, column: 51, scope: !1268)
!1282 = !DILocation(line: 1100, column: 50, scope: !1268)
!1283 = !DILocation(line: 1100, column: 38, scope: !1268)
!1284 = !DILocation(line: 1100, column: 13, scope: !1268)
!1285 = !DILocation(line: 1101, column: 11, scope: !1268)
!1286 = !DILocation(line: 1101, column: 4, scope: !1268)
!1287 = !DILocation(line: 1104, column: 1, scope: !1245)
!1288 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1121, type: !1289, scopeLine: 1122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1289 = !DISubroutineType(types: !1290)
!1290 = !{!516, !21, !516}
!1291 = !DILocalVariable(name: "numerator", arg: 1, scope: !1288, file: !69, line: 1121, type: !21)
!1292 = !DILocation(line: 1121, column: 25, scope: !1288)
!1293 = !DILocalVariable(name: "denominator", arg: 2, scope: !1288, file: !69, line: 1121, type: !516)
!1294 = !DILocation(line: 1121, column: 40, scope: !1288)
!1295 = !DILocalVariable(name: "s32Temp1", scope: !1288, file: !69, line: 1123, type: !21)
!1296 = !DILocation(line: 1123, column: 6, scope: !1288)
!1297 = !DILocation(line: 1124, column: 5, scope: !1298)
!1298 = distinct !DILexicalBlock(scope: !1288, file: !69, line: 1124, column: 5)
!1299 = !DILocation(line: 1124, column: 17, scope: !1298)
!1300 = !DILocation(line: 1124, column: 5, scope: !1288)
!1301 = !DILocation(line: 1126, column: 6, scope: !1302)
!1302 = distinct !DILexicalBlock(scope: !1303, file: !69, line: 1126, column: 6)
!1303 = distinct !DILexicalBlock(scope: !1298, file: !69, line: 1125, column: 2)
!1304 = !DILocation(line: 1126, column: 16, scope: !1302)
!1305 = !DILocation(line: 1126, column: 6, scope: !1303)
!1306 = !DILocation(line: 1128, column: 4, scope: !1307)
!1307 = distinct !DILexicalBlock(scope: !1302, file: !69, line: 1127, column: 3)
!1308 = !DILocation(line: 1132, column: 4, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1302, file: !69, line: 1131, column: 3)
!1310 = !DILocation(line: 1137, column: 6, scope: !1311)
!1311 = distinct !DILexicalBlock(scope: !1312, file: !69, line: 1137, column: 6)
!1312 = distinct !DILexicalBlock(scope: !1298, file: !69, line: 1136, column: 2)
!1313 = !DILocation(line: 1137, column: 16, scope: !1311)
!1314 = !DILocation(line: 1137, column: 6, scope: !1312)
!1315 = !DILocation(line: 1139, column: 17, scope: !1316)
!1316 = distinct !DILexicalBlock(scope: !1311, file: !69, line: 1138, column: 3)
!1317 = !DILocation(line: 1139, column: 31, scope: !1316)
!1318 = !DILocation(line: 1139, column: 41, scope: !1316)
!1319 = !DILocation(line: 1139, column: 40, scope: !1316)
!1320 = !DILocation(line: 1139, column: 56, scope: !1316)
!1321 = !DILocation(line: 1139, column: 54, scope: !1316)
!1322 = !DILocation(line: 1139, column: 27, scope: !1316)
!1323 = !DILocation(line: 1139, column: 69, scope: !1316)
!1324 = !DILocation(line: 1139, column: 13, scope: !1316)
!1325 = !DILocation(line: 1140, column: 13, scope: !1316)
!1326 = !DILocation(line: 1140, column: 23, scope: !1316)
!1327 = !DILocation(line: 1140, column: 22, scope: !1316)
!1328 = !DILocation(line: 1140, column: 39, scope: !1316)
!1329 = !DILocation(line: 1140, column: 48, scope: !1316)
!1330 = !DILocation(line: 1140, column: 47, scope: !1316)
!1331 = !DILocation(line: 1140, column: 36, scope: !1316)
!1332 = !DILocation(line: 1140, column: 4, scope: !1316)
!1333 = !DILocation(line: 1144, column: 4, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1311, file: !69, line: 1143, column: 3)
!1335 = !DILocation(line: 1147, column: 1, scope: !1288)
!1336 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1164, type: !1337, scopeLine: 1165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1337 = !DISubroutineType(types: !1338)
!1338 = !{!516, !21, !21}
!1339 = !DILocalVariable(name: "numerator", arg: 1, scope: !1336, file: !69, line: 1164, type: !21)
!1340 = !DILocation(line: 1164, column: 25, scope: !1336)
!1341 = !DILocalVariable(name: "denominator", arg: 2, scope: !1336, file: !69, line: 1164, type: !21)
!1342 = !DILocation(line: 1164, column: 40, scope: !1336)
!1343 = !DILocalVariable(name: "u32Temp1", scope: !1336, file: !69, line: 1166, type: !516)
!1344 = !DILocation(line: 1166, column: 6, scope: !1336)
!1345 = !DILocalVariable(name: "u32Temp2", scope: !1336, file: !69, line: 1166, type: !516)
!1346 = !DILocation(line: 1166, column: 20, scope: !1336)
!1347 = !DILocation(line: 1167, column: 5, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !1336, file: !69, line: 1167, column: 5)
!1349 = !DILocation(line: 1167, column: 17, scope: !1348)
!1350 = !DILocation(line: 1167, column: 5, scope: !1336)
!1351 = !DILocation(line: 1169, column: 6, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1353, file: !69, line: 1169, column: 6)
!1353 = distinct !DILexicalBlock(scope: !1348, file: !69, line: 1168, column: 2)
!1354 = !DILocation(line: 1169, column: 16, scope: !1352)
!1355 = !DILocation(line: 1169, column: 6, scope: !1353)
!1356 = !DILocation(line: 1171, column: 4, scope: !1357)
!1357 = distinct !DILexicalBlock(scope: !1352, file: !69, line: 1170, column: 3)
!1358 = !DILocation(line: 1175, column: 4, scope: !1359)
!1359 = distinct !DILexicalBlock(scope: !1352, file: !69, line: 1174, column: 3)
!1360 = !DILocation(line: 1180, column: 6, scope: !1361)
!1361 = distinct !DILexicalBlock(scope: !1362, file: !69, line: 1180, column: 6)
!1362 = distinct !DILexicalBlock(scope: !1348, file: !69, line: 1179, column: 2)
!1363 = !DILocation(line: 1180, column: 16, scope: !1361)
!1364 = !DILocation(line: 1180, column: 6, scope: !1362)
!1365 = !DILocation(line: 1182, column: 7, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !1367, file: !69, line: 1182, column: 7)
!1367 = distinct !DILexicalBlock(scope: !1361, file: !69, line: 1181, column: 3)
!1368 = !DILocation(line: 1182, column: 17, scope: !1366)
!1369 = !DILocation(line: 1182, column: 7, scope: !1367)
!1370 = !DILocation(line: 1184, column: 5, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1366, file: !69, line: 1183, column: 4)
!1372 = !DILocation(line: 1188, column: 8, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1374, file: !69, line: 1188, column: 8)
!1374 = distinct !DILexicalBlock(scope: !1366, file: !69, line: 1187, column: 4)
!1375 = !DILocation(line: 1188, column: 20, scope: !1373)
!1376 = !DILocation(line: 1188, column: 8, scope: !1374)
!1377 = !DILocation(line: 1190, column: 6, scope: !1378)
!1378 = distinct !DILexicalBlock(scope: !1373, file: !69, line: 1189, column: 5)
!1379 = !DILocation(line: 1194, column: 18, scope: !1380)
!1380 = distinct !DILexicalBlock(scope: !1373, file: !69, line: 1193, column: 5)
!1381 = !DILocation(line: 1194, column: 32, scope: !1380)
!1382 = !DILocation(line: 1194, column: 42, scope: !1380)
!1383 = !DILocation(line: 1194, column: 41, scope: !1380)
!1384 = !DILocation(line: 1194, column: 57, scope: !1380)
!1385 = !DILocation(line: 1194, column: 55, scope: !1380)
!1386 = !DILocation(line: 1194, column: 28, scope: !1380)
!1387 = !DILocation(line: 1194, column: 71, scope: !1380)
!1388 = !DILocation(line: 1194, column: 15, scope: !1380)
!1389 = !DILocation(line: 1195, column: 18, scope: !1380)
!1390 = !DILocation(line: 1195, column: 29, scope: !1380)
!1391 = !DILocation(line: 1195, column: 27, scope: !1380)
!1392 = !DILocation(line: 1195, column: 45, scope: !1380)
!1393 = !DILocation(line: 1195, column: 57, scope: !1380)
!1394 = !DILocation(line: 1195, column: 55, scope: !1380)
!1395 = !DILocation(line: 1195, column: 42, scope: !1380)
!1396 = !DILocation(line: 1195, column: 15, scope: !1380)
!1397 = !DILocation(line: 1196, column: 13, scope: !1380)
!1398 = !DILocation(line: 1196, column: 6, scope: !1380)
!1399 = !DILocation(line: 1202, column: 7, scope: !1400)
!1400 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1202, column: 7)
!1401 = distinct !DILexicalBlock(scope: !1361, file: !69, line: 1201, column: 3)
!1402 = !DILocation(line: 1202, column: 19, scope: !1400)
!1403 = !DILocation(line: 1202, column: 7, scope: !1401)
!1404 = !DILocation(line: 1204, column: 5, scope: !1405)
!1405 = distinct !DILexicalBlock(scope: !1400, file: !69, line: 1203, column: 4)
!1406 = !DILocation(line: 1208, column: 18, scope: !1407)
!1407 = distinct !DILexicalBlock(scope: !1400, file: !69, line: 1207, column: 4)
!1408 = !DILocation(line: 1208, column: 17, scope: !1407)
!1409 = !DILocation(line: 1208, column: 15, scope: !1407)
!1410 = !DILocation(line: 1209, column: 20, scope: !1407)
!1411 = !DILocation(line: 1209, column: 19, scope: !1407)
!1412 = !DILocation(line: 1209, column: 17, scope: !1407)
!1413 = !DILocation(line: 1210, column: 17, scope: !1407)
!1414 = !DILocation(line: 1210, column: 31, scope: !1407)
!1415 = !DILocation(line: 1210, column: 41, scope: !1407)
!1416 = !DILocation(line: 1210, column: 40, scope: !1407)
!1417 = !DILocation(line: 1210, column: 56, scope: !1407)
!1418 = !DILocation(line: 1210, column: 54, scope: !1407)
!1419 = !DILocation(line: 1210, column: 27, scope: !1407)
!1420 = !DILocation(line: 1210, column: 70, scope: !1407)
!1421 = !DILocation(line: 1210, column: 14, scope: !1407)
!1422 = !DILocation(line: 1211, column: 17, scope: !1407)
!1423 = !DILocation(line: 1211, column: 28, scope: !1407)
!1424 = !DILocation(line: 1211, column: 26, scope: !1407)
!1425 = !DILocation(line: 1211, column: 44, scope: !1407)
!1426 = !DILocation(line: 1211, column: 56, scope: !1407)
!1427 = !DILocation(line: 1211, column: 54, scope: !1407)
!1428 = !DILocation(line: 1211, column: 41, scope: !1407)
!1429 = !DILocation(line: 1211, column: 14, scope: !1407)
!1430 = !DILocation(line: 1212, column: 12, scope: !1407)
!1431 = !DILocation(line: 1212, column: 5, scope: !1407)
!1432 = !DILocation(line: 1217, column: 1, scope: !1336)
!1433 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1234, type: !1434, scopeLine: 1235, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1434 = !DISubroutineType(types: !1435)
!1435 = !{!516, !516, !516}
!1436 = !DILocalVariable(name: "numerator", arg: 1, scope: !1433, file: !69, line: 1234, type: !516)
!1437 = !DILocation(line: 1234, column: 25, scope: !1433)
!1438 = !DILocalVariable(name: "denominator", arg: 2, scope: !1433, file: !69, line: 1234, type: !516)
!1439 = !DILocation(line: 1234, column: 40, scope: !1433)
!1440 = !DILocalVariable(name: "u32Temp1", scope: !1433, file: !69, line: 1237, type: !516)
!1441 = !DILocation(line: 1237, column: 6, scope: !1433)
!1442 = !DILocalVariable(name: "u32Temp2", scope: !1433, file: !69, line: 1237, type: !516)
!1443 = !DILocation(line: 1237, column: 20, scope: !1433)
!1444 = !DILocalVariable(name: "u32Temp3", scope: !1433, file: !69, line: 1237, type: !516)
!1445 = !DILocation(line: 1237, column: 34, scope: !1433)
!1446 = !DILocalVariable(name: "numerator_old", scope: !1433, file: !69, line: 1237, type: !516)
!1447 = !DILocation(line: 1237, column: 48, scope: !1433)
!1448 = !DILocation(line: 1238, column: 5, scope: !1449)
!1449 = distinct !DILexicalBlock(scope: !1433, file: !69, line: 1238, column: 5)
!1450 = !DILocation(line: 1238, column: 16, scope: !1449)
!1451 = !DILocation(line: 1238, column: 5, scope: !1433)
!1452 = !DILocation(line: 1240, column: 3, scope: !1453)
!1453 = distinct !DILexicalBlock(scope: !1449, file: !69, line: 1239, column: 2)
!1454 = !DILocation(line: 1244, column: 14, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1449, file: !69, line: 1243, column: 2)
!1456 = !DILocation(line: 1244, column: 26, scope: !1455)
!1457 = !DILocation(line: 1244, column: 41, scope: !1455)
!1458 = !DILocation(line: 1244, column: 51, scope: !1455)
!1459 = !DILocation(line: 1244, column: 50, scope: !1455)
!1460 = !DILocation(line: 1244, column: 38, scope: !1455)
!1461 = !DILocation(line: 1244, column: 24, scope: !1455)
!1462 = !DILocation(line: 1244, column: 12, scope: !1455)
!1463 = !DILocation(line: 1245, column: 7, scope: !1464)
!1464 = distinct !DILexicalBlock(scope: !1455, file: !69, line: 1245, column: 6)
!1465 = !DILocation(line: 1245, column: 16, scope: !1464)
!1466 = !DILocation(line: 1245, column: 24, scope: !1464)
!1467 = !DILocation(line: 1245, column: 6, scope: !1455)
!1468 = !DILocation(line: 1247, column: 16, scope: !1469)
!1469 = distinct !DILexicalBlock(scope: !1464, file: !69, line: 1246, column: 3)
!1470 = !DILocation(line: 1247, column: 27, scope: !1469)
!1471 = !DILocation(line: 1247, column: 13, scope: !1469)
!1472 = !DILocation(line: 1248, column: 3, scope: !1469)
!1473 = !DILocation(line: 1251, column: 16, scope: !1474)
!1474 = distinct !DILexicalBlock(scope: !1464, file: !69, line: 1250, column: 3)
!1475 = !DILocation(line: 1251, column: 27, scope: !1474)
!1476 = !DILocation(line: 1251, column: 32, scope: !1474)
!1477 = !DILocation(line: 1251, column: 13, scope: !1474)
!1478 = !DILocation(line: 1254, column: 6, scope: !1479)
!1479 = distinct !DILexicalBlock(scope: !1455, file: !69, line: 1254, column: 6)
!1480 = !DILocation(line: 1254, column: 17, scope: !1479)
!1481 = !DILocation(line: 1254, column: 15, scope: !1479)
!1482 = !DILocation(line: 1254, column: 6, scope: !1455)
!1483 = !DILocation(line: 1256, column: 12, scope: !1484)
!1484 = distinct !DILexicalBlock(scope: !1479, file: !69, line: 1255, column: 3)
!1485 = !DILocation(line: 1256, column: 22, scope: !1484)
!1486 = !DILocation(line: 1256, column: 21, scope: !1484)
!1487 = !DILocation(line: 1256, column: 4, scope: !1484)
!1488 = !DILocation(line: 1260, column: 13, scope: !1489)
!1489 = distinct !DILexicalBlock(scope: !1479, file: !69, line: 1259, column: 3)
!1490 = !DILocation(line: 1260, column: 23, scope: !1489)
!1491 = !DILocation(line: 1260, column: 22, scope: !1489)
!1492 = !DILocation(line: 1260, column: 36, scope: !1489)
!1493 = !DILocation(line: 1260, column: 4, scope: !1489)
!1494 = !DILocation(line: 1265, column: 1, scope: !1433)
!1495 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1282, type: !1496, scopeLine: 1283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1496 = !DISubroutineType(types: !1497)
!1497 = !{!21, !516, !21}
!1498 = !DILocalVariable(name: "numerator", arg: 1, scope: !1495, file: !69, line: 1282, type: !516)
!1499 = !DILocation(line: 1282, column: 25, scope: !1495)
!1500 = !DILocalVariable(name: "denominator", arg: 2, scope: !1495, file: !69, line: 1282, type: !21)
!1501 = !DILocation(line: 1282, column: 40, scope: !1495)
!1502 = !DILocalVariable(name: "u32Temp1", scope: !1495, file: !69, line: 1284, type: !516)
!1503 = !DILocation(line: 1284, column: 6, scope: !1495)
!1504 = !DILocalVariable(name: "u32Temp2", scope: !1495, file: !69, line: 1284, type: !516)
!1505 = !DILocation(line: 1284, column: 20, scope: !1495)
!1506 = !DILocation(line: 1285, column: 5, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1495, file: !69, line: 1285, column: 5)
!1508 = !DILocation(line: 1285, column: 17, scope: !1507)
!1509 = !DILocation(line: 1285, column: 5, scope: !1495)
!1510 = !DILocation(line: 1287, column: 6, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1512, file: !69, line: 1287, column: 6)
!1512 = distinct !DILexicalBlock(scope: !1507, file: !69, line: 1286, column: 2)
!1513 = !DILocation(line: 1287, column: 18, scope: !1511)
!1514 = !DILocation(line: 1287, column: 6, scope: !1512)
!1515 = !DILocation(line: 1289, column: 4, scope: !1516)
!1516 = distinct !DILexicalBlock(scope: !1511, file: !69, line: 1288, column: 3)
!1517 = !DILocation(line: 1293, column: 19, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1511, file: !69, line: 1292, column: 3)
!1519 = !DILocation(line: 1293, column: 18, scope: !1518)
!1520 = !DILocation(line: 1293, column: 16, scope: !1518)
!1521 = !DILocation(line: 1294, column: 16, scope: !1518)
!1522 = !DILocation(line: 1294, column: 30, scope: !1518)
!1523 = !DILocation(line: 1294, column: 40, scope: !1518)
!1524 = !DILocation(line: 1294, column: 39, scope: !1518)
!1525 = !DILocation(line: 1294, column: 55, scope: !1518)
!1526 = !DILocation(line: 1294, column: 53, scope: !1518)
!1527 = !DILocation(line: 1294, column: 26, scope: !1518)
!1528 = !DILocation(line: 1294, column: 69, scope: !1518)
!1529 = !DILocation(line: 1294, column: 13, scope: !1518)
!1530 = !DILocation(line: 1295, column: 16, scope: !1518)
!1531 = !DILocation(line: 1295, column: 25, scope: !1518)
!1532 = !DILocation(line: 1295, column: 24, scope: !1518)
!1533 = !DILocation(line: 1295, column: 41, scope: !1518)
!1534 = !DILocation(line: 1295, column: 51, scope: !1518)
!1535 = !DILocation(line: 1295, column: 50, scope: !1518)
!1536 = !DILocation(line: 1295, column: 38, scope: !1518)
!1537 = !DILocation(line: 1295, column: 13, scope: !1518)
!1538 = !DILocation(line: 1296, column: 7, scope: !1539)
!1539 = distinct !DILexicalBlock(scope: !1518, file: !69, line: 1296, column: 7)
!1540 = !DILocation(line: 1296, column: 16, scope: !1539)
!1541 = !DILocation(line: 1296, column: 7, scope: !1518)
!1542 = !DILocation(line: 1298, column: 13, scope: !1543)
!1543 = distinct !DILexicalBlock(scope: !1539, file: !69, line: 1297, column: 4)
!1544 = !DILocation(line: 1298, column: 12, scope: !1543)
!1545 = !DILocation(line: 1298, column: 5, scope: !1543)
!1546 = !DILocation(line: 1302, column: 5, scope: !1547)
!1547 = distinct !DILexicalBlock(scope: !1539, file: !69, line: 1301, column: 4)
!1548 = !DILocation(line: 1308, column: 15, scope: !1549)
!1549 = distinct !DILexicalBlock(scope: !1507, file: !69, line: 1307, column: 2)
!1550 = !DILocation(line: 1308, column: 29, scope: !1549)
!1551 = !DILocation(line: 1308, column: 39, scope: !1549)
!1552 = !DILocation(line: 1308, column: 38, scope: !1549)
!1553 = !DILocation(line: 1308, column: 54, scope: !1549)
!1554 = !DILocation(line: 1308, column: 52, scope: !1549)
!1555 = !DILocation(line: 1308, column: 25, scope: !1549)
!1556 = !DILocation(line: 1308, column: 68, scope: !1549)
!1557 = !DILocation(line: 1308, column: 12, scope: !1549)
!1558 = !DILocation(line: 1309, column: 15, scope: !1549)
!1559 = !DILocation(line: 1309, column: 24, scope: !1549)
!1560 = !DILocation(line: 1309, column: 23, scope: !1549)
!1561 = !DILocation(line: 1309, column: 40, scope: !1549)
!1562 = !DILocation(line: 1309, column: 50, scope: !1549)
!1563 = !DILocation(line: 1309, column: 49, scope: !1549)
!1564 = !DILocation(line: 1309, column: 37, scope: !1549)
!1565 = !DILocation(line: 1309, column: 12, scope: !1549)
!1566 = !DILocation(line: 1310, column: 6, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1549, file: !69, line: 1310, column: 6)
!1568 = !DILocation(line: 1310, column: 15, scope: !1567)
!1569 = !DILocation(line: 1310, column: 6, scope: !1549)
!1570 = !DILocation(line: 1312, column: 11, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1567, file: !69, line: 1311, column: 3)
!1572 = !DILocation(line: 1312, column: 4, scope: !1571)
!1573 = !DILocation(line: 1316, column: 4, scope: !1574)
!1574 = distinct !DILexicalBlock(scope: !1567, file: !69, line: 1315, column: 3)
!1575 = !DILocation(line: 1319, column: 1, scope: !1495)
!1576 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1337, type: !1577, scopeLine: 1338, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1577 = !DISubroutineType(types: !1578)
!1578 = !{!21, !21, !516}
!1579 = !DILocalVariable(name: "numerator", arg: 1, scope: !1576, file: !69, line: 1337, type: !21)
!1580 = !DILocation(line: 1337, column: 25, scope: !1576)
!1581 = !DILocalVariable(name: "denominator", arg: 2, scope: !1576, file: !69, line: 1337, type: !516)
!1582 = !DILocation(line: 1337, column: 40, scope: !1576)
!1583 = !DILocalVariable(name: "s32Temp1", scope: !1576, file: !69, line: 1339, type: !21)
!1584 = !DILocation(line: 1339, column: 6, scope: !1576)
!1585 = !DILocalVariable(name: "s32Temp2", scope: !1576, file: !69, line: 1339, type: !21)
!1586 = !DILocation(line: 1339, column: 20, scope: !1576)
!1587 = !DILocalVariable(name: "u32Temp0", scope: !1576, file: !69, line: 1340, type: !516)
!1588 = !DILocation(line: 1340, column: 6, scope: !1576)
!1589 = !DILocalVariable(name: "u32Temp1", scope: !1576, file: !69, line: 1340, type: !516)
!1590 = !DILocation(line: 1340, column: 20, scope: !1576)
!1591 = !DILocalVariable(name: "u32Temp2", scope: !1576, file: !69, line: 1340, type: !516)
!1592 = !DILocation(line: 1340, column: 34, scope: !1576)
!1593 = !DILocation(line: 1341, column: 5, scope: !1594)
!1594 = distinct !DILexicalBlock(scope: !1576, file: !69, line: 1341, column: 5)
!1595 = !DILocation(line: 1341, column: 17, scope: !1594)
!1596 = !DILocation(line: 1341, column: 5, scope: !1576)
!1597 = !DILocation(line: 1343, column: 6, scope: !1598)
!1598 = distinct !DILexicalBlock(scope: !1599, file: !69, line: 1343, column: 6)
!1599 = distinct !DILexicalBlock(scope: !1594, file: !69, line: 1342, column: 2)
!1600 = !DILocation(line: 1343, column: 16, scope: !1598)
!1601 = !DILocation(line: 1343, column: 6, scope: !1599)
!1602 = !DILocation(line: 1345, column: 4, scope: !1603)
!1603 = distinct !DILexicalBlock(scope: !1598, file: !69, line: 1344, column: 3)
!1604 = !DILocation(line: 1349, column: 4, scope: !1605)
!1605 = distinct !DILexicalBlock(scope: !1598, file: !69, line: 1348, column: 3)
!1606 = !DILocation(line: 1354, column: 6, scope: !1607)
!1607 = distinct !DILexicalBlock(scope: !1608, file: !69, line: 1354, column: 6)
!1608 = distinct !DILexicalBlock(scope: !1594, file: !69, line: 1353, column: 2)
!1609 = !DILocation(line: 1354, column: 16, scope: !1607)
!1610 = !DILocation(line: 1354, column: 6, scope: !1608)
!1611 = !DILocation(line: 1356, column: 16, scope: !1612)
!1612 = distinct !DILexicalBlock(scope: !1607, file: !69, line: 1355, column: 3)
!1613 = !DILocation(line: 1356, column: 15, scope: !1612)
!1614 = !DILocation(line: 1356, column: 13, scope: !1612)
!1615 = !DILocation(line: 1357, column: 16, scope: !1612)
!1616 = !DILocation(line: 1357, column: 25, scope: !1612)
!1617 = !DILocation(line: 1357, column: 24, scope: !1612)
!1618 = !DILocation(line: 1357, column: 13, scope: !1612)
!1619 = !DILocation(line: 1358, column: 15, scope: !1612)
!1620 = !DILocation(line: 1358, column: 28, scope: !1612)
!1621 = !DILocation(line: 1358, column: 37, scope: !1612)
!1622 = !DILocation(line: 1358, column: 36, scope: !1612)
!1623 = !DILocation(line: 1358, column: 52, scope: !1612)
!1624 = !DILocation(line: 1358, column: 50, scope: !1612)
!1625 = !DILocation(line: 1358, column: 24, scope: !1612)
!1626 = !DILocation(line: 1358, column: 13, scope: !1612)
!1627 = !DILocation(line: 1360, column: 8, scope: !1628)
!1628 = distinct !DILexicalBlock(scope: !1612, file: !69, line: 1360, column: 7)
!1629 = !DILocation(line: 1360, column: 20, scope: !1628)
!1630 = !DILocation(line: 1360, column: 27, scope: !1628)
!1631 = !DILocation(line: 1360, column: 7, scope: !1612)
!1632 = !DILocation(line: 1362, column: 20, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1628, file: !69, line: 1361, column: 4)
!1634 = !DILocation(line: 1362, column: 32, scope: !1633)
!1635 = !DILocation(line: 1362, column: 17, scope: !1633)
!1636 = !DILocation(line: 1363, column: 4, scope: !1633)
!1637 = !DILocation(line: 1366, column: 20, scope: !1638)
!1638 = distinct !DILexicalBlock(scope: !1628, file: !69, line: 1365, column: 4)
!1639 = !DILocation(line: 1366, column: 32, scope: !1638)
!1640 = !DILocation(line: 1366, column: 38, scope: !1638)
!1641 = !DILocation(line: 1366, column: 17, scope: !1638)
!1642 = !DILocation(line: 1370, column: 7, scope: !1643)
!1643 = distinct !DILexicalBlock(scope: !1612, file: !69, line: 1370, column: 7)
!1644 = !DILocation(line: 1370, column: 18, scope: !1643)
!1645 = !DILocation(line: 1370, column: 16, scope: !1643)
!1646 = !DILocation(line: 1370, column: 7, scope: !1612)
!1647 = !DILocation(line: 1372, column: 14, scope: !1648)
!1648 = distinct !DILexicalBlock(scope: !1643, file: !69, line: 1371, column: 4)
!1649 = !DILocation(line: 1372, column: 13, scope: !1648)
!1650 = !DILocation(line: 1372, column: 23, scope: !1648)
!1651 = !DILocation(line: 1372, column: 5, scope: !1648)
!1652 = !DILocation(line: 1376, column: 14, scope: !1653)
!1653 = distinct !DILexicalBlock(scope: !1643, file: !69, line: 1375, column: 4)
!1654 = !DILocation(line: 1376, column: 23, scope: !1653)
!1655 = !DILocation(line: 1376, column: 12, scope: !1653)
!1656 = !DILocation(line: 1376, column: 27, scope: !1653)
!1657 = !DILocation(line: 1376, column: 5, scope: !1653)
!1658 = !DILocation(line: 1383, column: 16, scope: !1659)
!1659 = distinct !DILexicalBlock(scope: !1607, file: !69, line: 1382, column: 3)
!1660 = !DILocation(line: 1383, column: 30, scope: !1659)
!1661 = !DILocation(line: 1383, column: 40, scope: !1659)
!1662 = !DILocation(line: 1383, column: 39, scope: !1659)
!1663 = !DILocation(line: 1383, column: 55, scope: !1659)
!1664 = !DILocation(line: 1383, column: 53, scope: !1659)
!1665 = !DILocation(line: 1383, column: 26, scope: !1659)
!1666 = !DILocation(line: 1383, column: 69, scope: !1659)
!1667 = !DILocation(line: 1383, column: 13, scope: !1659)
!1668 = !DILocation(line: 1384, column: 16, scope: !1659)
!1669 = !DILocation(line: 1384, column: 26, scope: !1659)
!1670 = !DILocation(line: 1384, column: 25, scope: !1659)
!1671 = !DILocation(line: 1384, column: 42, scope: !1659)
!1672 = !DILocation(line: 1384, column: 51, scope: !1659)
!1673 = !DILocation(line: 1384, column: 50, scope: !1659)
!1674 = !DILocation(line: 1384, column: 39, scope: !1659)
!1675 = !DILocation(line: 1384, column: 13, scope: !1659)
!1676 = !DILocation(line: 1385, column: 11, scope: !1659)
!1677 = !DILocation(line: 1385, column: 4, scope: !1659)
!1678 = !DILocation(line: 1388, column: 1, scope: !1576)
!1679 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1405, type: !1680, scopeLine: 1406, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1680 = !DISubroutineType(types: !1681)
!1681 = !{!21, !21, !21}
!1682 = !DILocalVariable(name: "numerator", arg: 1, scope: !1679, file: !69, line: 1405, type: !21)
!1683 = !DILocation(line: 1405, column: 25, scope: !1679)
!1684 = !DILocalVariable(name: "denominator", arg: 2, scope: !1679, file: !69, line: 1405, type: !21)
!1685 = !DILocation(line: 1405, column: 40, scope: !1679)
!1686 = !DILocalVariable(name: "s32Temp1", scope: !1679, file: !69, line: 1407, type: !21)
!1687 = !DILocation(line: 1407, column: 6, scope: !1679)
!1688 = !DILocalVariable(name: "s32Temp2", scope: !1679, file: !69, line: 1407, type: !21)
!1689 = !DILocation(line: 1407, column: 20, scope: !1679)
!1690 = !DILocalVariable(name: "denominator_prime", scope: !1679, file: !69, line: 1408, type: !516)
!1691 = !DILocation(line: 1408, column: 6, scope: !1679)
!1692 = !DILocalVariable(name: "u32Temp1", scope: !1679, file: !69, line: 1408, type: !516)
!1693 = !DILocation(line: 1408, column: 29, scope: !1679)
!1694 = !DILocalVariable(name: "u32Temp2", scope: !1679, file: !69, line: 1408, type: !516)
!1695 = !DILocation(line: 1408, column: 43, scope: !1679)
!1696 = !DILocalVariable(name: "u32numerator", scope: !1679, file: !69, line: 1409, type: !516)
!1697 = !DILocation(line: 1409, column: 6, scope: !1679)
!1698 = !DILocalVariable(name: "u32denominator", scope: !1679, file: !69, line: 1409, type: !516)
!1699 = !DILocation(line: 1409, column: 23, scope: !1679)
!1700 = !DILocation(line: 1410, column: 5, scope: !1701)
!1701 = distinct !DILexicalBlock(scope: !1679, file: !69, line: 1410, column: 5)
!1702 = !DILocation(line: 1410, column: 15, scope: !1701)
!1703 = !DILocation(line: 1410, column: 5, scope: !1679)
!1704 = !DILocation(line: 1412, column: 6, scope: !1705)
!1705 = distinct !DILexicalBlock(scope: !1706, file: !69, line: 1412, column: 6)
!1706 = distinct !DILexicalBlock(scope: !1701, file: !69, line: 1411, column: 2)
!1707 = !DILocation(line: 1412, column: 18, scope: !1705)
!1708 = !DILocation(line: 1412, column: 6, scope: !1706)
!1709 = !DILocation(line: 1414, column: 7, scope: !1710)
!1710 = distinct !DILexicalBlock(scope: !1711, file: !69, line: 1414, column: 7)
!1711 = distinct !DILexicalBlock(scope: !1705, file: !69, line: 1413, column: 3)
!1712 = !DILocation(line: 1414, column: 19, scope: !1710)
!1713 = !DILocation(line: 1414, column: 7, scope: !1711)
!1714 = !DILocation(line: 1416, column: 5, scope: !1715)
!1715 = distinct !DILexicalBlock(scope: !1710, file: !69, line: 1415, column: 4)
!1716 = !DILocation(line: 1420, column: 21, scope: !1717)
!1717 = distinct !DILexicalBlock(scope: !1710, file: !69, line: 1419, column: 4)
!1718 = !DILocation(line: 1420, column: 20, scope: !1717)
!1719 = !DILocation(line: 1420, column: 18, scope: !1717)
!1720 = !DILocation(line: 1421, column: 23, scope: !1717)
!1721 = !DILocation(line: 1421, column: 22, scope: !1717)
!1722 = !DILocation(line: 1421, column: 20, scope: !1717)
!1723 = !DILocation(line: 1422, column: 16, scope: !1717)
!1724 = !DILocation(line: 1422, column: 33, scope: !1717)
!1725 = !DILocation(line: 1422, column: 46, scope: !1717)
!1726 = !DILocation(line: 1422, column: 45, scope: !1717)
!1727 = !DILocation(line: 1422, column: 64, scope: !1717)
!1728 = !DILocation(line: 1422, column: 62, scope: !1717)
!1729 = !DILocation(line: 1422, column: 29, scope: !1717)
!1730 = !DILocation(line: 1422, column: 81, scope: !1717)
!1731 = !DILocation(line: 1422, column: 14, scope: !1717)
!1732 = !DILocation(line: 1423, column: 17, scope: !1717)
!1733 = !DILocation(line: 1423, column: 30, scope: !1717)
!1734 = !DILocation(line: 1423, column: 29, scope: !1717)
!1735 = !DILocation(line: 1423, column: 49, scope: !1717)
!1736 = !DILocation(line: 1423, column: 58, scope: !1717)
!1737 = !DILocation(line: 1423, column: 57, scope: !1717)
!1738 = !DILocation(line: 1423, column: 46, scope: !1717)
!1739 = !DILocation(line: 1423, column: 14, scope: !1717)
!1740 = !DILocation(line: 1424, column: 8, scope: !1741)
!1741 = distinct !DILexicalBlock(scope: !1717, file: !69, line: 1424, column: 8)
!1742 = !DILocation(line: 1424, column: 17, scope: !1741)
!1743 = !DILocation(line: 1424, column: 8, scope: !1717)
!1744 = !DILocation(line: 1426, column: 13, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1741, file: !69, line: 1425, column: 5)
!1746 = !DILocation(line: 1426, column: 6, scope: !1745)
!1747 = !DILocation(line: 1430, column: 6, scope: !1748)
!1748 = distinct !DILexicalBlock(scope: !1741, file: !69, line: 1429, column: 5)
!1749 = !DILocation(line: 1436, column: 20, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1705, file: !69, line: 1435, column: 3)
!1751 = !DILocation(line: 1436, column: 19, scope: !1750)
!1752 = !DILocation(line: 1436, column: 29, scope: !1750)
!1753 = !DILocation(line: 1436, column: 17, scope: !1750)
!1754 = !DILocation(line: 1437, column: 16, scope: !1750)
!1755 = !DILocation(line: 1437, column: 33, scope: !1750)
!1756 = !DILocation(line: 1437, column: 46, scope: !1750)
!1757 = !DILocation(line: 1437, column: 45, scope: !1750)
!1758 = !DILocation(line: 1437, column: 61, scope: !1750)
!1759 = !DILocation(line: 1437, column: 59, scope: !1750)
!1760 = !DILocation(line: 1437, column: 29, scope: !1750)
!1761 = !DILocation(line: 1437, column: 75, scope: !1750)
!1762 = !DILocation(line: 1437, column: 13, scope: !1750)
!1763 = !DILocation(line: 1438, column: 16, scope: !1750)
!1764 = !DILocation(line: 1438, column: 29, scope: !1750)
!1765 = !DILocation(line: 1438, column: 28, scope: !1750)
!1766 = !DILocation(line: 1438, column: 45, scope: !1750)
!1767 = !DILocation(line: 1438, column: 54, scope: !1750)
!1768 = !DILocation(line: 1438, column: 53, scope: !1750)
!1769 = !DILocation(line: 1438, column: 42, scope: !1750)
!1770 = !DILocation(line: 1438, column: 13, scope: !1750)
!1771 = !DILocation(line: 1439, column: 13, scope: !1750)
!1772 = !DILocation(line: 1439, column: 12, scope: !1750)
!1773 = !DILocation(line: 1439, column: 22, scope: !1750)
!1774 = !DILocation(line: 1439, column: 4, scope: !1750)
!1775 = !DILocation(line: 1444, column: 6, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1777, file: !69, line: 1444, column: 6)
!1777 = distinct !DILexicalBlock(scope: !1701, file: !69, line: 1443, column: 2)
!1778 = !DILocation(line: 1444, column: 18, scope: !1776)
!1779 = !DILocation(line: 1444, column: 6, scope: !1777)
!1780 = !DILocation(line: 1446, column: 7, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1782, file: !69, line: 1446, column: 7)
!1782 = distinct !DILexicalBlock(scope: !1776, file: !69, line: 1445, column: 3)
!1783 = !DILocation(line: 1446, column: 19, scope: !1781)
!1784 = !DILocation(line: 1446, column: 7, scope: !1782)
!1785 = !DILocation(line: 1448, column: 5, scope: !1786)
!1786 = distinct !DILexicalBlock(scope: !1781, file: !69, line: 1447, column: 4)
!1787 = !DILocation(line: 1452, column: 23, scope: !1788)
!1788 = distinct !DILexicalBlock(scope: !1781, file: !69, line: 1451, column: 4)
!1789 = !DILocation(line: 1452, column: 22, scope: !1788)
!1790 = !DILocation(line: 1452, column: 35, scope: !1788)
!1791 = !DILocation(line: 1452, column: 20, scope: !1788)
!1792 = !DILocation(line: 1453, column: 17, scope: !1788)
!1793 = !DILocation(line: 1453, column: 31, scope: !1788)
!1794 = !DILocation(line: 1453, column: 41, scope: !1788)
!1795 = !DILocation(line: 1453, column: 40, scope: !1788)
!1796 = !DILocation(line: 1453, column: 59, scope: !1788)
!1797 = !DILocation(line: 1453, column: 57, scope: !1788)
!1798 = !DILocation(line: 1453, column: 27, scope: !1788)
!1799 = !DILocation(line: 1453, column: 76, scope: !1788)
!1800 = !DILocation(line: 1453, column: 14, scope: !1788)
!1801 = !DILocation(line: 1454, column: 17, scope: !1788)
!1802 = !DILocation(line: 1454, column: 27, scope: !1788)
!1803 = !DILocation(line: 1454, column: 26, scope: !1788)
!1804 = !DILocation(line: 1454, column: 46, scope: !1788)
!1805 = !DILocation(line: 1454, column: 55, scope: !1788)
!1806 = !DILocation(line: 1454, column: 54, scope: !1788)
!1807 = !DILocation(line: 1454, column: 43, scope: !1788)
!1808 = !DILocation(line: 1454, column: 14, scope: !1788)
!1809 = !DILocation(line: 1455, column: 14, scope: !1788)
!1810 = !DILocation(line: 1455, column: 13, scope: !1788)
!1811 = !DILocation(line: 1455, column: 23, scope: !1788)
!1812 = !DILocation(line: 1455, column: 5, scope: !1788)
!1813 = !DILocation(line: 1460, column: 16, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1776, file: !69, line: 1459, column: 3)
!1815 = !DILocation(line: 1460, column: 30, scope: !1814)
!1816 = !DILocation(line: 1460, column: 40, scope: !1814)
!1817 = !DILocation(line: 1460, column: 39, scope: !1814)
!1818 = !DILocation(line: 1460, column: 55, scope: !1814)
!1819 = !DILocation(line: 1460, column: 53, scope: !1814)
!1820 = !DILocation(line: 1460, column: 26, scope: !1814)
!1821 = !DILocation(line: 1460, column: 69, scope: !1814)
!1822 = !DILocation(line: 1460, column: 13, scope: !1814)
!1823 = !DILocation(line: 1461, column: 16, scope: !1814)
!1824 = !DILocation(line: 1461, column: 26, scope: !1814)
!1825 = !DILocation(line: 1461, column: 25, scope: !1814)
!1826 = !DILocation(line: 1461, column: 42, scope: !1814)
!1827 = !DILocation(line: 1461, column: 51, scope: !1814)
!1828 = !DILocation(line: 1461, column: 50, scope: !1814)
!1829 = !DILocation(line: 1461, column: 39, scope: !1814)
!1830 = !DILocation(line: 1461, column: 13, scope: !1814)
!1831 = !DILocation(line: 1462, column: 11, scope: !1814)
!1832 = !DILocation(line: 1462, column: 4, scope: !1814)
!1833 = !DILocation(line: 1465, column: 1, scope: !1679)
!1834 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1483, type: !1835, scopeLine: 1484, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1835 = !DISubroutineType(types: !1836)
!1836 = !{!6, !21, !516}
!1837 = !DILocalVariable(name: "numerator", arg: 1, scope: !1834, file: !69, line: 1483, type: !21)
!1838 = !DILocation(line: 1483, column: 25, scope: !1834)
!1839 = !DILocalVariable(name: "denominator", arg: 2, scope: !1834, file: !69, line: 1483, type: !516)
!1840 = !DILocation(line: 1483, column: 40, scope: !1834)
!1841 = !DILocalVariable(name: "numerator_prime", scope: !1834, file: !69, line: 1486, type: !516)
!1842 = !DILocation(line: 1486, column: 6, scope: !1834)
!1843 = !DILocalVariable(name: "u32Temp1", scope: !1834, file: !69, line: 1486, type: !516)
!1844 = !DILocation(line: 1486, column: 27, scope: !1834)
!1845 = !DILocalVariable(name: "u32Temp2", scope: !1834, file: !69, line: 1486, type: !516)
!1846 = !DILocation(line: 1486, column: 41, scope: !1834)
!1847 = !DILocalVariable(name: "u32Temp3", scope: !1834, file: !69, line: 1486, type: !516)
!1848 = !DILocation(line: 1486, column: 55, scope: !1834)
!1849 = !DILocalVariable(name: "s32Temp1", scope: !1834, file: !69, line: 1487, type: !21)
!1850 = !DILocation(line: 1487, column: 6, scope: !1834)
!1851 = !DILocalVariable(name: "s32Temp2", scope: !1834, file: !69, line: 1487, type: !21)
!1852 = !DILocation(line: 1487, column: 20, scope: !1834)
!1853 = !DILocalVariable(name: "s32Temp3", scope: !1834, file: !69, line: 1487, type: !21)
!1854 = !DILocation(line: 1487, column: 34, scope: !1834)
!1855 = !DILocation(line: 1488, column: 5, scope: !1856)
!1856 = distinct !DILexicalBlock(scope: !1834, file: !69, line: 1488, column: 5)
!1857 = !DILocation(line: 1488, column: 17, scope: !1856)
!1858 = !DILocation(line: 1488, column: 5, scope: !1834)
!1859 = !DILocation(line: 1490, column: 6, scope: !1860)
!1860 = distinct !DILexicalBlock(scope: !1861, file: !69, line: 1490, column: 6)
!1861 = distinct !DILexicalBlock(scope: !1856, file: !69, line: 1489, column: 2)
!1862 = !DILocation(line: 1490, column: 15, scope: !1860)
!1863 = !DILocation(line: 1490, column: 6, scope: !1861)
!1864 = !DILocation(line: 1492, column: 4, scope: !1865)
!1865 = distinct !DILexicalBlock(scope: !1860, file: !69, line: 1491, column: 3)
!1866 = !DILocation(line: 1496, column: 4, scope: !1867)
!1867 = distinct !DILexicalBlock(scope: !1860, file: !69, line: 1495, column: 3)
!1868 = !DILocation(line: 1501, column: 6, scope: !1869)
!1869 = distinct !DILexicalBlock(scope: !1870, file: !69, line: 1501, column: 6)
!1870 = distinct !DILexicalBlock(scope: !1856, file: !69, line: 1500, column: 2)
!1871 = !DILocation(line: 1501, column: 16, scope: !1869)
!1872 = !DILocation(line: 1501, column: 6, scope: !1870)
!1873 = !DILocation(line: 1503, column: 23, scope: !1874)
!1874 = distinct !DILexicalBlock(scope: !1869, file: !69, line: 1502, column: 3)
!1875 = !DILocation(line: 1503, column: 22, scope: !1874)
!1876 = !DILocation(line: 1503, column: 20, scope: !1874)
!1877 = !DILocation(line: 1504, column: 16, scope: !1874)
!1878 = !DILocation(line: 1504, column: 32, scope: !1874)
!1879 = !DILocation(line: 1504, column: 31, scope: !1874)
!1880 = !DILocation(line: 1504, column: 13, scope: !1874)
!1881 = !DILocation(line: 1505, column: 15, scope: !1874)
!1882 = !DILocation(line: 1505, column: 34, scope: !1874)
!1883 = !DILocation(line: 1505, column: 45, scope: !1874)
!1884 = !DILocation(line: 1505, column: 43, scope: !1874)
!1885 = !DILocation(line: 1505, column: 31, scope: !1874)
!1886 = !DILocation(line: 1505, column: 13, scope: !1874)
!1887 = !DILocation(line: 1507, column: 8, scope: !1888)
!1888 = distinct !DILexicalBlock(scope: !1874, file: !69, line: 1507, column: 7)
!1889 = !DILocation(line: 1507, column: 20, scope: !1888)
!1890 = !DILocation(line: 1507, column: 27, scope: !1888)
!1891 = !DILocation(line: 1507, column: 7, scope: !1874)
!1892 = !DILocation(line: 1509, column: 19, scope: !1893)
!1893 = distinct !DILexicalBlock(scope: !1888, file: !69, line: 1508, column: 4)
!1894 = !DILocation(line: 1509, column: 31, scope: !1893)
!1895 = !DILocation(line: 1509, column: 17, scope: !1893)
!1896 = !DILocation(line: 1510, column: 4, scope: !1893)
!1897 = !DILocation(line: 1513, column: 20, scope: !1898)
!1898 = distinct !DILexicalBlock(scope: !1888, file: !69, line: 1512, column: 4)
!1899 = !DILocation(line: 1513, column: 32, scope: !1898)
!1900 = !DILocation(line: 1513, column: 38, scope: !1898)
!1901 = !DILocation(line: 1513, column: 17, scope: !1898)
!1902 = !DILocation(line: 1516, column: 7, scope: !1903)
!1903 = distinct !DILexicalBlock(scope: !1874, file: !69, line: 1516, column: 7)
!1904 = !DILocation(line: 1516, column: 18, scope: !1903)
!1905 = !DILocation(line: 1516, column: 16, scope: !1903)
!1906 = !DILocation(line: 1516, column: 7, scope: !1874)
!1907 = !DILocation(line: 1518, column: 18, scope: !1908)
!1908 = distinct !DILexicalBlock(scope: !1903, file: !69, line: 1517, column: 4)
!1909 = !DILocation(line: 1518, column: 16, scope: !1908)
!1910 = !DILocation(line: 1518, column: 28, scope: !1908)
!1911 = !DILocation(line: 1518, column: 14, scope: !1908)
!1912 = !DILocation(line: 1519, column: 4, scope: !1908)
!1913 = !DILocation(line: 1522, column: 18, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1903, file: !69, line: 1521, column: 4)
!1915 = !DILocation(line: 1522, column: 26, scope: !1914)
!1916 = !DILocation(line: 1522, column: 16, scope: !1914)
!1917 = !DILocation(line: 1522, column: 30, scope: !1914)
!1918 = !DILocation(line: 1522, column: 14, scope: !1914)
!1919 = !DILocation(line: 1524, column: 8, scope: !1920)
!1920 = distinct !DILexicalBlock(scope: !1874, file: !69, line: 1524, column: 7)
!1921 = !DILocation(line: 1524, column: 18, scope: !1920)
!1922 = !DILocation(line: 1524, column: 7, scope: !1874)
!1923 = !DILocation(line: 1526, column: 18, scope: !1924)
!1924 = distinct !DILexicalBlock(scope: !1920, file: !69, line: 1525, column: 4)
!1925 = !DILocation(line: 1526, column: 12, scope: !1924)
!1926 = !DILocation(line: 1526, column: 5, scope: !1924)
!1927 = !DILocation(line: 1530, column: 5, scope: !1928)
!1928 = distinct !DILexicalBlock(scope: !1920, file: !69, line: 1529, column: 4)
!1929 = !DILocation(line: 1535, column: 16, scope: !1930)
!1930 = distinct !DILexicalBlock(scope: !1869, file: !69, line: 1534, column: 3)
!1931 = !DILocation(line: 1535, column: 26, scope: !1930)
!1932 = !DILocation(line: 1535, column: 25, scope: !1930)
!1933 = !DILocation(line: 1535, column: 41, scope: !1930)
!1934 = !DILocation(line: 1535, column: 39, scope: !1930)
!1935 = !DILocation(line: 1535, column: 13, scope: !1930)
!1936 = !DILocation(line: 1536, column: 16, scope: !1930)
!1937 = !DILocation(line: 1536, column: 30, scope: !1930)
!1938 = !DILocation(line: 1536, column: 40, scope: !1930)
!1939 = !DILocation(line: 1536, column: 39, scope: !1930)
!1940 = !DILocation(line: 1536, column: 55, scope: !1930)
!1941 = !DILocation(line: 1536, column: 53, scope: !1930)
!1942 = !DILocation(line: 1536, column: 26, scope: !1930)
!1943 = !DILocation(line: 1536, column: 68, scope: !1930)
!1944 = !DILocation(line: 1536, column: 13, scope: !1930)
!1945 = !DILocation(line: 1537, column: 16, scope: !1930)
!1946 = !DILocation(line: 1537, column: 25, scope: !1930)
!1947 = !DILocation(line: 1537, column: 24, scope: !1930)
!1948 = !DILocation(line: 1537, column: 41, scope: !1930)
!1949 = !DILocation(line: 1537, column: 51, scope: !1930)
!1950 = !DILocation(line: 1537, column: 50, scope: !1930)
!1951 = !DILocation(line: 1537, column: 38, scope: !1930)
!1952 = !DILocation(line: 1537, column: 13, scope: !1930)
!1953 = !DILocation(line: 1538, column: 7, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1930, file: !69, line: 1538, column: 7)
!1955 = !DILocation(line: 1538, column: 16, scope: !1954)
!1956 = !DILocation(line: 1538, column: 7, scope: !1930)
!1957 = !DILocation(line: 1540, column: 17, scope: !1958)
!1958 = distinct !DILexicalBlock(scope: !1954, file: !69, line: 1539, column: 4)
!1959 = !DILocation(line: 1540, column: 12, scope: !1958)
!1960 = !DILocation(line: 1540, column: 5, scope: !1958)
!1961 = !DILocation(line: 1544, column: 5, scope: !1962)
!1962 = distinct !DILexicalBlock(scope: !1954, file: !69, line: 1543, column: 4)
!1963 = !DILocation(line: 1548, column: 1, scope: !1834)
!1964 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1965, file: !1965, line: 12, type: !1966, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !1969)
!1965 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1966 = !DISubroutineType(types: !1967)
!1967 = !{null, !1968}
!1968 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1969 = !{!1970}
!1970 = !DILocalVariable(name: "z", arg: 1, scope: !1964, file: !1965, line: 12, type: !1968)
!1971 = !DILocation(line: 0, scope: !1964)
!1972 = !DILocation(line: 13, column: 9, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1964, file: !1965, line: 13, column: 7)
!1974 = !DILocation(line: 13, column: 7, scope: !1964)
!1975 = !DILocation(line: 14, column: 5, scope: !1973)
!1976 = !DILocation(line: 15, column: 1, scope: !1964)
!1977 = distinct !DISubprogram(name: "klee_overshift_check", scope: !1978, file: !1978, line: 20, type: !1979, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !1982)
!1978 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!1979 = !DISubroutineType(types: !1980)
!1980 = !{null, !1981, !1981}
!1981 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!1982 = !{!1983, !1984}
!1983 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !1977, file: !1978, line: 20, type: !1981)
!1984 = !DILocalVariable(name: "shift", arg: 2, scope: !1977, file: !1978, line: 20, type: !1981)
!1985 = !DILocation(line: 0, scope: !1977)
!1986 = !DILocation(line: 21, column: 13, scope: !1987)
!1987 = distinct !DILexicalBlock(scope: !1977, file: !1978, line: 21, column: 7)
!1988 = !DILocation(line: 21, column: 7, scope: !1977)
!1989 = !DILocation(line: 27, column: 5, scope: !1990)
!1990 = distinct !DILexicalBlock(scope: !1987, file: !1978, line: 21, column: 26)
!1991 = !DILocation(line: 29, column: 1, scope: !1977)
