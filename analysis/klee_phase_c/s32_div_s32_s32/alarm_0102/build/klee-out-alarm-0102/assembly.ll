; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0102/build/s32_div_s32_s32_alarm_0102.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [132 x i8] c"KLEE-ALARM-0102: signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0102.err\00", align 1
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
  %denominator = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %denominator, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i32* %result, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = bitcast i32* %numerator to i8*, !dbg !58
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !59
  %1 = bitcast i32* %denominator to i8*, !dbg !60
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  %2 = load i32, i32* %numerator, align 4, !dbg !62
  %3 = load i32, i32* %denominator, align 4, !dbg !63
  %call = call i32 @s32_div_s32_s32(i32 %2, i32 %3), !dbg !64
  store i32 %call, i32* %result, align 4, !dbg !65
  %4 = load i32, i32* %result, align 4, !dbg !66
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
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !427, metadata !DIExpression()), !dbg !429
  store i32 0, i32* %u32Temp1, align 4, !dbg !429
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !430, metadata !DIExpression()), !dbg !431
  store i32 0, i32* %u32Temp2, align 4, !dbg !431
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !432, metadata !DIExpression()), !dbg !433
  store i32 0, i32* %u32Temp3, align 4, !dbg !433
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !434
  %conv = zext i16 %0 to i32, !dbg !434
  %cmp = icmp eq i32 %conv, 0, !dbg !436
  br i1 %cmp, label %if.then, label %if.else, !dbg !437

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !438
  br label %return, !dbg !438

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !440
  %conv2 = zext i16 %1 to i32, !dbg !440
  %shl = shl i32 %conv2, 16, !dbg !442
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !443
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !444
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !445
  %conv3 = zext i16 %3 to i32, !dbg !445
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !446
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !446
  %div = udiv i32 %2, %conv3, !dbg !446, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !447
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !448
  %add = add i32 %4, 128, !dbg !449
  %shr = lshr i32 %add, 8, !dbg !450
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !451
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !452
  %cmp4 = icmp ult i32 %5, 255, !dbg !454
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !455

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !456
  %conv7 = trunc i32 %6 to i8, !dbg !458
  store i8 %conv7, i8* %retval, align 1, !dbg !459
  br label %return, !dbg !459

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !460
  br label %return, !dbg !460

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !462
  ret i8 %7, !dbg !462
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !463 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !466, metadata !DIExpression()), !dbg !467
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !468, metadata !DIExpression()), !dbg !469
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !470, metadata !DIExpression()), !dbg !471
  store i32 0, i32* %s32Temp1, align 4, !dbg !471
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !472
  %conv = zext i16 %0 to i32, !dbg !472
  %and = and i32 %conv, 65535, !dbg !473
  %conv1 = trunc i32 %and to i16, !dbg !472
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !474
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !475
  %conv2 = zext i16 %1 to i32, !dbg !475
  %and3 = and i32 %conv2, 65535, !dbg !477
  %cmp = icmp eq i32 %and3, 0, !dbg !478
  br i1 %cmp, label %if.then, label %if.else8, !dbg !479

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !480
  %cmp5 = icmp sge i32 %2, 0, !dbg !483
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !484

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !485
  br label %return, !dbg !485

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !487
  br label %return, !dbg !487

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !489
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !491
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !492
  %conv9 = zext i16 %5 to i32, !dbg !492
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !493
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !493
  %div = sdiv i32 %4, %conv9, !dbg !493, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !494
  %conv10 = zext i16 %6 to i32, !dbg !494
  %mul = mul nsw i32 %div, %conv10, !dbg !495
  %sub = sub nsw i32 %3, %mul, !dbg !496
  %shl = shl i32 %sub, 1, !dbg !497
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !498
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !499
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !500
  %conv11 = zext i16 %8 to i32, !dbg !500
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !501
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !501
  %div12 = sdiv i32 %7, %conv11, !dbg !501, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !502
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !503
  %conv13 = zext i16 %10 to i32, !dbg !503
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !504
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !504
  %div14 = sdiv i32 %9, %conv13, !dbg !504, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !505
  store i32 %add, i32* %s32Temp1, align 4, !dbg !506
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !507
  %cmp15 = icmp slt i32 %11, 65535, !dbg !509
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !510

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !511
  %cmp18 = icmp sgt i32 %12, 0, !dbg !514
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !515

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !516
  %conv21 = trunc i32 %13 to i16, !dbg !518
  store i16 %conv21, i16* %retval, align 2, !dbg !519
  br label %return, !dbg !519

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !520
  br label %return, !dbg !520

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !522
  br label %return, !dbg !522

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !524
  ret i16 %14, !dbg !524
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !525 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !528, metadata !DIExpression()), !dbg !529
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !530, metadata !DIExpression()), !dbg !531
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !532, metadata !DIExpression()), !dbg !533
  store i32 0, i32* %u32Temp, align 4, !dbg !533
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !534
  %conv = zext i16 %0 to i32, !dbg !534
  %cmp = icmp eq i32 %conv, 0, !dbg !536
  br i1 %cmp, label %if.then, label %if.else, !dbg !537

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !538
  br label %return, !dbg !538

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !540
  %conv2 = zext i16 %1 to i32, !dbg !540
  %shl = shl i32 %conv2, 16, !dbg !542
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !543
  %conv3 = zext i16 %2 to i32, !dbg !543
  %shr = ashr i32 %conv3, 1, !dbg !544
  %add = add nsw i32 %shl, %shr, !dbg !545
  store i32 %add, i32* %u32Temp, align 4, !dbg !546
  %3 = load i32, i32* %u32Temp, align 4, !dbg !547
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !548
  %conv4 = zext i16 %4 to i32, !dbg !548
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !549
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !549
  %div = udiv i32 %3, %conv4, !dbg !549, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !550
  %5 = load i32, i32* %u32Temp, align 4, !dbg !551
  %cmp5 = icmp ult i32 %5, 65535, !dbg !553
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !554

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !555
  %and = and i32 %6, 65535, !dbg !557
  %conv8 = trunc i32 %and to i16, !dbg !555
  store i16 %conv8, i16* %retval, align 2, !dbg !558
  br label %return, !dbg !558

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !559
  br label %return, !dbg !559

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !561
  ret i16 %7, !dbg !561
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !562 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !565, metadata !DIExpression()), !dbg !566
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !567, metadata !DIExpression()), !dbg !568
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !569, metadata !DIExpression()), !dbg !570
  store i32 0, i32* %u32Temp1, align 4, !dbg !570
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !571, metadata !DIExpression()), !dbg !572
  store i32 0, i32* %u32Temp2, align 4, !dbg !572
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !573
  %conv = zext i16 %0 to i32, !dbg !573
  %and = and i32 %conv, 65535, !dbg !574
  %conv1 = trunc i32 %and to i16, !dbg !573
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !575
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !576
  %conv2 = zext i16 %1 to i32, !dbg !576
  %cmp = icmp eq i32 %conv2, 0, !dbg !578
  br i1 %cmp, label %if.then, label %if.else, !dbg !579

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !580
  br label %return, !dbg !580

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !582
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !584
  %conv4 = zext i16 %3 to i32, !dbg !584
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !585
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !585
  %div = udiv i32 %2, %conv4, !dbg !585, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !586
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !587
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !588
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !589
  %conv5 = zext i16 %6 to i32, !dbg !589
  %mul = mul i32 %5, %conv5, !dbg !590
  %sub = sub i32 %4, %mul, !dbg !591
  %shl = shl i32 %sub, 1, !dbg !592
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !593
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !594
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !595
  %conv6 = zext i16 %8 to i32, !dbg !595
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !596
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !596
  %div7 = udiv i32 %7, %conv6, !dbg !596, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !597
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !598
  %conv8 = zext i16 %10 to i32, !dbg !598
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !599
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !599
  %div9 = udiv i32 %9, %conv8, !dbg !599, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !600
  store i32 %add, i32* %u32Temp2, align 4, !dbg !601
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !602
  %cmp10 = icmp ult i32 %11, 65535, !dbg !604
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !605

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !606
  %and13 = and i32 %12, 65535, !dbg !608
  %conv14 = trunc i32 %and13 to i16, !dbg !606
  store i16 %conv14, i16* %retval, align 2, !dbg !609
  br label %return, !dbg !609

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !610
  br label %return, !dbg !610

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !612
  ret i16 %13, !dbg !612
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !613 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !616, metadata !DIExpression()), !dbg !617
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !618, metadata !DIExpression()), !dbg !619
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !620, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !622, metadata !DIExpression()), !dbg !623
  store i32 0, i32* %s32Result, align 4, !dbg !623
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !624, metadata !DIExpression()), !dbg !625
  store i32 0, i32* %s32Temp1, align 4, !dbg !625
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !626
  %conv = sext i16 %0 to i32, !dbg !626
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !627
  %conv1 = zext i16 %1 to i32, !dbg !627
  %mul = mul nsw i32 %conv, %conv1, !dbg !628
  store i32 %mul, i32* %s32Result, align 4, !dbg !629
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !630
  %conv2 = sext i16 %2 to i32, !dbg !630
  %cmp = icmp eq i32 %conv2, 0, !dbg !632
  br i1 %cmp, label %if.then, label %if.else7, !dbg !633

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !634
  %cmp4 = icmp slt i32 %3, 0, !dbg !637
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !638

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !639
  br label %return, !dbg !639

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !641
  br label %return, !dbg !641

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !643
  %5 = load i32, i32* %s32Result, align 4, !dbg !645
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !646
  %conv8 = sext i16 %6 to i32, !dbg !646
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !647
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !647
  %div = sdiv i32 %5, %conv8, !dbg !647, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !648
  %conv9 = sext i16 %7 to i32, !dbg !648
  %mul10 = mul nsw i32 %div, %conv9, !dbg !649
  %sub = sub nsw i32 %4, %mul10, !dbg !650
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !651
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !652
  %shl = shl i32 %8, 1, !dbg !653
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !654
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !655
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !656
  %conv11 = sext i16 %10 to i32, !dbg !656
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !657
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !657
  %div12 = sdiv i32 %9, %conv11, !dbg !657, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !658
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !659
  %conv13 = sext i16 %12 to i32, !dbg !659
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !660
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !660
  %div14 = sdiv i32 %11, %conv13, !dbg !660, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !661
  store i32 %add, i32* %s32Result, align 4, !dbg !662
  %13 = load i32, i32* %s32Result, align 4, !dbg !663
  %cmp15 = icmp slt i32 %13, 32767, !dbg !665
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !666

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !667
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !670
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !671

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !672
  %conv21 = trunc i32 %15 to i16, !dbg !674
  store i16 %conv21, i16* %retval, align 2, !dbg !675
  br label %return, !dbg !675

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !676
  br label %return, !dbg !676

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !678
  br label %return, !dbg !678

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !680
  ret i16 %16, !dbg !680
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !681 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !684, metadata !DIExpression()), !dbg !685
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !686, metadata !DIExpression()), !dbg !687
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !688, metadata !DIExpression()), !dbg !689
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !690, metadata !DIExpression()), !dbg !691
  store i32 0, i32* %s32Result, align 4, !dbg !691
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !692, metadata !DIExpression()), !dbg !693
  store i32 0, i32* %s32Temp1, align 4, !dbg !693
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !694
  %conv = zext i16 %0 to i32, !dbg !694
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !695
  %conv1 = sext i16 %1 to i32, !dbg !695
  %mul = mul nsw i32 %conv, %conv1, !dbg !696
  store i32 %mul, i32* %s32Result, align 4, !dbg !697
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !698
  %conv2 = zext i16 %2 to i32, !dbg !698
  %cmp = icmp eq i32 %conv2, 0, !dbg !700
  br i1 %cmp, label %if.then, label %if.else7, !dbg !701

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !702
  %cmp4 = icmp slt i32 %3, 0, !dbg !705
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !706

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !707
  br label %return, !dbg !707

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !709
  br label %return, !dbg !709

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !711
  %5 = load i32, i32* %s32Result, align 4, !dbg !713
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !714
  %conv8 = zext i16 %6 to i32, !dbg !714
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !715
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !715
  %div = sdiv i32 %5, %conv8, !dbg !715, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !716
  %conv9 = zext i16 %7 to i32, !dbg !716
  %mul10 = mul nsw i32 %div, %conv9, !dbg !717
  %sub = sub nsw i32 %4, %mul10, !dbg !718
  %shl = shl i32 %sub, 1, !dbg !719
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !720
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !721
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !722
  %conv11 = zext i16 %9 to i32, !dbg !722
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !723
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !723
  %div12 = sdiv i32 %8, %conv11, !dbg !723, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !724
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !725
  %conv13 = zext i16 %11 to i32, !dbg !725
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !726
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !726
  %div14 = sdiv i32 %10, %conv13, !dbg !726, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !727
  store i32 %add, i32* %s32Result, align 4, !dbg !728
  %12 = load i32, i32* %s32Result, align 4, !dbg !729
  %cmp15 = icmp slt i32 %12, 32767, !dbg !731
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !732

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !733
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !736
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !737

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !738
  %conv21 = trunc i32 %14 to i16, !dbg !740
  store i16 %conv21, i16* %retval, align 2, !dbg !741
  br label %return, !dbg !741

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !742
  br label %return, !dbg !742

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !744
  br label %return, !dbg !744

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !746
  ret i16 %15, !dbg !746
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !747 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !750, metadata !DIExpression()), !dbg !751
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !752, metadata !DIExpression()), !dbg !753
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !754, metadata !DIExpression()), !dbg !755
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !756, metadata !DIExpression()), !dbg !757
  store i32 0, i32* %u32Result, align 4, !dbg !757
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !758, metadata !DIExpression()), !dbg !759
  store i32 0, i32* %u32Temp1, align 4, !dbg !759
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !760, metadata !DIExpression()), !dbg !761
  store i32 0, i32* %s32Result, align 4, !dbg !761
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !762, metadata !DIExpression()), !dbg !763
  store i32 0, i32* %s32Temp1, align 4, !dbg !763
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !764
  %conv = sext i16 %0 to i32, !dbg !764
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !765
  %conv1 = zext i16 %1 to i32, !dbg !765
  %mul = mul nsw i32 %conv, %conv1, !dbg !766
  store i32 %mul, i32* %s32Result, align 4, !dbg !767
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !768
  %conv2 = sext i16 %2 to i32, !dbg !768
  %cmp = icmp eq i32 %conv2, 0, !dbg !770
  br i1 %cmp, label %if.then, label %if.else7, !dbg !771

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !772
  %cmp4 = icmp sge i32 %3, 0, !dbg !775
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !776

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !777
  br label %return, !dbg !777

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !779
  br label %return, !dbg !779

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !781
  %5 = load i32, i32* %s32Result, align 4, !dbg !783
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !784
  %conv8 = sext i16 %6 to i32, !dbg !784
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !785
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !785
  %div = sdiv i32 %5, %conv8, !dbg !785, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !786
  %conv9 = sext i16 %7 to i32, !dbg !786
  %mul10 = mul nsw i32 %div, %conv9, !dbg !787
  %sub = sub nsw i32 %4, %mul10, !dbg !788
  %shl = shl i32 %sub, 1, !dbg !789
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !790
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !791
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !792
  %conv11 = sext i16 %9 to i32, !dbg !792
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !793
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !793
  %div12 = sdiv i32 %8, %conv11, !dbg !793, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !794
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !795
  %conv13 = sext i16 %11 to i32, !dbg !795
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !796
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !796
  %div14 = sdiv i32 %10, %conv13, !dbg !796, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !797
  store i32 %add, i32* %s32Result, align 4, !dbg !798
  %12 = load i32, i32* %s32Result, align 4, !dbg !799
  %cmp15 = icmp slt i32 %12, 65535, !dbg !801
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !802

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !803
  %cmp18 = icmp sgt i32 %13, 0, !dbg !806
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !807

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !808
  %conv21 = trunc i32 %14 to i16, !dbg !810
  store i16 %conv21, i16* %retval, align 2, !dbg !811
  br label %return, !dbg !811

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !812
  br label %return, !dbg !812

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !814
  br label %return, !dbg !814

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !816
  ret i16 %15, !dbg !816
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !817 {
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
  %conv2 = zext i16 %2 to i32, !dbg !834
  %cmp = icmp eq i32 %conv2, 0, !dbg !836
  br i1 %cmp, label %if.then, label %if.else7, !dbg !837

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !838
  %cmp4 = icmp sge i32 %3, 0, !dbg !841
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !842

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !843
  br label %return, !dbg !843

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !845
  br label %return, !dbg !845

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !847
  %5 = load i32, i32* %s32Result, align 4, !dbg !849
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !850
  %conv8 = zext i16 %6 to i32, !dbg !850
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !851
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !851
  %div = sdiv i32 %5, %conv8, !dbg !851, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !852
  %conv9 = zext i16 %7 to i32, !dbg !852
  %mul10 = mul nsw i32 %div, %conv9, !dbg !853
  %sub = sub nsw i32 %4, %mul10, !dbg !854
  %shl = shl i32 %sub, 1, !dbg !855
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !856
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !857
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !858
  %conv11 = zext i16 %9 to i32, !dbg !858
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !859
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !859
  %div12 = sdiv i32 %8, %conv11, !dbg !859, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !860
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !861
  %conv13 = zext i16 %11 to i32, !dbg !861
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !862
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !862
  %div14 = sdiv i32 %10, %conv13, !dbg !862, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !863
  store i32 %add, i32* %s32Result, align 4, !dbg !864
  %12 = load i32, i32* %s32Result, align 4, !dbg !865
  %cmp15 = icmp slt i32 %12, 65535, !dbg !867
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !868

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !869
  %cmp18 = icmp sgt i32 %13, 0, !dbg !872
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !873

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !874
  %conv21 = trunc i32 %14 to i16, !dbg !876
  store i16 %conv21, i16* %retval, align 2, !dbg !877
  br label %return, !dbg !877

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !878
  br label %return, !dbg !878

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !880
  br label %return, !dbg !880

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !882
  ret i16 %15, !dbg !882
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !883 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !886, metadata !DIExpression()), !dbg !887
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !888, metadata !DIExpression()), !dbg !889
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !890, metadata !DIExpression()), !dbg !891
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !892, metadata !DIExpression()), !dbg !893
  store i32 0, i32* %u32Temp1, align 4, !dbg !893
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !894, metadata !DIExpression()), !dbg !895
  store i16 0, i16* %u16TempDenom, align 2, !dbg !895
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !896
  %conv = zext i16 %0 to i32, !dbg !896
  %cmp = icmp eq i32 %conv, 0, !dbg !898
  br i1 %cmp, label %if.then, label %if.else, !dbg !899

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !900
  br label %return, !dbg !900

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !902
  %conv2 = zext i16 %1 to i32, !dbg !902
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !904
  %conv3 = zext i16 %2 to i32, !dbg !904
  %mul = mul nsw i32 %conv2, %conv3, !dbg !905
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !906
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !907
  %conv4 = zext i16 %3 to i32, !dbg !907
  %shr = ashr i32 %conv4, 1, !dbg !908
  %conv5 = trunc i32 %shr to i16, !dbg !907
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !909
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !910
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !911
  %conv6 = zext i16 %5 to i32, !dbg !911
  %add = add i32 %4, %conv6, !dbg !912
  store i32 %add, i32* %u32Temp1, align 4, !dbg !913
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !914
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !915
  %conv7 = zext i16 %7 to i32, !dbg !915
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !916
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !916
  %div = udiv i32 %6, %conv7, !dbg !916, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !917
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !918
  %cmp8 = icmp ult i32 %8, 65535, !dbg !920
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !921

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !922
  %and = and i32 %9, 65535, !dbg !924
  %conv11 = trunc i32 %and to i16, !dbg !925
  store i16 %conv11, i16* %retval, align 2, !dbg !926
  br label %return, !dbg !926

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !927
  br label %return, !dbg !927

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !929
  ret i16 %10, !dbg !929
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !930 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !933, metadata !DIExpression()), !dbg !934
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !935, metadata !DIExpression()), !dbg !936
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !937, metadata !DIExpression()), !dbg !938
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !939, metadata !DIExpression()), !dbg !940
  store i32 0, i32* %u32Temp1, align 4, !dbg !940
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !941
  %cmp = icmp eq i32 %0, 0, !dbg !943
  br i1 %cmp, label %if.then, label %if.else, !dbg !944

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !945
  br label %return, !dbg !945

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !947
  %conv = zext i16 %1 to i32, !dbg !947
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !949
  %conv1 = zext i16 %2 to i32, !dbg !949
  %mul = mul nsw i32 %conv, %conv1, !dbg !950
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !951
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !952
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !952
  %div = udiv i32 %mul, %3, !dbg !952, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !953
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !954
  %conv2 = zext i16 %4 to i32, !dbg !954
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !956
  %conv3 = zext i16 %5 to i32, !dbg !956
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !957
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !958
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !959
  %mul5 = mul i32 %6, %7, !dbg !960
  %sub = sub i32 %mul4, %mul5, !dbg !961
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !962
  %div6 = udiv i32 %8, 2, !dbg !963
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !964
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !965

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !966
  %inc = add i32 %9, 1, !dbg !966
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !966
  br label %if.end, !dbg !968

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !969
  %cmp10 = icmp ult i32 %10, 65535, !dbg !971
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !972

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !973
  %and = and i32 %11, 65535, !dbg !975
  %conv13 = trunc i32 %and to i16, !dbg !976
  store i16 %conv13, i16* %retval, align 2, !dbg !977
  br label %return, !dbg !977

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !978
  br label %return, !dbg !978

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !980
  ret i16 %12, !dbg !980
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !981 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !984, metadata !DIExpression()), !dbg !985
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !986, metadata !DIExpression()), !dbg !987
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !988, metadata !DIExpression()), !dbg !989
  store i32 0, i32* %u32Temp1, align 4, !dbg !989
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !990
  %conv = zext i16 %0 to i32, !dbg !990
  %cmp = icmp eq i32 %conv, 0, !dbg !992
  br i1 %cmp, label %if.then, label %if.else, !dbg !993

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !994
  br label %return, !dbg !994

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !996
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !998
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !999
  %conv2 = zext i16 %3 to i32, !dbg !999
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1000
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1000
  %div = udiv i32 %2, %conv2, !dbg !1000, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1001
  %conv3 = zext i16 %4 to i32, !dbg !1001
  %mul = mul i32 %div, %conv3, !dbg !1002
  %sub = sub i32 %1, %mul, !dbg !1003
  %shl = shl i32 %sub, 1, !dbg !1004
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1005
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1006
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1007
  %conv4 = zext i16 %6 to i32, !dbg !1007
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1008
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1008
  %div5 = udiv i32 %5, %conv4, !dbg !1008, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1009
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1010
  %conv6 = zext i16 %8 to i32, !dbg !1010
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1011
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1011
  %div7 = udiv i32 %7, %conv6, !dbg !1011, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1012
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1013
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1014
  store i32 %9, i32* %retval, align 4, !dbg !1015
  br label %return, !dbg !1015

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1016
  ret i32 %10, !dbg !1016
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1017 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1020, metadata !DIExpression()), !dbg !1021
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1022, metadata !DIExpression()), !dbg !1023
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1024, metadata !DIExpression()), !dbg !1025
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1026, metadata !DIExpression()), !dbg !1027
  store i32 0, i32* %s32Temp1, align 4, !dbg !1027
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1028, metadata !DIExpression()), !dbg !1029
  store i32 0, i32* %s32Temp2, align 4, !dbg !1029
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1030, metadata !DIExpression()), !dbg !1031
  store i32 0, i32* %s32Temp3, align 4, !dbg !1031
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1032
  %conv = sext i16 %0 to i32, !dbg !1032
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1033
  %conv1 = sext i16 %1 to i32, !dbg !1033
  %mul = mul nsw i32 %conv, %conv1, !dbg !1034
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1035
  %2 = load i16, i16* %div.addr, align 2, !dbg !1036
  %conv2 = sext i16 %2 to i32, !dbg !1036
  %cmp = icmp eq i32 %conv2, 0, !dbg !1038
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1039

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1040
  %cmp4 = icmp slt i32 %3, 0, !dbg !1043
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1044

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1045
  br label %return, !dbg !1045

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1047
  br label %return, !dbg !1047

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1049
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1051
  %6 = load i16, i16* %div.addr, align 2, !dbg !1052
  %conv8 = sext i16 %6 to i32, !dbg !1052
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1053
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1053
  %div9 = sdiv i32 %5, %conv8, !dbg !1053, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1054
  %conv10 = sext i16 %7 to i32, !dbg !1054
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1055
  %sub = sub nsw i32 %4, %mul11, !dbg !1056
  %shl = shl i32 %sub, 1, !dbg !1057
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1058
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1059
  %9 = load i16, i16* %div.addr, align 2, !dbg !1060
  %conv12 = sext i16 %9 to i32, !dbg !1060
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1061
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1061
  %div13 = sdiv i32 %8, %conv12, !dbg !1061, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1062
  %11 = load i16, i16* %div.addr, align 2, !dbg !1063
  %conv14 = sext i16 %11 to i32, !dbg !1063
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1064
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1064
  %div15 = sdiv i32 %10, %conv14, !dbg !1064, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1065
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1066
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1067
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1069
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1070

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1071
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1074
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1075

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1076
  %conv22 = trunc i32 %14 to i16, !dbg !1078
  store i16 %conv22, i16* %retval, align 2, !dbg !1079
  br label %return, !dbg !1079

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1080
  br label %return, !dbg !1080

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1082
  br label %return, !dbg !1082

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1084
  ret i16 %15, !dbg !1084
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1085 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1088, metadata !DIExpression()), !dbg !1089
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1090, metadata !DIExpression()), !dbg !1091
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1092, metadata !DIExpression()), !dbg !1093
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1094, metadata !DIExpression()), !dbg !1095
  store i32 0, i32* %s32Result, align 4, !dbg !1095
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1096, metadata !DIExpression()), !dbg !1097
  store i32 0, i32* %s32Temp1, align 4, !dbg !1097
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1098
  %conv = sext i16 %0 to i32, !dbg !1098
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1099
  %conv1 = sext i16 %1 to i32, !dbg !1099
  %mul = mul nsw i32 %conv, %conv1, !dbg !1100
  store i32 %mul, i32* %s32Result, align 4, !dbg !1101
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1102
  %conv2 = zext i16 %2 to i32, !dbg !1102
  %cmp = icmp eq i32 %conv2, 0, !dbg !1104
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1105

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1106
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1109
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1110

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1111
  br label %return, !dbg !1111

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1113
  %cmp7 = icmp eq i32 %4, 0, !dbg !1115
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1116

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1117
  br label %return, !dbg !1117

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1119
  br label %return, !dbg !1119

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1121
  %6 = load i32, i32* %s32Result, align 4, !dbg !1123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1124
  %conv12 = zext i16 %7 to i32, !dbg !1124
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1125
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1125
  %div = sdiv i32 %6, %conv12, !dbg !1125, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1126
  %conv13 = zext i16 %8 to i32, !dbg !1126
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1127
  %sub = sub nsw i32 %5, %mul14, !dbg !1128
  %shl = shl i32 %sub, 1, !dbg !1129
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1130
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1131
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1132
  %conv15 = zext i16 %10 to i32, !dbg !1132
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1133
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1133
  %div16 = sdiv i32 %9, %conv15, !dbg !1133, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1134
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1135
  %conv17 = zext i16 %12 to i32, !dbg !1135
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1136
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1136
  %div18 = sdiv i32 %11, %conv17, !dbg !1136, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1137
  store i32 %add, i32* %s32Result, align 4, !dbg !1138
  %13 = load i32, i32* %s32Result, align 4, !dbg !1139
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1141
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1142

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1143
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1146
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1147

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1148
  %conv25 = trunc i32 %15 to i16, !dbg !1150
  store i16 %conv25, i16* %retval, align 2, !dbg !1151
  br label %return, !dbg !1151

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1152
  br label %return, !dbg !1152

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1154
  br label %return, !dbg !1154

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1156
  ret i16 %16, !dbg !1156
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1157 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1160, metadata !DIExpression()), !dbg !1161
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1162, metadata !DIExpression()), !dbg !1163
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1164, metadata !DIExpression()), !dbg !1165
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1166
  %cmp = icmp eq i32 %0, 0, !dbg !1168
  br i1 %cmp, label %if.then, label %if.else, !dbg !1169

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1170
  br label %return, !dbg !1170

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1172
  %cmp1 = icmp sle i32 %1, 0, !dbg !1175
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1176

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1177
  br label %return, !dbg !1177

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1179
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1181
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1182
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1183
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1183
  %div = udiv i32 %3, %4, !dbg !1183, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1184
  %mul = mul i32 %div, %5, !dbg !1185
  %sub = sub i32 %2, %mul, !dbg !1186
  %shl = shl i32 %sub, 1, !dbg !1187
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1188
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1189
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1190
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1191
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1191
  %div4 = udiv i32 %6, %7, !dbg !1191, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1192
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1193
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1194
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1194
  %div5 = udiv i32 %8, %9, !dbg !1194, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1195
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1196
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1197
  store i32 %10, i32* %retval, align 4, !dbg !1198
  br label %return, !dbg !1198

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1199
  ret i32 %11, !dbg !1199
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1200 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1203, metadata !DIExpression()), !dbg !1204
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1205, metadata !DIExpression()), !dbg !1206
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1207, metadata !DIExpression()), !dbg !1208
  store i32 0, i32* %s32Temp1, align 4, !dbg !1208
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1209
  %cmp = icmp eq i32 %0, 0, !dbg !1211
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1212

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1213
  %cmp1 = icmp sge i32 %1, 0, !dbg !1216
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1217

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1218
  br label %return, !dbg !1218

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1220
  br label %return, !dbg !1220

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1222
  %cmp4 = icmp sge i32 %2, 0, !dbg !1225
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1226

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1227
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1229
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1230
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1231
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1231
  %div = udiv i32 %4, %5, !dbg !1231, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1232
  %mul = mul i32 %div, %6, !dbg !1233
  %sub = sub i32 %3, %mul, !dbg !1234
  %shl = shl i32 %sub, 1, !dbg !1235
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1236
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1237
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1238
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1239
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1239
  %div6 = udiv i32 %7, %8, !dbg !1239, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1240
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1241
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1242
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1242
  %div7 = udiv i32 %9, %10, !dbg !1242, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1243
  store i32 %add, i32* %retval, align 4, !dbg !1244
  br label %return, !dbg !1244

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1245
  br label %return, !dbg !1245

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1247
  ret i32 %11, !dbg !1247
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1248 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1251, metadata !DIExpression()), !dbg !1252
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1253, metadata !DIExpression()), !dbg !1254
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1255, metadata !DIExpression()), !dbg !1256
  store i32 0, i32* %u32Temp1, align 4, !dbg !1256
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1257, metadata !DIExpression()), !dbg !1258
  store i32 0, i32* %u32Temp2, align 4, !dbg !1258
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1259
  %cmp = icmp eq i32 %0, 0, !dbg !1261
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1262

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1263
  %cmp1 = icmp slt i32 %1, 0, !dbg !1266
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1267

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1268
  br label %return, !dbg !1268

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1270
  br label %return, !dbg !1270

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1272
  %cmp4 = icmp sge i32 %2, 0, !dbg !1275
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1276

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1277
  %cmp6 = icmp eq i32 %3, 0, !dbg !1280
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1281

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1282
  br label %return, !dbg !1282

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1284
  %cmp9 = icmp sle i32 %4, 0, !dbg !1287
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1288

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1289
  br label %return, !dbg !1289

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1291
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1293
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1294
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1295
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1295
  %div = sdiv i32 %6, %7, !dbg !1295, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1296
  %mul = mul nsw i32 %div, %8, !dbg !1297
  %sub = sub nsw i32 %5, %mul, !dbg !1298
  %shl = shl i32 %sub, 1, !dbg !1299
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1300
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1301
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1302
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1303
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1303
  %div12 = udiv i32 %9, %10, !dbg !1303, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1304
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1305
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1306
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1306
  %div13 = sdiv i32 %11, %12, !dbg !1306, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1307
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1308
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1309
  store i32 %13, i32* %retval, align 4, !dbg !1310
  br label %return, !dbg !1310

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1311
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1314
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1315

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1316
  br label %return, !dbg !1316

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1318
  %sub18 = sub nsw i32 0, %15, !dbg !1320
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1321
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1322
  %sub19 = sub nsw i32 0, %16, !dbg !1323
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1324
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1325
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1326
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1327
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1328
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1328
  %div20 = sdiv i32 %18, %19, !dbg !1328, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1329
  %mul21 = mul nsw i32 %div20, %20, !dbg !1330
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1331
  %shl23 = shl i32 %sub22, 1, !dbg !1332
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1333
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1334
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1335
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1336
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1336
  %div24 = udiv i32 %21, %22, !dbg !1336, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1337
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1338
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1339
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1339
  %div25 = sdiv i32 %23, %24, !dbg !1339, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1340
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1341
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1342
  store i32 %25, i32* %retval, align 4, !dbg !1343
  br label %return, !dbg !1343

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1344
  ret i32 %26, !dbg !1344
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1345 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1348, metadata !DIExpression()), !dbg !1349
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1350, metadata !DIExpression()), !dbg !1351
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1352, metadata !DIExpression()), !dbg !1353
  store i32 0, i32* %u32Temp1, align 4, !dbg !1353
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1354, metadata !DIExpression()), !dbg !1355
  store i32 0, i32* %u32Temp2, align 4, !dbg !1355
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1356, metadata !DIExpression()), !dbg !1357
  store i32 0, i32* %u32Temp3, align 4, !dbg !1357
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1358, metadata !DIExpression()), !dbg !1359
  store i32 0, i32* %numerator_old, align 4, !dbg !1359
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1360
  %cmp = icmp eq i32 %0, 0, !dbg !1362
  br i1 %cmp, label %if.then, label %if.else, !dbg !1363

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1364
  br label %return, !dbg !1364

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1366
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1368
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1369
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1370
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1371
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1371
  %div = udiv i32 %3, %4, !dbg !1371, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1372
  %sub = sub i32 %1, %mul, !dbg !1373
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1374
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1375
  %and = and i32 %5, 1, !dbg !1377
  %cmp1 = icmp eq i32 %and, 0, !dbg !1378
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1379

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1380
  %shr = lshr i32 %6, 1, !dbg !1382
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1383
  br label %if.end, !dbg !1384

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1385
  %shr4 = lshr i32 %7, 1, !dbg !1387
  %add = add i32 %shr4, 1, !dbg !1388
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1389
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1390
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1392
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1393
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1394

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1395
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1397
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1398
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1398
  %div7 = udiv i32 %10, %11, !dbg !1398, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1399
  br label %return, !dbg !1399

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1400
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1402
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1403
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1403
  %div9 = udiv i32 %12, %13, !dbg !1403, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1404
  store i32 %add10, i32* %retval, align 4, !dbg !1405
  br label %return, !dbg !1405

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1406
  ret i32 %14, !dbg !1406
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1407 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1410, metadata !DIExpression()), !dbg !1411
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1412, metadata !DIExpression()), !dbg !1413
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1414, metadata !DIExpression()), !dbg !1415
  store i32 0, i32* %u32Temp1, align 4, !dbg !1415
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1416, metadata !DIExpression()), !dbg !1417
  store i32 0, i32* %u32Temp2, align 4, !dbg !1417
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1418
  %cmp = icmp sle i32 %0, 0, !dbg !1420
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1421

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1422
  %cmp1 = icmp sge i32 %1, 0, !dbg !1425
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1426

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1427
  br label %return, !dbg !1427

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1429
  %sub = sub nsw i32 0, %2, !dbg !1431
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1432
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1433
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1434
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1435
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1436
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1436
  %div = udiv i32 %4, %5, !dbg !1436, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1437
  %mul = mul i32 %div, %6, !dbg !1438
  %sub3 = sub i32 %3, %mul, !dbg !1439
  %shl = shl i32 %sub3, 1, !dbg !1440
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1441
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1442
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1443
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1444
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1444
  %div4 = udiv i32 %7, %8, !dbg !1444, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1445
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1446
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1447
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1447
  %div5 = udiv i32 %9, %10, !dbg !1447, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1448
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1449
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1450
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1452
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1453

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1454
  %sub8 = sub i32 0, %12, !dbg !1456
  store i32 %sub8, i32* %retval, align 4, !dbg !1457
  br label %return, !dbg !1457

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1458
  br label %return, !dbg !1458

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1460
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1462
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1463
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1464
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1464
  %div11 = udiv i32 %14, %15, !dbg !1464, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1465
  %mul12 = mul i32 %div11, %16, !dbg !1466
  %sub13 = sub i32 %13, %mul12, !dbg !1467
  %shl14 = shl i32 %sub13, 1, !dbg !1468
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1469
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1470
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1471
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1472
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1472
  %div15 = udiv i32 %17, %18, !dbg !1472, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1473
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1474
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1475
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1475
  %div16 = udiv i32 %19, %20, !dbg !1475, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1476
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1477
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1478
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1480
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1481

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1482
  store i32 %22, i32* %retval, align 4, !dbg !1484
  br label %return, !dbg !1484

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1485
  br label %return, !dbg !1485

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1487
  ret i32 %23, !dbg !1487
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1488 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1491, metadata !DIExpression()), !dbg !1492
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1493, metadata !DIExpression()), !dbg !1494
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1495, metadata !DIExpression()), !dbg !1496
  store i32 0, i32* %s32Temp1, align 4, !dbg !1496
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1497, metadata !DIExpression()), !dbg !1498
  store i32 0, i32* %s32Temp2, align 4, !dbg !1498
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1499, metadata !DIExpression()), !dbg !1500
  store i32 0, i32* %u32Temp0, align 4, !dbg !1500
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1501, metadata !DIExpression()), !dbg !1502
  store i32 0, i32* %u32Temp1, align 4, !dbg !1502
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1503, metadata !DIExpression()), !dbg !1504
  store i32 0, i32* %u32Temp2, align 4, !dbg !1504
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1505
  %cmp = icmp eq i32 %0, 0, !dbg !1507
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1508

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1509
  %cmp1 = icmp slt i32 %1, 0, !dbg !1512
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1513

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1514
  br label %return, !dbg !1514

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1516
  br label %return, !dbg !1516

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1518
  %cmp4 = icmp sle i32 %2, 0, !dbg !1521
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1522

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1523
  %sub = sub nsw i32 0, %3, !dbg !1525
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1526
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1527
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1528
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1529
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1529
  %div = udiv i32 %4, %5, !dbg !1529, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1530
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1531
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1532
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1533
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1534
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1534
  %div6 = udiv i32 %7, %8, !dbg !1534, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1535
  %mul = mul i32 %div6, %9, !dbg !1536
  %sub7 = sub i32 %6, %mul, !dbg !1537
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1538
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1539
  %and = and i32 %10, 1, !dbg !1541
  %cmp8 = icmp eq i32 %and, 0, !dbg !1542
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1543

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1544
  %shr = lshr i32 %11, 1, !dbg !1546
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1547
  br label %if.end, !dbg !1548

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1549
  %shr11 = lshr i32 %12, 1, !dbg !1551
  %add = add i32 %shr11, 1, !dbg !1552
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1553
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1554
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1556
  %cmp12 = icmp ult i32 %13, %14, !dbg !1557
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1558

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1559
  %neg = xor i32 %15, -1, !dbg !1561
  %add14 = add i32 %neg, 1, !dbg !1562
  store i32 %add14, i32* %retval, align 4, !dbg !1563
  br label %return, !dbg !1563

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1564
  %add16 = add i32 %16, 1, !dbg !1566
  %neg17 = xor i32 %add16, -1, !dbg !1567
  %add18 = add i32 %neg17, 1, !dbg !1568
  store i32 %add18, i32* %retval, align 4, !dbg !1569
  br label %return, !dbg !1569

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1570
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1572
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1573
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1574
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1574
  %div20 = udiv i32 %18, %19, !dbg !1574, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1575
  %mul21 = mul i32 %div20, %20, !dbg !1576
  %sub22 = sub i32 %17, %mul21, !dbg !1577
  %shl = shl i32 %sub22, 1, !dbg !1578
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1579
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1580
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1581
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1582
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1582
  %div23 = udiv i32 %21, %22, !dbg !1582, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1583
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1584
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1585
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1585
  %div24 = udiv i32 %23, %24, !dbg !1585, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1586
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1587
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1588
  store i32 %25, i32* %retval, align 4, !dbg !1589
  br label %return, !dbg !1589

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1590
  ret i32 %26, !dbg !1590
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1591 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1594, metadata !DIExpression()), !dbg !1595
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1596, metadata !DIExpression()), !dbg !1597
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1598, metadata !DIExpression()), !dbg !1599
  store i32 0, i32* %s32Temp1, align 4, !dbg !1599
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1600, metadata !DIExpression()), !dbg !1601
  store i32 0, i32* %s32Temp2, align 4, !dbg !1601
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1602, metadata !DIExpression()), !dbg !1603
  store i32 0, i32* %denominator_prime, align 4, !dbg !1603
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1604, metadata !DIExpression()), !dbg !1605
  store i32 0, i32* %u32Temp1, align 4, !dbg !1605
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1606, metadata !DIExpression()), !dbg !1607
  store i32 0, i32* %u32Temp2, align 4, !dbg !1607
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1608, metadata !DIExpression()), !dbg !1609
  store i32 0, i32* %u32numerator, align 4, !dbg !1609
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1610, metadata !DIExpression()), !dbg !1611
  store i32 0, i32* %u32denominator, align 4, !dbg !1611
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1612
  %cmp = icmp slt i32 %0, 0, !dbg !1614
  br i1 %cmp, label %if.then, label %if.else42, !dbg !1615

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1616
  %cmp1 = icmp sle i32 %1, 0, !dbg !1619
  br i1 %cmp1, label %if.then2, label %if.else19, !dbg !1620

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1621
  %cmp3 = icmp sge i32 %2, 0, !dbg !1624
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1625

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1626
  br label %return, !dbg !1626

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1628
  %conv = sext i32 %3 to i64, !dbg !1631
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv), !dbg !1632
  %tobool = icmp ne i32 %call, 0, !dbg !1632
  br i1 %tobool, label %if.end, label %if.then5, !dbg !1633

if.then5:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1634
  br label %return, !dbg !1634

if.end:                                           ; preds = %if.else
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1636
  %sub = sub nsw i32 0, %4, !dbg !1637
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1638
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1639
  %conv6 = sext i32 %5 to i64, !dbg !1641
  %call7 = call i32 @klee_alarm_s32_neg_valid(i64 %conv6), !dbg !1642
  %tobool8 = icmp ne i32 %call7, 0, !dbg !1642
  br i1 %tobool8, label %if.end10, label %if.then9, !dbg !1643

if.then9:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !1644
  br label %return, !dbg !1644

if.end10:                                         ; preds = %if.end
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1646
  %sub11 = sub nsw i32 0, %6, !dbg !1647
  store i32 %sub11, i32* %u32denominator, align 4, !dbg !1648
  %7 = load i32, i32* %u32numerator, align 4, !dbg !1649
  %8 = load i32, i32* %u32numerator, align 4, !dbg !1650
  %9 = load i32, i32* %u32denominator, align 4, !dbg !1651
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !1652
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1652
  %div = udiv i32 %8, %9, !dbg !1652, !klee.check.div !106
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1653
  %mul = mul i32 %div, %10, !dbg !1654
  %sub12 = sub i32 %7, %mul, !dbg !1655
  %shl = shl i32 %sub12, 1, !dbg !1656
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1657
  %11 = load i32, i32* %u32numerator, align 4, !dbg !1658
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1659
  %int_cast_to_i641 = zext i32 %12 to i64, !dbg !1660
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1660
  %div13 = udiv i32 %11, %12, !dbg !1660, !klee.check.div !106
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !1661
  %14 = load i32, i32* %u32denominator, align 4, !dbg !1662
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !1663
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1663
  %div14 = udiv i32 %13, %14, !dbg !1663, !klee.check.div !106
  %add = add i32 %div13, %div14, !dbg !1664
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1665
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !1666
  %cmp15 = icmp ule i32 %15, 2147483647, !dbg !1668
  br i1 %cmp15, label %if.then17, label %if.else18, !dbg !1669

if.then17:                                        ; preds = %if.end10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !1670
  store i32 %16, i32* %retval, align 4, !dbg !1672
  br label %return, !dbg !1672

if.else18:                                        ; preds = %if.end10
  store i32 2147483647, i32* %retval, align 4, !dbg !1673
  br label %return, !dbg !1673

if.else19:                                        ; preds = %if.then
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1675
  %neg = xor i32 %17, -1, !dbg !1678
  %conv20 = sext i32 %neg to i64, !dbg !1679
  %call21 = call i32 @klee_alarm_s32_add_upper(i64 %conv20, i64 1), !dbg !1680
  %tobool22 = icmp ne i32 %call21, 0, !dbg !1680
  br i1 %tobool22, label %if.end24, label %if.then23, !dbg !1681

if.then23:                                        ; preds = %if.else19
  store i32 0, i32* %retval, align 4, !dbg !1682
  br label %return, !dbg !1682

if.end24:                                         ; preds = %if.else19
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1684
  %neg25 = xor i32 %18, -1, !dbg !1685
  %add26 = add nsw i32 %neg25, 1, !dbg !1686
  store i32 %add26, i32* %u32numerator, align 4, !dbg !1687
  %19 = load i32, i32* %u32numerator, align 4, !dbg !1688
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1689
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1690
  %int_cast_to_i643 = zext i32 %21 to i64, !dbg !1691
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1691
  %div27 = udiv i32 %20, %21, !dbg !1691, !klee.check.div !106
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1692
  %mul28 = mul i32 %div27, %22, !dbg !1693
  %sub29 = sub i32 %19, %mul28, !dbg !1694
  %shl30 = shl i32 %sub29, 1, !dbg !1695
  store i32 %shl30, i32* %s32Temp1, align 4, !dbg !1696
  %23 = load i32, i32* %u32numerator, align 4, !dbg !1697
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1698
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1699
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1699
  %div31 = udiv i32 %23, %24, !dbg !1699, !klee.check.div !106
  %25 = load i32, i32* %s32Temp1, align 4, !dbg !1700
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1701
  %int_cast_to_i645 = zext i32 %26 to i64, !dbg !1702
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1702
  %div32 = sdiv i32 %25, %26, !dbg !1702, !klee.check.div !106
  %add33 = add i32 %div31, %div32, !dbg !1703
  store i32 %add33, i32* %s32Temp2, align 4, !dbg !1704
  %27 = load i32, i32* %s32Temp2, align 4, !dbg !1705
  %neg34 = xor i32 %27, -1, !dbg !1707
  %conv35 = sext i32 %neg34 to i64, !dbg !1708
  %call36 = call i32 @klee_alarm_s32_add_upper(i64 %conv35, i64 1), !dbg !1709
  %tobool37 = icmp ne i32 %call36, 0, !dbg !1709
  br i1 %tobool37, label %if.end39, label %if.then38, !dbg !1710

if.then38:                                        ; preds = %if.end24
  store i32 0, i32* %retval, align 4, !dbg !1711
  br label %return, !dbg !1711

if.end39:                                         ; preds = %if.end24
  %28 = load i32, i32* %s32Temp2, align 4, !dbg !1713
  %neg40 = xor i32 %28, -1, !dbg !1714
  %add41 = add nsw i32 %neg40, 1, !dbg !1715
  store i32 %add41, i32* %retval, align 4, !dbg !1716
  br label %return, !dbg !1716

if.else42:                                        ; preds = %entry
  %29 = load i32, i32* %denominator.addr, align 4, !dbg !1717
  %cmp43 = icmp sle i32 %29, 0, !dbg !1720
  br i1 %cmp43, label %if.then45, label %if.else73, !dbg !1721

if.then45:                                        ; preds = %if.else42
  %30 = load i32, i32* %denominator.addr, align 4, !dbg !1722
  %cmp46 = icmp sge i32 %30, 0, !dbg !1725
  br i1 %cmp46, label %if.then48, label %if.else49, !dbg !1726

if.then48:                                        ; preds = %if.then45
  store i32 2147483647, i32* %retval, align 4, !dbg !1727
  br label %return, !dbg !1727

if.else49:                                        ; preds = %if.then45
  %31 = load i32, i32* %denominator.addr, align 4, !dbg !1729
  %neg50 = xor i32 %31, -1, !dbg !1732
  %conv51 = sext i32 %neg50 to i64, !dbg !1733
  %call52 = call i32 @klee_alarm_s32_add_upper(i64 %conv51, i64 1), !dbg !1734
  %tobool53 = icmp ne i32 %call52, 0, !dbg !1734
  br i1 %tobool53, label %if.end55, label %if.then54, !dbg !1735

if.then54:                                        ; preds = %if.else49
  store i32 0, i32* %retval, align 4, !dbg !1736
  br label %return, !dbg !1736

if.end55:                                         ; preds = %if.else49
  %32 = load i32, i32* %denominator.addr, align 4, !dbg !1738
  %neg56 = xor i32 %32, -1, !dbg !1739
  %add57 = add nsw i32 %neg56, 1, !dbg !1740
  store i32 %add57, i32* %u32denominator, align 4, !dbg !1741
  %33 = load i32, i32* %numerator.addr, align 4, !dbg !1742
  %34 = load i32, i32* %numerator.addr, align 4, !dbg !1743
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1744
  %int_cast_to_i646 = zext i32 %35 to i64, !dbg !1745
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1745
  %div58 = udiv i32 %34, %35, !dbg !1745, !klee.check.div !106
  %36 = load i32, i32* %u32denominator, align 4, !dbg !1746
  %mul59 = mul i32 %div58, %36, !dbg !1747
  %sub60 = sub i32 %33, %mul59, !dbg !1748
  %shl61 = shl i32 %sub60, 1, !dbg !1749
  store i32 %shl61, i32* %s32Temp1, align 4, !dbg !1750
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1751
  %38 = load i32, i32* %u32denominator, align 4, !dbg !1752
  %int_cast_to_i647 = zext i32 %38 to i64, !dbg !1753
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1753
  %div62 = udiv i32 %37, %38, !dbg !1753, !klee.check.div !106
  %39 = load i32, i32* %s32Temp1, align 4, !dbg !1754
  %40 = load i32, i32* %u32denominator, align 4, !dbg !1755
  %int_cast_to_i648 = zext i32 %40 to i64, !dbg !1756
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1756
  %div63 = udiv i32 %39, %40, !dbg !1756, !klee.check.div !106
  %add64 = add i32 %div62, %div63, !dbg !1757
  store i32 %add64, i32* %s32Temp2, align 4, !dbg !1758
  %41 = load i32, i32* %s32Temp2, align 4, !dbg !1759
  %neg65 = xor i32 %41, -1, !dbg !1761
  %conv66 = sext i32 %neg65 to i64, !dbg !1762
  %call67 = call i32 @klee_alarm_s32_add_upper(i64 %conv66, i64 1), !dbg !1763
  %tobool68 = icmp ne i32 %call67, 0, !dbg !1763
  br i1 %tobool68, label %if.end70, label %if.then69, !dbg !1764

if.then69:                                        ; preds = %if.end55
  store i32 0, i32* %retval, align 4, !dbg !1765
  br label %return, !dbg !1765

if.end70:                                         ; preds = %if.end55
  %42 = load i32, i32* %s32Temp2, align 4, !dbg !1767
  %neg71 = xor i32 %42, -1, !dbg !1768
  %add72 = add nsw i32 %neg71, 1, !dbg !1769
  store i32 %add72, i32* %retval, align 4, !dbg !1770
  br label %return, !dbg !1770

if.else73:                                        ; preds = %if.else42
  %43 = load i32, i32* %numerator.addr, align 4, !dbg !1771
  %44 = load i32, i32* %numerator.addr, align 4, !dbg !1774
  %45 = load i32, i32* %denominator.addr, align 4, !dbg !1775
  %int_cast_to_i649 = zext i32 %45 to i64, !dbg !1776
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1776
  %div74 = sdiv i32 %44, %45, !dbg !1776, !klee.check.div !106
  %46 = load i32, i32* %denominator.addr, align 4, !dbg !1777
  %mul75 = mul nsw i32 %div74, %46, !dbg !1778
  %sub76 = sub nsw i32 %43, %mul75, !dbg !1779
  %conv77 = sext i32 %sub76 to i64, !dbg !1780
  %call78 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv77), !dbg !1781
  %tobool79 = icmp ne i32 %call78, 0, !dbg !1781
  br i1 %tobool79, label %if.end81, label %if.then80, !dbg !1782

if.then80:                                        ; preds = %if.else73
  store i32 0, i32* %retval, align 4, !dbg !1783
  br label %return, !dbg !1783

if.end81:                                         ; preds = %if.else73
  %47 = load i32, i32* %numerator.addr, align 4, !dbg !1785
  %48 = load i32, i32* %denominator.addr, align 4, !dbg !1787
  %int_cast_to_i6410 = zext i32 %48 to i64, !dbg !1788
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1788
  %div82 = sdiv i32 %47, %48, !dbg !1788, !klee.check.div !106
  %conv83 = sext i32 %div82 to i64, !dbg !1789
  %49 = load i32, i32* %denominator.addr, align 4, !dbg !1790
  %conv84 = sext i32 %49 to i64, !dbg !1791
  %call85 = call i32 @klee_alarm_s32_mul_upper(i64 %conv83, i64 %conv84), !dbg !1792
  %tobool86 = icmp ne i32 %call85, 0, !dbg !1792
  br i1 %tobool86, label %if.end88, label %if.then87, !dbg !1793

if.then87:                                        ; preds = %if.end81
  store i32 0, i32* %retval, align 4, !dbg !1794
  br label %return, !dbg !1794

if.end88:                                         ; preds = %if.end81
  %50 = load i32, i32* %numerator.addr, align 4, !dbg !1796
  %51 = load i32, i32* %numerator.addr, align 4, !dbg !1798
  %52 = load i32, i32* %denominator.addr, align 4, !dbg !1799
  %int_cast_to_i6411 = zext i32 %52 to i64, !dbg !1800
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1800
  %div89 = sdiv i32 %51, %52, !dbg !1800, !klee.check.div !106
  %53 = load i32, i32* %denominator.addr, align 4, !dbg !1801
  %mul90 = mul nsw i32 %div89, %53, !dbg !1802
  %sub91 = sub nsw i32 %50, %mul90, !dbg !1803
  %conv92 = sext i32 %sub91 to i64, !dbg !1804
  %call93 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv92, i32 1), !dbg !1805
  %tobool94 = icmp ne i32 %call93, 0, !dbg !1805
  br i1 %tobool94, label %if.end96, label %if.then95, !dbg !1806

if.then95:                                        ; preds = %if.end88
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 1470, i8* getelementptr inbounds ([132 x i8], [132 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !1807
  unreachable, !dbg !1807

if.end96:                                         ; preds = %if.end88
  %54 = load i32, i32* %numerator.addr, align 4, !dbg !1809
  %55 = load i32, i32* %numerator.addr, align 4, !dbg !1810
  %56 = load i32, i32* %denominator.addr, align 4, !dbg !1811
  %int_cast_to_i6412 = zext i32 %56 to i64, !dbg !1812
  call void @klee_div_zero_check(i64 %int_cast_to_i6412), !dbg !1812
  %div97 = sdiv i32 %55, %56, !dbg !1812, !klee.check.div !106
  %57 = load i32, i32* %denominator.addr, align 4, !dbg !1813
  %mul98 = mul nsw i32 %div97, %57, !dbg !1814
  %sub99 = sub nsw i32 %54, %mul98, !dbg !1815
  %shl100 = shl i32 %sub99, 1, !dbg !1816
  %conv101 = sext i32 %shl100 to i64, !dbg !1817
  store volatile i64 %conv101, i64* @klee_alarm_sink_s64, align 8, !dbg !1818
  store i32 0, i32* %retval, align 4, !dbg !1819
  br label %return, !dbg !1819

return:                                           ; preds = %if.end96, %if.then87, %if.then80, %if.end70, %if.then69, %if.then54, %if.then48, %if.end39, %if.then38, %if.then23, %if.else18, %if.then17, %if.then9, %if.then5, %if.then4
  %58 = load i32, i32* %retval, align 4, !dbg !1820
  ret i32 %58, !dbg !1820
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !1821 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !1824, metadata !DIExpression()), !dbg !1825
  %0 = load i64, i64* %value.addr, align 8, !dbg !1826
  %cmp = icmp ne i64 %0, -2147483648, !dbg !1827
  %conv = zext i1 %cmp to i32, !dbg !1827
  ret i32 %conv, !dbg !1828
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !1829 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1832, metadata !DIExpression()), !dbg !1833
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1834, metadata !DIExpression()), !dbg !1835
  %0 = load i64, i64* %left.addr, align 8, !dbg !1836
  %1 = load i64, i64* %right.addr, align 8, !dbg !1837
  %add = add nsw i64 %0, %1, !dbg !1838
  %cmp = icmp sle i64 %add, 2147483647, !dbg !1839
  %conv = zext i1 %cmp to i32, !dbg !1839
  ret i32 %conv, !dbg !1840
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !1841 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1842, metadata !DIExpression()), !dbg !1843
  %0 = load i64, i64* %left.addr, align 8, !dbg !1844
  %cmp = icmp sge i64 %0, 0, !dbg !1845
  %conv = zext i1 %cmp to i32, !dbg !1845
  ret i32 %conv, !dbg !1846
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !1847 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1848, metadata !DIExpression()), !dbg !1849
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1850, metadata !DIExpression()), !dbg !1851
  %0 = load i64, i64* %left.addr, align 8, !dbg !1852
  %1 = load i64, i64* %right.addr, align 8, !dbg !1853
  %mul = mul nsw i64 %0, %1, !dbg !1854
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !1855
  %conv = zext i1 %cmp to i32, !dbg !1855
  ret i32 %conv, !dbg !1856
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !1857 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1860, metadata !DIExpression()), !dbg !1861
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1862, metadata !DIExpression()), !dbg !1863
  %0 = load i32, i32* %count.addr, align 4, !dbg !1864
  %cmp = icmp uge i32 %0, 63, !dbg !1866
  br i1 %cmp, label %if.then, label %if.end, !dbg !1867

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1868
  br label %return, !dbg !1868

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !1870
  %2 = load i32, i32* %count.addr, align 4, !dbg !1871
  %sh_prom = zext i32 %2 to i64, !dbg !1872
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !1872
  %shl = shl i64 1, %sh_prom, !dbg !1872, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !1873
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !1874
  %conv = zext i1 %cmp1 to i32, !dbg !1874
  store i32 %conv, i32* %retval, align 4, !dbg !1875
  br label %return, !dbg !1875

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !1876
  ret i32 %3, !dbg !1876
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1877 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1880, metadata !DIExpression()), !dbg !1881
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1882, metadata !DIExpression()), !dbg !1883
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1884, metadata !DIExpression()), !dbg !1885
  store i32 0, i32* %numerator_prime, align 4, !dbg !1885
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1886, metadata !DIExpression()), !dbg !1887
  store i32 0, i32* %u32Temp1, align 4, !dbg !1887
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1888, metadata !DIExpression()), !dbg !1889
  store i32 0, i32* %u32Temp2, align 4, !dbg !1889
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1890, metadata !DIExpression()), !dbg !1891
  store i32 0, i32* %u32Temp3, align 4, !dbg !1891
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1892, metadata !DIExpression()), !dbg !1893
  store i32 0, i32* %s32Temp1, align 4, !dbg !1893
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1894, metadata !DIExpression()), !dbg !1895
  store i32 0, i32* %s32Temp2, align 4, !dbg !1895
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1896, metadata !DIExpression()), !dbg !1897
  store i32 0, i32* %s32Temp3, align 4, !dbg !1897
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1898
  %cmp = icmp eq i32 %0, 0, !dbg !1900
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1901

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1902
  %cmp1 = icmp slt i32 %1, 0, !dbg !1905
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1906

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1907
  br label %return, !dbg !1907

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1909
  br label %return, !dbg !1909

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1911
  %cmp4 = icmp slt i32 %2, 0, !dbg !1914
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1915

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1916
  %sub = sub nsw i32 0, %3, !dbg !1918
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1919
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1920
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1921
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1922
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1922
  %div = udiv i32 %4, %5, !dbg !1922, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1923
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1924
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1925
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1926
  %mul = mul i32 %7, %8, !dbg !1927
  %sub6 = sub i32 %6, %mul, !dbg !1928
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1929
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1930
  %and = and i32 %9, 1, !dbg !1932
  %cmp7 = icmp eq i32 %and, 0, !dbg !1933
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1934

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1935
  %shr = lshr i32 %10, 1, !dbg !1937
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1938
  br label %if.end, !dbg !1939

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1940
  %shr10 = lshr i32 %11, 1, !dbg !1942
  %add = add i32 %shr10, 1, !dbg !1943
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1944
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1945
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1947
  %cmp11 = icmp ult i32 %12, %13, !dbg !1948
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1949

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1950
  %neg = xor i32 %14, -1, !dbg !1952
  %add13 = add i32 %neg, 1, !dbg !1953
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1954
  br label %if.end18, !dbg !1955

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1956
  %add15 = add i32 %15, 1, !dbg !1958
  %neg16 = xor i32 %add15, -1, !dbg !1959
  %add17 = add i32 %neg16, 1, !dbg !1960
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1961
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1962
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1964
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1965

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1966
  %conv = trunc i32 %17 to i16, !dbg !1968
  store i16 %conv, i16* %retval, align 2, !dbg !1969
  br label %return, !dbg !1969

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1970
  br label %return, !dbg !1970

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1972
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1974
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1975
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1975
  %div23 = udiv i32 %18, %19, !dbg !1975, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1976
  %mul24 = mul i32 %div23, %20, !dbg !1977
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1978
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1979
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1980
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1981
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1982
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1982
  %div25 = udiv i32 %22, %23, !dbg !1982, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1983
  %mul26 = mul i32 %div25, %24, !dbg !1984
  %sub27 = sub i32 %21, %mul26, !dbg !1985
  %shl = shl i32 %sub27, 1, !dbg !1986
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1987
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1988
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1989
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1990
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1990
  %div28 = udiv i32 %25, %26, !dbg !1990, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1991
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1992
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1993
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1993
  %div29 = udiv i32 %27, %28, !dbg !1993, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !1994
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1995
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1996
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1998
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1999

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2000
  %conv34 = trunc i32 %30 to i16, !dbg !2002
  store i16 %conv34, i16* %retval, align 2, !dbg !2003
  br label %return, !dbg !2003

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2004
  br label %return, !dbg !2004

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2006
  ret i16 %31, !dbg !2006
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2007 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2013, metadata !DIExpression()), !dbg !2014
  %2 = icmp eq i64 %0, 0, !dbg !2015
  br i1 %2, label %3, label %4, !dbg !2017

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2018
  unreachable, !dbg !2018

4:                                                ; preds = %1
  ret void, !dbg !2019
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2020 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2026, metadata !DIExpression()), !dbg !2028
  call void @llvm.dbg.value(metadata i64 %1, metadata !2027, metadata !DIExpression()), !dbg !2028
  %3 = icmp ult i64 %1, %0, !dbg !2029
  br i1 %3, label %5, label %4, !dbg !2031

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2032
  unreachable, !dbg !2032

5:                                                ; preds = %2
  ret void, !dbg !2034
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0102/div_Ccode_alarm_0102.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0102")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25, !29}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0102")
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
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !15, line: 26, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !31)
!31 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!32 = !{!0}
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0102")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0102/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0102")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0102")
!50 = !DISubroutineType(types: !51)
!51 = !{!28}
!52 = !DILocalVariable(name: "numerator", scope: !48, file: !49, line: 9, type: !26)
!53 = !DILocation(line: 9, column: 13, scope: !48)
!54 = !DILocalVariable(name: "denominator", scope: !48, file: !49, line: 10, type: !26)
!55 = !DILocation(line: 10, column: 13, scope: !48)
!56 = !DILocalVariable(name: "result", scope: !48, file: !49, line: 11, type: !26)
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0102")
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
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !29)
!429 = !DILocation(line: 442, column: 6, scope: !420)
!430 = !DILocalVariable(name: "u32Temp2", scope: !420, file: !69, line: 442, type: !428)
!431 = !DILocation(line: 442, column: 20, scope: !420)
!432 = !DILocalVariable(name: "u32Temp3", scope: !420, file: !69, line: 442, type: !428)
!433 = !DILocation(line: 442, column: 33, scope: !420)
!434 = !DILocation(line: 443, column: 5, scope: !435)
!435 = distinct !DILexicalBlock(scope: !420, file: !69, line: 443, column: 5)
!436 = !DILocation(line: 443, column: 16, scope: !435)
!437 = !DILocation(line: 443, column: 5, scope: !420)
!438 = !DILocation(line: 445, column: 3, scope: !439)
!439 = distinct !DILexicalBlock(scope: !435, file: !69, line: 444, column: 2)
!440 = !DILocation(line: 449, column: 15, scope: !441)
!441 = distinct !DILexicalBlock(scope: !435, file: !69, line: 448, column: 2)
!442 = !DILocation(line: 449, column: 24, scope: !441)
!443 = !DILocation(line: 449, column: 12, scope: !441)
!444 = !DILocation(line: 450, column: 14, scope: !441)
!445 = !DILocation(line: 450, column: 25, scope: !441)
!446 = !DILocation(line: 450, column: 23, scope: !441)
!447 = !DILocation(line: 450, column: 12, scope: !441)
!448 = !DILocation(line: 451, column: 15, scope: !441)
!449 = !DILocation(line: 451, column: 24, scope: !441)
!450 = !DILocation(line: 451, column: 32, scope: !441)
!451 = !DILocation(line: 451, column: 12, scope: !441)
!452 = !DILocation(line: 452, column: 6, scope: !453)
!453 = distinct !DILexicalBlock(scope: !441, file: !69, line: 452, column: 6)
!454 = !DILocation(line: 452, column: 15, scope: !453)
!455 = !DILocation(line: 452, column: 6, scope: !441)
!456 = !DILocation(line: 454, column: 15, scope: !457)
!457 = distinct !DILexicalBlock(scope: !453, file: !69, line: 453, column: 3)
!458 = !DILocation(line: 454, column: 11, scope: !457)
!459 = !DILocation(line: 454, column: 4, scope: !457)
!460 = !DILocation(line: 458, column: 4, scope: !461)
!461 = distinct !DILexicalBlock(scope: !453, file: !69, line: 457, column: 3)
!462 = !DILocation(line: 461, column: 1, scope: !420)
!463 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 478, type: !464, scopeLine: 479, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!464 = !DISubroutineType(types: !465)
!465 = !{!18, !25, !18}
!466 = !DILocalVariable(name: "x_value", arg: 1, scope: !463, file: !69, line: 478, type: !25)
!467 = !DILocation(line: 478, column: 25, scope: !463)
!468 = !DILocalVariable(name: "y_value", arg: 2, scope: !463, file: !69, line: 478, type: !18)
!469 = !DILocation(line: 478, column: 38, scope: !463)
!470 = !DILocalVariable(name: "s32Temp1", scope: !463, file: !69, line: 480, type: !25)
!471 = !DILocation(line: 480, column: 6, scope: !463)
!472 = !DILocation(line: 481, column: 12, scope: !463)
!473 = !DILocation(line: 481, column: 20, scope: !463)
!474 = !DILocation(line: 481, column: 10, scope: !463)
!475 = !DILocation(line: 482, column: 6, scope: !476)
!476 = distinct !DILexicalBlock(scope: !463, file: !69, line: 482, column: 5)
!477 = !DILocation(line: 482, column: 14, scope: !476)
!478 = !DILocation(line: 482, column: 24, scope: !476)
!479 = !DILocation(line: 482, column: 5, scope: !463)
!480 = !DILocation(line: 484, column: 6, scope: !481)
!481 = distinct !DILexicalBlock(scope: !482, file: !69, line: 484, column: 6)
!482 = distinct !DILexicalBlock(scope: !476, file: !69, line: 483, column: 2)
!483 = !DILocation(line: 484, column: 14, scope: !481)
!484 = !DILocation(line: 484, column: 6, scope: !482)
!485 = !DILocation(line: 486, column: 4, scope: !486)
!486 = distinct !DILexicalBlock(scope: !481, file: !69, line: 485, column: 3)
!487 = !DILocation(line: 490, column: 4, scope: !488)
!488 = distinct !DILexicalBlock(scope: !481, file: !69, line: 489, column: 3)
!489 = !DILocation(line: 495, column: 15, scope: !490)
!490 = distinct !DILexicalBlock(scope: !476, file: !69, line: 494, column: 2)
!491 = !DILocation(line: 495, column: 27, scope: !490)
!492 = !DILocation(line: 495, column: 35, scope: !490)
!493 = !DILocation(line: 495, column: 34, scope: !490)
!494 = !DILocation(line: 495, column: 46, scope: !490)
!495 = !DILocation(line: 495, column: 44, scope: !490)
!496 = !DILocation(line: 495, column: 23, scope: !490)
!497 = !DILocation(line: 495, column: 56, scope: !490)
!498 = !DILocation(line: 495, column: 12, scope: !490)
!499 = !DILocation(line: 496, column: 15, scope: !490)
!500 = !DILocation(line: 496, column: 24, scope: !490)
!501 = !DILocation(line: 496, column: 23, scope: !490)
!502 = !DILocation(line: 496, column: 36, scope: !490)
!503 = !DILocation(line: 496, column: 44, scope: !490)
!504 = !DILocation(line: 496, column: 43, scope: !490)
!505 = !DILocation(line: 496, column: 33, scope: !490)
!506 = !DILocation(line: 496, column: 12, scope: !490)
!507 = !DILocation(line: 497, column: 6, scope: !508)
!508 = distinct !DILexicalBlock(scope: !490, file: !69, line: 497, column: 6)
!509 = !DILocation(line: 497, column: 15, scope: !508)
!510 = !DILocation(line: 497, column: 6, scope: !490)
!511 = !DILocation(line: 499, column: 7, scope: !512)
!512 = distinct !DILexicalBlock(scope: !513, file: !69, line: 499, column: 7)
!513 = distinct !DILexicalBlock(scope: !508, file: !69, line: 498, column: 3)
!514 = !DILocation(line: 499, column: 16, scope: !512)
!515 = !DILocation(line: 499, column: 7, scope: !513)
!516 = !DILocation(line: 501, column: 17, scope: !517)
!517 = distinct !DILexicalBlock(scope: !512, file: !69, line: 500, column: 4)
!518 = !DILocation(line: 501, column: 12, scope: !517)
!519 = !DILocation(line: 501, column: 5, scope: !517)
!520 = !DILocation(line: 505, column: 5, scope: !521)
!521 = distinct !DILexicalBlock(scope: !512, file: !69, line: 504, column: 4)
!522 = !DILocation(line: 510, column: 4, scope: !523)
!523 = distinct !DILexicalBlock(scope: !508, file: !69, line: 509, column: 3)
!524 = !DILocation(line: 513, column: 1, scope: !463)
!525 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 531, type: !526, scopeLine: 532, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!526 = !DISubroutineType(types: !527)
!527 = !{!18, !18, !18}
!528 = !DILocalVariable(name: "numerator", arg: 1, scope: !525, file: !69, line: 531, type: !18)
!529 = !DILocation(line: 531, column: 31, scope: !525)
!530 = !DILocalVariable(name: "denominator", arg: 2, scope: !525, file: !69, line: 531, type: !18)
!531 = !DILocation(line: 531, column: 46, scope: !525)
!532 = !DILocalVariable(name: "u32Temp", scope: !525, file: !69, line: 533, type: !428)
!533 = !DILocation(line: 533, column: 6, scope: !525)
!534 = !DILocation(line: 534, column: 5, scope: !535)
!535 = distinct !DILexicalBlock(scope: !525, file: !69, line: 534, column: 5)
!536 = !DILocation(line: 534, column: 17, scope: !535)
!537 = !DILocation(line: 534, column: 5, scope: !525)
!538 = !DILocation(line: 536, column: 3, scope: !539)
!539 = distinct !DILexicalBlock(scope: !535, file: !69, line: 535, column: 2)
!540 = !DILocation(line: 540, column: 14, scope: !541)
!541 = distinct !DILexicalBlock(scope: !535, file: !69, line: 539, column: 2)
!542 = !DILocation(line: 540, column: 23, scope: !541)
!543 = !DILocation(line: 540, column: 32, scope: !541)
!544 = !DILocation(line: 540, column: 44, scope: !541)
!545 = !DILocation(line: 540, column: 29, scope: !541)
!546 = !DILocation(line: 540, column: 11, scope: !541)
!547 = !DILocation(line: 541, column: 13, scope: !541)
!548 = !DILocation(line: 541, column: 21, scope: !541)
!549 = !DILocation(line: 541, column: 20, scope: !541)
!550 = !DILocation(line: 541, column: 11, scope: !541)
!551 = !DILocation(line: 542, column: 6, scope: !552)
!552 = distinct !DILexicalBlock(scope: !541, file: !69, line: 542, column: 6)
!553 = !DILocation(line: 542, column: 14, scope: !552)
!554 = !DILocation(line: 542, column: 6, scope: !541)
!555 = !DILocation(line: 544, column: 11, scope: !556)
!556 = distinct !DILexicalBlock(scope: !552, file: !69, line: 543, column: 3)
!557 = !DILocation(line: 544, column: 19, scope: !556)
!558 = !DILocation(line: 544, column: 4, scope: !556)
!559 = !DILocation(line: 548, column: 4, scope: !560)
!560 = distinct !DILexicalBlock(scope: !552, file: !69, line: 547, column: 3)
!561 = !DILocation(line: 552, column: 1, scope: !525)
!562 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 569, type: !563, scopeLine: 570, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!563 = !DISubroutineType(types: !564)
!564 = !{!18, !428, !18}
!565 = !DILocalVariable(name: "x_value", arg: 1, scope: !562, file: !69, line: 569, type: !428)
!566 = !DILocation(line: 569, column: 25, scope: !562)
!567 = !DILocalVariable(name: "y_value", arg: 2, scope: !562, file: !69, line: 569, type: !18)
!568 = !DILocation(line: 569, column: 38, scope: !562)
!569 = !DILocalVariable(name: "u32Temp1", scope: !562, file: !69, line: 571, type: !428)
!570 = !DILocation(line: 571, column: 6, scope: !562)
!571 = !DILocalVariable(name: "u32Temp2", scope: !562, file: !69, line: 571, type: !428)
!572 = !DILocation(line: 571, column: 17, scope: !562)
!573 = !DILocation(line: 572, column: 12, scope: !562)
!574 = !DILocation(line: 572, column: 20, scope: !562)
!575 = !DILocation(line: 572, column: 10, scope: !562)
!576 = !DILocation(line: 573, column: 5, scope: !577)
!577 = distinct !DILexicalBlock(scope: !562, file: !69, line: 573, column: 5)
!578 = !DILocation(line: 573, column: 13, scope: !577)
!579 = !DILocation(line: 573, column: 5, scope: !562)
!580 = !DILocation(line: 575, column: 3, scope: !581)
!581 = distinct !DILexicalBlock(scope: !577, file: !69, line: 574, column: 2)
!582 = !DILocation(line: 579, column: 14, scope: !583)
!583 = distinct !DILexicalBlock(scope: !577, file: !69, line: 578, column: 2)
!584 = !DILocation(line: 579, column: 22, scope: !583)
!585 = !DILocation(line: 579, column: 21, scope: !583)
!586 = !DILocation(line: 579, column: 12, scope: !583)
!587 = !DILocation(line: 580, column: 14, scope: !583)
!588 = !DILocation(line: 580, column: 25, scope: !583)
!589 = !DILocation(line: 580, column: 36, scope: !583)
!590 = !DILocation(line: 580, column: 34, scope: !583)
!591 = !DILocation(line: 580, column: 22, scope: !583)
!592 = !DILocation(line: 580, column: 45, scope: !583)
!593 = !DILocation(line: 580, column: 12, scope: !583)
!594 = !DILocation(line: 581, column: 15, scope: !583)
!595 = !DILocation(line: 581, column: 24, scope: !583)
!596 = !DILocation(line: 581, column: 23, scope: !583)
!597 = !DILocation(line: 581, column: 36, scope: !583)
!598 = !DILocation(line: 581, column: 44, scope: !583)
!599 = !DILocation(line: 581, column: 43, scope: !583)
!600 = !DILocation(line: 581, column: 33, scope: !583)
!601 = !DILocation(line: 581, column: 12, scope: !583)
!602 = !DILocation(line: 582, column: 6, scope: !603)
!603 = distinct !DILexicalBlock(scope: !583, file: !69, line: 582, column: 6)
!604 = !DILocation(line: 582, column: 15, scope: !603)
!605 = !DILocation(line: 582, column: 6, scope: !583)
!606 = !DILocation(line: 584, column: 11, scope: !607)
!607 = distinct !DILexicalBlock(scope: !603, file: !69, line: 583, column: 3)
!608 = !DILocation(line: 584, column: 20, scope: !607)
!609 = !DILocation(line: 584, column: 4, scope: !607)
!610 = !DILocation(line: 588, column: 4, scope: !611)
!611 = distinct !DILexicalBlock(scope: !603, file: !69, line: 587, column: 3)
!612 = !DILocation(line: 592, column: 1, scope: !562)
!613 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 611, type: !614, scopeLine: 612, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!614 = !DISubroutineType(types: !615)
!615 = !{!6, !6, !18, !6}
!616 = !DILocalVariable(name: "factor1", arg: 1, scope: !613, file: !69, line: 611, type: !6)
!617 = !DILocation(line: 611, column: 33, scope: !613)
!618 = !DILocalVariable(name: "factor2", arg: 2, scope: !613, file: !69, line: 611, type: !18)
!619 = !DILocation(line: 611, column: 46, scope: !613)
!620 = !DILocalVariable(name: "denominator", arg: 3, scope: !613, file: !69, line: 611, type: !6)
!621 = !DILocation(line: 611, column: 59, scope: !613)
!622 = !DILocalVariable(name: "s32Result", scope: !613, file: !69, line: 613, type: !25)
!623 = !DILocation(line: 613, column: 6, scope: !613)
!624 = !DILocalVariable(name: "s32Temp1", scope: !613, file: !69, line: 613, type: !25)
!625 = !DILocation(line: 613, column: 21, scope: !613)
!626 = !DILocation(line: 614, column: 14, scope: !613)
!627 = !DILocation(line: 614, column: 24, scope: !613)
!628 = !DILocation(line: 614, column: 22, scope: !613)
!629 = !DILocation(line: 614, column: 12, scope: !613)
!630 = !DILocation(line: 615, column: 5, scope: !631)
!631 = distinct !DILexicalBlock(scope: !613, file: !69, line: 615, column: 5)
!632 = !DILocation(line: 615, column: 17, scope: !631)
!633 = !DILocation(line: 615, column: 5, scope: !613)
!634 = !DILocation(line: 617, column: 6, scope: !635)
!635 = distinct !DILexicalBlock(scope: !636, file: !69, line: 617, column: 6)
!636 = distinct !DILexicalBlock(scope: !631, file: !69, line: 616, column: 2)
!637 = !DILocation(line: 617, column: 16, scope: !635)
!638 = !DILocation(line: 617, column: 6, scope: !636)
!639 = !DILocation(line: 619, column: 4, scope: !640)
!640 = distinct !DILexicalBlock(scope: !635, file: !69, line: 618, column: 3)
!641 = !DILocation(line: 623, column: 4, scope: !642)
!642 = distinct !DILexicalBlock(scope: !635, file: !69, line: 622, column: 3)
!643 = !DILocation(line: 628, column: 14, scope: !644)
!644 = distinct !DILexicalBlock(scope: !631, file: !69, line: 627, column: 2)
!645 = !DILocation(line: 628, column: 27, scope: !644)
!646 = !DILocation(line: 628, column: 37, scope: !644)
!647 = !DILocation(line: 628, column: 36, scope: !644)
!648 = !DILocation(line: 628, column: 50, scope: !644)
!649 = !DILocation(line: 628, column: 49, scope: !644)
!650 = !DILocation(line: 628, column: 24, scope: !644)
!651 = !DILocation(line: 628, column: 12, scope: !644)
!652 = !DILocation(line: 629, column: 14, scope: !644)
!653 = !DILocation(line: 629, column: 23, scope: !644)
!654 = !DILocation(line: 629, column: 12, scope: !644)
!655 = !DILocation(line: 630, column: 16, scope: !644)
!656 = !DILocation(line: 630, column: 25, scope: !644)
!657 = !DILocation(line: 630, column: 24, scope: !644)
!658 = !DILocation(line: 630, column: 41, scope: !644)
!659 = !DILocation(line: 630, column: 51, scope: !644)
!660 = !DILocation(line: 630, column: 50, scope: !644)
!661 = !DILocation(line: 630, column: 38, scope: !644)
!662 = !DILocation(line: 630, column: 13, scope: !644)
!663 = !DILocation(line: 631, column: 6, scope: !664)
!664 = distinct !DILexicalBlock(scope: !644, file: !69, line: 631, column: 6)
!665 = !DILocation(line: 631, column: 16, scope: !664)
!666 = !DILocation(line: 631, column: 6, scope: !644)
!667 = !DILocation(line: 633, column: 7, scope: !668)
!668 = distinct !DILexicalBlock(scope: !669, file: !69, line: 633, column: 7)
!669 = distinct !DILexicalBlock(scope: !664, file: !69, line: 632, column: 3)
!670 = !DILocation(line: 633, column: 17, scope: !668)
!671 = !DILocation(line: 633, column: 7, scope: !669)
!672 = !DILocation(line: 635, column: 17, scope: !673)
!673 = distinct !DILexicalBlock(scope: !668, file: !69, line: 634, column: 4)
!674 = !DILocation(line: 635, column: 12, scope: !673)
!675 = !DILocation(line: 635, column: 5, scope: !673)
!676 = !DILocation(line: 640, column: 5, scope: !677)
!677 = distinct !DILexicalBlock(scope: !668, file: !69, line: 639, column: 4)
!678 = !DILocation(line: 645, column: 4, scope: !679)
!679 = distinct !DILexicalBlock(scope: !664, file: !69, line: 644, column: 3)
!680 = !DILocation(line: 649, column: 1, scope: !613)
!681 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 667, type: !682, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!682 = !DISubroutineType(types: !683)
!683 = !{!6, !18, !6, !18}
!684 = !DILocalVariable(name: "factor1", arg: 1, scope: !681, file: !69, line: 667, type: !18)
!685 = !DILocation(line: 667, column: 33, scope: !681)
!686 = !DILocalVariable(name: "factor2", arg: 2, scope: !681, file: !69, line: 667, type: !6)
!687 = !DILocation(line: 667, column: 46, scope: !681)
!688 = !DILocalVariable(name: "denominator", arg: 3, scope: !681, file: !69, line: 667, type: !18)
!689 = !DILocation(line: 667, column: 59, scope: !681)
!690 = !DILocalVariable(name: "s32Result", scope: !681, file: !69, line: 669, type: !25)
!691 = !DILocation(line: 669, column: 6, scope: !681)
!692 = !DILocalVariable(name: "s32Temp1", scope: !681, file: !69, line: 669, type: !25)
!693 = !DILocation(line: 669, column: 21, scope: !681)
!694 = !DILocation(line: 670, column: 14, scope: !681)
!695 = !DILocation(line: 670, column: 24, scope: !681)
!696 = !DILocation(line: 670, column: 22, scope: !681)
!697 = !DILocation(line: 670, column: 12, scope: !681)
!698 = !DILocation(line: 671, column: 5, scope: !699)
!699 = distinct !DILexicalBlock(scope: !681, file: !69, line: 671, column: 5)
!700 = !DILocation(line: 671, column: 16, scope: !699)
!701 = !DILocation(line: 671, column: 5, scope: !681)
!702 = !DILocation(line: 673, column: 6, scope: !703)
!703 = distinct !DILexicalBlock(scope: !704, file: !69, line: 673, column: 6)
!704 = distinct !DILexicalBlock(scope: !699, file: !69, line: 672, column: 2)
!705 = !DILocation(line: 673, column: 16, scope: !703)
!706 = !DILocation(line: 673, column: 6, scope: !704)
!707 = !DILocation(line: 675, column: 4, scope: !708)
!708 = distinct !DILexicalBlock(scope: !703, file: !69, line: 674, column: 3)
!709 = !DILocation(line: 679, column: 4, scope: !710)
!710 = distinct !DILexicalBlock(scope: !703, file: !69, line: 678, column: 3)
!711 = !DILocation(line: 684, column: 14, scope: !712)
!712 = distinct !DILexicalBlock(scope: !699, file: !69, line: 683, column: 2)
!713 = !DILocation(line: 684, column: 28, scope: !712)
!714 = !DILocation(line: 684, column: 38, scope: !712)
!715 = !DILocation(line: 684, column: 37, scope: !712)
!716 = !DILocation(line: 684, column: 53, scope: !712)
!717 = !DILocation(line: 684, column: 51, scope: !712)
!718 = !DILocation(line: 684, column: 24, scope: !712)
!719 = !DILocation(line: 684, column: 66, scope: !712)
!720 = !DILocation(line: 684, column: 12, scope: !712)
!721 = !DILocation(line: 685, column: 16, scope: !712)
!722 = !DILocation(line: 685, column: 25, scope: !712)
!723 = !DILocation(line: 685, column: 24, scope: !712)
!724 = !DILocation(line: 685, column: 41, scope: !712)
!725 = !DILocation(line: 685, column: 51, scope: !712)
!726 = !DILocation(line: 685, column: 50, scope: !712)
!727 = !DILocation(line: 685, column: 38, scope: !712)
!728 = !DILocation(line: 685, column: 13, scope: !712)
!729 = !DILocation(line: 686, column: 6, scope: !730)
!730 = distinct !DILexicalBlock(scope: !712, file: !69, line: 686, column: 6)
!731 = !DILocation(line: 686, column: 16, scope: !730)
!732 = !DILocation(line: 686, column: 6, scope: !712)
!733 = !DILocation(line: 688, column: 7, scope: !734)
!734 = distinct !DILexicalBlock(scope: !735, file: !69, line: 688, column: 7)
!735 = distinct !DILexicalBlock(scope: !730, file: !69, line: 687, column: 3)
!736 = !DILocation(line: 688, column: 17, scope: !734)
!737 = !DILocation(line: 688, column: 7, scope: !735)
!738 = !DILocation(line: 690, column: 17, scope: !739)
!739 = distinct !DILexicalBlock(scope: !734, file: !69, line: 689, column: 4)
!740 = !DILocation(line: 690, column: 12, scope: !739)
!741 = !DILocation(line: 690, column: 5, scope: !739)
!742 = !DILocation(line: 694, column: 5, scope: !743)
!743 = distinct !DILexicalBlock(scope: !734, file: !69, line: 693, column: 4)
!744 = !DILocation(line: 699, column: 4, scope: !745)
!745 = distinct !DILexicalBlock(scope: !730, file: !69, line: 698, column: 3)
!746 = !DILocation(line: 702, column: 1, scope: !681)
!747 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 721, type: !748, scopeLine: 722, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!748 = !DISubroutineType(types: !749)
!749 = !{!18, !6, !18, !6}
!750 = !DILocalVariable(name: "factor1", arg: 1, scope: !747, file: !69, line: 721, type: !6)
!751 = !DILocation(line: 721, column: 33, scope: !747)
!752 = !DILocalVariable(name: "factor2", arg: 2, scope: !747, file: !69, line: 721, type: !18)
!753 = !DILocation(line: 721, column: 46, scope: !747)
!754 = !DILocalVariable(name: "denominator", arg: 3, scope: !747, file: !69, line: 721, type: !6)
!755 = !DILocation(line: 721, column: 59, scope: !747)
!756 = !DILocalVariable(name: "u32Result", scope: !747, file: !69, line: 723, type: !428)
!757 = !DILocation(line: 723, column: 6, scope: !747)
!758 = !DILocalVariable(name: "u32Temp1", scope: !747, file: !69, line: 723, type: !428)
!759 = !DILocation(line: 723, column: 21, scope: !747)
!760 = !DILocalVariable(name: "s32Result", scope: !747, file: !69, line: 724, type: !25)
!761 = !DILocation(line: 724, column: 6, scope: !747)
!762 = !DILocalVariable(name: "s32Temp1", scope: !747, file: !69, line: 724, type: !25)
!763 = !DILocation(line: 724, column: 21, scope: !747)
!764 = !DILocation(line: 725, column: 14, scope: !747)
!765 = !DILocation(line: 725, column: 24, scope: !747)
!766 = !DILocation(line: 725, column: 22, scope: !747)
!767 = !DILocation(line: 725, column: 12, scope: !747)
!768 = !DILocation(line: 727, column: 5, scope: !769)
!769 = distinct !DILexicalBlock(scope: !747, file: !69, line: 727, column: 5)
!770 = !DILocation(line: 727, column: 17, scope: !769)
!771 = !DILocation(line: 727, column: 5, scope: !747)
!772 = !DILocation(line: 729, column: 6, scope: !773)
!773 = distinct !DILexicalBlock(scope: !774, file: !69, line: 729, column: 6)
!774 = distinct !DILexicalBlock(scope: !769, file: !69, line: 728, column: 2)
!775 = !DILocation(line: 729, column: 16, scope: !773)
!776 = !DILocation(line: 729, column: 6, scope: !774)
!777 = !DILocation(line: 731, column: 4, scope: !778)
!778 = distinct !DILexicalBlock(scope: !773, file: !69, line: 730, column: 3)
!779 = !DILocation(line: 735, column: 4, scope: !780)
!780 = distinct !DILexicalBlock(scope: !773, file: !69, line: 734, column: 3)
!781 = !DILocation(line: 740, column: 15, scope: !782)
!782 = distinct !DILexicalBlock(scope: !769, file: !69, line: 739, column: 2)
!783 = !DILocation(line: 740, column: 29, scope: !782)
!784 = !DILocation(line: 740, column: 39, scope: !782)
!785 = !DILocation(line: 740, column: 38, scope: !782)
!786 = !DILocation(line: 740, column: 54, scope: !782)
!787 = !DILocation(line: 740, column: 52, scope: !782)
!788 = !DILocation(line: 740, column: 25, scope: !782)
!789 = !DILocation(line: 740, column: 68, scope: !782)
!790 = !DILocation(line: 740, column: 12, scope: !782)
!791 = !DILocation(line: 741, column: 16, scope: !782)
!792 = !DILocation(line: 741, column: 25, scope: !782)
!793 = !DILocation(line: 741, column: 24, scope: !782)
!794 = !DILocation(line: 741, column: 41, scope: !782)
!795 = !DILocation(line: 741, column: 51, scope: !782)
!796 = !DILocation(line: 741, column: 50, scope: !782)
!797 = !DILocation(line: 741, column: 38, scope: !782)
!798 = !DILocation(line: 741, column: 13, scope: !782)
!799 = !DILocation(line: 742, column: 6, scope: !800)
!800 = distinct !DILexicalBlock(scope: !782, file: !69, line: 742, column: 6)
!801 = !DILocation(line: 742, column: 16, scope: !800)
!802 = !DILocation(line: 742, column: 6, scope: !782)
!803 = !DILocation(line: 744, column: 7, scope: !804)
!804 = distinct !DILexicalBlock(scope: !805, file: !69, line: 744, column: 7)
!805 = distinct !DILexicalBlock(scope: !800, file: !69, line: 743, column: 3)
!806 = !DILocation(line: 744, column: 17, scope: !804)
!807 = !DILocation(line: 744, column: 7, scope: !805)
!808 = !DILocation(line: 746, column: 17, scope: !809)
!809 = distinct !DILexicalBlock(scope: !804, file: !69, line: 745, column: 4)
!810 = !DILocation(line: 746, column: 12, scope: !809)
!811 = !DILocation(line: 746, column: 5, scope: !809)
!812 = !DILocation(line: 750, column: 5, scope: !813)
!813 = distinct !DILexicalBlock(scope: !804, file: !69, line: 749, column: 4)
!814 = !DILocation(line: 755, column: 4, scope: !815)
!815 = distinct !DILexicalBlock(scope: !800, file: !69, line: 754, column: 3)
!816 = !DILocation(line: 758, column: 1, scope: !747)
!817 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 777, type: !818, scopeLine: 778, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!818 = !DISubroutineType(types: !819)
!819 = !{!18, !6, !18, !18}
!820 = !DILocalVariable(name: "factor1", arg: 1, scope: !817, file: !69, line: 777, type: !6)
!821 = !DILocation(line: 777, column: 33, scope: !817)
!822 = !DILocalVariable(name: "factor2", arg: 2, scope: !817, file: !69, line: 777, type: !18)
!823 = !DILocation(line: 777, column: 46, scope: !817)
!824 = !DILocalVariable(name: "denominator", arg: 3, scope: !817, file: !69, line: 777, type: !18)
!825 = !DILocation(line: 777, column: 59, scope: !817)
!826 = !DILocalVariable(name: "s32Result", scope: !817, file: !69, line: 779, type: !25)
!827 = !DILocation(line: 779, column: 6, scope: !817)
!828 = !DILocalVariable(name: "s32Temp1", scope: !817, file: !69, line: 779, type: !25)
!829 = !DILocation(line: 779, column: 21, scope: !817)
!830 = !DILocation(line: 780, column: 14, scope: !817)
!831 = !DILocation(line: 780, column: 24, scope: !817)
!832 = !DILocation(line: 780, column: 22, scope: !817)
!833 = !DILocation(line: 780, column: 12, scope: !817)
!834 = !DILocation(line: 782, column: 5, scope: !835)
!835 = distinct !DILexicalBlock(scope: !817, file: !69, line: 782, column: 5)
!836 = !DILocation(line: 782, column: 17, scope: !835)
!837 = !DILocation(line: 782, column: 5, scope: !817)
!838 = !DILocation(line: 784, column: 6, scope: !839)
!839 = distinct !DILexicalBlock(scope: !840, file: !69, line: 784, column: 6)
!840 = distinct !DILexicalBlock(scope: !835, file: !69, line: 783, column: 2)
!841 = !DILocation(line: 784, column: 16, scope: !839)
!842 = !DILocation(line: 784, column: 6, scope: !840)
!843 = !DILocation(line: 786, column: 4, scope: !844)
!844 = distinct !DILexicalBlock(scope: !839, file: !69, line: 785, column: 3)
!845 = !DILocation(line: 790, column: 4, scope: !846)
!846 = distinct !DILexicalBlock(scope: !839, file: !69, line: 789, column: 3)
!847 = !DILocation(line: 795, column: 15, scope: !848)
!848 = distinct !DILexicalBlock(scope: !835, file: !69, line: 794, column: 2)
!849 = !DILocation(line: 795, column: 29, scope: !848)
!850 = !DILocation(line: 795, column: 39, scope: !848)
!851 = !DILocation(line: 795, column: 38, scope: !848)
!852 = !DILocation(line: 795, column: 54, scope: !848)
!853 = !DILocation(line: 795, column: 52, scope: !848)
!854 = !DILocation(line: 795, column: 25, scope: !848)
!855 = !DILocation(line: 795, column: 68, scope: !848)
!856 = !DILocation(line: 795, column: 12, scope: !848)
!857 = !DILocation(line: 796, column: 16, scope: !848)
!858 = !DILocation(line: 796, column: 25, scope: !848)
!859 = !DILocation(line: 796, column: 24, scope: !848)
!860 = !DILocation(line: 796, column: 41, scope: !848)
!861 = !DILocation(line: 796, column: 51, scope: !848)
!862 = !DILocation(line: 796, column: 50, scope: !848)
!863 = !DILocation(line: 796, column: 38, scope: !848)
!864 = !DILocation(line: 796, column: 13, scope: !848)
!865 = !DILocation(line: 797, column: 6, scope: !866)
!866 = distinct !DILexicalBlock(scope: !848, file: !69, line: 797, column: 6)
!867 = !DILocation(line: 797, column: 16, scope: !866)
!868 = !DILocation(line: 797, column: 6, scope: !848)
!869 = !DILocation(line: 799, column: 7, scope: !870)
!870 = distinct !DILexicalBlock(scope: !871, file: !69, line: 799, column: 7)
!871 = distinct !DILexicalBlock(scope: !866, file: !69, line: 798, column: 3)
!872 = !DILocation(line: 799, column: 17, scope: !870)
!873 = !DILocation(line: 799, column: 7, scope: !871)
!874 = !DILocation(line: 801, column: 17, scope: !875)
!875 = distinct !DILexicalBlock(scope: !870, file: !69, line: 800, column: 4)
!876 = !DILocation(line: 801, column: 12, scope: !875)
!877 = !DILocation(line: 801, column: 5, scope: !875)
!878 = !DILocation(line: 805, column: 5, scope: !879)
!879 = distinct !DILexicalBlock(scope: !870, file: !69, line: 804, column: 4)
!880 = !DILocation(line: 810, column: 4, scope: !881)
!881 = distinct !DILexicalBlock(scope: !866, file: !69, line: 809, column: 3)
!882 = !DILocation(line: 814, column: 1, scope: !817)
!883 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 832, type: !884, scopeLine: 833, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!884 = !DISubroutineType(types: !885)
!885 = !{!18, !18, !18, !18}
!886 = !DILocalVariable(name: "factor1", arg: 1, scope: !883, file: !69, line: 832, type: !18)
!887 = !DILocation(line: 832, column: 33, scope: !883)
!888 = !DILocalVariable(name: "factor2", arg: 2, scope: !883, file: !69, line: 832, type: !18)
!889 = !DILocation(line: 832, column: 46, scope: !883)
!890 = !DILocalVariable(name: "denominator", arg: 3, scope: !883, file: !69, line: 832, type: !18)
!891 = !DILocation(line: 832, column: 59, scope: !883)
!892 = !DILocalVariable(name: "u32Temp1", scope: !883, file: !69, line: 834, type: !428)
!893 = !DILocation(line: 834, column: 6, scope: !883)
!894 = !DILocalVariable(name: "u16TempDenom", scope: !883, file: !69, line: 835, type: !18)
!895 = !DILocation(line: 835, column: 6, scope: !883)
!896 = !DILocation(line: 837, column: 5, scope: !897)
!897 = distinct !DILexicalBlock(scope: !883, file: !69, line: 837, column: 5)
!898 = !DILocation(line: 837, column: 17, scope: !897)
!899 = !DILocation(line: 837, column: 5, scope: !883)
!900 = !DILocation(line: 839, column: 3, scope: !901)
!901 = distinct !DILexicalBlock(scope: !897, file: !69, line: 838, column: 2)
!902 = !DILocation(line: 843, column: 14, scope: !903)
!903 = distinct !DILexicalBlock(scope: !897, file: !69, line: 842, column: 2)
!904 = !DILocation(line: 843, column: 24, scope: !903)
!905 = !DILocation(line: 843, column: 22, scope: !903)
!906 = !DILocation(line: 843, column: 12, scope: !903)
!907 = !DILocation(line: 844, column: 18, scope: !903)
!908 = !DILocation(line: 844, column: 30, scope: !903)
!909 = !DILocation(line: 844, column: 16, scope: !903)
!910 = !DILocation(line: 845, column: 14, scope: !903)
!911 = !DILocation(line: 845, column: 25, scope: !903)
!912 = !DILocation(line: 845, column: 23, scope: !903)
!913 = !DILocation(line: 845, column: 12, scope: !903)
!914 = !DILocation(line: 846, column: 14, scope: !903)
!915 = !DILocation(line: 846, column: 25, scope: !903)
!916 = !DILocation(line: 846, column: 23, scope: !903)
!917 = !DILocation(line: 846, column: 12, scope: !903)
!918 = !DILocation(line: 847, column: 6, scope: !919)
!919 = distinct !DILexicalBlock(scope: !903, file: !69, line: 847, column: 6)
!920 = !DILocation(line: 847, column: 15, scope: !919)
!921 = !DILocation(line: 847, column: 6, scope: !903)
!922 = !DILocation(line: 849, column: 12, scope: !923)
!923 = distinct !DILexicalBlock(scope: !919, file: !69, line: 848, column: 3)
!924 = !DILocation(line: 849, column: 21, scope: !923)
!925 = !DILocation(line: 849, column: 11, scope: !923)
!926 = !DILocation(line: 849, column: 4, scope: !923)
!927 = !DILocation(line: 854, column: 4, scope: !928)
!928 = distinct !DILexicalBlock(scope: !919, file: !69, line: 853, column: 3)
!929 = !DILocation(line: 859, column: 1, scope: !883)
!930 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 876, type: !931, scopeLine: 877, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!931 = !DISubroutineType(types: !932)
!932 = !{!18, !18, !18, !428}
!933 = !DILocalVariable(name: "factor1", arg: 1, scope: !930, file: !69, line: 876, type: !18)
!934 = !DILocation(line: 876, column: 33, scope: !930)
!935 = !DILocalVariable(name: "factor2", arg: 2, scope: !930, file: !69, line: 876, type: !18)
!936 = !DILocation(line: 876, column: 46, scope: !930)
!937 = !DILocalVariable(name: "denominator", arg: 3, scope: !930, file: !69, line: 876, type: !428)
!938 = !DILocation(line: 876, column: 59, scope: !930)
!939 = !DILocalVariable(name: "u32Temp1", scope: !930, file: !69, line: 878, type: !428)
!940 = !DILocation(line: 878, column: 6, scope: !930)
!941 = !DILocation(line: 879, column: 5, scope: !942)
!942 = distinct !DILexicalBlock(scope: !930, file: !69, line: 879, column: 5)
!943 = !DILocation(line: 879, column: 17, scope: !942)
!944 = !DILocation(line: 879, column: 5, scope: !930)
!945 = !DILocation(line: 881, column: 3, scope: !946)
!946 = distinct !DILexicalBlock(scope: !942, file: !69, line: 880, column: 2)
!947 = !DILocation(line: 885, column: 15, scope: !948)
!948 = distinct !DILexicalBlock(scope: !942, file: !69, line: 884, column: 2)
!949 = !DILocation(line: 885, column: 25, scope: !948)
!950 = !DILocation(line: 885, column: 23, scope: !948)
!951 = !DILocation(line: 885, column: 36, scope: !948)
!952 = !DILocation(line: 885, column: 34, scope: !948)
!953 = !DILocation(line: 885, column: 12, scope: !948)
!954 = !DILocation(line: 886, column: 8, scope: !955)
!955 = distinct !DILexicalBlock(scope: !948, file: !69, line: 886, column: 6)
!956 = !DILocation(line: 886, column: 18, scope: !955)
!957 = !DILocation(line: 886, column: 16, scope: !955)
!958 = !DILocation(line: 886, column: 28, scope: !955)
!959 = !DILocation(line: 886, column: 40, scope: !955)
!960 = !DILocation(line: 886, column: 39, scope: !955)
!961 = !DILocation(line: 886, column: 26, scope: !955)
!962 = !DILocation(line: 886, column: 53, scope: !955)
!963 = !DILocation(line: 886, column: 64, scope: !955)
!964 = !DILocation(line: 886, column: 50, scope: !955)
!965 = !DILocation(line: 886, column: 6, scope: !948)
!966 = !DILocation(line: 888, column: 12, scope: !967)
!967 = distinct !DILexicalBlock(scope: !955, file: !69, line: 887, column: 3)
!968 = !DILocation(line: 889, column: 3, scope: !967)
!969 = !DILocation(line: 890, column: 6, scope: !970)
!970 = distinct !DILexicalBlock(scope: !948, file: !69, line: 890, column: 6)
!971 = !DILocation(line: 890, column: 15, scope: !970)
!972 = !DILocation(line: 890, column: 6, scope: !948)
!973 = !DILocation(line: 892, column: 12, scope: !974)
!974 = distinct !DILexicalBlock(scope: !970, file: !69, line: 891, column: 3)
!975 = !DILocation(line: 892, column: 21, scope: !974)
!976 = !DILocation(line: 892, column: 11, scope: !974)
!977 = !DILocation(line: 892, column: 4, scope: !974)
!978 = !DILocation(line: 896, column: 4, scope: !979)
!979 = distinct !DILexicalBlock(scope: !970, file: !69, line: 895, column: 3)
!980 = !DILocation(line: 899, column: 1, scope: !930)
!981 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 916, type: !982, scopeLine: 917, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!982 = !DISubroutineType(types: !983)
!983 = !{!428, !428, !18}
!984 = !DILocalVariable(name: "x_value", arg: 1, scope: !981, file: !69, line: 916, type: !428)
!985 = !DILocation(line: 916, column: 25, scope: !981)
!986 = !DILocalVariable(name: "y_value", arg: 2, scope: !981, file: !69, line: 916, type: !18)
!987 = !DILocation(line: 916, column: 38, scope: !981)
!988 = !DILocalVariable(name: "u32Temp1", scope: !981, file: !69, line: 918, type: !428)
!989 = !DILocation(line: 918, column: 6, scope: !981)
!990 = !DILocation(line: 919, column: 5, scope: !991)
!991 = distinct !DILexicalBlock(scope: !981, file: !69, line: 919, column: 5)
!992 = !DILocation(line: 919, column: 13, scope: !991)
!993 = !DILocation(line: 919, column: 5, scope: !981)
!994 = !DILocation(line: 921, column: 3, scope: !995)
!995 = distinct !DILexicalBlock(scope: !991, file: !69, line: 920, column: 2)
!996 = !DILocation(line: 925, column: 15, scope: !997)
!997 = distinct !DILexicalBlock(scope: !991, file: !69, line: 924, column: 2)
!998 = !DILocation(line: 925, column: 26, scope: !997)
!999 = !DILocation(line: 925, column: 34, scope: !997)
!1000 = !DILocation(line: 925, column: 33, scope: !997)
!1001 = !DILocation(line: 925, column: 45, scope: !997)
!1002 = !DILocation(line: 925, column: 43, scope: !997)
!1003 = !DILocation(line: 925, column: 23, scope: !997)
!1004 = !DILocation(line: 925, column: 54, scope: !997)
!1005 = !DILocation(line: 925, column: 12, scope: !997)
!1006 = !DILocation(line: 926, column: 15, scope: !997)
!1007 = !DILocation(line: 926, column: 23, scope: !997)
!1008 = !DILocation(line: 926, column: 22, scope: !997)
!1009 = !DILocation(line: 926, column: 35, scope: !997)
!1010 = !DILocation(line: 926, column: 44, scope: !997)
!1011 = !DILocation(line: 926, column: 43, scope: !997)
!1012 = !DILocation(line: 926, column: 32, scope: !997)
!1013 = !DILocation(line: 926, column: 12, scope: !997)
!1014 = !DILocation(line: 927, column: 10, scope: !997)
!1015 = !DILocation(line: 927, column: 3, scope: !997)
!1016 = !DILocation(line: 929, column: 1, scope: !981)
!1017 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 947, type: !1018, scopeLine: 948, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1018 = !DISubroutineType(types: !1019)
!1019 = !{!6, !6, !6, !6}
!1020 = !DILocalVariable(name: "fak1", arg: 1, scope: !1017, file: !69, line: 947, type: !6)
!1021 = !DILocation(line: 947, column: 33, scope: !1017)
!1022 = !DILocalVariable(name: "fak2", arg: 2, scope: !1017, file: !69, line: 947, type: !6)
!1023 = !DILocation(line: 947, column: 43, scope: !1017)
!1024 = !DILocalVariable(name: "div", arg: 3, scope: !1017, file: !69, line: 947, type: !6)
!1025 = !DILocation(line: 947, column: 53, scope: !1017)
!1026 = !DILocalVariable(name: "s32Temp1", scope: !1017, file: !69, line: 949, type: !25)
!1027 = !DILocation(line: 949, column: 6, scope: !1017)
!1028 = !DILocalVariable(name: "s32Temp2", scope: !1017, file: !69, line: 949, type: !25)
!1029 = !DILocation(line: 949, column: 20, scope: !1017)
!1030 = !DILocalVariable(name: "s32Temp3", scope: !1017, file: !69, line: 949, type: !25)
!1031 = !DILocation(line: 949, column: 34, scope: !1017)
!1032 = !DILocation(line: 950, column: 13, scope: !1017)
!1033 = !DILocation(line: 950, column: 20, scope: !1017)
!1034 = !DILocation(line: 950, column: 18, scope: !1017)
!1035 = !DILocation(line: 950, column: 11, scope: !1017)
!1036 = !DILocation(line: 951, column: 5, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1017, file: !69, line: 951, column: 5)
!1038 = !DILocation(line: 951, column: 9, scope: !1037)
!1039 = !DILocation(line: 951, column: 5, scope: !1017)
!1040 = !DILocation(line: 953, column: 6, scope: !1041)
!1041 = distinct !DILexicalBlock(scope: !1042, file: !69, line: 953, column: 6)
!1042 = distinct !DILexicalBlock(scope: !1037, file: !69, line: 952, column: 2)
!1043 = !DILocation(line: 953, column: 15, scope: !1041)
!1044 = !DILocation(line: 953, column: 6, scope: !1042)
!1045 = !DILocation(line: 955, column: 4, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1041, file: !69, line: 954, column: 3)
!1047 = !DILocation(line: 959, column: 4, scope: !1048)
!1048 = distinct !DILexicalBlock(scope: !1041, file: !69, line: 958, column: 3)
!1049 = !DILocation(line: 964, column: 15, scope: !1050)
!1050 = distinct !DILexicalBlock(scope: !1037, file: !69, line: 963, column: 2)
!1051 = !DILocation(line: 964, column: 28, scope: !1050)
!1052 = !DILocation(line: 964, column: 39, scope: !1050)
!1053 = !DILocation(line: 964, column: 37, scope: !1050)
!1054 = !DILocation(line: 964, column: 46, scope: !1050)
!1055 = !DILocation(line: 964, column: 44, scope: !1050)
!1056 = !DILocation(line: 964, column: 24, scope: !1050)
!1057 = !DILocation(line: 964, column: 52, scope: !1050)
!1058 = !DILocation(line: 964, column: 12, scope: !1050)
!1059 = !DILocation(line: 965, column: 15, scope: !1050)
!1060 = !DILocation(line: 965, column: 24, scope: !1050)
!1061 = !DILocation(line: 965, column: 23, scope: !1050)
!1062 = !DILocation(line: 965, column: 32, scope: !1050)
!1063 = !DILocation(line: 965, column: 41, scope: !1050)
!1064 = !DILocation(line: 965, column: 40, scope: !1050)
!1065 = !DILocation(line: 965, column: 29, scope: !1050)
!1066 = !DILocation(line: 965, column: 12, scope: !1050)
!1067 = !DILocation(line: 966, column: 6, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1050, file: !69, line: 966, column: 6)
!1069 = !DILocation(line: 966, column: 15, scope: !1068)
!1070 = !DILocation(line: 966, column: 6, scope: !1050)
!1071 = !DILocation(line: 968, column: 7, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1073, file: !69, line: 968, column: 7)
!1073 = distinct !DILexicalBlock(scope: !1068, file: !69, line: 967, column: 3)
!1074 = !DILocation(line: 968, column: 16, scope: !1072)
!1075 = !DILocation(line: 968, column: 7, scope: !1073)
!1076 = !DILocation(line: 970, column: 17, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1072, file: !69, line: 969, column: 4)
!1078 = !DILocation(line: 970, column: 12, scope: !1077)
!1079 = !DILocation(line: 970, column: 5, scope: !1077)
!1080 = !DILocation(line: 974, column: 5, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1072, file: !69, line: 973, column: 4)
!1082 = !DILocation(line: 979, column: 4, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1068, file: !69, line: 978, column: 3)
!1084 = !DILocation(line: 982, column: 1, scope: !1017)
!1085 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1000, type: !1086, scopeLine: 1001, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1086 = !DISubroutineType(types: !1087)
!1087 = !{!6, !6, !6, !18}
!1088 = !DILocalVariable(name: "data1", arg: 1, scope: !1085, file: !69, line: 1000, type: !6)
!1089 = !DILocation(line: 1000, column: 33, scope: !1085)
!1090 = !DILocalVariable(name: "data2", arg: 2, scope: !1085, file: !69, line: 1000, type: !6)
!1091 = !DILocation(line: 1000, column: 43, scope: !1085)
!1092 = !DILocalVariable(name: "denominator", arg: 3, scope: !1085, file: !69, line: 1000, type: !18)
!1093 = !DILocation(line: 1000, column: 53, scope: !1085)
!1094 = !DILocalVariable(name: "s32Result", scope: !1085, file: !69, line: 1002, type: !25)
!1095 = !DILocation(line: 1002, column: 6, scope: !1085)
!1096 = !DILocalVariable(name: "s32Temp1", scope: !1085, file: !69, line: 1002, type: !25)
!1097 = !DILocation(line: 1002, column: 21, scope: !1085)
!1098 = !DILocation(line: 1003, column: 14, scope: !1085)
!1099 = !DILocation(line: 1003, column: 22, scope: !1085)
!1100 = !DILocation(line: 1003, column: 20, scope: !1085)
!1101 = !DILocation(line: 1003, column: 12, scope: !1085)
!1102 = !DILocation(line: 1005, column: 5, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1085, file: !69, line: 1005, column: 5)
!1104 = !DILocation(line: 1005, column: 17, scope: !1103)
!1105 = !DILocation(line: 1005, column: 5, scope: !1085)
!1106 = !DILocation(line: 1007, column: 6, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1108, file: !69, line: 1007, column: 6)
!1108 = distinct !DILexicalBlock(scope: !1103, file: !69, line: 1006, column: 2)
!1109 = !DILocation(line: 1007, column: 16, scope: !1107)
!1110 = !DILocation(line: 1007, column: 6, scope: !1108)
!1111 = !DILocation(line: 1009, column: 4, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1107, file: !69, line: 1008, column: 3)
!1113 = !DILocation(line: 1011, column: 11, scope: !1114)
!1114 = distinct !DILexicalBlock(scope: !1107, file: !69, line: 1011, column: 11)
!1115 = !DILocation(line: 1011, column: 21, scope: !1114)
!1116 = !DILocation(line: 1011, column: 11, scope: !1107)
!1117 = !DILocation(line: 1013, column: 4, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1114, file: !69, line: 1012, column: 3)
!1119 = !DILocation(line: 1017, column: 4, scope: !1120)
!1120 = distinct !DILexicalBlock(scope: !1114, file: !69, line: 1016, column: 3)
!1121 = !DILocation(line: 1022, column: 15, scope: !1122)
!1122 = distinct !DILexicalBlock(scope: !1103, file: !69, line: 1021, column: 2)
!1123 = !DILocation(line: 1022, column: 28, scope: !1122)
!1124 = !DILocation(line: 1022, column: 38, scope: !1122)
!1125 = !DILocation(line: 1022, column: 37, scope: !1122)
!1126 = !DILocation(line: 1022, column: 51, scope: !1122)
!1127 = !DILocation(line: 1022, column: 50, scope: !1122)
!1128 = !DILocation(line: 1022, column: 25, scope: !1122)
!1129 = !DILocation(line: 1022, column: 64, scope: !1122)
!1130 = !DILocation(line: 1022, column: 12, scope: !1122)
!1131 = !DILocation(line: 1023, column: 16, scope: !1122)
!1132 = !DILocation(line: 1023, column: 25, scope: !1122)
!1133 = !DILocation(line: 1023, column: 24, scope: !1122)
!1134 = !DILocation(line: 1023, column: 41, scope: !1122)
!1135 = !DILocation(line: 1023, column: 51, scope: !1122)
!1136 = !DILocation(line: 1023, column: 50, scope: !1122)
!1137 = !DILocation(line: 1023, column: 38, scope: !1122)
!1138 = !DILocation(line: 1023, column: 13, scope: !1122)
!1139 = !DILocation(line: 1024, column: 6, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1122, file: !69, line: 1024, column: 6)
!1141 = !DILocation(line: 1024, column: 16, scope: !1140)
!1142 = !DILocation(line: 1024, column: 6, scope: !1122)
!1143 = !DILocation(line: 1026, column: 7, scope: !1144)
!1144 = distinct !DILexicalBlock(scope: !1145, file: !69, line: 1026, column: 7)
!1145 = distinct !DILexicalBlock(scope: !1140, file: !69, line: 1025, column: 3)
!1146 = !DILocation(line: 1026, column: 17, scope: !1144)
!1147 = !DILocation(line: 1026, column: 7, scope: !1145)
!1148 = !DILocation(line: 1028, column: 17, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1144, file: !69, line: 1027, column: 4)
!1150 = !DILocation(line: 1028, column: 12, scope: !1149)
!1151 = !DILocation(line: 1028, column: 5, scope: !1149)
!1152 = !DILocation(line: 1032, column: 5, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1144, file: !69, line: 1031, column: 4)
!1154 = !DILocation(line: 1037, column: 4, scope: !1155)
!1155 = distinct !DILexicalBlock(scope: !1140, file: !69, line: 1036, column: 3)
!1156 = !DILocation(line: 1041, column: 1, scope: !1085)
!1157 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1058, type: !1158, scopeLine: 1059, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1158 = !DISubroutineType(types: !1159)
!1159 = !{!428, !428, !25}
!1160 = !DILocalVariable(name: "numerator", arg: 1, scope: !1157, file: !69, line: 1058, type: !428)
!1161 = !DILocation(line: 1058, column: 25, scope: !1157)
!1162 = !DILocalVariable(name: "denominator", arg: 2, scope: !1157, file: !69, line: 1058, type: !25)
!1163 = !DILocation(line: 1058, column: 40, scope: !1157)
!1164 = !DILocalVariable(name: "u32Temp1", scope: !1157, file: !69, line: 1060, type: !428)
!1165 = !DILocation(line: 1060, column: 6, scope: !1157)
!1166 = !DILocation(line: 1061, column: 5, scope: !1167)
!1167 = distinct !DILexicalBlock(scope: !1157, file: !69, line: 1061, column: 5)
!1168 = !DILocation(line: 1061, column: 17, scope: !1167)
!1169 = !DILocation(line: 1061, column: 5, scope: !1157)
!1170 = !DILocation(line: 1063, column: 3, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1167, file: !69, line: 1062, column: 2)
!1172 = !DILocation(line: 1067, column: 6, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1174, file: !69, line: 1067, column: 6)
!1174 = distinct !DILexicalBlock(scope: !1167, file: !69, line: 1066, column: 2)
!1175 = !DILocation(line: 1067, column: 18, scope: !1173)
!1176 = !DILocation(line: 1067, column: 6, scope: !1174)
!1177 = !DILocation(line: 1069, column: 4, scope: !1178)
!1178 = distinct !DILexicalBlock(scope: !1173, file: !69, line: 1068, column: 3)
!1179 = !DILocation(line: 1073, column: 16, scope: !1180)
!1180 = distinct !DILexicalBlock(scope: !1173, file: !69, line: 1072, column: 3)
!1181 = !DILocation(line: 1073, column: 30, scope: !1180)
!1182 = !DILocation(line: 1073, column: 40, scope: !1180)
!1183 = !DILocation(line: 1073, column: 39, scope: !1180)
!1184 = !DILocation(line: 1073, column: 55, scope: !1180)
!1185 = !DILocation(line: 1073, column: 53, scope: !1180)
!1186 = !DILocation(line: 1073, column: 26, scope: !1180)
!1187 = !DILocation(line: 1073, column: 68, scope: !1180)
!1188 = !DILocation(line: 1073, column: 13, scope: !1180)
!1189 = !DILocation(line: 1074, column: 16, scope: !1180)
!1190 = !DILocation(line: 1074, column: 25, scope: !1180)
!1191 = !DILocation(line: 1074, column: 24, scope: !1180)
!1192 = !DILocation(line: 1074, column: 41, scope: !1180)
!1193 = !DILocation(line: 1074, column: 51, scope: !1180)
!1194 = !DILocation(line: 1074, column: 50, scope: !1180)
!1195 = !DILocation(line: 1074, column: 38, scope: !1180)
!1196 = !DILocation(line: 1074, column: 13, scope: !1180)
!1197 = !DILocation(line: 1075, column: 11, scope: !1180)
!1198 = !DILocation(line: 1075, column: 4, scope: !1180)
!1199 = !DILocation(line: 1078, column: 1, scope: !1157)
!1200 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1095, type: !1201, scopeLine: 1096, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1201 = !DISubroutineType(types: !1202)
!1202 = !{!428, !25, !428}
!1203 = !DILocalVariable(name: "numerator", arg: 1, scope: !1200, file: !69, line: 1095, type: !25)
!1204 = !DILocation(line: 1095, column: 25, scope: !1200)
!1205 = !DILocalVariable(name: "denominator", arg: 2, scope: !1200, file: !69, line: 1095, type: !428)
!1206 = !DILocation(line: 1095, column: 40, scope: !1200)
!1207 = !DILocalVariable(name: "s32Temp1", scope: !1200, file: !69, line: 1097, type: !25)
!1208 = !DILocation(line: 1097, column: 6, scope: !1200)
!1209 = !DILocation(line: 1098, column: 5, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1200, file: !69, line: 1098, column: 5)
!1211 = !DILocation(line: 1098, column: 17, scope: !1210)
!1212 = !DILocation(line: 1098, column: 5, scope: !1200)
!1213 = !DILocation(line: 1100, column: 6, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1215, file: !69, line: 1100, column: 6)
!1215 = distinct !DILexicalBlock(scope: !1210, file: !69, line: 1099, column: 2)
!1216 = !DILocation(line: 1100, column: 16, scope: !1214)
!1217 = !DILocation(line: 1100, column: 6, scope: !1215)
!1218 = !DILocation(line: 1102, column: 4, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1214, file: !69, line: 1101, column: 3)
!1220 = !DILocation(line: 1106, column: 4, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1214, file: !69, line: 1105, column: 3)
!1222 = !DILocation(line: 1111, column: 6, scope: !1223)
!1223 = distinct !DILexicalBlock(scope: !1224, file: !69, line: 1111, column: 6)
!1224 = distinct !DILexicalBlock(scope: !1210, file: !69, line: 1110, column: 2)
!1225 = !DILocation(line: 1111, column: 16, scope: !1223)
!1226 = !DILocation(line: 1111, column: 6, scope: !1224)
!1227 = !DILocation(line: 1113, column: 17, scope: !1228)
!1228 = distinct !DILexicalBlock(scope: !1223, file: !69, line: 1112, column: 3)
!1229 = !DILocation(line: 1113, column: 31, scope: !1228)
!1230 = !DILocation(line: 1113, column: 41, scope: !1228)
!1231 = !DILocation(line: 1113, column: 40, scope: !1228)
!1232 = !DILocation(line: 1113, column: 56, scope: !1228)
!1233 = !DILocation(line: 1113, column: 54, scope: !1228)
!1234 = !DILocation(line: 1113, column: 27, scope: !1228)
!1235 = !DILocation(line: 1113, column: 69, scope: !1228)
!1236 = !DILocation(line: 1113, column: 13, scope: !1228)
!1237 = !DILocation(line: 1114, column: 13, scope: !1228)
!1238 = !DILocation(line: 1114, column: 23, scope: !1228)
!1239 = !DILocation(line: 1114, column: 22, scope: !1228)
!1240 = !DILocation(line: 1114, column: 39, scope: !1228)
!1241 = !DILocation(line: 1114, column: 48, scope: !1228)
!1242 = !DILocation(line: 1114, column: 47, scope: !1228)
!1243 = !DILocation(line: 1114, column: 36, scope: !1228)
!1244 = !DILocation(line: 1114, column: 4, scope: !1228)
!1245 = !DILocation(line: 1118, column: 4, scope: !1246)
!1246 = distinct !DILexicalBlock(scope: !1223, file: !69, line: 1117, column: 3)
!1247 = !DILocation(line: 1121, column: 1, scope: !1200)
!1248 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1138, type: !1249, scopeLine: 1139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1249 = !DISubroutineType(types: !1250)
!1250 = !{!428, !25, !25}
!1251 = !DILocalVariable(name: "numerator", arg: 1, scope: !1248, file: !69, line: 1138, type: !25)
!1252 = !DILocation(line: 1138, column: 25, scope: !1248)
!1253 = !DILocalVariable(name: "denominator", arg: 2, scope: !1248, file: !69, line: 1138, type: !25)
!1254 = !DILocation(line: 1138, column: 40, scope: !1248)
!1255 = !DILocalVariable(name: "u32Temp1", scope: !1248, file: !69, line: 1140, type: !428)
!1256 = !DILocation(line: 1140, column: 6, scope: !1248)
!1257 = !DILocalVariable(name: "u32Temp2", scope: !1248, file: !69, line: 1140, type: !428)
!1258 = !DILocation(line: 1140, column: 20, scope: !1248)
!1259 = !DILocation(line: 1141, column: 5, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1248, file: !69, line: 1141, column: 5)
!1261 = !DILocation(line: 1141, column: 17, scope: !1260)
!1262 = !DILocation(line: 1141, column: 5, scope: !1248)
!1263 = !DILocation(line: 1143, column: 6, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1265, file: !69, line: 1143, column: 6)
!1265 = distinct !DILexicalBlock(scope: !1260, file: !69, line: 1142, column: 2)
!1266 = !DILocation(line: 1143, column: 16, scope: !1264)
!1267 = !DILocation(line: 1143, column: 6, scope: !1265)
!1268 = !DILocation(line: 1145, column: 4, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1264, file: !69, line: 1144, column: 3)
!1270 = !DILocation(line: 1149, column: 4, scope: !1271)
!1271 = distinct !DILexicalBlock(scope: !1264, file: !69, line: 1148, column: 3)
!1272 = !DILocation(line: 1154, column: 6, scope: !1273)
!1273 = distinct !DILexicalBlock(scope: !1274, file: !69, line: 1154, column: 6)
!1274 = distinct !DILexicalBlock(scope: !1260, file: !69, line: 1153, column: 2)
!1275 = !DILocation(line: 1154, column: 16, scope: !1273)
!1276 = !DILocation(line: 1154, column: 6, scope: !1274)
!1277 = !DILocation(line: 1156, column: 7, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1279, file: !69, line: 1156, column: 7)
!1279 = distinct !DILexicalBlock(scope: !1273, file: !69, line: 1155, column: 3)
!1280 = !DILocation(line: 1156, column: 17, scope: !1278)
!1281 = !DILocation(line: 1156, column: 7, scope: !1279)
!1282 = !DILocation(line: 1158, column: 5, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1278, file: !69, line: 1157, column: 4)
!1284 = !DILocation(line: 1162, column: 8, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1286, file: !69, line: 1162, column: 8)
!1286 = distinct !DILexicalBlock(scope: !1278, file: !69, line: 1161, column: 4)
!1287 = !DILocation(line: 1162, column: 20, scope: !1285)
!1288 = !DILocation(line: 1162, column: 8, scope: !1286)
!1289 = !DILocation(line: 1164, column: 6, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1285, file: !69, line: 1163, column: 5)
!1291 = !DILocation(line: 1168, column: 18, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1285, file: !69, line: 1167, column: 5)
!1293 = !DILocation(line: 1168, column: 32, scope: !1292)
!1294 = !DILocation(line: 1168, column: 42, scope: !1292)
!1295 = !DILocation(line: 1168, column: 41, scope: !1292)
!1296 = !DILocation(line: 1168, column: 57, scope: !1292)
!1297 = !DILocation(line: 1168, column: 55, scope: !1292)
!1298 = !DILocation(line: 1168, column: 28, scope: !1292)
!1299 = !DILocation(line: 1168, column: 71, scope: !1292)
!1300 = !DILocation(line: 1168, column: 15, scope: !1292)
!1301 = !DILocation(line: 1169, column: 18, scope: !1292)
!1302 = !DILocation(line: 1169, column: 29, scope: !1292)
!1303 = !DILocation(line: 1169, column: 27, scope: !1292)
!1304 = !DILocation(line: 1169, column: 45, scope: !1292)
!1305 = !DILocation(line: 1169, column: 57, scope: !1292)
!1306 = !DILocation(line: 1169, column: 55, scope: !1292)
!1307 = !DILocation(line: 1169, column: 42, scope: !1292)
!1308 = !DILocation(line: 1169, column: 15, scope: !1292)
!1309 = !DILocation(line: 1170, column: 13, scope: !1292)
!1310 = !DILocation(line: 1170, column: 6, scope: !1292)
!1311 = !DILocation(line: 1176, column: 7, scope: !1312)
!1312 = distinct !DILexicalBlock(scope: !1313, file: !69, line: 1176, column: 7)
!1313 = distinct !DILexicalBlock(scope: !1273, file: !69, line: 1175, column: 3)
!1314 = !DILocation(line: 1176, column: 19, scope: !1312)
!1315 = !DILocation(line: 1176, column: 7, scope: !1313)
!1316 = !DILocation(line: 1178, column: 5, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1312, file: !69, line: 1177, column: 4)
!1318 = !DILocation(line: 1182, column: 18, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1312, file: !69, line: 1181, column: 4)
!1320 = !DILocation(line: 1182, column: 17, scope: !1319)
!1321 = !DILocation(line: 1182, column: 15, scope: !1319)
!1322 = !DILocation(line: 1183, column: 20, scope: !1319)
!1323 = !DILocation(line: 1183, column: 19, scope: !1319)
!1324 = !DILocation(line: 1183, column: 17, scope: !1319)
!1325 = !DILocation(line: 1184, column: 17, scope: !1319)
!1326 = !DILocation(line: 1184, column: 31, scope: !1319)
!1327 = !DILocation(line: 1184, column: 41, scope: !1319)
!1328 = !DILocation(line: 1184, column: 40, scope: !1319)
!1329 = !DILocation(line: 1184, column: 56, scope: !1319)
!1330 = !DILocation(line: 1184, column: 54, scope: !1319)
!1331 = !DILocation(line: 1184, column: 27, scope: !1319)
!1332 = !DILocation(line: 1184, column: 70, scope: !1319)
!1333 = !DILocation(line: 1184, column: 14, scope: !1319)
!1334 = !DILocation(line: 1185, column: 17, scope: !1319)
!1335 = !DILocation(line: 1185, column: 28, scope: !1319)
!1336 = !DILocation(line: 1185, column: 26, scope: !1319)
!1337 = !DILocation(line: 1185, column: 44, scope: !1319)
!1338 = !DILocation(line: 1185, column: 56, scope: !1319)
!1339 = !DILocation(line: 1185, column: 54, scope: !1319)
!1340 = !DILocation(line: 1185, column: 41, scope: !1319)
!1341 = !DILocation(line: 1185, column: 14, scope: !1319)
!1342 = !DILocation(line: 1186, column: 12, scope: !1319)
!1343 = !DILocation(line: 1186, column: 5, scope: !1319)
!1344 = !DILocation(line: 1191, column: 1, scope: !1248)
!1345 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1208, type: !1346, scopeLine: 1209, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1346 = !DISubroutineType(types: !1347)
!1347 = !{!428, !428, !428}
!1348 = !DILocalVariable(name: "numerator", arg: 1, scope: !1345, file: !69, line: 1208, type: !428)
!1349 = !DILocation(line: 1208, column: 25, scope: !1345)
!1350 = !DILocalVariable(name: "denominator", arg: 2, scope: !1345, file: !69, line: 1208, type: !428)
!1351 = !DILocation(line: 1208, column: 40, scope: !1345)
!1352 = !DILocalVariable(name: "u32Temp1", scope: !1345, file: !69, line: 1211, type: !428)
!1353 = !DILocation(line: 1211, column: 6, scope: !1345)
!1354 = !DILocalVariable(name: "u32Temp2", scope: !1345, file: !69, line: 1211, type: !428)
!1355 = !DILocation(line: 1211, column: 20, scope: !1345)
!1356 = !DILocalVariable(name: "u32Temp3", scope: !1345, file: !69, line: 1211, type: !428)
!1357 = !DILocation(line: 1211, column: 34, scope: !1345)
!1358 = !DILocalVariable(name: "numerator_old", scope: !1345, file: !69, line: 1211, type: !428)
!1359 = !DILocation(line: 1211, column: 48, scope: !1345)
!1360 = !DILocation(line: 1212, column: 5, scope: !1361)
!1361 = distinct !DILexicalBlock(scope: !1345, file: !69, line: 1212, column: 5)
!1362 = !DILocation(line: 1212, column: 16, scope: !1361)
!1363 = !DILocation(line: 1212, column: 5, scope: !1345)
!1364 = !DILocation(line: 1214, column: 3, scope: !1365)
!1365 = distinct !DILexicalBlock(scope: !1361, file: !69, line: 1213, column: 2)
!1366 = !DILocation(line: 1218, column: 14, scope: !1367)
!1367 = distinct !DILexicalBlock(scope: !1361, file: !69, line: 1217, column: 2)
!1368 = !DILocation(line: 1218, column: 26, scope: !1367)
!1369 = !DILocation(line: 1218, column: 41, scope: !1367)
!1370 = !DILocation(line: 1218, column: 51, scope: !1367)
!1371 = !DILocation(line: 1218, column: 50, scope: !1367)
!1372 = !DILocation(line: 1218, column: 38, scope: !1367)
!1373 = !DILocation(line: 1218, column: 24, scope: !1367)
!1374 = !DILocation(line: 1218, column: 12, scope: !1367)
!1375 = !DILocation(line: 1219, column: 7, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1367, file: !69, line: 1219, column: 6)
!1377 = !DILocation(line: 1219, column: 16, scope: !1376)
!1378 = !DILocation(line: 1219, column: 24, scope: !1376)
!1379 = !DILocation(line: 1219, column: 6, scope: !1367)
!1380 = !DILocation(line: 1221, column: 16, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1376, file: !69, line: 1220, column: 3)
!1382 = !DILocation(line: 1221, column: 27, scope: !1381)
!1383 = !DILocation(line: 1221, column: 13, scope: !1381)
!1384 = !DILocation(line: 1222, column: 3, scope: !1381)
!1385 = !DILocation(line: 1225, column: 16, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1376, file: !69, line: 1224, column: 3)
!1387 = !DILocation(line: 1225, column: 27, scope: !1386)
!1388 = !DILocation(line: 1225, column: 32, scope: !1386)
!1389 = !DILocation(line: 1225, column: 13, scope: !1386)
!1390 = !DILocation(line: 1228, column: 6, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1367, file: !69, line: 1228, column: 6)
!1392 = !DILocation(line: 1228, column: 17, scope: !1391)
!1393 = !DILocation(line: 1228, column: 15, scope: !1391)
!1394 = !DILocation(line: 1228, column: 6, scope: !1367)
!1395 = !DILocation(line: 1230, column: 12, scope: !1396)
!1396 = distinct !DILexicalBlock(scope: !1391, file: !69, line: 1229, column: 3)
!1397 = !DILocation(line: 1230, column: 22, scope: !1396)
!1398 = !DILocation(line: 1230, column: 21, scope: !1396)
!1399 = !DILocation(line: 1230, column: 4, scope: !1396)
!1400 = !DILocation(line: 1234, column: 13, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1391, file: !69, line: 1233, column: 3)
!1402 = !DILocation(line: 1234, column: 23, scope: !1401)
!1403 = !DILocation(line: 1234, column: 22, scope: !1401)
!1404 = !DILocation(line: 1234, column: 36, scope: !1401)
!1405 = !DILocation(line: 1234, column: 4, scope: !1401)
!1406 = !DILocation(line: 1239, column: 1, scope: !1345)
!1407 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1256, type: !1408, scopeLine: 1257, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1408 = !DISubroutineType(types: !1409)
!1409 = !{!25, !428, !25}
!1410 = !DILocalVariable(name: "numerator", arg: 1, scope: !1407, file: !69, line: 1256, type: !428)
!1411 = !DILocation(line: 1256, column: 25, scope: !1407)
!1412 = !DILocalVariable(name: "denominator", arg: 2, scope: !1407, file: !69, line: 1256, type: !25)
!1413 = !DILocation(line: 1256, column: 40, scope: !1407)
!1414 = !DILocalVariable(name: "u32Temp1", scope: !1407, file: !69, line: 1258, type: !428)
!1415 = !DILocation(line: 1258, column: 6, scope: !1407)
!1416 = !DILocalVariable(name: "u32Temp2", scope: !1407, file: !69, line: 1258, type: !428)
!1417 = !DILocation(line: 1258, column: 20, scope: !1407)
!1418 = !DILocation(line: 1259, column: 5, scope: !1419)
!1419 = distinct !DILexicalBlock(scope: !1407, file: !69, line: 1259, column: 5)
!1420 = !DILocation(line: 1259, column: 17, scope: !1419)
!1421 = !DILocation(line: 1259, column: 5, scope: !1407)
!1422 = !DILocation(line: 1261, column: 6, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1424, file: !69, line: 1261, column: 6)
!1424 = distinct !DILexicalBlock(scope: !1419, file: !69, line: 1260, column: 2)
!1425 = !DILocation(line: 1261, column: 18, scope: !1423)
!1426 = !DILocation(line: 1261, column: 6, scope: !1424)
!1427 = !DILocation(line: 1263, column: 4, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1423, file: !69, line: 1262, column: 3)
!1429 = !DILocation(line: 1267, column: 19, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1423, file: !69, line: 1266, column: 3)
!1431 = !DILocation(line: 1267, column: 18, scope: !1430)
!1432 = !DILocation(line: 1267, column: 16, scope: !1430)
!1433 = !DILocation(line: 1268, column: 16, scope: !1430)
!1434 = !DILocation(line: 1268, column: 30, scope: !1430)
!1435 = !DILocation(line: 1268, column: 40, scope: !1430)
!1436 = !DILocation(line: 1268, column: 39, scope: !1430)
!1437 = !DILocation(line: 1268, column: 55, scope: !1430)
!1438 = !DILocation(line: 1268, column: 53, scope: !1430)
!1439 = !DILocation(line: 1268, column: 26, scope: !1430)
!1440 = !DILocation(line: 1268, column: 69, scope: !1430)
!1441 = !DILocation(line: 1268, column: 13, scope: !1430)
!1442 = !DILocation(line: 1269, column: 16, scope: !1430)
!1443 = !DILocation(line: 1269, column: 25, scope: !1430)
!1444 = !DILocation(line: 1269, column: 24, scope: !1430)
!1445 = !DILocation(line: 1269, column: 41, scope: !1430)
!1446 = !DILocation(line: 1269, column: 51, scope: !1430)
!1447 = !DILocation(line: 1269, column: 50, scope: !1430)
!1448 = !DILocation(line: 1269, column: 38, scope: !1430)
!1449 = !DILocation(line: 1269, column: 13, scope: !1430)
!1450 = !DILocation(line: 1270, column: 7, scope: !1451)
!1451 = distinct !DILexicalBlock(scope: !1430, file: !69, line: 1270, column: 7)
!1452 = !DILocation(line: 1270, column: 16, scope: !1451)
!1453 = !DILocation(line: 1270, column: 7, scope: !1430)
!1454 = !DILocation(line: 1272, column: 13, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1451, file: !69, line: 1271, column: 4)
!1456 = !DILocation(line: 1272, column: 12, scope: !1455)
!1457 = !DILocation(line: 1272, column: 5, scope: !1455)
!1458 = !DILocation(line: 1276, column: 5, scope: !1459)
!1459 = distinct !DILexicalBlock(scope: !1451, file: !69, line: 1275, column: 4)
!1460 = !DILocation(line: 1282, column: 15, scope: !1461)
!1461 = distinct !DILexicalBlock(scope: !1419, file: !69, line: 1281, column: 2)
!1462 = !DILocation(line: 1282, column: 29, scope: !1461)
!1463 = !DILocation(line: 1282, column: 39, scope: !1461)
!1464 = !DILocation(line: 1282, column: 38, scope: !1461)
!1465 = !DILocation(line: 1282, column: 54, scope: !1461)
!1466 = !DILocation(line: 1282, column: 52, scope: !1461)
!1467 = !DILocation(line: 1282, column: 25, scope: !1461)
!1468 = !DILocation(line: 1282, column: 68, scope: !1461)
!1469 = !DILocation(line: 1282, column: 12, scope: !1461)
!1470 = !DILocation(line: 1283, column: 15, scope: !1461)
!1471 = !DILocation(line: 1283, column: 24, scope: !1461)
!1472 = !DILocation(line: 1283, column: 23, scope: !1461)
!1473 = !DILocation(line: 1283, column: 40, scope: !1461)
!1474 = !DILocation(line: 1283, column: 50, scope: !1461)
!1475 = !DILocation(line: 1283, column: 49, scope: !1461)
!1476 = !DILocation(line: 1283, column: 37, scope: !1461)
!1477 = !DILocation(line: 1283, column: 12, scope: !1461)
!1478 = !DILocation(line: 1284, column: 6, scope: !1479)
!1479 = distinct !DILexicalBlock(scope: !1461, file: !69, line: 1284, column: 6)
!1480 = !DILocation(line: 1284, column: 15, scope: !1479)
!1481 = !DILocation(line: 1284, column: 6, scope: !1461)
!1482 = !DILocation(line: 1286, column: 11, scope: !1483)
!1483 = distinct !DILexicalBlock(scope: !1479, file: !69, line: 1285, column: 3)
!1484 = !DILocation(line: 1286, column: 4, scope: !1483)
!1485 = !DILocation(line: 1290, column: 4, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1479, file: !69, line: 1289, column: 3)
!1487 = !DILocation(line: 1293, column: 1, scope: !1407)
!1488 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1311, type: !1489, scopeLine: 1312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1489 = !DISubroutineType(types: !1490)
!1490 = !{!25, !25, !428}
!1491 = !DILocalVariable(name: "numerator", arg: 1, scope: !1488, file: !69, line: 1311, type: !25)
!1492 = !DILocation(line: 1311, column: 25, scope: !1488)
!1493 = !DILocalVariable(name: "denominator", arg: 2, scope: !1488, file: !69, line: 1311, type: !428)
!1494 = !DILocation(line: 1311, column: 40, scope: !1488)
!1495 = !DILocalVariable(name: "s32Temp1", scope: !1488, file: !69, line: 1313, type: !25)
!1496 = !DILocation(line: 1313, column: 6, scope: !1488)
!1497 = !DILocalVariable(name: "s32Temp2", scope: !1488, file: !69, line: 1313, type: !25)
!1498 = !DILocation(line: 1313, column: 20, scope: !1488)
!1499 = !DILocalVariable(name: "u32Temp0", scope: !1488, file: !69, line: 1314, type: !428)
!1500 = !DILocation(line: 1314, column: 6, scope: !1488)
!1501 = !DILocalVariable(name: "u32Temp1", scope: !1488, file: !69, line: 1314, type: !428)
!1502 = !DILocation(line: 1314, column: 20, scope: !1488)
!1503 = !DILocalVariable(name: "u32Temp2", scope: !1488, file: !69, line: 1314, type: !428)
!1504 = !DILocation(line: 1314, column: 34, scope: !1488)
!1505 = !DILocation(line: 1315, column: 5, scope: !1506)
!1506 = distinct !DILexicalBlock(scope: !1488, file: !69, line: 1315, column: 5)
!1507 = !DILocation(line: 1315, column: 17, scope: !1506)
!1508 = !DILocation(line: 1315, column: 5, scope: !1488)
!1509 = !DILocation(line: 1317, column: 6, scope: !1510)
!1510 = distinct !DILexicalBlock(scope: !1511, file: !69, line: 1317, column: 6)
!1511 = distinct !DILexicalBlock(scope: !1506, file: !69, line: 1316, column: 2)
!1512 = !DILocation(line: 1317, column: 16, scope: !1510)
!1513 = !DILocation(line: 1317, column: 6, scope: !1511)
!1514 = !DILocation(line: 1319, column: 4, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1510, file: !69, line: 1318, column: 3)
!1516 = !DILocation(line: 1323, column: 4, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1510, file: !69, line: 1322, column: 3)
!1518 = !DILocation(line: 1328, column: 6, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1520, file: !69, line: 1328, column: 6)
!1520 = distinct !DILexicalBlock(scope: !1506, file: !69, line: 1327, column: 2)
!1521 = !DILocation(line: 1328, column: 16, scope: !1519)
!1522 = !DILocation(line: 1328, column: 6, scope: !1520)
!1523 = !DILocation(line: 1330, column: 16, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1519, file: !69, line: 1329, column: 3)
!1525 = !DILocation(line: 1330, column: 15, scope: !1524)
!1526 = !DILocation(line: 1330, column: 13, scope: !1524)
!1527 = !DILocation(line: 1331, column: 16, scope: !1524)
!1528 = !DILocation(line: 1331, column: 25, scope: !1524)
!1529 = !DILocation(line: 1331, column: 24, scope: !1524)
!1530 = !DILocation(line: 1331, column: 13, scope: !1524)
!1531 = !DILocation(line: 1332, column: 15, scope: !1524)
!1532 = !DILocation(line: 1332, column: 28, scope: !1524)
!1533 = !DILocation(line: 1332, column: 37, scope: !1524)
!1534 = !DILocation(line: 1332, column: 36, scope: !1524)
!1535 = !DILocation(line: 1332, column: 52, scope: !1524)
!1536 = !DILocation(line: 1332, column: 50, scope: !1524)
!1537 = !DILocation(line: 1332, column: 24, scope: !1524)
!1538 = !DILocation(line: 1332, column: 13, scope: !1524)
!1539 = !DILocation(line: 1334, column: 8, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1524, file: !69, line: 1334, column: 7)
!1541 = !DILocation(line: 1334, column: 20, scope: !1540)
!1542 = !DILocation(line: 1334, column: 27, scope: !1540)
!1543 = !DILocation(line: 1334, column: 7, scope: !1524)
!1544 = !DILocation(line: 1336, column: 20, scope: !1545)
!1545 = distinct !DILexicalBlock(scope: !1540, file: !69, line: 1335, column: 4)
!1546 = !DILocation(line: 1336, column: 32, scope: !1545)
!1547 = !DILocation(line: 1336, column: 17, scope: !1545)
!1548 = !DILocation(line: 1337, column: 4, scope: !1545)
!1549 = !DILocation(line: 1340, column: 20, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1540, file: !69, line: 1339, column: 4)
!1551 = !DILocation(line: 1340, column: 32, scope: !1550)
!1552 = !DILocation(line: 1340, column: 38, scope: !1550)
!1553 = !DILocation(line: 1340, column: 17, scope: !1550)
!1554 = !DILocation(line: 1344, column: 7, scope: !1555)
!1555 = distinct !DILexicalBlock(scope: !1524, file: !69, line: 1344, column: 7)
!1556 = !DILocation(line: 1344, column: 18, scope: !1555)
!1557 = !DILocation(line: 1344, column: 16, scope: !1555)
!1558 = !DILocation(line: 1344, column: 7, scope: !1524)
!1559 = !DILocation(line: 1346, column: 14, scope: !1560)
!1560 = distinct !DILexicalBlock(scope: !1555, file: !69, line: 1345, column: 4)
!1561 = !DILocation(line: 1346, column: 13, scope: !1560)
!1562 = !DILocation(line: 1346, column: 23, scope: !1560)
!1563 = !DILocation(line: 1346, column: 5, scope: !1560)
!1564 = !DILocation(line: 1350, column: 14, scope: !1565)
!1565 = distinct !DILexicalBlock(scope: !1555, file: !69, line: 1349, column: 4)
!1566 = !DILocation(line: 1350, column: 23, scope: !1565)
!1567 = !DILocation(line: 1350, column: 12, scope: !1565)
!1568 = !DILocation(line: 1350, column: 27, scope: !1565)
!1569 = !DILocation(line: 1350, column: 5, scope: !1565)
!1570 = !DILocation(line: 1357, column: 16, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1519, file: !69, line: 1356, column: 3)
!1572 = !DILocation(line: 1357, column: 30, scope: !1571)
!1573 = !DILocation(line: 1357, column: 40, scope: !1571)
!1574 = !DILocation(line: 1357, column: 39, scope: !1571)
!1575 = !DILocation(line: 1357, column: 55, scope: !1571)
!1576 = !DILocation(line: 1357, column: 53, scope: !1571)
!1577 = !DILocation(line: 1357, column: 26, scope: !1571)
!1578 = !DILocation(line: 1357, column: 69, scope: !1571)
!1579 = !DILocation(line: 1357, column: 13, scope: !1571)
!1580 = !DILocation(line: 1358, column: 16, scope: !1571)
!1581 = !DILocation(line: 1358, column: 26, scope: !1571)
!1582 = !DILocation(line: 1358, column: 25, scope: !1571)
!1583 = !DILocation(line: 1358, column: 42, scope: !1571)
!1584 = !DILocation(line: 1358, column: 51, scope: !1571)
!1585 = !DILocation(line: 1358, column: 50, scope: !1571)
!1586 = !DILocation(line: 1358, column: 39, scope: !1571)
!1587 = !DILocation(line: 1358, column: 13, scope: !1571)
!1588 = !DILocation(line: 1359, column: 11, scope: !1571)
!1589 = !DILocation(line: 1359, column: 4, scope: !1571)
!1590 = !DILocation(line: 1362, column: 1, scope: !1488)
!1591 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1379, type: !1592, scopeLine: 1380, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1592 = !DISubroutineType(types: !1593)
!1593 = !{!25, !25, !25}
!1594 = !DILocalVariable(name: "numerator", arg: 1, scope: !1591, file: !69, line: 1379, type: !25)
!1595 = !DILocation(line: 1379, column: 25, scope: !1591)
!1596 = !DILocalVariable(name: "denominator", arg: 2, scope: !1591, file: !69, line: 1379, type: !25)
!1597 = !DILocation(line: 1379, column: 40, scope: !1591)
!1598 = !DILocalVariable(name: "s32Temp1", scope: !1591, file: !69, line: 1381, type: !25)
!1599 = !DILocation(line: 1381, column: 6, scope: !1591)
!1600 = !DILocalVariable(name: "s32Temp2", scope: !1591, file: !69, line: 1381, type: !25)
!1601 = !DILocation(line: 1381, column: 20, scope: !1591)
!1602 = !DILocalVariable(name: "denominator_prime", scope: !1591, file: !69, line: 1382, type: !428)
!1603 = !DILocation(line: 1382, column: 6, scope: !1591)
!1604 = !DILocalVariable(name: "u32Temp1", scope: !1591, file: !69, line: 1382, type: !428)
!1605 = !DILocation(line: 1382, column: 29, scope: !1591)
!1606 = !DILocalVariable(name: "u32Temp2", scope: !1591, file: !69, line: 1382, type: !428)
!1607 = !DILocation(line: 1382, column: 43, scope: !1591)
!1608 = !DILocalVariable(name: "u32numerator", scope: !1591, file: !69, line: 1383, type: !428)
!1609 = !DILocation(line: 1383, column: 6, scope: !1591)
!1610 = !DILocalVariable(name: "u32denominator", scope: !1591, file: !69, line: 1383, type: !428)
!1611 = !DILocation(line: 1383, column: 23, scope: !1591)
!1612 = !DILocation(line: 1384, column: 5, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1591, file: !69, line: 1384, column: 5)
!1614 = !DILocation(line: 1384, column: 15, scope: !1613)
!1615 = !DILocation(line: 1384, column: 5, scope: !1591)
!1616 = !DILocation(line: 1386, column: 6, scope: !1617)
!1617 = distinct !DILexicalBlock(scope: !1618, file: !69, line: 1386, column: 6)
!1618 = distinct !DILexicalBlock(scope: !1613, file: !69, line: 1385, column: 2)
!1619 = !DILocation(line: 1386, column: 18, scope: !1617)
!1620 = !DILocation(line: 1386, column: 6, scope: !1618)
!1621 = !DILocation(line: 1388, column: 7, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1623, file: !69, line: 1388, column: 7)
!1623 = distinct !DILexicalBlock(scope: !1617, file: !69, line: 1387, column: 3)
!1624 = !DILocation(line: 1388, column: 19, scope: !1622)
!1625 = !DILocation(line: 1388, column: 7, scope: !1623)
!1626 = !DILocation(line: 1390, column: 5, scope: !1627)
!1627 = distinct !DILexicalBlock(scope: !1622, file: !69, line: 1389, column: 4)
!1628 = !DILocation(line: 1395, column: 46, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1630, file: !69, line: 1395, column: 9)
!1630 = distinct !DILexicalBlock(scope: !1622, file: !69, line: 1393, column: 4)
!1631 = !DILocation(line: 1395, column: 36, scope: !1629)
!1632 = !DILocation(line: 1395, column: 11, scope: !1629)
!1633 = !DILocation(line: 1395, column: 9, scope: !1630)
!1634 = !DILocation(line: 1396, column: 9, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1629, file: !69, line: 1395, column: 60)
!1636 = !DILocation(line: 1398, column: 21, scope: !1630)
!1637 = !DILocation(line: 1398, column: 20, scope: !1630)
!1638 = !DILocation(line: 1398, column: 18, scope: !1630)
!1639 = !DILocation(line: 1400, column: 46, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1630, file: !69, line: 1400, column: 9)
!1641 = !DILocation(line: 1400, column: 36, scope: !1640)
!1642 = !DILocation(line: 1400, column: 11, scope: !1640)
!1643 = !DILocation(line: 1400, column: 9, scope: !1630)
!1644 = !DILocation(line: 1401, column: 9, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1640, file: !69, line: 1400, column: 62)
!1646 = !DILocation(line: 1403, column: 23, scope: !1630)
!1647 = !DILocation(line: 1403, column: 22, scope: !1630)
!1648 = !DILocation(line: 1403, column: 20, scope: !1630)
!1649 = !DILocation(line: 1404, column: 16, scope: !1630)
!1650 = !DILocation(line: 1404, column: 33, scope: !1630)
!1651 = !DILocation(line: 1404, column: 46, scope: !1630)
!1652 = !DILocation(line: 1404, column: 45, scope: !1630)
!1653 = !DILocation(line: 1404, column: 64, scope: !1630)
!1654 = !DILocation(line: 1404, column: 62, scope: !1630)
!1655 = !DILocation(line: 1404, column: 29, scope: !1630)
!1656 = !DILocation(line: 1404, column: 81, scope: !1630)
!1657 = !DILocation(line: 1404, column: 14, scope: !1630)
!1658 = !DILocation(line: 1405, column: 17, scope: !1630)
!1659 = !DILocation(line: 1405, column: 30, scope: !1630)
!1660 = !DILocation(line: 1405, column: 29, scope: !1630)
!1661 = !DILocation(line: 1405, column: 49, scope: !1630)
!1662 = !DILocation(line: 1405, column: 58, scope: !1630)
!1663 = !DILocation(line: 1405, column: 57, scope: !1630)
!1664 = !DILocation(line: 1405, column: 46, scope: !1630)
!1665 = !DILocation(line: 1405, column: 14, scope: !1630)
!1666 = !DILocation(line: 1406, column: 8, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1630, file: !69, line: 1406, column: 8)
!1668 = !DILocation(line: 1406, column: 17, scope: !1667)
!1669 = !DILocation(line: 1406, column: 8, scope: !1630)
!1670 = !DILocation(line: 1408, column: 13, scope: !1671)
!1671 = distinct !DILexicalBlock(scope: !1667, file: !69, line: 1407, column: 5)
!1672 = !DILocation(line: 1408, column: 6, scope: !1671)
!1673 = !DILocation(line: 1412, column: 6, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1667, file: !69, line: 1411, column: 5)
!1675 = !DILocation(line: 1419, column: 52, scope: !1676)
!1676 = distinct !DILexicalBlock(scope: !1677, file: !69, line: 1419, column: 8)
!1677 = distinct !DILexicalBlock(scope: !1617, file: !69, line: 1417, column: 3)
!1678 = !DILocation(line: 1419, column: 51, scope: !1676)
!1679 = !DILocation(line: 1419, column: 35, scope: !1676)
!1680 = !DILocation(line: 1419, column: 10, scope: !1676)
!1681 = !DILocation(line: 1419, column: 8, scope: !1677)
!1682 = !DILocation(line: 1420, column: 8, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1676, file: !69, line: 1419, column: 81)
!1684 = !DILocation(line: 1422, column: 20, scope: !1677)
!1685 = !DILocation(line: 1422, column: 19, scope: !1677)
!1686 = !DILocation(line: 1422, column: 29, scope: !1677)
!1687 = !DILocation(line: 1422, column: 17, scope: !1677)
!1688 = !DILocation(line: 1423, column: 16, scope: !1677)
!1689 = !DILocation(line: 1423, column: 33, scope: !1677)
!1690 = !DILocation(line: 1423, column: 46, scope: !1677)
!1691 = !DILocation(line: 1423, column: 45, scope: !1677)
!1692 = !DILocation(line: 1423, column: 61, scope: !1677)
!1693 = !DILocation(line: 1423, column: 59, scope: !1677)
!1694 = !DILocation(line: 1423, column: 29, scope: !1677)
!1695 = !DILocation(line: 1423, column: 75, scope: !1677)
!1696 = !DILocation(line: 1423, column: 13, scope: !1677)
!1697 = !DILocation(line: 1424, column: 16, scope: !1677)
!1698 = !DILocation(line: 1424, column: 29, scope: !1677)
!1699 = !DILocation(line: 1424, column: 28, scope: !1677)
!1700 = !DILocation(line: 1424, column: 45, scope: !1677)
!1701 = !DILocation(line: 1424, column: 54, scope: !1677)
!1702 = !DILocation(line: 1424, column: 53, scope: !1677)
!1703 = !DILocation(line: 1424, column: 42, scope: !1677)
!1704 = !DILocation(line: 1424, column: 13, scope: !1677)
!1705 = !DILocation(line: 1426, column: 52, scope: !1706)
!1706 = distinct !DILexicalBlock(scope: !1677, file: !69, line: 1426, column: 8)
!1707 = !DILocation(line: 1426, column: 51, scope: !1706)
!1708 = !DILocation(line: 1426, column: 35, scope: !1706)
!1709 = !DILocation(line: 1426, column: 10, scope: !1706)
!1710 = !DILocation(line: 1426, column: 8, scope: !1677)
!1711 = !DILocation(line: 1427, column: 8, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1706, file: !69, line: 1426, column: 80)
!1713 = !DILocation(line: 1429, column: 13, scope: !1677)
!1714 = !DILocation(line: 1429, column: 12, scope: !1677)
!1715 = !DILocation(line: 1429, column: 22, scope: !1677)
!1716 = !DILocation(line: 1429, column: 4, scope: !1677)
!1717 = !DILocation(line: 1434, column: 6, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1719, file: !69, line: 1434, column: 6)
!1719 = distinct !DILexicalBlock(scope: !1613, file: !69, line: 1433, column: 2)
!1720 = !DILocation(line: 1434, column: 18, scope: !1718)
!1721 = !DILocation(line: 1434, column: 6, scope: !1719)
!1722 = !DILocation(line: 1436, column: 7, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1724, file: !69, line: 1436, column: 7)
!1724 = distinct !DILexicalBlock(scope: !1718, file: !69, line: 1435, column: 3)
!1725 = !DILocation(line: 1436, column: 19, scope: !1723)
!1726 = !DILocation(line: 1436, column: 7, scope: !1724)
!1727 = !DILocation(line: 1438, column: 5, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1723, file: !69, line: 1437, column: 4)
!1729 = !DILocation(line: 1443, column: 53, scope: !1730)
!1730 = distinct !DILexicalBlock(scope: !1731, file: !69, line: 1443, column: 9)
!1731 = distinct !DILexicalBlock(scope: !1723, file: !69, line: 1441, column: 4)
!1732 = !DILocation(line: 1443, column: 52, scope: !1730)
!1733 = !DILocation(line: 1443, column: 36, scope: !1730)
!1734 = !DILocation(line: 1443, column: 11, scope: !1730)
!1735 = !DILocation(line: 1443, column: 9, scope: !1731)
!1736 = !DILocation(line: 1444, column: 9, scope: !1737)
!1737 = distinct !DILexicalBlock(scope: !1730, file: !69, line: 1443, column: 84)
!1738 = !DILocation(line: 1446, column: 23, scope: !1731)
!1739 = !DILocation(line: 1446, column: 22, scope: !1731)
!1740 = !DILocation(line: 1446, column: 35, scope: !1731)
!1741 = !DILocation(line: 1446, column: 20, scope: !1731)
!1742 = !DILocation(line: 1447, column: 17, scope: !1731)
!1743 = !DILocation(line: 1447, column: 31, scope: !1731)
!1744 = !DILocation(line: 1447, column: 41, scope: !1731)
!1745 = !DILocation(line: 1447, column: 40, scope: !1731)
!1746 = !DILocation(line: 1447, column: 59, scope: !1731)
!1747 = !DILocation(line: 1447, column: 57, scope: !1731)
!1748 = !DILocation(line: 1447, column: 27, scope: !1731)
!1749 = !DILocation(line: 1447, column: 76, scope: !1731)
!1750 = !DILocation(line: 1447, column: 14, scope: !1731)
!1751 = !DILocation(line: 1448, column: 17, scope: !1731)
!1752 = !DILocation(line: 1448, column: 27, scope: !1731)
!1753 = !DILocation(line: 1448, column: 26, scope: !1731)
!1754 = !DILocation(line: 1448, column: 46, scope: !1731)
!1755 = !DILocation(line: 1448, column: 55, scope: !1731)
!1756 = !DILocation(line: 1448, column: 54, scope: !1731)
!1757 = !DILocation(line: 1448, column: 43, scope: !1731)
!1758 = !DILocation(line: 1448, column: 14, scope: !1731)
!1759 = !DILocation(line: 1450, column: 53, scope: !1760)
!1760 = distinct !DILexicalBlock(scope: !1731, file: !69, line: 1450, column: 9)
!1761 = !DILocation(line: 1450, column: 52, scope: !1760)
!1762 = !DILocation(line: 1450, column: 36, scope: !1760)
!1763 = !DILocation(line: 1450, column: 11, scope: !1760)
!1764 = !DILocation(line: 1450, column: 9, scope: !1731)
!1765 = !DILocation(line: 1451, column: 9, scope: !1766)
!1766 = distinct !DILexicalBlock(scope: !1760, file: !69, line: 1450, column: 81)
!1767 = !DILocation(line: 1453, column: 14, scope: !1731)
!1768 = !DILocation(line: 1453, column: 13, scope: !1731)
!1769 = !DILocation(line: 1453, column: 23, scope: !1731)
!1770 = !DILocation(line: 1453, column: 5, scope: !1731)
!1771 = !DILocation(line: 1459, column: 64, scope: !1772)
!1772 = distinct !DILexicalBlock(scope: !1773, file: !69, line: 1459, column: 8)
!1773 = distinct !DILexicalBlock(scope: !1718, file: !69, line: 1457, column: 3)
!1774 = !DILocation(line: 1459, column: 88, scope: !1772)
!1775 = !DILocation(line: 1459, column: 100, scope: !1772)
!1776 = !DILocation(line: 1459, column: 98, scope: !1772)
!1777 = !DILocation(line: 1459, column: 115, scope: !1772)
!1778 = !DILocation(line: 1459, column: 113, scope: !1772)
!1779 = !DILocation(line: 1459, column: 74, scope: !1772)
!1780 = !DILocation(line: 1459, column: 48, scope: !1772)
!1781 = !DILocation(line: 1459, column: 10, scope: !1772)
!1782 = !DILocation(line: 1459, column: 8, scope: !1773)
!1783 = !DILocation(line: 1460, column: 8, scope: !1784)
!1784 = distinct !DILexicalBlock(scope: !1772, file: !69, line: 1459, column: 133)
!1785 = !DILocation(line: 1463, column: 51, scope: !1786)
!1786 = distinct !DILexicalBlock(scope: !1773, file: !69, line: 1463, column: 8)
!1787 = !DILocation(line: 1463, column: 63, scope: !1786)
!1788 = !DILocation(line: 1463, column: 61, scope: !1786)
!1789 = !DILocation(line: 1463, column: 35, scope: !1786)
!1790 = !DILocation(line: 1463, column: 88, scope: !1786)
!1791 = !DILocation(line: 1463, column: 78, scope: !1786)
!1792 = !DILocation(line: 1463, column: 10, scope: !1786)
!1793 = !DILocation(line: 1463, column: 8, scope: !1773)
!1794 = !DILocation(line: 1464, column: 8, scope: !1795)
!1795 = distinct !DILexicalBlock(scope: !1786, file: !69, line: 1463, column: 104)
!1796 = !DILocation(line: 1467, column: 54, scope: !1797)
!1797 = distinct !DILexicalBlock(scope: !1773, file: !69, line: 1467, column: 8)
!1798 = !DILocation(line: 1467, column: 78, scope: !1797)
!1799 = !DILocation(line: 1467, column: 90, scope: !1797)
!1800 = !DILocation(line: 1467, column: 88, scope: !1797)
!1801 = !DILocation(line: 1467, column: 105, scope: !1797)
!1802 = !DILocation(line: 1467, column: 103, scope: !1797)
!1803 = !DILocation(line: 1467, column: 64, scope: !1797)
!1804 = !DILocation(line: 1467, column: 38, scope: !1797)
!1805 = !DILocation(line: 1467, column: 10, scope: !1797)
!1806 = !DILocation(line: 1467, column: 8, scope: !1773)
!1807 = !DILocation(line: 1468, column: 8, scope: !1808)
!1808 = distinct !DILexicalBlock(scope: !1797, file: !69, line: 1467, column: 138)
!1809 = !DILocation(line: 1475, column: 42, scope: !1773)
!1810 = !DILocation(line: 1475, column: 66, scope: !1773)
!1811 = !DILocation(line: 1475, column: 78, scope: !1773)
!1812 = !DILocation(line: 1475, column: 76, scope: !1773)
!1813 = !DILocation(line: 1475, column: 93, scope: !1773)
!1814 = !DILocation(line: 1475, column: 91, scope: !1773)
!1815 = !DILocation(line: 1475, column: 52, scope: !1773)
!1816 = !DILocation(line: 1475, column: 107, scope: !1773)
!1817 = !DILocation(line: 1475, column: 26, scope: !1773)
!1818 = !DILocation(line: 1475, column: 24, scope: !1773)
!1819 = !DILocation(line: 1476, column: 4, scope: !1773)
!1820 = !DILocation(line: 1481, column: 1, scope: !1591)
!1821 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !33, file: !33, line: 42, type: !1822, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1822 = !DISubroutineType(types: !1823)
!1823 = !{!28, !22}
!1824 = !DILocalVariable(name: "value", arg: 1, scope: !1821, file: !33, line: 42, type: !22)
!1825 = !DILocation(line: 42, column: 38, scope: !1821)
!1826 = !DILocation(line: 44, column: 12, scope: !1821)
!1827 = !DILocation(line: 44, column: 18, scope: !1821)
!1828 = !DILocation(line: 44, column: 5, scope: !1821)
!1829 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !1830, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1830 = !DISubroutineType(types: !1831)
!1831 = !{!28, !22, !22}
!1832 = !DILocalVariable(name: "left", arg: 1, scope: !1829, file: !33, line: 54, type: !22)
!1833 = !DILocation(line: 54, column: 38, scope: !1829)
!1834 = !DILocalVariable(name: "right", arg: 2, scope: !1829, file: !33, line: 54, type: !22)
!1835 = !DILocation(line: 54, column: 52, scope: !1829)
!1836 = !DILocation(line: 56, column: 12, scope: !1829)
!1837 = !DILocation(line: 56, column: 19, scope: !1829)
!1838 = !DILocation(line: 56, column: 17, scope: !1829)
!1839 = !DILocation(line: 56, column: 25, scope: !1829)
!1840 = !DILocation(line: 56, column: 5, scope: !1829)
!1841 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !1822, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1842 = !DILocalVariable(name: "left", arg: 1, scope: !1841, file: !33, line: 84, type: !22)
!1843 = !DILocation(line: 84, column: 51, scope: !1841)
!1844 = !DILocation(line: 86, column: 12, scope: !1841)
!1845 = !DILocation(line: 86, column: 17, scope: !1841)
!1846 = !DILocation(line: 86, column: 5, scope: !1841)
!1847 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !1830, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1848 = !DILocalVariable(name: "left", arg: 1, scope: !1847, file: !33, line: 78, type: !22)
!1849 = !DILocation(line: 78, column: 38, scope: !1847)
!1850 = !DILocalVariable(name: "right", arg: 2, scope: !1847, file: !33, line: 78, type: !22)
!1851 = !DILocation(line: 78, column: 52, scope: !1847)
!1852 = !DILocation(line: 80, column: 12, scope: !1847)
!1853 = !DILocation(line: 80, column: 19, scope: !1847)
!1854 = !DILocation(line: 80, column: 17, scope: !1847)
!1855 = !DILocation(line: 80, column: 25, scope: !1847)
!1856 = !DILocation(line: 80, column: 5, scope: !1847)
!1857 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !1858, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1858 = !DISubroutineType(types: !1859)
!1859 = !{!28, !22, !29}
!1860 = !DILocalVariable(name: "left", arg: 1, scope: !1857, file: !33, line: 90, type: !22)
!1861 = !DILocation(line: 90, column: 41, scope: !1857)
!1862 = !DILocalVariable(name: "count", arg: 2, scope: !1857, file: !33, line: 90, type: !29)
!1863 = !DILocation(line: 90, column: 56, scope: !1857)
!1864 = !DILocation(line: 92, column: 9, scope: !1865)
!1865 = distinct !DILexicalBlock(scope: !1857, file: !33, line: 92, column: 9)
!1866 = !DILocation(line: 92, column: 15, scope: !1865)
!1867 = !DILocation(line: 92, column: 9, scope: !1857)
!1868 = !DILocation(line: 93, column: 9, scope: !1869)
!1869 = distinct !DILexicalBlock(scope: !1865, file: !33, line: 92, column: 32)
!1870 = !DILocation(line: 95, column: 12, scope: !1857)
!1871 = !DILocation(line: 95, column: 34, scope: !1857)
!1872 = !DILocation(line: 95, column: 31, scope: !1857)
!1873 = !DILocation(line: 95, column: 17, scope: !1857)
!1874 = !DILocation(line: 95, column: 41, scope: !1857)
!1875 = !DILocation(line: 95, column: 5, scope: !1857)
!1876 = !DILocation(line: 96, column: 1, scope: !1857)
!1877 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1499, type: !1878, scopeLine: 1500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1878 = !DISubroutineType(types: !1879)
!1879 = !{!6, !25, !428}
!1880 = !DILocalVariable(name: "numerator", arg: 1, scope: !1877, file: !69, line: 1499, type: !25)
!1881 = !DILocation(line: 1499, column: 25, scope: !1877)
!1882 = !DILocalVariable(name: "denominator", arg: 2, scope: !1877, file: !69, line: 1499, type: !428)
!1883 = !DILocation(line: 1499, column: 40, scope: !1877)
!1884 = !DILocalVariable(name: "numerator_prime", scope: !1877, file: !69, line: 1502, type: !428)
!1885 = !DILocation(line: 1502, column: 6, scope: !1877)
!1886 = !DILocalVariable(name: "u32Temp1", scope: !1877, file: !69, line: 1502, type: !428)
!1887 = !DILocation(line: 1502, column: 27, scope: !1877)
!1888 = !DILocalVariable(name: "u32Temp2", scope: !1877, file: !69, line: 1502, type: !428)
!1889 = !DILocation(line: 1502, column: 41, scope: !1877)
!1890 = !DILocalVariable(name: "u32Temp3", scope: !1877, file: !69, line: 1502, type: !428)
!1891 = !DILocation(line: 1502, column: 55, scope: !1877)
!1892 = !DILocalVariable(name: "s32Temp1", scope: !1877, file: !69, line: 1503, type: !25)
!1893 = !DILocation(line: 1503, column: 6, scope: !1877)
!1894 = !DILocalVariable(name: "s32Temp2", scope: !1877, file: !69, line: 1503, type: !25)
!1895 = !DILocation(line: 1503, column: 20, scope: !1877)
!1896 = !DILocalVariable(name: "s32Temp3", scope: !1877, file: !69, line: 1503, type: !25)
!1897 = !DILocation(line: 1503, column: 34, scope: !1877)
!1898 = !DILocation(line: 1504, column: 5, scope: !1899)
!1899 = distinct !DILexicalBlock(scope: !1877, file: !69, line: 1504, column: 5)
!1900 = !DILocation(line: 1504, column: 17, scope: !1899)
!1901 = !DILocation(line: 1504, column: 5, scope: !1877)
!1902 = !DILocation(line: 1506, column: 6, scope: !1903)
!1903 = distinct !DILexicalBlock(scope: !1904, file: !69, line: 1506, column: 6)
!1904 = distinct !DILexicalBlock(scope: !1899, file: !69, line: 1505, column: 2)
!1905 = !DILocation(line: 1506, column: 15, scope: !1903)
!1906 = !DILocation(line: 1506, column: 6, scope: !1904)
!1907 = !DILocation(line: 1508, column: 4, scope: !1908)
!1908 = distinct !DILexicalBlock(scope: !1903, file: !69, line: 1507, column: 3)
!1909 = !DILocation(line: 1512, column: 4, scope: !1910)
!1910 = distinct !DILexicalBlock(scope: !1903, file: !69, line: 1511, column: 3)
!1911 = !DILocation(line: 1517, column: 6, scope: !1912)
!1912 = distinct !DILexicalBlock(scope: !1913, file: !69, line: 1517, column: 6)
!1913 = distinct !DILexicalBlock(scope: !1899, file: !69, line: 1516, column: 2)
!1914 = !DILocation(line: 1517, column: 16, scope: !1912)
!1915 = !DILocation(line: 1517, column: 6, scope: !1913)
!1916 = !DILocation(line: 1519, column: 23, scope: !1917)
!1917 = distinct !DILexicalBlock(scope: !1912, file: !69, line: 1518, column: 3)
!1918 = !DILocation(line: 1519, column: 22, scope: !1917)
!1919 = !DILocation(line: 1519, column: 20, scope: !1917)
!1920 = !DILocation(line: 1520, column: 16, scope: !1917)
!1921 = !DILocation(line: 1520, column: 32, scope: !1917)
!1922 = !DILocation(line: 1520, column: 31, scope: !1917)
!1923 = !DILocation(line: 1520, column: 13, scope: !1917)
!1924 = !DILocation(line: 1521, column: 15, scope: !1917)
!1925 = !DILocation(line: 1521, column: 34, scope: !1917)
!1926 = !DILocation(line: 1521, column: 45, scope: !1917)
!1927 = !DILocation(line: 1521, column: 43, scope: !1917)
!1928 = !DILocation(line: 1521, column: 31, scope: !1917)
!1929 = !DILocation(line: 1521, column: 13, scope: !1917)
!1930 = !DILocation(line: 1523, column: 8, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1917, file: !69, line: 1523, column: 7)
!1932 = !DILocation(line: 1523, column: 20, scope: !1931)
!1933 = !DILocation(line: 1523, column: 27, scope: !1931)
!1934 = !DILocation(line: 1523, column: 7, scope: !1917)
!1935 = !DILocation(line: 1525, column: 19, scope: !1936)
!1936 = distinct !DILexicalBlock(scope: !1931, file: !69, line: 1524, column: 4)
!1937 = !DILocation(line: 1525, column: 31, scope: !1936)
!1938 = !DILocation(line: 1525, column: 17, scope: !1936)
!1939 = !DILocation(line: 1526, column: 4, scope: !1936)
!1940 = !DILocation(line: 1529, column: 20, scope: !1941)
!1941 = distinct !DILexicalBlock(scope: !1931, file: !69, line: 1528, column: 4)
!1942 = !DILocation(line: 1529, column: 32, scope: !1941)
!1943 = !DILocation(line: 1529, column: 38, scope: !1941)
!1944 = !DILocation(line: 1529, column: 17, scope: !1941)
!1945 = !DILocation(line: 1532, column: 7, scope: !1946)
!1946 = distinct !DILexicalBlock(scope: !1917, file: !69, line: 1532, column: 7)
!1947 = !DILocation(line: 1532, column: 18, scope: !1946)
!1948 = !DILocation(line: 1532, column: 16, scope: !1946)
!1949 = !DILocation(line: 1532, column: 7, scope: !1917)
!1950 = !DILocation(line: 1534, column: 18, scope: !1951)
!1951 = distinct !DILexicalBlock(scope: !1946, file: !69, line: 1533, column: 4)
!1952 = !DILocation(line: 1534, column: 16, scope: !1951)
!1953 = !DILocation(line: 1534, column: 28, scope: !1951)
!1954 = !DILocation(line: 1534, column: 14, scope: !1951)
!1955 = !DILocation(line: 1535, column: 4, scope: !1951)
!1956 = !DILocation(line: 1538, column: 18, scope: !1957)
!1957 = distinct !DILexicalBlock(scope: !1946, file: !69, line: 1537, column: 4)
!1958 = !DILocation(line: 1538, column: 26, scope: !1957)
!1959 = !DILocation(line: 1538, column: 16, scope: !1957)
!1960 = !DILocation(line: 1538, column: 30, scope: !1957)
!1961 = !DILocation(line: 1538, column: 14, scope: !1957)
!1962 = !DILocation(line: 1540, column: 8, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1917, file: !69, line: 1540, column: 7)
!1964 = !DILocation(line: 1540, column: 18, scope: !1963)
!1965 = !DILocation(line: 1540, column: 7, scope: !1917)
!1966 = !DILocation(line: 1542, column: 18, scope: !1967)
!1967 = distinct !DILexicalBlock(scope: !1963, file: !69, line: 1541, column: 4)
!1968 = !DILocation(line: 1542, column: 12, scope: !1967)
!1969 = !DILocation(line: 1542, column: 5, scope: !1967)
!1970 = !DILocation(line: 1546, column: 5, scope: !1971)
!1971 = distinct !DILexicalBlock(scope: !1963, file: !69, line: 1545, column: 4)
!1972 = !DILocation(line: 1551, column: 16, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1912, file: !69, line: 1550, column: 3)
!1974 = !DILocation(line: 1551, column: 26, scope: !1973)
!1975 = !DILocation(line: 1551, column: 25, scope: !1973)
!1976 = !DILocation(line: 1551, column: 41, scope: !1973)
!1977 = !DILocation(line: 1551, column: 39, scope: !1973)
!1978 = !DILocation(line: 1551, column: 13, scope: !1973)
!1979 = !DILocation(line: 1552, column: 16, scope: !1973)
!1980 = !DILocation(line: 1552, column: 30, scope: !1973)
!1981 = !DILocation(line: 1552, column: 40, scope: !1973)
!1982 = !DILocation(line: 1552, column: 39, scope: !1973)
!1983 = !DILocation(line: 1552, column: 55, scope: !1973)
!1984 = !DILocation(line: 1552, column: 53, scope: !1973)
!1985 = !DILocation(line: 1552, column: 26, scope: !1973)
!1986 = !DILocation(line: 1552, column: 68, scope: !1973)
!1987 = !DILocation(line: 1552, column: 13, scope: !1973)
!1988 = !DILocation(line: 1553, column: 16, scope: !1973)
!1989 = !DILocation(line: 1553, column: 25, scope: !1973)
!1990 = !DILocation(line: 1553, column: 24, scope: !1973)
!1991 = !DILocation(line: 1553, column: 41, scope: !1973)
!1992 = !DILocation(line: 1553, column: 51, scope: !1973)
!1993 = !DILocation(line: 1553, column: 50, scope: !1973)
!1994 = !DILocation(line: 1553, column: 38, scope: !1973)
!1995 = !DILocation(line: 1553, column: 13, scope: !1973)
!1996 = !DILocation(line: 1554, column: 7, scope: !1997)
!1997 = distinct !DILexicalBlock(scope: !1973, file: !69, line: 1554, column: 7)
!1998 = !DILocation(line: 1554, column: 16, scope: !1997)
!1999 = !DILocation(line: 1554, column: 7, scope: !1973)
!2000 = !DILocation(line: 1556, column: 17, scope: !2001)
!2001 = distinct !DILexicalBlock(scope: !1997, file: !69, line: 1555, column: 4)
!2002 = !DILocation(line: 1556, column: 12, scope: !2001)
!2003 = !DILocation(line: 1556, column: 5, scope: !2001)
!2004 = !DILocation(line: 1560, column: 5, scope: !2005)
!2005 = distinct !DILexicalBlock(scope: !1997, file: !69, line: 1559, column: 4)
!2006 = !DILocation(line: 1564, column: 1, scope: !1877)
!2007 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2008, file: !2008, line: 12, type: !2009, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2012)
!2008 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2009 = !DISubroutineType(types: !2010)
!2010 = !{null, !2011}
!2011 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2012 = !{!2013}
!2013 = !DILocalVariable(name: "z", arg: 1, scope: !2007, file: !2008, line: 12, type: !2011)
!2014 = !DILocation(line: 0, scope: !2007)
!2015 = !DILocation(line: 13, column: 9, scope: !2016)
!2016 = distinct !DILexicalBlock(scope: !2007, file: !2008, line: 13, column: 7)
!2017 = !DILocation(line: 13, column: 7, scope: !2007)
!2018 = !DILocation(line: 14, column: 5, scope: !2016)
!2019 = !DILocation(line: 15, column: 1, scope: !2007)
!2020 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2021, file: !2021, line: 20, type: !2022, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2025)
!2021 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2022 = !DISubroutineType(types: !2023)
!2023 = !{null, !2024, !2024}
!2024 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2025 = !{!2026, !2027}
!2026 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2020, file: !2021, line: 20, type: !2024)
!2027 = !DILocalVariable(name: "shift", arg: 2, scope: !2020, file: !2021, line: 20, type: !2024)
!2028 = !DILocation(line: 0, scope: !2020)
!2029 = !DILocation(line: 21, column: 13, scope: !2030)
!2030 = distinct !DILexicalBlock(scope: !2020, file: !2021, line: 21, column: 7)
!2031 = !DILocation(line: 21, column: 7, scope: !2020)
!2032 = !DILocation(line: 27, column: 5, scope: !2033)
!2033 = distinct !DILexicalBlock(scope: !2030, file: !2021, line: 21, column: 26)
!2034 = !DILocation(line: 29, column: 1, scope: !2020)
