; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0055/build/s16_fac05_div_s16_u16_alarm_0055.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [75 x i8] c"KLEE-ALARM-0055: invalid LHS operand for left shift. assert 0 <= s32Temp1;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0055.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1.10 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2.11 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %numerator = alloca i16, align 2
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %numerator, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i16* %result, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = bitcast i16* %numerator to i8*, !dbg !55
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !56
  %1 = bitcast i16* %denominator to i8*, !dbg !57
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  %2 = load i16, i16* %numerator, align 2, !dbg !59
  %3 = load i16, i16* %denominator, align 2, !dbg !60
  %call = call signext i16 @s16_fac05_div_s16_u16(i16 signext %2, i16 zeroext %3), !dbg !61
  store i16 %call, i16* %result, align 2, !dbg !62
  %4 = load i16, i16* %result, align 2, !dbg !63
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
  %call31 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv30, i32 1), !dbg !368
  %tobool32 = icmp ne i32 %call31, 0, !dbg !368
  br i1 %tobool32, label %if.end34, label %if.then33, !dbg !369

if.then33:                                        ; preds = %if.end22
  store i16 0, i16* %retval, align 2, !dbg !370
  br label %return, !dbg !370

if.end34:                                         ; preds = %if.end22
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !372
  %conv35 = sext i32 %13 to i64, !dbg !374
  %call36 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv35), !dbg !375
  %tobool37 = icmp ne i32 %call36, 0, !dbg !375
  br i1 %tobool37, label %if.end39, label %if.then38, !dbg !376

if.then38:                                        ; preds = %if.end34
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 379, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !377
  unreachable, !dbg !377

if.end39:                                         ; preds = %if.end34
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !379
  %shl40 = shl i32 %14, 1, !dbg !380
  %conv41 = sext i32 %shl40 to i64, !dbg !381
  store volatile i64 %conv41, i64* @klee_alarm_sink_s64, align 8, !dbg !382
  store i16 0, i16* %retval, align 2, !dbg !383
  br label %return, !dbg !383

return:                                           ; preds = %if.end39, %if.then33, %if.then21, %if.else, %if.then11, %if.then
  %15 = load i16, i16* %retval, align 2, !dbg !384
  ret i16 %15, !dbg !384
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !385 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !388, metadata !DIExpression()), !dbg !389
  %0 = load i64, i64* %left.addr, align 8, !dbg !390
  %cmp = icmp sge i64 %0, 0, !dbg !391
  %conv = zext i1 %cmp to i32, !dbg !391
  ret i32 %conv, !dbg !392
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !393 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !396, metadata !DIExpression()), !dbg !397
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !398, metadata !DIExpression()), !dbg !399
  %0 = load i64, i64* %left.addr, align 8, !dbg !400
  %1 = load i64, i64* %right.addr, align 8, !dbg !401
  %mul = mul nsw i64 %0, %1, !dbg !402
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !403
  %conv = zext i1 %cmp to i32, !dbg !403
  ret i32 %conv, !dbg !404
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !405 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !408, metadata !DIExpression()), !dbg !409
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !410, metadata !DIExpression()), !dbg !411
  %0 = load i32, i32* %count.addr, align 4, !dbg !412
  %cmp = icmp uge i32 %0, 63, !dbg !414
  br i1 %cmp, label %if.then, label %if.end, !dbg !415

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !416
  br label %return, !dbg !416

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !418
  %2 = load i32, i32* %count.addr, align 4, !dbg !419
  %sh_prom = zext i32 %2 to i64, !dbg !420
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !420
  %shl = shl i64 1, %sh_prom, !dbg !420, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !421
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !422
  %conv = zext i1 %cmp1 to i32, !dbg !422
  store i32 %conv, i32* %retval, align 4, !dbg !423
  br label %return, !dbg !423

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !424
  ret i32 %3, !dbg !424
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !425 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !426, metadata !DIExpression()), !dbg !427
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !428, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !430, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !432, metadata !DIExpression()), !dbg !433
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !434
  %conv = zext i16 %0 to i32, !dbg !434
  %and = and i32 %conv, 65535, !dbg !435
  %conv1 = trunc i32 %and to i16, !dbg !434
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !436
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !437
  %conv2 = zext i16 %1 to i32, !dbg !437
  %cmp = icmp eq i32 %conv2, 0, !dbg !439
  br i1 %cmp, label %if.then, label %if.else8, !dbg !440

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !441
  %conv4 = sext i16 %2 to i32, !dbg !441
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !444
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !445

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !446
  br label %return, !dbg !446

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !448
  br label %return, !dbg !448

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !450
  %conv9 = sext i16 %3 to i32, !dbg !450
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !452
  %conv10 = sext i16 %4 to i32, !dbg !452
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !453
  %conv11 = zext i16 %5 to i32, !dbg !453
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !454
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !454
  %div = sdiv i32 %conv10, %conv11, !dbg !454, !klee.check.div !106
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !455
  %conv12 = zext i16 %6 to i32, !dbg !455
  %mul = mul nsw i32 %div, %conv12, !dbg !456
  %sub = sub nsw i32 %conv9, %mul, !dbg !457
  %shl = shl i32 %sub, 1, !dbg !458
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !459
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !460
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !461
  %conv13 = zext i16 %8 to i32, !dbg !461
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !462
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !462
  %div14 = sdiv i32 %7, %conv13, !dbg !462, !klee.check.div !106
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !463
  %conv15 = sext i16 %9 to i32, !dbg !463
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !464
  %conv16 = zext i16 %10 to i32, !dbg !464
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !465
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !465
  %div17 = sdiv i32 %conv15, %conv16, !dbg !465, !klee.check.div !106
  %add = add nsw i32 %div14, %div17, !dbg !466
  store i32 %add, i32* %s32Temp1, align 4, !dbg !467
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !468
  %conv18 = trunc i32 %11 to i16, !dbg !468
  store i16 %conv18, i16* %retval, align 2, !dbg !469
  br label %return, !dbg !469

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !470
  ret i16 %12, !dbg !470
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !471 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !474, metadata !DIExpression()), !dbg !475
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !476, metadata !DIExpression()), !dbg !477
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !478, metadata !DIExpression()), !dbg !480
  store i32 0, i32* %u32Temp1, align 4, !dbg !480
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !481, metadata !DIExpression()), !dbg !482
  store i32 0, i32* %u32Temp2, align 4, !dbg !482
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !483, metadata !DIExpression()), !dbg !484
  store i32 0, i32* %u32Temp3, align 4, !dbg !484
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !485
  %conv = zext i16 %0 to i32, !dbg !485
  %cmp = icmp eq i32 %conv, 0, !dbg !487
  br i1 %cmp, label %if.then, label %if.else, !dbg !488

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !489
  br label %return, !dbg !489

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !491
  %conv2 = zext i16 %1 to i32, !dbg !491
  %shl = shl i32 %conv2, 16, !dbg !493
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !494
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !495
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !496
  %conv3 = zext i16 %3 to i32, !dbg !496
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !497
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !497
  %div = udiv i32 %2, %conv3, !dbg !497, !klee.check.div !106
  store i32 %div, i32* %u32Temp2, align 4, !dbg !498
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !499
  %add = add i32 %4, 128, !dbg !500
  %shr = lshr i32 %add, 8, !dbg !501
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !502
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !503
  %cmp4 = icmp ult i32 %5, 255, !dbg !505
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !506

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !507
  %conv7 = trunc i32 %6 to i8, !dbg !509
  store i8 %conv7, i8* %retval, align 1, !dbg !510
  br label %return, !dbg !510

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !511
  br label %return, !dbg !511

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !513
  ret i8 %7, !dbg !513
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !514 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !517, metadata !DIExpression()), !dbg !518
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !519, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !521, metadata !DIExpression()), !dbg !522
  store i32 0, i32* %s32Temp1, align 4, !dbg !522
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !523
  %conv = zext i16 %0 to i32, !dbg !523
  %and = and i32 %conv, 65535, !dbg !524
  %conv1 = trunc i32 %and to i16, !dbg !523
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !525
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !526
  %conv2 = zext i16 %1 to i32, !dbg !526
  %and3 = and i32 %conv2, 65535, !dbg !528
  %cmp = icmp eq i32 %and3, 0, !dbg !529
  br i1 %cmp, label %if.then, label %if.else8, !dbg !530

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !531
  %cmp5 = icmp sge i32 %2, 0, !dbg !534
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !535

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !536
  br label %return, !dbg !536

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !538
  br label %return, !dbg !538

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !540
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !542
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !543
  %conv9 = zext i16 %5 to i32, !dbg !543
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !544
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !544
  %div = sdiv i32 %4, %conv9, !dbg !544, !klee.check.div !106
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !545
  %conv10 = zext i16 %6 to i32, !dbg !545
  %mul = mul nsw i32 %div, %conv10, !dbg !546
  %sub = sub nsw i32 %3, %mul, !dbg !547
  %shl = shl i32 %sub, 1, !dbg !548
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !549
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !550
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !551
  %conv11 = zext i16 %8 to i32, !dbg !551
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !552
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !552
  %div12 = sdiv i32 %7, %conv11, !dbg !552, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !553
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !554
  %conv13 = zext i16 %10 to i32, !dbg !554
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !555
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !555
  %div14 = sdiv i32 %9, %conv13, !dbg !555, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !556
  store i32 %add, i32* %s32Temp1, align 4, !dbg !557
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !558
  %cmp15 = icmp slt i32 %11, 65535, !dbg !560
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !561

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !562
  %cmp18 = icmp sgt i32 %12, 0, !dbg !565
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !566

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !567
  %conv21 = trunc i32 %13 to i16, !dbg !569
  store i16 %conv21, i16* %retval, align 2, !dbg !570
  br label %return, !dbg !570

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !571
  br label %return, !dbg !571

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !573
  br label %return, !dbg !573

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !575
  ret i16 %14, !dbg !575
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !576 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !579, metadata !DIExpression()), !dbg !580
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !581, metadata !DIExpression()), !dbg !582
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !583, metadata !DIExpression()), !dbg !584
  store i32 0, i32* %u32Temp, align 4, !dbg !584
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !585
  %conv = zext i16 %0 to i32, !dbg !585
  %cmp = icmp eq i32 %conv, 0, !dbg !587
  br i1 %cmp, label %if.then, label %if.else, !dbg !588

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !589
  br label %return, !dbg !589

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !591
  %conv2 = zext i16 %1 to i32, !dbg !591
  %shl = shl i32 %conv2, 16, !dbg !593
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !594
  %conv3 = zext i16 %2 to i32, !dbg !594
  %shr = ashr i32 %conv3, 1, !dbg !595
  %add = add nsw i32 %shl, %shr, !dbg !596
  store i32 %add, i32* %u32Temp, align 4, !dbg !597
  %3 = load i32, i32* %u32Temp, align 4, !dbg !598
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !599
  %conv4 = zext i16 %4 to i32, !dbg !599
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !600
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !600
  %div = udiv i32 %3, %conv4, !dbg !600, !klee.check.div !106
  store i32 %div, i32* %u32Temp, align 4, !dbg !601
  %5 = load i32, i32* %u32Temp, align 4, !dbg !602
  %cmp5 = icmp ult i32 %5, 65535, !dbg !604
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !605

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !606
  %and = and i32 %6, 65535, !dbg !608
  %conv8 = trunc i32 %and to i16, !dbg !606
  store i16 %conv8, i16* %retval, align 2, !dbg !609
  br label %return, !dbg !609

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !610
  br label %return, !dbg !610

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !612
  ret i16 %7, !dbg !612
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !613 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !616, metadata !DIExpression()), !dbg !617
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !618, metadata !DIExpression()), !dbg !619
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !620, metadata !DIExpression()), !dbg !621
  store i32 0, i32* %u32Temp1, align 4, !dbg !621
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !622, metadata !DIExpression()), !dbg !623
  store i32 0, i32* %u32Temp2, align 4, !dbg !623
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !624
  %conv = zext i16 %0 to i32, !dbg !624
  %and = and i32 %conv, 65535, !dbg !625
  %conv1 = trunc i32 %and to i16, !dbg !624
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !626
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !627
  %conv2 = zext i16 %1 to i32, !dbg !627
  %cmp = icmp eq i32 %conv2, 0, !dbg !629
  br i1 %cmp, label %if.then, label %if.else, !dbg !630

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !631
  br label %return, !dbg !631

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !633
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !635
  %conv4 = zext i16 %3 to i32, !dbg !635
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !636
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !636
  %div = udiv i32 %2, %conv4, !dbg !636, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !637
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !638
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !639
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !640
  %conv5 = zext i16 %6 to i32, !dbg !640
  %mul = mul i32 %5, %conv5, !dbg !641
  %sub = sub i32 %4, %mul, !dbg !642
  %shl = shl i32 %sub, 1, !dbg !643
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !644
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !645
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !646
  %conv6 = zext i16 %8 to i32, !dbg !646
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !647
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !647
  %div7 = udiv i32 %7, %conv6, !dbg !647, !klee.check.div !106
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !648
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !649
  %conv8 = zext i16 %10 to i32, !dbg !649
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !650
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !650
  %div9 = udiv i32 %9, %conv8, !dbg !650, !klee.check.div !106
  %add = add i32 %div7, %div9, !dbg !651
  store i32 %add, i32* %u32Temp2, align 4, !dbg !652
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !653
  %cmp10 = icmp ult i32 %11, 65535, !dbg !655
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !656

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !657
  %and13 = and i32 %12, 65535, !dbg !659
  %conv14 = trunc i32 %and13 to i16, !dbg !657
  store i16 %conv14, i16* %retval, align 2, !dbg !660
  br label %return, !dbg !660

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !661
  br label %return, !dbg !661

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !663
  ret i16 %13, !dbg !663
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !664 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !667, metadata !DIExpression()), !dbg !668
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !669, metadata !DIExpression()), !dbg !670
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !671, metadata !DIExpression()), !dbg !672
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !673, metadata !DIExpression()), !dbg !674
  store i32 0, i32* %s32Result, align 4, !dbg !674
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !675, metadata !DIExpression()), !dbg !676
  store i32 0, i32* %s32Temp1, align 4, !dbg !676
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !677
  %conv = sext i16 %0 to i32, !dbg !677
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !678
  %conv1 = zext i16 %1 to i32, !dbg !678
  %mul = mul nsw i32 %conv, %conv1, !dbg !679
  store i32 %mul, i32* %s32Result, align 4, !dbg !680
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !681
  %conv2 = sext i16 %2 to i32, !dbg !681
  %cmp = icmp eq i32 %conv2, 0, !dbg !683
  br i1 %cmp, label %if.then, label %if.else7, !dbg !684

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !685
  %cmp4 = icmp slt i32 %3, 0, !dbg !688
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !689

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !690
  br label %return, !dbg !690

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !692
  br label %return, !dbg !692

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !694
  %5 = load i32, i32* %s32Result, align 4, !dbg !696
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !697
  %conv8 = sext i16 %6 to i32, !dbg !697
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !698
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !698
  %div = sdiv i32 %5, %conv8, !dbg !698, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !699
  %conv9 = sext i16 %7 to i32, !dbg !699
  %mul10 = mul nsw i32 %div, %conv9, !dbg !700
  %sub = sub nsw i32 %4, %mul10, !dbg !701
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !702
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !703
  %shl = shl i32 %8, 1, !dbg !704
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !705
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !706
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !707
  %conv11 = sext i16 %10 to i32, !dbg !707
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !708
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !708
  %div12 = sdiv i32 %9, %conv11, !dbg !708, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !709
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !710
  %conv13 = sext i16 %12 to i32, !dbg !710
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !711
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !711
  %div14 = sdiv i32 %11, %conv13, !dbg !711, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !712
  store i32 %add, i32* %s32Result, align 4, !dbg !713
  %13 = load i32, i32* %s32Result, align 4, !dbg !714
  %cmp15 = icmp slt i32 %13, 32767, !dbg !716
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !717

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !718
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !721
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !722

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !723
  %conv21 = trunc i32 %15 to i16, !dbg !725
  store i16 %conv21, i16* %retval, align 2, !dbg !726
  br label %return, !dbg !726

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !727
  br label %return, !dbg !727

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !729
  br label %return, !dbg !729

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !731
  ret i16 %16, !dbg !731
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !732 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !735, metadata !DIExpression()), !dbg !736
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !737, metadata !DIExpression()), !dbg !738
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !739, metadata !DIExpression()), !dbg !740
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !741, metadata !DIExpression()), !dbg !742
  store i32 0, i32* %s32Result, align 4, !dbg !742
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !743, metadata !DIExpression()), !dbg !744
  store i32 0, i32* %s32Temp1, align 4, !dbg !744
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !745
  %conv = zext i16 %0 to i32, !dbg !745
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !746
  %conv1 = sext i16 %1 to i32, !dbg !746
  %mul = mul nsw i32 %conv, %conv1, !dbg !747
  store i32 %mul, i32* %s32Result, align 4, !dbg !748
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !749
  %conv2 = zext i16 %2 to i32, !dbg !749
  %cmp = icmp eq i32 %conv2, 0, !dbg !751
  br i1 %cmp, label %if.then, label %if.else7, !dbg !752

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !753
  %cmp4 = icmp slt i32 %3, 0, !dbg !756
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !757

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !758
  br label %return, !dbg !758

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !760
  br label %return, !dbg !760

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !762
  %5 = load i32, i32* %s32Result, align 4, !dbg !764
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !765
  %conv8 = zext i16 %6 to i32, !dbg !765
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !766
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !766
  %div = sdiv i32 %5, %conv8, !dbg !766, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !767
  %conv9 = zext i16 %7 to i32, !dbg !767
  %mul10 = mul nsw i32 %div, %conv9, !dbg !768
  %sub = sub nsw i32 %4, %mul10, !dbg !769
  %shl = shl i32 %sub, 1, !dbg !770
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !771
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !772
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !773
  %conv11 = zext i16 %9 to i32, !dbg !773
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !774
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !774
  %div12 = sdiv i32 %8, %conv11, !dbg !774, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !775
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !776
  %conv13 = zext i16 %11 to i32, !dbg !776
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !777
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !777
  %div14 = sdiv i32 %10, %conv13, !dbg !777, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !778
  store i32 %add, i32* %s32Result, align 4, !dbg !779
  %12 = load i32, i32* %s32Result, align 4, !dbg !780
  %cmp15 = icmp slt i32 %12, 32767, !dbg !782
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !783

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !784
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !787
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !788

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !789
  %conv21 = trunc i32 %14 to i16, !dbg !791
  store i16 %conv21, i16* %retval, align 2, !dbg !792
  br label %return, !dbg !792

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !793
  br label %return, !dbg !793

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !795
  br label %return, !dbg !795

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !797
  ret i16 %15, !dbg !797
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !798 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !801, metadata !DIExpression()), !dbg !802
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !803, metadata !DIExpression()), !dbg !804
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !805, metadata !DIExpression()), !dbg !806
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !807, metadata !DIExpression()), !dbg !808
  store i32 0, i32* %u32Result, align 4, !dbg !808
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !809, metadata !DIExpression()), !dbg !810
  store i32 0, i32* %u32Temp1, align 4, !dbg !810
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !811, metadata !DIExpression()), !dbg !812
  store i32 0, i32* %s32Result, align 4, !dbg !812
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !813, metadata !DIExpression()), !dbg !814
  store i32 0, i32* %s32Temp1, align 4, !dbg !814
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !815
  %conv = sext i16 %0 to i32, !dbg !815
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !816
  %conv1 = zext i16 %1 to i32, !dbg !816
  %mul = mul nsw i32 %conv, %conv1, !dbg !817
  store i32 %mul, i32* %s32Result, align 4, !dbg !818
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !819
  %conv2 = sext i16 %2 to i32, !dbg !819
  %cmp = icmp eq i32 %conv2, 0, !dbg !821
  br i1 %cmp, label %if.then, label %if.else7, !dbg !822

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !823
  %cmp4 = icmp sge i32 %3, 0, !dbg !826
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !827

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !828
  br label %return, !dbg !828

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !830
  br label %return, !dbg !830

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !832
  %5 = load i32, i32* %s32Result, align 4, !dbg !834
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !835
  %conv8 = sext i16 %6 to i32, !dbg !835
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !836
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !836
  %div = sdiv i32 %5, %conv8, !dbg !836, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !837
  %conv9 = sext i16 %7 to i32, !dbg !837
  %mul10 = mul nsw i32 %div, %conv9, !dbg !838
  %sub = sub nsw i32 %4, %mul10, !dbg !839
  %shl = shl i32 %sub, 1, !dbg !840
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !841
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !842
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !843
  %conv11 = sext i16 %9 to i32, !dbg !843
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !844
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !844
  %div12 = sdiv i32 %8, %conv11, !dbg !844, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !845
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !846
  %conv13 = sext i16 %11 to i32, !dbg !846
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !847
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !847
  %div14 = sdiv i32 %10, %conv13, !dbg !847, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !848
  store i32 %add, i32* %s32Result, align 4, !dbg !849
  %12 = load i32, i32* %s32Result, align 4, !dbg !850
  %cmp15 = icmp slt i32 %12, 65535, !dbg !852
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !853

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !854
  %cmp18 = icmp sgt i32 %13, 0, !dbg !857
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !858

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !859
  %conv21 = trunc i32 %14 to i16, !dbg !861
  store i16 %conv21, i16* %retval, align 2, !dbg !862
  br label %return, !dbg !862

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !863
  br label %return, !dbg !863

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !865
  br label %return, !dbg !865

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !867
  ret i16 %15, !dbg !867
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !868 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !871, metadata !DIExpression()), !dbg !872
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !873, metadata !DIExpression()), !dbg !874
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !875, metadata !DIExpression()), !dbg !876
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !877, metadata !DIExpression()), !dbg !878
  store i32 0, i32* %s32Result, align 4, !dbg !878
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !879, metadata !DIExpression()), !dbg !880
  store i32 0, i32* %s32Temp1, align 4, !dbg !880
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !881
  %conv = sext i16 %0 to i32, !dbg !881
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !882
  %conv1 = zext i16 %1 to i32, !dbg !882
  %mul = mul nsw i32 %conv, %conv1, !dbg !883
  store i32 %mul, i32* %s32Result, align 4, !dbg !884
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !885
  %conv2 = zext i16 %2 to i32, !dbg !885
  %cmp = icmp eq i32 %conv2, 0, !dbg !887
  br i1 %cmp, label %if.then, label %if.else7, !dbg !888

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !889
  %cmp4 = icmp sge i32 %3, 0, !dbg !892
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !893

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !894
  br label %return, !dbg !894

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !896
  br label %return, !dbg !896

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !898
  %5 = load i32, i32* %s32Result, align 4, !dbg !900
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !901
  %conv8 = zext i16 %6 to i32, !dbg !901
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !902
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !902
  %div = sdiv i32 %5, %conv8, !dbg !902, !klee.check.div !106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !903
  %conv9 = zext i16 %7 to i32, !dbg !903
  %mul10 = mul nsw i32 %div, %conv9, !dbg !904
  %sub = sub nsw i32 %4, %mul10, !dbg !905
  %shl = shl i32 %sub, 1, !dbg !906
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !907
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !908
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !909
  %conv11 = zext i16 %9 to i32, !dbg !909
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !910
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !910
  %div12 = sdiv i32 %8, %conv11, !dbg !910, !klee.check.div !106
  %10 = load i32, i32* %s32Result, align 4, !dbg !911
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !912
  %conv13 = zext i16 %11 to i32, !dbg !912
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !913
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !913
  %div14 = sdiv i32 %10, %conv13, !dbg !913, !klee.check.div !106
  %add = add nsw i32 %div12, %div14, !dbg !914
  store i32 %add, i32* %s32Result, align 4, !dbg !915
  %12 = load i32, i32* %s32Result, align 4, !dbg !916
  %cmp15 = icmp slt i32 %12, 65535, !dbg !918
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !919

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !920
  %cmp18 = icmp sgt i32 %13, 0, !dbg !923
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !924

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !925
  %conv21 = trunc i32 %14 to i16, !dbg !927
  store i16 %conv21, i16* %retval, align 2, !dbg !928
  br label %return, !dbg !928

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !929
  br label %return, !dbg !929

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !931
  br label %return, !dbg !931

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !933
  ret i16 %15, !dbg !933
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !934 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !937, metadata !DIExpression()), !dbg !938
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !939, metadata !DIExpression()), !dbg !940
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !941, metadata !DIExpression()), !dbg !942
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !943, metadata !DIExpression()), !dbg !944
  store i32 0, i32* %u32Temp1, align 4, !dbg !944
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !945, metadata !DIExpression()), !dbg !946
  store i16 0, i16* %u16TempDenom, align 2, !dbg !946
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !947
  %conv = zext i16 %0 to i32, !dbg !947
  %cmp = icmp eq i32 %conv, 0, !dbg !949
  br i1 %cmp, label %if.then, label %if.else, !dbg !950

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !951
  br label %return, !dbg !951

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !953
  %conv2 = zext i16 %1 to i32, !dbg !953
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !955
  %conv3 = zext i16 %2 to i32, !dbg !955
  %mul = mul nsw i32 %conv2, %conv3, !dbg !956
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !957
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !958
  %conv4 = zext i16 %3 to i32, !dbg !958
  %shr = ashr i32 %conv4, 1, !dbg !959
  %conv5 = trunc i32 %shr to i16, !dbg !958
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !960
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !961
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !962
  %conv6 = zext i16 %5 to i32, !dbg !962
  %add = add i32 %4, %conv6, !dbg !963
  store i32 %add, i32* %u32Temp1, align 4, !dbg !964
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !965
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !966
  %conv7 = zext i16 %7 to i32, !dbg !966
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !967
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !967
  %div = udiv i32 %6, %conv7, !dbg !967, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !968
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !969
  %cmp8 = icmp ult i32 %8, 65535, !dbg !971
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !972

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !973
  %and = and i32 %9, 65535, !dbg !975
  %conv11 = trunc i32 %and to i16, !dbg !976
  store i16 %conv11, i16* %retval, align 2, !dbg !977
  br label %return, !dbg !977

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !978
  br label %return, !dbg !978

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !980
  ret i16 %10, !dbg !980
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !981 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !984, metadata !DIExpression()), !dbg !985
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !986, metadata !DIExpression()), !dbg !987
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !988, metadata !DIExpression()), !dbg !989
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !990, metadata !DIExpression()), !dbg !991
  store i32 0, i32* %u32Temp1, align 4, !dbg !991
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !992
  %cmp = icmp eq i32 %0, 0, !dbg !994
  br i1 %cmp, label %if.then, label %if.else, !dbg !995

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !996
  br label %return, !dbg !996

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !998
  %conv = zext i16 %1 to i32, !dbg !998
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1000
  %conv1 = zext i16 %2 to i32, !dbg !1000
  %mul = mul nsw i32 %conv, %conv1, !dbg !1001
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1002
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1003
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1003
  %div = udiv i32 %mul, %3, !dbg !1003, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1004
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1005
  %conv2 = zext i16 %4 to i32, !dbg !1005
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1007
  %conv3 = zext i16 %5 to i32, !dbg !1007
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1008
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1009
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1010
  %mul5 = mul i32 %6, %7, !dbg !1011
  %sub = sub i32 %mul4, %mul5, !dbg !1012
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1013
  %div6 = udiv i32 %8, 2, !dbg !1014
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1015
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1016

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1017
  %inc = add i32 %9, 1, !dbg !1017
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1017
  br label %if.end, !dbg !1019

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1020
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1022
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1023

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1024
  %and = and i32 %11, 65535, !dbg !1026
  %conv13 = trunc i32 %and to i16, !dbg !1027
  store i16 %conv13, i16* %retval, align 2, !dbg !1028
  br label %return, !dbg !1028

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1029
  br label %return, !dbg !1029

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1031
  ret i16 %12, !dbg !1031
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1032 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1035, metadata !DIExpression()), !dbg !1036
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1037, metadata !DIExpression()), !dbg !1038
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1039, metadata !DIExpression()), !dbg !1040
  store i32 0, i32* %u32Temp1, align 4, !dbg !1040
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1041
  %conv = zext i16 %0 to i32, !dbg !1041
  %cmp = icmp eq i32 %conv, 0, !dbg !1043
  br i1 %cmp, label %if.then, label %if.else, !dbg !1044

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1045
  br label %return, !dbg !1045

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1047
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1049
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1050
  %conv2 = zext i16 %3 to i32, !dbg !1050
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1051
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1051
  %div = udiv i32 %2, %conv2, !dbg !1051, !klee.check.div !106
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1052
  %conv3 = zext i16 %4 to i32, !dbg !1052
  %mul = mul i32 %div, %conv3, !dbg !1053
  %sub = sub i32 %1, %mul, !dbg !1054
  %shl = shl i32 %sub, 1, !dbg !1055
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1056
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1057
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1058
  %conv4 = zext i16 %6 to i32, !dbg !1058
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1059
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1059
  %div5 = udiv i32 %5, %conv4, !dbg !1059, !klee.check.div !106
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1060
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1061
  %conv6 = zext i16 %8 to i32, !dbg !1061
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1062
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1062
  %div7 = udiv i32 %7, %conv6, !dbg !1062, !klee.check.div !106
  %add = add i32 %div5, %div7, !dbg !1063
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1064
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1065
  store i32 %9, i32* %retval, align 4, !dbg !1066
  br label %return, !dbg !1066

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1067
  ret i32 %10, !dbg !1067
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1068 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1071, metadata !DIExpression()), !dbg !1072
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1073, metadata !DIExpression()), !dbg !1074
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1075, metadata !DIExpression()), !dbg !1076
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1077, metadata !DIExpression()), !dbg !1078
  store i32 0, i32* %s32Temp1, align 4, !dbg !1078
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1079, metadata !DIExpression()), !dbg !1080
  store i32 0, i32* %s32Temp2, align 4, !dbg !1080
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1081, metadata !DIExpression()), !dbg !1082
  store i32 0, i32* %s32Temp3, align 4, !dbg !1082
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1083
  %conv = sext i16 %0 to i32, !dbg !1083
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1084
  %conv1 = sext i16 %1 to i32, !dbg !1084
  %mul = mul nsw i32 %conv, %conv1, !dbg !1085
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1086
  %2 = load i16, i16* %div.addr, align 2, !dbg !1087
  %conv2 = sext i16 %2 to i32, !dbg !1087
  %cmp = icmp eq i32 %conv2, 0, !dbg !1089
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1090

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1091
  %cmp4 = icmp slt i32 %3, 0, !dbg !1094
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1095

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1096
  br label %return, !dbg !1096

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1098
  br label %return, !dbg !1098

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1100
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1102
  %6 = load i16, i16* %div.addr, align 2, !dbg !1103
  %conv8 = sext i16 %6 to i32, !dbg !1103
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1104
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1104
  %div9 = sdiv i32 %5, %conv8, !dbg !1104, !klee.check.div !106
  %7 = load i16, i16* %div.addr, align 2, !dbg !1105
  %conv10 = sext i16 %7 to i32, !dbg !1105
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1106
  %sub = sub nsw i32 %4, %mul11, !dbg !1107
  %shl = shl i32 %sub, 1, !dbg !1108
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1109
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1110
  %9 = load i16, i16* %div.addr, align 2, !dbg !1111
  %conv12 = sext i16 %9 to i32, !dbg !1111
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1112
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1112
  %div13 = sdiv i32 %8, %conv12, !dbg !1112, !klee.check.div !106
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1113
  %11 = load i16, i16* %div.addr, align 2, !dbg !1114
  %conv14 = sext i16 %11 to i32, !dbg !1114
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1115
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1115
  %div15 = sdiv i32 %10, %conv14, !dbg !1115, !klee.check.div !106
  %add = add nsw i32 %div13, %div15, !dbg !1116
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1117
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1118
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1120
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1121

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1122
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1125
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1126

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1127
  %conv22 = trunc i32 %14 to i16, !dbg !1129
  store i16 %conv22, i16* %retval, align 2, !dbg !1130
  br label %return, !dbg !1130

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1131
  br label %return, !dbg !1131

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1133
  br label %return, !dbg !1133

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1135
  ret i16 %15, !dbg !1135
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1136 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1139, metadata !DIExpression()), !dbg !1140
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1141, metadata !DIExpression()), !dbg !1142
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1143, metadata !DIExpression()), !dbg !1144
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1145, metadata !DIExpression()), !dbg !1146
  store i32 0, i32* %s32Result, align 4, !dbg !1146
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1147, metadata !DIExpression()), !dbg !1148
  store i32 0, i32* %s32Temp1, align 4, !dbg !1148
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1149
  %conv = sext i16 %0 to i32, !dbg !1149
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1150
  %conv1 = sext i16 %1 to i32, !dbg !1150
  %mul = mul nsw i32 %conv, %conv1, !dbg !1151
  store i32 %mul, i32* %s32Result, align 4, !dbg !1152
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1153
  %conv2 = zext i16 %2 to i32, !dbg !1153
  %cmp = icmp eq i32 %conv2, 0, !dbg !1155
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1156

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1157
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1160
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1161

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1162
  br label %return, !dbg !1162

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1164
  %cmp7 = icmp eq i32 %4, 0, !dbg !1166
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1167

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1168
  br label %return, !dbg !1168

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1170
  br label %return, !dbg !1170

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1172
  %6 = load i32, i32* %s32Result, align 4, !dbg !1174
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1175
  %conv12 = zext i16 %7 to i32, !dbg !1175
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1176
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1176
  %div = sdiv i32 %6, %conv12, !dbg !1176, !klee.check.div !106
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1177
  %conv13 = zext i16 %8 to i32, !dbg !1177
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1178
  %sub = sub nsw i32 %5, %mul14, !dbg !1179
  %shl = shl i32 %sub, 1, !dbg !1180
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1181
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1182
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1183
  %conv15 = zext i16 %10 to i32, !dbg !1183
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1184
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1184
  %div16 = sdiv i32 %9, %conv15, !dbg !1184, !klee.check.div !106
  %11 = load i32, i32* %s32Result, align 4, !dbg !1185
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1186
  %conv17 = zext i16 %12 to i32, !dbg !1186
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1187
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1187
  %div18 = sdiv i32 %11, %conv17, !dbg !1187, !klee.check.div !106
  %add = add nsw i32 %div16, %div18, !dbg !1188
  store i32 %add, i32* %s32Result, align 4, !dbg !1189
  %13 = load i32, i32* %s32Result, align 4, !dbg !1190
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1192
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1193

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1194
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1197
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1198

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1199
  %conv25 = trunc i32 %15 to i16, !dbg !1201
  store i16 %conv25, i16* %retval, align 2, !dbg !1202
  br label %return, !dbg !1202

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1203
  br label %return, !dbg !1203

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1205
  br label %return, !dbg !1205

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1207
  ret i16 %16, !dbg !1207
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1208 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1211, metadata !DIExpression()), !dbg !1212
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1213, metadata !DIExpression()), !dbg !1214
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1215, metadata !DIExpression()), !dbg !1216
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1217
  %cmp = icmp eq i32 %0, 0, !dbg !1219
  br i1 %cmp, label %if.then, label %if.else, !dbg !1220

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1221
  br label %return, !dbg !1221

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1223
  %cmp1 = icmp sle i32 %1, 0, !dbg !1226
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1227

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1228
  br label %return, !dbg !1228

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1230
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1232
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1233
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1234
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1234
  %div = udiv i32 %3, %4, !dbg !1234, !klee.check.div !106
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1235
  %mul = mul i32 %div, %5, !dbg !1236
  %sub = sub i32 %2, %mul, !dbg !1237
  %shl = shl i32 %sub, 1, !dbg !1238
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1239
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1240
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1241
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1242
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1242
  %div4 = udiv i32 %6, %7, !dbg !1242, !klee.check.div !106
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1243
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1244
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1245
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1245
  %div5 = udiv i32 %8, %9, !dbg !1245, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1246
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1247
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1248
  store i32 %10, i32* %retval, align 4, !dbg !1249
  br label %return, !dbg !1249

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1250
  ret i32 %11, !dbg !1250
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1251 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1254, metadata !DIExpression()), !dbg !1255
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1256, metadata !DIExpression()), !dbg !1257
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1258, metadata !DIExpression()), !dbg !1259
  store i32 0, i32* %s32Temp1, align 4, !dbg !1259
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1260
  %cmp = icmp eq i32 %0, 0, !dbg !1262
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1263

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1264
  %cmp1 = icmp sge i32 %1, 0, !dbg !1267
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1268

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1269
  br label %return, !dbg !1269

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1271
  br label %return, !dbg !1271

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1273
  %cmp4 = icmp sge i32 %2, 0, !dbg !1276
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1277

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1278
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1280
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1281
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1282
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1282
  %div = udiv i32 %4, %5, !dbg !1282, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1283
  %mul = mul i32 %div, %6, !dbg !1284
  %sub = sub i32 %3, %mul, !dbg !1285
  %shl = shl i32 %sub, 1, !dbg !1286
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1287
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1288
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1289
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1290
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1290
  %div6 = udiv i32 %7, %8, !dbg !1290, !klee.check.div !106
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1291
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1292
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1293
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1293
  %div7 = udiv i32 %9, %10, !dbg !1293, !klee.check.div !106
  %add = add i32 %div6, %div7, !dbg !1294
  store i32 %add, i32* %retval, align 4, !dbg !1295
  br label %return, !dbg !1295

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1296
  br label %return, !dbg !1296

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1298
  ret i32 %11, !dbg !1298
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1299 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1302, metadata !DIExpression()), !dbg !1303
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1304, metadata !DIExpression()), !dbg !1305
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1306, metadata !DIExpression()), !dbg !1307
  store i32 0, i32* %u32Temp1, align 4, !dbg !1307
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1308, metadata !DIExpression()), !dbg !1309
  store i32 0, i32* %u32Temp2, align 4, !dbg !1309
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1310
  %cmp = icmp eq i32 %0, 0, !dbg !1312
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1313

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1314
  %cmp1 = icmp slt i32 %1, 0, !dbg !1317
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1318

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1319
  br label %return, !dbg !1319

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1321
  br label %return, !dbg !1321

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1323
  %cmp4 = icmp sge i32 %2, 0, !dbg !1326
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1327

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1328
  %cmp6 = icmp eq i32 %3, 0, !dbg !1331
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1332

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1333
  br label %return, !dbg !1333

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1335
  %cmp9 = icmp sle i32 %4, 0, !dbg !1338
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1339

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1340
  br label %return, !dbg !1340

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1342
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1344
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1345
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1346
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1346
  %div = sdiv i32 %6, %7, !dbg !1346, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1347
  %mul = mul nsw i32 %div, %8, !dbg !1348
  %sub = sub nsw i32 %5, %mul, !dbg !1349
  %shl = shl i32 %sub, 1, !dbg !1350
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1351
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1352
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1353
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1354
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1354
  %div12 = udiv i32 %9, %10, !dbg !1354, !klee.check.div !106
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1355
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1356
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1357
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1357
  %div13 = sdiv i32 %11, %12, !dbg !1357, !klee.check.div !106
  %add = add i32 %div12, %div13, !dbg !1358
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1359
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1360
  store i32 %13, i32* %retval, align 4, !dbg !1361
  br label %return, !dbg !1361

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1362
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1365
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1366

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1367
  br label %return, !dbg !1367

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1369
  %sub18 = sub nsw i32 0, %15, !dbg !1371
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1372
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1373
  %sub19 = sub nsw i32 0, %16, !dbg !1374
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1375
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1376
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1377
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1378
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1379
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1379
  %div20 = sdiv i32 %18, %19, !dbg !1379, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1380
  %mul21 = mul nsw i32 %div20, %20, !dbg !1381
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1382
  %shl23 = shl i32 %sub22, 1, !dbg !1383
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1384
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1385
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1386
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1387
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1387
  %div24 = udiv i32 %21, %22, !dbg !1387, !klee.check.div !106
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1388
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1389
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1390
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1390
  %div25 = sdiv i32 %23, %24, !dbg !1390, !klee.check.div !106
  %add26 = add i32 %div24, %div25, !dbg !1391
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1392
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1393
  store i32 %25, i32* %retval, align 4, !dbg !1394
  br label %return, !dbg !1394

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1395
  ret i32 %26, !dbg !1395
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1396 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1399, metadata !DIExpression()), !dbg !1400
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1401, metadata !DIExpression()), !dbg !1402
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1403, metadata !DIExpression()), !dbg !1404
  store i32 0, i32* %u32Temp1, align 4, !dbg !1404
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1405, metadata !DIExpression()), !dbg !1406
  store i32 0, i32* %u32Temp2, align 4, !dbg !1406
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1407, metadata !DIExpression()), !dbg !1408
  store i32 0, i32* %u32Temp3, align 4, !dbg !1408
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1409, metadata !DIExpression()), !dbg !1410
  store i32 0, i32* %numerator_old, align 4, !dbg !1410
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1411
  %cmp = icmp eq i32 %0, 0, !dbg !1413
  br i1 %cmp, label %if.then, label %if.else, !dbg !1414

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1415
  br label %return, !dbg !1415

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1417
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1419
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1420
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1421
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1422
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1422
  %div = udiv i32 %3, %4, !dbg !1422, !klee.check.div !106
  %mul = mul i32 %2, %div, !dbg !1423
  %sub = sub i32 %1, %mul, !dbg !1424
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1425
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1426
  %and = and i32 %5, 1, !dbg !1428
  %cmp1 = icmp eq i32 %and, 0, !dbg !1429
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1430

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1431
  %shr = lshr i32 %6, 1, !dbg !1433
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1434
  br label %if.end, !dbg !1435

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1436
  %shr4 = lshr i32 %7, 1, !dbg !1438
  %add = add i32 %shr4, 1, !dbg !1439
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1440
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1441
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1443
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1444
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1445

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1446
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1448
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1449
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1449
  %div7 = udiv i32 %10, %11, !dbg !1449, !klee.check.div !106
  store i32 %div7, i32* %retval, align 4, !dbg !1450
  br label %return, !dbg !1450

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1451
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1453
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1454
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1454
  %div9 = udiv i32 %12, %13, !dbg !1454, !klee.check.div !106
  %add10 = add i32 %div9, 1, !dbg !1455
  store i32 %add10, i32* %retval, align 4, !dbg !1456
  br label %return, !dbg !1456

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1457
  ret i32 %14, !dbg !1457
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1458 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1461, metadata !DIExpression()), !dbg !1462
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1463, metadata !DIExpression()), !dbg !1464
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1465, metadata !DIExpression()), !dbg !1466
  store i32 0, i32* %u32Temp1, align 4, !dbg !1466
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1467, metadata !DIExpression()), !dbg !1468
  store i32 0, i32* %u32Temp2, align 4, !dbg !1468
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1469
  %cmp = icmp sle i32 %0, 0, !dbg !1471
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1472

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1473
  %cmp1 = icmp sge i32 %1, 0, !dbg !1476
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1477

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1478
  br label %return, !dbg !1478

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1480
  %sub = sub nsw i32 0, %2, !dbg !1482
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1483
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1484
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1485
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1486
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1487
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1487
  %div = udiv i32 %4, %5, !dbg !1487, !klee.check.div !106
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1488
  %mul = mul i32 %div, %6, !dbg !1489
  %sub3 = sub i32 %3, %mul, !dbg !1490
  %shl = shl i32 %sub3, 1, !dbg !1491
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1492
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1493
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1494
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1495
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1495
  %div4 = udiv i32 %7, %8, !dbg !1495, !klee.check.div !106
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1496
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1497
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1498
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1498
  %div5 = udiv i32 %9, %10, !dbg !1498, !klee.check.div !106
  %add = add i32 %div4, %div5, !dbg !1499
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1500
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1501
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1503
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1504

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1505
  %sub8 = sub i32 0, %12, !dbg !1507
  store i32 %sub8, i32* %retval, align 4, !dbg !1508
  br label %return, !dbg !1508

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1509
  br label %return, !dbg !1509

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1511
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1513
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1514
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1515
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1515
  %div11 = udiv i32 %14, %15, !dbg !1515, !klee.check.div !106
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1516
  %mul12 = mul i32 %div11, %16, !dbg !1517
  %sub13 = sub i32 %13, %mul12, !dbg !1518
  %shl14 = shl i32 %sub13, 1, !dbg !1519
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1520
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1521
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1522
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1523
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1523
  %div15 = udiv i32 %17, %18, !dbg !1523, !klee.check.div !106
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1524
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1525
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1526
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1526
  %div16 = udiv i32 %19, %20, !dbg !1526, !klee.check.div !106
  %add17 = add i32 %div15, %div16, !dbg !1527
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1528
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1529
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1531
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1532

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1533
  store i32 %22, i32* %retval, align 4, !dbg !1535
  br label %return, !dbg !1535

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1536
  br label %return, !dbg !1536

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1538
  ret i32 %23, !dbg !1538
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1539 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1542, metadata !DIExpression()), !dbg !1543
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1544, metadata !DIExpression()), !dbg !1545
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1546, metadata !DIExpression()), !dbg !1547
  store i32 0, i32* %s32Temp1, align 4, !dbg !1547
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1548, metadata !DIExpression()), !dbg !1549
  store i32 0, i32* %s32Temp2, align 4, !dbg !1549
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1550, metadata !DIExpression()), !dbg !1551
  store i32 0, i32* %u32Temp0, align 4, !dbg !1551
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1552, metadata !DIExpression()), !dbg !1553
  store i32 0, i32* %u32Temp1, align 4, !dbg !1553
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1554, metadata !DIExpression()), !dbg !1555
  store i32 0, i32* %u32Temp2, align 4, !dbg !1555
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1556
  %cmp = icmp eq i32 %0, 0, !dbg !1558
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1559

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1560
  %cmp1 = icmp slt i32 %1, 0, !dbg !1563
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1564

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1565
  br label %return, !dbg !1565

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1567
  br label %return, !dbg !1567

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1569
  %cmp4 = icmp sle i32 %2, 0, !dbg !1572
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1573

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1574
  %sub = sub nsw i32 0, %3, !dbg !1576
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1577
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1578
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1579
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1580
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1580
  %div = udiv i32 %4, %5, !dbg !1580, !klee.check.div !106
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1581
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1582
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1583
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1584
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1585
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1585
  %div6 = udiv i32 %7, %8, !dbg !1585, !klee.check.div !106
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1586
  %mul = mul i32 %div6, %9, !dbg !1587
  %sub7 = sub i32 %6, %mul, !dbg !1588
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1589
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1590
  %and = and i32 %10, 1, !dbg !1592
  %cmp8 = icmp eq i32 %and, 0, !dbg !1593
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1594

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1595
  %shr = lshr i32 %11, 1, !dbg !1597
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1598
  br label %if.end, !dbg !1599

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1600
  %shr11 = lshr i32 %12, 1, !dbg !1602
  %add = add i32 %shr11, 1, !dbg !1603
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1604
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1605
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1607
  %cmp12 = icmp ult i32 %13, %14, !dbg !1608
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1609

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1610
  %neg = xor i32 %15, -1, !dbg !1612
  %add14 = add i32 %neg, 1, !dbg !1613
  store i32 %add14, i32* %retval, align 4, !dbg !1614
  br label %return, !dbg !1614

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1615
  %add16 = add i32 %16, 1, !dbg !1617
  %neg17 = xor i32 %add16, -1, !dbg !1618
  %add18 = add i32 %neg17, 1, !dbg !1619
  store i32 %add18, i32* %retval, align 4, !dbg !1620
  br label %return, !dbg !1620

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1621
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1623
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1624
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1625
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1625
  %div20 = udiv i32 %18, %19, !dbg !1625, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1626
  %mul21 = mul i32 %div20, %20, !dbg !1627
  %sub22 = sub i32 %17, %mul21, !dbg !1628
  %shl = shl i32 %sub22, 1, !dbg !1629
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1630
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1631
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1632
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1633
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1633
  %div23 = udiv i32 %21, %22, !dbg !1633, !klee.check.div !106
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1634
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1635
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1636
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1636
  %div24 = udiv i32 %23, %24, !dbg !1636, !klee.check.div !106
  %add25 = add i32 %div23, %div24, !dbg !1637
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1638
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1639
  store i32 %25, i32* %retval, align 4, !dbg !1640
  br label %return, !dbg !1640

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1641
  ret i32 %26, !dbg !1641
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1642 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1645, metadata !DIExpression()), !dbg !1646
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1647, metadata !DIExpression()), !dbg !1648
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1649, metadata !DIExpression()), !dbg !1650
  store i32 0, i32* %s32Temp1, align 4, !dbg !1650
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1651, metadata !DIExpression()), !dbg !1652
  store i32 0, i32* %s32Temp2, align 4, !dbg !1652
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1653, metadata !DIExpression()), !dbg !1654
  store i32 0, i32* %denominator_prime, align 4, !dbg !1654
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1655, metadata !DIExpression()), !dbg !1656
  store i32 0, i32* %u32Temp1, align 4, !dbg !1656
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1657, metadata !DIExpression()), !dbg !1658
  store i32 0, i32* %u32Temp2, align 4, !dbg !1658
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1659, metadata !DIExpression()), !dbg !1660
  store i32 0, i32* %u32numerator, align 4, !dbg !1660
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1661, metadata !DIExpression()), !dbg !1662
  store i32 0, i32* %u32denominator, align 4, !dbg !1662
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1663
  %cmp = icmp slt i32 %0, 0, !dbg !1665
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1666

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1667
  %cmp1 = icmp sle i32 %1, 0, !dbg !1670
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1671

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1672
  %cmp3 = icmp sge i32 %2, 0, !dbg !1675
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1676

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1677
  br label %return, !dbg !1677

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1679
  %sub = sub nsw i32 0, %3, !dbg !1681
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1682
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1683
  %sub5 = sub nsw i32 0, %4, !dbg !1684
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1685
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1686
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1687
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1688
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1689
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1689
  %div = udiv i32 %6, %7, !dbg !1689, !klee.check.div !106
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1690
  %mul = mul i32 %div, %8, !dbg !1691
  %sub6 = sub i32 %5, %mul, !dbg !1692
  %shl = shl i32 %sub6, 1, !dbg !1693
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1694
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1695
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1696
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1697
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1697
  %div7 = udiv i32 %9, %10, !dbg !1697, !klee.check.div !106
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1698
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1699
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1700
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1700
  %div8 = udiv i32 %11, %12, !dbg !1700, !klee.check.div !106
  %add = add i32 %div7, %div8, !dbg !1701
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1702
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1703
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1705
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1706

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1707
  store i32 %14, i32* %retval, align 4, !dbg !1709
  br label %return, !dbg !1709

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1710
  br label %return, !dbg !1710

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1712
  %neg = xor i32 %15, -1, !dbg !1714
  %add13 = add nsw i32 %neg, 1, !dbg !1715
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1716
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1717
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1718
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1719
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1720
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1720
  %div14 = udiv i32 %17, %18, !dbg !1720, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1721
  %mul15 = mul i32 %div14, %19, !dbg !1722
  %sub16 = sub i32 %16, %mul15, !dbg !1723
  %shl17 = shl i32 %sub16, 1, !dbg !1724
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1725
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1726
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1727
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1728
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1728
  %div18 = udiv i32 %20, %21, !dbg !1728, !klee.check.div !106
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1729
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1730
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1731
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1731
  %div19 = sdiv i32 %22, %23, !dbg !1731, !klee.check.div !106
  %add20 = add i32 %div18, %div19, !dbg !1732
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1733
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1734
  %neg21 = xor i32 %24, -1, !dbg !1735
  %add22 = add nsw i32 %neg21, 1, !dbg !1736
  store i32 %add22, i32* %retval, align 4, !dbg !1737
  br label %return, !dbg !1737

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1738
  %cmp24 = icmp sle i32 %25, 0, !dbg !1741
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1742

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1743
  %cmp26 = icmp sge i32 %26, 0, !dbg !1746
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1747

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1748
  br label %return, !dbg !1748

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1750
  %neg29 = xor i32 %27, -1, !dbg !1752
  %add30 = add nsw i32 %neg29, 1, !dbg !1753
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1754
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1755
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1756
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1757
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1758
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1758
  %div31 = udiv i32 %29, %30, !dbg !1758, !klee.check.div !106
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1759
  %mul32 = mul i32 %div31, %31, !dbg !1760
  %sub33 = sub i32 %28, %mul32, !dbg !1761
  %shl34 = shl i32 %sub33, 1, !dbg !1762
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1763
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1764
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1765
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1766
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1766
  %div35 = udiv i32 %32, %33, !dbg !1766, !klee.check.div !106
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1767
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1768
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1769
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1769
  %div36 = udiv i32 %34, %35, !dbg !1769, !klee.check.div !106
  %add37 = add i32 %div35, %div36, !dbg !1770
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1771
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1772
  %neg38 = xor i32 %36, -1, !dbg !1773
  %add39 = add nsw i32 %neg38, 1, !dbg !1774
  store i32 %add39, i32* %retval, align 4, !dbg !1775
  br label %return, !dbg !1775

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1776
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1778
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1779
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1780
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1780
  %div41 = sdiv i32 %38, %39, !dbg !1780, !klee.check.div !106
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1781
  %mul42 = mul nsw i32 %div41, %40, !dbg !1782
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1783
  %shl44 = shl i32 %sub43, 1, !dbg !1784
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1785
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1786
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1787
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1788
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1788
  %div45 = sdiv i32 %41, %42, !dbg !1788, !klee.check.div !106
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1789
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1790
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1791
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1791
  %div46 = udiv i32 %43, %44, !dbg !1791, !klee.check.div !106
  %add47 = add i32 %div45, %div46, !dbg !1792
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1793
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1794
  store i32 %45, i32* %retval, align 4, !dbg !1795
  br label %return, !dbg !1795

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1796
  ret i32 %46, !dbg !1796
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1797 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1800, metadata !DIExpression()), !dbg !1801
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1802, metadata !DIExpression()), !dbg !1803
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1804, metadata !DIExpression()), !dbg !1805
  store i32 0, i32* %numerator_prime, align 4, !dbg !1805
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1806, metadata !DIExpression()), !dbg !1807
  store i32 0, i32* %u32Temp1, align 4, !dbg !1807
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1808, metadata !DIExpression()), !dbg !1809
  store i32 0, i32* %u32Temp2, align 4, !dbg !1809
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1810, metadata !DIExpression()), !dbg !1811
  store i32 0, i32* %u32Temp3, align 4, !dbg !1811
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1812, metadata !DIExpression()), !dbg !1813
  store i32 0, i32* %s32Temp1, align 4, !dbg !1813
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1814, metadata !DIExpression()), !dbg !1815
  store i32 0, i32* %s32Temp2, align 4, !dbg !1815
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1816, metadata !DIExpression()), !dbg !1817
  store i32 0, i32* %s32Temp3, align 4, !dbg !1817
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1818
  %cmp = icmp eq i32 %0, 0, !dbg !1820
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1821

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1822
  %cmp1 = icmp slt i32 %1, 0, !dbg !1825
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1826

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1827
  br label %return, !dbg !1827

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1829
  br label %return, !dbg !1829

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1831
  %cmp4 = icmp slt i32 %2, 0, !dbg !1834
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1835

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1836
  %sub = sub nsw i32 0, %3, !dbg !1838
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1839
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1840
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1841
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1842
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1842
  %div = udiv i32 %4, %5, !dbg !1842, !klee.check.div !106
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1843
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1844
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1845
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1846
  %mul = mul i32 %7, %8, !dbg !1847
  %sub6 = sub i32 %6, %mul, !dbg !1848
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1849
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1850
  %and = and i32 %9, 1, !dbg !1852
  %cmp7 = icmp eq i32 %and, 0, !dbg !1853
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1854

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1855
  %shr = lshr i32 %10, 1, !dbg !1857
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1858
  br label %if.end, !dbg !1859

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1860
  %shr10 = lshr i32 %11, 1, !dbg !1862
  %add = add i32 %shr10, 1, !dbg !1863
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1864
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1865
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1867
  %cmp11 = icmp ult i32 %12, %13, !dbg !1868
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1869

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1870
  %neg = xor i32 %14, -1, !dbg !1872
  %add13 = add i32 %neg, 1, !dbg !1873
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1874
  br label %if.end18, !dbg !1875

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1876
  %add15 = add i32 %15, 1, !dbg !1878
  %neg16 = xor i32 %add15, -1, !dbg !1879
  %add17 = add i32 %neg16, 1, !dbg !1880
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1881
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1882
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1884
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1885

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1886
  %conv = trunc i32 %17 to i16, !dbg !1888
  store i16 %conv, i16* %retval, align 2, !dbg !1889
  br label %return, !dbg !1889

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1890
  br label %return, !dbg !1890

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1892
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1894
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1895
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1895
  %div23 = udiv i32 %18, %19, !dbg !1895, !klee.check.div !106
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1896
  %mul24 = mul i32 %div23, %20, !dbg !1897
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1898
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1899
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1900
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1901
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1902
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1902
  %div25 = udiv i32 %22, %23, !dbg !1902, !klee.check.div !106
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1903
  %mul26 = mul i32 %div25, %24, !dbg !1904
  %sub27 = sub i32 %21, %mul26, !dbg !1905
  %shl = shl i32 %sub27, 1, !dbg !1906
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1907
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1908
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1909
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1910
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1910
  %div28 = udiv i32 %25, %26, !dbg !1910, !klee.check.div !106
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1911
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1912
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1913
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1913
  %div29 = udiv i32 %27, %28, !dbg !1913, !klee.check.div !106
  %add30 = add i32 %div28, %div29, !dbg !1914
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1915
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1916
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1918
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1919

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1920
  %conv34 = trunc i32 %30 to i16, !dbg !1922
  store i16 %conv34, i16* %retval, align 2, !dbg !1923
  br label %return, !dbg !1923

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1924
  br label %return, !dbg !1924

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1926
  ret i16 %31, !dbg !1926
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1927 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1933, metadata !DIExpression()), !dbg !1934
  %2 = icmp eq i64 %0, 0, !dbg !1935
  br i1 %2, label %3, label %4, !dbg !1937

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1938
  unreachable, !dbg !1938

4:                                                ; preds = %1
  ret void, !dbg !1939
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !1940 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1946, metadata !DIExpression()), !dbg !1948
  call void @llvm.dbg.value(metadata i64 %1, metadata !1947, metadata !DIExpression()), !dbg !1948
  %3 = icmp ult i64 %1, %0, !dbg !1949
  br i1 %3, label %5, label %4, !dbg !1951

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !1952
  unreachable, !dbg !1952

5:                                                ; preds = %2
  ret void, !dbg !1954
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!32, !2, !34, !36}
!llvm.ident = !{!38, !38, !39, !39}
!llvm.module.flags = !{!40, !41, !42, !43, !44}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !30, line: 21, type: !31, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !29, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0055/div_Ccode_alarm_0055.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0055")
!4 = !{}
!5 = !{!6, !13, !16, !17, !21, !25}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0055")
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
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !7, line: 6, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !18, line: 24, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 38, baseType: !24)
!24 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !7, line: 8, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !18, line: 25, baseType: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 40, baseType: !28)
!28 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!29 = !{!0}
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0055")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0055/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0055")
!34 = distinct !DICompileUnit(language: DW_LANG_C89, file: !35, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!36 = distinct !DICompileUnit(language: DW_LANG_C89, file: !37, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!37 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!38 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!39 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!40 = !{i32 7, !"Dwarf Version", i32 4}
!41 = !{i32 2, !"Debug Info Version", i32 3}
!42 = !{i32 1, !"wchar_size", i32 4}
!43 = !{i32 7, !"uwtable", i32 1}
!44 = !{i32 7, !"frame-pointer", i32 2}
!45 = distinct !DISubprogram(name: "main", scope: !46, file: !46, line: 7, type: !47, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !4)
!46 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0055")
!47 = !DISubroutineType(types: !48)
!48 = !{!16}
!49 = !DILocalVariable(name: "numerator", scope: !45, file: !46, line: 9, type: !8)
!50 = !DILocation(line: 9, column: 13, scope: !45)
!51 = !DILocalVariable(name: "denominator", scope: !45, file: !46, line: 10, type: !26)
!52 = !DILocation(line: 10, column: 14, scope: !45)
!53 = !DILocalVariable(name: "result", scope: !45, file: !46, line: 11, type: !8)
!54 = !DILocation(line: 11, column: 13, scope: !45)
!55 = !DILocation(line: 13, column: 24, scope: !45)
!56 = !DILocation(line: 13, column: 5, scope: !45)
!57 = !DILocation(line: 14, column: 24, scope: !45)
!58 = !DILocation(line: 14, column: 5, scope: !45)
!59 = !DILocation(line: 16, column: 36, scope: !45)
!60 = !DILocation(line: 16, column: 47, scope: !45)
!61 = !DILocation(line: 16, column: 14, scope: !45)
!62 = !DILocation(line: 16, column: 12, scope: !45)
!63 = !DILocation(line: 18, column: 11, scope: !45)
!64 = !DILocation(line: 19, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !66, file: !66, line: 170, type: !67, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0055")
!67 = !DISubroutineType(types: !68)
!68 = !{!6, !6, !6}
!69 = !DILocalVariable(name: "numerator", arg: 1, scope: !65, file: !66, line: 170, type: !6)
!70 = !DILocation(line: 170, column: 31, scope: !65)
!71 = !DILocalVariable(name: "denominator", arg: 2, scope: !65, file: !66, line: 170, type: !6)
!72 = !DILocation(line: 170, column: 47, scope: !65)
!73 = !DILocalVariable(name: "s32Temp1", scope: !65, file: !66, line: 172, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !75)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !76)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !16)
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
!301 = !{!6, !6, !25}
!302 = !DILocalVariable(name: "numerator", arg: 1, scope: !299, file: !66, line: 343, type: !6)
!303 = !DILocation(line: 343, column: 31, scope: !299)
!304 = !DILocalVariable(name: "denominator", arg: 2, scope: !299, file: !66, line: 343, type: !25)
!305 = !DILocation(line: 343, column: 47, scope: !299)
!306 = !DILocalVariable(name: "u16Temp1", scope: !299, file: !66, line: 345, type: !25)
!307 = !DILocation(line: 345, column: 6, scope: !299)
!308 = !DILocalVariable(name: "s32Temp1", scope: !299, file: !66, line: 346, type: !74)
!309 = !DILocation(line: 346, column: 6, scope: !299)
!310 = !DILocalVariable(name: "s32Temp2", scope: !299, file: !66, line: 346, type: !74)
!311 = !DILocation(line: 346, column: 15, scope: !299)
!312 = !DILocation(line: 347, column: 13, scope: !299)
!313 = !DILocation(line: 347, column: 25, scope: !299)
!314 = !DILocation(line: 347, column: 11, scope: !299)
!315 = !DILocation(line: 349, column: 61, scope: !316)
!316 = distinct !DILexicalBlock(scope: !299, file: !66, line: 349, column: 6)
!317 = !DILocation(line: 349, column: 56, scope: !316)
!318 = !DILocation(line: 349, column: 46, scope: !316)
!319 = !DILocation(line: 349, column: 8, scope: !316)
!320 = !DILocation(line: 349, column: 6, scope: !299)
!321 = !DILocation(line: 350, column: 6, scope: !322)
!322 = distinct !DILexicalBlock(scope: !316, file: !66, line: 349, column: 75)
!323 = !DILocation(line: 352, column: 13, scope: !299)
!324 = !DILocation(line: 352, column: 22, scope: !299)
!325 = !DILocation(line: 352, column: 11, scope: !299)
!326 = !DILocation(line: 353, column: 5, scope: !327)
!327 = distinct !DILexicalBlock(scope: !299, file: !66, line: 353, column: 5)
!328 = !DILocation(line: 353, column: 14, scope: !327)
!329 = !DILocation(line: 353, column: 5, scope: !299)
!330 = !DILocation(line: 355, column: 7, scope: !331)
!331 = distinct !DILexicalBlock(scope: !332, file: !66, line: 355, column: 7)
!332 = distinct !DILexicalBlock(scope: !327, file: !66, line: 354, column: 2)
!333 = !DILocation(line: 355, column: 17, scope: !331)
!334 = !DILocation(line: 355, column: 7, scope: !332)
!335 = !DILocation(line: 357, column: 4, scope: !336)
!336 = distinct !DILexicalBlock(scope: !331, file: !66, line: 356, column: 3)
!337 = !DILocation(line: 361, column: 4, scope: !338)
!338 = distinct !DILexicalBlock(scope: !331, file: !66, line: 360, column: 3)
!339 = !DILocation(line: 367, column: 61, scope: !340)
!340 = distinct !DILexicalBlock(scope: !341, file: !66, line: 367, column: 7)
!341 = distinct !DILexicalBlock(scope: !327, file: !66, line: 365, column: 2)
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
!354 = distinct !DILexicalBlock(scope: !340, file: !66, line: 367, column: 125)
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
!365 = !DILocation(line: 372, column: 47, scope: !366)
!366 = distinct !DILexicalBlock(scope: !341, file: !66, line: 372, column: 7)
!367 = !DILocation(line: 372, column: 37, scope: !366)
!368 = !DILocation(line: 372, column: 9, scope: !366)
!369 = !DILocation(line: 372, column: 7, scope: !341)
!370 = !DILocation(line: 373, column: 7, scope: !371)
!371 = distinct !DILexicalBlock(scope: !366, file: !66, line: 372, column: 75)
!372 = !DILocation(line: 376, column: 57, scope: !373)
!373 = distinct !DILexicalBlock(scope: !341, file: !66, line: 376, column: 7)
!374 = !DILocation(line: 376, column: 47, scope: !373)
!375 = !DILocation(line: 376, column: 9, scope: !373)
!376 = !DILocation(line: 376, column: 7, scope: !341)
!377 = !DILocation(line: 377, column: 7, scope: !378)
!378 = distinct !DILexicalBlock(scope: !373, file: !66, line: 376, column: 70)
!379 = !DILocation(line: 384, column: 35, scope: !341)
!380 = !DILocation(line: 384, column: 44, scope: !341)
!381 = !DILocation(line: 384, column: 25, scope: !341)
!382 = !DILocation(line: 384, column: 23, scope: !341)
!383 = !DILocation(line: 385, column: 3, scope: !341)
!384 = !DILocation(line: 404, column: 1, scope: !299)
!385 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !30, file: !30, line: 84, type: !386, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!386 = !DISubroutineType(types: !387)
!387 = !{!16, !13}
!388 = !DILocalVariable(name: "left", arg: 1, scope: !385, file: !30, line: 84, type: !13)
!389 = !DILocation(line: 84, column: 51, scope: !385)
!390 = !DILocation(line: 86, column: 12, scope: !385)
!391 = !DILocation(line: 86, column: 17, scope: !385)
!392 = !DILocation(line: 86, column: 5, scope: !385)
!393 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !30, file: !30, line: 78, type: !394, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!394 = !DISubroutineType(types: !395)
!395 = !{!16, !13, !13}
!396 = !DILocalVariable(name: "left", arg: 1, scope: !393, file: !30, line: 78, type: !13)
!397 = !DILocation(line: 78, column: 38, scope: !393)
!398 = !DILocalVariable(name: "right", arg: 2, scope: !393, file: !30, line: 78, type: !13)
!399 = !DILocation(line: 78, column: 52, scope: !393)
!400 = !DILocation(line: 80, column: 12, scope: !393)
!401 = !DILocation(line: 80, column: 19, scope: !393)
!402 = !DILocation(line: 80, column: 17, scope: !393)
!403 = !DILocation(line: 80, column: 25, scope: !393)
!404 = !DILocation(line: 80, column: 5, scope: !393)
!405 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !30, file: !30, line: 90, type: !406, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!406 = !DISubroutineType(types: !407)
!407 = !{!16, !13, !17}
!408 = !DILocalVariable(name: "left", arg: 1, scope: !405, file: !30, line: 90, type: !13)
!409 = !DILocation(line: 90, column: 41, scope: !405)
!410 = !DILocalVariable(name: "count", arg: 2, scope: !405, file: !30, line: 90, type: !17)
!411 = !DILocation(line: 90, column: 56, scope: !405)
!412 = !DILocation(line: 92, column: 9, scope: !413)
!413 = distinct !DILexicalBlock(scope: !405, file: !30, line: 92, column: 9)
!414 = !DILocation(line: 92, column: 15, scope: !413)
!415 = !DILocation(line: 92, column: 9, scope: !405)
!416 = !DILocation(line: 93, column: 9, scope: !417)
!417 = distinct !DILexicalBlock(scope: !413, file: !30, line: 92, column: 32)
!418 = !DILocation(line: 95, column: 12, scope: !405)
!419 = !DILocation(line: 95, column: 34, scope: !405)
!420 = !DILocation(line: 95, column: 31, scope: !405)
!421 = !DILocation(line: 95, column: 17, scope: !405)
!422 = !DILocation(line: 95, column: 41, scope: !405)
!423 = !DILocation(line: 95, column: 5, scope: !405)
!424 = !DILocation(line: 96, column: 1, scope: !405)
!425 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !66, file: !66, line: 421, type: !300, scopeLine: 422, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!426 = !DILocalVariable(name: "numerator", arg: 1, scope: !425, file: !66, line: 421, type: !6)
!427 = !DILocation(line: 421, column: 30, scope: !425)
!428 = !DILocalVariable(name: "denominator", arg: 2, scope: !425, file: !66, line: 421, type: !25)
!429 = !DILocation(line: 421, column: 45, scope: !425)
!430 = !DILocalVariable(name: "u16Temp1", scope: !425, file: !66, line: 423, type: !25)
!431 = !DILocation(line: 423, column: 6, scope: !425)
!432 = !DILocalVariable(name: "s32Temp1", scope: !425, file: !66, line: 424, type: !74)
!433 = !DILocation(line: 424, column: 6, scope: !425)
!434 = !DILocation(line: 425, column: 13, scope: !425)
!435 = !DILocation(line: 425, column: 25, scope: !425)
!436 = !DILocation(line: 425, column: 11, scope: !425)
!437 = !DILocation(line: 426, column: 5, scope: !438)
!438 = distinct !DILexicalBlock(scope: !425, file: !66, line: 426, column: 5)
!439 = !DILocation(line: 426, column: 13, scope: !438)
!440 = !DILocation(line: 426, column: 5, scope: !425)
!441 = !DILocation(line: 428, column: 6, scope: !442)
!442 = distinct !DILexicalBlock(scope: !443, file: !66, line: 428, column: 6)
!443 = distinct !DILexicalBlock(scope: !438, file: !66, line: 427, column: 2)
!444 = !DILocation(line: 428, column: 15, scope: !442)
!445 = !DILocation(line: 428, column: 6, scope: !443)
!446 = !DILocation(line: 430, column: 4, scope: !447)
!447 = distinct !DILexicalBlock(scope: !442, file: !66, line: 429, column: 3)
!448 = !DILocation(line: 434, column: 4, scope: !449)
!449 = distinct !DILexicalBlock(scope: !442, file: !66, line: 433, column: 3)
!450 = !DILocation(line: 440, column: 15, scope: !451)
!451 = distinct !DILexicalBlock(scope: !438, file: !66, line: 439, column: 2)
!452 = !DILocation(line: 440, column: 27, scope: !451)
!453 = !DILocation(line: 440, column: 37, scope: !451)
!454 = !DILocation(line: 440, column: 36, scope: !451)
!455 = !DILocation(line: 440, column: 49, scope: !451)
!456 = !DILocation(line: 440, column: 47, scope: !451)
!457 = !DILocation(line: 440, column: 25, scope: !451)
!458 = !DILocation(line: 440, column: 59, scope: !451)
!459 = !DILocation(line: 440, column: 12, scope: !451)
!460 = !DILocation(line: 441, column: 15, scope: !451)
!461 = !DILocation(line: 441, column: 24, scope: !451)
!462 = !DILocation(line: 441, column: 23, scope: !451)
!463 = !DILocation(line: 441, column: 37, scope: !451)
!464 = !DILocation(line: 441, column: 47, scope: !451)
!465 = !DILocation(line: 441, column: 46, scope: !451)
!466 = !DILocation(line: 441, column: 34, scope: !451)
!467 = !DILocation(line: 441, column: 12, scope: !451)
!468 = !DILocation(line: 442, column: 10, scope: !451)
!469 = !DILocation(line: 442, column: 3, scope: !451)
!470 = !DILocation(line: 444, column: 1, scope: !425)
!471 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !66, file: !66, line: 462, type: !472, scopeLine: 463, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!472 = !DISubroutineType(types: !473)
!473 = !{!21, !25, !25}
!474 = !DILocalVariable(name: "numerator", arg: 1, scope: !471, file: !66, line: 462, type: !25)
!475 = !DILocation(line: 462, column: 28, scope: !471)
!476 = !DILocalVariable(name: "denominator", arg: 2, scope: !471, file: !66, line: 462, type: !25)
!477 = !DILocation(line: 462, column: 43, scope: !471)
!478 = !DILocalVariable(name: "u32Temp1", scope: !471, file: !66, line: 464, type: !479)
!479 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !17)
!480 = !DILocation(line: 464, column: 6, scope: !471)
!481 = !DILocalVariable(name: "u32Temp2", scope: !471, file: !66, line: 464, type: !479)
!482 = !DILocation(line: 464, column: 20, scope: !471)
!483 = !DILocalVariable(name: "u32Temp3", scope: !471, file: !66, line: 464, type: !479)
!484 = !DILocation(line: 464, column: 33, scope: !471)
!485 = !DILocation(line: 465, column: 5, scope: !486)
!486 = distinct !DILexicalBlock(scope: !471, file: !66, line: 465, column: 5)
!487 = !DILocation(line: 465, column: 16, scope: !486)
!488 = !DILocation(line: 465, column: 5, scope: !471)
!489 = !DILocation(line: 467, column: 3, scope: !490)
!490 = distinct !DILexicalBlock(scope: !486, file: !66, line: 466, column: 2)
!491 = !DILocation(line: 471, column: 15, scope: !492)
!492 = distinct !DILexicalBlock(scope: !486, file: !66, line: 470, column: 2)
!493 = !DILocation(line: 471, column: 24, scope: !492)
!494 = !DILocation(line: 471, column: 12, scope: !492)
!495 = !DILocation(line: 472, column: 14, scope: !492)
!496 = !DILocation(line: 472, column: 25, scope: !492)
!497 = !DILocation(line: 472, column: 23, scope: !492)
!498 = !DILocation(line: 472, column: 12, scope: !492)
!499 = !DILocation(line: 473, column: 15, scope: !492)
!500 = !DILocation(line: 473, column: 24, scope: !492)
!501 = !DILocation(line: 473, column: 32, scope: !492)
!502 = !DILocation(line: 473, column: 12, scope: !492)
!503 = !DILocation(line: 474, column: 6, scope: !504)
!504 = distinct !DILexicalBlock(scope: !492, file: !66, line: 474, column: 6)
!505 = !DILocation(line: 474, column: 15, scope: !504)
!506 = !DILocation(line: 474, column: 6, scope: !492)
!507 = !DILocation(line: 476, column: 15, scope: !508)
!508 = distinct !DILexicalBlock(scope: !504, file: !66, line: 475, column: 3)
!509 = !DILocation(line: 476, column: 11, scope: !508)
!510 = !DILocation(line: 476, column: 4, scope: !508)
!511 = !DILocation(line: 480, column: 4, scope: !512)
!512 = distinct !DILexicalBlock(scope: !504, file: !66, line: 479, column: 3)
!513 = !DILocation(line: 483, column: 1, scope: !471)
!514 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !66, file: !66, line: 500, type: !515, scopeLine: 501, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!515 = !DISubroutineType(types: !516)
!516 = !{!25, !74, !25}
!517 = !DILocalVariable(name: "x_value", arg: 1, scope: !514, file: !66, line: 500, type: !74)
!518 = !DILocation(line: 500, column: 25, scope: !514)
!519 = !DILocalVariable(name: "y_value", arg: 2, scope: !514, file: !66, line: 500, type: !25)
!520 = !DILocation(line: 500, column: 38, scope: !514)
!521 = !DILocalVariable(name: "s32Temp1", scope: !514, file: !66, line: 502, type: !74)
!522 = !DILocation(line: 502, column: 6, scope: !514)
!523 = !DILocation(line: 503, column: 12, scope: !514)
!524 = !DILocation(line: 503, column: 20, scope: !514)
!525 = !DILocation(line: 503, column: 10, scope: !514)
!526 = !DILocation(line: 504, column: 6, scope: !527)
!527 = distinct !DILexicalBlock(scope: !514, file: !66, line: 504, column: 5)
!528 = !DILocation(line: 504, column: 14, scope: !527)
!529 = !DILocation(line: 504, column: 24, scope: !527)
!530 = !DILocation(line: 504, column: 5, scope: !514)
!531 = !DILocation(line: 506, column: 6, scope: !532)
!532 = distinct !DILexicalBlock(scope: !533, file: !66, line: 506, column: 6)
!533 = distinct !DILexicalBlock(scope: !527, file: !66, line: 505, column: 2)
!534 = !DILocation(line: 506, column: 14, scope: !532)
!535 = !DILocation(line: 506, column: 6, scope: !533)
!536 = !DILocation(line: 508, column: 4, scope: !537)
!537 = distinct !DILexicalBlock(scope: !532, file: !66, line: 507, column: 3)
!538 = !DILocation(line: 512, column: 4, scope: !539)
!539 = distinct !DILexicalBlock(scope: !532, file: !66, line: 511, column: 3)
!540 = !DILocation(line: 517, column: 15, scope: !541)
!541 = distinct !DILexicalBlock(scope: !527, file: !66, line: 516, column: 2)
!542 = !DILocation(line: 517, column: 27, scope: !541)
!543 = !DILocation(line: 517, column: 35, scope: !541)
!544 = !DILocation(line: 517, column: 34, scope: !541)
!545 = !DILocation(line: 517, column: 46, scope: !541)
!546 = !DILocation(line: 517, column: 44, scope: !541)
!547 = !DILocation(line: 517, column: 23, scope: !541)
!548 = !DILocation(line: 517, column: 56, scope: !541)
!549 = !DILocation(line: 517, column: 12, scope: !541)
!550 = !DILocation(line: 518, column: 15, scope: !541)
!551 = !DILocation(line: 518, column: 24, scope: !541)
!552 = !DILocation(line: 518, column: 23, scope: !541)
!553 = !DILocation(line: 518, column: 36, scope: !541)
!554 = !DILocation(line: 518, column: 44, scope: !541)
!555 = !DILocation(line: 518, column: 43, scope: !541)
!556 = !DILocation(line: 518, column: 33, scope: !541)
!557 = !DILocation(line: 518, column: 12, scope: !541)
!558 = !DILocation(line: 519, column: 6, scope: !559)
!559 = distinct !DILexicalBlock(scope: !541, file: !66, line: 519, column: 6)
!560 = !DILocation(line: 519, column: 15, scope: !559)
!561 = !DILocation(line: 519, column: 6, scope: !541)
!562 = !DILocation(line: 521, column: 7, scope: !563)
!563 = distinct !DILexicalBlock(scope: !564, file: !66, line: 521, column: 7)
!564 = distinct !DILexicalBlock(scope: !559, file: !66, line: 520, column: 3)
!565 = !DILocation(line: 521, column: 16, scope: !563)
!566 = !DILocation(line: 521, column: 7, scope: !564)
!567 = !DILocation(line: 523, column: 17, scope: !568)
!568 = distinct !DILexicalBlock(scope: !563, file: !66, line: 522, column: 4)
!569 = !DILocation(line: 523, column: 12, scope: !568)
!570 = !DILocation(line: 523, column: 5, scope: !568)
!571 = !DILocation(line: 527, column: 5, scope: !572)
!572 = distinct !DILexicalBlock(scope: !563, file: !66, line: 526, column: 4)
!573 = !DILocation(line: 532, column: 4, scope: !574)
!574 = distinct !DILexicalBlock(scope: !559, file: !66, line: 531, column: 3)
!575 = !DILocation(line: 535, column: 1, scope: !514)
!576 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !66, file: !66, line: 553, type: !577, scopeLine: 554, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!577 = !DISubroutineType(types: !578)
!578 = !{!25, !25, !25}
!579 = !DILocalVariable(name: "numerator", arg: 1, scope: !576, file: !66, line: 553, type: !25)
!580 = !DILocation(line: 553, column: 31, scope: !576)
!581 = !DILocalVariable(name: "denominator", arg: 2, scope: !576, file: !66, line: 553, type: !25)
!582 = !DILocation(line: 553, column: 46, scope: !576)
!583 = !DILocalVariable(name: "u32Temp", scope: !576, file: !66, line: 555, type: !479)
!584 = !DILocation(line: 555, column: 6, scope: !576)
!585 = !DILocation(line: 556, column: 5, scope: !586)
!586 = distinct !DILexicalBlock(scope: !576, file: !66, line: 556, column: 5)
!587 = !DILocation(line: 556, column: 17, scope: !586)
!588 = !DILocation(line: 556, column: 5, scope: !576)
!589 = !DILocation(line: 558, column: 3, scope: !590)
!590 = distinct !DILexicalBlock(scope: !586, file: !66, line: 557, column: 2)
!591 = !DILocation(line: 562, column: 14, scope: !592)
!592 = distinct !DILexicalBlock(scope: !586, file: !66, line: 561, column: 2)
!593 = !DILocation(line: 562, column: 23, scope: !592)
!594 = !DILocation(line: 562, column: 32, scope: !592)
!595 = !DILocation(line: 562, column: 44, scope: !592)
!596 = !DILocation(line: 562, column: 29, scope: !592)
!597 = !DILocation(line: 562, column: 11, scope: !592)
!598 = !DILocation(line: 563, column: 13, scope: !592)
!599 = !DILocation(line: 563, column: 21, scope: !592)
!600 = !DILocation(line: 563, column: 20, scope: !592)
!601 = !DILocation(line: 563, column: 11, scope: !592)
!602 = !DILocation(line: 564, column: 6, scope: !603)
!603 = distinct !DILexicalBlock(scope: !592, file: !66, line: 564, column: 6)
!604 = !DILocation(line: 564, column: 14, scope: !603)
!605 = !DILocation(line: 564, column: 6, scope: !592)
!606 = !DILocation(line: 566, column: 11, scope: !607)
!607 = distinct !DILexicalBlock(scope: !603, file: !66, line: 565, column: 3)
!608 = !DILocation(line: 566, column: 19, scope: !607)
!609 = !DILocation(line: 566, column: 4, scope: !607)
!610 = !DILocation(line: 570, column: 4, scope: !611)
!611 = distinct !DILexicalBlock(scope: !603, file: !66, line: 569, column: 3)
!612 = !DILocation(line: 574, column: 1, scope: !576)
!613 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !66, file: !66, line: 591, type: !614, scopeLine: 592, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!614 = !DISubroutineType(types: !615)
!615 = !{!25, !479, !25}
!616 = !DILocalVariable(name: "x_value", arg: 1, scope: !613, file: !66, line: 591, type: !479)
!617 = !DILocation(line: 591, column: 25, scope: !613)
!618 = !DILocalVariable(name: "y_value", arg: 2, scope: !613, file: !66, line: 591, type: !25)
!619 = !DILocation(line: 591, column: 38, scope: !613)
!620 = !DILocalVariable(name: "u32Temp1", scope: !613, file: !66, line: 593, type: !479)
!621 = !DILocation(line: 593, column: 6, scope: !613)
!622 = !DILocalVariable(name: "u32Temp2", scope: !613, file: !66, line: 593, type: !479)
!623 = !DILocation(line: 593, column: 17, scope: !613)
!624 = !DILocation(line: 594, column: 12, scope: !613)
!625 = !DILocation(line: 594, column: 20, scope: !613)
!626 = !DILocation(line: 594, column: 10, scope: !613)
!627 = !DILocation(line: 595, column: 5, scope: !628)
!628 = distinct !DILexicalBlock(scope: !613, file: !66, line: 595, column: 5)
!629 = !DILocation(line: 595, column: 13, scope: !628)
!630 = !DILocation(line: 595, column: 5, scope: !613)
!631 = !DILocation(line: 597, column: 3, scope: !632)
!632 = distinct !DILexicalBlock(scope: !628, file: !66, line: 596, column: 2)
!633 = !DILocation(line: 601, column: 14, scope: !634)
!634 = distinct !DILexicalBlock(scope: !628, file: !66, line: 600, column: 2)
!635 = !DILocation(line: 601, column: 22, scope: !634)
!636 = !DILocation(line: 601, column: 21, scope: !634)
!637 = !DILocation(line: 601, column: 12, scope: !634)
!638 = !DILocation(line: 602, column: 14, scope: !634)
!639 = !DILocation(line: 602, column: 25, scope: !634)
!640 = !DILocation(line: 602, column: 36, scope: !634)
!641 = !DILocation(line: 602, column: 34, scope: !634)
!642 = !DILocation(line: 602, column: 22, scope: !634)
!643 = !DILocation(line: 602, column: 45, scope: !634)
!644 = !DILocation(line: 602, column: 12, scope: !634)
!645 = !DILocation(line: 603, column: 15, scope: !634)
!646 = !DILocation(line: 603, column: 24, scope: !634)
!647 = !DILocation(line: 603, column: 23, scope: !634)
!648 = !DILocation(line: 603, column: 36, scope: !634)
!649 = !DILocation(line: 603, column: 44, scope: !634)
!650 = !DILocation(line: 603, column: 43, scope: !634)
!651 = !DILocation(line: 603, column: 33, scope: !634)
!652 = !DILocation(line: 603, column: 12, scope: !634)
!653 = !DILocation(line: 604, column: 6, scope: !654)
!654 = distinct !DILexicalBlock(scope: !634, file: !66, line: 604, column: 6)
!655 = !DILocation(line: 604, column: 15, scope: !654)
!656 = !DILocation(line: 604, column: 6, scope: !634)
!657 = !DILocation(line: 606, column: 11, scope: !658)
!658 = distinct !DILexicalBlock(scope: !654, file: !66, line: 605, column: 3)
!659 = !DILocation(line: 606, column: 20, scope: !658)
!660 = !DILocation(line: 606, column: 4, scope: !658)
!661 = !DILocation(line: 610, column: 4, scope: !662)
!662 = distinct !DILexicalBlock(scope: !654, file: !66, line: 609, column: 3)
!663 = !DILocation(line: 614, column: 1, scope: !613)
!664 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !66, file: !66, line: 633, type: !665, scopeLine: 634, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!665 = !DISubroutineType(types: !666)
!666 = !{!6, !6, !25, !6}
!667 = !DILocalVariable(name: "factor1", arg: 1, scope: !664, file: !66, line: 633, type: !6)
!668 = !DILocation(line: 633, column: 33, scope: !664)
!669 = !DILocalVariable(name: "factor2", arg: 2, scope: !664, file: !66, line: 633, type: !25)
!670 = !DILocation(line: 633, column: 46, scope: !664)
!671 = !DILocalVariable(name: "denominator", arg: 3, scope: !664, file: !66, line: 633, type: !6)
!672 = !DILocation(line: 633, column: 59, scope: !664)
!673 = !DILocalVariable(name: "s32Result", scope: !664, file: !66, line: 635, type: !74)
!674 = !DILocation(line: 635, column: 6, scope: !664)
!675 = !DILocalVariable(name: "s32Temp1", scope: !664, file: !66, line: 635, type: !74)
!676 = !DILocation(line: 635, column: 21, scope: !664)
!677 = !DILocation(line: 636, column: 14, scope: !664)
!678 = !DILocation(line: 636, column: 24, scope: !664)
!679 = !DILocation(line: 636, column: 22, scope: !664)
!680 = !DILocation(line: 636, column: 12, scope: !664)
!681 = !DILocation(line: 637, column: 5, scope: !682)
!682 = distinct !DILexicalBlock(scope: !664, file: !66, line: 637, column: 5)
!683 = !DILocation(line: 637, column: 17, scope: !682)
!684 = !DILocation(line: 637, column: 5, scope: !664)
!685 = !DILocation(line: 639, column: 6, scope: !686)
!686 = distinct !DILexicalBlock(scope: !687, file: !66, line: 639, column: 6)
!687 = distinct !DILexicalBlock(scope: !682, file: !66, line: 638, column: 2)
!688 = !DILocation(line: 639, column: 16, scope: !686)
!689 = !DILocation(line: 639, column: 6, scope: !687)
!690 = !DILocation(line: 641, column: 4, scope: !691)
!691 = distinct !DILexicalBlock(scope: !686, file: !66, line: 640, column: 3)
!692 = !DILocation(line: 645, column: 4, scope: !693)
!693 = distinct !DILexicalBlock(scope: !686, file: !66, line: 644, column: 3)
!694 = !DILocation(line: 650, column: 14, scope: !695)
!695 = distinct !DILexicalBlock(scope: !682, file: !66, line: 649, column: 2)
!696 = !DILocation(line: 650, column: 27, scope: !695)
!697 = !DILocation(line: 650, column: 37, scope: !695)
!698 = !DILocation(line: 650, column: 36, scope: !695)
!699 = !DILocation(line: 650, column: 50, scope: !695)
!700 = !DILocation(line: 650, column: 49, scope: !695)
!701 = !DILocation(line: 650, column: 24, scope: !695)
!702 = !DILocation(line: 650, column: 12, scope: !695)
!703 = !DILocation(line: 651, column: 14, scope: !695)
!704 = !DILocation(line: 651, column: 23, scope: !695)
!705 = !DILocation(line: 651, column: 12, scope: !695)
!706 = !DILocation(line: 652, column: 16, scope: !695)
!707 = !DILocation(line: 652, column: 25, scope: !695)
!708 = !DILocation(line: 652, column: 24, scope: !695)
!709 = !DILocation(line: 652, column: 41, scope: !695)
!710 = !DILocation(line: 652, column: 51, scope: !695)
!711 = !DILocation(line: 652, column: 50, scope: !695)
!712 = !DILocation(line: 652, column: 38, scope: !695)
!713 = !DILocation(line: 652, column: 13, scope: !695)
!714 = !DILocation(line: 653, column: 6, scope: !715)
!715 = distinct !DILexicalBlock(scope: !695, file: !66, line: 653, column: 6)
!716 = !DILocation(line: 653, column: 16, scope: !715)
!717 = !DILocation(line: 653, column: 6, scope: !695)
!718 = !DILocation(line: 655, column: 7, scope: !719)
!719 = distinct !DILexicalBlock(scope: !720, file: !66, line: 655, column: 7)
!720 = distinct !DILexicalBlock(scope: !715, file: !66, line: 654, column: 3)
!721 = !DILocation(line: 655, column: 17, scope: !719)
!722 = !DILocation(line: 655, column: 7, scope: !720)
!723 = !DILocation(line: 657, column: 17, scope: !724)
!724 = distinct !DILexicalBlock(scope: !719, file: !66, line: 656, column: 4)
!725 = !DILocation(line: 657, column: 12, scope: !724)
!726 = !DILocation(line: 657, column: 5, scope: !724)
!727 = !DILocation(line: 662, column: 5, scope: !728)
!728 = distinct !DILexicalBlock(scope: !719, file: !66, line: 661, column: 4)
!729 = !DILocation(line: 667, column: 4, scope: !730)
!730 = distinct !DILexicalBlock(scope: !715, file: !66, line: 666, column: 3)
!731 = !DILocation(line: 671, column: 1, scope: !664)
!732 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !66, file: !66, line: 689, type: !733, scopeLine: 690, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!733 = !DISubroutineType(types: !734)
!734 = !{!6, !25, !6, !25}
!735 = !DILocalVariable(name: "factor1", arg: 1, scope: !732, file: !66, line: 689, type: !25)
!736 = !DILocation(line: 689, column: 33, scope: !732)
!737 = !DILocalVariable(name: "factor2", arg: 2, scope: !732, file: !66, line: 689, type: !6)
!738 = !DILocation(line: 689, column: 46, scope: !732)
!739 = !DILocalVariable(name: "denominator", arg: 3, scope: !732, file: !66, line: 689, type: !25)
!740 = !DILocation(line: 689, column: 59, scope: !732)
!741 = !DILocalVariable(name: "s32Result", scope: !732, file: !66, line: 691, type: !74)
!742 = !DILocation(line: 691, column: 6, scope: !732)
!743 = !DILocalVariable(name: "s32Temp1", scope: !732, file: !66, line: 691, type: !74)
!744 = !DILocation(line: 691, column: 21, scope: !732)
!745 = !DILocation(line: 692, column: 14, scope: !732)
!746 = !DILocation(line: 692, column: 24, scope: !732)
!747 = !DILocation(line: 692, column: 22, scope: !732)
!748 = !DILocation(line: 692, column: 12, scope: !732)
!749 = !DILocation(line: 693, column: 5, scope: !750)
!750 = distinct !DILexicalBlock(scope: !732, file: !66, line: 693, column: 5)
!751 = !DILocation(line: 693, column: 16, scope: !750)
!752 = !DILocation(line: 693, column: 5, scope: !732)
!753 = !DILocation(line: 695, column: 6, scope: !754)
!754 = distinct !DILexicalBlock(scope: !755, file: !66, line: 695, column: 6)
!755 = distinct !DILexicalBlock(scope: !750, file: !66, line: 694, column: 2)
!756 = !DILocation(line: 695, column: 16, scope: !754)
!757 = !DILocation(line: 695, column: 6, scope: !755)
!758 = !DILocation(line: 697, column: 4, scope: !759)
!759 = distinct !DILexicalBlock(scope: !754, file: !66, line: 696, column: 3)
!760 = !DILocation(line: 701, column: 4, scope: !761)
!761 = distinct !DILexicalBlock(scope: !754, file: !66, line: 700, column: 3)
!762 = !DILocation(line: 706, column: 14, scope: !763)
!763 = distinct !DILexicalBlock(scope: !750, file: !66, line: 705, column: 2)
!764 = !DILocation(line: 706, column: 28, scope: !763)
!765 = !DILocation(line: 706, column: 38, scope: !763)
!766 = !DILocation(line: 706, column: 37, scope: !763)
!767 = !DILocation(line: 706, column: 53, scope: !763)
!768 = !DILocation(line: 706, column: 51, scope: !763)
!769 = !DILocation(line: 706, column: 24, scope: !763)
!770 = !DILocation(line: 706, column: 66, scope: !763)
!771 = !DILocation(line: 706, column: 12, scope: !763)
!772 = !DILocation(line: 707, column: 16, scope: !763)
!773 = !DILocation(line: 707, column: 25, scope: !763)
!774 = !DILocation(line: 707, column: 24, scope: !763)
!775 = !DILocation(line: 707, column: 41, scope: !763)
!776 = !DILocation(line: 707, column: 51, scope: !763)
!777 = !DILocation(line: 707, column: 50, scope: !763)
!778 = !DILocation(line: 707, column: 38, scope: !763)
!779 = !DILocation(line: 707, column: 13, scope: !763)
!780 = !DILocation(line: 708, column: 6, scope: !781)
!781 = distinct !DILexicalBlock(scope: !763, file: !66, line: 708, column: 6)
!782 = !DILocation(line: 708, column: 16, scope: !781)
!783 = !DILocation(line: 708, column: 6, scope: !763)
!784 = !DILocation(line: 710, column: 7, scope: !785)
!785 = distinct !DILexicalBlock(scope: !786, file: !66, line: 710, column: 7)
!786 = distinct !DILexicalBlock(scope: !781, file: !66, line: 709, column: 3)
!787 = !DILocation(line: 710, column: 17, scope: !785)
!788 = !DILocation(line: 710, column: 7, scope: !786)
!789 = !DILocation(line: 712, column: 17, scope: !790)
!790 = distinct !DILexicalBlock(scope: !785, file: !66, line: 711, column: 4)
!791 = !DILocation(line: 712, column: 12, scope: !790)
!792 = !DILocation(line: 712, column: 5, scope: !790)
!793 = !DILocation(line: 716, column: 5, scope: !794)
!794 = distinct !DILexicalBlock(scope: !785, file: !66, line: 715, column: 4)
!795 = !DILocation(line: 721, column: 4, scope: !796)
!796 = distinct !DILexicalBlock(scope: !781, file: !66, line: 720, column: 3)
!797 = !DILocation(line: 724, column: 1, scope: !732)
!798 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !66, file: !66, line: 743, type: !799, scopeLine: 744, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!799 = !DISubroutineType(types: !800)
!800 = !{!25, !6, !25, !6}
!801 = !DILocalVariable(name: "factor1", arg: 1, scope: !798, file: !66, line: 743, type: !6)
!802 = !DILocation(line: 743, column: 33, scope: !798)
!803 = !DILocalVariable(name: "factor2", arg: 2, scope: !798, file: !66, line: 743, type: !25)
!804 = !DILocation(line: 743, column: 46, scope: !798)
!805 = !DILocalVariable(name: "denominator", arg: 3, scope: !798, file: !66, line: 743, type: !6)
!806 = !DILocation(line: 743, column: 59, scope: !798)
!807 = !DILocalVariable(name: "u32Result", scope: !798, file: !66, line: 745, type: !479)
!808 = !DILocation(line: 745, column: 6, scope: !798)
!809 = !DILocalVariable(name: "u32Temp1", scope: !798, file: !66, line: 745, type: !479)
!810 = !DILocation(line: 745, column: 21, scope: !798)
!811 = !DILocalVariable(name: "s32Result", scope: !798, file: !66, line: 746, type: !74)
!812 = !DILocation(line: 746, column: 6, scope: !798)
!813 = !DILocalVariable(name: "s32Temp1", scope: !798, file: !66, line: 746, type: !74)
!814 = !DILocation(line: 746, column: 21, scope: !798)
!815 = !DILocation(line: 747, column: 14, scope: !798)
!816 = !DILocation(line: 747, column: 24, scope: !798)
!817 = !DILocation(line: 747, column: 22, scope: !798)
!818 = !DILocation(line: 747, column: 12, scope: !798)
!819 = !DILocation(line: 749, column: 5, scope: !820)
!820 = distinct !DILexicalBlock(scope: !798, file: !66, line: 749, column: 5)
!821 = !DILocation(line: 749, column: 17, scope: !820)
!822 = !DILocation(line: 749, column: 5, scope: !798)
!823 = !DILocation(line: 751, column: 6, scope: !824)
!824 = distinct !DILexicalBlock(scope: !825, file: !66, line: 751, column: 6)
!825 = distinct !DILexicalBlock(scope: !820, file: !66, line: 750, column: 2)
!826 = !DILocation(line: 751, column: 16, scope: !824)
!827 = !DILocation(line: 751, column: 6, scope: !825)
!828 = !DILocation(line: 753, column: 4, scope: !829)
!829 = distinct !DILexicalBlock(scope: !824, file: !66, line: 752, column: 3)
!830 = !DILocation(line: 757, column: 4, scope: !831)
!831 = distinct !DILexicalBlock(scope: !824, file: !66, line: 756, column: 3)
!832 = !DILocation(line: 762, column: 15, scope: !833)
!833 = distinct !DILexicalBlock(scope: !820, file: !66, line: 761, column: 2)
!834 = !DILocation(line: 762, column: 29, scope: !833)
!835 = !DILocation(line: 762, column: 39, scope: !833)
!836 = !DILocation(line: 762, column: 38, scope: !833)
!837 = !DILocation(line: 762, column: 54, scope: !833)
!838 = !DILocation(line: 762, column: 52, scope: !833)
!839 = !DILocation(line: 762, column: 25, scope: !833)
!840 = !DILocation(line: 762, column: 68, scope: !833)
!841 = !DILocation(line: 762, column: 12, scope: !833)
!842 = !DILocation(line: 763, column: 16, scope: !833)
!843 = !DILocation(line: 763, column: 25, scope: !833)
!844 = !DILocation(line: 763, column: 24, scope: !833)
!845 = !DILocation(line: 763, column: 41, scope: !833)
!846 = !DILocation(line: 763, column: 51, scope: !833)
!847 = !DILocation(line: 763, column: 50, scope: !833)
!848 = !DILocation(line: 763, column: 38, scope: !833)
!849 = !DILocation(line: 763, column: 13, scope: !833)
!850 = !DILocation(line: 764, column: 6, scope: !851)
!851 = distinct !DILexicalBlock(scope: !833, file: !66, line: 764, column: 6)
!852 = !DILocation(line: 764, column: 16, scope: !851)
!853 = !DILocation(line: 764, column: 6, scope: !833)
!854 = !DILocation(line: 766, column: 7, scope: !855)
!855 = distinct !DILexicalBlock(scope: !856, file: !66, line: 766, column: 7)
!856 = distinct !DILexicalBlock(scope: !851, file: !66, line: 765, column: 3)
!857 = !DILocation(line: 766, column: 17, scope: !855)
!858 = !DILocation(line: 766, column: 7, scope: !856)
!859 = !DILocation(line: 768, column: 17, scope: !860)
!860 = distinct !DILexicalBlock(scope: !855, file: !66, line: 767, column: 4)
!861 = !DILocation(line: 768, column: 12, scope: !860)
!862 = !DILocation(line: 768, column: 5, scope: !860)
!863 = !DILocation(line: 772, column: 5, scope: !864)
!864 = distinct !DILexicalBlock(scope: !855, file: !66, line: 771, column: 4)
!865 = !DILocation(line: 777, column: 4, scope: !866)
!866 = distinct !DILexicalBlock(scope: !851, file: !66, line: 776, column: 3)
!867 = !DILocation(line: 780, column: 1, scope: !798)
!868 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !66, file: !66, line: 799, type: !869, scopeLine: 800, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!869 = !DISubroutineType(types: !870)
!870 = !{!25, !6, !25, !25}
!871 = !DILocalVariable(name: "factor1", arg: 1, scope: !868, file: !66, line: 799, type: !6)
!872 = !DILocation(line: 799, column: 33, scope: !868)
!873 = !DILocalVariable(name: "factor2", arg: 2, scope: !868, file: !66, line: 799, type: !25)
!874 = !DILocation(line: 799, column: 46, scope: !868)
!875 = !DILocalVariable(name: "denominator", arg: 3, scope: !868, file: !66, line: 799, type: !25)
!876 = !DILocation(line: 799, column: 59, scope: !868)
!877 = !DILocalVariable(name: "s32Result", scope: !868, file: !66, line: 801, type: !74)
!878 = !DILocation(line: 801, column: 6, scope: !868)
!879 = !DILocalVariable(name: "s32Temp1", scope: !868, file: !66, line: 801, type: !74)
!880 = !DILocation(line: 801, column: 21, scope: !868)
!881 = !DILocation(line: 802, column: 14, scope: !868)
!882 = !DILocation(line: 802, column: 24, scope: !868)
!883 = !DILocation(line: 802, column: 22, scope: !868)
!884 = !DILocation(line: 802, column: 12, scope: !868)
!885 = !DILocation(line: 804, column: 5, scope: !886)
!886 = distinct !DILexicalBlock(scope: !868, file: !66, line: 804, column: 5)
!887 = !DILocation(line: 804, column: 17, scope: !886)
!888 = !DILocation(line: 804, column: 5, scope: !868)
!889 = !DILocation(line: 806, column: 6, scope: !890)
!890 = distinct !DILexicalBlock(scope: !891, file: !66, line: 806, column: 6)
!891 = distinct !DILexicalBlock(scope: !886, file: !66, line: 805, column: 2)
!892 = !DILocation(line: 806, column: 16, scope: !890)
!893 = !DILocation(line: 806, column: 6, scope: !891)
!894 = !DILocation(line: 808, column: 4, scope: !895)
!895 = distinct !DILexicalBlock(scope: !890, file: !66, line: 807, column: 3)
!896 = !DILocation(line: 812, column: 4, scope: !897)
!897 = distinct !DILexicalBlock(scope: !890, file: !66, line: 811, column: 3)
!898 = !DILocation(line: 817, column: 15, scope: !899)
!899 = distinct !DILexicalBlock(scope: !886, file: !66, line: 816, column: 2)
!900 = !DILocation(line: 817, column: 29, scope: !899)
!901 = !DILocation(line: 817, column: 39, scope: !899)
!902 = !DILocation(line: 817, column: 38, scope: !899)
!903 = !DILocation(line: 817, column: 54, scope: !899)
!904 = !DILocation(line: 817, column: 52, scope: !899)
!905 = !DILocation(line: 817, column: 25, scope: !899)
!906 = !DILocation(line: 817, column: 68, scope: !899)
!907 = !DILocation(line: 817, column: 12, scope: !899)
!908 = !DILocation(line: 818, column: 16, scope: !899)
!909 = !DILocation(line: 818, column: 25, scope: !899)
!910 = !DILocation(line: 818, column: 24, scope: !899)
!911 = !DILocation(line: 818, column: 41, scope: !899)
!912 = !DILocation(line: 818, column: 51, scope: !899)
!913 = !DILocation(line: 818, column: 50, scope: !899)
!914 = !DILocation(line: 818, column: 38, scope: !899)
!915 = !DILocation(line: 818, column: 13, scope: !899)
!916 = !DILocation(line: 819, column: 6, scope: !917)
!917 = distinct !DILexicalBlock(scope: !899, file: !66, line: 819, column: 6)
!918 = !DILocation(line: 819, column: 16, scope: !917)
!919 = !DILocation(line: 819, column: 6, scope: !899)
!920 = !DILocation(line: 821, column: 7, scope: !921)
!921 = distinct !DILexicalBlock(scope: !922, file: !66, line: 821, column: 7)
!922 = distinct !DILexicalBlock(scope: !917, file: !66, line: 820, column: 3)
!923 = !DILocation(line: 821, column: 17, scope: !921)
!924 = !DILocation(line: 821, column: 7, scope: !922)
!925 = !DILocation(line: 823, column: 17, scope: !926)
!926 = distinct !DILexicalBlock(scope: !921, file: !66, line: 822, column: 4)
!927 = !DILocation(line: 823, column: 12, scope: !926)
!928 = !DILocation(line: 823, column: 5, scope: !926)
!929 = !DILocation(line: 827, column: 5, scope: !930)
!930 = distinct !DILexicalBlock(scope: !921, file: !66, line: 826, column: 4)
!931 = !DILocation(line: 832, column: 4, scope: !932)
!932 = distinct !DILexicalBlock(scope: !917, file: !66, line: 831, column: 3)
!933 = !DILocation(line: 836, column: 1, scope: !868)
!934 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !66, file: !66, line: 854, type: !935, scopeLine: 855, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!935 = !DISubroutineType(types: !936)
!936 = !{!25, !25, !25, !25}
!937 = !DILocalVariable(name: "factor1", arg: 1, scope: !934, file: !66, line: 854, type: !25)
!938 = !DILocation(line: 854, column: 33, scope: !934)
!939 = !DILocalVariable(name: "factor2", arg: 2, scope: !934, file: !66, line: 854, type: !25)
!940 = !DILocation(line: 854, column: 46, scope: !934)
!941 = !DILocalVariable(name: "denominator", arg: 3, scope: !934, file: !66, line: 854, type: !25)
!942 = !DILocation(line: 854, column: 59, scope: !934)
!943 = !DILocalVariable(name: "u32Temp1", scope: !934, file: !66, line: 856, type: !479)
!944 = !DILocation(line: 856, column: 6, scope: !934)
!945 = !DILocalVariable(name: "u16TempDenom", scope: !934, file: !66, line: 857, type: !25)
!946 = !DILocation(line: 857, column: 6, scope: !934)
!947 = !DILocation(line: 859, column: 5, scope: !948)
!948 = distinct !DILexicalBlock(scope: !934, file: !66, line: 859, column: 5)
!949 = !DILocation(line: 859, column: 17, scope: !948)
!950 = !DILocation(line: 859, column: 5, scope: !934)
!951 = !DILocation(line: 861, column: 3, scope: !952)
!952 = distinct !DILexicalBlock(scope: !948, file: !66, line: 860, column: 2)
!953 = !DILocation(line: 865, column: 14, scope: !954)
!954 = distinct !DILexicalBlock(scope: !948, file: !66, line: 864, column: 2)
!955 = !DILocation(line: 865, column: 24, scope: !954)
!956 = !DILocation(line: 865, column: 22, scope: !954)
!957 = !DILocation(line: 865, column: 12, scope: !954)
!958 = !DILocation(line: 866, column: 18, scope: !954)
!959 = !DILocation(line: 866, column: 30, scope: !954)
!960 = !DILocation(line: 866, column: 16, scope: !954)
!961 = !DILocation(line: 867, column: 14, scope: !954)
!962 = !DILocation(line: 867, column: 25, scope: !954)
!963 = !DILocation(line: 867, column: 23, scope: !954)
!964 = !DILocation(line: 867, column: 12, scope: !954)
!965 = !DILocation(line: 868, column: 14, scope: !954)
!966 = !DILocation(line: 868, column: 25, scope: !954)
!967 = !DILocation(line: 868, column: 23, scope: !954)
!968 = !DILocation(line: 868, column: 12, scope: !954)
!969 = !DILocation(line: 869, column: 6, scope: !970)
!970 = distinct !DILexicalBlock(scope: !954, file: !66, line: 869, column: 6)
!971 = !DILocation(line: 869, column: 15, scope: !970)
!972 = !DILocation(line: 869, column: 6, scope: !954)
!973 = !DILocation(line: 871, column: 12, scope: !974)
!974 = distinct !DILexicalBlock(scope: !970, file: !66, line: 870, column: 3)
!975 = !DILocation(line: 871, column: 21, scope: !974)
!976 = !DILocation(line: 871, column: 11, scope: !974)
!977 = !DILocation(line: 871, column: 4, scope: !974)
!978 = !DILocation(line: 876, column: 4, scope: !979)
!979 = distinct !DILexicalBlock(scope: !970, file: !66, line: 875, column: 3)
!980 = !DILocation(line: 881, column: 1, scope: !934)
!981 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !66, file: !66, line: 898, type: !982, scopeLine: 899, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!982 = !DISubroutineType(types: !983)
!983 = !{!25, !25, !25, !479}
!984 = !DILocalVariable(name: "factor1", arg: 1, scope: !981, file: !66, line: 898, type: !25)
!985 = !DILocation(line: 898, column: 33, scope: !981)
!986 = !DILocalVariable(name: "factor2", arg: 2, scope: !981, file: !66, line: 898, type: !25)
!987 = !DILocation(line: 898, column: 46, scope: !981)
!988 = !DILocalVariable(name: "denominator", arg: 3, scope: !981, file: !66, line: 898, type: !479)
!989 = !DILocation(line: 898, column: 59, scope: !981)
!990 = !DILocalVariable(name: "u32Temp1", scope: !981, file: !66, line: 900, type: !479)
!991 = !DILocation(line: 900, column: 6, scope: !981)
!992 = !DILocation(line: 901, column: 5, scope: !993)
!993 = distinct !DILexicalBlock(scope: !981, file: !66, line: 901, column: 5)
!994 = !DILocation(line: 901, column: 17, scope: !993)
!995 = !DILocation(line: 901, column: 5, scope: !981)
!996 = !DILocation(line: 903, column: 3, scope: !997)
!997 = distinct !DILexicalBlock(scope: !993, file: !66, line: 902, column: 2)
!998 = !DILocation(line: 907, column: 15, scope: !999)
!999 = distinct !DILexicalBlock(scope: !993, file: !66, line: 906, column: 2)
!1000 = !DILocation(line: 907, column: 25, scope: !999)
!1001 = !DILocation(line: 907, column: 23, scope: !999)
!1002 = !DILocation(line: 907, column: 36, scope: !999)
!1003 = !DILocation(line: 907, column: 34, scope: !999)
!1004 = !DILocation(line: 907, column: 12, scope: !999)
!1005 = !DILocation(line: 908, column: 8, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !999, file: !66, line: 908, column: 6)
!1007 = !DILocation(line: 908, column: 18, scope: !1006)
!1008 = !DILocation(line: 908, column: 16, scope: !1006)
!1009 = !DILocation(line: 908, column: 28, scope: !1006)
!1010 = !DILocation(line: 908, column: 40, scope: !1006)
!1011 = !DILocation(line: 908, column: 39, scope: !1006)
!1012 = !DILocation(line: 908, column: 26, scope: !1006)
!1013 = !DILocation(line: 908, column: 53, scope: !1006)
!1014 = !DILocation(line: 908, column: 64, scope: !1006)
!1015 = !DILocation(line: 908, column: 50, scope: !1006)
!1016 = !DILocation(line: 908, column: 6, scope: !999)
!1017 = !DILocation(line: 910, column: 12, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !1006, file: !66, line: 909, column: 3)
!1019 = !DILocation(line: 911, column: 3, scope: !1018)
!1020 = !DILocation(line: 912, column: 6, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !999, file: !66, line: 912, column: 6)
!1022 = !DILocation(line: 912, column: 15, scope: !1021)
!1023 = !DILocation(line: 912, column: 6, scope: !999)
!1024 = !DILocation(line: 914, column: 12, scope: !1025)
!1025 = distinct !DILexicalBlock(scope: !1021, file: !66, line: 913, column: 3)
!1026 = !DILocation(line: 914, column: 21, scope: !1025)
!1027 = !DILocation(line: 914, column: 11, scope: !1025)
!1028 = !DILocation(line: 914, column: 4, scope: !1025)
!1029 = !DILocation(line: 918, column: 4, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1021, file: !66, line: 917, column: 3)
!1031 = !DILocation(line: 921, column: 1, scope: !981)
!1032 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !66, file: !66, line: 938, type: !1033, scopeLine: 939, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1033 = !DISubroutineType(types: !1034)
!1034 = !{!479, !479, !25}
!1035 = !DILocalVariable(name: "x_value", arg: 1, scope: !1032, file: !66, line: 938, type: !479)
!1036 = !DILocation(line: 938, column: 25, scope: !1032)
!1037 = !DILocalVariable(name: "y_value", arg: 2, scope: !1032, file: !66, line: 938, type: !25)
!1038 = !DILocation(line: 938, column: 38, scope: !1032)
!1039 = !DILocalVariable(name: "u32Temp1", scope: !1032, file: !66, line: 940, type: !479)
!1040 = !DILocation(line: 940, column: 6, scope: !1032)
!1041 = !DILocation(line: 941, column: 5, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1032, file: !66, line: 941, column: 5)
!1043 = !DILocation(line: 941, column: 13, scope: !1042)
!1044 = !DILocation(line: 941, column: 5, scope: !1032)
!1045 = !DILocation(line: 943, column: 3, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1042, file: !66, line: 942, column: 2)
!1047 = !DILocation(line: 947, column: 15, scope: !1048)
!1048 = distinct !DILexicalBlock(scope: !1042, file: !66, line: 946, column: 2)
!1049 = !DILocation(line: 947, column: 26, scope: !1048)
!1050 = !DILocation(line: 947, column: 34, scope: !1048)
!1051 = !DILocation(line: 947, column: 33, scope: !1048)
!1052 = !DILocation(line: 947, column: 45, scope: !1048)
!1053 = !DILocation(line: 947, column: 43, scope: !1048)
!1054 = !DILocation(line: 947, column: 23, scope: !1048)
!1055 = !DILocation(line: 947, column: 54, scope: !1048)
!1056 = !DILocation(line: 947, column: 12, scope: !1048)
!1057 = !DILocation(line: 948, column: 15, scope: !1048)
!1058 = !DILocation(line: 948, column: 23, scope: !1048)
!1059 = !DILocation(line: 948, column: 22, scope: !1048)
!1060 = !DILocation(line: 948, column: 35, scope: !1048)
!1061 = !DILocation(line: 948, column: 44, scope: !1048)
!1062 = !DILocation(line: 948, column: 43, scope: !1048)
!1063 = !DILocation(line: 948, column: 32, scope: !1048)
!1064 = !DILocation(line: 948, column: 12, scope: !1048)
!1065 = !DILocation(line: 949, column: 10, scope: !1048)
!1066 = !DILocation(line: 949, column: 3, scope: !1048)
!1067 = !DILocation(line: 951, column: 1, scope: !1032)
!1068 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !66, file: !66, line: 969, type: !1069, scopeLine: 970, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1069 = !DISubroutineType(types: !1070)
!1070 = !{!6, !6, !6, !6}
!1071 = !DILocalVariable(name: "fak1", arg: 1, scope: !1068, file: !66, line: 969, type: !6)
!1072 = !DILocation(line: 969, column: 33, scope: !1068)
!1073 = !DILocalVariable(name: "fak2", arg: 2, scope: !1068, file: !66, line: 969, type: !6)
!1074 = !DILocation(line: 969, column: 43, scope: !1068)
!1075 = !DILocalVariable(name: "div", arg: 3, scope: !1068, file: !66, line: 969, type: !6)
!1076 = !DILocation(line: 969, column: 53, scope: !1068)
!1077 = !DILocalVariable(name: "s32Temp1", scope: !1068, file: !66, line: 971, type: !74)
!1078 = !DILocation(line: 971, column: 6, scope: !1068)
!1079 = !DILocalVariable(name: "s32Temp2", scope: !1068, file: !66, line: 971, type: !74)
!1080 = !DILocation(line: 971, column: 20, scope: !1068)
!1081 = !DILocalVariable(name: "s32Temp3", scope: !1068, file: !66, line: 971, type: !74)
!1082 = !DILocation(line: 971, column: 34, scope: !1068)
!1083 = !DILocation(line: 972, column: 13, scope: !1068)
!1084 = !DILocation(line: 972, column: 20, scope: !1068)
!1085 = !DILocation(line: 972, column: 18, scope: !1068)
!1086 = !DILocation(line: 972, column: 11, scope: !1068)
!1087 = !DILocation(line: 973, column: 5, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1068, file: !66, line: 973, column: 5)
!1089 = !DILocation(line: 973, column: 9, scope: !1088)
!1090 = !DILocation(line: 973, column: 5, scope: !1068)
!1091 = !DILocation(line: 975, column: 6, scope: !1092)
!1092 = distinct !DILexicalBlock(scope: !1093, file: !66, line: 975, column: 6)
!1093 = distinct !DILexicalBlock(scope: !1088, file: !66, line: 974, column: 2)
!1094 = !DILocation(line: 975, column: 15, scope: !1092)
!1095 = !DILocation(line: 975, column: 6, scope: !1093)
!1096 = !DILocation(line: 977, column: 4, scope: !1097)
!1097 = distinct !DILexicalBlock(scope: !1092, file: !66, line: 976, column: 3)
!1098 = !DILocation(line: 981, column: 4, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1092, file: !66, line: 980, column: 3)
!1100 = !DILocation(line: 986, column: 15, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1088, file: !66, line: 985, column: 2)
!1102 = !DILocation(line: 986, column: 28, scope: !1101)
!1103 = !DILocation(line: 986, column: 39, scope: !1101)
!1104 = !DILocation(line: 986, column: 37, scope: !1101)
!1105 = !DILocation(line: 986, column: 46, scope: !1101)
!1106 = !DILocation(line: 986, column: 44, scope: !1101)
!1107 = !DILocation(line: 986, column: 24, scope: !1101)
!1108 = !DILocation(line: 986, column: 52, scope: !1101)
!1109 = !DILocation(line: 986, column: 12, scope: !1101)
!1110 = !DILocation(line: 987, column: 15, scope: !1101)
!1111 = !DILocation(line: 987, column: 24, scope: !1101)
!1112 = !DILocation(line: 987, column: 23, scope: !1101)
!1113 = !DILocation(line: 987, column: 32, scope: !1101)
!1114 = !DILocation(line: 987, column: 41, scope: !1101)
!1115 = !DILocation(line: 987, column: 40, scope: !1101)
!1116 = !DILocation(line: 987, column: 29, scope: !1101)
!1117 = !DILocation(line: 987, column: 12, scope: !1101)
!1118 = !DILocation(line: 988, column: 6, scope: !1119)
!1119 = distinct !DILexicalBlock(scope: !1101, file: !66, line: 988, column: 6)
!1120 = !DILocation(line: 988, column: 15, scope: !1119)
!1121 = !DILocation(line: 988, column: 6, scope: !1101)
!1122 = !DILocation(line: 990, column: 7, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1124, file: !66, line: 990, column: 7)
!1124 = distinct !DILexicalBlock(scope: !1119, file: !66, line: 989, column: 3)
!1125 = !DILocation(line: 990, column: 16, scope: !1123)
!1126 = !DILocation(line: 990, column: 7, scope: !1124)
!1127 = !DILocation(line: 992, column: 17, scope: !1128)
!1128 = distinct !DILexicalBlock(scope: !1123, file: !66, line: 991, column: 4)
!1129 = !DILocation(line: 992, column: 12, scope: !1128)
!1130 = !DILocation(line: 992, column: 5, scope: !1128)
!1131 = !DILocation(line: 996, column: 5, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1123, file: !66, line: 995, column: 4)
!1133 = !DILocation(line: 1001, column: 4, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1119, file: !66, line: 1000, column: 3)
!1135 = !DILocation(line: 1004, column: 1, scope: !1068)
!1136 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !66, file: !66, line: 1022, type: !1137, scopeLine: 1023, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1137 = !DISubroutineType(types: !1138)
!1138 = !{!6, !6, !6, !25}
!1139 = !DILocalVariable(name: "data1", arg: 1, scope: !1136, file: !66, line: 1022, type: !6)
!1140 = !DILocation(line: 1022, column: 33, scope: !1136)
!1141 = !DILocalVariable(name: "data2", arg: 2, scope: !1136, file: !66, line: 1022, type: !6)
!1142 = !DILocation(line: 1022, column: 43, scope: !1136)
!1143 = !DILocalVariable(name: "denominator", arg: 3, scope: !1136, file: !66, line: 1022, type: !25)
!1144 = !DILocation(line: 1022, column: 53, scope: !1136)
!1145 = !DILocalVariable(name: "s32Result", scope: !1136, file: !66, line: 1024, type: !74)
!1146 = !DILocation(line: 1024, column: 6, scope: !1136)
!1147 = !DILocalVariable(name: "s32Temp1", scope: !1136, file: !66, line: 1024, type: !74)
!1148 = !DILocation(line: 1024, column: 21, scope: !1136)
!1149 = !DILocation(line: 1025, column: 14, scope: !1136)
!1150 = !DILocation(line: 1025, column: 22, scope: !1136)
!1151 = !DILocation(line: 1025, column: 20, scope: !1136)
!1152 = !DILocation(line: 1025, column: 12, scope: !1136)
!1153 = !DILocation(line: 1027, column: 5, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1136, file: !66, line: 1027, column: 5)
!1155 = !DILocation(line: 1027, column: 17, scope: !1154)
!1156 = !DILocation(line: 1027, column: 5, scope: !1136)
!1157 = !DILocation(line: 1029, column: 6, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1159, file: !66, line: 1029, column: 6)
!1159 = distinct !DILexicalBlock(scope: !1154, file: !66, line: 1028, column: 2)
!1160 = !DILocation(line: 1029, column: 16, scope: !1158)
!1161 = !DILocation(line: 1029, column: 6, scope: !1159)
!1162 = !DILocation(line: 1031, column: 4, scope: !1163)
!1163 = distinct !DILexicalBlock(scope: !1158, file: !66, line: 1030, column: 3)
!1164 = !DILocation(line: 1033, column: 11, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1158, file: !66, line: 1033, column: 11)
!1166 = !DILocation(line: 1033, column: 21, scope: !1165)
!1167 = !DILocation(line: 1033, column: 11, scope: !1158)
!1168 = !DILocation(line: 1035, column: 4, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1165, file: !66, line: 1034, column: 3)
!1170 = !DILocation(line: 1039, column: 4, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1165, file: !66, line: 1038, column: 3)
!1172 = !DILocation(line: 1044, column: 15, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1154, file: !66, line: 1043, column: 2)
!1174 = !DILocation(line: 1044, column: 28, scope: !1173)
!1175 = !DILocation(line: 1044, column: 38, scope: !1173)
!1176 = !DILocation(line: 1044, column: 37, scope: !1173)
!1177 = !DILocation(line: 1044, column: 51, scope: !1173)
!1178 = !DILocation(line: 1044, column: 50, scope: !1173)
!1179 = !DILocation(line: 1044, column: 25, scope: !1173)
!1180 = !DILocation(line: 1044, column: 64, scope: !1173)
!1181 = !DILocation(line: 1044, column: 12, scope: !1173)
!1182 = !DILocation(line: 1045, column: 16, scope: !1173)
!1183 = !DILocation(line: 1045, column: 25, scope: !1173)
!1184 = !DILocation(line: 1045, column: 24, scope: !1173)
!1185 = !DILocation(line: 1045, column: 41, scope: !1173)
!1186 = !DILocation(line: 1045, column: 51, scope: !1173)
!1187 = !DILocation(line: 1045, column: 50, scope: !1173)
!1188 = !DILocation(line: 1045, column: 38, scope: !1173)
!1189 = !DILocation(line: 1045, column: 13, scope: !1173)
!1190 = !DILocation(line: 1046, column: 6, scope: !1191)
!1191 = distinct !DILexicalBlock(scope: !1173, file: !66, line: 1046, column: 6)
!1192 = !DILocation(line: 1046, column: 16, scope: !1191)
!1193 = !DILocation(line: 1046, column: 6, scope: !1173)
!1194 = !DILocation(line: 1048, column: 7, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1196, file: !66, line: 1048, column: 7)
!1196 = distinct !DILexicalBlock(scope: !1191, file: !66, line: 1047, column: 3)
!1197 = !DILocation(line: 1048, column: 17, scope: !1195)
!1198 = !DILocation(line: 1048, column: 7, scope: !1196)
!1199 = !DILocation(line: 1050, column: 17, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1195, file: !66, line: 1049, column: 4)
!1201 = !DILocation(line: 1050, column: 12, scope: !1200)
!1202 = !DILocation(line: 1050, column: 5, scope: !1200)
!1203 = !DILocation(line: 1054, column: 5, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1195, file: !66, line: 1053, column: 4)
!1205 = !DILocation(line: 1059, column: 4, scope: !1206)
!1206 = distinct !DILexicalBlock(scope: !1191, file: !66, line: 1058, column: 3)
!1207 = !DILocation(line: 1063, column: 1, scope: !1136)
!1208 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !66, file: !66, line: 1080, type: !1209, scopeLine: 1081, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1209 = !DISubroutineType(types: !1210)
!1210 = !{!479, !479, !74}
!1211 = !DILocalVariable(name: "numerator", arg: 1, scope: !1208, file: !66, line: 1080, type: !479)
!1212 = !DILocation(line: 1080, column: 25, scope: !1208)
!1213 = !DILocalVariable(name: "denominator", arg: 2, scope: !1208, file: !66, line: 1080, type: !74)
!1214 = !DILocation(line: 1080, column: 40, scope: !1208)
!1215 = !DILocalVariable(name: "u32Temp1", scope: !1208, file: !66, line: 1082, type: !479)
!1216 = !DILocation(line: 1082, column: 6, scope: !1208)
!1217 = !DILocation(line: 1083, column: 5, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1208, file: !66, line: 1083, column: 5)
!1219 = !DILocation(line: 1083, column: 17, scope: !1218)
!1220 = !DILocation(line: 1083, column: 5, scope: !1208)
!1221 = !DILocation(line: 1085, column: 3, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !1218, file: !66, line: 1084, column: 2)
!1223 = !DILocation(line: 1089, column: 6, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1225, file: !66, line: 1089, column: 6)
!1225 = distinct !DILexicalBlock(scope: !1218, file: !66, line: 1088, column: 2)
!1226 = !DILocation(line: 1089, column: 18, scope: !1224)
!1227 = !DILocation(line: 1089, column: 6, scope: !1225)
!1228 = !DILocation(line: 1091, column: 4, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1224, file: !66, line: 1090, column: 3)
!1230 = !DILocation(line: 1095, column: 16, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1224, file: !66, line: 1094, column: 3)
!1232 = !DILocation(line: 1095, column: 30, scope: !1231)
!1233 = !DILocation(line: 1095, column: 40, scope: !1231)
!1234 = !DILocation(line: 1095, column: 39, scope: !1231)
!1235 = !DILocation(line: 1095, column: 55, scope: !1231)
!1236 = !DILocation(line: 1095, column: 53, scope: !1231)
!1237 = !DILocation(line: 1095, column: 26, scope: !1231)
!1238 = !DILocation(line: 1095, column: 68, scope: !1231)
!1239 = !DILocation(line: 1095, column: 13, scope: !1231)
!1240 = !DILocation(line: 1096, column: 16, scope: !1231)
!1241 = !DILocation(line: 1096, column: 25, scope: !1231)
!1242 = !DILocation(line: 1096, column: 24, scope: !1231)
!1243 = !DILocation(line: 1096, column: 41, scope: !1231)
!1244 = !DILocation(line: 1096, column: 51, scope: !1231)
!1245 = !DILocation(line: 1096, column: 50, scope: !1231)
!1246 = !DILocation(line: 1096, column: 38, scope: !1231)
!1247 = !DILocation(line: 1096, column: 13, scope: !1231)
!1248 = !DILocation(line: 1097, column: 11, scope: !1231)
!1249 = !DILocation(line: 1097, column: 4, scope: !1231)
!1250 = !DILocation(line: 1100, column: 1, scope: !1208)
!1251 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !66, file: !66, line: 1117, type: !1252, scopeLine: 1118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1252 = !DISubroutineType(types: !1253)
!1253 = !{!479, !74, !479}
!1254 = !DILocalVariable(name: "numerator", arg: 1, scope: !1251, file: !66, line: 1117, type: !74)
!1255 = !DILocation(line: 1117, column: 25, scope: !1251)
!1256 = !DILocalVariable(name: "denominator", arg: 2, scope: !1251, file: !66, line: 1117, type: !479)
!1257 = !DILocation(line: 1117, column: 40, scope: !1251)
!1258 = !DILocalVariable(name: "s32Temp1", scope: !1251, file: !66, line: 1119, type: !74)
!1259 = !DILocation(line: 1119, column: 6, scope: !1251)
!1260 = !DILocation(line: 1120, column: 5, scope: !1261)
!1261 = distinct !DILexicalBlock(scope: !1251, file: !66, line: 1120, column: 5)
!1262 = !DILocation(line: 1120, column: 17, scope: !1261)
!1263 = !DILocation(line: 1120, column: 5, scope: !1251)
!1264 = !DILocation(line: 1122, column: 6, scope: !1265)
!1265 = distinct !DILexicalBlock(scope: !1266, file: !66, line: 1122, column: 6)
!1266 = distinct !DILexicalBlock(scope: !1261, file: !66, line: 1121, column: 2)
!1267 = !DILocation(line: 1122, column: 16, scope: !1265)
!1268 = !DILocation(line: 1122, column: 6, scope: !1266)
!1269 = !DILocation(line: 1124, column: 4, scope: !1270)
!1270 = distinct !DILexicalBlock(scope: !1265, file: !66, line: 1123, column: 3)
!1271 = !DILocation(line: 1128, column: 4, scope: !1272)
!1272 = distinct !DILexicalBlock(scope: !1265, file: !66, line: 1127, column: 3)
!1273 = !DILocation(line: 1133, column: 6, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1275, file: !66, line: 1133, column: 6)
!1275 = distinct !DILexicalBlock(scope: !1261, file: !66, line: 1132, column: 2)
!1276 = !DILocation(line: 1133, column: 16, scope: !1274)
!1277 = !DILocation(line: 1133, column: 6, scope: !1275)
!1278 = !DILocation(line: 1135, column: 17, scope: !1279)
!1279 = distinct !DILexicalBlock(scope: !1274, file: !66, line: 1134, column: 3)
!1280 = !DILocation(line: 1135, column: 31, scope: !1279)
!1281 = !DILocation(line: 1135, column: 41, scope: !1279)
!1282 = !DILocation(line: 1135, column: 40, scope: !1279)
!1283 = !DILocation(line: 1135, column: 56, scope: !1279)
!1284 = !DILocation(line: 1135, column: 54, scope: !1279)
!1285 = !DILocation(line: 1135, column: 27, scope: !1279)
!1286 = !DILocation(line: 1135, column: 69, scope: !1279)
!1287 = !DILocation(line: 1135, column: 13, scope: !1279)
!1288 = !DILocation(line: 1136, column: 13, scope: !1279)
!1289 = !DILocation(line: 1136, column: 23, scope: !1279)
!1290 = !DILocation(line: 1136, column: 22, scope: !1279)
!1291 = !DILocation(line: 1136, column: 39, scope: !1279)
!1292 = !DILocation(line: 1136, column: 48, scope: !1279)
!1293 = !DILocation(line: 1136, column: 47, scope: !1279)
!1294 = !DILocation(line: 1136, column: 36, scope: !1279)
!1295 = !DILocation(line: 1136, column: 4, scope: !1279)
!1296 = !DILocation(line: 1140, column: 4, scope: !1297)
!1297 = distinct !DILexicalBlock(scope: !1274, file: !66, line: 1139, column: 3)
!1298 = !DILocation(line: 1143, column: 1, scope: !1251)
!1299 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !66, file: !66, line: 1160, type: !1300, scopeLine: 1161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1300 = !DISubroutineType(types: !1301)
!1301 = !{!479, !74, !74}
!1302 = !DILocalVariable(name: "numerator", arg: 1, scope: !1299, file: !66, line: 1160, type: !74)
!1303 = !DILocation(line: 1160, column: 25, scope: !1299)
!1304 = !DILocalVariable(name: "denominator", arg: 2, scope: !1299, file: !66, line: 1160, type: !74)
!1305 = !DILocation(line: 1160, column: 40, scope: !1299)
!1306 = !DILocalVariable(name: "u32Temp1", scope: !1299, file: !66, line: 1162, type: !479)
!1307 = !DILocation(line: 1162, column: 6, scope: !1299)
!1308 = !DILocalVariable(name: "u32Temp2", scope: !1299, file: !66, line: 1162, type: !479)
!1309 = !DILocation(line: 1162, column: 20, scope: !1299)
!1310 = !DILocation(line: 1163, column: 5, scope: !1311)
!1311 = distinct !DILexicalBlock(scope: !1299, file: !66, line: 1163, column: 5)
!1312 = !DILocation(line: 1163, column: 17, scope: !1311)
!1313 = !DILocation(line: 1163, column: 5, scope: !1299)
!1314 = !DILocation(line: 1165, column: 6, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1316, file: !66, line: 1165, column: 6)
!1316 = distinct !DILexicalBlock(scope: !1311, file: !66, line: 1164, column: 2)
!1317 = !DILocation(line: 1165, column: 16, scope: !1315)
!1318 = !DILocation(line: 1165, column: 6, scope: !1316)
!1319 = !DILocation(line: 1167, column: 4, scope: !1320)
!1320 = distinct !DILexicalBlock(scope: !1315, file: !66, line: 1166, column: 3)
!1321 = !DILocation(line: 1171, column: 4, scope: !1322)
!1322 = distinct !DILexicalBlock(scope: !1315, file: !66, line: 1170, column: 3)
!1323 = !DILocation(line: 1176, column: 6, scope: !1324)
!1324 = distinct !DILexicalBlock(scope: !1325, file: !66, line: 1176, column: 6)
!1325 = distinct !DILexicalBlock(scope: !1311, file: !66, line: 1175, column: 2)
!1326 = !DILocation(line: 1176, column: 16, scope: !1324)
!1327 = !DILocation(line: 1176, column: 6, scope: !1325)
!1328 = !DILocation(line: 1178, column: 7, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1330, file: !66, line: 1178, column: 7)
!1330 = distinct !DILexicalBlock(scope: !1324, file: !66, line: 1177, column: 3)
!1331 = !DILocation(line: 1178, column: 17, scope: !1329)
!1332 = !DILocation(line: 1178, column: 7, scope: !1330)
!1333 = !DILocation(line: 1180, column: 5, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1329, file: !66, line: 1179, column: 4)
!1335 = !DILocation(line: 1184, column: 8, scope: !1336)
!1336 = distinct !DILexicalBlock(scope: !1337, file: !66, line: 1184, column: 8)
!1337 = distinct !DILexicalBlock(scope: !1329, file: !66, line: 1183, column: 4)
!1338 = !DILocation(line: 1184, column: 20, scope: !1336)
!1339 = !DILocation(line: 1184, column: 8, scope: !1337)
!1340 = !DILocation(line: 1186, column: 6, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1336, file: !66, line: 1185, column: 5)
!1342 = !DILocation(line: 1190, column: 18, scope: !1343)
!1343 = distinct !DILexicalBlock(scope: !1336, file: !66, line: 1189, column: 5)
!1344 = !DILocation(line: 1190, column: 32, scope: !1343)
!1345 = !DILocation(line: 1190, column: 42, scope: !1343)
!1346 = !DILocation(line: 1190, column: 41, scope: !1343)
!1347 = !DILocation(line: 1190, column: 57, scope: !1343)
!1348 = !DILocation(line: 1190, column: 55, scope: !1343)
!1349 = !DILocation(line: 1190, column: 28, scope: !1343)
!1350 = !DILocation(line: 1190, column: 71, scope: !1343)
!1351 = !DILocation(line: 1190, column: 15, scope: !1343)
!1352 = !DILocation(line: 1191, column: 18, scope: !1343)
!1353 = !DILocation(line: 1191, column: 29, scope: !1343)
!1354 = !DILocation(line: 1191, column: 27, scope: !1343)
!1355 = !DILocation(line: 1191, column: 45, scope: !1343)
!1356 = !DILocation(line: 1191, column: 57, scope: !1343)
!1357 = !DILocation(line: 1191, column: 55, scope: !1343)
!1358 = !DILocation(line: 1191, column: 42, scope: !1343)
!1359 = !DILocation(line: 1191, column: 15, scope: !1343)
!1360 = !DILocation(line: 1192, column: 13, scope: !1343)
!1361 = !DILocation(line: 1192, column: 6, scope: !1343)
!1362 = !DILocation(line: 1198, column: 7, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1364, file: !66, line: 1198, column: 7)
!1364 = distinct !DILexicalBlock(scope: !1324, file: !66, line: 1197, column: 3)
!1365 = !DILocation(line: 1198, column: 19, scope: !1363)
!1366 = !DILocation(line: 1198, column: 7, scope: !1364)
!1367 = !DILocation(line: 1200, column: 5, scope: !1368)
!1368 = distinct !DILexicalBlock(scope: !1363, file: !66, line: 1199, column: 4)
!1369 = !DILocation(line: 1204, column: 18, scope: !1370)
!1370 = distinct !DILexicalBlock(scope: !1363, file: !66, line: 1203, column: 4)
!1371 = !DILocation(line: 1204, column: 17, scope: !1370)
!1372 = !DILocation(line: 1204, column: 15, scope: !1370)
!1373 = !DILocation(line: 1205, column: 20, scope: !1370)
!1374 = !DILocation(line: 1205, column: 19, scope: !1370)
!1375 = !DILocation(line: 1205, column: 17, scope: !1370)
!1376 = !DILocation(line: 1206, column: 17, scope: !1370)
!1377 = !DILocation(line: 1206, column: 31, scope: !1370)
!1378 = !DILocation(line: 1206, column: 41, scope: !1370)
!1379 = !DILocation(line: 1206, column: 40, scope: !1370)
!1380 = !DILocation(line: 1206, column: 56, scope: !1370)
!1381 = !DILocation(line: 1206, column: 54, scope: !1370)
!1382 = !DILocation(line: 1206, column: 27, scope: !1370)
!1383 = !DILocation(line: 1206, column: 70, scope: !1370)
!1384 = !DILocation(line: 1206, column: 14, scope: !1370)
!1385 = !DILocation(line: 1207, column: 17, scope: !1370)
!1386 = !DILocation(line: 1207, column: 28, scope: !1370)
!1387 = !DILocation(line: 1207, column: 26, scope: !1370)
!1388 = !DILocation(line: 1207, column: 44, scope: !1370)
!1389 = !DILocation(line: 1207, column: 56, scope: !1370)
!1390 = !DILocation(line: 1207, column: 54, scope: !1370)
!1391 = !DILocation(line: 1207, column: 41, scope: !1370)
!1392 = !DILocation(line: 1207, column: 14, scope: !1370)
!1393 = !DILocation(line: 1208, column: 12, scope: !1370)
!1394 = !DILocation(line: 1208, column: 5, scope: !1370)
!1395 = !DILocation(line: 1213, column: 1, scope: !1299)
!1396 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !66, file: !66, line: 1230, type: !1397, scopeLine: 1231, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1397 = !DISubroutineType(types: !1398)
!1398 = !{!479, !479, !479}
!1399 = !DILocalVariable(name: "numerator", arg: 1, scope: !1396, file: !66, line: 1230, type: !479)
!1400 = !DILocation(line: 1230, column: 25, scope: !1396)
!1401 = !DILocalVariable(name: "denominator", arg: 2, scope: !1396, file: !66, line: 1230, type: !479)
!1402 = !DILocation(line: 1230, column: 40, scope: !1396)
!1403 = !DILocalVariable(name: "u32Temp1", scope: !1396, file: !66, line: 1233, type: !479)
!1404 = !DILocation(line: 1233, column: 6, scope: !1396)
!1405 = !DILocalVariable(name: "u32Temp2", scope: !1396, file: !66, line: 1233, type: !479)
!1406 = !DILocation(line: 1233, column: 20, scope: !1396)
!1407 = !DILocalVariable(name: "u32Temp3", scope: !1396, file: !66, line: 1233, type: !479)
!1408 = !DILocation(line: 1233, column: 34, scope: !1396)
!1409 = !DILocalVariable(name: "numerator_old", scope: !1396, file: !66, line: 1233, type: !479)
!1410 = !DILocation(line: 1233, column: 48, scope: !1396)
!1411 = !DILocation(line: 1234, column: 5, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1396, file: !66, line: 1234, column: 5)
!1413 = !DILocation(line: 1234, column: 16, scope: !1412)
!1414 = !DILocation(line: 1234, column: 5, scope: !1396)
!1415 = !DILocation(line: 1236, column: 3, scope: !1416)
!1416 = distinct !DILexicalBlock(scope: !1412, file: !66, line: 1235, column: 2)
!1417 = !DILocation(line: 1240, column: 14, scope: !1418)
!1418 = distinct !DILexicalBlock(scope: !1412, file: !66, line: 1239, column: 2)
!1419 = !DILocation(line: 1240, column: 26, scope: !1418)
!1420 = !DILocation(line: 1240, column: 41, scope: !1418)
!1421 = !DILocation(line: 1240, column: 51, scope: !1418)
!1422 = !DILocation(line: 1240, column: 50, scope: !1418)
!1423 = !DILocation(line: 1240, column: 38, scope: !1418)
!1424 = !DILocation(line: 1240, column: 24, scope: !1418)
!1425 = !DILocation(line: 1240, column: 12, scope: !1418)
!1426 = !DILocation(line: 1241, column: 7, scope: !1427)
!1427 = distinct !DILexicalBlock(scope: !1418, file: !66, line: 1241, column: 6)
!1428 = !DILocation(line: 1241, column: 16, scope: !1427)
!1429 = !DILocation(line: 1241, column: 24, scope: !1427)
!1430 = !DILocation(line: 1241, column: 6, scope: !1418)
!1431 = !DILocation(line: 1243, column: 16, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1427, file: !66, line: 1242, column: 3)
!1433 = !DILocation(line: 1243, column: 27, scope: !1432)
!1434 = !DILocation(line: 1243, column: 13, scope: !1432)
!1435 = !DILocation(line: 1244, column: 3, scope: !1432)
!1436 = !DILocation(line: 1247, column: 16, scope: !1437)
!1437 = distinct !DILexicalBlock(scope: !1427, file: !66, line: 1246, column: 3)
!1438 = !DILocation(line: 1247, column: 27, scope: !1437)
!1439 = !DILocation(line: 1247, column: 32, scope: !1437)
!1440 = !DILocation(line: 1247, column: 13, scope: !1437)
!1441 = !DILocation(line: 1250, column: 6, scope: !1442)
!1442 = distinct !DILexicalBlock(scope: !1418, file: !66, line: 1250, column: 6)
!1443 = !DILocation(line: 1250, column: 17, scope: !1442)
!1444 = !DILocation(line: 1250, column: 15, scope: !1442)
!1445 = !DILocation(line: 1250, column: 6, scope: !1418)
!1446 = !DILocation(line: 1252, column: 12, scope: !1447)
!1447 = distinct !DILexicalBlock(scope: !1442, file: !66, line: 1251, column: 3)
!1448 = !DILocation(line: 1252, column: 22, scope: !1447)
!1449 = !DILocation(line: 1252, column: 21, scope: !1447)
!1450 = !DILocation(line: 1252, column: 4, scope: !1447)
!1451 = !DILocation(line: 1256, column: 13, scope: !1452)
!1452 = distinct !DILexicalBlock(scope: !1442, file: !66, line: 1255, column: 3)
!1453 = !DILocation(line: 1256, column: 23, scope: !1452)
!1454 = !DILocation(line: 1256, column: 22, scope: !1452)
!1455 = !DILocation(line: 1256, column: 36, scope: !1452)
!1456 = !DILocation(line: 1256, column: 4, scope: !1452)
!1457 = !DILocation(line: 1261, column: 1, scope: !1396)
!1458 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !66, file: !66, line: 1278, type: !1459, scopeLine: 1279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1459 = !DISubroutineType(types: !1460)
!1460 = !{!74, !479, !74}
!1461 = !DILocalVariable(name: "numerator", arg: 1, scope: !1458, file: !66, line: 1278, type: !479)
!1462 = !DILocation(line: 1278, column: 25, scope: !1458)
!1463 = !DILocalVariable(name: "denominator", arg: 2, scope: !1458, file: !66, line: 1278, type: !74)
!1464 = !DILocation(line: 1278, column: 40, scope: !1458)
!1465 = !DILocalVariable(name: "u32Temp1", scope: !1458, file: !66, line: 1280, type: !479)
!1466 = !DILocation(line: 1280, column: 6, scope: !1458)
!1467 = !DILocalVariable(name: "u32Temp2", scope: !1458, file: !66, line: 1280, type: !479)
!1468 = !DILocation(line: 1280, column: 20, scope: !1458)
!1469 = !DILocation(line: 1281, column: 5, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1458, file: !66, line: 1281, column: 5)
!1471 = !DILocation(line: 1281, column: 17, scope: !1470)
!1472 = !DILocation(line: 1281, column: 5, scope: !1458)
!1473 = !DILocation(line: 1283, column: 6, scope: !1474)
!1474 = distinct !DILexicalBlock(scope: !1475, file: !66, line: 1283, column: 6)
!1475 = distinct !DILexicalBlock(scope: !1470, file: !66, line: 1282, column: 2)
!1476 = !DILocation(line: 1283, column: 18, scope: !1474)
!1477 = !DILocation(line: 1283, column: 6, scope: !1475)
!1478 = !DILocation(line: 1285, column: 4, scope: !1479)
!1479 = distinct !DILexicalBlock(scope: !1474, file: !66, line: 1284, column: 3)
!1480 = !DILocation(line: 1289, column: 19, scope: !1481)
!1481 = distinct !DILexicalBlock(scope: !1474, file: !66, line: 1288, column: 3)
!1482 = !DILocation(line: 1289, column: 18, scope: !1481)
!1483 = !DILocation(line: 1289, column: 16, scope: !1481)
!1484 = !DILocation(line: 1290, column: 16, scope: !1481)
!1485 = !DILocation(line: 1290, column: 30, scope: !1481)
!1486 = !DILocation(line: 1290, column: 40, scope: !1481)
!1487 = !DILocation(line: 1290, column: 39, scope: !1481)
!1488 = !DILocation(line: 1290, column: 55, scope: !1481)
!1489 = !DILocation(line: 1290, column: 53, scope: !1481)
!1490 = !DILocation(line: 1290, column: 26, scope: !1481)
!1491 = !DILocation(line: 1290, column: 69, scope: !1481)
!1492 = !DILocation(line: 1290, column: 13, scope: !1481)
!1493 = !DILocation(line: 1291, column: 16, scope: !1481)
!1494 = !DILocation(line: 1291, column: 25, scope: !1481)
!1495 = !DILocation(line: 1291, column: 24, scope: !1481)
!1496 = !DILocation(line: 1291, column: 41, scope: !1481)
!1497 = !DILocation(line: 1291, column: 51, scope: !1481)
!1498 = !DILocation(line: 1291, column: 50, scope: !1481)
!1499 = !DILocation(line: 1291, column: 38, scope: !1481)
!1500 = !DILocation(line: 1291, column: 13, scope: !1481)
!1501 = !DILocation(line: 1292, column: 7, scope: !1502)
!1502 = distinct !DILexicalBlock(scope: !1481, file: !66, line: 1292, column: 7)
!1503 = !DILocation(line: 1292, column: 16, scope: !1502)
!1504 = !DILocation(line: 1292, column: 7, scope: !1481)
!1505 = !DILocation(line: 1294, column: 13, scope: !1506)
!1506 = distinct !DILexicalBlock(scope: !1502, file: !66, line: 1293, column: 4)
!1507 = !DILocation(line: 1294, column: 12, scope: !1506)
!1508 = !DILocation(line: 1294, column: 5, scope: !1506)
!1509 = !DILocation(line: 1298, column: 5, scope: !1510)
!1510 = distinct !DILexicalBlock(scope: !1502, file: !66, line: 1297, column: 4)
!1511 = !DILocation(line: 1304, column: 15, scope: !1512)
!1512 = distinct !DILexicalBlock(scope: !1470, file: !66, line: 1303, column: 2)
!1513 = !DILocation(line: 1304, column: 29, scope: !1512)
!1514 = !DILocation(line: 1304, column: 39, scope: !1512)
!1515 = !DILocation(line: 1304, column: 38, scope: !1512)
!1516 = !DILocation(line: 1304, column: 54, scope: !1512)
!1517 = !DILocation(line: 1304, column: 52, scope: !1512)
!1518 = !DILocation(line: 1304, column: 25, scope: !1512)
!1519 = !DILocation(line: 1304, column: 68, scope: !1512)
!1520 = !DILocation(line: 1304, column: 12, scope: !1512)
!1521 = !DILocation(line: 1305, column: 15, scope: !1512)
!1522 = !DILocation(line: 1305, column: 24, scope: !1512)
!1523 = !DILocation(line: 1305, column: 23, scope: !1512)
!1524 = !DILocation(line: 1305, column: 40, scope: !1512)
!1525 = !DILocation(line: 1305, column: 50, scope: !1512)
!1526 = !DILocation(line: 1305, column: 49, scope: !1512)
!1527 = !DILocation(line: 1305, column: 37, scope: !1512)
!1528 = !DILocation(line: 1305, column: 12, scope: !1512)
!1529 = !DILocation(line: 1306, column: 6, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1512, file: !66, line: 1306, column: 6)
!1531 = !DILocation(line: 1306, column: 15, scope: !1530)
!1532 = !DILocation(line: 1306, column: 6, scope: !1512)
!1533 = !DILocation(line: 1308, column: 11, scope: !1534)
!1534 = distinct !DILexicalBlock(scope: !1530, file: !66, line: 1307, column: 3)
!1535 = !DILocation(line: 1308, column: 4, scope: !1534)
!1536 = !DILocation(line: 1312, column: 4, scope: !1537)
!1537 = distinct !DILexicalBlock(scope: !1530, file: !66, line: 1311, column: 3)
!1538 = !DILocation(line: 1315, column: 1, scope: !1458)
!1539 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !66, file: !66, line: 1333, type: !1540, scopeLine: 1334, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1540 = !DISubroutineType(types: !1541)
!1541 = !{!74, !74, !479}
!1542 = !DILocalVariable(name: "numerator", arg: 1, scope: !1539, file: !66, line: 1333, type: !74)
!1543 = !DILocation(line: 1333, column: 25, scope: !1539)
!1544 = !DILocalVariable(name: "denominator", arg: 2, scope: !1539, file: !66, line: 1333, type: !479)
!1545 = !DILocation(line: 1333, column: 40, scope: !1539)
!1546 = !DILocalVariable(name: "s32Temp1", scope: !1539, file: !66, line: 1335, type: !74)
!1547 = !DILocation(line: 1335, column: 6, scope: !1539)
!1548 = !DILocalVariable(name: "s32Temp2", scope: !1539, file: !66, line: 1335, type: !74)
!1549 = !DILocation(line: 1335, column: 20, scope: !1539)
!1550 = !DILocalVariable(name: "u32Temp0", scope: !1539, file: !66, line: 1336, type: !479)
!1551 = !DILocation(line: 1336, column: 6, scope: !1539)
!1552 = !DILocalVariable(name: "u32Temp1", scope: !1539, file: !66, line: 1336, type: !479)
!1553 = !DILocation(line: 1336, column: 20, scope: !1539)
!1554 = !DILocalVariable(name: "u32Temp2", scope: !1539, file: !66, line: 1336, type: !479)
!1555 = !DILocation(line: 1336, column: 34, scope: !1539)
!1556 = !DILocation(line: 1337, column: 5, scope: !1557)
!1557 = distinct !DILexicalBlock(scope: !1539, file: !66, line: 1337, column: 5)
!1558 = !DILocation(line: 1337, column: 17, scope: !1557)
!1559 = !DILocation(line: 1337, column: 5, scope: !1539)
!1560 = !DILocation(line: 1339, column: 6, scope: !1561)
!1561 = distinct !DILexicalBlock(scope: !1562, file: !66, line: 1339, column: 6)
!1562 = distinct !DILexicalBlock(scope: !1557, file: !66, line: 1338, column: 2)
!1563 = !DILocation(line: 1339, column: 16, scope: !1561)
!1564 = !DILocation(line: 1339, column: 6, scope: !1562)
!1565 = !DILocation(line: 1341, column: 4, scope: !1566)
!1566 = distinct !DILexicalBlock(scope: !1561, file: !66, line: 1340, column: 3)
!1567 = !DILocation(line: 1345, column: 4, scope: !1568)
!1568 = distinct !DILexicalBlock(scope: !1561, file: !66, line: 1344, column: 3)
!1569 = !DILocation(line: 1350, column: 6, scope: !1570)
!1570 = distinct !DILexicalBlock(scope: !1571, file: !66, line: 1350, column: 6)
!1571 = distinct !DILexicalBlock(scope: !1557, file: !66, line: 1349, column: 2)
!1572 = !DILocation(line: 1350, column: 16, scope: !1570)
!1573 = !DILocation(line: 1350, column: 6, scope: !1571)
!1574 = !DILocation(line: 1352, column: 16, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1570, file: !66, line: 1351, column: 3)
!1576 = !DILocation(line: 1352, column: 15, scope: !1575)
!1577 = !DILocation(line: 1352, column: 13, scope: !1575)
!1578 = !DILocation(line: 1353, column: 16, scope: !1575)
!1579 = !DILocation(line: 1353, column: 25, scope: !1575)
!1580 = !DILocation(line: 1353, column: 24, scope: !1575)
!1581 = !DILocation(line: 1353, column: 13, scope: !1575)
!1582 = !DILocation(line: 1354, column: 15, scope: !1575)
!1583 = !DILocation(line: 1354, column: 28, scope: !1575)
!1584 = !DILocation(line: 1354, column: 37, scope: !1575)
!1585 = !DILocation(line: 1354, column: 36, scope: !1575)
!1586 = !DILocation(line: 1354, column: 52, scope: !1575)
!1587 = !DILocation(line: 1354, column: 50, scope: !1575)
!1588 = !DILocation(line: 1354, column: 24, scope: !1575)
!1589 = !DILocation(line: 1354, column: 13, scope: !1575)
!1590 = !DILocation(line: 1356, column: 8, scope: !1591)
!1591 = distinct !DILexicalBlock(scope: !1575, file: !66, line: 1356, column: 7)
!1592 = !DILocation(line: 1356, column: 20, scope: !1591)
!1593 = !DILocation(line: 1356, column: 27, scope: !1591)
!1594 = !DILocation(line: 1356, column: 7, scope: !1575)
!1595 = !DILocation(line: 1358, column: 20, scope: !1596)
!1596 = distinct !DILexicalBlock(scope: !1591, file: !66, line: 1357, column: 4)
!1597 = !DILocation(line: 1358, column: 32, scope: !1596)
!1598 = !DILocation(line: 1358, column: 17, scope: !1596)
!1599 = !DILocation(line: 1359, column: 4, scope: !1596)
!1600 = !DILocation(line: 1362, column: 20, scope: !1601)
!1601 = distinct !DILexicalBlock(scope: !1591, file: !66, line: 1361, column: 4)
!1602 = !DILocation(line: 1362, column: 32, scope: !1601)
!1603 = !DILocation(line: 1362, column: 38, scope: !1601)
!1604 = !DILocation(line: 1362, column: 17, scope: !1601)
!1605 = !DILocation(line: 1366, column: 7, scope: !1606)
!1606 = distinct !DILexicalBlock(scope: !1575, file: !66, line: 1366, column: 7)
!1607 = !DILocation(line: 1366, column: 18, scope: !1606)
!1608 = !DILocation(line: 1366, column: 16, scope: !1606)
!1609 = !DILocation(line: 1366, column: 7, scope: !1575)
!1610 = !DILocation(line: 1368, column: 14, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1606, file: !66, line: 1367, column: 4)
!1612 = !DILocation(line: 1368, column: 13, scope: !1611)
!1613 = !DILocation(line: 1368, column: 23, scope: !1611)
!1614 = !DILocation(line: 1368, column: 5, scope: !1611)
!1615 = !DILocation(line: 1372, column: 14, scope: !1616)
!1616 = distinct !DILexicalBlock(scope: !1606, file: !66, line: 1371, column: 4)
!1617 = !DILocation(line: 1372, column: 23, scope: !1616)
!1618 = !DILocation(line: 1372, column: 12, scope: !1616)
!1619 = !DILocation(line: 1372, column: 27, scope: !1616)
!1620 = !DILocation(line: 1372, column: 5, scope: !1616)
!1621 = !DILocation(line: 1379, column: 16, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1570, file: !66, line: 1378, column: 3)
!1623 = !DILocation(line: 1379, column: 30, scope: !1622)
!1624 = !DILocation(line: 1379, column: 40, scope: !1622)
!1625 = !DILocation(line: 1379, column: 39, scope: !1622)
!1626 = !DILocation(line: 1379, column: 55, scope: !1622)
!1627 = !DILocation(line: 1379, column: 53, scope: !1622)
!1628 = !DILocation(line: 1379, column: 26, scope: !1622)
!1629 = !DILocation(line: 1379, column: 69, scope: !1622)
!1630 = !DILocation(line: 1379, column: 13, scope: !1622)
!1631 = !DILocation(line: 1380, column: 16, scope: !1622)
!1632 = !DILocation(line: 1380, column: 26, scope: !1622)
!1633 = !DILocation(line: 1380, column: 25, scope: !1622)
!1634 = !DILocation(line: 1380, column: 42, scope: !1622)
!1635 = !DILocation(line: 1380, column: 51, scope: !1622)
!1636 = !DILocation(line: 1380, column: 50, scope: !1622)
!1637 = !DILocation(line: 1380, column: 39, scope: !1622)
!1638 = !DILocation(line: 1380, column: 13, scope: !1622)
!1639 = !DILocation(line: 1381, column: 11, scope: !1622)
!1640 = !DILocation(line: 1381, column: 4, scope: !1622)
!1641 = !DILocation(line: 1384, column: 1, scope: !1539)
!1642 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !66, file: !66, line: 1401, type: !1643, scopeLine: 1402, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1643 = !DISubroutineType(types: !1644)
!1644 = !{!74, !74, !74}
!1645 = !DILocalVariable(name: "numerator", arg: 1, scope: !1642, file: !66, line: 1401, type: !74)
!1646 = !DILocation(line: 1401, column: 25, scope: !1642)
!1647 = !DILocalVariable(name: "denominator", arg: 2, scope: !1642, file: !66, line: 1401, type: !74)
!1648 = !DILocation(line: 1401, column: 40, scope: !1642)
!1649 = !DILocalVariable(name: "s32Temp1", scope: !1642, file: !66, line: 1403, type: !74)
!1650 = !DILocation(line: 1403, column: 6, scope: !1642)
!1651 = !DILocalVariable(name: "s32Temp2", scope: !1642, file: !66, line: 1403, type: !74)
!1652 = !DILocation(line: 1403, column: 20, scope: !1642)
!1653 = !DILocalVariable(name: "denominator_prime", scope: !1642, file: !66, line: 1404, type: !479)
!1654 = !DILocation(line: 1404, column: 6, scope: !1642)
!1655 = !DILocalVariable(name: "u32Temp1", scope: !1642, file: !66, line: 1404, type: !479)
!1656 = !DILocation(line: 1404, column: 29, scope: !1642)
!1657 = !DILocalVariable(name: "u32Temp2", scope: !1642, file: !66, line: 1404, type: !479)
!1658 = !DILocation(line: 1404, column: 43, scope: !1642)
!1659 = !DILocalVariable(name: "u32numerator", scope: !1642, file: !66, line: 1405, type: !479)
!1660 = !DILocation(line: 1405, column: 6, scope: !1642)
!1661 = !DILocalVariable(name: "u32denominator", scope: !1642, file: !66, line: 1405, type: !479)
!1662 = !DILocation(line: 1405, column: 23, scope: !1642)
!1663 = !DILocation(line: 1406, column: 5, scope: !1664)
!1664 = distinct !DILexicalBlock(scope: !1642, file: !66, line: 1406, column: 5)
!1665 = !DILocation(line: 1406, column: 15, scope: !1664)
!1666 = !DILocation(line: 1406, column: 5, scope: !1642)
!1667 = !DILocation(line: 1408, column: 6, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1669, file: !66, line: 1408, column: 6)
!1669 = distinct !DILexicalBlock(scope: !1664, file: !66, line: 1407, column: 2)
!1670 = !DILocation(line: 1408, column: 18, scope: !1668)
!1671 = !DILocation(line: 1408, column: 6, scope: !1669)
!1672 = !DILocation(line: 1410, column: 7, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1674, file: !66, line: 1410, column: 7)
!1674 = distinct !DILexicalBlock(scope: !1668, file: !66, line: 1409, column: 3)
!1675 = !DILocation(line: 1410, column: 19, scope: !1673)
!1676 = !DILocation(line: 1410, column: 7, scope: !1674)
!1677 = !DILocation(line: 1412, column: 5, scope: !1678)
!1678 = distinct !DILexicalBlock(scope: !1673, file: !66, line: 1411, column: 4)
!1679 = !DILocation(line: 1416, column: 21, scope: !1680)
!1680 = distinct !DILexicalBlock(scope: !1673, file: !66, line: 1415, column: 4)
!1681 = !DILocation(line: 1416, column: 20, scope: !1680)
!1682 = !DILocation(line: 1416, column: 18, scope: !1680)
!1683 = !DILocation(line: 1417, column: 23, scope: !1680)
!1684 = !DILocation(line: 1417, column: 22, scope: !1680)
!1685 = !DILocation(line: 1417, column: 20, scope: !1680)
!1686 = !DILocation(line: 1418, column: 16, scope: !1680)
!1687 = !DILocation(line: 1418, column: 33, scope: !1680)
!1688 = !DILocation(line: 1418, column: 46, scope: !1680)
!1689 = !DILocation(line: 1418, column: 45, scope: !1680)
!1690 = !DILocation(line: 1418, column: 64, scope: !1680)
!1691 = !DILocation(line: 1418, column: 62, scope: !1680)
!1692 = !DILocation(line: 1418, column: 29, scope: !1680)
!1693 = !DILocation(line: 1418, column: 81, scope: !1680)
!1694 = !DILocation(line: 1418, column: 14, scope: !1680)
!1695 = !DILocation(line: 1419, column: 17, scope: !1680)
!1696 = !DILocation(line: 1419, column: 30, scope: !1680)
!1697 = !DILocation(line: 1419, column: 29, scope: !1680)
!1698 = !DILocation(line: 1419, column: 49, scope: !1680)
!1699 = !DILocation(line: 1419, column: 58, scope: !1680)
!1700 = !DILocation(line: 1419, column: 57, scope: !1680)
!1701 = !DILocation(line: 1419, column: 46, scope: !1680)
!1702 = !DILocation(line: 1419, column: 14, scope: !1680)
!1703 = !DILocation(line: 1420, column: 8, scope: !1704)
!1704 = distinct !DILexicalBlock(scope: !1680, file: !66, line: 1420, column: 8)
!1705 = !DILocation(line: 1420, column: 17, scope: !1704)
!1706 = !DILocation(line: 1420, column: 8, scope: !1680)
!1707 = !DILocation(line: 1422, column: 13, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1704, file: !66, line: 1421, column: 5)
!1709 = !DILocation(line: 1422, column: 6, scope: !1708)
!1710 = !DILocation(line: 1426, column: 6, scope: !1711)
!1711 = distinct !DILexicalBlock(scope: !1704, file: !66, line: 1425, column: 5)
!1712 = !DILocation(line: 1432, column: 20, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1668, file: !66, line: 1431, column: 3)
!1714 = !DILocation(line: 1432, column: 19, scope: !1713)
!1715 = !DILocation(line: 1432, column: 29, scope: !1713)
!1716 = !DILocation(line: 1432, column: 17, scope: !1713)
!1717 = !DILocation(line: 1433, column: 16, scope: !1713)
!1718 = !DILocation(line: 1433, column: 33, scope: !1713)
!1719 = !DILocation(line: 1433, column: 46, scope: !1713)
!1720 = !DILocation(line: 1433, column: 45, scope: !1713)
!1721 = !DILocation(line: 1433, column: 61, scope: !1713)
!1722 = !DILocation(line: 1433, column: 59, scope: !1713)
!1723 = !DILocation(line: 1433, column: 29, scope: !1713)
!1724 = !DILocation(line: 1433, column: 75, scope: !1713)
!1725 = !DILocation(line: 1433, column: 13, scope: !1713)
!1726 = !DILocation(line: 1434, column: 16, scope: !1713)
!1727 = !DILocation(line: 1434, column: 29, scope: !1713)
!1728 = !DILocation(line: 1434, column: 28, scope: !1713)
!1729 = !DILocation(line: 1434, column: 45, scope: !1713)
!1730 = !DILocation(line: 1434, column: 54, scope: !1713)
!1731 = !DILocation(line: 1434, column: 53, scope: !1713)
!1732 = !DILocation(line: 1434, column: 42, scope: !1713)
!1733 = !DILocation(line: 1434, column: 13, scope: !1713)
!1734 = !DILocation(line: 1435, column: 13, scope: !1713)
!1735 = !DILocation(line: 1435, column: 12, scope: !1713)
!1736 = !DILocation(line: 1435, column: 22, scope: !1713)
!1737 = !DILocation(line: 1435, column: 4, scope: !1713)
!1738 = !DILocation(line: 1440, column: 6, scope: !1739)
!1739 = distinct !DILexicalBlock(scope: !1740, file: !66, line: 1440, column: 6)
!1740 = distinct !DILexicalBlock(scope: !1664, file: !66, line: 1439, column: 2)
!1741 = !DILocation(line: 1440, column: 18, scope: !1739)
!1742 = !DILocation(line: 1440, column: 6, scope: !1740)
!1743 = !DILocation(line: 1442, column: 7, scope: !1744)
!1744 = distinct !DILexicalBlock(scope: !1745, file: !66, line: 1442, column: 7)
!1745 = distinct !DILexicalBlock(scope: !1739, file: !66, line: 1441, column: 3)
!1746 = !DILocation(line: 1442, column: 19, scope: !1744)
!1747 = !DILocation(line: 1442, column: 7, scope: !1745)
!1748 = !DILocation(line: 1444, column: 5, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !1744, file: !66, line: 1443, column: 4)
!1750 = !DILocation(line: 1448, column: 23, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1744, file: !66, line: 1447, column: 4)
!1752 = !DILocation(line: 1448, column: 22, scope: !1751)
!1753 = !DILocation(line: 1448, column: 35, scope: !1751)
!1754 = !DILocation(line: 1448, column: 20, scope: !1751)
!1755 = !DILocation(line: 1449, column: 17, scope: !1751)
!1756 = !DILocation(line: 1449, column: 31, scope: !1751)
!1757 = !DILocation(line: 1449, column: 41, scope: !1751)
!1758 = !DILocation(line: 1449, column: 40, scope: !1751)
!1759 = !DILocation(line: 1449, column: 59, scope: !1751)
!1760 = !DILocation(line: 1449, column: 57, scope: !1751)
!1761 = !DILocation(line: 1449, column: 27, scope: !1751)
!1762 = !DILocation(line: 1449, column: 76, scope: !1751)
!1763 = !DILocation(line: 1449, column: 14, scope: !1751)
!1764 = !DILocation(line: 1450, column: 17, scope: !1751)
!1765 = !DILocation(line: 1450, column: 27, scope: !1751)
!1766 = !DILocation(line: 1450, column: 26, scope: !1751)
!1767 = !DILocation(line: 1450, column: 46, scope: !1751)
!1768 = !DILocation(line: 1450, column: 55, scope: !1751)
!1769 = !DILocation(line: 1450, column: 54, scope: !1751)
!1770 = !DILocation(line: 1450, column: 43, scope: !1751)
!1771 = !DILocation(line: 1450, column: 14, scope: !1751)
!1772 = !DILocation(line: 1451, column: 14, scope: !1751)
!1773 = !DILocation(line: 1451, column: 13, scope: !1751)
!1774 = !DILocation(line: 1451, column: 23, scope: !1751)
!1775 = !DILocation(line: 1451, column: 5, scope: !1751)
!1776 = !DILocation(line: 1456, column: 16, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1739, file: !66, line: 1455, column: 3)
!1778 = !DILocation(line: 1456, column: 30, scope: !1777)
!1779 = !DILocation(line: 1456, column: 40, scope: !1777)
!1780 = !DILocation(line: 1456, column: 39, scope: !1777)
!1781 = !DILocation(line: 1456, column: 55, scope: !1777)
!1782 = !DILocation(line: 1456, column: 53, scope: !1777)
!1783 = !DILocation(line: 1456, column: 26, scope: !1777)
!1784 = !DILocation(line: 1456, column: 69, scope: !1777)
!1785 = !DILocation(line: 1456, column: 13, scope: !1777)
!1786 = !DILocation(line: 1457, column: 16, scope: !1777)
!1787 = !DILocation(line: 1457, column: 26, scope: !1777)
!1788 = !DILocation(line: 1457, column: 25, scope: !1777)
!1789 = !DILocation(line: 1457, column: 42, scope: !1777)
!1790 = !DILocation(line: 1457, column: 51, scope: !1777)
!1791 = !DILocation(line: 1457, column: 50, scope: !1777)
!1792 = !DILocation(line: 1457, column: 39, scope: !1777)
!1793 = !DILocation(line: 1457, column: 13, scope: !1777)
!1794 = !DILocation(line: 1458, column: 11, scope: !1777)
!1795 = !DILocation(line: 1458, column: 4, scope: !1777)
!1796 = !DILocation(line: 1461, column: 1, scope: !1642)
!1797 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !66, file: !66, line: 1479, type: !1798, scopeLine: 1480, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1798 = !DISubroutineType(types: !1799)
!1799 = !{!6, !74, !479}
!1800 = !DILocalVariable(name: "numerator", arg: 1, scope: !1797, file: !66, line: 1479, type: !74)
!1801 = !DILocation(line: 1479, column: 25, scope: !1797)
!1802 = !DILocalVariable(name: "denominator", arg: 2, scope: !1797, file: !66, line: 1479, type: !479)
!1803 = !DILocation(line: 1479, column: 40, scope: !1797)
!1804 = !DILocalVariable(name: "numerator_prime", scope: !1797, file: !66, line: 1482, type: !479)
!1805 = !DILocation(line: 1482, column: 6, scope: !1797)
!1806 = !DILocalVariable(name: "u32Temp1", scope: !1797, file: !66, line: 1482, type: !479)
!1807 = !DILocation(line: 1482, column: 27, scope: !1797)
!1808 = !DILocalVariable(name: "u32Temp2", scope: !1797, file: !66, line: 1482, type: !479)
!1809 = !DILocation(line: 1482, column: 41, scope: !1797)
!1810 = !DILocalVariable(name: "u32Temp3", scope: !1797, file: !66, line: 1482, type: !479)
!1811 = !DILocation(line: 1482, column: 55, scope: !1797)
!1812 = !DILocalVariable(name: "s32Temp1", scope: !1797, file: !66, line: 1483, type: !74)
!1813 = !DILocation(line: 1483, column: 6, scope: !1797)
!1814 = !DILocalVariable(name: "s32Temp2", scope: !1797, file: !66, line: 1483, type: !74)
!1815 = !DILocation(line: 1483, column: 20, scope: !1797)
!1816 = !DILocalVariable(name: "s32Temp3", scope: !1797, file: !66, line: 1483, type: !74)
!1817 = !DILocation(line: 1483, column: 34, scope: !1797)
!1818 = !DILocation(line: 1484, column: 5, scope: !1819)
!1819 = distinct !DILexicalBlock(scope: !1797, file: !66, line: 1484, column: 5)
!1820 = !DILocation(line: 1484, column: 17, scope: !1819)
!1821 = !DILocation(line: 1484, column: 5, scope: !1797)
!1822 = !DILocation(line: 1486, column: 6, scope: !1823)
!1823 = distinct !DILexicalBlock(scope: !1824, file: !66, line: 1486, column: 6)
!1824 = distinct !DILexicalBlock(scope: !1819, file: !66, line: 1485, column: 2)
!1825 = !DILocation(line: 1486, column: 15, scope: !1823)
!1826 = !DILocation(line: 1486, column: 6, scope: !1824)
!1827 = !DILocation(line: 1488, column: 4, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1823, file: !66, line: 1487, column: 3)
!1829 = !DILocation(line: 1492, column: 4, scope: !1830)
!1830 = distinct !DILexicalBlock(scope: !1823, file: !66, line: 1491, column: 3)
!1831 = !DILocation(line: 1497, column: 6, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !1833, file: !66, line: 1497, column: 6)
!1833 = distinct !DILexicalBlock(scope: !1819, file: !66, line: 1496, column: 2)
!1834 = !DILocation(line: 1497, column: 16, scope: !1832)
!1835 = !DILocation(line: 1497, column: 6, scope: !1833)
!1836 = !DILocation(line: 1499, column: 23, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1832, file: !66, line: 1498, column: 3)
!1838 = !DILocation(line: 1499, column: 22, scope: !1837)
!1839 = !DILocation(line: 1499, column: 20, scope: !1837)
!1840 = !DILocation(line: 1500, column: 16, scope: !1837)
!1841 = !DILocation(line: 1500, column: 32, scope: !1837)
!1842 = !DILocation(line: 1500, column: 31, scope: !1837)
!1843 = !DILocation(line: 1500, column: 13, scope: !1837)
!1844 = !DILocation(line: 1501, column: 15, scope: !1837)
!1845 = !DILocation(line: 1501, column: 34, scope: !1837)
!1846 = !DILocation(line: 1501, column: 45, scope: !1837)
!1847 = !DILocation(line: 1501, column: 43, scope: !1837)
!1848 = !DILocation(line: 1501, column: 31, scope: !1837)
!1849 = !DILocation(line: 1501, column: 13, scope: !1837)
!1850 = !DILocation(line: 1503, column: 8, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1837, file: !66, line: 1503, column: 7)
!1852 = !DILocation(line: 1503, column: 20, scope: !1851)
!1853 = !DILocation(line: 1503, column: 27, scope: !1851)
!1854 = !DILocation(line: 1503, column: 7, scope: !1837)
!1855 = !DILocation(line: 1505, column: 19, scope: !1856)
!1856 = distinct !DILexicalBlock(scope: !1851, file: !66, line: 1504, column: 4)
!1857 = !DILocation(line: 1505, column: 31, scope: !1856)
!1858 = !DILocation(line: 1505, column: 17, scope: !1856)
!1859 = !DILocation(line: 1506, column: 4, scope: !1856)
!1860 = !DILocation(line: 1509, column: 20, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1851, file: !66, line: 1508, column: 4)
!1862 = !DILocation(line: 1509, column: 32, scope: !1861)
!1863 = !DILocation(line: 1509, column: 38, scope: !1861)
!1864 = !DILocation(line: 1509, column: 17, scope: !1861)
!1865 = !DILocation(line: 1512, column: 7, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1837, file: !66, line: 1512, column: 7)
!1867 = !DILocation(line: 1512, column: 18, scope: !1866)
!1868 = !DILocation(line: 1512, column: 16, scope: !1866)
!1869 = !DILocation(line: 1512, column: 7, scope: !1837)
!1870 = !DILocation(line: 1514, column: 18, scope: !1871)
!1871 = distinct !DILexicalBlock(scope: !1866, file: !66, line: 1513, column: 4)
!1872 = !DILocation(line: 1514, column: 16, scope: !1871)
!1873 = !DILocation(line: 1514, column: 28, scope: !1871)
!1874 = !DILocation(line: 1514, column: 14, scope: !1871)
!1875 = !DILocation(line: 1515, column: 4, scope: !1871)
!1876 = !DILocation(line: 1518, column: 18, scope: !1877)
!1877 = distinct !DILexicalBlock(scope: !1866, file: !66, line: 1517, column: 4)
!1878 = !DILocation(line: 1518, column: 26, scope: !1877)
!1879 = !DILocation(line: 1518, column: 16, scope: !1877)
!1880 = !DILocation(line: 1518, column: 30, scope: !1877)
!1881 = !DILocation(line: 1518, column: 14, scope: !1877)
!1882 = !DILocation(line: 1520, column: 8, scope: !1883)
!1883 = distinct !DILexicalBlock(scope: !1837, file: !66, line: 1520, column: 7)
!1884 = !DILocation(line: 1520, column: 18, scope: !1883)
!1885 = !DILocation(line: 1520, column: 7, scope: !1837)
!1886 = !DILocation(line: 1522, column: 18, scope: !1887)
!1887 = distinct !DILexicalBlock(scope: !1883, file: !66, line: 1521, column: 4)
!1888 = !DILocation(line: 1522, column: 12, scope: !1887)
!1889 = !DILocation(line: 1522, column: 5, scope: !1887)
!1890 = !DILocation(line: 1526, column: 5, scope: !1891)
!1891 = distinct !DILexicalBlock(scope: !1883, file: !66, line: 1525, column: 4)
!1892 = !DILocation(line: 1531, column: 16, scope: !1893)
!1893 = distinct !DILexicalBlock(scope: !1832, file: !66, line: 1530, column: 3)
!1894 = !DILocation(line: 1531, column: 26, scope: !1893)
!1895 = !DILocation(line: 1531, column: 25, scope: !1893)
!1896 = !DILocation(line: 1531, column: 41, scope: !1893)
!1897 = !DILocation(line: 1531, column: 39, scope: !1893)
!1898 = !DILocation(line: 1531, column: 13, scope: !1893)
!1899 = !DILocation(line: 1532, column: 16, scope: !1893)
!1900 = !DILocation(line: 1532, column: 30, scope: !1893)
!1901 = !DILocation(line: 1532, column: 40, scope: !1893)
!1902 = !DILocation(line: 1532, column: 39, scope: !1893)
!1903 = !DILocation(line: 1532, column: 55, scope: !1893)
!1904 = !DILocation(line: 1532, column: 53, scope: !1893)
!1905 = !DILocation(line: 1532, column: 26, scope: !1893)
!1906 = !DILocation(line: 1532, column: 68, scope: !1893)
!1907 = !DILocation(line: 1532, column: 13, scope: !1893)
!1908 = !DILocation(line: 1533, column: 16, scope: !1893)
!1909 = !DILocation(line: 1533, column: 25, scope: !1893)
!1910 = !DILocation(line: 1533, column: 24, scope: !1893)
!1911 = !DILocation(line: 1533, column: 41, scope: !1893)
!1912 = !DILocation(line: 1533, column: 51, scope: !1893)
!1913 = !DILocation(line: 1533, column: 50, scope: !1893)
!1914 = !DILocation(line: 1533, column: 38, scope: !1893)
!1915 = !DILocation(line: 1533, column: 13, scope: !1893)
!1916 = !DILocation(line: 1534, column: 7, scope: !1917)
!1917 = distinct !DILexicalBlock(scope: !1893, file: !66, line: 1534, column: 7)
!1918 = !DILocation(line: 1534, column: 16, scope: !1917)
!1919 = !DILocation(line: 1534, column: 7, scope: !1893)
!1920 = !DILocation(line: 1536, column: 17, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1917, file: !66, line: 1535, column: 4)
!1922 = !DILocation(line: 1536, column: 12, scope: !1921)
!1923 = !DILocation(line: 1536, column: 5, scope: !1921)
!1924 = !DILocation(line: 1540, column: 5, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1917, file: !66, line: 1539, column: 4)
!1926 = !DILocation(line: 1544, column: 1, scope: !1797)
!1927 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1928, file: !1928, line: 12, type: !1929, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !34, retainedNodes: !1932)
!1928 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1929 = !DISubroutineType(types: !1930)
!1930 = !{null, !1931}
!1931 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1932 = !{!1933}
!1933 = !DILocalVariable(name: "z", arg: 1, scope: !1927, file: !1928, line: 12, type: !1931)
!1934 = !DILocation(line: 0, scope: !1927)
!1935 = !DILocation(line: 13, column: 9, scope: !1936)
!1936 = distinct !DILexicalBlock(scope: !1927, file: !1928, line: 13, column: 7)
!1937 = !DILocation(line: 13, column: 7, scope: !1927)
!1938 = !DILocation(line: 14, column: 5, scope: !1936)
!1939 = !DILocation(line: 15, column: 1, scope: !1927)
!1940 = distinct !DISubprogram(name: "klee_overshift_check", scope: !1941, file: !1941, line: 20, type: !1942, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1945)
!1941 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!1942 = !DISubroutineType(types: !1943)
!1943 = !{null, !1944, !1944}
!1944 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!1945 = !{!1946, !1947}
!1946 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !1940, file: !1941, line: 20, type: !1944)
!1947 = !DILocalVariable(name: "shift", arg: 2, scope: !1940, file: !1941, line: 20, type: !1944)
!1948 = !DILocation(line: 0, scope: !1940)
!1949 = !DILocation(line: 21, column: 13, scope: !1950)
!1950 = distinct !DILexicalBlock(scope: !1940, file: !1941, line: 21, column: 7)
!1951 = !DILocation(line: 21, column: 7, scope: !1940)
!1952 = !DILocation(line: 27, column: 5, scope: !1953)
!1953 = distinct !DILexicalBlock(scope: !1950, file: !1941, line: 21, column: 26)
!1954 = !DILocation(line: 29, column: 1, scope: !1940)
