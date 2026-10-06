; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u32_div_s32_s32/alarm_0142/build/u32_div_s32_s32_alarm_0142.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [132 x i8] c"KLEE-ALARM-0142: signed overflow. assert (s32)(numerator - (s32)((s32)(numerator / denominator) * denominator)) << 1 <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0142.err\00", align 1
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
  %call = call i32 @u32_div_s32_s32(i32 %2, i32 %3), !dbg !64
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
  br i1 %cmp4, label %if.then5, label %if.else32, !dbg !1276

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
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1294
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1295
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1296
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1296
  %div = sdiv i32 %6, %7, !dbg !1296, !klee.check.div !106
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1297
  %mul = mul nsw i32 %div, %8, !dbg !1298
  %sub = sub nsw i32 %5, %mul, !dbg !1299
  %conv = sext i32 %sub to i64, !dbg !1300
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv), !dbg !1301
  %tobool = icmp ne i32 %call, 0, !dbg !1301
  br i1 %tobool, label %if.end, label %if.then12, !dbg !1302

if.then12:                                        ; preds = %if.else11
  store i32 0, i32* %retval, align 4, !dbg !1303
  br label %return, !dbg !1303

if.end:                                           ; preds = %if.else11
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1305
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1307
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1308
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1308
  %div13 = sdiv i32 %9, %10, !dbg !1308, !klee.check.div !106
  %conv14 = sext i32 %div13 to i64, !dbg !1309
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1310
  %conv15 = sext i32 %11 to i64, !dbg !1311
  %call16 = call i32 @klee_alarm_s32_mul_upper(i64 %conv14, i64 %conv15), !dbg !1312
  %tobool17 = icmp ne i32 %call16, 0, !dbg !1312
  br i1 %tobool17, label %if.end19, label %if.then18, !dbg !1313

if.then18:                                        ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !1314
  br label %return, !dbg !1314

if.end19:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1316
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1318
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1319
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !1320
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1320
  %div20 = sdiv i32 %13, %14, !dbg !1320, !klee.check.div !106
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1321
  %mul21 = mul nsw i32 %div20, %15, !dbg !1322
  %sub22 = sub nsw i32 %12, %mul21, !dbg !1323
  %conv23 = sext i32 %sub22 to i64, !dbg !1324
  %call24 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv23, i32 1), !dbg !1325
  %tobool25 = icmp ne i32 %call24, 0, !dbg !1325
  br i1 %tobool25, label %if.end27, label %if.then26, !dbg !1326

if.then26:                                        ; preds = %if.end19
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 1180, i8* getelementptr inbounds ([132 x i8], [132 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !1327
  unreachable, !dbg !1327

if.end27:                                         ; preds = %if.end19
  %16 = load i32, i32* %numerator.addr, align 4, !dbg !1329
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1330
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1331
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1332
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1332
  %div28 = sdiv i32 %17, %18, !dbg !1332, !klee.check.div !106
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1333
  %mul29 = mul nsw i32 %div28, %19, !dbg !1334
  %sub30 = sub nsw i32 %16, %mul29, !dbg !1335
  %shl = shl i32 %sub30, 1, !dbg !1336
  %conv31 = sext i32 %shl to i64, !dbg !1337
  store volatile i64 %conv31, i64* @klee_alarm_sink_s64, align 8, !dbg !1338
  store i32 0, i32* %retval, align 4, !dbg !1339
  br label %return, !dbg !1339

if.else32:                                        ; preds = %if.else3
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1340
  %cmp33 = icmp sgt i32 %20, 0, !dbg !1343
  br i1 %cmp33, label %if.then35, label %if.else36, !dbg !1344

if.then35:                                        ; preds = %if.else32
  store i32 0, i32* %retval, align 4, !dbg !1345
  br label %return, !dbg !1345

if.else36:                                        ; preds = %if.else32
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1347
  %sub37 = sub nsw i32 0, %21, !dbg !1349
  store i32 %sub37, i32* %numerator.addr, align 4, !dbg !1350
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1351
  %sub38 = sub nsw i32 0, %22, !dbg !1352
  store i32 %sub38, i32* %denominator.addr, align 4, !dbg !1353
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1354
  %24 = load i32, i32* %numerator.addr, align 4, !dbg !1355
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1356
  %int_cast_to_i644 = zext i32 %25 to i64, !dbg !1357
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1357
  %div39 = sdiv i32 %24, %25, !dbg !1357, !klee.check.div !106
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1358
  %mul40 = mul nsw i32 %div39, %26, !dbg !1359
  %sub41 = sub nsw i32 %23, %mul40, !dbg !1360
  %shl42 = shl i32 %sub41, 1, !dbg !1361
  store i32 %shl42, i32* %u32Temp1, align 4, !dbg !1362
  %27 = load i32, i32* %u32Temp1, align 4, !dbg !1363
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1364
  %int_cast_to_i645 = zext i32 %28 to i64, !dbg !1365
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1365
  %div43 = udiv i32 %27, %28, !dbg !1365, !klee.check.div !106
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1366
  %30 = load i32, i32* %denominator.addr, align 4, !dbg !1367
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1368
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1368
  %div44 = sdiv i32 %29, %30, !dbg !1368, !klee.check.div !106
  %add = add i32 %div43, %div44, !dbg !1369
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1370
  %31 = load i32, i32* %u32Temp2, align 4, !dbg !1371
  store i32 %31, i32* %retval, align 4, !dbg !1372
  br label %return, !dbg !1372

return:                                           ; preds = %if.else36, %if.then35, %if.end27, %if.then18, %if.then12, %if.then10, %if.then7, %if.else, %if.then2
  %32 = load i32, i32* %retval, align 4, !dbg !1373
  ret i32 %32, !dbg !1373
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !1374 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1377, metadata !DIExpression()), !dbg !1378
  %0 = load i64, i64* %left.addr, align 8, !dbg !1379
  %cmp = icmp sge i64 %0, 0, !dbg !1380
  %conv = zext i1 %cmp to i32, !dbg !1380
  ret i32 %conv, !dbg !1381
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !1382 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1385, metadata !DIExpression()), !dbg !1386
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1387, metadata !DIExpression()), !dbg !1388
  %0 = load i64, i64* %left.addr, align 8, !dbg !1389
  %1 = load i64, i64* %right.addr, align 8, !dbg !1390
  %mul = mul nsw i64 %0, %1, !dbg !1391
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !1392
  %conv = zext i1 %cmp to i32, !dbg !1392
  ret i32 %conv, !dbg !1393
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !1394 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1397, metadata !DIExpression()), !dbg !1398
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1399, metadata !DIExpression()), !dbg !1400
  %0 = load i32, i32* %count.addr, align 4, !dbg !1401
  %cmp = icmp uge i32 %0, 63, !dbg !1403
  br i1 %cmp, label %if.then, label %if.end, !dbg !1404

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1405
  br label %return, !dbg !1405

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !1407
  %2 = load i32, i32* %count.addr, align 4, !dbg !1408
  %sh_prom = zext i32 %2 to i64, !dbg !1409
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !1409
  %shl = shl i64 1, %sh_prom, !dbg !1409, !klee.check.shift !106
  %mul = mul nsw i64 %1, %shl, !dbg !1410
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !1411
  %conv = zext i1 %cmp1 to i32, !dbg !1411
  store i32 %conv, i32* %retval, align 4, !dbg !1412
  br label %return, !dbg !1412

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !1413
  ret i32 %3, !dbg !1413
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

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

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !1958 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1964, metadata !DIExpression()), !dbg !1966
  call void @llvm.dbg.value(metadata i64 %1, metadata !1965, metadata !DIExpression()), !dbg !1966
  %3 = icmp ult i64 %1, %0, !dbg !1967
  br i1 %3, label %5, label %4, !dbg !1969

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !1970
  unreachable, !dbg !1970

5:                                                ; preds = %2
  ret void, !dbg !1972
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u32_div_s32_s32/alarm_0142/div_Ccode_alarm_0142.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u32_div_s32_s32/alarm_0142")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25, !29}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u32_div_s32_s32/alarm_0142")
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
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u32_div_s32_s32/alarm_0142")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u32_div_s32_s32/alarm_0142/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u32_div_s32_s32/alarm_0142")
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
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u32_div_s32_s32/alarm_0142")
!50 = !DISubroutineType(types: !51)
!51 = !{!28}
!52 = !DILocalVariable(name: "numerator", scope: !48, file: !49, line: 9, type: !26)
!53 = !DILocation(line: 9, column: 13, scope: !48)
!54 = !DILocalVariable(name: "denominator", scope: !48, file: !49, line: 10, type: !26)
!55 = !DILocation(line: 10, column: 13, scope: !48)
!56 = !DILocalVariable(name: "result", scope: !48, file: !49, line: 11, type: !29)
!57 = !DILocation(line: 11, column: 14, scope: !48)
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
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u32_div_s32_s32/alarm_0142")
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
!1291 = !DILocation(line: 1169, column: 66, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1293, file: !69, line: 1169, column: 10)
!1293 = distinct !DILexicalBlock(scope: !1285, file: !69, line: 1167, column: 5)
!1294 = !DILocation(line: 1169, column: 90, scope: !1292)
!1295 = !DILocation(line: 1169, column: 102, scope: !1292)
!1296 = !DILocation(line: 1169, column: 100, scope: !1292)
!1297 = !DILocation(line: 1169, column: 117, scope: !1292)
!1298 = !DILocation(line: 1169, column: 115, scope: !1292)
!1299 = !DILocation(line: 1169, column: 76, scope: !1292)
!1300 = !DILocation(line: 1169, column: 50, scope: !1292)
!1301 = !DILocation(line: 1169, column: 12, scope: !1292)
!1302 = !DILocation(line: 1169, column: 10, scope: !1293)
!1303 = !DILocation(line: 1170, column: 10, scope: !1304)
!1304 = distinct !DILexicalBlock(scope: !1292, file: !69, line: 1169, column: 135)
!1305 = !DILocation(line: 1173, column: 53, scope: !1306)
!1306 = distinct !DILexicalBlock(scope: !1293, file: !69, line: 1173, column: 10)
!1307 = !DILocation(line: 1173, column: 65, scope: !1306)
!1308 = !DILocation(line: 1173, column: 63, scope: !1306)
!1309 = !DILocation(line: 1173, column: 37, scope: !1306)
!1310 = !DILocation(line: 1173, column: 90, scope: !1306)
!1311 = !DILocation(line: 1173, column: 80, scope: !1306)
!1312 = !DILocation(line: 1173, column: 12, scope: !1306)
!1313 = !DILocation(line: 1173, column: 10, scope: !1293)
!1314 = !DILocation(line: 1174, column: 10, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1306, file: !69, line: 1173, column: 106)
!1316 = !DILocation(line: 1177, column: 56, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1293, file: !69, line: 1177, column: 10)
!1318 = !DILocation(line: 1177, column: 80, scope: !1317)
!1319 = !DILocation(line: 1177, column: 92, scope: !1317)
!1320 = !DILocation(line: 1177, column: 90, scope: !1317)
!1321 = !DILocation(line: 1177, column: 107, scope: !1317)
!1322 = !DILocation(line: 1177, column: 105, scope: !1317)
!1323 = !DILocation(line: 1177, column: 66, scope: !1317)
!1324 = !DILocation(line: 1177, column: 40, scope: !1317)
!1325 = !DILocation(line: 1177, column: 12, scope: !1317)
!1326 = !DILocation(line: 1177, column: 10, scope: !1293)
!1327 = !DILocation(line: 1178, column: 10, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1317, file: !69, line: 1177, column: 140)
!1329 = !DILocation(line: 1185, column: 44, scope: !1293)
!1330 = !DILocation(line: 1185, column: 68, scope: !1293)
!1331 = !DILocation(line: 1185, column: 80, scope: !1293)
!1332 = !DILocation(line: 1185, column: 78, scope: !1293)
!1333 = !DILocation(line: 1185, column: 95, scope: !1293)
!1334 = !DILocation(line: 1185, column: 93, scope: !1293)
!1335 = !DILocation(line: 1185, column: 54, scope: !1293)
!1336 = !DILocation(line: 1185, column: 109, scope: !1293)
!1337 = !DILocation(line: 1185, column: 28, scope: !1293)
!1338 = !DILocation(line: 1185, column: 26, scope: !1293)
!1339 = !DILocation(line: 1186, column: 6, scope: !1293)
!1340 = !DILocation(line: 1194, column: 7, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1342, file: !69, line: 1194, column: 7)
!1342 = distinct !DILexicalBlock(scope: !1273, file: !69, line: 1193, column: 3)
!1343 = !DILocation(line: 1194, column: 19, scope: !1341)
!1344 = !DILocation(line: 1194, column: 7, scope: !1342)
!1345 = !DILocation(line: 1196, column: 5, scope: !1346)
!1346 = distinct !DILexicalBlock(scope: !1341, file: !69, line: 1195, column: 4)
!1347 = !DILocation(line: 1200, column: 18, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !1341, file: !69, line: 1199, column: 4)
!1349 = !DILocation(line: 1200, column: 17, scope: !1348)
!1350 = !DILocation(line: 1200, column: 15, scope: !1348)
!1351 = !DILocation(line: 1201, column: 20, scope: !1348)
!1352 = !DILocation(line: 1201, column: 19, scope: !1348)
!1353 = !DILocation(line: 1201, column: 17, scope: !1348)
!1354 = !DILocation(line: 1202, column: 17, scope: !1348)
!1355 = !DILocation(line: 1202, column: 31, scope: !1348)
!1356 = !DILocation(line: 1202, column: 41, scope: !1348)
!1357 = !DILocation(line: 1202, column: 40, scope: !1348)
!1358 = !DILocation(line: 1202, column: 56, scope: !1348)
!1359 = !DILocation(line: 1202, column: 54, scope: !1348)
!1360 = !DILocation(line: 1202, column: 27, scope: !1348)
!1361 = !DILocation(line: 1202, column: 70, scope: !1348)
!1362 = !DILocation(line: 1202, column: 14, scope: !1348)
!1363 = !DILocation(line: 1203, column: 17, scope: !1348)
!1364 = !DILocation(line: 1203, column: 28, scope: !1348)
!1365 = !DILocation(line: 1203, column: 26, scope: !1348)
!1366 = !DILocation(line: 1203, column: 44, scope: !1348)
!1367 = !DILocation(line: 1203, column: 56, scope: !1348)
!1368 = !DILocation(line: 1203, column: 54, scope: !1348)
!1369 = !DILocation(line: 1203, column: 41, scope: !1348)
!1370 = !DILocation(line: 1203, column: 14, scope: !1348)
!1371 = !DILocation(line: 1204, column: 12, scope: !1348)
!1372 = !DILocation(line: 1204, column: 5, scope: !1348)
!1373 = !DILocation(line: 1209, column: 1, scope: !1248)
!1374 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !1375, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1375 = !DISubroutineType(types: !1376)
!1376 = !{!28, !22}
!1377 = !DILocalVariable(name: "left", arg: 1, scope: !1374, file: !33, line: 84, type: !22)
!1378 = !DILocation(line: 84, column: 51, scope: !1374)
!1379 = !DILocation(line: 86, column: 12, scope: !1374)
!1380 = !DILocation(line: 86, column: 17, scope: !1374)
!1381 = !DILocation(line: 86, column: 5, scope: !1374)
!1382 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !1383, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1383 = !DISubroutineType(types: !1384)
!1384 = !{!28, !22, !22}
!1385 = !DILocalVariable(name: "left", arg: 1, scope: !1382, file: !33, line: 78, type: !22)
!1386 = !DILocation(line: 78, column: 38, scope: !1382)
!1387 = !DILocalVariable(name: "right", arg: 2, scope: !1382, file: !33, line: 78, type: !22)
!1388 = !DILocation(line: 78, column: 52, scope: !1382)
!1389 = !DILocation(line: 80, column: 12, scope: !1382)
!1390 = !DILocation(line: 80, column: 19, scope: !1382)
!1391 = !DILocation(line: 80, column: 17, scope: !1382)
!1392 = !DILocation(line: 80, column: 25, scope: !1382)
!1393 = !DILocation(line: 80, column: 5, scope: !1382)
!1394 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !1395, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1395 = !DISubroutineType(types: !1396)
!1396 = !{!28, !22, !29}
!1397 = !DILocalVariable(name: "left", arg: 1, scope: !1394, file: !33, line: 90, type: !22)
!1398 = !DILocation(line: 90, column: 41, scope: !1394)
!1399 = !DILocalVariable(name: "count", arg: 2, scope: !1394, file: !33, line: 90, type: !29)
!1400 = !DILocation(line: 90, column: 56, scope: !1394)
!1401 = !DILocation(line: 92, column: 9, scope: !1402)
!1402 = distinct !DILexicalBlock(scope: !1394, file: !33, line: 92, column: 9)
!1403 = !DILocation(line: 92, column: 15, scope: !1402)
!1404 = !DILocation(line: 92, column: 9, scope: !1394)
!1405 = !DILocation(line: 93, column: 9, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1402, file: !33, line: 92, column: 32)
!1407 = !DILocation(line: 95, column: 12, scope: !1394)
!1408 = !DILocation(line: 95, column: 34, scope: !1394)
!1409 = !DILocation(line: 95, column: 31, scope: !1394)
!1410 = !DILocation(line: 95, column: 17, scope: !1394)
!1411 = !DILocation(line: 95, column: 41, scope: !1394)
!1412 = !DILocation(line: 95, column: 5, scope: !1394)
!1413 = !DILocation(line: 96, column: 1, scope: !1394)
!1414 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1226, type: !1415, scopeLine: 1227, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1415 = !DISubroutineType(types: !1416)
!1416 = !{!428, !428, !428}
!1417 = !DILocalVariable(name: "numerator", arg: 1, scope: !1414, file: !69, line: 1226, type: !428)
!1418 = !DILocation(line: 1226, column: 25, scope: !1414)
!1419 = !DILocalVariable(name: "denominator", arg: 2, scope: !1414, file: !69, line: 1226, type: !428)
!1420 = !DILocation(line: 1226, column: 40, scope: !1414)
!1421 = !DILocalVariable(name: "u32Temp1", scope: !1414, file: !69, line: 1229, type: !428)
!1422 = !DILocation(line: 1229, column: 6, scope: !1414)
!1423 = !DILocalVariable(name: "u32Temp2", scope: !1414, file: !69, line: 1229, type: !428)
!1424 = !DILocation(line: 1229, column: 20, scope: !1414)
!1425 = !DILocalVariable(name: "u32Temp3", scope: !1414, file: !69, line: 1229, type: !428)
!1426 = !DILocation(line: 1229, column: 34, scope: !1414)
!1427 = !DILocalVariable(name: "numerator_old", scope: !1414, file: !69, line: 1229, type: !428)
!1428 = !DILocation(line: 1229, column: 48, scope: !1414)
!1429 = !DILocation(line: 1230, column: 5, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1414, file: !69, line: 1230, column: 5)
!1431 = !DILocation(line: 1230, column: 16, scope: !1430)
!1432 = !DILocation(line: 1230, column: 5, scope: !1414)
!1433 = !DILocation(line: 1232, column: 3, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1430, file: !69, line: 1231, column: 2)
!1435 = !DILocation(line: 1236, column: 14, scope: !1436)
!1436 = distinct !DILexicalBlock(scope: !1430, file: !69, line: 1235, column: 2)
!1437 = !DILocation(line: 1236, column: 26, scope: !1436)
!1438 = !DILocation(line: 1236, column: 41, scope: !1436)
!1439 = !DILocation(line: 1236, column: 51, scope: !1436)
!1440 = !DILocation(line: 1236, column: 50, scope: !1436)
!1441 = !DILocation(line: 1236, column: 38, scope: !1436)
!1442 = !DILocation(line: 1236, column: 24, scope: !1436)
!1443 = !DILocation(line: 1236, column: 12, scope: !1436)
!1444 = !DILocation(line: 1237, column: 7, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1436, file: !69, line: 1237, column: 6)
!1446 = !DILocation(line: 1237, column: 16, scope: !1445)
!1447 = !DILocation(line: 1237, column: 24, scope: !1445)
!1448 = !DILocation(line: 1237, column: 6, scope: !1436)
!1449 = !DILocation(line: 1239, column: 16, scope: !1450)
!1450 = distinct !DILexicalBlock(scope: !1445, file: !69, line: 1238, column: 3)
!1451 = !DILocation(line: 1239, column: 27, scope: !1450)
!1452 = !DILocation(line: 1239, column: 13, scope: !1450)
!1453 = !DILocation(line: 1240, column: 3, scope: !1450)
!1454 = !DILocation(line: 1243, column: 16, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1445, file: !69, line: 1242, column: 3)
!1456 = !DILocation(line: 1243, column: 27, scope: !1455)
!1457 = !DILocation(line: 1243, column: 32, scope: !1455)
!1458 = !DILocation(line: 1243, column: 13, scope: !1455)
!1459 = !DILocation(line: 1246, column: 6, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1436, file: !69, line: 1246, column: 6)
!1461 = !DILocation(line: 1246, column: 17, scope: !1460)
!1462 = !DILocation(line: 1246, column: 15, scope: !1460)
!1463 = !DILocation(line: 1246, column: 6, scope: !1436)
!1464 = !DILocation(line: 1248, column: 12, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1460, file: !69, line: 1247, column: 3)
!1466 = !DILocation(line: 1248, column: 22, scope: !1465)
!1467 = !DILocation(line: 1248, column: 21, scope: !1465)
!1468 = !DILocation(line: 1248, column: 4, scope: !1465)
!1469 = !DILocation(line: 1252, column: 13, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1460, file: !69, line: 1251, column: 3)
!1471 = !DILocation(line: 1252, column: 23, scope: !1470)
!1472 = !DILocation(line: 1252, column: 22, scope: !1470)
!1473 = !DILocation(line: 1252, column: 36, scope: !1470)
!1474 = !DILocation(line: 1252, column: 4, scope: !1470)
!1475 = !DILocation(line: 1257, column: 1, scope: !1414)
!1476 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1274, type: !1477, scopeLine: 1275, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1477 = !DISubroutineType(types: !1478)
!1478 = !{!25, !428, !25}
!1479 = !DILocalVariable(name: "numerator", arg: 1, scope: !1476, file: !69, line: 1274, type: !428)
!1480 = !DILocation(line: 1274, column: 25, scope: !1476)
!1481 = !DILocalVariable(name: "denominator", arg: 2, scope: !1476, file: !69, line: 1274, type: !25)
!1482 = !DILocation(line: 1274, column: 40, scope: !1476)
!1483 = !DILocalVariable(name: "u32Temp1", scope: !1476, file: !69, line: 1276, type: !428)
!1484 = !DILocation(line: 1276, column: 6, scope: !1476)
!1485 = !DILocalVariable(name: "u32Temp2", scope: !1476, file: !69, line: 1276, type: !428)
!1486 = !DILocation(line: 1276, column: 20, scope: !1476)
!1487 = !DILocation(line: 1277, column: 5, scope: !1488)
!1488 = distinct !DILexicalBlock(scope: !1476, file: !69, line: 1277, column: 5)
!1489 = !DILocation(line: 1277, column: 17, scope: !1488)
!1490 = !DILocation(line: 1277, column: 5, scope: !1476)
!1491 = !DILocation(line: 1279, column: 6, scope: !1492)
!1492 = distinct !DILexicalBlock(scope: !1493, file: !69, line: 1279, column: 6)
!1493 = distinct !DILexicalBlock(scope: !1488, file: !69, line: 1278, column: 2)
!1494 = !DILocation(line: 1279, column: 18, scope: !1492)
!1495 = !DILocation(line: 1279, column: 6, scope: !1493)
!1496 = !DILocation(line: 1281, column: 4, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1492, file: !69, line: 1280, column: 3)
!1498 = !DILocation(line: 1285, column: 19, scope: !1499)
!1499 = distinct !DILexicalBlock(scope: !1492, file: !69, line: 1284, column: 3)
!1500 = !DILocation(line: 1285, column: 18, scope: !1499)
!1501 = !DILocation(line: 1285, column: 16, scope: !1499)
!1502 = !DILocation(line: 1286, column: 16, scope: !1499)
!1503 = !DILocation(line: 1286, column: 30, scope: !1499)
!1504 = !DILocation(line: 1286, column: 40, scope: !1499)
!1505 = !DILocation(line: 1286, column: 39, scope: !1499)
!1506 = !DILocation(line: 1286, column: 55, scope: !1499)
!1507 = !DILocation(line: 1286, column: 53, scope: !1499)
!1508 = !DILocation(line: 1286, column: 26, scope: !1499)
!1509 = !DILocation(line: 1286, column: 69, scope: !1499)
!1510 = !DILocation(line: 1286, column: 13, scope: !1499)
!1511 = !DILocation(line: 1287, column: 16, scope: !1499)
!1512 = !DILocation(line: 1287, column: 25, scope: !1499)
!1513 = !DILocation(line: 1287, column: 24, scope: !1499)
!1514 = !DILocation(line: 1287, column: 41, scope: !1499)
!1515 = !DILocation(line: 1287, column: 51, scope: !1499)
!1516 = !DILocation(line: 1287, column: 50, scope: !1499)
!1517 = !DILocation(line: 1287, column: 38, scope: !1499)
!1518 = !DILocation(line: 1287, column: 13, scope: !1499)
!1519 = !DILocation(line: 1288, column: 7, scope: !1520)
!1520 = distinct !DILexicalBlock(scope: !1499, file: !69, line: 1288, column: 7)
!1521 = !DILocation(line: 1288, column: 16, scope: !1520)
!1522 = !DILocation(line: 1288, column: 7, scope: !1499)
!1523 = !DILocation(line: 1290, column: 13, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1520, file: !69, line: 1289, column: 4)
!1525 = !DILocation(line: 1290, column: 12, scope: !1524)
!1526 = !DILocation(line: 1290, column: 5, scope: !1524)
!1527 = !DILocation(line: 1294, column: 5, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1520, file: !69, line: 1293, column: 4)
!1529 = !DILocation(line: 1300, column: 15, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1488, file: !69, line: 1299, column: 2)
!1531 = !DILocation(line: 1300, column: 29, scope: !1530)
!1532 = !DILocation(line: 1300, column: 39, scope: !1530)
!1533 = !DILocation(line: 1300, column: 38, scope: !1530)
!1534 = !DILocation(line: 1300, column: 54, scope: !1530)
!1535 = !DILocation(line: 1300, column: 52, scope: !1530)
!1536 = !DILocation(line: 1300, column: 25, scope: !1530)
!1537 = !DILocation(line: 1300, column: 68, scope: !1530)
!1538 = !DILocation(line: 1300, column: 12, scope: !1530)
!1539 = !DILocation(line: 1301, column: 15, scope: !1530)
!1540 = !DILocation(line: 1301, column: 24, scope: !1530)
!1541 = !DILocation(line: 1301, column: 23, scope: !1530)
!1542 = !DILocation(line: 1301, column: 40, scope: !1530)
!1543 = !DILocation(line: 1301, column: 50, scope: !1530)
!1544 = !DILocation(line: 1301, column: 49, scope: !1530)
!1545 = !DILocation(line: 1301, column: 37, scope: !1530)
!1546 = !DILocation(line: 1301, column: 12, scope: !1530)
!1547 = !DILocation(line: 1302, column: 6, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1530, file: !69, line: 1302, column: 6)
!1549 = !DILocation(line: 1302, column: 15, scope: !1548)
!1550 = !DILocation(line: 1302, column: 6, scope: !1530)
!1551 = !DILocation(line: 1304, column: 11, scope: !1552)
!1552 = distinct !DILexicalBlock(scope: !1548, file: !69, line: 1303, column: 3)
!1553 = !DILocation(line: 1304, column: 4, scope: !1552)
!1554 = !DILocation(line: 1308, column: 4, scope: !1555)
!1555 = distinct !DILexicalBlock(scope: !1548, file: !69, line: 1307, column: 3)
!1556 = !DILocation(line: 1311, column: 1, scope: !1476)
!1557 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1329, type: !1558, scopeLine: 1330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1558 = !DISubroutineType(types: !1559)
!1559 = !{!25, !25, !428}
!1560 = !DILocalVariable(name: "numerator", arg: 1, scope: !1557, file: !69, line: 1329, type: !25)
!1561 = !DILocation(line: 1329, column: 25, scope: !1557)
!1562 = !DILocalVariable(name: "denominator", arg: 2, scope: !1557, file: !69, line: 1329, type: !428)
!1563 = !DILocation(line: 1329, column: 40, scope: !1557)
!1564 = !DILocalVariable(name: "s32Temp1", scope: !1557, file: !69, line: 1331, type: !25)
!1565 = !DILocation(line: 1331, column: 6, scope: !1557)
!1566 = !DILocalVariable(name: "s32Temp2", scope: !1557, file: !69, line: 1331, type: !25)
!1567 = !DILocation(line: 1331, column: 20, scope: !1557)
!1568 = !DILocalVariable(name: "u32Temp0", scope: !1557, file: !69, line: 1332, type: !428)
!1569 = !DILocation(line: 1332, column: 6, scope: !1557)
!1570 = !DILocalVariable(name: "u32Temp1", scope: !1557, file: !69, line: 1332, type: !428)
!1571 = !DILocation(line: 1332, column: 20, scope: !1557)
!1572 = !DILocalVariable(name: "u32Temp2", scope: !1557, file: !69, line: 1332, type: !428)
!1573 = !DILocation(line: 1332, column: 34, scope: !1557)
!1574 = !DILocation(line: 1333, column: 5, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1557, file: !69, line: 1333, column: 5)
!1576 = !DILocation(line: 1333, column: 17, scope: !1575)
!1577 = !DILocation(line: 1333, column: 5, scope: !1557)
!1578 = !DILocation(line: 1335, column: 6, scope: !1579)
!1579 = distinct !DILexicalBlock(scope: !1580, file: !69, line: 1335, column: 6)
!1580 = distinct !DILexicalBlock(scope: !1575, file: !69, line: 1334, column: 2)
!1581 = !DILocation(line: 1335, column: 16, scope: !1579)
!1582 = !DILocation(line: 1335, column: 6, scope: !1580)
!1583 = !DILocation(line: 1337, column: 4, scope: !1584)
!1584 = distinct !DILexicalBlock(scope: !1579, file: !69, line: 1336, column: 3)
!1585 = !DILocation(line: 1341, column: 4, scope: !1586)
!1586 = distinct !DILexicalBlock(scope: !1579, file: !69, line: 1340, column: 3)
!1587 = !DILocation(line: 1346, column: 6, scope: !1588)
!1588 = distinct !DILexicalBlock(scope: !1589, file: !69, line: 1346, column: 6)
!1589 = distinct !DILexicalBlock(scope: !1575, file: !69, line: 1345, column: 2)
!1590 = !DILocation(line: 1346, column: 16, scope: !1588)
!1591 = !DILocation(line: 1346, column: 6, scope: !1589)
!1592 = !DILocation(line: 1348, column: 16, scope: !1593)
!1593 = distinct !DILexicalBlock(scope: !1588, file: !69, line: 1347, column: 3)
!1594 = !DILocation(line: 1348, column: 15, scope: !1593)
!1595 = !DILocation(line: 1348, column: 13, scope: !1593)
!1596 = !DILocation(line: 1349, column: 16, scope: !1593)
!1597 = !DILocation(line: 1349, column: 25, scope: !1593)
!1598 = !DILocation(line: 1349, column: 24, scope: !1593)
!1599 = !DILocation(line: 1349, column: 13, scope: !1593)
!1600 = !DILocation(line: 1350, column: 15, scope: !1593)
!1601 = !DILocation(line: 1350, column: 28, scope: !1593)
!1602 = !DILocation(line: 1350, column: 37, scope: !1593)
!1603 = !DILocation(line: 1350, column: 36, scope: !1593)
!1604 = !DILocation(line: 1350, column: 52, scope: !1593)
!1605 = !DILocation(line: 1350, column: 50, scope: !1593)
!1606 = !DILocation(line: 1350, column: 24, scope: !1593)
!1607 = !DILocation(line: 1350, column: 13, scope: !1593)
!1608 = !DILocation(line: 1352, column: 8, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1593, file: !69, line: 1352, column: 7)
!1610 = !DILocation(line: 1352, column: 20, scope: !1609)
!1611 = !DILocation(line: 1352, column: 27, scope: !1609)
!1612 = !DILocation(line: 1352, column: 7, scope: !1593)
!1613 = !DILocation(line: 1354, column: 20, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1609, file: !69, line: 1353, column: 4)
!1615 = !DILocation(line: 1354, column: 32, scope: !1614)
!1616 = !DILocation(line: 1354, column: 17, scope: !1614)
!1617 = !DILocation(line: 1355, column: 4, scope: !1614)
!1618 = !DILocation(line: 1358, column: 20, scope: !1619)
!1619 = distinct !DILexicalBlock(scope: !1609, file: !69, line: 1357, column: 4)
!1620 = !DILocation(line: 1358, column: 32, scope: !1619)
!1621 = !DILocation(line: 1358, column: 38, scope: !1619)
!1622 = !DILocation(line: 1358, column: 17, scope: !1619)
!1623 = !DILocation(line: 1362, column: 7, scope: !1624)
!1624 = distinct !DILexicalBlock(scope: !1593, file: !69, line: 1362, column: 7)
!1625 = !DILocation(line: 1362, column: 18, scope: !1624)
!1626 = !DILocation(line: 1362, column: 16, scope: !1624)
!1627 = !DILocation(line: 1362, column: 7, scope: !1593)
!1628 = !DILocation(line: 1364, column: 14, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1624, file: !69, line: 1363, column: 4)
!1630 = !DILocation(line: 1364, column: 13, scope: !1629)
!1631 = !DILocation(line: 1364, column: 23, scope: !1629)
!1632 = !DILocation(line: 1364, column: 5, scope: !1629)
!1633 = !DILocation(line: 1368, column: 14, scope: !1634)
!1634 = distinct !DILexicalBlock(scope: !1624, file: !69, line: 1367, column: 4)
!1635 = !DILocation(line: 1368, column: 23, scope: !1634)
!1636 = !DILocation(line: 1368, column: 12, scope: !1634)
!1637 = !DILocation(line: 1368, column: 27, scope: !1634)
!1638 = !DILocation(line: 1368, column: 5, scope: !1634)
!1639 = !DILocation(line: 1375, column: 16, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1588, file: !69, line: 1374, column: 3)
!1641 = !DILocation(line: 1375, column: 30, scope: !1640)
!1642 = !DILocation(line: 1375, column: 40, scope: !1640)
!1643 = !DILocation(line: 1375, column: 39, scope: !1640)
!1644 = !DILocation(line: 1375, column: 55, scope: !1640)
!1645 = !DILocation(line: 1375, column: 53, scope: !1640)
!1646 = !DILocation(line: 1375, column: 26, scope: !1640)
!1647 = !DILocation(line: 1375, column: 69, scope: !1640)
!1648 = !DILocation(line: 1375, column: 13, scope: !1640)
!1649 = !DILocation(line: 1376, column: 16, scope: !1640)
!1650 = !DILocation(line: 1376, column: 26, scope: !1640)
!1651 = !DILocation(line: 1376, column: 25, scope: !1640)
!1652 = !DILocation(line: 1376, column: 42, scope: !1640)
!1653 = !DILocation(line: 1376, column: 51, scope: !1640)
!1654 = !DILocation(line: 1376, column: 50, scope: !1640)
!1655 = !DILocation(line: 1376, column: 39, scope: !1640)
!1656 = !DILocation(line: 1376, column: 13, scope: !1640)
!1657 = !DILocation(line: 1377, column: 11, scope: !1640)
!1658 = !DILocation(line: 1377, column: 4, scope: !1640)
!1659 = !DILocation(line: 1380, column: 1, scope: !1557)
!1660 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1397, type: !1661, scopeLine: 1398, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1661 = !DISubroutineType(types: !1662)
!1662 = !{!25, !25, !25}
!1663 = !DILocalVariable(name: "numerator", arg: 1, scope: !1660, file: !69, line: 1397, type: !25)
!1664 = !DILocation(line: 1397, column: 25, scope: !1660)
!1665 = !DILocalVariable(name: "denominator", arg: 2, scope: !1660, file: !69, line: 1397, type: !25)
!1666 = !DILocation(line: 1397, column: 40, scope: !1660)
!1667 = !DILocalVariable(name: "s32Temp1", scope: !1660, file: !69, line: 1399, type: !25)
!1668 = !DILocation(line: 1399, column: 6, scope: !1660)
!1669 = !DILocalVariable(name: "s32Temp2", scope: !1660, file: !69, line: 1399, type: !25)
!1670 = !DILocation(line: 1399, column: 20, scope: !1660)
!1671 = !DILocalVariable(name: "denominator_prime", scope: !1660, file: !69, line: 1400, type: !428)
!1672 = !DILocation(line: 1400, column: 6, scope: !1660)
!1673 = !DILocalVariable(name: "u32Temp1", scope: !1660, file: !69, line: 1400, type: !428)
!1674 = !DILocation(line: 1400, column: 29, scope: !1660)
!1675 = !DILocalVariable(name: "u32Temp2", scope: !1660, file: !69, line: 1400, type: !428)
!1676 = !DILocation(line: 1400, column: 43, scope: !1660)
!1677 = !DILocalVariable(name: "u32numerator", scope: !1660, file: !69, line: 1401, type: !428)
!1678 = !DILocation(line: 1401, column: 6, scope: !1660)
!1679 = !DILocalVariable(name: "u32denominator", scope: !1660, file: !69, line: 1401, type: !428)
!1680 = !DILocation(line: 1401, column: 23, scope: !1660)
!1681 = !DILocation(line: 1402, column: 5, scope: !1682)
!1682 = distinct !DILexicalBlock(scope: !1660, file: !69, line: 1402, column: 5)
!1683 = !DILocation(line: 1402, column: 15, scope: !1682)
!1684 = !DILocation(line: 1402, column: 5, scope: !1660)
!1685 = !DILocation(line: 1404, column: 6, scope: !1686)
!1686 = distinct !DILexicalBlock(scope: !1687, file: !69, line: 1404, column: 6)
!1687 = distinct !DILexicalBlock(scope: !1682, file: !69, line: 1403, column: 2)
!1688 = !DILocation(line: 1404, column: 18, scope: !1686)
!1689 = !DILocation(line: 1404, column: 6, scope: !1687)
!1690 = !DILocation(line: 1406, column: 7, scope: !1691)
!1691 = distinct !DILexicalBlock(scope: !1692, file: !69, line: 1406, column: 7)
!1692 = distinct !DILexicalBlock(scope: !1686, file: !69, line: 1405, column: 3)
!1693 = !DILocation(line: 1406, column: 19, scope: !1691)
!1694 = !DILocation(line: 1406, column: 7, scope: !1692)
!1695 = !DILocation(line: 1408, column: 5, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1691, file: !69, line: 1407, column: 4)
!1697 = !DILocation(line: 1412, column: 21, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1691, file: !69, line: 1411, column: 4)
!1699 = !DILocation(line: 1412, column: 20, scope: !1698)
!1700 = !DILocation(line: 1412, column: 18, scope: !1698)
!1701 = !DILocation(line: 1413, column: 23, scope: !1698)
!1702 = !DILocation(line: 1413, column: 22, scope: !1698)
!1703 = !DILocation(line: 1413, column: 20, scope: !1698)
!1704 = !DILocation(line: 1414, column: 16, scope: !1698)
!1705 = !DILocation(line: 1414, column: 33, scope: !1698)
!1706 = !DILocation(line: 1414, column: 46, scope: !1698)
!1707 = !DILocation(line: 1414, column: 45, scope: !1698)
!1708 = !DILocation(line: 1414, column: 64, scope: !1698)
!1709 = !DILocation(line: 1414, column: 62, scope: !1698)
!1710 = !DILocation(line: 1414, column: 29, scope: !1698)
!1711 = !DILocation(line: 1414, column: 81, scope: !1698)
!1712 = !DILocation(line: 1414, column: 14, scope: !1698)
!1713 = !DILocation(line: 1415, column: 17, scope: !1698)
!1714 = !DILocation(line: 1415, column: 30, scope: !1698)
!1715 = !DILocation(line: 1415, column: 29, scope: !1698)
!1716 = !DILocation(line: 1415, column: 49, scope: !1698)
!1717 = !DILocation(line: 1415, column: 58, scope: !1698)
!1718 = !DILocation(line: 1415, column: 57, scope: !1698)
!1719 = !DILocation(line: 1415, column: 46, scope: !1698)
!1720 = !DILocation(line: 1415, column: 14, scope: !1698)
!1721 = !DILocation(line: 1416, column: 8, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1698, file: !69, line: 1416, column: 8)
!1723 = !DILocation(line: 1416, column: 17, scope: !1722)
!1724 = !DILocation(line: 1416, column: 8, scope: !1698)
!1725 = !DILocation(line: 1418, column: 13, scope: !1726)
!1726 = distinct !DILexicalBlock(scope: !1722, file: !69, line: 1417, column: 5)
!1727 = !DILocation(line: 1418, column: 6, scope: !1726)
!1728 = !DILocation(line: 1422, column: 6, scope: !1729)
!1729 = distinct !DILexicalBlock(scope: !1722, file: !69, line: 1421, column: 5)
!1730 = !DILocation(line: 1428, column: 20, scope: !1731)
!1731 = distinct !DILexicalBlock(scope: !1686, file: !69, line: 1427, column: 3)
!1732 = !DILocation(line: 1428, column: 19, scope: !1731)
!1733 = !DILocation(line: 1428, column: 29, scope: !1731)
!1734 = !DILocation(line: 1428, column: 17, scope: !1731)
!1735 = !DILocation(line: 1429, column: 16, scope: !1731)
!1736 = !DILocation(line: 1429, column: 33, scope: !1731)
!1737 = !DILocation(line: 1429, column: 46, scope: !1731)
!1738 = !DILocation(line: 1429, column: 45, scope: !1731)
!1739 = !DILocation(line: 1429, column: 61, scope: !1731)
!1740 = !DILocation(line: 1429, column: 59, scope: !1731)
!1741 = !DILocation(line: 1429, column: 29, scope: !1731)
!1742 = !DILocation(line: 1429, column: 75, scope: !1731)
!1743 = !DILocation(line: 1429, column: 13, scope: !1731)
!1744 = !DILocation(line: 1430, column: 16, scope: !1731)
!1745 = !DILocation(line: 1430, column: 29, scope: !1731)
!1746 = !DILocation(line: 1430, column: 28, scope: !1731)
!1747 = !DILocation(line: 1430, column: 45, scope: !1731)
!1748 = !DILocation(line: 1430, column: 54, scope: !1731)
!1749 = !DILocation(line: 1430, column: 53, scope: !1731)
!1750 = !DILocation(line: 1430, column: 42, scope: !1731)
!1751 = !DILocation(line: 1430, column: 13, scope: !1731)
!1752 = !DILocation(line: 1431, column: 13, scope: !1731)
!1753 = !DILocation(line: 1431, column: 12, scope: !1731)
!1754 = !DILocation(line: 1431, column: 22, scope: !1731)
!1755 = !DILocation(line: 1431, column: 4, scope: !1731)
!1756 = !DILocation(line: 1436, column: 6, scope: !1757)
!1757 = distinct !DILexicalBlock(scope: !1758, file: !69, line: 1436, column: 6)
!1758 = distinct !DILexicalBlock(scope: !1682, file: !69, line: 1435, column: 2)
!1759 = !DILocation(line: 1436, column: 18, scope: !1757)
!1760 = !DILocation(line: 1436, column: 6, scope: !1758)
!1761 = !DILocation(line: 1438, column: 7, scope: !1762)
!1762 = distinct !DILexicalBlock(scope: !1763, file: !69, line: 1438, column: 7)
!1763 = distinct !DILexicalBlock(scope: !1757, file: !69, line: 1437, column: 3)
!1764 = !DILocation(line: 1438, column: 19, scope: !1762)
!1765 = !DILocation(line: 1438, column: 7, scope: !1763)
!1766 = !DILocation(line: 1440, column: 5, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1762, file: !69, line: 1439, column: 4)
!1768 = !DILocation(line: 1444, column: 23, scope: !1769)
!1769 = distinct !DILexicalBlock(scope: !1762, file: !69, line: 1443, column: 4)
!1770 = !DILocation(line: 1444, column: 22, scope: !1769)
!1771 = !DILocation(line: 1444, column: 35, scope: !1769)
!1772 = !DILocation(line: 1444, column: 20, scope: !1769)
!1773 = !DILocation(line: 1445, column: 17, scope: !1769)
!1774 = !DILocation(line: 1445, column: 31, scope: !1769)
!1775 = !DILocation(line: 1445, column: 41, scope: !1769)
!1776 = !DILocation(line: 1445, column: 40, scope: !1769)
!1777 = !DILocation(line: 1445, column: 59, scope: !1769)
!1778 = !DILocation(line: 1445, column: 57, scope: !1769)
!1779 = !DILocation(line: 1445, column: 27, scope: !1769)
!1780 = !DILocation(line: 1445, column: 76, scope: !1769)
!1781 = !DILocation(line: 1445, column: 14, scope: !1769)
!1782 = !DILocation(line: 1446, column: 17, scope: !1769)
!1783 = !DILocation(line: 1446, column: 27, scope: !1769)
!1784 = !DILocation(line: 1446, column: 26, scope: !1769)
!1785 = !DILocation(line: 1446, column: 46, scope: !1769)
!1786 = !DILocation(line: 1446, column: 55, scope: !1769)
!1787 = !DILocation(line: 1446, column: 54, scope: !1769)
!1788 = !DILocation(line: 1446, column: 43, scope: !1769)
!1789 = !DILocation(line: 1446, column: 14, scope: !1769)
!1790 = !DILocation(line: 1447, column: 14, scope: !1769)
!1791 = !DILocation(line: 1447, column: 13, scope: !1769)
!1792 = !DILocation(line: 1447, column: 23, scope: !1769)
!1793 = !DILocation(line: 1447, column: 5, scope: !1769)
!1794 = !DILocation(line: 1452, column: 16, scope: !1795)
!1795 = distinct !DILexicalBlock(scope: !1757, file: !69, line: 1451, column: 3)
!1796 = !DILocation(line: 1452, column: 30, scope: !1795)
!1797 = !DILocation(line: 1452, column: 40, scope: !1795)
!1798 = !DILocation(line: 1452, column: 39, scope: !1795)
!1799 = !DILocation(line: 1452, column: 55, scope: !1795)
!1800 = !DILocation(line: 1452, column: 53, scope: !1795)
!1801 = !DILocation(line: 1452, column: 26, scope: !1795)
!1802 = !DILocation(line: 1452, column: 69, scope: !1795)
!1803 = !DILocation(line: 1452, column: 13, scope: !1795)
!1804 = !DILocation(line: 1453, column: 16, scope: !1795)
!1805 = !DILocation(line: 1453, column: 26, scope: !1795)
!1806 = !DILocation(line: 1453, column: 25, scope: !1795)
!1807 = !DILocation(line: 1453, column: 42, scope: !1795)
!1808 = !DILocation(line: 1453, column: 51, scope: !1795)
!1809 = !DILocation(line: 1453, column: 50, scope: !1795)
!1810 = !DILocation(line: 1453, column: 39, scope: !1795)
!1811 = !DILocation(line: 1453, column: 13, scope: !1795)
!1812 = !DILocation(line: 1454, column: 11, scope: !1795)
!1813 = !DILocation(line: 1454, column: 4, scope: !1795)
!1814 = !DILocation(line: 1457, column: 1, scope: !1660)
!1815 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1475, type: !1816, scopeLine: 1476, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1816 = !DISubroutineType(types: !1817)
!1817 = !{!6, !25, !428}
!1818 = !DILocalVariable(name: "numerator", arg: 1, scope: !1815, file: !69, line: 1475, type: !25)
!1819 = !DILocation(line: 1475, column: 25, scope: !1815)
!1820 = !DILocalVariable(name: "denominator", arg: 2, scope: !1815, file: !69, line: 1475, type: !428)
!1821 = !DILocation(line: 1475, column: 40, scope: !1815)
!1822 = !DILocalVariable(name: "numerator_prime", scope: !1815, file: !69, line: 1478, type: !428)
!1823 = !DILocation(line: 1478, column: 6, scope: !1815)
!1824 = !DILocalVariable(name: "u32Temp1", scope: !1815, file: !69, line: 1478, type: !428)
!1825 = !DILocation(line: 1478, column: 27, scope: !1815)
!1826 = !DILocalVariable(name: "u32Temp2", scope: !1815, file: !69, line: 1478, type: !428)
!1827 = !DILocation(line: 1478, column: 41, scope: !1815)
!1828 = !DILocalVariable(name: "u32Temp3", scope: !1815, file: !69, line: 1478, type: !428)
!1829 = !DILocation(line: 1478, column: 55, scope: !1815)
!1830 = !DILocalVariable(name: "s32Temp1", scope: !1815, file: !69, line: 1479, type: !25)
!1831 = !DILocation(line: 1479, column: 6, scope: !1815)
!1832 = !DILocalVariable(name: "s32Temp2", scope: !1815, file: !69, line: 1479, type: !25)
!1833 = !DILocation(line: 1479, column: 20, scope: !1815)
!1834 = !DILocalVariable(name: "s32Temp3", scope: !1815, file: !69, line: 1479, type: !25)
!1835 = !DILocation(line: 1479, column: 34, scope: !1815)
!1836 = !DILocation(line: 1480, column: 5, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1815, file: !69, line: 1480, column: 5)
!1838 = !DILocation(line: 1480, column: 17, scope: !1837)
!1839 = !DILocation(line: 1480, column: 5, scope: !1815)
!1840 = !DILocation(line: 1482, column: 6, scope: !1841)
!1841 = distinct !DILexicalBlock(scope: !1842, file: !69, line: 1482, column: 6)
!1842 = distinct !DILexicalBlock(scope: !1837, file: !69, line: 1481, column: 2)
!1843 = !DILocation(line: 1482, column: 15, scope: !1841)
!1844 = !DILocation(line: 1482, column: 6, scope: !1842)
!1845 = !DILocation(line: 1484, column: 4, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1841, file: !69, line: 1483, column: 3)
!1847 = !DILocation(line: 1488, column: 4, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1841, file: !69, line: 1487, column: 3)
!1849 = !DILocation(line: 1493, column: 6, scope: !1850)
!1850 = distinct !DILexicalBlock(scope: !1851, file: !69, line: 1493, column: 6)
!1851 = distinct !DILexicalBlock(scope: !1837, file: !69, line: 1492, column: 2)
!1852 = !DILocation(line: 1493, column: 16, scope: !1850)
!1853 = !DILocation(line: 1493, column: 6, scope: !1851)
!1854 = !DILocation(line: 1495, column: 23, scope: !1855)
!1855 = distinct !DILexicalBlock(scope: !1850, file: !69, line: 1494, column: 3)
!1856 = !DILocation(line: 1495, column: 22, scope: !1855)
!1857 = !DILocation(line: 1495, column: 20, scope: !1855)
!1858 = !DILocation(line: 1496, column: 16, scope: !1855)
!1859 = !DILocation(line: 1496, column: 32, scope: !1855)
!1860 = !DILocation(line: 1496, column: 31, scope: !1855)
!1861 = !DILocation(line: 1496, column: 13, scope: !1855)
!1862 = !DILocation(line: 1497, column: 15, scope: !1855)
!1863 = !DILocation(line: 1497, column: 34, scope: !1855)
!1864 = !DILocation(line: 1497, column: 45, scope: !1855)
!1865 = !DILocation(line: 1497, column: 43, scope: !1855)
!1866 = !DILocation(line: 1497, column: 31, scope: !1855)
!1867 = !DILocation(line: 1497, column: 13, scope: !1855)
!1868 = !DILocation(line: 1499, column: 8, scope: !1869)
!1869 = distinct !DILexicalBlock(scope: !1855, file: !69, line: 1499, column: 7)
!1870 = !DILocation(line: 1499, column: 20, scope: !1869)
!1871 = !DILocation(line: 1499, column: 27, scope: !1869)
!1872 = !DILocation(line: 1499, column: 7, scope: !1855)
!1873 = !DILocation(line: 1501, column: 19, scope: !1874)
!1874 = distinct !DILexicalBlock(scope: !1869, file: !69, line: 1500, column: 4)
!1875 = !DILocation(line: 1501, column: 31, scope: !1874)
!1876 = !DILocation(line: 1501, column: 17, scope: !1874)
!1877 = !DILocation(line: 1502, column: 4, scope: !1874)
!1878 = !DILocation(line: 1505, column: 20, scope: !1879)
!1879 = distinct !DILexicalBlock(scope: !1869, file: !69, line: 1504, column: 4)
!1880 = !DILocation(line: 1505, column: 32, scope: !1879)
!1881 = !DILocation(line: 1505, column: 38, scope: !1879)
!1882 = !DILocation(line: 1505, column: 17, scope: !1879)
!1883 = !DILocation(line: 1508, column: 7, scope: !1884)
!1884 = distinct !DILexicalBlock(scope: !1855, file: !69, line: 1508, column: 7)
!1885 = !DILocation(line: 1508, column: 18, scope: !1884)
!1886 = !DILocation(line: 1508, column: 16, scope: !1884)
!1887 = !DILocation(line: 1508, column: 7, scope: !1855)
!1888 = !DILocation(line: 1510, column: 18, scope: !1889)
!1889 = distinct !DILexicalBlock(scope: !1884, file: !69, line: 1509, column: 4)
!1890 = !DILocation(line: 1510, column: 16, scope: !1889)
!1891 = !DILocation(line: 1510, column: 28, scope: !1889)
!1892 = !DILocation(line: 1510, column: 14, scope: !1889)
!1893 = !DILocation(line: 1511, column: 4, scope: !1889)
!1894 = !DILocation(line: 1514, column: 18, scope: !1895)
!1895 = distinct !DILexicalBlock(scope: !1884, file: !69, line: 1513, column: 4)
!1896 = !DILocation(line: 1514, column: 26, scope: !1895)
!1897 = !DILocation(line: 1514, column: 16, scope: !1895)
!1898 = !DILocation(line: 1514, column: 30, scope: !1895)
!1899 = !DILocation(line: 1514, column: 14, scope: !1895)
!1900 = !DILocation(line: 1516, column: 8, scope: !1901)
!1901 = distinct !DILexicalBlock(scope: !1855, file: !69, line: 1516, column: 7)
!1902 = !DILocation(line: 1516, column: 18, scope: !1901)
!1903 = !DILocation(line: 1516, column: 7, scope: !1855)
!1904 = !DILocation(line: 1518, column: 18, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1901, file: !69, line: 1517, column: 4)
!1906 = !DILocation(line: 1518, column: 12, scope: !1905)
!1907 = !DILocation(line: 1518, column: 5, scope: !1905)
!1908 = !DILocation(line: 1522, column: 5, scope: !1909)
!1909 = distinct !DILexicalBlock(scope: !1901, file: !69, line: 1521, column: 4)
!1910 = !DILocation(line: 1527, column: 16, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1850, file: !69, line: 1526, column: 3)
!1912 = !DILocation(line: 1527, column: 26, scope: !1911)
!1913 = !DILocation(line: 1527, column: 25, scope: !1911)
!1914 = !DILocation(line: 1527, column: 41, scope: !1911)
!1915 = !DILocation(line: 1527, column: 39, scope: !1911)
!1916 = !DILocation(line: 1527, column: 13, scope: !1911)
!1917 = !DILocation(line: 1528, column: 16, scope: !1911)
!1918 = !DILocation(line: 1528, column: 30, scope: !1911)
!1919 = !DILocation(line: 1528, column: 40, scope: !1911)
!1920 = !DILocation(line: 1528, column: 39, scope: !1911)
!1921 = !DILocation(line: 1528, column: 55, scope: !1911)
!1922 = !DILocation(line: 1528, column: 53, scope: !1911)
!1923 = !DILocation(line: 1528, column: 26, scope: !1911)
!1924 = !DILocation(line: 1528, column: 68, scope: !1911)
!1925 = !DILocation(line: 1528, column: 13, scope: !1911)
!1926 = !DILocation(line: 1529, column: 16, scope: !1911)
!1927 = !DILocation(line: 1529, column: 25, scope: !1911)
!1928 = !DILocation(line: 1529, column: 24, scope: !1911)
!1929 = !DILocation(line: 1529, column: 41, scope: !1911)
!1930 = !DILocation(line: 1529, column: 51, scope: !1911)
!1931 = !DILocation(line: 1529, column: 50, scope: !1911)
!1932 = !DILocation(line: 1529, column: 38, scope: !1911)
!1933 = !DILocation(line: 1529, column: 13, scope: !1911)
!1934 = !DILocation(line: 1530, column: 7, scope: !1935)
!1935 = distinct !DILexicalBlock(scope: !1911, file: !69, line: 1530, column: 7)
!1936 = !DILocation(line: 1530, column: 16, scope: !1935)
!1937 = !DILocation(line: 1530, column: 7, scope: !1911)
!1938 = !DILocation(line: 1532, column: 17, scope: !1939)
!1939 = distinct !DILexicalBlock(scope: !1935, file: !69, line: 1531, column: 4)
!1940 = !DILocation(line: 1532, column: 12, scope: !1939)
!1941 = !DILocation(line: 1532, column: 5, scope: !1939)
!1942 = !DILocation(line: 1536, column: 5, scope: !1943)
!1943 = distinct !DILexicalBlock(scope: !1935, file: !69, line: 1535, column: 4)
!1944 = !DILocation(line: 1540, column: 1, scope: !1815)
!1945 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1946, file: !1946, line: 12, type: !1947, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !1950)
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
!1958 = distinct !DISubprogram(name: "klee_overshift_check", scope: !1959, file: !1959, line: 20, type: !1960, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !1963)
!1959 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!1960 = !DISubroutineType(types: !1961)
!1961 = !{null, !1962, !1962}
!1962 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!1963 = !{!1964, !1965}
!1964 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !1958, file: !1959, line: 20, type: !1962)
!1965 = !DILocalVariable(name: "shift", arg: 2, scope: !1958, file: !1959, line: 20, type: !1962)
!1966 = !DILocation(line: 0, scope: !1958)
!1967 = !DILocation(line: 21, column: 13, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1958, file: !1959, line: 21, column: 7)
!1969 = !DILocation(line: 21, column: 7, scope: !1958)
!1970 = !DILocation(line: 27, column: 5, scope: !1971)
!1971 = distinct !DILexicalBlock(scope: !1968, file: !1959, line: 21, column: 26)
!1972 = !DILocation(line: 29, column: 1, scope: !1958)
